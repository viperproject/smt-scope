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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $unresolved@11@00 () $Snap)
(declare-fun $unresolved@12@00 () $Snap)
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
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (= (h_e%limited s@$ x@4@00) (h_e s@$ x@4@00))
  :pattern ((h_e s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 Int)) (!
  (h_e%stateless x@4@00)
  :pattern ((h_e%limited s@$ x@4@00))
  :qid |quant-u-5|)))
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
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (= (h%limited s@$ x@6@00) (h s@$ x@6@00))
  :pattern ((h s@$ x@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 Int)) (!
  (h%stateless x@6@00)
  :pattern ((h%limited s@$ x@6@00))
  :qid |quant-u-7|)))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- h_termination_proof ----------
(declare-const x@0@01 Int)
(declare-const x@1@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] f(x) == 0
; [eval] f(x)
(push) ; 2
(assert (f%precondition $Snap.unit x@1@01))
(pop) ; 2
; Joined path conditions
(assert (f%precondition $Snap.unit x@1@01))
(assert (= (f $Snap.unit x@1@01) 0))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] f1(x) == 0
; [eval] f1(x)
(push) ; 2
(assert (f1%precondition $Snap.unit x@1@01))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit x@1@01))
(assert (= (f1 $Snap.unit x@1@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(x == 0)
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@1@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@1@01 != 0 | dead]
; [else-branch: 0 | x@1@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | x@1@01 == 0]
(assert (= x@1@01 0))
(pop) ; 3
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
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@1@01 == 0 | live]
; [else-branch: 1 | x@1@01 != 0 | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | x@1@01 == 0]
(assert (= x@1@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- h_posts_termination_proof ----------
(declare-const x@3@01 Int)
(declare-const x@4@01 Int)
(push) ; 1
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.first $t@5@01) $Snap.unit))
; [eval] f(x) == 0
; [eval] f(x)
(push) ; 2
(assert (f%precondition $Snap.unit x@4@01))
(pop) ; 2
; Joined path conditions
(assert (f%precondition $Snap.unit x@4@01))
(assert (= (f $Snap.unit x@4@01) 0))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] f1(x) == 0
; [eval] f1(x)
(push) ; 2
(assert (f1%precondition $Snap.unit x@4@01))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit x@4@01))
(assert (= (f1 $Snap.unit x@4@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var $result: Int
(declare-const $result@6@01 Int)
; [eval] $result == x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $result@6@01 x@4@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= $result@6@01 x@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | $result@6@01 == x@4@01 | live]
; [else-branch: 2 | $result@6@01 != x@4@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | $result@6@01 == x@4@01]
(assert (= $result@6@01 x@4@01))
; [eval] $result > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> $result@6@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | $result@6@01 > 0 | dead]
; [else-branch: 3 | !($result@6@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 3 | !($result@6@01 > 0)]
(assert (not (> $result@6@01 0)))
(pop) ; 4
; [eval] !($result > 0)
; [eval] $result > 0
(push) ; 4
(set-option :timeout 10)
(assert (not (> $result@6@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> $result@6@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !($result@6@01 > 0) | live]
; [else-branch: 4 | $result@6@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | !($result@6@01 > 0)]
(assert (not (> $result@6@01 0)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 2 | $result@6@01 != x@4@01]
(assert (not (= $result@6@01 x@4@01)))
(pop) ; 3
; [eval] !($result == x)
; [eval] $result == x
(push) ; 3
(set-option :timeout 10)
(assert (not (= $result@6@01 x@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $result@6@01 x@4@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | $result@6@01 != x@4@01 | live]
; [else-branch: 5 | $result@6@01 == x@4@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | $result@6@01 != x@4@01]
(assert (not (= $result@6@01 x@4@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | $result@6@01 == x@4@01]
(assert (= $result@6@01 x@4@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- h_pres_termination_proof ----------
(declare-const x@7@01 Int)
(declare-const x@8@01 Int)
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
(declare-const $condInEx@9@01 Bool)
; [exec]
; var b: Bool
(declare-const b@10@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@10@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | b@10@01 | live]
; [else-branch: 6 | !(b@10@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | b@10@01]
(assert b@10@01)
; [exec]
; inhale false
(pop) ; 3
(push) ; 3
; [else-branch: 6 | !(b@10@01)]
(assert (not b@10@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@10@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | !(b@10@01) | live]
; [else-branch: 7 | b@10@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | !(b@10@01)]
(assert (not b@10@01))
; [exec]
; inhale f(x) == 0
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] f(x) == 0
; [eval] f(x)
(push) ; 4
(assert (f%precondition $Snap.unit x@8@01))
(pop) ; 4
; Joined path conditions
(assert (f%precondition $Snap.unit x@8@01))
(assert (= (f $Snap.unit x@8@01) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x >= 0
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 4
(assert (not (>= x@8@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (>= x@8@01 0))
(pop) ; 3
(push) ; 3
; [else-branch: 7 | b@10@01]
(assert b@10@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- h_e_termination_proof ----------
(declare-const x@12@01 Int)
(declare-const x@13@01 Int)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] f1(x) == x
; [eval] f1(x)
(push) ; 2
(assert (f1%precondition $Snap.unit x@13@01))
(pop) ; 2
; Joined path conditions
(assert (f1%precondition $Snap.unit x@13@01))
(assert (= (f1 $Snap.unit x@13@01) x@13@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [eval] !(x <= 0)
; [eval] x <= 0
(push) ; 3
(set-option :timeout 10)
(assert (not (<= x@13@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= x@13@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | !(x@13@01 <= 0) | live]
; [else-branch: 8 | x@13@01 <= 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | !(x@13@01 <= 0)]
(assert (not (<= x@13@01 0)))
; [exec]
; assert (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 4
(assert (not (decreasing<Bool> (- x@13@01 1) x@13@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (- x@13@01 1) x@13@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(push) ; 4
(assert (not (bounded<Bool> x@13@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> x@13@01))
(pop) ; 3
(push) ; 3
; [else-branch: 8 | x@13@01 <= 0]
(assert (<= x@13@01 0))
(pop) ; 3
; [eval] x <= 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (<= x@13@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<= x@13@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | x@13@01 <= 0 | live]
; [else-branch: 9 | !(x@13@01 <= 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | x@13@01 <= 0]
(assert (<= x@13@01 0))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | !(x@13@01 <= 0)]
(assert (not (<= x@13@01 0)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- h_e_pres_termination_proof ----------
(declare-const x@15@01 Int)
(declare-const x@16@01 Int)
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
(declare-const $condInEx@17@01 Bool)
; [exec]
; assert x >= 0
; [eval] x >= 0
(push) ; 3
(assert (not (>= x@16@01 0)))
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
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 3
(assert (not (>= x@16@01 0)))
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
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 3
(assert (not (>= x@16@01 0)))
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
; [eval] x >= 0
(set-option :timeout 0)
(push) ; 3
(assert (not (>= x@16@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
