(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:33
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/conditions.vpr
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
(declare-fun f7 ($Snap Int) Bool)
(declare-fun f7%limited ($Snap Int) Bool)
(declare-fun f7%stateless (Int) Bool)
(declare-fun f7%precondition ($Snap Int) Bool)
(declare-fun f4 ($Snap Int) Int)
(declare-fun f4%limited ($Snap Int) Int)
(declare-fun f4%stateless (Int) Bool)
(declare-fun f4%precondition ($Snap Int) Bool)
(declare-fun f3 ($Snap Int) Int)
(declare-fun f3%limited ($Snap Int) Int)
(declare-fun f3%stateless (Int) Bool)
(declare-fun f3%precondition ($Snap Int) Bool)
(declare-fun f1 ($Snap Int) Int)
(declare-fun f1%limited ($Snap Int) Int)
(declare-fun f1%stateless (Int) Bool)
(declare-fun f1%precondition ($Snap Int) Bool)
(declare-fun f6 ($Snap $Ref Int) Int)
(declare-fun f6%limited ($Snap $Ref Int) Int)
(declare-fun f6%stateless ($Ref Int) Bool)
(declare-fun f6%precondition ($Snap $Ref Int) Bool)
(declare-fun f5 ($Snap Int) Int)
(declare-fun f5%limited ($Snap Int) Int)
(declare-fun f5%stateless (Int) Bool)
(declare-fun f5%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun list%trigger ($Snap $Ref) Bool)
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
(declare-fun $unresolved@14@00 () $Snap)
(declare-fun $unresolved@15@00 () $Snap)
(declare-fun $unresolved@16@00 () $Snap)
(declare-fun $unresolved@17@00 () $Snap)
(declare-fun $unresolved@18@00 () $Snap)
(declare-fun $unresolved@19@00 () $Snap)
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (= (f7%limited s@$ y@0@00) (f7 s@$ y@0@00))
  :pattern ((f7 s@$ y@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (f7%stateless y@0@00)
  :pattern ((f7%limited s@$ y@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (let ((result@1@00 (f7%limited s@$ y@0@00))) (=>
    (f7%precondition s@$ y@0@00)
    (= result@1@00 true)))
  :pattern ((f7%limited s@$ y@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (let ((result@1@00 (f7%limited s@$ y@0@00))) true)
  :pattern ((f7%limited s@$ y@0@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (= (f4%limited s@$ i@2@00) (f4 s@$ i@2@00))
  :pattern ((f4 s@$ i@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (f4%stateless i@2@00)
  :pattern ((f4%limited s@$ i@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (=> (f4%precondition s@$ i@2@00) (= (f4 s@$ i@2@00) 1))
  :pattern ((f4 s@$ i@2@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int)) (!
  true
  :pattern ((f4 s@$ i@2@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (= (f3%limited s@$ i@4@00) (f3 s@$ i@4@00))
  :pattern ((f3 s@$ i@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (f3%stateless i@4@00)
  :pattern ((f3%limited s@$ i@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  (=> (f3%precondition s@$ i@4@00) (= (f3 s@$ i@4@00) 1))
  :pattern ((f3 s@$ i@4@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (i@4@00 Int)) (!
  true
  :pattern ((f3 s@$ i@4@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (= (f1%limited s@$ i@6@00) (f1 s@$ i@6@00))
  :pattern ((f1 s@$ i@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (f1%stateless i@6@00)
  :pattern ((f1%limited s@$ i@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (=>
    (f1%precondition s@$ i@6@00)
    (=
      (f1 s@$ i@6@00)
      (ite
        (< i@6@00 10)
        1
        (ite
          (or
            (< (f1%limited $Snap.unit (- i@6@00 1)) 4)
            (< (f1%limited $Snap.unit (- i@6@00 3)) 6))
          1
          (f1%limited $Snap.unit (- i@6@00 1))))))
  :pattern ((f1 s@$ i@6@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (i@6@00 Int)) (!
  (=>
    (f1%precondition s@$ i@6@00)
    (ite
      (< i@6@00 10)
      true
      (and
        (and
          (f1%precondition $Snap.unit (- i@6@00 1))
          (=>
            (not (< (f1%limited $Snap.unit (- i@6@00 1)) 4))
            (f1%precondition $Snap.unit (- i@6@00 3))))
        (ite
          (or
            (< (f1%limited $Snap.unit (- i@6@00 1)) 4)
            (< (f1%limited $Snap.unit (- i@6@00 3)) 6))
          true
          (f1%precondition $Snap.unit (- i@6@00 1))))))
  :pattern ((f1 s@$ i@6@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (xs@8@00 $Ref) (x@9@00 Int)) (!
  (= (f6%limited s@$ xs@8@00 x@9@00) (f6 s@$ xs@8@00 x@9@00))
  :pattern ((f6 s@$ xs@8@00 x@9@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@8@00 $Ref) (x@9@00 Int)) (!
  (f6%stateless xs@8@00 x@9@00)
  :pattern ((f6%limited s@$ xs@8@00 x@9@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (xs@8@00 $Ref) (x@9@00 Int)) (!
  (=>
    (f6%precondition s@$ xs@8@00 x@9@00)
    (=
      (f6 s@$ xs@8@00 x@9@00)
      (ite
        (not (= x@9@00 0))
        (f6%limited ($Snap.combine
          ($Snap.first s@$)
          ($Snap.combine $Snap.unit $Snap.unit)) xs@8@00 (- x@9@00 1))
        x@9@00)))
  :pattern ((f6 s@$ xs@8@00 x@9@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (xs@8@00 $Ref) (x@9@00 Int)) (!
  (=>
    (f6%precondition s@$ xs@8@00 x@9@00)
    (ite
      (not (= x@9@00 0))
      (f6%precondition ($Snap.combine
        ($Snap.first s@$)
        ($Snap.combine $Snap.unit $Snap.unit)) xs@8@00 (- x@9@00 1))
      true))
  :pattern ((f6 s@$ xs@8@00 x@9@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (i@11@00 Int)) (!
  (= (f5%limited s@$ i@11@00) (f5 s@$ i@11@00))
  :pattern ((f5 s@$ i@11@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (i@11@00 Int)) (!
  (f5%stateless i@11@00)
  :pattern ((f5%limited s@$ i@11@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (i@11@00 Int)) (!
  (=> (f5%precondition s@$ i@11@00) (= (f5 s@$ i@11@00) 7))
  :pattern ((f5 s@$ i@11@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (i@11@00 Int)) (!
  true
  :pattern ((f5 s@$ i@11@00))
  :qid |quant-u-23|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- f1_termination_proof ----------
(declare-const i@0@01 Int)
(declare-const i@1@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] i >= 0
(assert (>= i@1@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(i < 10)
; [eval] i < 10
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@1@01 10)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@1@01 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | !(i@1@01 < 10) | live]
; [else-branch: 0 | i@1@01 < 10 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | !(i@1@01 < 10)]
(assert (not (< i@1@01 10)))
; [exec]
; assert (decreasing(i - 1, old(i)): Bool) && (bounded(old(i)): Bool)
; [eval] (decreasing(i - 1, old(i)): Bool)
; [eval] i - 1
; [eval] old(i)
(push) ; 4
(assert (not (decreasing<Bool> (- i@1@01 1) i@1@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (- i@1@01 1) i@1@01))
; [eval] (bounded(old(i)): Bool)
; [eval] old(i)
(push) ; 4
(assert (not (bounded<Bool> i@1@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> i@1@01))
; [eval] f1(i - 1) >= 4
; [eval] f1(i - 1)
; [eval] i - 1
(push) ; 4
; [eval] i >= 0
(push) ; 5
(assert (not (>= (- i@1@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- i@1@01 1) 0))
(assert (f1%precondition $Snap.unit (- i@1@01 1)))
(pop) ; 4
; Joined path conditions
(assert (and (>= (- i@1@01 1) 0) (f1%precondition $Snap.unit (- i@1@01 1))))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (>= (f1 $Snap.unit (- i@1@01 1)) 4))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>= (f1 $Snap.unit (- i@1@01 1)) 4)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | f1(_, i@1@01 - 1) >= 4 | live]
; [else-branch: 1 | !(f1(_, i@1@01 - 1) >= 4) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | f1(_, i@1@01 - 1) >= 4]
(assert (>= (f1 $Snap.unit (- i@1@01 1)) 4))
; [exec]
; assert (decreasing(i - 3, old(i)): Bool) && (bounded(old(i)): Bool)
; [eval] (decreasing(i - 3, old(i)): Bool)
; [eval] i - 3
; [eval] old(i)
(push) ; 5
(assert (not (decreasing<Bool> (- i@1@01 3) i@1@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (- i@1@01 3) i@1@01))
; [eval] (bounded(old(i)): Bool)
; [eval] old(i)
; [eval] !(f1(i - 1) < 4 || f1(i - 3) < 6)
; [eval] f1(i - 1) < 4 || f1(i - 3) < 6
; [eval] f1(i - 1) < 4
; [eval] f1(i - 1)
; [eval] i - 1
(push) ; 5
; [eval] i >= 0
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 2 | f1(_, i@1@01 - 1) < 4 | live]
; [else-branch: 2 | !(f1(_, i@1@01 - 1) < 4) | live]
(push) ; 6
; [then-branch: 2 | f1(_, i@1@01 - 1) < 4]
(assert (< (f1 $Snap.unit (- i@1@01 1)) 4))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | !(f1(_, i@1@01 - 1) < 4)]
(assert (not (< (f1 $Snap.unit (- i@1@01 1)) 4)))
; [eval] f1(i - 3) < 6
; [eval] f1(i - 3)
; [eval] i - 3
(push) ; 7
; [eval] i >= 0
(push) ; 8
(assert (not (>= (- i@1@01 3) 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (>= (- i@1@01 3) 0))
(assert (f1%precondition $Snap.unit (- i@1@01 3)))
(pop) ; 7
; Joined path conditions
(assert (and (>= (- i@1@01 3) 0) (f1%precondition $Snap.unit (- i@1@01 3))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (< (f1 $Snap.unit (- i@1@01 1)) 4))
  (and
    (not (< (f1 $Snap.unit (- i@1@01 1)) 4))
    (>= (- i@1@01 3) 0)
    (f1%precondition $Snap.unit (- i@1@01 3)))))
(assert (or (not (< (f1 $Snap.unit (- i@1@01 1)) 4)) (< (f1 $Snap.unit (- i@1@01 1)) 4)))
(push) ; 5
(set-option :timeout 10)
(assert (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6) | live]
; [else-branch: 3 | f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | !(f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6)]
(assert (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6))))
; [exec]
; assert (decreasing(i - 1, old(i)): Bool) && (bounded(old(i)): Bool)
; [eval] (decreasing(i - 1, old(i)): Bool)
; [eval] i - 1
; [eval] old(i)
; [eval] (bounded(old(i)): Bool)
; [eval] old(i)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6]
(assert (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6)))
(pop) ; 5
; [eval] f1(i - 1) < 4 || f1(i - 3) < 6
; [eval] f1(i - 1) < 4
; [eval] f1(i - 1)
; [eval] i - 1
(push) ; 5
; [eval] i >= 0
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 4 | f1(_, i@1@01 - 1) < 4 | live]
; [else-branch: 4 | !(f1(_, i@1@01 - 1) < 4) | live]
(push) ; 6
; [then-branch: 4 | f1(_, i@1@01 - 1) < 4]
(assert (< (f1 $Snap.unit (- i@1@01 1)) 4))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | !(f1(_, i@1@01 - 1) < 4)]
(assert (not (< (f1 $Snap.unit (- i@1@01 1)) 4)))
; [eval] f1(i - 3) < 6
; [eval] f1(i - 3)
; [eval] i - 3
(push) ; 7
; [eval] i >= 0
(push) ; 8
(assert (not (>= (- i@1@01 3) 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (>= (- i@1@01 3) 0))
(assert (f1%precondition $Snap.unit (- i@1@01 3)))
(pop) ; 7
; Joined path conditions
(assert (and (>= (- i@1@01 3) 0) (f1%precondition $Snap.unit (- i@1@01 3))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6 | live]
; [else-branch: 5 | !(f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6]
(assert (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6)]
(assert (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6))))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(f1(_, i@1@01 - 1) >= 4)]
(assert (not (>= (f1 $Snap.unit (- i@1@01 1)) 4)))
(pop) ; 4
; [eval] !(f1(i - 1) >= 4)
; [eval] f1(i - 1) >= 4
; [eval] f1(i - 1)
; [eval] i - 1
(push) ; 4
; [eval] i >= 0
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (>= (f1 $Snap.unit (- i@1@01 1)) 4)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (>= (f1 $Snap.unit (- i@1@01 1)) 4))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(f1(_, i@1@01 - 1) >= 4) | live]
; [else-branch: 6 | f1(_, i@1@01 - 1) >= 4 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | !(f1(_, i@1@01 - 1) >= 4)]
(assert (not (>= (f1 $Snap.unit (- i@1@01 1)) 4)))
; [eval] !(f1(i - 1) < 4 || f1(i - 3) < 6)
; [eval] f1(i - 1) < 4 || f1(i - 3) < 6
; [eval] f1(i - 1) < 4
; [eval] f1(i - 1)
; [eval] i - 1
(push) ; 5
; [eval] i >= 0
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 7 | f1(_, i@1@01 - 1) < 4 | live]
; [else-branch: 7 | !(f1(_, i@1@01 - 1) < 4) | live]
(push) ; 6
; [then-branch: 7 | f1(_, i@1@01 - 1) < 4]
(assert (< (f1 $Snap.unit (- i@1@01 1)) 4))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | !(f1(_, i@1@01 - 1) < 4)]
(assert (not (< (f1 $Snap.unit (- i@1@01 1)) 4)))
; [eval] f1(i - 3) < 6
; [eval] f1(i - 3)
; [eval] i - 3
(push) ; 7
; [eval] i >= 0
(push) ; 8
(assert (not (>= (- i@1@01 3) 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (>= (- i@1@01 3) 0))
(assert (f1%precondition $Snap.unit (- i@1@01 3)))
(pop) ; 7
; Joined path conditions
(assert (and (>= (- i@1@01 3) 0) (f1%precondition $Snap.unit (- i@1@01 3))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (< (f1 $Snap.unit (- i@1@01 1)) 4))
  (and
    (not (< (f1 $Snap.unit (- i@1@01 1)) 4))
    (>= (- i@1@01 3) 0)
    (f1%precondition $Snap.unit (- i@1@01 3)))))
(assert (or (not (< (f1 $Snap.unit (- i@1@01 1)) 4)) (< (f1 $Snap.unit (- i@1@01 1)) 4)))
(push) ; 5
(set-option :timeout 10)
(assert (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | !(f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6) | dead]
; [else-branch: 8 | f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 8 | f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6]
(assert (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6)))
(pop) ; 5
; [eval] f1(i - 1) < 4 || f1(i - 3) < 6
; [eval] f1(i - 1) < 4
; [eval] f1(i - 1)
; [eval] i - 1
(push) ; 5
; [eval] i >= 0
(pop) ; 5
; Joined path conditions
(push) ; 5
; [then-branch: 9 | f1(_, i@1@01 - 1) < 4 | live]
; [else-branch: 9 | !(f1(_, i@1@01 - 1) < 4) | live]
(push) ; 6
; [then-branch: 9 | f1(_, i@1@01 - 1) < 4]
(assert (< (f1 $Snap.unit (- i@1@01 1)) 4))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | !(f1(_, i@1@01 - 1) < 4)]
(assert (not (< (f1 $Snap.unit (- i@1@01 1)) 4)))
; [eval] f1(i - 3) < 6
; [eval] f1(i - 3)
; [eval] i - 3
(push) ; 7
; [eval] i >= 0
(push) ; 8
(assert (not (>= (- i@1@01 3) 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (>= (- i@1@01 3) 0))
(assert (f1%precondition $Snap.unit (- i@1@01 3)))
(pop) ; 7
; Joined path conditions
(assert (and (>= (- i@1@01 3) 0) (f1%precondition $Snap.unit (- i@1@01 3))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6 | live]
; [else-branch: 10 | !(f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | f1(_, i@1@01 - 1) < 4 || f1(_, i@1@01 - 3) < 6]
(assert (or (< (f1 $Snap.unit (- i@1@01 1)) 4) (< (f1 $Snap.unit (- i@1@01 3)) 6)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 6 | f1(_, i@1@01 - 1) >= 4]
(assert (>= (f1 $Snap.unit (- i@1@01 1)) 4))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | i@1@01 < 10]
(assert (< i@1@01 10))
(pop) ; 3
; [eval] i < 10
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@1@01 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@1@01 10)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | i@1@01 < 10 | live]
; [else-branch: 11 | !(i@1@01 < 10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | i@1@01 < 10]
(assert (< i@1@01 10))
(pop) ; 3
(push) ; 3
; [else-branch: 11 | !(i@1@01 < 10)]
(assert (not (< i@1@01 10)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- f6_termination_proof ----------
(declare-const xs@3@01 $Ref)
(declare-const x@4@01 Int)
(declare-const xs@5@01 $Ref)
(declare-const x@6@01 Int)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (=
  ($Snap.second $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@01))
    ($Snap.second ($Snap.second $t@7@01)))))
(assert (= ($Snap.first ($Snap.second $t@7@01)) $Snap.unit))
; [eval] x >= 0
(assert (>= x@6@01 0))
(assert (= ($Snap.second ($Snap.second $t@7@01)) $Snap.unit))
; [eval] f7(x)
(push) ; 2
(assert (f7%precondition $Snap.unit x@6@01))
(pop) ; 2
; Joined path conditions
(assert (f7%precondition $Snap.unit x@6@01))
(assert (f7 $Snap.unit x@6@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] x != 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@6@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@6@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | x@6@01 != 0 | live]
; [else-branch: 12 | x@6@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | x@6@01 != 0]
(assert (not (= x@6@01 0)))
; [exec]
; assert (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 4
(assert (not (decreasing<Bool> (- x@6@01 1) x@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (- x@6@01 1) x@6@01))
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
; [else-branch: 12 | x@6@01 == 0]
(assert (= x@6@01 0))
(pop) ; 3
; [eval] !(x != 0)
; [eval] x != 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@6@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@6@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | x@6@01 == 0 | live]
; [else-branch: 13 | x@6@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | x@6@01 == 0]
(assert (= x@6@01 0))
(pop) ; 3
(push) ; 3
; [else-branch: 13 | x@6@01 != 0]
(assert (not (= x@6@01 0)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- f6_pres_termination_proof ----------
(declare-const xs@8@01 $Ref)
(declare-const x@9@01 Int)
(declare-const xs@10@01 $Ref)
(declare-const x@11@01 Int)
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
(declare-const $condInEx@12@01 Bool)
; [exec]
; var b1: Bool
(declare-const b1@13@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b1@13@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | b1@13@01 | live]
; [else-branch: 14 | !(b1@13@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | b1@13@01]
(assert b1@13@01)
; [exec]
; var b: Bool
(declare-const b@14@01 Bool)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@14@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b@14@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | b@14@01 | live]
; [else-branch: 15 | !(b@14@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | b@14@01]
(assert b@14@01)
; [exec]
; inhale acc(list(xs), write)
(declare-const $t@15@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale false
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 15 | !(b@14@01)]
(assert (not b@14@01))
(pop) ; 4
; [eval] !b
(push) ; 4
(set-option :timeout 10)
(assert (not b@14@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b@14@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | !(b@14@01) | live]
; [else-branch: 16 | b@14@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | !(b@14@01)]
(assert (not b@14@01))
; [exec]
; inhale acc(list(xs), write)
(declare-const $t@16@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale false
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 16 | b@14@01]
(assert b@14@01)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 14 | !(b1@13@01)]
(assert (not b1@13@01))
(pop) ; 3
; [eval] !b1
(push) ; 3
(set-option :timeout 10)
(assert (not b1@13@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | !(b1@13@01) | live]
; [else-branch: 17 | b1@13@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 17 | !(b1@13@01)]
(assert (not b1@13@01))
; [exec]
; inhale acc(list(xs), write) && x >= 0
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.second $t@17@01) $Snap.unit))
; [eval] x >= 0
(assert (>= x@11@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x >= 0
; [eval] x >= 0
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 17 | b1@13@01]
(assert b1@13@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
