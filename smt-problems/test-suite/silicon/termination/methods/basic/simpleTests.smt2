(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/methods/basic/simpleTests.vpr
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
; ---------- m1 ----------
(declare-const x@0@01 Int)
(declare-const res@1@01 Int)
(declare-const x@2@01 Int)
(declare-const res@3@01 Int)
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
; [eval] x > -10
; [eval] -10
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@2@01 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@2@01 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@2@01 > -10 | live]
; [else-branch: 0 | !(x@2@01 > -10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@2@01 > -10]
(assert (> x@2@01 (- 0 10)))
; [exec]
; assert (decreasing(x - 1 + 10, old(x + 10)): Bool) &&
;   (bounded(old(x + 10)): Bool) ||
;   x - 1 + 10 == old(x + 10) && false
; [eval] (decreasing(x - 1 + 10, old(x + 10)): Bool) && (bounded(old(x + 10)): Bool) || x - 1 + 10 == old(x + 10) && false
; [eval] (decreasing(x - 1 + 10, old(x + 10)): Bool) && (bounded(old(x + 10)): Bool)
; [eval] (decreasing(x - 1 + 10, old(x + 10)): Bool)
; [eval] x - 1 + 10
; [eval] x - 1
; [eval] old(x + 10)
; [eval] x + 10
(push) ; 4
; [then-branch: 1 | !(decreasing[Bool](x@2@01 - 1 + 10, x@2@01 + 10)) | live]
; [else-branch: 1 | decreasing[Bool](x@2@01 - 1 + 10, x@2@01 + 10) | live]
(push) ; 5
; [then-branch: 1 | !(decreasing[Bool](x@2@01 - 1 + 10, x@2@01 + 10))]
(assert (not (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | decreasing[Bool](x@2@01 - 1 + 10, x@2@01 + 10)]
(assert (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10)))
; [eval] (bounded(old(x + 10)): Bool)
; [eval] old(x + 10)
; [eval] x + 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
  (not (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10)))))
(push) ; 4
; [then-branch: 2 | decreasing[Bool](x@2@01 - 1 + 10, x@2@01 + 10) && bounded[Bool](x@2@01 + 10) | live]
; [else-branch: 2 | !(decreasing[Bool](x@2@01 - 1 + 10, x@2@01 + 10) && bounded[Bool](x@2@01 + 10)) | live]
(push) ; 5
; [then-branch: 2 | decreasing[Bool](x@2@01 - 1 + 10, x@2@01 + 10) && bounded[Bool](x@2@01 + 10)]
(assert (and
  (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
  (bounded<Bool> (+ x@2@01 10))))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(decreasing[Bool](x@2@01 - 1 + 10, x@2@01 + 10) && bounded[Bool](x@2@01 + 10))]
