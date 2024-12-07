(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:40
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/basic/postsCheck.vpr
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
(declare-fun foo ($Snap Int) Int)
(declare-fun foo%limited ($Snap Int) Int)
(declare-fun foo%stateless (Int) Bool)
(declare-fun foo%precondition ($Snap Int) Bool)
(declare-fun h ($Snap Int) Int)
(declare-fun h%limited ($Snap Int) Int)
(declare-fun h%stateless (Int) Bool)
(declare-fun h%precondition ($Snap Int) Bool)
(declare-fun g ($Snap Int) Int)
(declare-fun g%limited ($Snap Int) Int)
(declare-fun g%stateless (Int) Bool)
(declare-fun g%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION foo----------
(declare-fun x@0@00 () Int)
(declare-fun result@1@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] x >= 0
(assert (>= x@0@00 0))
(declare-const $t@6@00 $Snap)
(assert (= $t@6@00 ($Snap.combine ($Snap.first $t@6@00) ($Snap.second $t@6@00))))
(assert (= ($Snap.first $t@6@00) $Snap.unit))
; [eval] result == x
(assert (= result@1@00 x@0@00))
(assert (= ($Snap.second $t@6@00) $Snap.unit))
; [eval] result == foo(result)
; [eval] foo(result)
(push) ; 2
; [eval] x >= 0
(push) ; 3
(assert (not (>= result@1@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= result@1@00 0))
(assert (foo%precondition $Snap.unit result@1@00))
(pop) ; 2
; Joined path conditions
(assert (and (>= result@1@00 0) (foo%precondition $Snap.unit result@1@00)))
(assert (= result@1@00 (foo $Snap.unit result@1@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (= (foo%limited s@$ x@0@00) (foo s@$ x@0@00))
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (foo%stateless x@0@00)
  :pattern ((foo%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (let ((result@1@00 (foo%limited s@$ x@0@00))) (=>
    (foo%precondition s@$ x@0@00)
    (and
      (= result@1@00 x@0@00)
      (= result@1@00 (foo%limited $Snap.unit result@1@00)))))
  :pattern ((foo%limited s@$ x@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (let ((result@1@00 (foo%limited s@$ x@0@00))) true)
  :pattern ((foo%limited s@$ x@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (let ((result@1@00 (foo%limited s@$ x@0@00))) (=>
    (foo%precondition s@$ x@0@00)
    (foo%precondition $Snap.unit result@1@00)))
  :pattern ((foo%limited s@$ x@0@00))
  :qid |quant-u-8|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (>= x@0@00 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x == 0 ? 0 : 1 + foo(x - 1))
; [eval] x == 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@0@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@0@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@0@00 == 0 | live]
; [else-branch: 0 | x@0@00 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@0@00 == 0]
(assert (= x@0@00 0))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | x@0@00 != 0]
(assert (not (= x@0@00 0)))
; [eval] 1 + foo(x - 1)
; [eval] foo(x - 1)
; [eval] x - 1
(push) ; 4
; [eval] x >= 0
(push) ; 5
(assert (not (>= (- x@0@00 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- x@0@00 1) 0))
(assert (foo%precondition $Snap.unit (- x@0@00 1)))
(pop) ; 4
; Joined path conditions
(assert (and (>= (- x@0@00 1) 0) (foo%precondition $Snap.unit (- x@0@00 1))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= x@0@00 0))
  (and
    (not (= x@0@00 0))
    (>= (- x@0@00 1) 0)
    (foo%precondition $Snap.unit (- x@0@00 1)))))
(assert (or (not (= x@0@00 0)) (= x@0@00 0)))
(assert (= result@1@00 (ite (= x@0@00 0) 0 (+ 1 (foo $Snap.unit (- x@0@00 1))))))
; [eval] result == x
(push) ; 2
(assert (not (= result@1@00 x@0@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@1@00 x@0@00))
; [eval] result == foo(result)
; [eval] foo(result)
(push) ; 2
; [eval] x >= 0
(push) ; 3
(assert (not (>= result@1@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= result@1@00 0))
(assert (foo%precondition $Snap.unit result@1@00))
(pop) ; 2
; Joined path conditions
(assert (and (>= result@1@00 0) (foo%precondition $Snap.unit result@1@00)))
(push) ; 2
(assert (not (= result@1@00 (foo $Snap.unit result@1@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@1@00 (foo $Snap.unit result@1@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (foo%precondition s@$ x@0@00)
    (=
      (foo s@$ x@0@00)
      (ite (= x@0@00 0) 0 (+ 1 (foo%limited $Snap.unit (- x@0@00 1))))))
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (foo%precondition s@$ x@0@00)
    (ite (= x@0@00 0) true (foo%precondition $Snap.unit (- x@0@00 1))))
  :pattern ((foo s@$ x@0@00))
  :qid |quant-u-10|)))
; ---------- FUNCTION h----------
(declare-fun x@2@00 () Int)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] x >= 0
(assert (>= x@2@00 0))
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 ($Snap.combine ($Snap.first $t@7@00) ($Snap.second $t@7@00))))
(assert (= ($Snap.first $t@7@00) $Snap.unit))
; [eval] result == x
(assert (= result@3@00 x@2@00))
(assert (= ($Snap.second $t@7@00) $Snap.unit))
; [eval] result > 0 ==> result == h(result - 1) + 1
; [eval] result > 0
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> result@3@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> result@3@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | result@3@00 > 0 | live]
; [else-branch: 1 | !(result@3@00 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | result@3@00 > 0]
(assert (> result@3@00 0))
; [eval] result == h(result - 1) + 1
; [eval] h(result - 1) + 1
; [eval] h(result - 1)
; [eval] result - 1
(push) ; 4
; [eval] x >= 0
(push) ; 5
(assert (not (>= (- result@3@00 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- result@3@00 1) 0))
(assert (h%precondition $Snap.unit (- result@3@00 1)))
(pop) ; 4
; Joined path conditions
(assert (and (>= (- result@3@00 1) 0) (h%precondition $Snap.unit (- result@3@00 1))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(result@3@00 > 0)]
(assert (not (> result@3@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> result@3@00 0)
  (and
    (> result@3@00 0)
    (>= (- result@3@00 1) 0)
    (h%precondition $Snap.unit (- result@3@00 1)))))
; Joined path conditions
(assert (or (not (> result@3@00 0)) (> result@3@00 0)))
(assert (=> (> result@3@00 0) (= result@3@00 (+ (h $Snap.unit (- result@3@00 1)) 1))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (= (h%limited s@$ x@2@00) (h s@$ x@2@00))
  :pattern ((h s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (h%stateless x@2@00)
  :pattern ((h%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (let ((result@3@00 (h%limited s@$ x@2@00))) (=>
    (h%precondition s@$ x@2@00)
    (and
      (= result@3@00 x@2@00)
      (=>
        (> result@3@00 0)
        (= result@3@00 (+ (h%limited $Snap.unit (- result@3@00 1)) 1))))))
  :pattern ((h%limited s@$ x@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (let ((result@3@00 (h%limited s@$ x@2@00))) true)
  :pattern ((h%limited s@$ x@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (let ((result@3@00 (h%limited s@$ x@2@00))) (=>
    (and (h%precondition s@$ x@2@00) (> result@3@00 0))
    (h%precondition $Snap.unit (- result@3@00 1))))
  :pattern ((h%limited s@$ x@2@00))
  :qid |quant-u-13|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (>= x@2@00 0))
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
(assert (not (not (= x@2@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@2@00 == 0 | live]
; [else-branch: 2 | x@2@00 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | x@2@00 == 0]
(assert (= x@2@00 0))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | x@2@00 != 0]
(assert (not (= x@2@00 0)))
; [eval] 1 + h(x - 1)
; [eval] h(x - 1)
; [eval] x - 1
(push) ; 4
; [eval] x >= 0
(push) ; 5
(assert (not (>= (- x@2@00 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- x@2@00 1) 0))
(assert (h%precondition $Snap.unit (- x@2@00 1)))
(pop) ; 4
; Joined path conditions
(assert (and (>= (- x@2@00 1) 0) (h%precondition $Snap.unit (- x@2@00 1))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= x@2@00 0))
  (and
    (not (= x@2@00 0))
    (>= (- x@2@00 1) 0)
    (h%precondition $Snap.unit (- x@2@00 1)))))
(assert (or (not (= x@2@00 0)) (= x@2@00 0)))
(assert (= result@3@00 (ite (= x@2@00 0) 0 (+ 1 (h $Snap.unit (- x@2@00 1))))))
; [eval] result == x
(push) ; 2
(assert (not (= result@3@00 x@2@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@3@00 x@2@00))
; [eval] result > 0 ==> result == h(result - 1) + 1
; [eval] result > 0
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> result@3@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> result@3@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | result@3@00 > 0 | live]
; [else-branch: 3 | !(result@3@00 > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | result@3@00 > 0]
(assert (> result@3@00 0))
; [eval] result == h(result - 1) + 1
; [eval] h(result - 1) + 1
; [eval] h(result - 1)
; [eval] result - 1
(push) ; 4
; [eval] x >= 0
(push) ; 5
(assert (not (>= (- result@3@00 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- result@3@00 1) 0))
(assert (h%precondition $Snap.unit (- result@3@00 1)))
(pop) ; 4
; Joined path conditions
(assert (and (>= (- result@3@00 1) 0) (h%precondition $Snap.unit (- result@3@00 1))))
(pop) ; 3
(push) ; 3
; [else-branch: 3 | !(result@3@00 > 0)]
(assert (not (> result@3@00 0)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (> result@3@00 0)
  (and
    (> result@3@00 0)
    (>= (- result@3@00 1) 0)
    (h%precondition $Snap.unit (- result@3@00 1)))))
; Joined path conditions
(assert (or (not (> result@3@00 0)) (> result@3@00 0)))
(push) ; 2
(assert (not (=> (> result@3@00 0) (= result@3@00 (+ (h $Snap.unit (- result@3@00 1)) 1)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=> (> result@3@00 0) (= result@3@00 (+ (h $Snap.unit (- result@3@00 1)) 1))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (h%precondition s@$ x@2@00)
    (=
      (h s@$ x@2@00)
      (ite (= x@2@00 0) 0 (+ 1 (h%limited $Snap.unit (- x@2@00 1))))))
  :pattern ((h s@$ x@2@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=>
    (h%precondition s@$ x@2@00)
    (ite (= x@2@00 0) true (h%precondition $Snap.unit (- x@2@00 1))))
  :pattern ((h s@$ x@2@00))
  :qid |quant-u-15|)))
; ---------- FUNCTION g----------
(declare-fun x@4@00 () Int)
(declare-fun result@5@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] x >= 0
(assert (>= x@4@00 0))
(declare-const $t@8@00 $Snap)
(assert (= $t@8@00 ($Snap.combine ($Snap.first $t@8@00) ($Snap.second $t@8@00))))
(assert (= ($Snap.first $t@8@00) $Snap.unit))
; [eval] result == x
(assert (= result@5@00 x@4@00))
(assert (= ($Snap.second $t@8@00) $Snap.unit))
; [eval] result == g(x + 1) - 1
; [eval] g(x + 1) - 1
; [eval] g(x + 1)
; [eval] x + 1
(push) ; 2
; [eval] x >= 0
(push) ; 3
(assert (not (>= (+ x@4@00 1) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ x@4@00 1) 0))
(assert (g%precondition $Snap.unit (+ x@4@00 1)))
(pop) ; 2
; Joined path conditions
(assert (and (>= (+ x@4@00 1) 0) (g%precondition $Snap.unit (+ x@4@00 1))))
(assert (= result@5@00 (- (g $Snap.unit (+ x@4@00 1)) 1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (= (g%limited s@$ x@4@00) (g s@$ x@4@00))
  :pattern ((g s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (g%stateless x@4@00)
  :pattern ((g%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (g%limited s@$ x@4@00))) (=>
    (g%precondition s@$ x@4@00)
    (and
      (= result@5@00 x@4@00)
      (= result@5@00 (- (g%limited $Snap.unit (+ x@4@00 1)) 1)))))
  :pattern ((g%limited s@$ x@4@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (g%limited s@$ x@4@00))) true)
  :pattern ((g%limited s@$ x@4@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (let ((result@5@00 (g%limited s@$ x@4@00))) (=>
    (g%precondition s@$ x@4@00)
    (g%precondition $Snap.unit (+ x@4@00 1))))
  :pattern ((g%limited s@$ x@4@00))
  :qid |quant-u-18|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ $Snap.unit))
(assert (>= x@4@00 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (x == 0 ? 0 : 1 + g(x - 1))
; [eval] x == 0
(set-option :timeout 0)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@4@00 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@4@00 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | x@4@00 == 0 | live]
; [else-branch: 4 | x@4@00 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | x@4@00 == 0]
(assert (= x@4@00 0))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | x@4@00 != 0]
(assert (not (= x@4@00 0)))
; [eval] 1 + g(x - 1)
; [eval] g(x - 1)
; [eval] x - 1
(push) ; 4
; [eval] x >= 0
(push) ; 5
(assert (not (>= (- x@4@00 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (>= (- x@4@00 1) 0))
(assert (g%precondition $Snap.unit (- x@4@00 1)))
(pop) ; 4
; Joined path conditions
(assert (and (>= (- x@4@00 1) 0) (g%precondition $Snap.unit (- x@4@00 1))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= x@4@00 0))
  (and
    (not (= x@4@00 0))
    (>= (- x@4@00 1) 0)
    (g%precondition $Snap.unit (- x@4@00 1)))))
(assert (or (not (= x@4@00 0)) (= x@4@00 0)))
(assert (= result@5@00 (ite (= x@4@00 0) 0 (+ 1 (g $Snap.unit (- x@4@00 1))))))
; [eval] result == x
(push) ; 2
(assert (not (= result@5@00 x@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@5@00 x@4@00))
; [eval] result == g(x + 1) - 1
; [eval] g(x + 1) - 1
; [eval] g(x + 1)
; [eval] x + 1
(push) ; 2
; [eval] x >= 0
(push) ; 3
(assert (not (>= (+ x@4@00 1) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ x@4@00 1) 0))
(assert (g%precondition $Snap.unit (+ x@4@00 1)))
(pop) ; 2
; Joined path conditions
(assert (and (>= (+ x@4@00 1) 0) (g%precondition $Snap.unit (+ x@4@00 1))))
(push) ; 2
(assert (not (= result@5@00 (- (g $Snap.unit (+ x@4@00 1)) 1))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= result@5@00 (- (g $Snap.unit (+ x@4@00 1)) 1)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (g%precondition s@$ x@4@00)
    (=
      (g s@$ x@4@00)
      (ite (= x@4@00 0) 0 (+ 1 (g%limited $Snap.unit (- x@4@00 1))))))
  :pattern ((g s@$ x@4@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (=>
    (g%precondition s@$ x@4@00)
    (ite (= x@4@00 0) true (g%precondition $Snap.unit (- x@4@00 1))))
  :pattern ((g s@$ x@4@00))
  :qid |quant-u-20|)))
