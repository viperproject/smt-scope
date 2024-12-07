(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:43
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/presCheck.vpr
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
(declare-fun f1 ($Snap Int) Int)
(declare-fun f1%limited ($Snap Int) Int)
(declare-fun f1%stateless (Int) Bool)
(declare-fun f1%precondition ($Snap Int) Bool)
(declare-fun f ($Snap Int) Int)
(declare-fun f%limited ($Snap Int) Int)
(declare-fun f%stateless (Int) Bool)
(declare-fun f%precondition ($Snap Int) Bool)
(declare-fun h_e ($Snap Int) Int)
(declare-fun h_e%limited ($Snap Int) Int)
(declare-fun h_e%stateless (Int) Bool)
(declare-fun h_e%precondition ($Snap Int) Bool)
(declare-fun h ($Snap Int) Int)
(declare-fun h%limited ($Snap Int) Int)
(declare-fun h%stateless (Int) Bool)
(declare-fun h%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION f1----------
(declare-fun x@0@00 () Int)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 $Snap.unit))
; [eval] result == x
(assert (= result@1@00 x@0@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (= (f1%limited s@$ x@0@00) (f1 s@$ x@0@00))
  :pattern ((f1 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (f1%stateless x@0@00)
  :pattern ((f1%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (let ((result@1@00 (f1%limited s@$ x@0@00))) (=>
    (f1%precondition s@$ x@0@00)
    (= result@1@00 x@0@00)))
  :pattern ((f1%limited s@$ x@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (let ((result@1@00 (f1%limited s@$ x@0@00))) true)
  :pattern ((f1%limited s@$ x@0@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] f1(x)
(set-option :timeout 0)
(push) ; 2
(assert (f1%precondition $Snap.unit x@0@00))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit x@0@00))
(assert (= result@1@00 (f1 $Snap.unit x@0@00)))
; [eval] result == x
(push) ; 2
(assert (not (= result@1@00 x@0@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@1@00 x@0@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (f1%precondition s@$ x@0@00)
    (= (f1 s@$ x@0@00) (f1%limited $Snap.unit x@0@00)))
  :pattern ((f1 s@$ x@0@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=> (f1%precondition s@$ x@0@00) (f1%precondition $Snap.unit x@0@00))
  :pattern ((f1 s@$ x@0@00))
  :qid |quant-u-11|)))
; ---------- FUNCTION f----------
(declare-fun x@2@00 () Int)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@9@00 $Snap)
(assert (= $t@9@00 $Snap.unit))
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
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (let ((result@3@00 (f%limited s@$ x@2@00))) true)
  :pattern ((f%limited s@$ x@2@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] f(x)
(set-option :timeout 0)
(push) ; 2
(assert (f%precondition $Snap.unit x@2@00))
(pop) ; 2
; Joined path conditions
(assert (f%precondition $Snap.unit x@2@00))
(assert (= result@3@00 (f $Snap.unit x@2@00)))
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
    (= (f s@$ x@2@00) (f%limited $Snap.unit x@2@00)))
  :pattern ((f s@$ x@2@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=> (f%precondition s@$ x@2@00) (f%precondition $Snap.unit x@2@00))
  :pattern ((f s@$ x@2@00))
  :qid |quant-u-15|)))
; ---------- FUNCTION h_e----------
(declare-fun x@4@00 () Int)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] f1(x) == x
; [eval] f1(x)
(push) ; 2
(assert (f1%precondition $Snap.unit x@4@00))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit x@4@00))
(assert (= (f1 $Snap.unit x@4@00) x@4@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (= (h_e%limited s@$ x@4@00) (h_e s@$ x@4@00))
  :pattern ((h_e s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (h_e%stateless x@4@00)
  :pattern ((h_e%limited s@$ x@4@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (f1%precondition $Snap.unit x@4@00))
(assert (= (f1 $Snap.unit x@4@00) x@4@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x <= 0 ? 0 : 1 + h_e(x - 1))
; [eval] x <= 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= x@4@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= x@4@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@4@00 <= 0 | live]
; [else-branch: 0 | !(x@4@00 <= 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@4@00 <= 0]
(assert (<= x@4@00 0))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(x@4@00 <= 0)]
(assert (not (<= x@4@00 0)))
; [eval] 1 + h_e(x - 1)
; [eval] h_e(x - 1)
; [eval] x - 1
(push) ; 4
; [eval] f1(x) == x
; [eval] f1(x)
(push) ; 5
(assert (f1%precondition $Snap.unit (- x@4@00 1)))
(pop) ; 5
; Joined path conditions
(assert (f1%precondition $Snap.unit (- x@4@00 1)))
(push) ; 5
(assert (not (= (f1 $Snap.unit (- x@4@00 1)) (- x@4@00 1))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= (f1 $Snap.unit (- x@4@00 1)) (- x@4@00 1)))
(assert (h_e%precondition $Snap.unit (- x@4@00 1)))
(pop) ; 4
; Joined path conditions
(assert (and
  (f1%precondition $Snap.unit (- x@4@00 1))
  (= (f1 $Snap.unit (- x@4@00 1)) (- x@4@00 1))
  (h_e%precondition $Snap.unit (- x@4@00 1))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (<= x@4@00 0))
  (and
    (not (<= x@4@00 0))
    (f1%precondition $Snap.unit (- x@4@00 1))
    (= (f1 $Snap.unit (- x@4@00 1)) (- x@4@00 1))
    (h_e%precondition $Snap.unit (- x@4@00 1)))))
(assert (or (not (<= x@4@00 0)) (<= x@4@00 0)))
(assert (= result@5@00 (ite (<= x@4@00 0) 0 (+ 1 (h_e $Snap.unit (- x@4@00 1))))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (h_e%precondition s@$ x@4@00)
    (=
      (h_e s@$ x@4@00)
      (ite (<= x@4@00 0) 0 (+ 1 (h_e%limited $Snap.unit (- x@4@00 1))))))
  :pattern ((h_e s@$ x@4@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (h_e%precondition s@$ x@4@00)
    (ite (<= x@4@00 0) true (h_e%precondition $Snap.unit (- x@4@00 1))))
  :pattern ((h_e s@$ x@4@00))
  :qid |quant-u-17|)))
; ---------- FUNCTION h----------
(declare-fun x@6@00 () Int)
(declare-fun result@7@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] f(x) == 0
; [eval] f(x)
(push) ; 2
(assert (f%precondition $Snap.unit x@6@00))
(pop) ; 2
; Joined path conditions
(assert (f%precondition $Snap.unit x@6@00))
(assert (= (f $Snap.unit x@6@00) 0))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] f1(x) == 0
; [eval] f1(x)
(push) ; 2
(assert (f1%precondition $Snap.unit x@6@00))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit x@6@00))
(assert (= (f1 $Snap.unit x@6@00) 0))
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 ($Snap.combine ($Snap.first $t@10@00) ($Snap.second $t@10@00))))
(assert (= ($Snap.first $t@10@00) $Snap.unit))
; [eval] result == x
(assert (= result@7@00 x@6@00))
(assert (= ($Snap.second $t@10@00) $Snap.unit))
; [eval] result > 0 ==> result == h(result - 1) + 1
; [eval] result > 0
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> result@7@00 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | result@7@00 > 0 | dead]
; [else-branch: 1 | !(result@7@00 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 1 | !(result@7@00 > 0)]
(assert (not (> result@7@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (not (> result@7@00 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (= (h%limited s@$ x@6@00) (h s@$ x@6@00))
  :pattern ((h s@$ x@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (h%stateless x@6@00)
  :pattern ((h%limited s@$ x@6@00))
  :qid |quant-u-7|)))
(declare-const $unresolved@11@00 $Snap)
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (let ((result@7@00 (h%limited s@$ x@6@00))) (=>
    (h%precondition s@$ x@6@00)
    (and
      (= result@7@00 x@6@00)
      (=>
        (> result@7@00 0)
        (= result@7@00 (+ (h%limited $unresolved@11@00 (- result@7@00 1)) 1))))))
  :pattern ((h%limited s@$ x@6@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (let ((result@7@00 (h%limited s@$ x@6@00))) true)
  :pattern ((h%limited s@$ x@6@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (let ((result@7@00 (h%limited s@$ x@6@00))) (=>
    (and (h%precondition s@$ x@6@00) (> result@7@00 0))
    (h%precondition $unresolved@11@00 (- result@7@00 1))))
  :pattern ((h%limited s@$ x@6@00))
  :qid |quant-u-20|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (f%precondition $Snap.unit x@6@00))
(assert (= (f $Snap.unit x@6@00) 0))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (f1%precondition $Snap.unit x@6@00))
(assert (= (f1 $Snap.unit x@6@00) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x == 0 ? 0 : 1 + h(x - 1))
; [eval] x == 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@6@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@6@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@6@00 == 0 | live]
; [else-branch: 2 | x@6@00 != 0 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | x@6@00 == 0]
(assert (= x@6@00 0))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (= x@6@00 0))
(assert (= result@7@00 0))
; [eval] result == x
(push) ; 2
(assert (not (= result@7@00 x@6@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@7@00 x@6@00))
; [eval] result > 0 ==> result == h(result - 1) + 1
; [eval] result > 0
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> result@7@00 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | result@7@00 > 0 | dead]
; [else-branch: 3 | !(result@7@00 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 3 | !(result@7@00 > 0)]
(assert (not (> result@7@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (not (> result@7@00 0)))
(pop) ; 1
(declare-const $unresolved@12@00 $Snap)
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (=>
    (h%precondition s@$ x@6@00)
    (=
      (h s@$ x@6@00)
      (ite (= x@6@00 0) 0 (+ 1 (h%limited $unresolved@12@00 (- x@6@00 1))))))
  :pattern ((h s@$ x@6@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (=>
    (h%precondition s@$ x@6@00)
    (ite (= x@6@00 0) true (h%precondition $unresolved@12@00 (- x@6@00 1))))
  :pattern ((h s@$ x@6@00))
  :qid |quant-u-22|)))