(assert (not
  (and
    (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
    (bounded<Bool> (+ x@2@01 10)))))
; [eval] x - 1 + 10 == old(x + 10) && false
; [eval] x - 1 + 10 == old(x + 10)
; [eval] x - 1 + 10
; [eval] x - 1
; [eval] old(x + 10)
; [eval] x + 10
(push) ; 6
; [then-branch: 3 | x@2@01 - 1 + 10 != x@2@01 + 10 | live]
; [else-branch: 3 | x@2@01 - 1 + 10 == x@2@01 + 10 | live]
(push) ; 7
; [then-branch: 3 | x@2@01 - 1 + 10 != x@2@01 + 10]
(assert (not (= (+ (- x@2@01 1) 10) (+ x@2@01 10))))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | x@2@01 - 1 + 10 == x@2@01 + 10]
(assert (= (+ (- x@2@01 1) 10) (+ x@2@01 10)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (= (+ (- x@2@01 1) 10) (+ x@2@01 10))
  (not (= (+ (- x@2@01 1) 10) (+ x@2@01 10)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not
    (and
      (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
      (bounded<Bool> (+ x@2@01 10))))
  (and
    (not
      (and
        (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
        (bounded<Bool> (+ x@2@01 10))))
    (or
      (= (+ (- x@2@01 1) 10) (+ x@2@01 10))
      (not (= (+ (- x@2@01 1) 10) (+ x@2@01 10)))))))
(assert (or
  (not
    (and
      (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
      (bounded<Bool> (+ x@2@01 10))))
  (and
    (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
    (bounded<Bool> (+ x@2@01 10)))))
(push) ; 4
(assert (not (and
  (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
  (bounded<Bool> (+ x@2@01 10)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and
  (decreasing<Bool> (+ (- x@2@01 1) 10) (+ x@2@01 10))
  (bounded<Bool> (+ x@2@01 10))))
; [exec]
; res := m1(x - 1)
; [eval] x - 1
(declare-const res@4@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | !(x@2@01 > -10)]
(assert (not (> x@2@01 (- 0 10))))
(pop) ; 3
; [eval] !(x > -10)
; [eval] x > -10
; [eval] -10
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@2@01 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@2@01 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(x@2@01 > -10) | live]
; [else-branch: 4 | x@2@01 > -10 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | !(x@2@01 > -10)]
(assert (not (> x@2@01 (- 0 10))))
; [exec]
; res := 6
(pop) ; 3
(push) ; 3
; [else-branch: 4 | x@2@01 > -10]
(assert (> x@2@01 (- 0 10)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const x@5@01 Int)
(declare-const y@6@01 Int)
(declare-const res@7@01 Int)
(declare-const x@8@01 Int)
(declare-const y@9@01 Int)
(declare-const res@10@01 Int)
(push) ; 1
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (= ($Snap.first $t@11@01) $Snap.unit))
; [eval] x > 0
(assert (> x@8@01 0))
(assert (= ($Snap.second $t@11@01) $Snap.unit))
; [eval] y > 0
(assert (> y@9@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@9@01 x@8@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@9@01 x@8@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | y@9@01 >= x@8@01 | live]
; [else-branch: 5 | !(y@9@01 >= x@8@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | y@9@01 >= x@8@01]
(assert (>= y@9@01 x@8@01))
; [exec]
; res := 8
(pop) ; 3
(push) ; 3
; [else-branch: 5 | !(y@9@01 >= x@8@01)]
(assert (not (>= y@9@01 x@8@01)))
(pop) ; 3
; [eval] !(y >= x)
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@9@01 x@8@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@9@01 x@8@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(y@9@01 >= x@8@01) | live]
; [else-branch: 6 | y@9@01 >= x@8@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | !(y@9@01 >= x@8@01)]
(assert (not (>= y@9@01 x@8@01)))
; [exec]
; assert (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) ||
;   y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool) || y == old(x) && false
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(y, old(x)): Bool)
; [eval] old(x)
(push) ; 4
; [then-branch: 7 | !(decreasing[Bool](y@9@01, x@8@01)) | live]
; [else-branch: 7 | decreasing[Bool](y@9@01, x@8@01) | live]
(push) ; 5
; [then-branch: 7 | !(decreasing[Bool](y@9@01, x@8@01))]
(assert (not (decreasing<Bool> y@9@01 x@8@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | decreasing[Bool](y@9@01, x@8@01)]
(assert (decreasing<Bool> y@9@01 x@8@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@9@01 x@8@01) (not (decreasing<Bool> y@9@01 x@8@01))))
(push) ; 4
; [then-branch: 8 | decreasing[Bool](y@9@01, x@8@01) && bounded[Bool](x@8@01) | live]
; [else-branch: 8 | !(decreasing[Bool](y@9@01, x@8@01) && bounded[Bool](x@8@01)) | live]
(push) ; 5
; [then-branch: 8 | decreasing[Bool](y@9@01, x@8@01) && bounded[Bool](x@8@01)]
(assert (and (decreasing<Bool> y@9@01 x@8@01) (bounded<Bool> x@8@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(decreasing[Bool](y@9@01, x@8@01) && bounded[Bool](x@8@01))]
(assert (not (and (decreasing<Bool> y@9@01 x@8@01) (bounded<Bool> x@8@01))))
; [eval] y == old(x) && false
; [eval] y == old(x)
; [eval] old(x)
(push) ; 6
; [then-branch: 9 | y@9@01 != x@8@01 | live]
; [else-branch: 9 | y@9@01 == x@8@01 | live]
(push) ; 7
; [then-branch: 9 | y@9@01 != x@8@01]
(assert (not (= y@9@01 x@8@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 9 | y@9@01 == x@8@01]
(assert (= y@9@01 x@8@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= y@9@01 x@8@01) (not (= y@9@01 x@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> y@9@01 x@8@01) (bounded<Bool> x@8@01)))
  (and
    (not (and (decreasing<Bool> y@9@01 x@8@01) (bounded<Bool> x@8@01)))
    (or (= y@9@01 x@8@01) (not (= y@9@01 x@8@01))))))
(assert (or
  (not (and (decreasing<Bool> y@9@01 x@8@01) (bounded<Bool> x@8@01)))
  (and (decreasing<Bool> y@9@01 x@8@01) (bounded<Bool> x@8@01))))
(push) ; 4
(assert (not (and (decreasing<Bool> y@9@01 x@8@01) (bounded<Bool> x@8@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and (decreasing<Bool> y@9@01 x@8@01) (bounded<Bool> x@8@01)))
; [exec]
; res := m2(y, y)
; [eval] x > 0
; [eval] y > 0
(declare-const res@12@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 6 | y@9@01 >= x@8@01]
(assert (>= y@9@01 x@8@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const x@13@01 Int)
(declare-const y@14@01 Int)
(declare-const res@15@01 Int)
(declare-const x@16@01 Int)
(declare-const y@17@01 Int)
(declare-const res@18@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] x < 5 || y < 8
; [eval] x < 5
(push) ; 3
; [then-branch: 10 | x@16@01 < 5 | live]
; [else-branch: 10 | !(x@16@01 < 5) | live]
(push) ; 4
; [then-branch: 10 | x@16@01 < 5]
(assert (< x@16@01 5))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(x@16@01 < 5)]
(assert (not (< x@16@01 5)))
; [eval] y < 8
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< x@16@01 5)) (< x@16@01 5)))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (or (< x@16@01 5) (< y@17@01 8)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (or (< x@16@01 5) (< y@17@01 8))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | x@16@01 < 5 || y@17@01 < 8 | live]
; [else-branch: 11 | !(x@16@01 < 5 || y@17@01 < 8) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | x@16@01 < 5 || y@17@01 < 8]
(assert (or (< x@16@01 5) (< y@17@01 8)))
; [exec]
; res := 10
(pop) ; 3
(push) ; 3
; [else-branch: 11 | !(x@16@01 < 5 || y@17@01 < 8)]
(assert (not (or (< x@16@01 5) (< y@17@01 8))))
(pop) ; 3
; [eval] !(x < 5 || y < 8)
; [eval] x < 5 || y < 8
; [eval] x < 5
(push) ; 3
; [then-branch: 12 | x@16@01 < 5 | live]
; [else-branch: 12 | !(x@16@01 < 5) | live]
(push) ; 4
; [then-branch: 12 | x@16@01 < 5]
(assert (< x@16@01 5))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | !(x@16@01 < 5)]
(assert (not (< x@16@01 5)))
; [eval] y < 8
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (or (< x@16@01 5) (< y@17@01 8))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (or (< x@16@01 5) (< y@17@01 8)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(x@16@01 < 5 || y@17@01 < 8) | live]
; [else-branch: 13 | x@16@01 < 5 || y@17@01 < 8 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | !(x@16@01 < 5 || y@17@01 < 8)]
(assert (not (or (< x@16@01 5) (< y@17@01 8))))
; [exec]
; assert (decreasing(x - 2, old(x)): Bool) && (bounded(old(x)): Bool) ||
;   x - 2 == old(x) &&
;   ((decreasing(y - 3, old(y)): Bool) && (bounded(old(y)): Bool) ||
;   y - 3 == old(y) && false)
; [eval] (decreasing(x - 2, old(x)): Bool) && (bounded(old(x)): Bool) || x - 2 == old(x) && ((decreasing(y - 3, old(y)): Bool) && (bounded(old(y)): Bool) || y - 3 == old(y) && false)
; [eval] (decreasing(x - 2, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 2, old(x)): Bool)
; [eval] x - 2
; [eval] old(x)
(push) ; 4
; [then-branch: 14 | !(decreasing[Bool](x@16@01 - 2, x@16@01)) | live]
; [else-branch: 14 | decreasing[Bool](x@16@01 - 2, x@16@01) | live]
(push) ; 5
; [then-branch: 14 | !(decreasing[Bool](x@16@01 - 2, x@16@01))]
(assert (not (decreasing<Bool> (- x@16@01 2) x@16@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | decreasing[Bool](x@16@01 - 2, x@16@01)]
(assert (decreasing<Bool> (- x@16@01 2) x@16@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- x@16@01 2) x@16@01)
  (not (decreasing<Bool> (- x@16@01 2) x@16@01))))
(push) ; 4
; [then-branch: 15 | decreasing[Bool](x@16@01 - 2, x@16@01) && bounded[Bool](x@16@01) | live]
; [else-branch: 15 | !(decreasing[Bool](x@16@01 - 2, x@16@01) && bounded[Bool](x@16@01)) | live]
(push) ; 5
; [then-branch: 15 | decreasing[Bool](x@16@01 - 2, x@16@01) && bounded[Bool](x@16@01)]
(assert (and (decreasing<Bool> (- x@16@01 2) x@16@01) (bounded<Bool> x@16@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(decreasing[Bool](x@16@01 - 2, x@16@01) && bounded[Bool](x@16@01))]
(assert (not (and (decreasing<Bool> (- x@16@01 2) x@16@01) (bounded<Bool> x@16@01))))
; [eval] x - 2 == old(x) && ((decreasing(y - 3, old(y)): Bool) && (bounded(old(y)): Bool) || y - 3 == old(y) && false)
; [eval] x - 2 == old(x)
; [eval] x - 2
; [eval] old(x)
(push) ; 6
; [then-branch: 16 | x@16@01 - 2 != x@16@01 | live]
; [else-branch: 16 | x@16@01 - 2 == x@16@01 | live]
(push) ; 7
; [then-branch: 16 | x@16@01 - 2 != x@16@01]
(assert (not (= (- x@16@01 2) x@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 16 | x@16@01 - 2 == x@16@01]
(assert (= (- x@16@01 2) x@16@01))
; [eval] (decreasing(y - 3, old(y)): Bool) && (bounded(old(y)): Bool) || y - 3 == old(y) && false
; [eval] (decreasing(y - 3, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] (decreasing(y - 3, old(y)): Bool)
; [eval] y - 3
; [eval] old(y)
(push) ; 8
; [then-branch: 17 | !(decreasing[Bool](y@17@01 - 3, y@17@01)) | live]
; [else-branch: 17 | decreasing[Bool](y@17@01 - 3, y@17@01) | live]
(push) ; 9
; [then-branch: 17 | !(decreasing[Bool](y@17@01 - 3, y@17@01))]
(assert (not (decreasing<Bool> (- y@17@01 3) y@17@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 17 | decreasing[Bool](y@17@01 - 3, y@17@01)]
(assert (decreasing<Bool> (- y@17@01 3) y@17@01))
; [eval] (bounded(old(y)): Bool)
; [eval] old(y)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- y@17@01 3) y@17@01)
  (not (decreasing<Bool> (- y@17@01 3) y@17@01))))
(push) ; 8
; [then-branch: 18 | decreasing[Bool](y@17@01 - 3, y@17@01) && bounded[Bool](y@17@01) | live]
; [else-branch: 18 | !(decreasing[Bool](y@17@01 - 3, y@17@01) && bounded[Bool](y@17@01)) | live]
(push) ; 9
; [then-branch: 18 | decreasing[Bool](y@17@01 - 3, y@17@01) && bounded[Bool](y@17@01)]
(assert (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 18 | !(decreasing[Bool](y@17@01 - 3, y@17@01) && bounded[Bool](y@17@01))]
(assert (not (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01))))
; [eval] y - 3 == old(y) && false
; [eval] y - 3 == old(y)
; [eval] y - 3
; [eval] old(y)
(push) ; 10
; [then-branch: 19 | y@17@01 - 3 != y@17@01 | live]
; [else-branch: 19 | y@17@01 - 3 == y@17@01 | live]
(push) ; 11
; [then-branch: 19 | y@17@01 - 3 != y@17@01]
(assert (not (= (- y@17@01 3) y@17@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 19 | y@17@01 - 3 == y@17@01]
(assert (= (- y@17@01 3) y@17@01))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (= (- y@17@01 3) y@17@01) (not (= (- y@17@01 3) y@17@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))
  (and
    (not (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))
    (or (= (- y@17@01 3) y@17@01) (not (= (- y@17@01 3) y@17@01))))))
(assert (or
  (not (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))
  (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (- x@16@01 2) x@16@01)
  (and
    (= (- x@16@01 2) x@16@01)
    (or
      (decreasing<Bool> (- y@17@01 3) y@17@01)
      (not (decreasing<Bool> (- y@17@01 3) y@17@01)))
    (=>
      (not
        (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))
      (and
        (not
          (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))
        (or (= (- y@17@01 3) y@17@01) (not (= (- y@17@01 3) y@17@01)))))
    (or
      (not
        (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))
      (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01))))))
(assert (or (= (- x@16@01 2) x@16@01) (not (= (- x@16@01 2) x@16@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> (- x@16@01 2) x@16@01) (bounded<Bool> x@16@01)))
  (and
    (not (and (decreasing<Bool> (- x@16@01 2) x@16@01) (bounded<Bool> x@16@01)))
    (=>
      (= (- x@16@01 2) x@16@01)
      (and
        (= (- x@16@01 2) x@16@01)
        (or
          (decreasing<Bool> (- y@17@01 3) y@17@01)
          (not (decreasing<Bool> (- y@17@01 3) y@17@01)))
        (=>
          (not
            (and
              (decreasing<Bool> (- y@17@01 3) y@17@01)
              (bounded<Bool> y@17@01)))
          (and
            (not
              (and
                (decreasing<Bool> (- y@17@01 3) y@17@01)
                (bounded<Bool> y@17@01)))
            (or (= (- y@17@01 3) y@17@01) (not (= (- y@17@01 3) y@17@01)))))
        (or
          (not
            (and
              (decreasing<Bool> (- y@17@01 3) y@17@01)
              (bounded<Bool> y@17@01)))
          (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))))
    (or (= (- x@16@01 2) x@16@01) (not (= (- x@16@01 2) x@16@01))))))
(assert (or
  (not (and (decreasing<Bool> (- x@16@01 2) x@16@01) (bounded<Bool> x@16@01)))
  (and (decreasing<Bool> (- x@16@01 2) x@16@01) (bounded<Bool> x@16@01))))
(push) ; 4
(assert (not (or
  (and (decreasing<Bool> (- x@16@01 2) x@16@01) (bounded<Bool> x@16@01))
  (and
    (= (- x@16@01 2) x@16@01)
    (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or
  (and (decreasing<Bool> (- x@16@01 2) x@16@01) (bounded<Bool> x@16@01))
  (and
    (= (- x@16@01 2) x@16@01)
    (and (decreasing<Bool> (- y@17@01 3) y@17@01) (bounded<Bool> y@17@01)))))
; [exec]
; res := m3(x - 2, y - 3)
; [eval] x - 2
; [eval] y - 3
(declare-const res@19@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 13 | x@16@01 < 5 || y@17@01 < 8]
(assert (or (< x@16@01 5) (< y@17@01 8)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
