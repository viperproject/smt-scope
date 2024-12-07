(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0008.vpr
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
; ---------- deAlias ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const k@2@01 $Perm)
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(declare-const k@5@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] k >= none
(assert (>= k@5@01 $Perm.No))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(push) ; 2
(assert (not (or (= k@5@01 $Perm.No) (< $Perm.No k@5@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No k@5@01))
(assert (<= k@5@01 $Perm.Write))
(assert (=> (< $Perm.No k@5@01) (not (= x@3@01 $Ref.null))))
(push) ; 2
(assert (not (or (= k@5@01 $Perm.No) (< $Perm.No k@5@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (< $Perm.No k@5@01) (not (= y@4@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
; [eval] x == y
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@3@01 y@4@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@3@01 == y@4@01 | live]
; [else-branch: 0 | x@3@01 != y@4@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@3@01 == y@4@01]
(assert (= x@3@01 y@4@01))
; [eval] 2 * k
(push) ; 4
(assert (not (or (= (* (to_real 2) k@5@01) $Perm.No) (< $Perm.No (* (to_real 2) k@5@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No (* (to_real 2) k@5@01)))
(assert (<= (* (to_real 2) k@5@01) $Perm.Write))
(assert (=> (< $Perm.No (* (to_real 2) k@5@01)) (not (= x@3@01 $Ref.null))))
; [eval] x != y
; [then-branch: 1 | x@3@01 != y@4@01 | dead]
; [else-branch: 1 | x@3@01 == y@4@01 | live]
(push) ; 4
; [else-branch: 1 | x@3@01 == y@4@01]
(assert (= ($Snap.second $t@7@01) $Snap.unit))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | x@3@01 != y@4@01]
(assert (not (= x@3@01 y@4@01)))
(assert (= ($Snap.first $t@7@01) $Snap.unit))
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@3@01 != y@4@01 | live]
; [else-branch: 2 | x@3@01 == y@4@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | x@3@01 != y@4@01]
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(push) ; 5
(assert (not (or (= k@5@01 $Perm.No) (< $Perm.No k@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (or (= k@5@01 $Perm.No) (< $Perm.No k@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [eval] x == y
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@3@01 y@4@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | x@3@01 == y@4@01 | live]
; [else-branch: 3 | x@3@01 != y@4@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | x@3@01 == y@4@01]
(assert (= x@3@01 y@4@01))
; [eval] 2 * k
(push) ; 4
(assert (not (or (= (* (to_real 2) k@5@01) $Perm.No) (< $Perm.No (* (to_real 2) k@5@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- k@5@01 ($Perm.min k@5@01 (* (to_real 2) k@5@01))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (- (* (to_real 2) k@5@01) ($Perm.min k@5@01 (* (to_real 2) k@5@01)))
    $Perm.No)
  (<
    (- (* (to_real 2) k@5@01) ($Perm.min k@5@01 (* (to_real 2) k@5@01)))
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
(assert (not (= y@4@01 x@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@8@01 Int)
(assert (and
  (=>
    (< $Perm.No k@5@01)
    (= $t@8@01 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@6@01)))))
  (=>
    (< $Perm.No k@5@01)
    (= $t@8@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01)))))))
(assert (<= $Perm.No (+ k@5@01 k@5@01)))
(assert (<= (+ k@5@01 k@5@01) $Perm.Write))
(assert (=> (< $Perm.No (+ k@5@01 k@5@01)) (not (= y@4@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@4@01 x@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (- (+ k@5@01 k@5@01) ($Perm.min (+ k@5@01 k@5@01) (* (to_real 2) k@5@01)))
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
      (* (to_real 2) k@5@01)
      ($Perm.min (+ k@5@01 k@5@01) (* (to_real 2) k@5@01)))
    $Perm.No)
  (<
    (-
      (* (to_real 2) k@5@01)
      ($Perm.min (+ k@5@01 k@5@01) (* (to_real 2) k@5@01)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* (to_real 2) k@5@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x != y
; [then-branch: 4 | x@3@01 != y@4@01 | dead]
; [else-branch: 4 | x@3@01 == y@4@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | x@3@01 == y@4@01]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 3 | x@3@01 != y@4@01]
(assert (not (= x@3@01 y@4@01)))
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | x@3@01 != y@4@01 | live]
; [else-branch: 5 | x@3@01 == y@4@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | x@3@01 != y@4@01]
(push) ; 5
(assert (not (or (= k@5@01 $Perm.No) (< $Perm.No k@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No k@5@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (or (= k@5@01 $Perm.No) (< $Perm.No k@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No k@5@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- deAlias2 ----------
(declare-const x@9@01 $Ref)
(declare-const y@10@01 $Ref)
(declare-const k@11@01 $Perm)
(declare-const x@12@01 $Ref)
(declare-const y@13@01 $Ref)
(declare-const k@14@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 ($Snap.combine ($Snap.first $t@15@01) ($Snap.second $t@15@01))))
(assert (= ($Snap.first $t@15@01) $Snap.unit))
; [eval] k >= none
(assert (>= k@14@01 $Perm.No))
(assert (=
  ($Snap.second $t@15@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@15@01))
    ($Snap.second ($Snap.second $t@15@01)))))
(push) ; 2
(assert (not (or (= k@14@01 $Perm.No) (< $Perm.No k@14@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No k@14@01))
(assert (<= k@14@01 $Perm.Write))
(assert (=> (< $Perm.No k@14@01) (not (= x@12@01 $Ref.null))))
(push) ; 2
(assert (not (or (= k@14@01 $Perm.No) (< $Perm.No k@14@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@12@01 y@13@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (< $Perm.No k@14@01) (not (= y@13@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] x == y
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@12@01 y@13@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@12@01 y@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | x@12@01 == y@13@01 | live]
; [else-branch: 6 | x@12@01 != y@13@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | x@12@01 == y@13@01]
(assert (= x@12@01 y@13@01))
; [eval] 2 * k
(push) ; 4
(assert (not (or (= (* (to_real 2) k@14@01) $Perm.No) (< $Perm.No (* (to_real 2) k@14@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@16@01 Int)
(assert (<= $Perm.No (* (to_real 2) k@14@01)))
(assert (<= (* (to_real 2) k@14@01) $Perm.Write))
(assert (=> (< $Perm.No (* (to_real 2) k@14@01)) (not (= x@12@01 $Ref.null))))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | x@12@01 != y@13@01]
(assert (not (= x@12@01 y@13@01)))
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(push) ; 4
(assert (not (or (= k@14@01 $Perm.No) (< $Perm.No k@14@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (or (= k@14@01 $Perm.No) (< $Perm.No k@14@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@12@01 y@13@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [eval] x == y
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@12@01 y@13@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@12@01 y@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | x@12@01 == y@13@01 | live]
; [else-branch: 7 | x@12@01 != y@13@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | x@12@01 == y@13@01]
(assert (= x@12@01 y@13@01))
; [eval] 2 * k
(push) ; 4
(assert (not (or (= (* (to_real 2) k@14@01) $Perm.No) (< $Perm.No (* (to_real 2) k@14@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (- k@14@01 ($Perm.min k@14@01 (* (to_real 2) k@14@01))) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (- (* (to_real 2) k@14@01) ($Perm.min k@14@01 (* (to_real 2) k@14@01)))
    $Perm.No)
  (<
    (- (* (to_real 2) k@14@01) ($Perm.min k@14@01 (* (to_real 2) k@14@01)))
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
(assert (not (= y@13@01 x@12@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@18@01 Int)
(assert (and
  (=>
    (< $Perm.No k@14@01)
    (=
      $t@18@01
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@15@01)))))
  (=>
    (< $Perm.No k@14@01)
    (= $t@18@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@15@01)))))))
(assert (<= $Perm.No (+ k@14@01 k@14@01)))
(assert (<= (+ k@14@01 k@14@01) $Perm.Write))
(assert (=> (< $Perm.No (+ k@14@01 k@14@01)) (not (= y@13@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@13@01 x@12@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  (- (+ k@14@01 k@14@01) ($Perm.min (+ k@14@01 k@14@01) (* (to_real 2) k@14@01)))
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
      (* (to_real 2) k@14@01)
      ($Perm.min (+ k@14@01 k@14@01) (* (to_real 2) k@14@01)))
    $Perm.No)
  (<
    (-
      (* (to_real 2) k@14@01)
      ($Perm.min (+ k@14@01 k@14@01) (* (to_real 2) k@14@01)))
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (* (to_real 2) k@14@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 7 | x@12@01 != y@13@01]
(assert (not (= x@12@01 y@13@01)))
(push) ; 4
(assert (not (or (= k@14@01 $Perm.No) (< $Perm.No k@14@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No k@14@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (or (= k@14@01 $Perm.No) (< $Perm.No k@14@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No k@14@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
