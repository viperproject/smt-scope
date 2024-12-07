(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:06
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/expressions/letexpr.vpr
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
(declare-fun f ($Snap Int) Int)
(declare-fun f%limited ($Snap Int) Int)
(declare-fun f%stateless (Int) Bool)
(declare-fun f%precondition ($Snap Int) Bool)
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
(declare-fun letvar@4@00 ($Snap Int) Int)
(declare-fun letvar@6@00 ($Snap Int) Int)
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (= (g%limited s@$ y@0@00) (g s@$ y@0@00))
  :pattern ((g s@$ y@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (g%stateless y@0@00)
  :pattern ((g%limited s@$ y@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (=>
    (g%precondition s@$ y@0@00)
    (=
      (g s@$ y@0@00)
      (let ((i (g%limited $Snap.unit y@0@00))) (ite
        (not (= y@0@00 0))
        (g%limited $Snap.unit (- y@0@00 1))
        i))))
  :pattern ((g s@$ y@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (=>
    (g%precondition s@$ y@0@00)
    (and
      (g%precondition $Snap.unit y@0@00)
      (let ((i (g%limited $Snap.unit y@0@00))) (ite
        (not (= y@0@00 0))
        (g%precondition $Snap.unit (- y@0@00 1))
        true))))
  :pattern ((g s@$ y@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (= (f%limited s@$ x@2@00) (f s@$ x@2@00))
  :pattern ((f s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (f%stateless x@2@00)
  :pattern ((f%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (let ((result@3@00 (f%limited s@$ x@2@00))) (=>
    (f%precondition s@$ x@2@00)
    (= result@3@00 x@2@00)))
  :pattern ((f%limited s@$ x@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (let ((result@3@00 (f%limited s@$ x@2@00))) true)
  :pattern ((f%limited s@$ x@2@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (f%precondition s@$ x@2@00)
    (=
      (f s@$ x@2@00)
      (ite
        (> x@2@00 0)
        (let ((y (f%limited $Snap.unit (- x@2@00 1)))) (+
          (f%limited $Snap.unit y)
          1))
        x@2@00)))
  :pattern ((f s@$ x@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (f%precondition s@$ x@2@00)
    (ite
      (> x@2@00 0)
      (and
        (f%precondition $Snap.unit (- x@2@00 1))
        (let ((y (f%limited $Snap.unit (- x@2@00 1)))) (f%precondition $Snap.unit y)))
      true))
  :pattern ((f s@$ x@2@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- f_termination_proof ----------
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
; [eval] x > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@1@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@1@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@1@01 > 0 | live]
; [else-branch: 0 | !(x@1@01 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@1@01 > 0]
(assert (> x@1@01 0))
; [exec]
; var y: Int
(declare-const y@2@01 Int)
; [exec]
; assert !old(x >= 0) || x - 1 >= 0
; [eval] !old(x >= 0) || x - 1 >= 0
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
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@1@01 >= 0 | live]
; [else-branch: 2 | !(x@1@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 2 | x@1@01 >= 0]
(assert (>= x@1@01 0))
; [eval] (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 6
; [then-branch: 3 | !(decreasing[Bool](x@1@01 - 1, x@1@01)) | live]
; [else-branch: 3 | decreasing[Bool](x@1@01 - 1, x@1@01) | live]
(push) ; 7
; [then-branch: 3 | !(decreasing[Bool](x@1@01 - 1, x@1@01))]
(assert (not (decreasing<Bool> (- x@1@01 1) x@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | decreasing[Bool](x@1@01 - 1, x@1@01)]
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
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= x@1@01 0)
  (and
    (>= x@1@01 0)
    (or
      (decreasing<Bool> (- x@1@01 1) x@1@01)
      (not (decreasing<Bool> (- x@1@01 1) x@1@01))))))
(assert (>= x@1@01 0))
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
; inhale y == f(x - 1)
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] y == f(x - 1)
; [eval] f(x - 1)
; [eval] x - 1
(push) ; 4
(assert (f%precondition $Snap.unit (- x@1@01 1)))
(pop) ; 4
; Joined path conditions
(assert (f%precondition $Snap.unit (- x@1@01 1)))
(assert (= y@2@01 (f $Snap.unit (- x@1@01 1))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert !old(x >= 0) || y >= 0
; [eval] !old(x >= 0) || y >= 0
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | !(x@1@01 >= 0) | live]
; [else-branch: 4 | x@1@01 >= 0 | live]
(push) ; 5
; [then-branch: 4 | !(x@1@01 >= 0)]
(assert (not (>= x@1@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | x@1@01 >= 0]
; [eval] y >= 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
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
;   (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] old(x >= 0) ==> (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
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
; [then-branch: 5 | x@1@01 >= 0 | live]
; [else-branch: 5 | !(x@1@01 >= 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | x@1@01 >= 0]
; [eval] (decreasing(y, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(y, old(x)): Bool)
; [eval] old(x)
(push) ; 6
; [then-branch: 6 | !(decreasing[Bool](y@2@01, x@1@01)) | live]
; [else-branch: 6 | decreasing[Bool](y@2@01, x@1@01) | live]
(push) ; 7
; [then-branch: 6 | !(decreasing[Bool](y@2@01, x@1@01))]
(assert (not (decreasing<Bool> y@2@01 x@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | decreasing[Bool](y@2@01, x@1@01)]
(assert (decreasing<Bool> y@2@01 x@1@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@2@01 x@1@01) (not (decreasing<Bool> y@2@01 x@1@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= x@1@01 0)
  (or (decreasing<Bool> y@2@01 x@1@01) (not (decreasing<Bool> y@2@01 x@1@01)))))
(push) ; 4
(assert (not (=> (>= x@1@01 0) (and (decreasing<Bool> y@2@01 x@1@01) (bounded<Bool> x@1@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> (>= x@1@01 0) (and (decreasing<Bool> y@2@01 x@1@01) (bounded<Bool> x@1@01))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(x@1@01 > 0)]
(assert (not (> x@1@01 0)))
(pop) ; 3
; [eval] !(x > 0)
; [eval] x > 0
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@1@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@1@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(x@1@01 > 0) | live]
; [else-branch: 7 | x@1@01 > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | !(x@1@01 > 0)]
(assert (not (> x@1@01 0)))
(pop) ; 3
(push) ; 3
; [else-branch: 7 | x@1@01 > 0]
(assert (> x@1@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- g_termination_proof ----------
(declare-const y@4@01 Int)
(declare-const y@5@01 Int)
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
; var i: Int
(declare-const i@6@01 Int)
; [exec]
; assert !old(y >= 0) || y >= 0
; [eval] !old(y >= 0) || y >= 0
; [eval] !old(y >= 0)
; [eval] old(y >= 0)
; [eval] y >= 0
(push) ; 3
; [then-branch: 8 | !(y@5@01 >= 0) | live]
; [else-branch: 8 | y@5@01 >= 0 | live]
(push) ; 4
; [then-branch: 8 | !(y@5@01 >= 0)]
(assert (not (>= y@5@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | y@5@01 >= 0]
(assert (>= y@5@01 0))
; [eval] y >= 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (>= y@5@01 0) (not (>= y@5@01 0))))
(push) ; 3
(assert (not (or (not (>= y@5@01 0)) (>= y@5@01 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or (not (>= y@5@01 0)) (>= y@5@01 0)))
; [exec]
; assert old(y >= 0) ==>
;   (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] old(y >= 0) ==> (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] old(y >= 0)
; [eval] y >= 0
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (>= y@5@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>= y@5@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | y@5@01 >= 0 | live]
; [else-branch: 9 | !(y@5@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | y@5@01 >= 0]
(assert (>= y@5@01 0))
; [eval] (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] (decreasing(y, old(y)): Bool)
; [eval] old(y)
(push) ; 5
; [then-branch: 10 | !(decreasing[Bool](y@5@01, y@5@01)) | live]
; [else-branch: 10 | decreasing[Bool](y@5@01, y@5@01) | live]
(push) ; 6
; [then-branch: 10 | !(decreasing[Bool](y@5@01, y@5@01))]
(assert (not (decreasing<Bool> y@5@01 y@5@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | decreasing[Bool](y@5@01, y@5@01)]
(assert (decreasing<Bool> y@5@01 y@5@01))
; [eval] (bounded(old(y)): Bool)
; [eval] old(y)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@5@01 y@5@01) (not (decreasing<Bool> y@5@01 y@5@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(y@5@01 >= 0)]
(assert (not (>= y@5@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (>= y@5@01 0)
  (and
    (>= y@5@01 0)
    (or (decreasing<Bool> y@5@01 y@5@01) (not (decreasing<Bool> y@5@01 y@5@01))))))
; Joined path conditions
(push) ; 3
(assert (not (=> (>= y@5@01 0) (and (decreasing<Bool> y@5@01 y@5@01) (bounded<Bool> y@5@01)))))
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
; [eval] old(y >= 0) ==> (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] old(y >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y >= 0
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (>= y@5@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>= y@5@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | y@5@01 >= 0 | live]
; [else-branch: 11 | !(y@5@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | y@5@01 >= 0]
(assert (>= y@5@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] (decreasing(y, old(y)): Bool)
; [eval] old(y)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | !(decreasing[Bool](y@5@01, y@5@01)) | live]
; [else-branch: 12 | decreasing[Bool](y@5@01, y@5@01) | live]
(push) ; 6
; [then-branch: 12 | !(decreasing[Bool](y@5@01, y@5@01))]
(assert (not (decreasing<Bool> y@5@01 y@5@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 12 | decreasing[Bool](y@5@01, y@5@01)]
(assert (decreasing<Bool> y@5@01 y@5@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(y)): Bool)
; [eval] old(y)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@5@01 y@5@01) (not (decreasing<Bool> y@5@01 y@5@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 11 | !(y@5@01 >= 0)]
(assert (not (>= y@5@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (>= y@5@01 0) (and (decreasing<Bool> y@5@01 y@5@01) (bounded<Bool> y@5@01)))))
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
; [eval] old(y >= 0) ==> (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] old(y >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y >= 0
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (>= y@5@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>= y@5@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | y@5@01 >= 0 | live]
; [else-branch: 13 | !(y@5@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | y@5@01 >= 0]
(assert (>= y@5@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] (decreasing(y, old(y)): Bool)
; [eval] old(y)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
; [then-branch: 14 | !(decreasing[Bool](y@5@01, y@5@01)) | live]
; [else-branch: 14 | decreasing[Bool](y@5@01, y@5@01) | live]
(push) ; 6
; [then-branch: 14 | !(decreasing[Bool](y@5@01, y@5@01))]
(assert (not (decreasing<Bool> y@5@01 y@5@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 14 | decreasing[Bool](y@5@01, y@5@01)]
(assert (decreasing<Bool> y@5@01 y@5@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(y)): Bool)
; [eval] old(y)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@5@01 y@5@01) (not (decreasing<Bool> y@5@01 y@5@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 13 | !(y@5@01 >= 0)]
(assert (not (>= y@5@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (>= y@5@01 0) (and (decreasing<Bool> y@5@01 y@5@01) (bounded<Bool> y@5@01)))))
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
; [eval] old(y >= 0) ==> (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] old(y >= 0)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; [eval] y >= 0
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (>= y@5@01 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>= y@5@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | y@5@01 >= 0 | live]
; [else-branch: 15 | !(y@5@01 >= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | y@5@01 >= 0]
(assert (>= y@5@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (decreasing(y, old(y)): Bool) && (bounded(old(y)): Bool)
; [eval] (decreasing(y, old(y)): Bool)
; [eval] old(y)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 5
; [then-branch: 16 | !(decreasing[Bool](y@5@01, y@5@01)) | live]
; [else-branch: 16 | decreasing[Bool](y@5@01, y@5@01) | live]
(push) ; 6
; [then-branch: 16 | !(decreasing[Bool](y@5@01, y@5@01))]
(assert (not (decreasing<Bool> y@5@01 y@5@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 16 | decreasing[Bool](y@5@01, y@5@01)]
(assert (decreasing<Bool> y@5@01 y@5@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (bounded(old(y)): Bool)
; [eval] old(y)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (decreasing<Bool> y@5@01 y@5@01) (not (decreasing<Bool> y@5@01 y@5@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 15 | !(y@5@01 >= 0)]
(assert (not (>= y@5@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (>= y@5@01 0) (and (decreasing<Bool> y@5@01 y@5@01) (bounded<Bool> y@5@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
