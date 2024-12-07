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
; ---------- FUNCTION g----------
(declare-fun y@0@00 () Int)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (= (g%limited s@$ y@0@00) (g s@$ y@0@00))
  :pattern ((g s@$ y@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int)) (!
  (g%stateless y@0@00)
  :pattern ((g%limited s@$ y@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (let i == (g(y)) in (y != 0 ? g(y - 1) : i))
; [eval] g(y)
(set-option :timeout 0)
(push) ; 2
(assert (g%precondition $Snap.unit y@0@00))
(pop) ; 2
; Joined path conditions
(assert (g%precondition $Snap.unit y@0@00))
(declare-fun letvar@4@00 ($Snap Int) Int)
(assert (= (letvar@4@00 s@$ y@0@00) (g $Snap.unit y@0@00)))
; [eval] (y != 0 ? g(y - 1) : i)
; [eval] y != 0
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@0@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= y@0@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | y@0@00 != 0 | live]
; [else-branch: 0 | y@0@00 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | y@0@00 != 0]
(assert (not (= y@0@00 0)))
; [eval] g(y - 1)
; [eval] y - 1
(push) ; 4
(assert (g%precondition $Snap.unit (- y@0@00 1)))
(pop) ; 4
; Joined path conditions
(assert (g%precondition $Snap.unit (- y@0@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | y@0@00 == 0]
(assert (= y@0@00 0))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (not (= y@0@00 0))
  (and (not (= y@0@00 0)) (g%precondition $Snap.unit (- y@0@00 1)))))
; Joined path conditions
(assert (or (= y@0@00 0) (not (= y@0@00 0))))
(assert (=
  result@1@00
  (ite (not (= y@0@00 0)) (g $Snap.unit (- y@0@00 1)) (g $Snap.unit y@0@00))))
(pop) ; 1
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
; ---------- FUNCTION f----------
(declare-fun x@2@00 () Int)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@5@00 $Snap)
(assert (= $t@5@00 $Snap.unit))
; [eval] result == x
(assert (= result@3@00 x@2@00))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x > 0 ? (let y == (f(x - 1)) in f(y) + 1) : x)
; [eval] x > 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@2@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@2@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@2@00 > 0 | live]
; [else-branch: 1 | !(x@2@00 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | x@2@00 > 0]
(assert (> x@2@00 0))
; [eval] (let y == (f(x - 1)) in f(y) + 1)
; [eval] f(x - 1)
; [eval] x - 1
(push) ; 4
(assert (f%precondition $Snap.unit (- x@2@00 1)))
(pop) ; 4
; Joined path conditions
(assert (f%precondition $Snap.unit (- x@2@00 1)))
(declare-fun letvar@6@00 ($Snap Int) Int)
(assert (= (letvar@6@00 s@$ x@2@00) (f $Snap.unit (- x@2@00 1))))
; [eval] f(y) + 1
; [eval] f(y)
(push) ; 4
(assert (f%precondition $Snap.unit (f $Snap.unit (- x@2@00 1))))
(pop) ; 4
; Joined path conditions
(assert (f%precondition $Snap.unit (f $Snap.unit (- x@2@00 1))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(x@2@00 > 0)]
(assert (not (> x@2@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> x@2@00 0)
  (and
    (> x@2@00 0)
    (f%precondition $Snap.unit (- x@2@00 1))
    (= (letvar@6@00 s@$ x@2@00) (f $Snap.unit (- x@2@00 1)))
    (f%precondition $Snap.unit (f $Snap.unit (- x@2@00 1))))))
; Joined path conditions
(assert (or (not (> x@2@00 0)) (> x@2@00 0)))
(assert (=
  result@3@00
  (ite (> x@2@00 0) (+ (f $Snap.unit (f $Snap.unit (- x@2@00 1))) 1) x@2@00)))
; [eval] result == x
(push) ; 2
(assert (not (= result@3@00 x@2@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 x@2@00))
(pop) ; 1
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
