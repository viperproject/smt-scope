(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/methods/basic/specOrder.vpr
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
(declare-const y@1@01 Int)
(declare-const res@2@01 Int)
(declare-const x@3@01 Int)
(declare-const y@4@01 Int)
(declare-const res@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] x > 0
(assert (> x@3@01 0))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] y > 0
(assert (> y@4@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
(pop) ; 2
(push) ; 2
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@4@01 x@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@4@01 x@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | y@4@01 >= x@3@01 | live]
; [else-branch: 0 | !(y@4@01 >= x@3@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | y@4@01 >= x@3@01]
(assert (>= y@4@01 x@3@01))
; [exec]
; res := 8
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(y@4@01 >= x@3@01)]
(assert (not (>= y@4@01 x@3@01)))
(pop) ; 3
; [eval] !(y >= x)
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@4@01 x@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@4@01 x@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(y@4@01 >= x@3@01) | live]
; [else-branch: 1 | y@4@01 >= x@3@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(y@4@01 >= x@3@01)]
(assert (not (>= y@4@01 x@3@01)))
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
; ---------- m2 ----------
(declare-const x@8@01 Int)
(declare-const y@9@01 Int)
(declare-const res@10@01 Int)
(declare-const x@11@01 Int)
(declare-const y@12@01 Int)
(declare-const res@13@01 Int)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] x > 0
(assert (> x@11@01 0))
(assert (= ($Snap.second $t@14@01) $Snap.unit))
; [eval] y > 0
(assert (> y@12@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
(pop) ; 2
(push) ; 2
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@12@01 x@11@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@12@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | y@12@01 >= x@11@01 | live]
; [else-branch: 2 | !(y@12@01 >= x@11@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | y@12@01 >= x@11@01]
(assert (>= y@12@01 x@11@01))
; [exec]
; res := 8
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(y@12@01 >= x@11@01)]
(assert (not (>= y@12@01 x@11@01)))
(pop) ; 3
; [eval] !(y >= x)
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@12@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@12@01 x@11@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(y@12@01 >= x@11@01) | live]
; [else-branch: 3 | y@12@01 >= x@11@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | !(y@12@01 >= x@11@01)]
(assert (not (>= y@12@01 x@11@01)))
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
; ---------- m3 ----------
(declare-const x@16@01 Int)
(declare-const y@17@01 Int)
(declare-const res@18@01 Int)
(declare-const x@19@01 Int)
(declare-const y@20@01 Int)
(declare-const res@21@01 Int)
(push) ; 1
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
(assert (= ($Snap.first $t@22@01) $Snap.unit))
; [eval] x > 0
(assert (> x@19@01 0))
(assert (= ($Snap.second $t@22@01) $Snap.unit))
; [eval] y > 0
(assert (> y@20@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
(pop) ; 2
(push) ; 2
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@20@01 x@19@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@20@01 x@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | y@20@01 >= x@19@01 | live]
; [else-branch: 4 | !(y@20@01 >= x@19@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | y@20@01 >= x@19@01]
(assert (>= y@20@01 x@19@01))
; [exec]
; res := 8
(pop) ; 3
(push) ; 3
; [else-branch: 4 | !(y@20@01 >= x@19@01)]
(assert (not (>= y@20@01 x@19@01)))
(pop) ; 3
; [eval] !(y >= x)
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@20@01 x@19@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@20@01 x@19@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(y@20@01 >= x@19@01) | live]
; [else-branch: 5 | y@20@01 >= x@19@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | !(y@20@01 >= x@19@01)]
(assert (not (>= y@20@01 x@19@01)))
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
; ---------- m4 ----------
(declare-const x@24@01 Int)
(declare-const y@25@01 Int)
(declare-const res@26@01 Int)
(declare-const x@27@01 Int)
(declare-const y@28@01 Int)
(declare-const res@29@01 Int)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.first $t@30@01) $Snap.unit))
; [eval] x > 0
(assert (> x@27@01 0))
(assert (= ($Snap.second $t@30@01) $Snap.unit))
; [eval] y > 0
(assert (> y@28@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
(pop) ; 2
(push) ; 2
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@28@01 x@27@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@28@01 x@27@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | y@28@01 >= x@27@01 | live]
; [else-branch: 6 | !(y@28@01 >= x@27@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | y@28@01 >= x@27@01]
(assert (>= y@28@01 x@27@01))
; [exec]
; res := 8
(pop) ; 3
(push) ; 3
; [else-branch: 6 | !(y@28@01 >= x@27@01)]
(assert (not (>= y@28@01 x@27@01)))
(pop) ; 3
; [eval] !(y >= x)
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@28@01 x@27@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@28@01 x@27@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(y@28@01 >= x@27@01) | live]
; [else-branch: 7 | y@28@01 >= x@27@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | !(y@28@01 >= x@27@01)]
(assert (not (>= y@28@01 x@27@01)))
; [exec]
; assert !old(y < x) || y < y
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [eval] y < x
(push) ; 4
; [then-branch: 8 | !(y@28@01 < x@27@01) | live]
; [else-branch: 8 | y@28@01 < x@27@01 | live]
(push) ; 5
; [then-branch: 8 | !(y@28@01 < x@27@01)]
(assert (not (< y@28@01 x@27@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | y@28@01 < x@27@01]
(assert (< y@28@01 x@27@01))
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (< y@28@01 x@27@01) (not (< y@28@01 x@27@01))))
(push) ; 4
(assert (not (not (< y@28@01 x@27@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | !(y@28@01 < x@27@01) | live]
; [else-branch: 9 | y@28@01 < x@27@01 | live]
(push) ; 5
; [then-branch: 9 | !(y@28@01 < x@27@01)]
(assert (not (< y@28@01 x@27@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | y@28@01 < x@27@01]
(assert (< y@28@01 x@27@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@28@01 x@27@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | !(y@28@01 < x@27@01) | live]
; [else-branch: 10 | y@28@01 < x@27@01 | live]
(push) ; 5
; [then-branch: 10 | !(y@28@01 < x@27@01)]
(assert (not (< y@28@01 x@27@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 10 | y@28@01 < x@27@01]
(assert (< y@28@01 x@27@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@28@01 x@27@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | !(y@28@01 < x@27@01) | live]
; [else-branch: 11 | y@28@01 < x@27@01 | live]
(push) ; 5
; [then-branch: 11 | !(y@28@01 < x@27@01)]
(assert (not (< y@28@01 x@27@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 11 | y@28@01 < x@27@01]
(assert (< y@28@01 x@27@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@28@01 x@27@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const x@32@01 Int)
(declare-const y@33@01 Int)
(declare-const res@34@01 Int)
(declare-const x@35@01 Int)
(declare-const y@36@01 Int)
(declare-const res@37@01 Int)
(push) ; 1
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 ($Snap.combine ($Snap.first $t@38@01) ($Snap.second $t@38@01))))
(assert (= ($Snap.first $t@38@01) $Snap.unit))
; [eval] x > 0
(assert (> x@35@01 0))
(assert (= ($Snap.second $t@38@01) $Snap.unit))
; [eval] y > 0
(assert (> y@36@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 $Snap.unit))
(pop) ; 2
(push) ; 2
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@36@01 x@35@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@36@01 x@35@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | y@36@01 >= x@35@01 | live]
; [else-branch: 12 | !(y@36@01 >= x@35@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | y@36@01 >= x@35@01]
(assert (>= y@36@01 x@35@01))
; [exec]
; res := 8
(pop) ; 3
(push) ; 3
; [else-branch: 12 | !(y@36@01 >= x@35@01)]
(assert (not (>= y@36@01 x@35@01)))
(pop) ; 3
; [eval] !(y >= x)
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@36@01 x@35@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@36@01 x@35@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(y@36@01 >= x@35@01) | live]
; [else-branch: 13 | y@36@01 >= x@35@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | !(y@36@01 >= x@35@01)]
(assert (not (>= y@36@01 x@35@01)))
; [exec]
; assert !old(y < x) || y < y
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [eval] y < x
(push) ; 4
; [then-branch: 14 | !(y@36@01 < x@35@01) | live]
; [else-branch: 14 | y@36@01 < x@35@01 | live]
(push) ; 5
; [then-branch: 14 | !(y@36@01 < x@35@01)]
(assert (not (< y@36@01 x@35@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | y@36@01 < x@35@01]
(assert (< y@36@01 x@35@01))
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (< y@36@01 x@35@01) (not (< y@36@01 x@35@01))))
(push) ; 4
(assert (not (not (< y@36@01 x@35@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | !(y@36@01 < x@35@01) | live]
; [else-branch: 15 | y@36@01 < x@35@01 | live]
(push) ; 5
; [then-branch: 15 | !(y@36@01 < x@35@01)]
(assert (not (< y@36@01 x@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 15 | y@36@01 < x@35@01]
(assert (< y@36@01 x@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@36@01 x@35@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | !(y@36@01 < x@35@01) | live]
; [else-branch: 16 | y@36@01 < x@35@01 | live]
(push) ; 5
; [then-branch: 16 | !(y@36@01 < x@35@01)]
(assert (not (< y@36@01 x@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 16 | y@36@01 < x@35@01]
(assert (< y@36@01 x@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@36@01 x@35@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | !(y@36@01 < x@35@01) | live]
; [else-branch: 17 | y@36@01 < x@35@01 | live]
(push) ; 5
; [then-branch: 17 | !(y@36@01 < x@35@01)]
(assert (not (< y@36@01 x@35@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 17 | y@36@01 < x@35@01]
(assert (< y@36@01 x@35@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@36@01 x@35@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m6 ----------
(declare-const x@40@01 Int)
(declare-const y@41@01 Int)
(declare-const res@42@01 Int)
(declare-const x@43@01 Int)
(declare-const y@44@01 Int)
(declare-const res@45@01 Int)
(push) ; 1
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (= ($Snap.first $t@46@01) $Snap.unit))
; [eval] x > 0
(assert (> x@43@01 0))
(assert (= ($Snap.second $t@46@01) $Snap.unit))
; [eval] y > 0
(assert (> y@44@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 $Snap.unit))
(pop) ; 2
(push) ; 2
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@44@01 x@43@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@44@01 x@43@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | y@44@01 >= x@43@01 | live]
; [else-branch: 18 | !(y@44@01 >= x@43@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 18 | y@44@01 >= x@43@01]
(assert (>= y@44@01 x@43@01))
; [exec]
; res := 8
(pop) ; 3
(push) ; 3
; [else-branch: 18 | !(y@44@01 >= x@43@01)]
(assert (not (>= y@44@01 x@43@01)))
(pop) ; 3
; [eval] !(y >= x)
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@44@01 x@43@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@44@01 x@43@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | !(y@44@01 >= x@43@01) | live]
; [else-branch: 19 | y@44@01 >= x@43@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 19 | !(y@44@01 >= x@43@01)]
(assert (not (>= y@44@01 x@43@01)))
; [exec]
; assert !old(y < x) || y < y
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [eval] y < x
(push) ; 4
; [then-branch: 20 | !(y@44@01 < x@43@01) | live]
; [else-branch: 20 | y@44@01 < x@43@01 | live]
(push) ; 5
; [then-branch: 20 | !(y@44@01 < x@43@01)]
(assert (not (< y@44@01 x@43@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | y@44@01 < x@43@01]
(assert (< y@44@01 x@43@01))
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (< y@44@01 x@43@01) (not (< y@44@01 x@43@01))))
(push) ; 4
(assert (not (not (< y@44@01 x@43@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | !(y@44@01 < x@43@01) | live]
; [else-branch: 21 | y@44@01 < x@43@01 | live]
(push) ; 5
; [then-branch: 21 | !(y@44@01 < x@43@01)]
(assert (not (< y@44@01 x@43@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 21 | y@44@01 < x@43@01]
(assert (< y@44@01 x@43@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@44@01 x@43@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | !(y@44@01 < x@43@01) | live]
; [else-branch: 22 | y@44@01 < x@43@01 | live]
(push) ; 5
; [then-branch: 22 | !(y@44@01 < x@43@01)]
(assert (not (< y@44@01 x@43@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 22 | y@44@01 < x@43@01]
(assert (< y@44@01 x@43@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@44@01 x@43@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] !old(y < x) || y < y
; [eval] !old(y < x)
; [eval] old(y < x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y < x
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | !(y@44@01 < x@43@01) | live]
; [else-branch: 23 | y@44@01 < x@43@01 | live]
(push) ; 5
; [then-branch: 23 | !(y@44@01 < x@43@01)]
(assert (not (< y@44@01 x@43@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 23 | y@44@01 < x@43@01]
(assert (< y@44@01 x@43@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y < y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (not (< y@44@01 x@43@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
