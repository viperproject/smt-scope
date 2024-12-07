(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:13
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/methods/basic/decCondition.vpr
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
(declare-sort IntWellFoundedOrder 0)
(declare-sort WellFoundedOrder<Int> 0)
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
(declare-fun $SortWrappers.IntWellFoundedOrderTo$Snap (IntWellFoundedOrder) $Snap)
(declare-fun $SortWrappers.$SnapToIntWellFoundedOrder ($Snap) IntWellFoundedOrder)
(assert (forall ((x IntWellFoundedOrder)) (!
    (= x ($SortWrappers.$SnapToIntWellFoundedOrder($SortWrappers.IntWellFoundedOrderTo$Snap x)))
    :pattern (($SortWrappers.IntWellFoundedOrderTo$Snap x))
    :qid |$Snap.$SnapToIntWellFoundedOrderTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntWellFoundedOrderTo$Snap($SortWrappers.$SnapToIntWellFoundedOrder x)))
    :pattern (($SortWrappers.$SnapToIntWellFoundedOrder x))
    :qid |$Snap.IntWellFoundedOrderTo$SnapToIntWellFoundedOrder|
    )))
(declare-fun $SortWrappers.WellFoundedOrder<Int>To$Snap (WellFoundedOrder<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToWellFoundedOrder<Int> ($Snap) WellFoundedOrder<Int>)
(assert (forall ((x WellFoundedOrder<Int>)) (!
    (= x ($SortWrappers.$SnapToWellFoundedOrder<Int>($SortWrappers.WellFoundedOrder<Int>To$Snap x)))
    :pattern (($SortWrappers.WellFoundedOrder<Int>To$Snap x))
    :qid |$Snap.$SnapToWellFoundedOrder<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.WellFoundedOrder<Int>To$Snap($SortWrappers.$SnapToWellFoundedOrder<Int> x)))
    :pattern (($SortWrappers.$SnapToWellFoundedOrder<Int> x))
    :qid |$Snap.WellFoundedOrder<Int>To$SnapToWellFoundedOrder<Int>|
    )))
; ////////// Symbols
(declare-fun decreasing<Bool> (Int Int) Bool)
(declare-fun bounded<Bool> (Int) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((int1 Int) (int2 Int)) (!
  (=> (< int1 int2) (decreasing<Bool> int1 int2))
  :pattern ((decreasing<Bool> int1 int2))
  :qid |prog.integer_ax_dec|)))
