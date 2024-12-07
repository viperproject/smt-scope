(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:28
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/methods/loops/whileLoop.vpr
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
(declare-sort WellFoundedOrder<Int> 0)
(declare-sort IntWellFoundedOrder 0)
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
; [exec]
; var y: Int
(declare-const y@2@01 Int)
; [exec]
; y := x
(declare-const old_W1_T0@3@01 Int)
(declare-const y@4@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] y <= x
(assert (<= y@4@01 x@1@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] y <= x
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@5@01 $Snap.unit))
(assert (<= y@4@01 x@1@01))
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
; [eval] y >= 0
(pop) ; 5
(push) ; 5
; [eval] !(y >= 0)
; [eval] y >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] y >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= y@4@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= y@4@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | y@4@01 >= 0 | live]
; [else-branch: 0 | !(y@4@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 0 | y@4@01 >= 0]
(assert (>= y@4@01 0))
; [exec]
; var old_W1_T0: Int
(declare-const old_W1_T0@6@01 Int)
; [exec]
; old_W1_T0 := y
; [exec]
; y := y - 1
; [eval] y - 1
(declare-const y@7@01 Int)
(assert (= y@7@01 (- y@4@01 1)))
; [exec]
; assert (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) ||
;   y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) || y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(y, old(x)): Bool)
; [eval] old(x)
(push) ; 6
; [then-branch: 1 | !(decreasing[Bool](y@7@01, x@1@01)) | live]
; [else-branch: 1 | decreasing[Bool](y@7@01, x@1@01) | live]
(push) ; 7
; [then-branch: 1 | !(decreasing[Bool](y@7@01, x@1@01))]
(assert (not (decreasing<Bool> y@7@01 x@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | decreasing[Bool](y@7@01, x@1@01)]
(assert (decreasing<Bool> y@7@01 x@1@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@7@01 x@1@01) (not (decreasing<Bool> y@7@01 x@1@01))))
(push) ; 6
; [then-branch: 2 | decreasing[Bool](y@7@01, x@1@01) && bounded[Bool](x@1@01) | live]
; [else-branch: 2 | !(decreasing[Bool](y@7@01, x@1@01) && bounded[Bool](x@1@01)) | live]
(push) ; 7
; [then-branch: 2 | decreasing[Bool](y@7@01, x@1@01) && bounded[Bool](x@1@01)]
(assert (and (decreasing<Bool> y@7@01 x@1@01) (bounded<Bool> x@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | !(decreasing[Bool](y@7@01, x@1@01) && bounded[Bool](x@1@01))]
(assert (not (and (decreasing<Bool> y@7@01 x@1@01) (bounded<Bool> x@1@01))))
; [eval] y == old(x) && false
; [eval] y == old(x)
; [eval] old(x)
(push) ; 8
; [then-branch: 3 | y@7@01 != x@1@01 | live]
; [else-branch: 3 | y@7@01 == x@1@01 | live]
(push) ; 9
; [then-branch: 3 | y@7@01 != x@1@01]
(assert (not (= y@7@01 x@1@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 3 | y@7@01 == x@1@01]
(assert (= y@7@01 x@1@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (= y@7@01 x@1@01) (not (= y@7@01 x@1@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@7@01 x@1@01) (bounded<Bool> x@1@01)))
  (and
    (not (and (decreasing<Bool> y@7@01 x@1@01) (bounded<Bool> x@1@01)))
    (or (= y@7@01 x@1@01) (not (= y@7@01 x@1@01))))))
(assert (or
  (not (and (decreasing<Bool> y@7@01 x@1@01) (bounded<Bool> x@1@01)))
  (and (decreasing<Bool> y@7@01 x@1@01) (bounded<Bool> x@1@01))))
(push) ; 6
(assert (not (and (decreasing<Bool> y@7@01 x@1@01) (bounded<Bool> x@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (decreasing<Bool> y@7@01 x@1@01) (bounded<Bool> x@1@01)))
; [exec]
; m(y)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert true && y >= 0 ==>
;   (decreasing(y, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) ||
;   y == old_W1_T0 && false
; [eval] true && y >= 0 ==> (decreasing(y, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || y == old_W1_T0 && false
; [eval] true && y >= 0
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | False | live]
; [else-branch: 4 | True | live]
(push) ; 7
; [then-branch: 4 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 4 | True]
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (>= y@7@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (>= y@7@01 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | y@7@01 >= 0 | live]
; [else-branch: 5 | !(y@7@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | y@7@01 >= 0]
(assert (>= y@7@01 0))
; [eval] (decreasing(y, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool) || y == old_W1_T0 && false
; [eval] (decreasing(y, old_W1_T0): Bool) && (bounded(old_W1_T0): Bool)
; [eval] (decreasing(y, old_W1_T0): Bool)
(push) ; 8
; [then-branch: 6 | !(decreasing[Bool](y@7@01, y@4@01)) | live]
; [else-branch: 6 | decreasing[Bool](y@7@01, y@4@01) | live]
(push) ; 9
; [then-branch: 6 | !(decreasing[Bool](y@7@01, y@4@01))]
(assert (not (decreasing<Bool> y@7@01 y@4@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 6 | decreasing[Bool](y@7@01, y@4@01)]
(assert (decreasing<Bool> y@7@01 y@4@01))
; [eval] (bounded(old_W1_T0): Bool)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@7@01 y@4@01) (not (decreasing<Bool> y@7@01 y@4@01))))
(push) ; 8
; [then-branch: 7 | decreasing[Bool](y@7@01, y@4@01) && bounded[Bool](y@4@01) | live]
; [else-branch: 7 | !(decreasing[Bool](y@7@01, y@4@01) && bounded[Bool](y@4@01)) | live]
(push) ; 9
; [then-branch: 7 | decreasing[Bool](y@7@01, y@4@01) && bounded[Bool](y@4@01)]
(assert (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 7 | !(decreasing[Bool](y@7@01, y@4@01) && bounded[Bool](y@4@01))]
(assert (not (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01))))
; [eval] y == old_W1_T0 && false
; [eval] y == old_W1_T0
(push) ; 10
; [then-branch: 8 | y@7@01 != y@4@01 | live]
; [else-branch: 8 | y@7@01 == y@4@01 | live]
(push) ; 11
; [then-branch: 8 | y@7@01 != y@4@01]
(assert (not (= y@7@01 y@4@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 8 | y@7@01 == y@4@01]
(assert (= y@7@01 y@4@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (= y@7@01 y@4@01) (not (= y@7@01 y@4@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01)))
  (and
    (not (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01)))
    (or (= y@7@01 y@4@01) (not (= y@7@01 y@4@01))))))
(assert (or
  (not (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01)))
  (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | !(y@7@01 >= 0)]
(assert (not (>= y@7@01 0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (>= y@7@01 0)
  (and
    (>= y@7@01 0)
    (or (decreasing<Bool> y@7@01 y@4@01) (not (decreasing<Bool> y@7@01 y@4@01)))
    (=>
      (not (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01)))
      (and
        (not (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01)))
        (or (= y@7@01 y@4@01) (not (= y@7@01 y@4@01)))))
    (or
      (not (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01)))
      (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01))))))
; Joined path conditions
(assert (or (not (>= y@7@01 0)) (>= y@7@01 0)))
(push) ; 6
(assert (not (=> (>= y@7@01 0) (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=> (>= y@7@01 0) (and (decreasing<Bool> y@7@01 y@4@01) (bounded<Bool> y@4@01))))
; Loop head block: Re-establish invariant
; [eval] y <= x
(push) ; 6
(assert (not (<= y@7@01 x@1@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= y@7@01 x@1@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(y@4@01 >= 0)]
(assert (not (>= y@4@01 0)))
(pop) ; 5
; [eval] !(y >= 0)
; [eval] y >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (>= y@4@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= y@4@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | !(y@4@01 >= 0) | live]
; [else-branch: 9 | y@4@01 >= 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | !(y@4@01 >= 0)]
(assert (not (>= y@4@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | y@4@01 >= 0]
(assert (>= y@4@01 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m_e ----------
(declare-const x@8@01 Int)
(declare-const x@9@01 Int)
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
; var y: Int
(declare-const y@10@01 Int)
; [exec]
; y := x
(declare-const old_W2_T0@11@01 Int)
(declare-const y@12@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
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
; [eval] y >= 0
(pop) ; 5
(push) ; 5
; [eval] !(y >= 0)
; [eval] y >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] y >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= y@12@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= y@12@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | y@12@01 >= 0 | live]
; [else-branch: 10 | !(y@12@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | y@12@01 >= 0]
(assert (>= y@12@01 0))
; [exec]
; var old_W2_T0: Int
(declare-const old_W2_T0@13@01 Int)
; [exec]
; old_W2_T0 := y
; [exec]
; y := y - 1
; [eval] y - 1
(declare-const y@14@01 Int)
(assert (= y@14@01 (- y@12@01 1)))
; [exec]
; y := y + 1
; [eval] y + 1
(declare-const y@15@01 Int)
(assert (= y@15@01 (+ y@14@01 1)))
; [exec]
; assert true && y >= 0 ==>
;   (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) ||
;   y == old_W2_T0 && false
; [eval] true && y >= 0 ==> (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || y == old_W2_T0 && false
; [eval] true && y >= 0
(push) ; 6
; [then-branch: 11 | False | live]
; [else-branch: 11 | True | live]
(push) ; 7
; [then-branch: 11 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 11 | True]
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (>= y@15@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (>= y@15@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | y@15@01 >= 0 | live]
; [else-branch: 12 | !(y@15@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | y@15@01 >= 0]
(assert (>= y@15@01 0))
; [eval] (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || y == old_W2_T0 && false
; [eval] (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(y, old_W2_T0): Bool)
(push) ; 8
; [then-branch: 13 | !(decreasing[Bool](y@15@01, y@12@01)) | live]
; [else-branch: 13 | decreasing[Bool](y@15@01, y@12@01) | live]
(push) ; 9
; [then-branch: 13 | !(decreasing[Bool](y@15@01, y@12@01))]
(assert (not (decreasing<Bool> y@15@01 y@12@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 13 | decreasing[Bool](y@15@01, y@12@01)]
(assert (decreasing<Bool> y@15@01 y@12@01))
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@15@01 y@12@01) (not (decreasing<Bool> y@15@01 y@12@01))))
(push) ; 8
; [then-branch: 14 | decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01) | live]
; [else-branch: 14 | !(decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01)) | live]
(push) ; 9
; [then-branch: 14 | decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01)]
(assert (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 14 | !(decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01))]
(assert (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))
; [eval] y == old_W2_T0 && false
; [eval] y == old_W2_T0
(push) ; 10
; [then-branch: 15 | y@15@01 != y@12@01 | live]
; [else-branch: 15 | y@15@01 == y@12@01 | live]
(push) ; 11
; [then-branch: 15 | y@15@01 != y@12@01]
(assert (not (= y@15@01 y@12@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 15 | y@15@01 == y@12@01]
(assert (= y@15@01 y@12@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
  (and
    (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
    (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01))))))
(assert (or
  (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
  (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (>= y@15@01 0)
  (and
    (>= y@15@01 0)
    (or
      (decreasing<Bool> y@15@01 y@12@01)
      (not (decreasing<Bool> y@15@01 y@12@01)))
    (=>
      (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
      (and
        (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
        (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01)))))
    (or
      (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
      (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))))
(assert (>= y@15@01 0))
(push) ; 6
(assert (not (=>
  (>= y@15@01 0)
  (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] true && y >= 0 ==> (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || y == old_W2_T0 && false
; [eval] true && y >= 0
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | False | live]
; [else-branch: 16 | True | live]
(push) ; 7
; [then-branch: 16 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 16 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (>= y@15@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | y@15@01 >= 0 | live]
; [else-branch: 17 | !(y@15@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 17 | y@15@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || y == old_W2_T0 && false
; [eval] (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(y, old_W2_T0): Bool)
(set-option :timeout 0)
(push) ; 8
; [then-branch: 18 | !(decreasing[Bool](y@15@01, y@12@01)) | live]
; [else-branch: 18 | decreasing[Bool](y@15@01, y@12@01) | live]
(push) ; 9
; [then-branch: 18 | !(decreasing[Bool](y@15@01, y@12@01))]
(assert (not (decreasing<Bool> y@15@01 y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 18 | decreasing[Bool](y@15@01, y@12@01)]
(assert (decreasing<Bool> y@15@01 y@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@15@01 y@12@01) (not (decreasing<Bool> y@15@01 y@12@01))))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 19 | decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01) | live]
; [else-branch: 19 | !(decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01)) | live]
(push) ; 9
; [then-branch: 19 | decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01)]
(assert (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 19 | !(decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01))]
(assert (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old_W2_T0 && false
; [eval] y == old_W2_T0
(set-option :timeout 0)
(push) ; 10
; [then-branch: 20 | y@15@01 != y@12@01 | live]
; [else-branch: 20 | y@15@01 == y@12@01 | live]
(push) ; 11
; [then-branch: 20 | y@15@01 != y@12@01]
(assert (not (= y@15@01 y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 20 | y@15@01 == y@12@01]
(assert (= y@15@01 y@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
  (and
    (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
    (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01))))))
(assert (or
  (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
  (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (>= y@15@01 0)
  (and
    (or
      (decreasing<Bool> y@15@01 y@12@01)
      (not (decreasing<Bool> y@15@01 y@12@01)))
    (=>
      (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
      (and
        (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
        (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01)))))
    (or
      (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
      (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))))
(set-option :timeout 0)
(push) ; 6
(assert (not (=>
  (>= y@15@01 0)
  (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] true && y >= 0 ==> (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || y == old_W2_T0 && false
; [eval] true && y >= 0
(set-option :timeout 0)
(push) ; 6
; [then-branch: 21 | False | live]
; [else-branch: 21 | True | live]
(push) ; 7
; [then-branch: 21 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 21 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (>= y@15@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | y@15@01 >= 0 | live]
; [else-branch: 22 | !(y@15@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 22 | y@15@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || y == old_W2_T0 && false
; [eval] (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(y, old_W2_T0): Bool)
(set-option :timeout 0)
(push) ; 8
; [then-branch: 23 | !(decreasing[Bool](y@15@01, y@12@01)) | live]
; [else-branch: 23 | decreasing[Bool](y@15@01, y@12@01) | live]
(push) ; 9
; [then-branch: 23 | !(decreasing[Bool](y@15@01, y@12@01))]
(assert (not (decreasing<Bool> y@15@01 y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 23 | decreasing[Bool](y@15@01, y@12@01)]
(assert (decreasing<Bool> y@15@01 y@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@15@01 y@12@01) (not (decreasing<Bool> y@15@01 y@12@01))))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 24 | decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01) | live]
; [else-branch: 24 | !(decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01)) | live]
(push) ; 9
; [then-branch: 24 | decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01)]
(assert (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 24 | !(decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01))]
(assert (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old_W2_T0 && false
; [eval] y == old_W2_T0
(set-option :timeout 0)
(push) ; 10
; [then-branch: 25 | y@15@01 != y@12@01 | live]
; [else-branch: 25 | y@15@01 == y@12@01 | live]
(push) ; 11
; [then-branch: 25 | y@15@01 != y@12@01]
(assert (not (= y@15@01 y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 25 | y@15@01 == y@12@01]
(assert (= y@15@01 y@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
  (and
    (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
    (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01))))))
(assert (or
  (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
  (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (=>
  (>= y@15@01 0)
  (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] true && y >= 0 ==> (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || y == old_W2_T0 && false
; [eval] true && y >= 0
(set-option :timeout 0)
(push) ; 6
; [then-branch: 26 | False | live]
; [else-branch: 26 | True | live]
(push) ; 7
; [then-branch: 26 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 26 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (>= y@15@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | y@15@01 >= 0 | live]
; [else-branch: 27 | !(y@15@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 27 | y@15@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool) || y == old_W2_T0 && false
; [eval] (decreasing(y, old_W2_T0): Bool) && (bounded(old_W2_T0): Bool)
; [eval] (decreasing(y, old_W2_T0): Bool)
(set-option :timeout 0)
(push) ; 8
; [then-branch: 28 | !(decreasing[Bool](y@15@01, y@12@01)) | live]
; [else-branch: 28 | decreasing[Bool](y@15@01, y@12@01) | live]
(push) ; 9
; [then-branch: 28 | !(decreasing[Bool](y@15@01, y@12@01))]
(assert (not (decreasing<Bool> y@15@01 y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 28 | decreasing[Bool](y@15@01, y@12@01)]
(assert (decreasing<Bool> y@15@01 y@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W2_T0): Bool)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@15@01 y@12@01) (not (decreasing<Bool> y@15@01 y@12@01))))
(set-option :timeout 0)
(push) ; 8
; [then-branch: 29 | decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01) | live]
; [else-branch: 29 | !(decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01)) | live]
(push) ; 9
; [then-branch: 29 | decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01)]
(assert (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 29 | !(decreasing[Bool](y@15@01, y@12@01) && bounded[Bool](y@12@01))]
(assert (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old_W2_T0 && false
; [eval] y == old_W2_T0
(set-option :timeout 0)
(push) ; 10
; [then-branch: 30 | y@15@01 != y@12@01 | live]
; [else-branch: 30 | y@15@01 == y@12@01 | live]
(push) ; 11
; [then-branch: 30 | y@15@01 != y@12@01]
(assert (not (= y@15@01 y@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 30 | y@15@01 == y@12@01]
(assert (= y@15@01 y@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
  (and
    (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
    (or (= y@15@01 y@12@01) (not (= y@15@01 y@12@01))))))
(assert (or
  (not (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))
  (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (=>
  (>= y@15@01 0)
  (and (decreasing<Bool> y@15@01 y@12@01) (bounded<Bool> y@12@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m_e2 ----------
(declare-const x@16@01 Int)
(declare-const x@17@01 Int)
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
; var y: Int
(declare-const y@18@01 Int)
; [exec]
; y := x
(declare-const old_W3_T0@19@01 Int)
(declare-const y@20@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
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
; [eval] y >= 0
(pop) ; 5
(push) ; 5
; [eval] !(y >= 0)
; [eval] y >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] y >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= y@20@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= y@20@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | y@20@01 >= 0 | live]
; [else-branch: 31 | !(y@20@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 31 | y@20@01 >= 0]
(assert (>= y@20@01 0))
; [exec]
; var old_W3_T0: Int
(declare-const old_W3_T0@21@01 Int)
; [exec]
; old_W3_T0 := y
; [exec]
; y := y - 1
; [eval] y - 1
(declare-const y@22@01 Int)
(assert (= y@22@01 (- y@20@01 1)))
; [exec]
; assert (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) ||
;   y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) || y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(y, old(x)): Bool)
; [eval] old(x)
(push) ; 6
; [then-branch: 32 | !(decreasing[Bool](y@22@01, x@17@01)) | live]
; [else-branch: 32 | decreasing[Bool](y@22@01, x@17@01) | live]
(push) ; 7
; [then-branch: 32 | !(decreasing[Bool](y@22@01, x@17@01))]
(assert (not (decreasing<Bool> y@22@01 x@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 32 | decreasing[Bool](y@22@01, x@17@01)]
(assert (decreasing<Bool> y@22@01 x@17@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@22@01 x@17@01) (not (decreasing<Bool> y@22@01 x@17@01))))
(push) ; 6
; [then-branch: 33 | decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01) | live]
; [else-branch: 33 | !(decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01)) | live]
(push) ; 7
; [then-branch: 33 | decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01)]
(assert (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 33 | !(decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01))]
(assert (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
; [eval] y == old(x) && false
; [eval] y == old(x)
; [eval] old(x)
(push) ; 8
; [then-branch: 34 | y@22@01 != x@17@01 | live]
; [else-branch: 34 | y@22@01 == x@17@01 | live]
(push) ; 9
; [then-branch: 34 | y@22@01 != x@17@01]
(assert (not (= y@22@01 x@17@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 34 | y@22@01 == x@17@01]
(assert (= y@22@01 x@17@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (= y@22@01 x@17@01) (not (= y@22@01 x@17@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01)))
  (and
    (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01)))
    (or (= y@22@01 x@17@01) (not (= y@22@01 x@17@01))))))
(assert (or
  (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01)))
  (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
(push) ; 6
(assert (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) || y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(y, old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
; [then-branch: 35 | !(decreasing[Bool](y@22@01, x@17@01)) | live]
; [else-branch: 35 | decreasing[Bool](y@22@01, x@17@01) | live]
(push) ; 7
; [then-branch: 35 | !(decreasing[Bool](y@22@01, x@17@01))]
(assert (not (decreasing<Bool> y@22@01 x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 35 | decreasing[Bool](y@22@01, x@17@01)]
(assert (decreasing<Bool> y@22@01 x@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 36 | decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01) | live]
; [else-branch: 36 | !(decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01)) | live]
(push) ; 7
; [then-branch: 36 | decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01)]
(assert (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 36 | !(decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01))]
(assert (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old(x) && false
; [eval] y == old(x)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
; [then-branch: 37 | y@22@01 != x@17@01 | live]
; [else-branch: 37 | y@22@01 == x@17@01 | live]
(push) ; 9
; [then-branch: 37 | y@22@01 != x@17@01]
(assert (not (= y@22@01 x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 37 | y@22@01 == x@17@01]
(assert (= y@22@01 x@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (= y@22@01 x@17@01) (not (= y@22@01 x@17@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) || y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(y, old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
; [then-branch: 38 | !(decreasing[Bool](y@22@01, x@17@01)) | live]
; [else-branch: 38 | decreasing[Bool](y@22@01, x@17@01) | live]
(push) ; 7
; [then-branch: 38 | !(decreasing[Bool](y@22@01, x@17@01))]
(assert (not (decreasing<Bool> y@22@01 x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 38 | decreasing[Bool](y@22@01, x@17@01)]
(assert (decreasing<Bool> y@22@01 x@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 39 | decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01) | live]
; [else-branch: 39 | !(decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01)) | live]
(push) ; 7
; [then-branch: 39 | decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01)]
(assert (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 39 | !(decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01))]
(assert (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old(x) && false
; [eval] y == old(x)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
; [then-branch: 40 | y@22@01 != x@17@01 | live]
; [else-branch: 40 | y@22@01 == x@17@01 | live]
(push) ; 9
; [then-branch: 40 | y@22@01 != x@17@01]
(assert (not (= y@22@01 x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 40 | y@22@01 == x@17@01]
(assert (= y@22@01 x@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (= y@22@01 x@17@01) (not (= y@22@01 x@17@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) || y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(y, old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
; [then-branch: 41 | !(decreasing[Bool](y@22@01, x@17@01)) | live]
; [else-branch: 41 | decreasing[Bool](y@22@01, x@17@01) | live]
(push) ; 7
; [then-branch: 41 | !(decreasing[Bool](y@22@01, x@17@01))]
(assert (not (decreasing<Bool> y@22@01 x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 41 | decreasing[Bool](y@22@01, x@17@01)]
(assert (decreasing<Bool> y@22@01 x@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 42 | decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01) | live]
; [else-branch: 42 | !(decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01)) | live]
(push) ; 7
; [then-branch: 42 | decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01)]
(assert (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 42 | !(decreasing[Bool](y@22@01, x@17@01) && bounded[Bool](x@17@01))]
(assert (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old(x) && false
; [eval] y == old(x)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
; [then-branch: 43 | y@22@01 != x@17@01 | live]
; [else-branch: 43 | y@22@01 == x@17@01 | live]
(push) ; 9
; [then-branch: 43 | y@22@01 != x@17@01]
(assert (not (= y@22@01 x@17@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 43 | y@22@01 == x@17@01]
(assert (= y@22@01 x@17@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (= y@22@01 x@17@01) (not (= y@22@01 x@17@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (and (decreasing<Bool> y@22@01 x@17@01) (bounded<Bool> x@17@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const r@23@01 $Ref)
(declare-const r@24@01 $Ref)
(push) ; 1
(declare-const $t@25@01 Int)
(assert (not (= r@24@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.second $t@26@01) $Snap.unit))
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@26@01)) $t@25@01))
(pop) ; 2
(push) ; 2
(declare-const old_W4_T0@27@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(assert (= ($Snap.second $t@28@01) $Snap.unit))
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) $t@25@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(assert (= ($Snap.second $t@28@01) $Snap.unit))
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) $t@25@01))
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
; [eval] r.v >= 0
(pop) ; 5
(push) ; 5
; [eval] !(r.v >= 0)
; [eval] r.v >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] r.v >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | First:($t@28@01) >= 0 | live]
; [else-branch: 44 | !(First:($t@28@01) >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 44 | First:($t@28@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 0))
; [exec]
; var old_W4_T0: Int
(declare-const old_W4_T0@29@01 Int)
; [exec]
; old_W4_T0 := r.v
(declare-const old_W4_T0@30@01 Int)
(assert (= old_W4_T0@30@01 ($SortWrappers.$SnapToInt ($Snap.first $t@28@01))))
; [exec]
; r.v := r.v - 1
; [eval] r.v - 1
(declare-const v@31@01 Int)
(assert (= v@31@01 (- ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 1)))
; [exec]
; assert (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool) ||
;   r.v == old(r.v) && false
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool) || r.v == old(r.v) && false
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool)
; [eval] (decreasing(r.v, old(r.v)): Bool)
; [eval] old(r.v)
(push) ; 6
; [then-branch: 45 | !(decreasing[Bool](v@31@01, $t@25@01)) | live]
; [else-branch: 45 | decreasing[Bool](v@31@01, $t@25@01) | live]
(push) ; 7
; [then-branch: 45 | !(decreasing[Bool](v@31@01, $t@25@01))]
(assert (not (decreasing<Bool> v@31@01 $t@25@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 45 | decreasing[Bool](v@31@01, $t@25@01)]
(assert (decreasing<Bool> v@31@01 $t@25@01))
; [eval] (bounded(old(r.v)): Bool)
; [eval] old(r.v)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> v@31@01 $t@25@01)
  (not (decreasing<Bool> v@31@01 $t@25@01))))
(push) ; 6
; [then-branch: 46 | decreasing[Bool](v@31@01, $t@25@01) && bounded[Bool]($t@25@01) | live]
; [else-branch: 46 | !(decreasing[Bool](v@31@01, $t@25@01) && bounded[Bool]($t@25@01)) | live]
(push) ; 7
; [then-branch: 46 | decreasing[Bool](v@31@01, $t@25@01) && bounded[Bool]($t@25@01)]
(assert (and (decreasing<Bool> v@31@01 $t@25@01) (bounded<Bool> $t@25@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 46 | !(decreasing[Bool](v@31@01, $t@25@01) && bounded[Bool]($t@25@01))]
(assert (not (and (decreasing<Bool> v@31@01 $t@25@01) (bounded<Bool> $t@25@01))))
; [eval] r.v == old(r.v) && false
; [eval] r.v == old(r.v)
; [eval] old(r.v)
(push) ; 8
; [then-branch: 47 | v@31@01 != $t@25@01 | live]
; [else-branch: 47 | v@31@01 == $t@25@01 | live]
(push) ; 9
; [then-branch: 47 | v@31@01 != $t@25@01]
(assert (not (= v@31@01 $t@25@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 47 | v@31@01 == $t@25@01]
(assert (= v@31@01 $t@25@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (= v@31@01 $t@25@01) (not (= v@31@01 $t@25@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> v@31@01 $t@25@01) (bounded<Bool> $t@25@01)))
  (and
    (not (and (decreasing<Bool> v@31@01 $t@25@01) (bounded<Bool> $t@25@01)))
    (or (= v@31@01 $t@25@01) (not (= v@31@01 $t@25@01))))))
(assert (or
  (not (and (decreasing<Bool> v@31@01 $t@25@01) (bounded<Bool> $t@25@01)))
  (and (decreasing<Bool> v@31@01 $t@25@01) (bounded<Bool> $t@25@01))))
(push) ; 6
(assert (not (and (decreasing<Bool> v@31@01 $t@25@01) (bounded<Bool> $t@25@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and (decreasing<Bool> v@31@01 $t@25@01) (bounded<Bool> $t@25@01)))
; [exec]
; m2(r)
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (= ($Snap.second $t@32@01) $Snap.unit))
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) v@31@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert true && r.v >= 0 ==>
;   (decreasing(r.v, old_W4_T0): Bool) && (bounded(old_W4_T0): Bool) ||
;   r.v == old_W4_T0 && false
; [eval] true && r.v >= 0 ==> (decreasing(r.v, old_W4_T0): Bool) && (bounded(old_W4_T0): Bool) || r.v == old_W4_T0 && false
; [eval] true && r.v >= 0
(set-option :timeout 0)
(push) ; 6
; [then-branch: 48 | False | live]
; [else-branch: 48 | True | live]
(push) ; 7
; [then-branch: 48 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 48 | True]
; [eval] r.v >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | First:($t@32@01) >= 0 | live]
; [else-branch: 49 | !(First:($t@32@01) >= 0) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 49 | First:($t@32@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0))
; [eval] (decreasing(r.v, old_W4_T0): Bool) && (bounded(old_W4_T0): Bool) || r.v == old_W4_T0 && false
; [eval] (decreasing(r.v, old_W4_T0): Bool) && (bounded(old_W4_T0): Bool)
; [eval] (decreasing(r.v, old_W4_T0): Bool)
(push) ; 8
; [then-branch: 50 | !(decreasing[Bool](First:($t@32@01), old_W4_T0@30@01)) | live]
; [else-branch: 50 | decreasing[Bool](First:($t@32@01), old_W4_T0@30@01) | live]
(push) ; 9
; [then-branch: 50 | !(decreasing[Bool](First:($t@32@01), old_W4_T0@30@01))]
(assert (not
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 50 | decreasing[Bool](First:($t@32@01), old_W4_T0@30@01)]
(assert (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01))
; [eval] (bounded(old_W4_T0): Bool)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
  (not
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01))))
(push) ; 8
; [then-branch: 51 | decreasing[Bool](First:($t@32@01), old_W4_T0@30@01) && bounded[Bool](old_W4_T0@30@01) | live]
; [else-branch: 51 | !(decreasing[Bool](First:($t@32@01), old_W4_T0@30@01) && bounded[Bool](old_W4_T0@30@01)) | live]
(push) ; 9
; [then-branch: 51 | decreasing[Bool](First:($t@32@01), old_W4_T0@30@01) && bounded[Bool](old_W4_T0@30@01)]
(assert (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
  (bounded<Bool> old_W4_T0@30@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 51 | !(decreasing[Bool](First:($t@32@01), old_W4_T0@30@01) && bounded[Bool](old_W4_T0@30@01))]
(assert (not
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
    (bounded<Bool> old_W4_T0@30@01))))
; [eval] r.v == old_W4_T0 && false
; [eval] r.v == old_W4_T0
(push) ; 10
; [then-branch: 52 | First:($t@32@01) != old_W4_T0@30@01 | live]
; [else-branch: 52 | First:($t@32@01) == old_W4_T0@30@01 | live]
(push) ; 11
; [then-branch: 52 | First:($t@32@01) != old_W4_T0@30@01]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 52 | First:($t@32@01) == old_W4_T0@30@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
      (bounded<Bool> old_W4_T0@30@01)))
  (and
    (not
      (and
        (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
        (bounded<Bool> old_W4_T0@30@01)))
    (or
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
      (bounded<Bool> old_W4_T0@30@01)))
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
    (bounded<Bool> old_W4_T0@30@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 49 | !(First:($t@32@01) >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0)
  (and
    (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0)
    (or
      (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
      (not
        (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)))
    (=>
      (not
        (and
          (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
          (bounded<Bool> old_W4_T0@30@01)))
      (and
        (not
          (and
            (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
            (bounded<Bool> old_W4_T0@30@01)))
        (or
          (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
          (not
            (= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)))))
    (or
      (not
        (and
          (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
          (bounded<Bool> old_W4_T0@30@01)))
      (and
        (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
        (bounded<Bool> old_W4_T0@30@01))))))
; Joined path conditions
(assert (or
  (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0))
  (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0)))
(push) ; 6
(assert (not (=>
  (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0)
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
    (bounded<Bool> old_W4_T0@30@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (>= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) 0)
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) old_W4_T0@30@01)
    (bounded<Bool> old_W4_T0@30@01))))
; Loop head block: Re-establish invariant
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(push) ; 6
(assert (not (<= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) $t@25@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@32@01)) $t@25@01))
(pop) ; 5
(push) ; 5
; [else-branch: 44 | !(First:($t@28@01) >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 0)))
(pop) ; 5
; [eval] !(r.v >= 0)
; [eval] r.v >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | !(First:($t@28@01) >= 0) | live]
; [else-branch: 53 | First:($t@28@01) >= 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 53 | !(First:($t@28@01) >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 0)))
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(pop) ; 5
(push) ; 5
; [else-branch: 53 | First:($t@28@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first $t@28@01)) 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m2_e ----------
(declare-const r@33@01 $Ref)
(declare-const r@34@01 $Ref)
(push) ; 1
(declare-const $t@35@01 Int)
(assert (not (= r@34@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(assert (= ($Snap.second $t@36@01) $Snap.unit))
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@36@01)) $t@35@01))
(pop) ; 2
(push) ; 2
(declare-const old_W5_T0@37@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 ($Snap.combine ($Snap.first $t@38@01) ($Snap.second $t@38@01))))
(assert (= ($Snap.second $t@38@01) $Snap.unit))
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@38@01 ($Snap.combine ($Snap.first $t@38@01) ($Snap.second $t@38@01))))
(assert (= ($Snap.second $t@38@01) $Snap.unit))
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
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
; [eval] r.v >= 0
(pop) ; 5
(push) ; 5
; [eval] !(r.v >= 0)
; [eval] r.v >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] r.v >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | First:($t@38@01) >= 0 | live]
; [else-branch: 54 | !(First:($t@38@01) >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 54 | First:($t@38@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) 0))
; [exec]
; var old_W5_T0: Int
(declare-const old_W5_T0@39@01 Int)
; [exec]
; old_W5_T0 := r.v
(declare-const old_W5_T0@40@01 Int)
(assert (= old_W5_T0@40@01 ($SortWrappers.$SnapToInt ($Snap.first $t@38@01))))
; [exec]
; assert (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool) ||
;   r.v == old(r.v) && false
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool) || r.v == old(r.v) && false
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool)
; [eval] (decreasing(r.v, old(r.v)): Bool)
; [eval] old(r.v)
(push) ; 6
; [then-branch: 55 | !(decreasing[Bool](First:($t@38@01), $t@35@01)) | live]
; [else-branch: 55 | decreasing[Bool](First:($t@38@01), $t@35@01) | live]
(push) ; 7
; [then-branch: 55 | !(decreasing[Bool](First:($t@38@01), $t@35@01))]
(assert (not
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 55 | decreasing[Bool](First:($t@38@01), $t@35@01)]
(assert (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
; [eval] (bounded(old(r.v)): Bool)
; [eval] old(r.v)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (not
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))))
(push) ; 6
; [then-branch: 56 | decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01) | live]
; [else-branch: 56 | !(decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01)) | live]
(push) ; 7
; [then-branch: 56 | decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01)]
(assert (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (bounded<Bool> $t@35@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 56 | !(decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01))]
(assert (not
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
    (bounded<Bool> $t@35@01))))
; [eval] r.v == old(r.v) && false
; [eval] r.v == old(r.v)
; [eval] old(r.v)
(push) ; 8
; [then-branch: 57 | First:($t@38@01) != $t@35@01 | live]
; [else-branch: 57 | First:($t@38@01) == $t@35@01 | live]
(push) ; 9
; [then-branch: 57 | First:($t@38@01) != $t@35@01]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 57 | First:($t@38@01) == $t@35@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
      (bounded<Bool> $t@35@01)))
  (and
    (not
      (and
        (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
        (bounded<Bool> $t@35@01)))
    (or
      (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
      (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
      (bounded<Bool> $t@35@01)))
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
    (bounded<Bool> $t@35@01))))
(push) ; 6
(assert (not (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (bounded<Bool> $t@35@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool) || r.v == old(r.v) && false
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool)
; [eval] (decreasing(r.v, old(r.v)): Bool)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
; [then-branch: 58 | !(decreasing[Bool](First:($t@38@01), $t@35@01)) | live]
; [else-branch: 58 | decreasing[Bool](First:($t@38@01), $t@35@01) | live]
(push) ; 7
; [then-branch: 58 | !(decreasing[Bool](First:($t@38@01), $t@35@01))]
(assert (not
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 58 | decreasing[Bool](First:($t@38@01), $t@35@01)]
(assert (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(r.v)): Bool)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 59 | decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01) | live]
; [else-branch: 59 | !(decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01)) | live]
(push) ; 7
; [then-branch: 59 | decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01)]
(assert (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (bounded<Bool> $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 59 | !(decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01))]
(assert (not
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
    (bounded<Bool> $t@35@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.v == old(r.v) && false
; [eval] r.v == old(r.v)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
; [then-branch: 60 | First:($t@38@01) != $t@35@01 | live]
; [else-branch: 60 | First:($t@38@01) == $t@35@01 | live]
(push) ; 9
; [then-branch: 60 | First:($t@38@01) != $t@35@01]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 60 | First:($t@38@01) == $t@35@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (bounded<Bool> $t@35@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool) || r.v == old(r.v) && false
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool)
; [eval] (decreasing(r.v, old(r.v)): Bool)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
; [then-branch: 61 | !(decreasing[Bool](First:($t@38@01), $t@35@01)) | live]
; [else-branch: 61 | decreasing[Bool](First:($t@38@01), $t@35@01) | live]
(push) ; 7
; [then-branch: 61 | !(decreasing[Bool](First:($t@38@01), $t@35@01))]
(assert (not
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 61 | decreasing[Bool](First:($t@38@01), $t@35@01)]
(assert (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(r.v)): Bool)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 62 | decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01) | live]
; [else-branch: 62 | !(decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01)) | live]
(push) ; 7
; [then-branch: 62 | decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01)]
(assert (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (bounded<Bool> $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 62 | !(decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01))]
(assert (not
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
    (bounded<Bool> $t@35@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.v == old(r.v) && false
; [eval] r.v == old(r.v)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
; [then-branch: 63 | First:($t@38@01) != $t@35@01 | live]
; [else-branch: 63 | First:($t@38@01) == $t@35@01 | live]
(push) ; 9
; [then-branch: 63 | First:($t@38@01) != $t@35@01]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 63 | First:($t@38@01) == $t@35@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (bounded<Bool> $t@35@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool) || r.v == old(r.v) && false
; [eval] (decreasing(r.v, old(r.v)): Bool) && (bounded(old(r.v)): Bool)
; [eval] (decreasing(r.v, old(r.v)): Bool)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
; [then-branch: 64 | !(decreasing[Bool](First:($t@38@01), $t@35@01)) | live]
; [else-branch: 64 | decreasing[Bool](First:($t@38@01), $t@35@01) | live]
(push) ; 7
; [then-branch: 64 | !(decreasing[Bool](First:($t@38@01), $t@35@01))]
(assert (not
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 64 | decreasing[Bool](First:($t@38@01), $t@35@01)]
(assert (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(r.v)): Bool)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 65 | decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01) | live]
; [else-branch: 65 | !(decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01)) | live]
(push) ; 7
; [then-branch: 65 | decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01)]
(assert (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (bounded<Bool> $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 65 | !(decreasing[Bool](First:($t@38@01), $t@35@01) && bounded[Bool]($t@35@01))]
(assert (not
  (and
    (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
    (bounded<Bool> $t@35@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.v == old(r.v) && false
; [eval] r.v == old(r.v)
; [eval] old(r.v)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 8
; [then-branch: 66 | First:($t@38@01) != $t@35@01 | live]
; [else-branch: 66 | First:($t@38@01) == $t@35@01 | live]
(push) ; 9
; [then-branch: 66 | First:($t@38@01) != $t@35@01]
(assert (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 66 | First:($t@38@01) == $t@35@01]
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (not (= ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (and
  (decreasing<Bool> ($SortWrappers.$SnapToInt ($Snap.first $t@38@01)) $t@35@01)
  (bounded<Bool> $t@35@01))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const r@41@01 $Ref)
(declare-const r@42@01 $Ref)
(push) ; 1
(declare-const $t@43@01 Int)
(assert (not (= r@42@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@44@01 Int)
(pop) ; 2
(push) ; 2
(declare-const old_W7_T0@45@01 Int)
(declare-const y@46@01 Int)
(declare-const old_W6_T0@47@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(assert (= ($Snap.second $t@48@01) $Snap.unit))
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) $t@43@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(assert (= ($Snap.second $t@48@01) $Snap.unit))
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) $t@43@01))
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
; [eval] r.v >= 0
(pop) ; 5
(push) ; 5
; [eval] !(r.v >= 0)
; [eval] r.v >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] r.v >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 67 | First:($t@48@01) >= 0 | live]
; [else-branch: 67 | !(First:($t@48@01) >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 67 | First:($t@48@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 0))
; [exec]
; var old_W7_T0: Int
(declare-const old_W7_T0@49@01 Int)
; [exec]
; old_W7_T0 := r.v
(declare-const old_W7_T0@50@01 Int)
(assert (= old_W7_T0@50@01 ($SortWrappers.$SnapToInt ($Snap.first $t@48@01))))
; [exec]
; var y: Int
(declare-const y@51@01 Int)
; [exec]
; y := r.v
(declare-const y@52@01 Int)
(assert (= y@52@01 ($SortWrappers.$SnapToInt ($Snap.first $t@48@01))))
(declare-const old_W6_T0@53@01 Int)
(declare-const y@54@01 Int)
(push) ; 6
; Loop head block: Check well-definedness of invariant
(pop) ; 6
(push) ; 6
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] y >= 0
(pop) ; 8
(push) ; 8
; [eval] !(y >= 0)
; [eval] y >= 0
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] y >= 0
(push) ; 8
(set-option :timeout 10)
(assert (not (not (>= y@54@01 0))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (>= y@54@01 0)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 68 | y@54@01 >= 0 | live]
; [else-branch: 68 | !(y@54@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 68 | y@54@01 >= 0]
(assert (>= y@54@01 0))
; [exec]
; var old_W6_T0: Int
(declare-const old_W6_T0@55@01 Int)
; [exec]
; old_W6_T0 := y
; [exec]
; y := y - 1
; [eval] y - 1
(declare-const y@56@01 Int)
(assert (= y@56@01 (- y@54@01 1)))
; [exec]
; assert true && y >= 0 ==>
;   (decreasing(y, old_W6_T0): Bool) && (bounded(old_W6_T0): Bool) ||
;   y == old_W6_T0 && false
; [eval] true && y >= 0 ==> (decreasing(y, old_W6_T0): Bool) && (bounded(old_W6_T0): Bool) || y == old_W6_T0 && false
; [eval] true && y >= 0
(push) ; 9
; [then-branch: 69 | False | live]
; [else-branch: 69 | True | live]
(push) ; 10
; [then-branch: 69 | False]
(assert false)
(pop) ; 10
(push) ; 10
; [else-branch: 69 | True]
; [eval] y >= 0
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not (>= y@56@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (>= y@56@01 0)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 70 | y@56@01 >= 0 | live]
; [else-branch: 70 | !(y@56@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 70 | y@56@01 >= 0]
(assert (>= y@56@01 0))
; [eval] (decreasing(y, old_W6_T0): Bool) && (bounded(old_W6_T0): Bool) || y == old_W6_T0 && false
; [eval] (decreasing(y, old_W6_T0): Bool) && (bounded(old_W6_T0): Bool)
; [eval] (decreasing(y, old_W6_T0): Bool)
(push) ; 11
; [then-branch: 71 | !(decreasing[Bool](y@56@01, y@54@01)) | live]
; [else-branch: 71 | decreasing[Bool](y@56@01, y@54@01) | live]
(push) ; 12
; [then-branch: 71 | !(decreasing[Bool](y@56@01, y@54@01))]
(assert (not (decreasing<Bool> y@56@01 y@54@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 71 | decreasing[Bool](y@56@01, y@54@01)]
(assert (decreasing<Bool> y@56@01 y@54@01))
; [eval] (bounded(old_W6_T0): Bool)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@56@01 y@54@01) (not (decreasing<Bool> y@56@01 y@54@01))))
(push) ; 11
; [then-branch: 72 | decreasing[Bool](y@56@01, y@54@01) && bounded[Bool](y@54@01) | live]
; [else-branch: 72 | !(decreasing[Bool](y@56@01, y@54@01) && bounded[Bool](y@54@01)) | live]
(push) ; 12
; [then-branch: 72 | decreasing[Bool](y@56@01, y@54@01) && bounded[Bool](y@54@01)]
(assert (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 72 | !(decreasing[Bool](y@56@01, y@54@01) && bounded[Bool](y@54@01))]
(assert (not (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01))))
; [eval] y == old_W6_T0 && false
; [eval] y == old_W6_T0
(push) ; 13
; [then-branch: 73 | y@56@01 != y@54@01 | live]
; [else-branch: 73 | y@56@01 == y@54@01 | live]
(push) ; 14
; [then-branch: 73 | y@56@01 != y@54@01]
(assert (not (= y@56@01 y@54@01)))
(pop) ; 14
(push) ; 14
; [else-branch: 73 | y@56@01 == y@54@01]
(assert (= y@56@01 y@54@01))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (= y@56@01 y@54@01) (not (= y@56@01 y@54@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01)))
  (and
    (not (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01)))
    (or (= y@56@01 y@54@01) (not (= y@56@01 y@54@01))))))
(assert (or
  (not (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01)))
  (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 70 | !(y@56@01 >= 0)]
(assert (not (>= y@56@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= y@56@01 0)
  (and
    (>= y@56@01 0)
    (or
      (decreasing<Bool> y@56@01 y@54@01)
      (not (decreasing<Bool> y@56@01 y@54@01)))
    (=>
      (not (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01)))
      (and
        (not (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01)))
        (or (= y@56@01 y@54@01) (not (= y@56@01 y@54@01)))))
    (or
      (not (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01)))
      (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01))))))
; Joined path conditions
(assert (or (not (>= y@56@01 0)) (>= y@56@01 0)))
(push) ; 9
(assert (not (=>
  (>= y@56@01 0)
  (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (>= y@56@01 0)
  (and (decreasing<Bool> y@56@01 y@54@01) (bounded<Bool> y@54@01))))
; Loop head block: Re-establish invariant
(pop) ; 8
(push) ; 8
; [else-branch: 68 | !(y@54@01 >= 0)]
(assert (not (>= y@54@01 0)))
(pop) ; 8
; [eval] !(y >= 0)
; [eval] y >= 0
(push) ; 8
(set-option :timeout 10)
(assert (not (>= y@54@01 0)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (>= y@54@01 0))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 74 | !(y@54@01 >= 0) | live]
; [else-branch: 74 | y@54@01 >= 0 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 74 | !(y@54@01 >= 0)]
(assert (not (>= y@54@01 0)))
; [exec]
; r.v := r.v - 1
; [eval] r.v - 1
(declare-const v@57@01 Int)
(assert (= v@57@01 (- ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 1)))
; [exec]
; assert true && r.v >= 0 ==>
;   (decreasing(r.v, old_W7_T0): Bool) && (bounded(old_W7_T0): Bool) ||
;   r.v == old_W7_T0 && false
; [eval] true && r.v >= 0 ==> (decreasing(r.v, old_W7_T0): Bool) && (bounded(old_W7_T0): Bool) || r.v == old_W7_T0 && false
; [eval] true && r.v >= 0
(push) ; 9
; [then-branch: 75 | False | live]
; [else-branch: 75 | True | live]
(push) ; 10
; [then-branch: 75 | False]
(assert false)
(pop) ; 10
(push) ; 10
; [else-branch: 75 | True]
; [eval] r.v >= 0
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not (>= v@57@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (>= v@57@01 0)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 76 | v@57@01 >= 0 | live]
; [else-branch: 76 | !(v@57@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 76 | v@57@01 >= 0]
(assert (>= v@57@01 0))
; [eval] (decreasing(r.v, old_W7_T0): Bool) && (bounded(old_W7_T0): Bool) || r.v == old_W7_T0 && false
; [eval] (decreasing(r.v, old_W7_T0): Bool) && (bounded(old_W7_T0): Bool)
; [eval] (decreasing(r.v, old_W7_T0): Bool)
(push) ; 11
; [then-branch: 77 | !(decreasing[Bool](v@57@01, old_W7_T0@50@01)) | live]
; [else-branch: 77 | decreasing[Bool](v@57@01, old_W7_T0@50@01) | live]
(push) ; 12
; [then-branch: 77 | !(decreasing[Bool](v@57@01, old_W7_T0@50@01))]
(assert (not (decreasing<Bool> v@57@01 old_W7_T0@50@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 77 | decreasing[Bool](v@57@01, old_W7_T0@50@01)]
(assert (decreasing<Bool> v@57@01 old_W7_T0@50@01))
; [eval] (bounded(old_W7_T0): Bool)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> v@57@01 old_W7_T0@50@01)
  (not (decreasing<Bool> v@57@01 old_W7_T0@50@01))))
(push) ; 11
; [then-branch: 78 | decreasing[Bool](v@57@01, old_W7_T0@50@01) && bounded[Bool](old_W7_T0@50@01) | live]
; [else-branch: 78 | !(decreasing[Bool](v@57@01, old_W7_T0@50@01) && bounded[Bool](old_W7_T0@50@01)) | live]
(push) ; 12
; [then-branch: 78 | decreasing[Bool](v@57@01, old_W7_T0@50@01) && bounded[Bool](old_W7_T0@50@01)]
(assert (and (decreasing<Bool> v@57@01 old_W7_T0@50@01) (bounded<Bool> old_W7_T0@50@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 78 | !(decreasing[Bool](v@57@01, old_W7_T0@50@01) && bounded[Bool](old_W7_T0@50@01))]
(assert (not
  (and
    (decreasing<Bool> v@57@01 old_W7_T0@50@01)
    (bounded<Bool> old_W7_T0@50@01))))
; [eval] r.v == old_W7_T0 && false
; [eval] r.v == old_W7_T0
(push) ; 13
; [then-branch: 79 | v@57@01 != old_W7_T0@50@01 | live]
; [else-branch: 79 | v@57@01 == old_W7_T0@50@01 | live]
(push) ; 14
; [then-branch: 79 | v@57@01 != old_W7_T0@50@01]
(assert (not (= v@57@01 old_W7_T0@50@01)))
(pop) ; 14
(push) ; 14
; [else-branch: 79 | v@57@01 == old_W7_T0@50@01]
(assert (= v@57@01 old_W7_T0@50@01))
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(assert (or (= v@57@01 old_W7_T0@50@01) (not (= v@57@01 old_W7_T0@50@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (decreasing<Bool> v@57@01 old_W7_T0@50@01)
      (bounded<Bool> old_W7_T0@50@01)))
  (and
    (not
      (and
        (decreasing<Bool> v@57@01 old_W7_T0@50@01)
        (bounded<Bool> old_W7_T0@50@01)))
    (or (= v@57@01 old_W7_T0@50@01) (not (= v@57@01 old_W7_T0@50@01))))))
(assert (or
  (not
    (and
      (decreasing<Bool> v@57@01 old_W7_T0@50@01)
      (bounded<Bool> old_W7_T0@50@01)))
  (and
    (decreasing<Bool> v@57@01 old_W7_T0@50@01)
    (bounded<Bool> old_W7_T0@50@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 76 | !(v@57@01 >= 0)]
(assert (not (>= v@57@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= v@57@01 0)
  (and
    (>= v@57@01 0)
    (or
      (decreasing<Bool> v@57@01 old_W7_T0@50@01)
      (not (decreasing<Bool> v@57@01 old_W7_T0@50@01)))
    (=>
      (not
        (and
          (decreasing<Bool> v@57@01 old_W7_T0@50@01)
          (bounded<Bool> old_W7_T0@50@01)))
      (and
        (not
          (and
            (decreasing<Bool> v@57@01 old_W7_T0@50@01)
            (bounded<Bool> old_W7_T0@50@01)))
        (or (= v@57@01 old_W7_T0@50@01) (not (= v@57@01 old_W7_T0@50@01)))))
    (or
      (not
        (and
          (decreasing<Bool> v@57@01 old_W7_T0@50@01)
          (bounded<Bool> old_W7_T0@50@01)))
      (and
        (decreasing<Bool> v@57@01 old_W7_T0@50@01)
        (bounded<Bool> old_W7_T0@50@01))))))
; Joined path conditions
(assert (or (not (>= v@57@01 0)) (>= v@57@01 0)))
(push) ; 9
(assert (not (=>
  (>= v@57@01 0)
  (and
    (decreasing<Bool> v@57@01 old_W7_T0@50@01)
    (bounded<Bool> old_W7_T0@50@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (>= v@57@01 0)
  (and
    (decreasing<Bool> v@57@01 old_W7_T0@50@01)
    (bounded<Bool> old_W7_T0@50@01))))
; Loop head block: Re-establish invariant
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(push) ; 9
(assert (not (<= v@57@01 $t@43@01)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (<= v@57@01 $t@43@01))
(pop) ; 8
(push) ; 8
; [else-branch: 74 | y@54@01 >= 0]
(assert (>= y@54@01 0))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 67 | !(First:($t@48@01) >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 0)))
(pop) ; 5
; [eval] !(r.v >= 0)
; [eval] r.v >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 80 | !(First:($t@48@01) >= 0) | live]
; [else-branch: 80 | First:($t@48@01) >= 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 80 | !(First:($t@48@01) >= 0)]
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 80 | First:($t@48@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first $t@48@01)) 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m3_e ----------
(declare-const r@58@01 $Ref)
(declare-const r@59@01 $Ref)
(push) ; 1
(declare-const $t@60@01 Int)
(assert (not (= r@59@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@61@01 Int)
(pop) ; 2
(push) ; 2
(declare-const old_W9_T0@62@01 Int)
(declare-const y@63@01 Int)
(declare-const old_W8_T0@64@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(assert (= ($Snap.second $t@65@01) $Snap.unit))
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@65@01)) $t@60@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] r.v <= old(r.v)
; [eval] old(r.v)
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(assert (= ($Snap.second $t@65@01) $Snap.unit))
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first $t@65@01)) $t@60@01))
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
; [eval] r.v >= 0
(pop) ; 5
(push) ; 5
; [eval] !(r.v >= 0)
; [eval] r.v >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] r.v >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@65@01)) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= ($SortWrappers.$SnapToInt ($Snap.first $t@65@01)) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 81 | First:($t@65@01) >= 0 | live]
; [else-branch: 81 | !(First:($t@65@01) >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 81 | First:($t@65@01) >= 0]
(assert (>= ($SortWrappers.$SnapToInt ($Snap.first $t@65@01)) 0))
; [exec]
; var old_W9_T0: Int
(declare-const old_W9_T0@66@01 Int)
; [exec]
; old_W9_T0 := r.v
(declare-const old_W9_T0@67@01 Int)
(assert (= old_W9_T0@67@01 ($SortWrappers.$SnapToInt ($Snap.first $t@65@01))))
; [exec]
; var y: Int
(declare-const y@68@01 Int)
; [exec]
; y := r.v
(declare-const y@69@01 Int)
(assert (= y@69@01 ($SortWrappers.$SnapToInt ($Snap.first $t@65@01))))
(declare-const old_W8_T0@70@01 Int)
(declare-const y@71@01 Int)
(push) ; 6
; Loop head block: Check well-definedness of invariant
(pop) ; 6
(push) ; 6
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] y >= 0
(pop) ; 8
(push) ; 8
; [eval] !(y >= 0)
; [eval] y >= 0
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] y >= 0
(push) ; 8
(set-option :timeout 10)
(assert (not (not (>= y@71@01 0))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (>= y@71@01 0)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 82 | y@71@01 >= 0 | live]
; [else-branch: 82 | !(y@71@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 82 | y@71@01 >= 0]
(assert (>= y@71@01 0))
; [exec]
; var old_W8_T0: Int
(declare-const old_W8_T0@72@01 Int)
; [exec]
; old_W8_T0 := y
; [exec]
; y := y
; [exec]
; assert true && y >= 0 ==>
;   (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) ||
;   y == old_W8_T0 && false
; [eval] true && y >= 0 ==> (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) || y == old_W8_T0 && false
; [eval] true && y >= 0
(push) ; 9
; [then-branch: 83 | False | live]
; [else-branch: 83 | True | live]
(push) ; 10
; [then-branch: 83 | False]
(assert false)
(pop) ; 10
(push) ; 10
; [else-branch: 83 | True]
; [eval] y >= 0
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not (>= y@71@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 84 | y@71@01 >= 0 | live]
; [else-branch: 84 | !(y@71@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 84 | y@71@01 >= 0]
; [eval] (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) || y == old_W8_T0 && false
; [eval] (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool)
; [eval] (decreasing(y, old_W8_T0): Bool)
(push) ; 11
; [then-branch: 85 | !(decreasing[Bool](y@71@01, y@71@01)) | live]
; [else-branch: 85 | decreasing[Bool](y@71@01, y@71@01) | live]
(push) ; 12
; [then-branch: 85 | !(decreasing[Bool](y@71@01, y@71@01))]
(assert (not (decreasing<Bool> y@71@01 y@71@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 85 | decreasing[Bool](y@71@01, y@71@01)]
(assert (decreasing<Bool> y@71@01 y@71@01))
; [eval] (bounded(old_W8_T0): Bool)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@71@01 y@71@01) (not (decreasing<Bool> y@71@01 y@71@01))))
(push) ; 11
; [then-branch: 86 | decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01) | live]
; [else-branch: 86 | !(decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01)) | live]
(push) ; 12
; [then-branch: 86 | decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01)]
(assert (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
(pop) ; 12
(push) ; 12
; [else-branch: 86 | !(decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01))]
(assert (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))
; [eval] y == old_W8_T0 && false
; [eval] y == old_W8_T0
(push) ; 13
; [then-branch: 87 | False | live]
; [else-branch: 87 | True | live]
(push) ; 14
; [then-branch: 87 | False]
(assert false)
(pop) ; 14
(push) ; 14
; [else-branch: 87 | True]
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
  (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= y@71@01 0)
  (and
    (or
      (decreasing<Bool> y@71@01 y@71@01)
      (not (decreasing<Bool> y@71@01 y@71@01)))
    (or
      (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
      (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))))
(push) ; 9
(assert (not (=>
  (>= y@71@01 0)
  (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] true && y >= 0 ==> (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) || y == old_W8_T0 && false
; [eval] true && y >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 88 | False | live]
; [else-branch: 88 | True | live]
(push) ; 10
; [then-branch: 88 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 88 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not (>= y@71@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 89 | y@71@01 >= 0 | live]
; [else-branch: 89 | !(y@71@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 89 | y@71@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) || y == old_W8_T0 && false
; [eval] (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool)
; [eval] (decreasing(y, old_W8_T0): Bool)
(set-option :timeout 0)
(push) ; 11
; [then-branch: 90 | !(decreasing[Bool](y@71@01, y@71@01)) | live]
; [else-branch: 90 | decreasing[Bool](y@71@01, y@71@01) | live]
(push) ; 12
; [then-branch: 90 | !(decreasing[Bool](y@71@01, y@71@01))]
(assert (not (decreasing<Bool> y@71@01 y@71@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 90 | decreasing[Bool](y@71@01, y@71@01)]
(assert (decreasing<Bool> y@71@01 y@71@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W8_T0): Bool)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@71@01 y@71@01) (not (decreasing<Bool> y@71@01 y@71@01))))
(set-option :timeout 0)
(push) ; 11
; [then-branch: 91 | decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01) | live]
; [else-branch: 91 | !(decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01)) | live]
(push) ; 12
; [then-branch: 91 | decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01)]
(assert (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 91 | !(decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01))]
(assert (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old_W8_T0 && false
; [eval] y == old_W8_T0
(set-option :timeout 0)
(push) ; 13
; [then-branch: 92 | False | live]
; [else-branch: 92 | True | live]
(push) ; 14
; [then-branch: 92 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 92 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
  (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
(assert (not (=>
  (>= y@71@01 0)
  (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] true && y >= 0 ==> (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) || y == old_W8_T0 && false
; [eval] true && y >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 93 | False | live]
; [else-branch: 93 | True | live]
(push) ; 10
; [then-branch: 93 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 93 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not (>= y@71@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 94 | y@71@01 >= 0 | live]
; [else-branch: 94 | !(y@71@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 94 | y@71@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) || y == old_W8_T0 && false
; [eval] (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool)
; [eval] (decreasing(y, old_W8_T0): Bool)
(set-option :timeout 0)
(push) ; 11
; [then-branch: 95 | !(decreasing[Bool](y@71@01, y@71@01)) | live]
; [else-branch: 95 | decreasing[Bool](y@71@01, y@71@01) | live]
(push) ; 12
; [then-branch: 95 | !(decreasing[Bool](y@71@01, y@71@01))]
(assert (not (decreasing<Bool> y@71@01 y@71@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 95 | decreasing[Bool](y@71@01, y@71@01)]
(assert (decreasing<Bool> y@71@01 y@71@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W8_T0): Bool)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@71@01 y@71@01) (not (decreasing<Bool> y@71@01 y@71@01))))
(set-option :timeout 0)
(push) ; 11
; [then-branch: 96 | decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01) | live]
; [else-branch: 96 | !(decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01)) | live]
(push) ; 12
; [then-branch: 96 | decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01)]
(assert (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 96 | !(decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01))]
(assert (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old_W8_T0 && false
; [eval] y == old_W8_T0
(set-option :timeout 0)
(push) ; 13
; [then-branch: 97 | False | live]
; [else-branch: 97 | True | live]
(push) ; 14
; [then-branch: 97 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 97 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
  (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
(assert (not (=>
  (>= y@71@01 0)
  (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] true && y >= 0 ==> (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) || y == old_W8_T0 && false
; [eval] true && y >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 98 | False | live]
; [else-branch: 98 | True | live]
(push) ; 10
; [then-branch: 98 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 98 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (not (>= y@71@01 0))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 99 | y@71@01 >= 0 | live]
; [else-branch: 99 | !(y@71@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 99 | y@71@01 >= 0]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool) || y == old_W8_T0 && false
; [eval] (decreasing(y, old_W8_T0): Bool) && (bounded(old_W8_T0): Bool)
; [eval] (decreasing(y, old_W8_T0): Bool)
(set-option :timeout 0)
(push) ; 11
; [then-branch: 100 | !(decreasing[Bool](y@71@01, y@71@01)) | live]
; [else-branch: 100 | decreasing[Bool](y@71@01, y@71@01) | live]
(push) ; 12
; [then-branch: 100 | !(decreasing[Bool](y@71@01, y@71@01))]
(assert (not (decreasing<Bool> y@71@01 y@71@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 100 | decreasing[Bool](y@71@01, y@71@01)]
(assert (decreasing<Bool> y@71@01 y@71@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old_W8_T0): Bool)
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@71@01 y@71@01) (not (decreasing<Bool> y@71@01 y@71@01))))
(set-option :timeout 0)
(push) ; 11
; [then-branch: 101 | decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01) | live]
; [else-branch: 101 | !(decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01)) | live]
(push) ; 12
; [then-branch: 101 | decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01)]
(assert (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 101 | !(decreasing[Bool](y@71@01, y@71@01) && bounded[Bool](y@71@01))]
(assert (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == old_W8_T0 && false
; [eval] y == old_W8_T0
(set-option :timeout 0)
(push) ; 13
; [then-branch: 102 | False | live]
; [else-branch: 102 | True | live]
(push) ; 14
; [then-branch: 102 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 14
(set-option :timeout 0)
(push) ; 14
; [else-branch: 102 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 14
(pop) ; 13
; Joined path conditions
; Joined path conditions
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))
  (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(set-option :timeout 0)
(push) ; 9
(assert (not (=>
  (>= y@71@01 0)
  (and (decreasing<Bool> y@71@01 y@71@01) (bounded<Bool> y@71@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const r@73@01 $Ref)
(declare-const r@74@01 $Ref)
(push) ; 1
(declare-const $t@75@01 Int)
(assert (not (= r@74@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@76@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; var y: Int
(declare-const y@77@01 Int)
; [exec]
; y := r.v
; [exec]
; assert !(old(true) && y >= 0) || y >= 0
; [eval] !(old(true) && y >= 0) || y >= 0
; [eval] !(old(true) && y >= 0)
; [eval] old(true) && y >= 0
; [eval] old(true)
(push) ; 3
; [then-branch: 103 | False | live]
; [else-branch: 103 | True | live]
(push) ; 4
; [then-branch: 103 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 103 | True]
; [eval] y >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
; [then-branch: 104 | !($t@75@01 >= 0) | live]
; [else-branch: 104 | $t@75@01 >= 0 | live]
(push) ; 4
; [then-branch: 104 | !($t@75@01 >= 0)]
(assert (not (>= $t@75@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 104 | $t@75@01 >= 0]
(assert (>= $t@75@01 0))
; [eval] y >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (>= $t@75@01 0) (not (>= $t@75@01 0))))
(push) ; 3
(assert (not (or (not (>= $t@75@01 0)) (>= $t@75@01 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= $t@75@01 0)) (>= $t@75@01 0)))
(declare-const old_W10_T0@78@01 Int)
(declare-const old_W10_C@79@01 Bool)
(declare-const y@80@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 ($Snap.combine ($Snap.first $t@81@01) ($Snap.second $t@81@01))))
(assert (= ($Snap.second $t@81@01) $Snap.unit))
; [eval] y <= old(r.v)
; [eval] old(r.v)
(assert (<= y@80@01 $t@75@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] y <= old(r.v)
; [eval] old(r.v)
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@81@01 ($Snap.combine ($Snap.first $t@81@01) ($Snap.second $t@81@01))))
(assert (= ($Snap.second $t@81@01) $Snap.unit))
(assert (<= y@80@01 $t@75@01))
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
; [eval] y >= 0
(pop) ; 5
(push) ; 5
; [eval] !(y >= 0)
; [eval] y >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] y >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= y@80@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= y@80@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 105 | y@80@01 >= 0 | live]
; [else-branch: 105 | !(y@80@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 105 | y@80@01 >= 0]
(assert (>= y@80@01 0))
; [exec]
; var old_W10_T0: Int
(declare-const old_W10_T0@82@01 Int)
; [exec]
; var old_W10_C: Bool
(declare-const old_W10_C@83@01 Bool)
; [exec]
; old_W10_T0 := y
; [exec]
; old_W10_C := y >= 0
; [eval] y >= 0
(declare-const old_W10_C@84@01 Bool)
(assert (= old_W10_C@84@01 (>= y@80@01 0)))
; [exec]
; y := y - 1
; [eval] y - 1
(declare-const y@85@01 Int)
(assert (= y@85@01 (- y@80@01 1)))
; [exec]
; assert !(old_W10_C && y >= 0) || y >= 0
; [eval] !(old_W10_C && y >= 0) || y >= 0
; [eval] !(old_W10_C && y >= 0)
; [eval] old_W10_C && y >= 0
(push) ; 6
; [then-branch: 106 | !(old_W10_C@84@01) | live]
; [else-branch: 106 | old_W10_C@84@01 | live]
(push) ; 7
; [then-branch: 106 | !(old_W10_C@84@01)]
(assert (not old_W10_C@84@01))
(pop) ; 7
(push) ; 7
; [else-branch: 106 | old_W10_C@84@01]
(assert old_W10_C@84@01)
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or old_W10_C@84@01 (not old_W10_C@84@01)))
(push) ; 6
; [then-branch: 107 | !(old_W10_C@84@01 && y@85@01 >= 0) | live]
; [else-branch: 107 | old_W10_C@84@01 && y@85@01 >= 0 | live]
(push) ; 7
; [then-branch: 107 | !(old_W10_C@84@01 && y@85@01 >= 0)]
(assert (not (and old_W10_C@84@01 (>= y@85@01 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 107 | old_W10_C@84@01 && y@85@01 >= 0]
(assert (and old_W10_C@84@01 (>= y@85@01 0)))
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (and old_W10_C@84@01 (>= y@85@01 0))
  (not (and old_W10_C@84@01 (>= y@85@01 0)))))
(push) ; 6
(assert (not (or (not (and old_W10_C@84@01 (>= y@85@01 0))) (>= y@85@01 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (or (not (and old_W10_C@84@01 (>= y@85@01 0))) (>= y@85@01 0)))
; [exec]
; assert old_W10_C && y >= 0 ==>
;   (decreasing(y, old_W10_T0): Bool) && (bounded(old_W10_T0): Bool) ||
;   y == old_W10_T0 && false
; [eval] old_W10_C && y >= 0 ==> (decreasing(y, old_W10_T0): Bool) && (bounded(old_W10_T0): Bool) || y == old_W10_T0 && false
; [eval] old_W10_C && y >= 0
(push) ; 6
; [then-branch: 108 | !(old_W10_C@84@01) | live]
; [else-branch: 108 | old_W10_C@84@01 | live]
(push) ; 7
; [then-branch: 108 | !(old_W10_C@84@01)]
(assert (not old_W10_C@84@01))
(pop) ; 7
(push) ; 7
; [else-branch: 108 | old_W10_C@84@01]
(assert old_W10_C@84@01)
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and old_W10_C@84@01 (>= y@85@01 0)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and old_W10_C@84@01 (>= y@85@01 0))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 109 | old_W10_C@84@01 && y@85@01 >= 0 | live]
; [else-branch: 109 | !(old_W10_C@84@01 && y@85@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 109 | old_W10_C@84@01 && y@85@01 >= 0]
(assert (and old_W10_C@84@01 (>= y@85@01 0)))
; [eval] (decreasing(y, old_W10_T0): Bool) && (bounded(old_W10_T0): Bool) || y == old_W10_T0 && false
; [eval] (decreasing(y, old_W10_T0): Bool) && (bounded(old_W10_T0): Bool)
; [eval] (decreasing(y, old_W10_T0): Bool)
(push) ; 8
; [then-branch: 110 | !(decreasing[Bool](y@85@01, y@80@01)) | live]
; [else-branch: 110 | decreasing[Bool](y@85@01, y@80@01) | live]
(push) ; 9
; [then-branch: 110 | !(decreasing[Bool](y@85@01, y@80@01))]
(assert (not (decreasing<Bool> y@85@01 y@80@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 110 | decreasing[Bool](y@85@01, y@80@01)]
(assert (decreasing<Bool> y@85@01 y@80@01))
; [eval] (bounded(old_W10_T0): Bool)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@85@01 y@80@01) (not (decreasing<Bool> y@85@01 y@80@01))))
(push) ; 8
; [then-branch: 111 | decreasing[Bool](y@85@01, y@80@01) && bounded[Bool](y@80@01) | live]
; [else-branch: 111 | !(decreasing[Bool](y@85@01, y@80@01) && bounded[Bool](y@80@01)) | live]
(push) ; 9
; [then-branch: 111 | decreasing[Bool](y@85@01, y@80@01) && bounded[Bool](y@80@01)]
(assert (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 111 | !(decreasing[Bool](y@85@01, y@80@01) && bounded[Bool](y@80@01))]
(assert (not (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01))))
; [eval] y == old_W10_T0 && false
; [eval] y == old_W10_T0
(push) ; 10
; [then-branch: 112 | y@85@01 != y@80@01 | live]
; [else-branch: 112 | y@85@01 == y@80@01 | live]
(push) ; 11
; [then-branch: 112 | y@85@01 != y@80@01]
(assert (not (= y@85@01 y@80@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 112 | y@85@01 == y@80@01]
(assert (= y@85@01 y@80@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (= y@85@01 y@80@01) (not (= y@85@01 y@80@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01)))
  (and
    (not (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01)))
    (or (= y@85@01 y@80@01) (not (= y@85@01 y@80@01))))))
(assert (or
  (not (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01)))
  (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 109 | !(old_W10_C@84@01 && y@85@01 >= 0)]
(assert (not (and old_W10_C@84@01 (>= y@85@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and old_W10_C@84@01 (>= y@85@01 0))
  (and
    old_W10_C@84@01
    (>= y@85@01 0)
    (or
      (decreasing<Bool> y@85@01 y@80@01)
      (not (decreasing<Bool> y@85@01 y@80@01)))
    (=>
      (not (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01)))
      (and
        (not (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01)))
        (or (= y@85@01 y@80@01) (not (= y@85@01 y@80@01)))))
    (or
      (not (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01)))
      (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01))))))
; Joined path conditions
(assert (or
  (not (and old_W10_C@84@01 (>= y@85@01 0)))
  (and old_W10_C@84@01 (>= y@85@01 0))))
(push) ; 6
(assert (not (=>
  (and old_W10_C@84@01 (>= y@85@01 0))
  (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and old_W10_C@84@01 (>= y@85@01 0))
  (and (decreasing<Bool> y@85@01 y@80@01) (bounded<Bool> y@80@01))))
; Loop head block: Re-establish invariant
; [eval] y <= old(r.v)
; [eval] old(r.v)
(push) ; 6
(assert (not (<= y@85@01 $t@75@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= y@85@01 $t@75@01))
(pop) ; 5
(push) ; 5
; [else-branch: 105 | !(y@80@01 >= 0)]
(assert (not (>= y@80@01 0)))
(pop) ; 5
; [eval] !(y >= 0)
; [eval] y >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (>= y@80@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= y@80@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 113 | !(y@80@01 >= 0) | live]
; [else-branch: 113 | y@80@01 >= 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 113 | !(y@80@01 >= 0)]
(assert (not (>= y@80@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 113 | y@80@01 >= 0]
(assert (>= y@80@01 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m4_e ----------
(declare-const r@86@01 $Ref)
(declare-const r@87@01 $Ref)
(push) ; 1
(declare-const $t@88@01 Int)
(assert (not (= r@87@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@89@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; var y: Int
(declare-const y@90@01 Int)
; [exec]
; y := r.v
; [exec]
; assert !(old(true) && y >= 0) || y > 0
; [eval] !(old(true) && y >= 0) || y > 0
; [eval] !(old(true) && y >= 0)
; [eval] old(true) && y >= 0
; [eval] old(true)
(push) ; 3
; [then-branch: 114 | False | live]
; [else-branch: 114 | True | live]
(push) ; 4
; [then-branch: 114 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 114 | True]
; [eval] y >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
; [then-branch: 115 | !($t@88@01 >= 0) | live]
; [else-branch: 115 | $t@88@01 >= 0 | live]
(push) ; 4
; [then-branch: 115 | !($t@88@01 >= 0)]
(assert (not (>= $t@88@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 115 | $t@88@01 >= 0]
(assert (>= $t@88@01 0))
; [eval] y > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (>= $t@88@01 0) (not (>= $t@88@01 0))))
(push) ; 3
(assert (not (or (not (>= $t@88@01 0)) (> $t@88@01 0))))
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
; [eval] !(old(true) && y >= 0) || y > 0
; [eval] !(old(true) && y >= 0)
; [eval] old(true) && y >= 0
; [eval] old(true)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
; [then-branch: 116 | False | live]
; [else-branch: 116 | True | live]
(push) ; 4
; [then-branch: 116 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 116 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
; [then-branch: 117 | !($t@88@01 >= 0) | live]
; [else-branch: 117 | $t@88@01 >= 0 | live]
(push) ; 4
; [then-branch: 117 | !($t@88@01 >= 0)]
(assert (not (>= $t@88@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 117 | $t@88@01 >= 0]
(assert (>= $t@88@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (or (not (>= $t@88@01 0)) (> $t@88@01 0))))
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
; [eval] !(old(true) && y >= 0) || y > 0
; [eval] !(old(true) && y >= 0)
; [eval] old(true) && y >= 0
; [eval] old(true)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
; [then-branch: 118 | False | live]
; [else-branch: 118 | True | live]
(push) ; 4
; [then-branch: 118 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 118 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
; [then-branch: 119 | !($t@88@01 >= 0) | live]
; [else-branch: 119 | $t@88@01 >= 0 | live]
(push) ; 4
; [then-branch: 119 | !($t@88@01 >= 0)]
(assert (not (>= $t@88@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 119 | $t@88@01 >= 0]
(assert (>= $t@88@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (or (not (>= $t@88@01 0)) (> $t@88@01 0))))
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
; [eval] !(old(true) && y >= 0) || y > 0
; [eval] !(old(true) && y >= 0)
; [eval] old(true) && y >= 0
; [eval] old(true)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
; [then-branch: 120 | False | live]
; [else-branch: 120 | True | live]
(push) ; 4
; [then-branch: 120 | False]
(assert false)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 120 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
; [then-branch: 121 | !($t@88@01 >= 0) | live]
; [else-branch: 121 | $t@88@01 >= 0 | live]
(push) ; 4
; [then-branch: 121 | !($t@88@01 >= 0)]
(assert (not (>= $t@88@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 121 | $t@88@01 >= 0]
(assert (>= $t@88@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (or (not (>= $t@88@01 0)) (> $t@88@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m4_e2 ----------
(declare-const r@91@01 $Ref)
(declare-const r@92@01 $Ref)
(push) ; 1
(declare-const $t@93@01 Int)
(assert (not (= r@92@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@94@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; var y: Int
(declare-const y@95@01 Int)
; [exec]
; y := r.v
(declare-const old_W12_T0@96@01 Int)
(declare-const old_W12_C@97@01 Bool)
(declare-const y@98@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@99@01 $Snap)
(assert (= $t@99@01 ($Snap.combine ($Snap.first $t@99@01) ($Snap.second $t@99@01))))
(assert (= ($Snap.second $t@99@01) $Snap.unit))
; [eval] y <= old(r.v)
; [eval] old(r.v)
(assert (<= y@98@01 $t@93@01))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] y <= old(r.v)
; [eval] old(r.v)
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@99@01 ($Snap.combine ($Snap.first $t@99@01) ($Snap.second $t@99@01))))
(assert (= ($Snap.second $t@99@01) $Snap.unit))
(assert (<= y@98@01 $t@93@01))
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
; [eval] y >= 0
(pop) ; 5
(push) ; 5
; [eval] !(y >= 0)
; [eval] y >= 0
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] y >= 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= y@98@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= y@98@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 122 | y@98@01 >= 0 | live]
; [else-branch: 122 | !(y@98@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 122 | y@98@01 >= 0]
(assert (>= y@98@01 0))
; [exec]
; var old_W12_T0: Int
(declare-const old_W12_T0@100@01 Int)
; [exec]
; var old_W12_C: Bool
(declare-const old_W12_C@101@01 Bool)
; [exec]
; old_W12_T0 := y
; [exec]
; old_W12_C := y > 0
; [eval] y > 0
(declare-const old_W12_C@102@01 Bool)
(assert (= old_W12_C@102@01 (> y@98@01 0)))
; [exec]
; y := y - 2
; [eval] y - 2
(declare-const y@103@01 Int)
(assert (= y@103@01 (- y@98@01 2)))
; [exec]
; assert !(old_W12_C && y >= 0) || y > 0
; [eval] !(old_W12_C && y >= 0) || y > 0
; [eval] !(old_W12_C && y >= 0)
; [eval] old_W12_C && y >= 0
(push) ; 6
; [then-branch: 123 | !(old_W12_C@102@01) | live]
; [else-branch: 123 | old_W12_C@102@01 | live]
(push) ; 7
; [then-branch: 123 | !(old_W12_C@102@01)]
(assert (not old_W12_C@102@01))
(pop) ; 7
(push) ; 7
; [else-branch: 123 | old_W12_C@102@01]
(assert old_W12_C@102@01)
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or old_W12_C@102@01 (not old_W12_C@102@01)))
(push) ; 6
; [then-branch: 124 | !(old_W12_C@102@01 && y@103@01 >= 0) | live]
; [else-branch: 124 | old_W12_C@102@01 && y@103@01 >= 0 | live]
(push) ; 7
; [then-branch: 124 | !(old_W12_C@102@01 && y@103@01 >= 0)]
(assert (not (and old_W12_C@102@01 (>= y@103@01 0))))
(pop) ; 7
(push) ; 7
; [else-branch: 124 | old_W12_C@102@01 && y@103@01 >= 0]
(assert (and old_W12_C@102@01 (>= y@103@01 0)))
; [eval] y > 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (and old_W12_C@102@01 (>= y@103@01 0))
  (not (and old_W12_C@102@01 (>= y@103@01 0)))))
(push) ; 6
(assert (not (or (not (and old_W12_C@102@01 (>= y@103@01 0))) (> y@103@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(old_W12_C && y >= 0) || y > 0
; [eval] !(old_W12_C && y >= 0)
; [eval] old_W12_C && y >= 0
(set-option :timeout 0)
(push) ; 6
; [then-branch: 125 | !(old_W12_C@102@01) | live]
; [else-branch: 125 | old_W12_C@102@01 | live]
(push) ; 7
; [then-branch: 125 | !(old_W12_C@102@01)]
(assert (not old_W12_C@102@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 125 | old_W12_C@102@01]
(assert old_W12_C@102@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 126 | !(old_W12_C@102@01 && y@103@01 >= 0) | live]
; [else-branch: 126 | old_W12_C@102@01 && y@103@01 >= 0 | live]
(push) ; 7
; [then-branch: 126 | !(old_W12_C@102@01 && y@103@01 >= 0)]
(assert (not (and old_W12_C@102@01 (>= y@103@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 126 | old_W12_C@102@01 && y@103@01 >= 0]
(assert (and old_W12_C@102@01 (>= y@103@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y > 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (or (not (and old_W12_C@102@01 (>= y@103@01 0))) (> y@103@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(old_W12_C && y >= 0) || y > 0
; [eval] !(old_W12_C && y >= 0)
; [eval] old_W12_C && y >= 0
(set-option :timeout 0)
(push) ; 6
; [then-branch: 127 | !(old_W12_C@102@01) | live]
; [else-branch: 127 | old_W12_C@102@01 | live]
(push) ; 7
; [then-branch: 127 | !(old_W12_C@102@01)]
(assert (not old_W12_C@102@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 127 | old_W12_C@102@01]
(assert old_W12_C@102@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 128 | !(old_W12_C@102@01 && y@103@01 >= 0) | live]
; [else-branch: 128 | old_W12_C@102@01 && y@103@01 >= 0 | live]
(push) ; 7
; [then-branch: 128 | !(old_W12_C@102@01 && y@103@01 >= 0)]
(assert (not (and old_W12_C@102@01 (>= y@103@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 128 | old_W12_C@102@01 && y@103@01 >= 0]
(assert (and old_W12_C@102@01 (>= y@103@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y > 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (or (not (and old_W12_C@102@01 (>= y@103@01 0))) (> y@103@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !(old_W12_C && y >= 0) || y > 0
; [eval] !(old_W12_C && y >= 0)
; [eval] old_W12_C && y >= 0
(set-option :timeout 0)
(push) ; 6
; [then-branch: 129 | !(old_W12_C@102@01) | live]
; [else-branch: 129 | old_W12_C@102@01 | live]
(push) ; 7
; [then-branch: 129 | !(old_W12_C@102@01)]
(assert (not old_W12_C@102@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 129 | old_W12_C@102@01]
(assert old_W12_C@102@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y >= 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
; [then-branch: 130 | !(old_W12_C@102@01 && y@103@01 >= 0) | live]
; [else-branch: 130 | old_W12_C@102@01 && y@103@01 >= 0 | live]
(push) ; 7
; [then-branch: 130 | !(old_W12_C@102@01 && y@103@01 >= 0)]
(assert (not (and old_W12_C@102@01 (>= y@103@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 130 | old_W12_C@102@01 && y@103@01 >= 0]
(assert (and old_W12_C@102@01 (>= y@103@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y > 0
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(assert (not (or (not (and old_W12_C@102@01 (>= y@103@01 0))) (> y@103@01 0))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
