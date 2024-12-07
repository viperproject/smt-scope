(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:47
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/simpleTests.vpr
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
(declare-fun fun2 ($Snap Int) Int)
(declare-fun fun2%limited ($Snap Int) Int)
(declare-fun fun2%stateless (Int) Bool)
(declare-fun fun2%precondition ($Snap Int) Bool)
(declare-fun fun5 ($Snap Int) Int)
(declare-fun fun5%limited ($Snap Int) Int)
(declare-fun fun5%stateless (Int) Bool)
(declare-fun fun5%precondition ($Snap Int) Bool)
(declare-fun fun6 ($Snap Int) Int)
(declare-fun fun6%limited ($Snap Int) Int)
(declare-fun fun6%stateless (Int) Bool)
(declare-fun fun6%precondition ($Snap Int) Bool)
(declare-fun fun1 ($Snap Int) Int)
(declare-fun fun1%limited ($Snap Int) Int)
(declare-fun fun1%stateless (Int) Bool)
(declare-fun fun1%precondition ($Snap Int) Bool)
(declare-fun fun4 ($Snap Int Int) Int)
(declare-fun fun4%limited ($Snap Int Int) Int)
(declare-fun fun4%stateless (Int Int) Bool)
(declare-fun fun4%precondition ($Snap Int Int) Bool)
(declare-fun fun3 ($Snap Int Int) Int)
(declare-fun fun3%limited ($Snap Int Int) Int)
(declare-fun fun3%stateless (Int Int) Bool)
(declare-fun fun3%precondition ($Snap Int Int) Bool)
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
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (= (fun2%limited s@$ x@0@00) (fun2 s@$ x@0@00))
  :pattern ((fun2 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (fun2%stateless x@0@00)
  :pattern ((fun2%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (fun2%precondition s@$ x@0@00)
    (=
      (fun2 s@$ x@0@00)
      (ite
        (> x@0@00 5)
        (ite
          (> x@0@00 10)
          (fun2%limited $Snap.unit (- x@0@00 2))
          (fun2%limited $Snap.unit (- x@0@00 1)))
        1)))
  :pattern ((fun2 s@$ x@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (fun2%precondition s@$ x@0@00)
    (ite
      (> x@0@00 5)
      (ite
        (> x@0@00 10)
        (fun2%precondition $Snap.unit (- x@0@00 2))
        (fun2%precondition $Snap.unit (- x@0@00 1)))
      true))
  :pattern ((fun2 s@$ x@0@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (= (fun5%limited s@$ x@2@00) (fun5 s@$ x@2@00))
  :pattern ((fun5 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (fun5%stateless x@2@00)
  :pattern ((fun5%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (fun5%precondition s@$ x@2@00)
    (=
      (fun5 s@$ x@2@00)
      (ite (< x@2@00 10) (fun5%limited $Snap.unit (+ x@2@00 2)) 7)))
  :pattern ((fun5 s@$ x@2@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (fun5%precondition s@$ x@2@00)
    (ite (< x@2@00 10) (fun5%precondition $Snap.unit (+ x@2@00 2)) true))
  :pattern ((fun5 s@$ x@2@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (= (fun6%limited s@$ x@4@00) (fun6 s@$ x@4@00))
  :pattern ((fun6 s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (fun6%stateless x@4@00)
  :pattern ((fun6%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (fun6%precondition s@$ x@4@00)
    (=
      (fun6 s@$ x@4@00)
      (ite (< x@4@00 0) 0 (fun6%limited $Snap.unit (- x@4@00 1)))))
  :pattern ((fun6 s@$ x@4@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (fun6%precondition s@$ x@4@00)
    (ite (< x@4@00 0) true (fun6%precondition $Snap.unit (- x@4@00 1))))
  :pattern ((fun6 s@$ x@4@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (= (fun1%limited s@$ x@6@00) (fun1 s@$ x@6@00))
  :pattern ((fun1 s@$ x@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (fun1%stateless x@6@00)
  :pattern ((fun1%limited s@$ x@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (=>
    (fun1%precondition s@$ x@6@00)
    (=
      (fun1 s@$ x@6@00)
      (ite (> x@6@00 (- 0 10)) (fun1%limited $Snap.unit (- x@6@00 1)) 6)))
  :pattern ((fun1 s@$ x@6@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (=>
    (fun1%precondition s@$ x@6@00)
    (ite (> x@6@00 (- 0 10)) (fun1%precondition $Snap.unit (- x@6@00 1)) true))
  :pattern ((fun1 s@$ x@6@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int) (y@9@00 Int)) (!
  (= (fun4%limited s@$ x@8@00 y@9@00) (fun4 s@$ x@8@00 y@9@00))
  :pattern ((fun4 s@$ x@8@00 y@9@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int) (y@9@00 Int)) (!
  (fun4%stateless x@8@00 y@9@00)
  :pattern ((fun4%limited s@$ x@8@00 y@9@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int) (y@9@00 Int)) (!
  (=>
    (fun4%precondition s@$ x@8@00 y@9@00)
    (=
      (fun4 s@$ x@8@00 y@9@00)
      (ite
        (or (< x@8@00 5) (< y@9@00 8))
        10
        (fun4%limited $Snap.unit (- x@8@00 2) (- y@9@00 3)))))
  :pattern ((fun4 s@$ x@8@00 y@9@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int) (y@9@00 Int)) (!
  (=>
    (fun4%precondition s@$ x@8@00 y@9@00)
    (ite
      (or (< x@8@00 5) (< y@9@00 8))
      true
      (fun4%precondition $Snap.unit (- x@8@00 2) (- y@9@00 3))))
  :pattern ((fun4 s@$ x@8@00 y@9@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (x@11@00 Int) (y@12@00 Int)) (!
  (= (fun3%limited s@$ x@11@00 y@12@00) (fun3 s@$ x@11@00 y@12@00))
  :pattern ((fun3 s@$ x@11@00 y@12@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@11@00 Int) (y@12@00 Int)) (!
  (fun3%stateless x@11@00 y@12@00)
  :pattern ((fun3%limited s@$ x@11@00 y@12@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (x@11@00 Int) (y@12@00 Int)) (!
  (=>
    (fun3%precondition s@$ x@11@00 y@12@00)
    (=
      (fun3 s@$ x@11@00 y@12@00)
      (ite
        (>= y@12@00 x@11@00)
        8
        (fun3%limited ($Snap.combine $Snap.unit $Snap.unit) y@12@00 y@12@00))))
  :pattern ((fun3 s@$ x@11@00 y@12@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (x@11@00 Int) (y@12@00 Int)) (!
  (=>
    (fun3%precondition s@$ x@11@00 y@12@00)
    (ite
      (>= y@12@00 x@11@00)
      true
      (fun3%precondition ($Snap.combine $Snap.unit $Snap.unit) y@12@00 y@12@00)))
  :pattern ((fun3 s@$ x@11@00 y@12@00))
  :qid |quant-u-23|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- fun1_termination_proof ----------
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
; [eval] x > -10
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@1@01 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@1@01 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@1@01 > -10 | live]
; [else-branch: 0 | !(x@1@01 > -10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@1@01 > -10]
(assert (> x@1@01 (- 0 10)))
; [exec]
; assert (decreasing(x - 1 + 10, old(x + 10)): Bool) &&
;   (bounded(old(x + 10)): Bool)
; [eval] (decreasing(x - 1 + 10, old(x + 10)): Bool)
; [eval] x - 1 + 10
; [eval] x - 1
; [eval] old(x + 10)
; [eval] x + 10
(push) ; 4
(assert (not (decreasing<Bool> (+ (- x@1@01 1) 10) (+ x@1@01 10))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (+ (- x@1@01 1) 10) (+ x@1@01 10)))
; [eval] (bounded(old(x + 10)): Bool)
; [eval] old(x + 10)
; [eval] x + 10
(push) ; 4
(assert (not (bounded<Bool> (+ x@1@01 10))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> (+ x@1@01 10)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(x@1@01 > -10)]
(assert (not (> x@1@01 (- 0 10))))
(pop) ; 3
; [eval] !(x > -10)
; [eval] x > -10
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@1@01 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@1@01 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(x@1@01 > -10) | live]
; [else-branch: 1 | x@1@01 > -10 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(x@1@01 > -10)]
(assert (not (> x@1@01 (- 0 10))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | x@1@01 > -10]
(assert (> x@1@01 (- 0 10)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- fun2_termination_proof ----------
(declare-const x@2@01 Int)
(declare-const x@3@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] x > 5
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@3@01 5))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@3@01 5)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@3@01 > 5 | live]
; [else-branch: 2 | !(x@3@01 > 5) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | x@3@01 > 5]
(assert (> x@3@01 5))
; [eval] x > 10
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> x@3@01 10))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> x@3@01 10)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | x@3@01 > 10 | live]
; [else-branch: 3 | !(x@3@01 > 10) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | x@3@01 > 10]
(assert (> x@3@01 10))
; [exec]
; assert (decreasing(x - 2 + (x - 2), old(x + x)): Bool) &&
;   (bounded(old(x + x)): Bool)
; [eval] (decreasing(x - 2 + (x - 2), old(x + x)): Bool)
; [eval] x - 2 + (x - 2)
; [eval] x - 2
; [eval] x - 2
; [eval] old(x + x)
; [eval] x + x
(push) ; 5
(assert (not (decreasing<Bool> (+ (- x@3@01 2) (- x@3@01 2)) (+ x@3@01 x@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (+ (- x@3@01 2) (- x@3@01 2)) (+ x@3@01 x@3@01)))
; [eval] (bounded(old(x + x)): Bool)
; [eval] old(x + x)
; [eval] x + x
(push) ; 5
(assert (not (bounded<Bool> (+ x@3@01 x@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> (+ x@3@01 x@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(x@3@01 > 10)]
(assert (not (> x@3@01 10)))
(pop) ; 4
; [eval] !(x > 10)
; [eval] x > 10
(push) ; 4
(set-option :timeout 10)
(assert (not (> x@3@01 10)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> x@3@01 10))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(x@3@01 > 10) | live]
; [else-branch: 4 | x@3@01 > 10 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | !(x@3@01 > 10)]
(assert (not (> x@3@01 10)))
; [exec]
; assert (decreasing(x - 1 + (x - 1), old(x + x)): Bool) &&
;   (bounded(old(x + x)): Bool)
; [eval] (decreasing(x - 1 + (x - 1), old(x + x)): Bool)
; [eval] x - 1 + (x - 1)
; [eval] x - 1
; [eval] x - 1
; [eval] old(x + x)
; [eval] x + x
(push) ; 5
(assert (not (decreasing<Bool> (+ (- x@3@01 1) (- x@3@01 1)) (+ x@3@01 x@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (+ (- x@3@01 1) (- x@3@01 1)) (+ x@3@01 x@3@01)))
; [eval] (bounded(old(x + x)): Bool)
; [eval] old(x + x)
; [eval] x + x
(push) ; 5
(assert (not (bounded<Bool> (+ x@3@01 x@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> (+ x@3@01 x@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | x@3@01 > 10]
(assert (> x@3@01 10))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(x@3@01 > 5)]
(assert (not (> x@3@01 5)))
(pop) ; 3
; [eval] !(x > 5)
; [eval] x > 5
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@3@01 5)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@3@01 5))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(x@3@01 > 5) | live]
; [else-branch: 5 | x@3@01 > 5 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | !(x@3@01 > 5)]
(assert (not (> x@3@01 5)))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | x@3@01 > 5]
(assert (> x@3@01 5))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- fun3_termination_proof ----------
(declare-const x@4@01 Int)
(declare-const y@5@01 Int)
(declare-const x@6@01 Int)
(declare-const y@7@01 Int)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] x > 0
(assert (> x@6@01 0))
(assert (= ($Snap.second $t@8@01) $Snap.unit))
; [eval] y > 0
(assert (> y@7@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(y >= x)
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@7@01 x@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@7@01 x@6@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(y@7@01 >= x@6@01) | live]
; [else-branch: 6 | y@7@01 >= x@6@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | !(y@7@01 >= x@6@01)]
(assert (not (>= y@7@01 x@6@01)))
; [exec]
; assert (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(y, old(x)): Bool)
; [eval] old(x)
(push) ; 4
(assert (not (decreasing<Bool> y@7@01 x@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> y@7@01 x@6@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(push) ; 4
(assert (not (bounded<Bool> x@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> x@6@01))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | y@7@01 >= x@6@01]
(assert (>= y@7@01 x@6@01))
(pop) ; 3
; [eval] y >= x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (>= y@7@01 x@6@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>= y@7@01 x@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | y@7@01 >= x@6@01 | live]
; [else-branch: 7 | !(y@7@01 >= x@6@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | y@7@01 >= x@6@01]
(assert (>= y@7@01 x@6@01))
(pop) ; 3
(push) ; 3
; [else-branch: 7 | !(y@7@01 >= x@6@01)]
(assert (not (>= y@7@01 x@6@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- fun3_pres_termination_proof ----------
(declare-const x@9@01 Int)
(declare-const y@10@01 Int)
(declare-const x@11@01 Int)
(declare-const y@12@01 Int)
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
; var $condInEx: Bool
(declare-const $condInEx@13@01 Bool)
; [exec]
; var b: Bool
(declare-const b@14@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@14@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@14@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | b@14@01 | live]
; [else-branch: 8 | !(b@14@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | b@14@01]
(assert b@14@01)
; [exec]
; inhale false
(pop) ; 3
(push) ; 3
; [else-branch: 8 | !(b@14@01)]
(assert (not b@14@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@14@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@14@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | !(b@14@01) | live]
; [else-branch: 9 | b@14@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | !(b@14@01)]
(assert (not b@14@01))
; [exec]
; inhale x > 0
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] x > 0
(assert (> x@11@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 9 | b@14@01]
(assert b@14@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- fun4_termination_proof ----------
(declare-const x@16@01 Int)
(declare-const y@17@01 Int)
(declare-const x@18@01 Int)
(declare-const y@19@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(x < 5 || y < 8)
; [eval] x < 5 || y < 8
; [eval] x < 5
(push) ; 3
; [then-branch: 10 | x@18@01 < 5 | live]
; [else-branch: 10 | !(x@18@01 < 5) | live]
(push) ; 4
; [then-branch: 10 | x@18@01 < 5]
(assert (< x@18@01 5))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(x@18@01 < 5)]
(assert (not (< x@18@01 5)))
; [eval] y < 8
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (< x@18@01 5)) (< x@18@01 5)))
(push) ; 3
(set-option :timeout 10)
(assert (not (or (< x@18@01 5) (< y@19@01 8))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (or (< x@18@01 5) (< y@19@01 8)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | !(x@18@01 < 5 || y@19@01 < 8) | live]
; [else-branch: 11 | x@18@01 < 5 || y@19@01 < 8 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | !(x@18@01 < 5 || y@19@01 < 8)]
(assert (not (or (< x@18@01 5) (< y@19@01 8))))
; [exec]
; assert (decreasing(x - 2, old(x)): Bool) && (bounded(old(x)): Bool) ||
;   x - 2 == old(x) &&
;   ((decreasing(y - 3, old(y)): Bool) && (bounded(old(y)): Bool))
; [eval] (decreasing(x - 2, old(x)): Bool) && (bounded(old(x)): Bool) || x - 2 == old(x) && ((decreasing(y - 3, old(y)): Bool) && (bounded(old(y)): Bool))
; [eval] (decreasing(x - 2, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 2, old(x)): Bool)
; [eval] x - 2
; [eval] old(x)
(push) ; 4
; [then-branch: 12 | !(decreasing[Bool](x@18@01 - 2, x@18@01)) | live]
; [else-branch: 12 | decreasing[Bool](x@18@01 - 2, x@18@01) | live]
(push) ; 5
; [then-branch: 12 | !(decreasing[Bool](x@18@01 - 2, x@18@01))]
(assert (not (decreasing<Bool> (- x@18@01 2) x@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | decreasing[Bool](x@18@01 - 2, x@18@01)]
(assert (decreasing<Bool> (- x@18@01 2) x@18@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- x@18@01 2) x@18@01)
  (not (decreasing<Bool> (- x@18@01 2) x@18@01))))
(push) ; 4
; [then-branch: 13 | decreasing[Bool](x@18@01 - 2, x@18@01) && bounded[Bool](x@18@01) | live]
; [else-branch: 13 | !(decreasing[Bool](x@18@01 - 2, x@18@01) && bounded[Bool](x@18@01)) | live]
(push) ; 5
; [then-branch: 13 | decreasing[Bool](x@18@01 - 2, x@18@01) && bounded[Bool](x@18@01)]
(assert (and (decreasing<Bool> (- x@18@01 2) x@18@01) (bounded<Bool> x@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(decreasing[Bool](x@18@01 - 2, x@18@01) && bounded[Bool](x@18@01))]
(assert (not (and (decreasing<Bool> (- x@18@01 2) x@18@01) (bounded<Bool> x@18@01))))
; [eval] x - 2 == old(x) && ((decreasing(y - 3, old(y)): Bool) && (bounded(old(y)): Bool))
; [eval] x - 2 == old(x)
; [eval] x - 2
; [eval] old(x)
(push) ; 6
; [then-branch: 14 | x@18@01 - 2 != x@18@01 | live]
; [else-branch: 14 | x@18@01 - 2 == x@18@01 | live]
(push) ; 7
; [then-branch: 14 | x@18@01 - 2 != x@18@01]
(assert (not (= (- x@18@01 2) x@18@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 14 | x@18@01 - 2 == x@18@01]
(assert (= (- x@18@01 2) x@18@01))
; [eval] (decreasing(y - 3, old(y)): Bool)
; [eval] y - 3
; [eval] old(y)
(push) ; 8
; [then-branch: 15 | !(decreasing[Bool](y@19@01 - 3, y@19@01)) | live]
; [else-branch: 15 | decreasing[Bool](y@19@01 - 3, y@19@01) | live]
(push) ; 9
; [then-branch: 15 | !(decreasing[Bool](y@19@01 - 3, y@19@01))]
(assert (not (decreasing<Bool> (- y@19@01 3) y@19@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 15 | decreasing[Bool](y@19@01 - 3, y@19@01)]
(assert (decreasing<Bool> (- y@19@01 3) y@19@01))
; [eval] (bounded(old(y)): Bool)
; [eval] old(y)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- y@19@01 3) y@19@01)
  (not (decreasing<Bool> (- y@19@01 3) y@19@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (= (- x@18@01 2) x@18@01)
  (and
    (= (- x@18@01 2) x@18@01)
    (or
      (decreasing<Bool> (- y@19@01 3) y@19@01)
      (not (decreasing<Bool> (- y@19@01 3) y@19@01))))))
(assert (or (= (- x@18@01 2) x@18@01) (not (= (- x@18@01 2) x@18@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (decreasing<Bool> (- x@18@01 2) x@18@01) (bounded<Bool> x@18@01)))
  (and
    (not (and (decreasing<Bool> (- x@18@01 2) x@18@01) (bounded<Bool> x@18@01)))
    (=>
      (= (- x@18@01 2) x@18@01)
      (and
        (= (- x@18@01 2) x@18@01)
        (or
          (decreasing<Bool> (- y@19@01 3) y@19@01)
          (not (decreasing<Bool> (- y@19@01 3) y@19@01)))))
    (or (= (- x@18@01 2) x@18@01) (not (= (- x@18@01 2) x@18@01))))))
(assert (or
  (not (and (decreasing<Bool> (- x@18@01 2) x@18@01) (bounded<Bool> x@18@01)))
  (and (decreasing<Bool> (- x@18@01 2) x@18@01) (bounded<Bool> x@18@01))))
(push) ; 4
(assert (not (or
  (and (decreasing<Bool> (- x@18@01 2) x@18@01) (bounded<Bool> x@18@01))
  (and
    (= (- x@18@01 2) x@18@01)
    (and (decreasing<Bool> (- y@19@01 3) y@19@01) (bounded<Bool> y@19@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or
  (and (decreasing<Bool> (- x@18@01 2) x@18@01) (bounded<Bool> x@18@01))
  (and
    (= (- x@18@01 2) x@18@01)
    (and (decreasing<Bool> (- y@19@01 3) y@19@01) (bounded<Bool> y@19@01)))))
(pop) ; 3
(push) ; 3
; [else-branch: 11 | x@18@01 < 5 || y@19@01 < 8]
(assert (or (< x@18@01 5) (< y@19@01 8)))
(pop) ; 3
; [eval] x < 5 || y < 8
; [eval] x < 5
(push) ; 3
; [then-branch: 16 | x@18@01 < 5 | live]
; [else-branch: 16 | !(x@18@01 < 5) | live]
(push) ; 4
; [then-branch: 16 | x@18@01 < 5]
(assert (< x@18@01 5))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | !(x@18@01 < 5)]
(assert (not (< x@18@01 5)))
; [eval] y < 8
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (not (or (< x@18@01 5) (< y@19@01 8)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (or (< x@18@01 5) (< y@19@01 8))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | x@18@01 < 5 || y@19@01 < 8 | live]
; [else-branch: 17 | !(x@18@01 < 5 || y@19@01 < 8) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | x@18@01 < 5 || y@19@01 < 8]
(assert (or (< x@18@01 5) (< y@19@01 8)))
(pop) ; 3
(push) ; 3
; [else-branch: 17 | !(x@18@01 < 5 || y@19@01 < 8)]
(assert (not (or (< x@18@01 5) (< y@19@01 8))))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- fun5_termination_proof ----------
(declare-const x@20@01 Int)
(declare-const x@21@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] x < 10
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< x@21@01 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< x@21@01 10)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | x@21@01 < 10 | live]
; [else-branch: 18 | !(x@21@01 < 10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 18 | x@21@01 < 10]
(assert (< x@21@01 10))
; [exec]
; assert (decreasing(-(x + 2) + 12, old(-x + 12)): Bool) &&
;   (bounded(old(-x + 12)): Bool)
; [eval] (decreasing(-(x + 2) + 12, old(-x + 12)): Bool)
; [eval] -(x + 2) + 12
; [eval] -(x + 2)
; [eval] x + 2
; [eval] old(-x + 12)
; [eval] -x + 12
; [eval] -x
(push) ; 4
(assert (not (decreasing<Bool> (+ (- 0 (+ x@21@01 2)) 12) (+ (- 0 x@21@01) 12))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (+ (- 0 (+ x@21@01 2)) 12) (+ (- 0 x@21@01) 12)))
; [eval] (bounded(old(-x + 12)): Bool)
; [eval] old(-x + 12)
; [eval] -x + 12
; [eval] -x
(push) ; 4
(assert (not (bounded<Bool> (+ (- 0 x@21@01) 12))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> (+ (- 0 x@21@01) 12)))
(pop) ; 3
(push) ; 3
; [else-branch: 18 | !(x@21@01 < 10)]
(assert (not (< x@21@01 10)))
(pop) ; 3
; [eval] !(x < 10)
; [eval] x < 10
(push) ; 3
(set-option :timeout 10)
(assert (not (< x@21@01 10)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< x@21@01 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | !(x@21@01 < 10) | live]
; [else-branch: 19 | x@21@01 < 10 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 19 | !(x@21@01 < 10)]
(assert (not (< x@21@01 10)))
(pop) ; 3
(push) ; 3
; [else-branch: 19 | x@21@01 < 10]
(assert (< x@21@01 10))
(pop) ; 3
(pop) ; 2
(pop) ; 1