(assert (forall ((int1 Int)) (!
  (=> (>= int1 0) (bounded<Bool> int1))
  :pattern ((bounded<Bool> int1))
  :qid |prog.integer_ax_bound|)))
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
; ---------- m ----------
(declare-const x@0@01 Int)
(declare-const x@1@01 Int)
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
; [eval] x >= 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= x@1@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@1@01 >= 0 | live]
; [else-branch: 0 | !(x@1@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] x != 0
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@1@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@1@01 != 0 | live]
; [else-branch: 1 | x@1@01 == 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | x@1@01 != 0]
(assert (not (= x@1@01 0)))
; [exec]
; assert !old(x >= 0) || x - 1 >= 0
; [eval] !old(x >= 0) || x - 1 >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 5
; [then-branch: 2 | !(x@1@01 >= 0) | live]
; [else-branch: 2 | x@1@01 >= 0 | live]
(push) ; 6
; [then-branch: 2 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | x@1@01 >= 0]
; [eval] x - 1 >= 0
; [eval] x - 1
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (>= x@1@01 0) (not (>= x@1@01 0))))
(push) ; 5
(assert (not (or (not (>= x@1@01 0)) (>= (- x@1@01 1) 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= x@1@01 0)) (>= (- x@1@01 1) 0)))
; [exec]
; assert old(x >= 0) ==>
;   (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool) ||
;   x - 1 == old(x) && false
; [eval] old(x >= 0) ==> (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool) || x - 1 == old(x) && false
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (>= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | x@1@01 >= 0 | live]
; [else-branch: 3 | !(x@1@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | x@1@01 >= 0]
; [eval] (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool) || x - 1 == old(x) && false
; [eval] (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 7
; [then-branch: 4 | !(decreasing[Bool](x@1@01 - 1, x@1@01)) | live]
; [else-branch: 4 | decreasing[Bool](x@1@01 - 1, x@1@01) | live]
(push) ; 8
; [then-branch: 4 | !(decreasing[Bool](x@1@01 - 1, x@1@01))]
(assert (not (decreasing<Bool> (- x@1@01 1) x@1@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 4 | decreasing[Bool](x@1@01 - 1, x@1@01)]
(assert (decreasing<Bool> (- x@1@01 1) x@1@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- x@1@01 1) x@1@01)
  (not (decreasing<Bool> (- x@1@01 1) x@1@01))))
(push) ; 7
; [then-branch: 5 | decreasing[Bool](x@1@01 - 1, x@1@01) && bounded[Bool](x@1@01) | live]
; [else-branch: 5 | !(decreasing[Bool](x@1@01 - 1, x@1@01) && bounded[Bool](x@1@01)) | live]
(push) ; 8
; [then-branch: 5 | decreasing[Bool](x@1@01 - 1, x@1@01) && bounded[Bool](x@1@01)]
(assert (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | !(decreasing[Bool](x@1@01 - 1, x@1@01) && bounded[Bool](x@1@01))]
(assert (not (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01))))
; [eval] x - 1 == old(x) && false
; [eval] x - 1 == old(x)
; [eval] x - 1
; [eval] old(x)
(push) ; 9
; [then-branch: 6 | x@1@01 - 1 != x@1@01 | live]
; [else-branch: 6 | x@1@01 - 1 == x@1@01 | live]
(push) ; 10
; [then-branch: 6 | x@1@01 - 1 != x@1@01]
(assert (not (= (- x@1@01 1) x@1@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 6 | x@1@01 - 1 == x@1@01]
(assert (= (- x@1@01 1) x@1@01))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (= (- x@1@01 1) x@1@01) (not (= (- x@1@01 1) x@1@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))
  (and
    (not (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))
    (or (= (- x@1@01 1) x@1@01) (not (= (- x@1@01 1) x@1@01))))))
(assert (or
  (not (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))
  (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= x@1@01 0)
  (and
    (or
      (decreasing<Bool> (- x@1@01 1) x@1@01)
      (not (decreasing<Bool> (- x@1@01 1) x@1@01)))
    (=>
      (not (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))
      (and
        (not (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))
        (or (= (- x@1@01 1) x@1@01) (not (= (- x@1@01 1) x@1@01)))))
    (or
      (not (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))
      (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01))))))
(push) ; 5
(assert (not (=>
  (>= x@1@01 0)
  (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (>= x@1@01 0)
  (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01))))
; [exec]
; m(x - 1)
; [eval] x - 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 1 | x@1@01 == 0]
(assert (= x@1@01 0))
(pop) ; 4
; [eval] !(x != 0)
; [eval] x != 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@1@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | x@1@01 == 0 | live]
; [else-branch: 7 | x@1@01 != 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | x@1@01 == 0]
(assert (= x@1@01 0))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | x@1@01 != 0]
(assert (not (= x@1@01 0)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 3
; [eval] !(x >= 0)
; [eval] x >= 0
(push) ; 3
(set-option :timeout 10)
(assert (not (>= x@1@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | !(x@1@01 >= 0) | live]
; [else-branch: 8 | x@1@01 >= 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
; [exec]
; var y: Int
(declare-const y@2@01 Int)
; [exec]
; assert !old(x >= 0) || y >= 0
; [eval] !old(x >= 0) || y >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 9 | !(x@1@01 >= 0) | live]
; [else-branch: 9 | x@1@01 >= 0 | live]
(push) ; 5
; [then-branch: 9 | !(x@1@01 >= 0)]
(pop) ; 5
(push) ; 5
; [else-branch: 9 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] y >= 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= x@1@01 0) (not (>= x@1@01 0))))
(push) ; 4
(assert (not (or (not (>= x@1@01 0)) (>= y@2@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= x@1@01 0)) (>= y@2@01 0)))
; [exec]
; assert old(x >= 0) ==>
;   (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) ||
;   y == old(x) && false
; [eval] old(x >= 0) ==> (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) || y == old(x) && false
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 10 | x@1@01 >= 0 | dead]
; [else-branch: 10 | !(x@1@01 >= 0) | live]
(push) ; 5
; [else-branch: 10 | !(x@1@01 >= 0)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; m(y)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 8 | x@1@01 >= 0]
(assert (>= x@1@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- n ----------
(declare-const y@3@01 Int)
(declare-const y@4@01 Int)
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
; assert y >= 0 || y < 0
; [eval] y >= 0 || y < 0
; [eval] y >= 0
(push) ; 3
; [then-branch: 11 | y@4@01 >= 0 | live]
; [else-branch: 11 | !(y@4@01 >= 0) | live]
(push) ; 4
; [then-branch: 11 | y@4@01 >= 0]
(assert (>= y@4@01 0))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(y@4@01 >= 0)]
(assert (not (>= y@4@01 0)))
; [eval] y < 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (>= y@4@01 0)) (>= y@4@01 0)))
(push) ; 3
(assert (not (or (>= y@4@01 0) (< y@4@01 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or (>= y@4@01 0) (< y@4@01 0)))
; [exec]
; m(y)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- m_e ----------
(declare-const x@5@01 Int)
(declare-const x@6@01 Int)
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
; [eval] x >= 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= x@6@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= x@6@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | x@6@01 >= 0 | live]
; [else-branch: 12 | !(x@6@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | x@6@01 >= 0]
(assert (>= x@6@01 0))
; [eval] x != 0
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@6@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@6@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | x@6@01 != 0 | live]
; [else-branch: 13 | x@6@01 == 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | x@6@01 != 0]
(assert (not (= x@6@01 0)))
; [exec]
; assert !old(x >= 0) || x - 2 >= 0
; [eval] !old(x >= 0) || x - 2 >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 5
; [then-branch: 14 | !(x@6@01 >= 0) | live]
; [else-branch: 14 | x@6@01 >= 0 | live]
(push) ; 6
; [then-branch: 14 | !(x@6@01 >= 0)]
(assert (not (>= x@6@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | x@6@01 >= 0]
; [eval] x - 2 >= 0
; [eval] x - 2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (>= x@6@01 0) (not (>= x@6@01 0))))
(push) ; 5
(assert (not (or (not (>= x@6@01 0)) (>= (- x@6@01 2) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(x >= 0) || x - 2 >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | !(x@6@01 >= 0) | live]
; [else-branch: 15 | x@6@01 >= 0 | live]
(push) ; 6
; [then-branch: 15 | !(x@6@01 >= 0)]
(assert (not (>= x@6@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 15 | x@6@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x - 2 >= 0
; [eval] x - 2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(assert (not (or (not (>= x@6@01 0)) (>= (- x@6@01 2) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(x >= 0) || x - 2 >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | !(x@6@01 >= 0) | live]
; [else-branch: 16 | x@6@01 >= 0 | live]
(push) ; 6
; [then-branch: 16 | !(x@6@01 >= 0)]
(assert (not (>= x@6@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 16 | x@6@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x - 2 >= 0
; [eval] x - 2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(assert (not (or (not (>= x@6@01 0)) (>= (- x@6@01 2) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(x >= 0) || x - 2 >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | !(x@6@01 >= 0) | live]
; [else-branch: 17 | x@6@01 >= 0 | live]
(push) ; 6
; [then-branch: 17 | !(x@6@01 >= 0)]
(assert (not (>= x@6@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 17 | x@6@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x - 2 >= 0
; [eval] x - 2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 5
(assert (not (or (not (>= x@6@01 0)) (>= (- x@6@01 2) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- n_e ----------
(declare-const y@7@01 Int)
(declare-const y@8@01 Int)
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
; assert y >= 0
; [eval] y >= 0
(push) ; 3
(assert (not (>= y@8@01 0)))
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
; [eval] y >= 0
(set-option :timeout 0)
(push) ; 3
(assert (not (>= y@8@01 0)))
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
; [eval] y >= 0
(set-option :timeout 0)
(push) ; 3
(assert (not (>= y@8@01 0)))
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
; [eval] y >= 0
(set-option :timeout 0)
(push) ; 3
(assert (not (>= y@8@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
