(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:36
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/decCondition.vpr
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
(declare-fun g ($Snap Int) Int)
(declare-fun g%limited ($Snap Int) Int)
(declare-fun g%stateless (Int) Bool)
(declare-fun g%precondition ($Snap Int) Bool)
(declare-fun f1 ($Snap Int) Int)
(declare-fun f1%limited ($Snap Int) Int)
(declare-fun f1%stateless (Int) Bool)
(declare-fun f1%precondition ($Snap Int) Bool)
(declare-fun f2 ($Snap Int) Int)
(declare-fun f2%limited ($Snap Int) Int)
(declare-fun f2%stateless (Int) Bool)
(declare-fun f2%precondition ($Snap Int) Bool)
(declare-fun f1_e ($Snap Int) Int)
(declare-fun f1_e%limited ($Snap Int) Int)
(declare-fun f1_e%stateless (Int) Bool)
(declare-fun f1_e%precondition ($Snap Int) Bool)
(declare-fun f2_e ($Snap Int) Int)
(declare-fun f2_e%limited ($Snap Int) Int)
(declare-fun f2_e%stateless (Int) Bool)
(declare-fun f2_e%precondition ($Snap Int) Bool)
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
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (= (g%limited s@$ y@0@00) (g s@$ y@0@00))
  :pattern ((g s@$ y@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (g%stateless y@0@00)
  :pattern ((g%limited s@$ y@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (= (f1%limited s@$ x@2@00) (f1 s@$ x@2@00))
  :pattern ((f1 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (f1%stateless x@2@00)
  :pattern ((f1%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (f1%precondition s@$ x@2@00)
    (=
      (f1 s@$ x@2@00)
      (ite
        (= x@2@00 0)
        (g $Snap.unit x@2@00)
        (+
          (+
            (f1%limited $Snap.unit (- x@2@00 1))
            (f2%limited $Snap.unit (- 0 (- x@2@00 1))))
          (g $Snap.unit x@2@00)))))
  :pattern ((f1 s@$ x@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (f1%precondition s@$ x@2@00)
    (ite
      (= x@2@00 0)
      (g%precondition $Snap.unit x@2@00)
      (and
        (and
          (f1%precondition $Snap.unit (- x@2@00 1))
          (f2%precondition $Snap.unit (- 0 (- x@2@00 1))))
        (g%precondition $Snap.unit x@2@00))))
  :pattern ((f1 s@$ x@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (= (f2%limited s@$ x@4@00) (f2 s@$ x@4@00))
  :pattern ((f2 s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (f2%stateless x@4@00)
  :pattern ((f2%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (f2%precondition s@$ x@4@00)
    (=
      (f2 s@$ x@4@00)
      (ite
        (= x@4@00 0)
        (g $Snap.unit x@4@00)
        (+
          (+
            (f2%limited $Snap.unit (+ x@4@00 1))
            (f1%limited $Snap.unit (- 0 (+ x@4@00 1))))
          (g $Snap.unit (- 0 x@4@00))))))
  :pattern ((f2 s@$ x@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (f2%precondition s@$ x@4@00)
    (ite
      (= x@4@00 0)
      (g%precondition $Snap.unit x@4@00)
      (and
        (and
          (f2%precondition $Snap.unit (+ x@4@00 1))
          (f1%precondition $Snap.unit (- 0 (+ x@4@00 1))))
        (g%precondition $Snap.unit (- 0 x@4@00)))))
  :pattern ((f2 s@$ x@4@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (= (f1_e%limited s@$ x@6@00) (f1_e s@$ x@6@00))
  :pattern ((f1_e s@$ x@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (f1_e%stateless x@6@00)
  :pattern ((f1_e%limited s@$ x@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (=>
    (f1_e%precondition s@$ x@6@00)
    (=
      (f1_e s@$ x@6@00)
      (ite
        (= x@6@00 0)
        (g $Snap.unit x@6@00)
        (+
          (+
            (f1_e%limited $Snap.unit (- x@6@00 1))
            (f2_e%limited $Snap.unit (- x@6@00 1)))
          (g $Snap.unit x@6@00)))))
  :pattern ((f1_e s@$ x@6@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (=>
    (f1_e%precondition s@$ x@6@00)
    (ite
      (= x@6@00 0)
      (g%precondition $Snap.unit x@6@00)
      (and
        (and
          (f1_e%precondition $Snap.unit (- x@6@00 1))
          (f2_e%precondition $Snap.unit (- x@6@00 1)))
        (g%precondition $Snap.unit x@6@00))))
  :pattern ((f1_e s@$ x@6@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (= (f2_e%limited s@$ x@8@00) (f2_e s@$ x@8@00))
  :pattern ((f2_e s@$ x@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (f2_e%stateless x@8@00)
  :pattern ((f2_e%limited s@$ x@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (=>
    (f2_e%precondition s@$ x@8@00)
    (=
      (f2_e s@$ x@8@00)
      (ite
        (= x@8@00 0)
        (g $Snap.unit x@8@00)
        (+
          (+
            (f2_e%limited $Snap.unit (+ x@8@00 1))
            (f1_e%limited $Snap.unit (- 0 (+ x@8@00 1))))
          (g $Snap.unit x@8@00)))))
  :pattern ((f2_e s@$ x@8@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (=>
    (f2_e%precondition s@$ x@8@00)
    (ite
      (= x@8@00 0)
      (g%precondition $Snap.unit x@8@00)
      (and
        (and
          (f2_e%precondition $Snap.unit (+ x@8@00 1))
          (f1_e%precondition $Snap.unit (- 0 (+ x@8@00 1))))
        (g%precondition $Snap.unit x@8@00))))
  :pattern ((f2_e s@$ x@8@00))
  :qid |quant-u-17|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- f1_termination_proof ----------
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
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@1@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@1@01 == 0 | live]
; [else-branch: 0 | x@1@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@1@01 == 0]
(assert (= x@1@01 0))
; [exec]
; assert !old(x >= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x >= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 1 | !(x@1@01 >= 0) | live]
; [else-branch: 1 | x@1@01 >= 0 | live]
(push) ; 5
; [then-branch: 1 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] x >= 5
(push) ; 6
; [then-branch: 2 | x@1@01 >= 5 | live]
; [else-branch: 2 | !(x@1@01 >= 5) | live]
(push) ; 7
; [then-branch: 2 | x@1@01 >= 5]
(assert (>= x@1@01 5))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | !(x@1@01 >= 5)]
(assert (not (>= x@1@01 5)))
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(push) ; 8
; [then-branch: 3 | !(0 <= x@1@01) | live]
; [else-branch: 3 | 0 <= x@1@01 | live]
(push) ; 9
; [then-branch: 3 | !(0 <= x@1@01)]
(assert (not (<= 0 x@1@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 3 | 0 <= x@1@01]
(assert (<= 0 x@1@01))
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@1@01) (not (<= 0 x@1@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@1@01 5))
  (and (not (>= x@1@01 5)) (or (<= 0 x@1@01) (not (<= 0 x@1@01))))))
(assert (or (not (>= x@1@01 5)) (>= x@1@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= x@1@01 0)
  (and
    (>= x@1@01 0)
    (=>
      (not (>= x@1@01 5))
      (and (not (>= x@1@01 5)) (or (<= 0 x@1@01) (not (<= 0 x@1@01)))))
    (or (not (>= x@1@01 5)) (>= x@1@01 5)))))
(assert (or (>= x@1@01 0) (not (>= x@1@01 0))))
(push) ; 4
(assert (not (or (not (>= x@1@01 0)) (or (>= x@1@01 5) (and (<= 0 x@1@01) (< x@1@01 5))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= x@1@01 0)) (or (>= x@1@01 5) (and (<= 0 x@1@01) (< x@1@01 5)))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | x@1@01 != 0]
(assert (not (= x@1@01 0)))
(pop) ; 3
; [eval] !(x == 0)
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@1@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | x@1@01 != 0 | live]
; [else-branch: 4 | x@1@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | x@1@01 != 0]
(assert (not (= x@1@01 0)))
; [exec]
; assert !old(x >= 0) || x - 1 >= 0
; [eval] !old(x >= 0) || x - 1 >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 5 | !(x@1@01 >= 0) | live]
; [else-branch: 5 | x@1@01 >= 0 | live]
(push) ; 5
; [then-branch: 5 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] x - 1 >= 0
; [eval] x - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= x@1@01 0) (not (>= x@1@01 0))))
(push) ; 4
(assert (not (or (not (>= x@1@01 0)) (>= (- x@1@01 1) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= x@1@01 0)) (>= (- x@1@01 1) 0)))
; [exec]
; assert old(x >= 0) ==>
;   (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] old(x >= 0) ==> (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= x@1@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | x@1@01 >= 0 | live]
; [else-branch: 6 | !(x@1@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 6
; [then-branch: 7 | !(decreasing[Bool](x@1@01 - 1, x@1@01)) | live]
; [else-branch: 7 | decreasing[Bool](x@1@01 - 1, x@1@01) | live]
(push) ; 7
; [then-branch: 7 | !(decreasing[Bool](x@1@01 - 1, x@1@01))]
(assert (not (decreasing<Bool> (- x@1@01 1) x@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | decreasing[Bool](x@1@01 - 1, x@1@01)]
(assert (decreasing<Bool> (- x@1@01 1) x@1@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- x@1@01 1) x@1@01)
  (not (decreasing<Bool> (- x@1@01 1) x@1@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= x@1@01 0)
  (and
    (>= x@1@01 0)
    (or
      (decreasing<Bool> (- x@1@01 1) x@1@01)
      (not (decreasing<Bool> (- x@1@01 1) x@1@01))))))
; Joined path conditions
(assert (or (not (>= x@1@01 0)) (>= x@1@01 0)))
(push) ; 4
(assert (not (=>
  (>= x@1@01 0)
  (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (>= x@1@01 0)
  (and (decreasing<Bool> (- x@1@01 1) x@1@01) (bounded<Bool> x@1@01))))
; [exec]
; assert !old(x >= 0) || -(x - 1) <= 0
; [eval] !old(x >= 0) || -(x - 1) <= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 8 | !(x@1@01 >= 0) | live]
; [else-branch: 8 | x@1@01 >= 0 | live]
(push) ; 5
; [then-branch: 8 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] -(x - 1) <= 0
; [eval] -(x - 1)
; [eval] x - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(assert (not (or (not (>= x@1@01 0)) (<= (- 0 (- x@1@01 1)) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= x@1@01 0)) (<= (- 0 (- x@1@01 1)) 0)))
; [exec]
; assert old(x >= 0) ==>
;   (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] old(x >= 0) ==> (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= x@1@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= x@1@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | x@1@01 >= 0 | live]
; [else-branch: 9 | !(x@1@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 6
; [then-branch: 10 | !(decreasing[Bool](x@1@01 - 1, x@1@01)) | live]
; [else-branch: 10 | decreasing[Bool](x@1@01 - 1, x@1@01) | live]
(push) ; 7
; [then-branch: 10 | !(decreasing[Bool](x@1@01 - 1, x@1@01))]
(assert (not (decreasing<Bool> (- x@1@01 1) x@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | decreasing[Bool](x@1@01 - 1, x@1@01)]
(assert (decreasing<Bool> (- x@1@01 1) x@1@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- x@1@01 1) x@1@01)
  (not (decreasing<Bool> (- x@1@01 1) x@1@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
; [exec]
; assert !old(x >= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x >= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 11 | !(x@1@01 >= 0) | live]
; [else-branch: 11 | x@1@01 >= 0 | live]
(push) ; 5
; [then-branch: 11 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] x >= 5
(push) ; 6
; [then-branch: 12 | x@1@01 >= 5 | live]
; [else-branch: 12 | !(x@1@01 >= 5) | live]
(push) ; 7
; [then-branch: 12 | x@1@01 >= 5]
(assert (>= x@1@01 5))
(pop) ; 7
(push) ; 7
; [else-branch: 12 | !(x@1@01 >= 5)]
(assert (not (>= x@1@01 5)))
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(push) ; 8
; [then-branch: 13 | !(0 <= x@1@01) | live]
; [else-branch: 13 | 0 <= x@1@01 | live]
(push) ; 9
; [then-branch: 13 | !(0 <= x@1@01)]
(assert (not (<= 0 x@1@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 13 | 0 <= x@1@01]
(assert (<= 0 x@1@01))
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@1@01) (not (<= 0 x@1@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@1@01 5))
  (and (not (>= x@1@01 5)) (or (<= 0 x@1@01) (not (<= 0 x@1@01))))))
(assert (or (not (>= x@1@01 5)) (>= x@1@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= x@1@01 0)
  (and
    (>= x@1@01 0)
    (=>
      (not (>= x@1@01 5))
      (and (not (>= x@1@01 5)) (or (<= 0 x@1@01) (not (<= 0 x@1@01)))))
    (or (not (>= x@1@01 5)) (>= x@1@01 5)))))
(push) ; 4
(assert (not (or (not (>= x@1@01 0)) (or (>= x@1@01 5) (and (<= 0 x@1@01) (< x@1@01 5))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= x@1@01 0)) (or (>= x@1@01 5) (and (<= 0 x@1@01) (< x@1@01 5)))))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | x@1@01 == 0]
(assert (= x@1@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- f2_termination_proof ----------
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
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@3@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@3@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | x@3@01 == 0 | live]
; [else-branch: 14 | x@3@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | x@3@01 == 0]
(assert (= x@3@01 0))
; [exec]
; assert !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
; [then-branch: 15 | !(x@3@01 <= 0) | live]
; [else-branch: 15 | x@3@01 <= 0 | live]
(push) ; 5
; [then-branch: 15 | !(x@3@01 <= 0)]
(assert (not (<= x@3@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | x@3@01 <= 0]
(assert (<= x@3@01 0))
; [eval] x >= 5
(push) ; 6
; [then-branch: 16 | x@3@01 >= 5 | live]
; [else-branch: 16 | !(x@3@01 >= 5) | live]
(push) ; 7
; [then-branch: 16 | x@3@01 >= 5]
(assert (>= x@3@01 5))
(pop) ; 7
(push) ; 7
; [else-branch: 16 | !(x@3@01 >= 5)]
(assert (not (>= x@3@01 5)))
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(push) ; 8
; [then-branch: 17 | !(0 <= x@3@01) | live]
; [else-branch: 17 | 0 <= x@3@01 | live]
(push) ; 9
; [then-branch: 17 | !(0 <= x@3@01)]
(assert (not (<= 0 x@3@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 17 | 0 <= x@3@01]
(assert (<= 0 x@3@01))
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@3@01) (not (<= 0 x@3@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@3@01 5))
  (and (not (>= x@3@01 5)) (or (<= 0 x@3@01) (not (<= 0 x@3@01))))))
(assert (or (not (>= x@3@01 5)) (>= x@3@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= x@3@01 0)
  (and
    (<= x@3@01 0)
    (=>
      (not (>= x@3@01 5))
      (and (not (>= x@3@01 5)) (or (<= 0 x@3@01) (not (<= 0 x@3@01)))))
    (or (not (>= x@3@01 5)) (>= x@3@01 5)))))
(assert (or (<= x@3@01 0) (not (<= x@3@01 0))))
(push) ; 4
(assert (not (or (not (<= x@3@01 0)) (or (>= x@3@01 5) (and (<= 0 x@3@01) (< x@3@01 5))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (<= x@3@01 0)) (or (>= x@3@01 5) (and (<= 0 x@3@01) (< x@3@01 5)))))
(pop) ; 3
(push) ; 3
; [else-branch: 14 | x@3@01 != 0]
(assert (not (= x@3@01 0)))
(pop) ; 3
; [eval] !(x == 0)
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@3@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@3@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | x@3@01 != 0 | live]
; [else-branch: 18 | x@3@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 18 | x@3@01 != 0]
(assert (not (= x@3@01 0)))
; [exec]
; assert !old(x <= 0) || x + 1 <= 0
; [eval] !old(x <= 0) || x + 1 <= 0
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
; [then-branch: 19 | !(x@3@01 <= 0) | live]
; [else-branch: 19 | x@3@01 <= 0 | live]
(push) ; 5
; [then-branch: 19 | !(x@3@01 <= 0)]
(assert (not (<= x@3@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | x@3@01 <= 0]
(assert (<= x@3@01 0))
; [eval] x + 1 <= 0
; [eval] x + 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= x@3@01 0) (not (<= x@3@01 0))))
(push) ; 4
(assert (not (or (not (<= x@3@01 0)) (<= (+ x@3@01 1) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (<= x@3@01 0)) (<= (+ x@3@01 1) 0)))
; [exec]
; assert old(x <= 0) ==>
;   (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] old(x <= 0) ==> (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= x@3@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= x@3@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | x@3@01 <= 0 | live]
; [else-branch: 20 | !(x@3@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 20 | x@3@01 <= 0]
(assert (<= x@3@01 0))
; [eval] (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] (decreasing(-(x + 1), old(-x)): Bool)
; [eval] -(x + 1)
; [eval] x + 1
; [eval] old(-x)
; [eval] -x
(push) ; 6
; [then-branch: 21 | !(decreasing[Bool](0 - x@3@01 + 1, 0 - x@3@01)) | live]
; [else-branch: 21 | decreasing[Bool](0 - x@3@01 + 1, 0 - x@3@01) | live]
(push) ; 7
; [then-branch: 21 | !(decreasing[Bool](0 - x@3@01 + 1, 0 - x@3@01))]
(assert (not (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 21 | decreasing[Bool](0 - x@3@01 + 1, 0 - x@3@01)]
(assert (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01)))
; [eval] (bounded(old(-x)): Bool)
; [eval] old(-x)
; [eval] -x
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01))
  (not (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(x@3@01 <= 0)]
(assert (not (<= x@3@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (<= x@3@01 0)
  (and
    (<= x@3@01 0)
    (or
      (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01))
      (not (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01)))))))
; Joined path conditions
(assert (or (not (<= x@3@01 0)) (<= x@3@01 0)))
(push) ; 4
(assert (not (=>
  (<= x@3@01 0)
  (and
    (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01))
    (bounded<Bool> (- 0 x@3@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= x@3@01 0)
  (and
    (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01))
    (bounded<Bool> (- 0 x@3@01)))))
; [exec]
; assert !old(x <= 0) || -(x + 1) >= 0
; [eval] !old(x <= 0) || -(x + 1) >= 0
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
; [then-branch: 22 | !(x@3@01 <= 0) | live]
; [else-branch: 22 | x@3@01 <= 0 | live]
(push) ; 5
; [then-branch: 22 | !(x@3@01 <= 0)]
(assert (not (<= x@3@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | x@3@01 <= 0]
(assert (<= x@3@01 0))
; [eval] -(x + 1) >= 0
; [eval] -(x + 1)
; [eval] x + 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(assert (not (or (not (<= x@3@01 0)) (>= (- 0 (+ x@3@01 1)) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (<= x@3@01 0)) (>= (- 0 (+ x@3@01 1)) 0)))
; [exec]
; assert old(x <= 0) ==>
;   (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] old(x <= 0) ==> (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= x@3@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= x@3@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | x@3@01 <= 0 | live]
; [else-branch: 23 | !(x@3@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | x@3@01 <= 0]
(assert (<= x@3@01 0))
; [eval] (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] (decreasing(-(x + 1), old(-x)): Bool)
; [eval] -(x + 1)
; [eval] x + 1
; [eval] old(-x)
; [eval] -x
(push) ; 6
; [then-branch: 24 | !(decreasing[Bool](0 - x@3@01 + 1, 0 - x@3@01)) | live]
; [else-branch: 24 | decreasing[Bool](0 - x@3@01 + 1, 0 - x@3@01) | live]
(push) ; 7
; [then-branch: 24 | !(decreasing[Bool](0 - x@3@01 + 1, 0 - x@3@01))]
(assert (not (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | decreasing[Bool](0 - x@3@01 + 1, 0 - x@3@01)]
(assert (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01)))
; [eval] (bounded(old(-x)): Bool)
; [eval] old(-x)
; [eval] -x
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01))
  (not (decreasing<Bool> (- 0 (+ x@3@01 1)) (- 0 x@3@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(x@3@01 <= 0)]
(assert (not (<= x@3@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
; [exec]
; assert !old(x <= 0) || (-x >= 5 || 0 <= -x && -x < 5)
; [eval] !old(x <= 0) || (-x >= 5 || 0 <= -x && -x < 5)
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
; [then-branch: 25 | !(x@3@01 <= 0) | live]
; [else-branch: 25 | x@3@01 <= 0 | live]
(push) ; 5
; [then-branch: 25 | !(x@3@01 <= 0)]
(assert (not (<= x@3@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | x@3@01 <= 0]
(assert (<= x@3@01 0))
; [eval] -x >= 5
; [eval] -x
(push) ; 6
; [then-branch: 26 | 0 - x@3@01 >= 5 | live]
; [else-branch: 26 | !(0 - x@3@01 >= 5) | live]
(push) ; 7
; [then-branch: 26 | 0 - x@3@01 >= 5]
(assert (>= (- 0 x@3@01) 5))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | !(0 - x@3@01 >= 5)]
(assert (not (>= (- 0 x@3@01) 5)))
; [eval] 0 <= -x && -x < 5
; [eval] 0 <= -x
; [eval] -x
(push) ; 8
; [then-branch: 27 | !(0 <= 0 - x@3@01) | live]
; [else-branch: 27 | 0 <= 0 - x@3@01 | live]
(push) ; 9
; [then-branch: 27 | !(0 <= 0 - x@3@01)]
(assert (not (<= 0 (- 0 x@3@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 27 | 0 <= 0 - x@3@01]
(assert (<= 0 (- 0 x@3@01)))
; [eval] -x < 5
; [eval] -x
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 (- 0 x@3@01)) (not (<= 0 (- 0 x@3@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= (- 0 x@3@01) 5))
  (and
    (not (>= (- 0 x@3@01) 5))
    (or (<= 0 (- 0 x@3@01)) (not (<= 0 (- 0 x@3@01)))))))
(assert (or (not (>= (- 0 x@3@01) 5)) (>= (- 0 x@3@01) 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= x@3@01 0)
  (and
    (<= x@3@01 0)
    (=>
      (not (>= (- 0 x@3@01) 5))
      (and
        (not (>= (- 0 x@3@01) 5))
        (or (<= 0 (- 0 x@3@01)) (not (<= 0 (- 0 x@3@01))))))
    (or (not (>= (- 0 x@3@01) 5)) (>= (- 0 x@3@01) 5)))))
(push) ; 4
(assert (not (or
  (not (<= x@3@01 0))
  (or (>= (- 0 x@3@01) 5) (and (<= 0 (- 0 x@3@01)) (< (- 0 x@3@01) 5))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or
  (not (<= x@3@01 0))
  (or (>= (- 0 x@3@01) 5) (and (<= 0 (- 0 x@3@01)) (< (- 0 x@3@01) 5)))))
(pop) ; 3
(push) ; 3
; [else-branch: 18 | x@3@01 == 0]
(assert (= x@3@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- f1_e_termination_proof ----------
(declare-const x@4@01 Int)
(declare-const x@5@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@5@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@5@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | x@5@01 == 0 | live]
; [else-branch: 28 | x@5@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 28 | x@5@01 == 0]
(assert (= x@5@01 0))
; [exec]
; assert !old(x >= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x >= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 29 | !(x@5@01 >= 0) | live]
; [else-branch: 29 | x@5@01 >= 0 | live]
(push) ; 5
; [then-branch: 29 | !(x@5@01 >= 0)]
(assert (not (>= x@5@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 29 | x@5@01 >= 0]
(assert (>= x@5@01 0))
; [eval] x >= 5
(push) ; 6
; [then-branch: 30 | x@5@01 >= 5 | live]
; [else-branch: 30 | !(x@5@01 >= 5) | live]
(push) ; 7
; [then-branch: 30 | x@5@01 >= 5]
(assert (>= x@5@01 5))
(pop) ; 7
(push) ; 7
; [else-branch: 30 | !(x@5@01 >= 5)]
(assert (not (>= x@5@01 5)))
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(push) ; 8
; [then-branch: 31 | !(0 <= x@5@01) | live]
; [else-branch: 31 | 0 <= x@5@01 | live]
(push) ; 9
; [then-branch: 31 | !(0 <= x@5@01)]
(assert (not (<= 0 x@5@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 31 | 0 <= x@5@01]
(assert (<= 0 x@5@01))
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@5@01) (not (<= 0 x@5@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@5@01 5))
  (and (not (>= x@5@01 5)) (or (<= 0 x@5@01) (not (<= 0 x@5@01))))))
(assert (or (not (>= x@5@01 5)) (>= x@5@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= x@5@01 0)
  (and
    (>= x@5@01 0)
    (=>
      (not (>= x@5@01 5))
      (and (not (>= x@5@01 5)) (or (<= 0 x@5@01) (not (<= 0 x@5@01)))))
    (or (not (>= x@5@01 5)) (>= x@5@01 5)))))
(assert (or (>= x@5@01 0) (not (>= x@5@01 0))))
(push) ; 4
(assert (not (or (not (>= x@5@01 0)) (or (>= x@5@01 5) (and (<= 0 x@5@01) (< x@5@01 5))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= x@5@01 0)) (or (>= x@5@01 5) (and (<= 0 x@5@01) (< x@5@01 5)))))
(pop) ; 3
(push) ; 3
; [else-branch: 28 | x@5@01 != 0]
(assert (not (= x@5@01 0)))
(pop) ; 3
; [eval] !(x == 0)
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@5@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@5@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | x@5@01 != 0 | live]
; [else-branch: 32 | x@5@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 32 | x@5@01 != 0]
(assert (not (= x@5@01 0)))
; [exec]
; assert !old(x >= 0) || x - 1 >= 0
; [eval] !old(x >= 0) || x - 1 >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 33 | !(x@5@01 >= 0) | live]
; [else-branch: 33 | x@5@01 >= 0 | live]
(push) ; 5
; [then-branch: 33 | !(x@5@01 >= 0)]
(assert (not (>= x@5@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | x@5@01 >= 0]
(assert (>= x@5@01 0))
; [eval] x - 1 >= 0
; [eval] x - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (>= x@5@01 0) (not (>= x@5@01 0))))
(push) ; 4
(assert (not (or (not (>= x@5@01 0)) (>= (- x@5@01 1) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= x@5@01 0)) (>= (- x@5@01 1) 0)))
; [exec]
; assert old(x >= 0) ==>
;   (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] old(x >= 0) ==> (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (>= x@5@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (>= x@5@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | x@5@01 >= 0 | live]
; [else-branch: 34 | !(x@5@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 34 | x@5@01 >= 0]
(assert (>= x@5@01 0))
; [eval] (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 6
; [then-branch: 35 | !(decreasing[Bool](x@5@01 - 1, x@5@01)) | live]
; [else-branch: 35 | decreasing[Bool](x@5@01 - 1, x@5@01) | live]
(push) ; 7
; [then-branch: 35 | !(decreasing[Bool](x@5@01 - 1, x@5@01))]
(assert (not (decreasing<Bool> (- x@5@01 1) x@5@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 35 | decreasing[Bool](x@5@01 - 1, x@5@01)]
(assert (decreasing<Bool> (- x@5@01 1) x@5@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- x@5@01 1) x@5@01)
  (not (decreasing<Bool> (- x@5@01 1) x@5@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 34 | !(x@5@01 >= 0)]
(assert (not (>= x@5@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= x@5@01 0)
  (and
    (>= x@5@01 0)
    (or
      (decreasing<Bool> (- x@5@01 1) x@5@01)
      (not (decreasing<Bool> (- x@5@01 1) x@5@01))))))
; Joined path conditions
(assert (or (not (>= x@5@01 0)) (>= x@5@01 0)))
(push) ; 4
(assert (not (=>
  (>= x@5@01 0)
  (and (decreasing<Bool> (- x@5@01 1) x@5@01) (bounded<Bool> x@5@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (>= x@5@01 0)
  (and (decreasing<Bool> (- x@5@01 1) x@5@01) (bounded<Bool> x@5@01))))
; [exec]
; assert !old(x >= 0) || x - 1 <= 0
; [eval] !old(x >= 0) || x - 1 <= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 4
; [then-branch: 36 | !(x@5@01 >= 0) | live]
; [else-branch: 36 | x@5@01 >= 0 | live]
(push) ; 5
; [then-branch: 36 | !(x@5@01 >= 0)]
(assert (not (>= x@5@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | x@5@01 >= 0]
(assert (>= x@5@01 0))
; [eval] x - 1 <= 0
; [eval] x - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(assert (not (or (not (>= x@5@01 0)) (<= (- x@5@01 1) 0))))
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
; [eval] !old(x >= 0) || x - 1 <= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 37 | !(x@5@01 >= 0) | live]
; [else-branch: 37 | x@5@01 >= 0 | live]
(push) ; 5
; [then-branch: 37 | !(x@5@01 >= 0)]
(assert (not (>= x@5@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 37 | x@5@01 >= 0]
(assert (>= x@5@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x - 1 <= 0
; [eval] x - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (or (not (>= x@5@01 0)) (<= (- x@5@01 1) 0))))
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
; [eval] !old(x >= 0) || x - 1 <= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 38 | !(x@5@01 >= 0) | live]
; [else-branch: 38 | x@5@01 >= 0 | live]
(push) ; 5
; [then-branch: 38 | !(x@5@01 >= 0)]
(assert (not (>= x@5@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 38 | x@5@01 >= 0]
(assert (>= x@5@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x - 1 <= 0
; [eval] x - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (or (not (>= x@5@01 0)) (<= (- x@5@01 1) 0))))
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
; [eval] !old(x >= 0) || x - 1 <= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 39 | !(x@5@01 >= 0) | live]
; [else-branch: 39 | x@5@01 >= 0 | live]
(push) ; 5
; [then-branch: 39 | !(x@5@01 >= 0)]
(assert (not (>= x@5@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 39 | x@5@01 >= 0]
(assert (>= x@5@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x - 1 <= 0
; [eval] x - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (or (not (>= x@5@01 0)) (<= (- x@5@01 1) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- f2_e_termination_proof ----------
(declare-const x@6@01 Int)
(declare-const x@7@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@7@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@7@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | x@7@01 == 0 | live]
; [else-branch: 40 | x@7@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 40 | x@7@01 == 0]
(assert (= x@7@01 0))
; [exec]
; assert !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
; [then-branch: 41 | !(x@7@01 <= 0) | live]
; [else-branch: 41 | x@7@01 <= 0 | live]
(push) ; 5
; [then-branch: 41 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 41 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [eval] x >= 5
(push) ; 6
; [then-branch: 42 | x@7@01 >= 5 | live]
; [else-branch: 42 | !(x@7@01 >= 5) | live]
(push) ; 7
; [then-branch: 42 | x@7@01 >= 5]
(assert (>= x@7@01 5))
(pop) ; 7
(push) ; 7
; [else-branch: 42 | !(x@7@01 >= 5)]
(assert (not (>= x@7@01 5)))
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(push) ; 8
; [then-branch: 43 | !(0 <= x@7@01) | live]
; [else-branch: 43 | 0 <= x@7@01 | live]
(push) ; 9
; [then-branch: 43 | !(0 <= x@7@01)]
(assert (not (<= 0 x@7@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 43 | 0 <= x@7@01]
(assert (<= 0 x@7@01))
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@7@01) (not (<= 0 x@7@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@7@01 5))
  (and (not (>= x@7@01 5)) (or (<= 0 x@7@01) (not (<= 0 x@7@01))))))
(assert (or (not (>= x@7@01 5)) (>= x@7@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= x@7@01 0)
  (and
    (<= x@7@01 0)
    (=>
      (not (>= x@7@01 5))
      (and (not (>= x@7@01 5)) (or (<= 0 x@7@01) (not (<= 0 x@7@01)))))
    (or (not (>= x@7@01 5)) (>= x@7@01 5)))))
(assert (or (<= x@7@01 0) (not (<= x@7@01 0))))
(push) ; 4
(assert (not (or (not (<= x@7@01 0)) (or (>= x@7@01 5) (and (<= 0 x@7@01) (< x@7@01 5))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (<= x@7@01 0)) (or (>= x@7@01 5) (and (<= 0 x@7@01) (< x@7@01 5)))))
(pop) ; 3
(push) ; 3
; [else-branch: 40 | x@7@01 != 0]
(assert (not (= x@7@01 0)))
(pop) ; 3
; [eval] !(x == 0)
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@7@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@7@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | x@7@01 != 0 | live]
; [else-branch: 44 | x@7@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 44 | x@7@01 != 0]
(assert (not (= x@7@01 0)))
; [exec]
; assert !old(x <= 0) || x + 1 <= 0
; [eval] !old(x <= 0) || x + 1 <= 0
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
; [then-branch: 45 | !(x@7@01 <= 0) | live]
; [else-branch: 45 | x@7@01 <= 0 | live]
(push) ; 5
; [then-branch: 45 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [eval] x + 1 <= 0
; [eval] x + 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= x@7@01 0) (not (<= x@7@01 0))))
(push) ; 4
(assert (not (or (not (<= x@7@01 0)) (<= (+ x@7@01 1) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (<= x@7@01 0)) (<= (+ x@7@01 1) 0)))
; [exec]
; assert old(x <= 0) ==>
;   (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] old(x <= 0) ==> (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= x@7@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= x@7@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | x@7@01 <= 0 | live]
; [else-branch: 46 | !(x@7@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 46 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [eval] (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] (decreasing(-(x + 1), old(-x)): Bool)
; [eval] -(x + 1)
; [eval] x + 1
; [eval] old(-x)
; [eval] -x
(push) ; 6
; [then-branch: 47 | !(decreasing[Bool](0 - x@7@01 + 1, 0 - x@7@01)) | live]
; [else-branch: 47 | decreasing[Bool](0 - x@7@01 + 1, 0 - x@7@01) | live]
(push) ; 7
; [then-branch: 47 | !(decreasing[Bool](0 - x@7@01 + 1, 0 - x@7@01))]
(assert (not (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 47 | decreasing[Bool](0 - x@7@01 + 1, 0 - x@7@01)]
(assert (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01)))
; [eval] (bounded(old(-x)): Bool)
; [eval] old(-x)
; [eval] -x
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01))
  (not (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 46 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (<= x@7@01 0)
  (and
    (<= x@7@01 0)
    (or
      (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01))
      (not (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01)))))))
; Joined path conditions
(assert (or (not (<= x@7@01 0)) (<= x@7@01 0)))
(push) ; 4
(assert (not (=>
  (<= x@7@01 0)
  (and
    (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01))
    (bounded<Bool> (- 0 x@7@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (<= x@7@01 0)
  (and
    (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01))
    (bounded<Bool> (- 0 x@7@01)))))
; [exec]
; assert !old(x <= 0) || -(x + 1) >= 0
; [eval] !old(x <= 0) || -(x + 1) >= 0
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
; [then-branch: 48 | !(x@7@01 <= 0) | live]
; [else-branch: 48 | x@7@01 <= 0 | live]
(push) ; 5
; [then-branch: 48 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [eval] -(x + 1) >= 0
; [eval] -(x + 1)
; [eval] x + 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(assert (not (or (not (<= x@7@01 0)) (>= (- 0 (+ x@7@01 1)) 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (not (<= x@7@01 0)) (>= (- 0 (+ x@7@01 1)) 0)))
; [exec]
; assert old(x <= 0) ==>
;   (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] old(x <= 0) ==> (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= x@7@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= x@7@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | x@7@01 <= 0 | live]
; [else-branch: 49 | !(x@7@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 49 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [eval] (decreasing(-(x + 1), old(-x)): Bool) && (bounded(old(-x)): Bool)
; [eval] (decreasing(-(x + 1), old(-x)): Bool)
; [eval] -(x + 1)
; [eval] x + 1
; [eval] old(-x)
; [eval] -x
(push) ; 6
; [then-branch: 50 | !(decreasing[Bool](0 - x@7@01 + 1, 0 - x@7@01)) | live]
; [else-branch: 50 | decreasing[Bool](0 - x@7@01 + 1, 0 - x@7@01) | live]
(push) ; 7
; [then-branch: 50 | !(decreasing[Bool](0 - x@7@01 + 1, 0 - x@7@01))]
(assert (not (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 50 | decreasing[Bool](0 - x@7@01 + 1, 0 - x@7@01)]
(assert (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01)))
; [eval] (bounded(old(-x)): Bool)
; [eval] old(-x)
; [eval] -x
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01))
  (not (decreasing<Bool> (- 0 (+ x@7@01 1)) (- 0 x@7@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 49 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
; [exec]
; assert !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [eval] x <= 0
(push) ; 4
; [then-branch: 51 | !(x@7@01 <= 0) | live]
; [else-branch: 51 | x@7@01 <= 0 | live]
(push) ; 5
; [then-branch: 51 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 51 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [eval] x >= 5
(push) ; 6
; [then-branch: 52 | x@7@01 >= 5 | live]
; [else-branch: 52 | !(x@7@01 >= 5) | live]
(push) ; 7
; [then-branch: 52 | x@7@01 >= 5]
(assert (>= x@7@01 5))
(pop) ; 7
(push) ; 7
; [else-branch: 52 | !(x@7@01 >= 5)]
(assert (not (>= x@7@01 5)))
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(push) ; 8
; [then-branch: 53 | !(0 <= x@7@01) | live]
; [else-branch: 53 | 0 <= x@7@01 | live]
(push) ; 9
; [then-branch: 53 | !(0 <= x@7@01)]
(assert (not (<= 0 x@7@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 53 | 0 <= x@7@01]
(assert (<= 0 x@7@01))
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@7@01) (not (<= 0 x@7@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@7@01 5))
  (and (not (>= x@7@01 5)) (or (<= 0 x@7@01) (not (<= 0 x@7@01))))))
(assert (or (not (>= x@7@01 5)) (>= x@7@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= x@7@01 0)
  (and
    (<= x@7@01 0)
    (=>
      (not (>= x@7@01 5))
      (and (not (>= x@7@01 5)) (or (<= 0 x@7@01) (not (<= 0 x@7@01)))))
    (or (not (>= x@7@01 5)) (>= x@7@01 5)))))
(push) ; 4
(assert (not (or (not (<= x@7@01 0)) (or (>= x@7@01 5) (and (<= 0 x@7@01) (< x@7@01 5))))))
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
; [eval] !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x <= 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 54 | !(x@7@01 <= 0) | live]
; [else-branch: 54 | x@7@01 <= 0 | live]
(push) ; 5
; [then-branch: 54 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 54 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x >= 5
(set-option :timeout 0)
(push) ; 6
; [then-branch: 55 | x@7@01 >= 5 | live]
; [else-branch: 55 | !(x@7@01 >= 5) | live]
(push) ; 7
; [then-branch: 55 | x@7@01 >= 5]
(assert (>= x@7@01 5))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 55 | !(x@7@01 >= 5)]
(assert (not (>= x@7@01 5)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(set-option :timeout 0)
(push) ; 8
; [then-branch: 56 | !(0 <= x@7@01) | live]
; [else-branch: 56 | 0 <= x@7@01 | live]
(push) ; 9
; [then-branch: 56 | !(0 <= x@7@01)]
(assert (not (<= 0 x@7@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 56 | 0 <= x@7@01]
(assert (<= 0 x@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@7@01) (not (<= 0 x@7@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@7@01 5))
  (and (not (>= x@7@01 5)) (or (<= 0 x@7@01) (not (<= 0 x@7@01))))))
(assert (or (not (>= x@7@01 5)) (>= x@7@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (or (not (<= x@7@01 0)) (or (>= x@7@01 5) (and (<= 0 x@7@01) (< x@7@01 5))))))
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
; [eval] !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x <= 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 57 | !(x@7@01 <= 0) | live]
; [else-branch: 57 | x@7@01 <= 0 | live]
(push) ; 5
; [then-branch: 57 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 57 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x >= 5
(set-option :timeout 0)
(push) ; 6
; [then-branch: 58 | x@7@01 >= 5 | live]
; [else-branch: 58 | !(x@7@01 >= 5) | live]
(push) ; 7
; [then-branch: 58 | x@7@01 >= 5]
(assert (>= x@7@01 5))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 58 | !(x@7@01 >= 5)]
(assert (not (>= x@7@01 5)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(set-option :timeout 0)
(push) ; 8
; [then-branch: 59 | !(0 <= x@7@01) | live]
; [else-branch: 59 | 0 <= x@7@01 | live]
(push) ; 9
; [then-branch: 59 | !(0 <= x@7@01)]
(assert (not (<= 0 x@7@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 59 | 0 <= x@7@01]
(assert (<= 0 x@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@7@01) (not (<= 0 x@7@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@7@01 5))
  (and (not (>= x@7@01 5)) (or (<= 0 x@7@01) (not (<= 0 x@7@01))))))
(assert (or (not (>= x@7@01 5)) (>= x@7@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (or (not (<= x@7@01 0)) (or (>= x@7@01 5) (and (<= 0 x@7@01) (< x@7@01 5))))))
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
; [eval] !old(x <= 0) || (x >= 5 || 0 <= x && x < 5)
; [eval] !old(x <= 0)
; [eval] old(x <= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] x <= 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 60 | !(x@7@01 <= 0) | live]
; [else-branch: 60 | x@7@01 <= 0 | live]
(push) ; 5
; [then-branch: 60 | !(x@7@01 <= 0)]
(assert (not (<= x@7@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 60 | x@7@01 <= 0]
(assert (<= x@7@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] x >= 5
(set-option :timeout 0)
(push) ; 6
; [then-branch: 61 | x@7@01 >= 5 | live]
; [else-branch: 61 | !(x@7@01 >= 5) | live]
(push) ; 7
; [then-branch: 61 | x@7@01 >= 5]
(assert (>= x@7@01 5))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 61 | !(x@7@01 >= 5)]
(assert (not (>= x@7@01 5)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] 0 <= x && x < 5
; [eval] 0 <= x
(set-option :timeout 0)
(push) ; 8
; [then-branch: 62 | !(0 <= x@7@01) | live]
; [else-branch: 62 | 0 <= x@7@01 | live]
(push) ; 9
; [then-branch: 62 | !(0 <= x@7@01)]
(assert (not (<= 0 x@7@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 62 | 0 <= x@7@01]
(assert (<= 0 x@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; [eval] x < 5
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@7@01) (not (<= 0 x@7@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (>= x@7@01 5))
  (and (not (>= x@7@01 5)) (or (<= 0 x@7@01) (not (<= 0 x@7@01))))))
(assert (or (not (>= x@7@01 5)) (>= x@7@01 5)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 4
(assert (not (or (not (<= x@7@01 0)) (or (>= x@7@01 5) (and (<= 0 x@7@01) (< x@7@01 5))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
