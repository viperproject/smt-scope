(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/specOrder.vpr
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
(declare-fun fun5 ($Snap Int) Int)
(declare-fun fun5%limited ($Snap Int) Int)
(declare-fun fun5%stateless (Int) Bool)
(declare-fun fun5%precondition ($Snap Int) Bool)
(declare-fun fun1 ($Snap Int) Int)
(declare-fun fun1%limited ($Snap Int) Int)
(declare-fun fun1%stateless (Int) Bool)
(declare-fun fun1%precondition ($Snap Int) Bool)
(declare-fun fun2 ($Snap Int) Int)
(declare-fun fun2%limited ($Snap Int) Int)
(declare-fun fun2%stateless (Int) Bool)
(declare-fun fun2%precondition ($Snap Int) Bool)
(declare-fun fun6 ($Snap Int) Int)
(declare-fun fun6%limited ($Snap Int) Int)
(declare-fun fun6%stateless (Int) Bool)
(declare-fun fun6%precondition ($Snap Int) Bool)
(declare-fun fun3 ($Snap Int) Int)
(declare-fun fun3%limited ($Snap Int) Int)
(declare-fun fun3%stateless (Int) Bool)
(declare-fun fun3%precondition ($Snap Int) Bool)
(declare-fun fun4 ($Snap Int) Int)
(declare-fun fun4%limited ($Snap Int) Int)
(declare-fun fun4%stateless (Int) Bool)
(declare-fun fun4%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION fun5----------
(declare-fun x@0@00 () Int)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
(declare-const $t@12@00 $Snap)
(assert (= $t@12@00 $Snap.unit))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (= (fun5%limited s@$ x@0@00) (fun5 s@$ x@0@00))
  :pattern ((fun5 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (fun5%stateless x@0@00)
  :pattern ((fun5%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (let ((result@1@00 (fun5%limited s@$ x@0@00))) true)
  :pattern ((fun5%limited s@$ x@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (let ((result@1@00 (fun5%limited s@$ x@0@00))) true)
  :pattern ((fun5%limited s@$ x@0@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x > -10 ? fun5(x - 1) : 6)
; [eval] x > -10
; [eval] -10
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@0@00 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@0@00 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@0@00 > -10 | live]
; [else-branch: 0 | !(x@0@00 > -10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@0@00 > -10]
(assert (> x@0@00 (- 0 10)))
; [eval] fun5(x - 1)
; [eval] x - 1
(push) ; 4
(assert (fun5%precondition $Snap.unit (- x@0@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fun5%precondition $Snap.unit (- x@0@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(x@0@00 > -10)]
(assert (not (> x@0@00 (- 0 10))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> x@0@00 (- 0 10))
  (and (> x@0@00 (- 0 10)) (fun5%precondition $Snap.unit (- x@0@00 1)))))
; Joined path conditions
(assert (or (not (> x@0@00 (- 0 10))) (> x@0@00 (- 0 10))))
(assert (= result@1@00 (ite (> x@0@00 (- 0 10)) (fun5 $Snap.unit (- x@0@00 1)) 6)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (fun5%precondition s@$ x@0@00)
    (=
      (fun5 s@$ x@0@00)
      (ite (> x@0@00 (- 0 10)) (fun5%limited $Snap.unit (- x@0@00 1)) 6)))
  :pattern ((fun5 s@$ x@0@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (fun5%precondition s@$ x@0@00)
    (ite (> x@0@00 (- 0 10)) (fun5%precondition $Snap.unit (- x@0@00 1)) true))
  :pattern ((fun5 s@$ x@0@00))
  :qid |quant-u-15|)))
; ---------- FUNCTION fun1----------
(declare-fun x@2@00 () Int)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(declare-const $t@13@00 $Snap)
(assert (= $t@13@00 $Snap.unit))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (= (fun1%limited s@$ x@2@00) (fun1 s@$ x@2@00))
  :pattern ((fun1 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (fun1%stateless x@2@00)
  :pattern ((fun1%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (let ((result@3@00 (fun1%limited s@$ x@2@00))) true)
  :pattern ((fun1%limited s@$ x@2@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (let ((result@3@00 (fun1%limited s@$ x@2@00))) true)
  :pattern ((fun1%limited s@$ x@2@00))
  :qid |quant-u-17|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x > -10 ? fun1(x - 1) : 6)
; [eval] x > -10
; [eval] -10
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@2@00 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@2@00 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@2@00 > -10 | live]
; [else-branch: 1 | !(x@2@00 > -10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | x@2@00 > -10]
(assert (> x@2@00 (- 0 10)))
; [eval] fun1(x - 1)
; [eval] x - 1
(push) ; 4
(assert (fun1%precondition $Snap.unit (- x@2@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fun1%precondition $Snap.unit (- x@2@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(x@2@00 > -10)]
(assert (not (> x@2@00 (- 0 10))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> x@2@00 (- 0 10))
  (and (> x@2@00 (- 0 10)) (fun1%precondition $Snap.unit (- x@2@00 1)))))
; Joined path conditions
(assert (or (not (> x@2@00 (- 0 10))) (> x@2@00 (- 0 10))))
(assert (= result@3@00 (ite (> x@2@00 (- 0 10)) (fun1 $Snap.unit (- x@2@00 1)) 6)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (fun1%precondition s@$ x@2@00)
    (=
      (fun1 s@$ x@2@00)
      (ite (> x@2@00 (- 0 10)) (fun1%limited $Snap.unit (- x@2@00 1)) 6)))
  :pattern ((fun1 s@$ x@2@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (fun1%precondition s@$ x@2@00)
    (ite (> x@2@00 (- 0 10)) (fun1%precondition $Snap.unit (- x@2@00 1)) true))
  :pattern ((fun1 s@$ x@2@00))
  :qid |quant-u-19|)))
; ---------- FUNCTION fun2----------
(declare-fun x@4@00 () Int)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(declare-const $t@14@00 $Snap)
(assert (= $t@14@00 $Snap.unit))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (= (fun2%limited s@$ x@4@00) (fun2 s@$ x@4@00))
  :pattern ((fun2 s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (fun2%stateless x@4@00)
  :pattern ((fun2%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (fun2%limited s@$ x@4@00))) true)
  :pattern ((fun2%limited s@$ x@4@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (fun2%limited s@$ x@4@00))) true)
  :pattern ((fun2%limited s@$ x@4@00))
  :qid |quant-u-21|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x > -10 ? fun2(x - 1) : 6)
; [eval] x > -10
; [eval] -10
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@4@00 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@4@00 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@4@00 > -10 | live]
; [else-branch: 2 | !(x@4@00 > -10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | x@4@00 > -10]
(assert (> x@4@00 (- 0 10)))
; [eval] fun2(x - 1)
; [eval] x - 1
(push) ; 4
(assert (fun2%precondition $Snap.unit (- x@4@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fun2%precondition $Snap.unit (- x@4@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | !(x@4@00 > -10)]
(assert (not (> x@4@00 (- 0 10))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> x@4@00 (- 0 10))
  (and (> x@4@00 (- 0 10)) (fun2%precondition $Snap.unit (- x@4@00 1)))))
; Joined path conditions
(assert (or (not (> x@4@00 (- 0 10))) (> x@4@00 (- 0 10))))
(assert (= result@5@00 (ite (> x@4@00 (- 0 10)) (fun2 $Snap.unit (- x@4@00 1)) 6)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (fun2%precondition s@$ x@4@00)
    (=
      (fun2 s@$ x@4@00)
      (ite (> x@4@00 (- 0 10)) (fun2%limited $Snap.unit (- x@4@00 1)) 6)))
  :pattern ((fun2 s@$ x@4@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (fun2%precondition s@$ x@4@00)
    (ite (> x@4@00 (- 0 10)) (fun2%precondition $Snap.unit (- x@4@00 1)) true))
  :pattern ((fun2 s@$ x@4@00))
  :qid |quant-u-23|)))
; ---------- FUNCTION fun6----------
(declare-fun x@6@00 () Int)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(declare-const $t@15@00 $Snap)
(assert (= $t@15@00 $Snap.unit))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (= (fun6%limited s@$ x@6@00) (fun6 s@$ x@6@00))
  :pattern ((fun6 s@$ x@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (fun6%stateless x@6@00)
  :pattern ((fun6%limited s@$ x@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (let ((result@7@00 (fun6%limited s@$ x@6@00))) true)
  :pattern ((fun6%limited s@$ x@6@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (let ((result@7@00 (fun6%limited s@$ x@6@00))) true)
  :pattern ((fun6%limited s@$ x@6@00))
  :qid |quant-u-25|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x > -10 ? fun6(x - 1) : 6)
; [eval] x > -10
; [eval] -10
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@6@00 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@6@00 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | x@6@00 > -10 | live]
; [else-branch: 3 | !(x@6@00 > -10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | x@6@00 > -10]
(assert (> x@6@00 (- 0 10)))
; [eval] fun6(x - 1)
; [eval] x - 1
(push) ; 4
(assert (fun6%precondition $Snap.unit (- x@6@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fun6%precondition $Snap.unit (- x@6@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | !(x@6@00 > -10)]
(assert (not (> x@6@00 (- 0 10))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> x@6@00 (- 0 10))
  (and (> x@6@00 (- 0 10)) (fun6%precondition $Snap.unit (- x@6@00 1)))))
; Joined path conditions
(assert (or (not (> x@6@00 (- 0 10))) (> x@6@00 (- 0 10))))
(assert (= result@7@00 (ite (> x@6@00 (- 0 10)) (fun6 $Snap.unit (- x@6@00 1)) 6)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (=>
    (fun6%precondition s@$ x@6@00)
    (=
      (fun6 s@$ x@6@00)
      (ite (> x@6@00 (- 0 10)) (fun6%limited $Snap.unit (- x@6@00 1)) 6)))
  :pattern ((fun6 s@$ x@6@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (=>
    (fun6%precondition s@$ x@6@00)
    (ite (> x@6@00 (- 0 10)) (fun6%precondition $Snap.unit (- x@6@00 1)) true))
  :pattern ((fun6 s@$ x@6@00))
  :qid |quant-u-27|)))
; ---------- FUNCTION fun3----------
(declare-fun x@8@00 () Int)
(declare-fun result@9@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(declare-const $t@16@00 $Snap)
(assert (= $t@16@00 $Snap.unit))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (= (fun3%limited s@$ x@8@00) (fun3 s@$ x@8@00))
  :pattern ((fun3 s@$ x@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (fun3%stateless x@8@00)
  :pattern ((fun3%limited s@$ x@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (let ((result@9@00 (fun3%limited s@$ x@8@00))) true)
  :pattern ((fun3%limited s@$ x@8@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (let ((result@9@00 (fun3%limited s@$ x@8@00))) true)
  :pattern ((fun3%limited s@$ x@8@00))
  :qid |quant-u-29|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x > -10 ? fun3(x - 1) : 6)
; [eval] x > -10
; [eval] -10
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@8@00 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@8@00 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | x@8@00 > -10 | live]
; [else-branch: 4 | !(x@8@00 > -10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | x@8@00 > -10]
(assert (> x@8@00 (- 0 10)))
; [eval] fun3(x - 1)
; [eval] x - 1
(push) ; 4
(assert (fun3%precondition $Snap.unit (- x@8@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fun3%precondition $Snap.unit (- x@8@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | !(x@8@00 > -10)]
(assert (not (> x@8@00 (- 0 10))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> x@8@00 (- 0 10))
  (and (> x@8@00 (- 0 10)) (fun3%precondition $Snap.unit (- x@8@00 1)))))
; Joined path conditions
(assert (or (not (> x@8@00 (- 0 10))) (> x@8@00 (- 0 10))))
(assert (= result@9@00 (ite (> x@8@00 (- 0 10)) (fun3 $Snap.unit (- x@8@00 1)) 6)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (=>
    (fun3%precondition s@$ x@8@00)
    (=
      (fun3 s@$ x@8@00)
      (ite (> x@8@00 (- 0 10)) (fun3%limited $Snap.unit (- x@8@00 1)) 6)))
  :pattern ((fun3 s@$ x@8@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (x@8@00 Int)) (!
  (=>
    (fun3%precondition s@$ x@8@00)
    (ite (> x@8@00 (- 0 10)) (fun3%precondition $Snap.unit (- x@8@00 1)) true))
  :pattern ((fun3 s@$ x@8@00))
  :qid |quant-u-31|)))
; ---------- FUNCTION fun4----------
(declare-fun x@10@00 () Int)
(declare-fun result@11@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(declare-const $t@17@00 $Snap)
(assert (= $t@17@00 $Snap.unit))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (= (fun4%limited s@$ x@10@00) (fun4 s@$ x@10@00))
  :pattern ((fun4 s@$ x@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (fun4%stateless x@10@00)
  :pattern ((fun4%limited s@$ x@10@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (let ((result@11@00 (fun4%limited s@$ x@10@00))) true)
  :pattern ((fun4%limited s@$ x@10@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (let ((result@11@00 (fun4%limited s@$ x@10@00))) true)
  :pattern ((fun4%limited s@$ x@10@00))
  :qid |quant-u-33|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x > -10 ? fun4(x - 1) : 6)
; [eval] x > -10
; [eval] -10
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> x@10@00 (- 0 10)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> x@10@00 (- 0 10))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | x@10@00 > -10 | live]
; [else-branch: 5 | !(x@10@00 > -10) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | x@10@00 > -10]
(assert (> x@10@00 (- 0 10)))
; [eval] fun4(x - 1)
; [eval] x - 1
(push) ; 4
(assert (fun4%precondition $Snap.unit (- x@10@00 1)))
(pop) ; 4
; Joined path conditions
(assert (fun4%precondition $Snap.unit (- x@10@00 1)))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | !(x@10@00 > -10)]
(assert (not (> x@10@00 (- 0 10))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> x@10@00 (- 0 10))
  (and (> x@10@00 (- 0 10)) (fun4%precondition $Snap.unit (- x@10@00 1)))))
; Joined path conditions
(assert (or (not (> x@10@00 (- 0 10))) (> x@10@00 (- 0 10))))
(assert (= result@11@00 (ite (> x@10@00 (- 0 10)) (fun4 $Snap.unit (- x@10@00 1)) 6)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (=>
    (fun4%precondition s@$ x@10@00)
    (=
      (fun4 s@$ x@10@00)
      (ite (> x@10@00 (- 0 10)) (fun4%limited $Snap.unit (- x@10@00 1)) 6)))
  :pattern ((fun4 s@$ x@10@00))
  :qid |quant-u-34|)))
(assert (forall ((s@$ $Snap) (x@10@00 Int)) (!
  (=>
    (fun4%precondition s@$ x@10@00)
    (ite (> x@10@00 (- 0 10)) (fun4%precondition $Snap.unit (- x@10@00 1)) true))
  :pattern ((fun4 s@$ x@10@00))
  :qid |quant-u-35|)))
