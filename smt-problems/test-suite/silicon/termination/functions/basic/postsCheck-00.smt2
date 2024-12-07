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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- h_termination_proof ----------
(declare-const x@0@01 Int)
(declare-const x@1@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] x >= 0
(assert (>= x@1@01 0))
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
; [then-branch: 0 | x@1@01 != 0 | live]
; [else-branch: 0 | x@1@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | x@1@01 != 0]
(assert (not (= x@1@01 0)))
; [exec]
; assert (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 4
(assert (not (decreasing<Bool> (- x@1@01 1) x@1@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (- x@1@01 1) x@1@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(push) ; 4
(assert (not (bounded<Bool> x@1@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> x@1@01))
(pop) ; 3
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
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@1@01 == 0 | live]
; [else-branch: 1 | x@1@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | x@1@01 == 0]
(assert (= x@1@01 0))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | x@1@01 != 0]
(assert (not (= x@1@01 0)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- h_posts_termination_proof ----------
(declare-const x@3@01 Int)
(declare-const x@4@01 Int)
(push) ; 1
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] x >= 0
(assert (>= x@4@01 0))
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
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (> $result@6@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | $result@6@01 > 0 | live]
; [else-branch: 3 | !($result@6@01 > 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | $result@6@01 > 0]
(assert (> $result@6@01 0))
; [exec]
; assert (decreasing($result - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing($result - 1, old(x)): Bool)
; [eval] $result - 1
; [eval] old(x)
(push) ; 5
(assert (not (decreasing<Bool> (- $result@6@01 1) x@4@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (- $result@6@01 1) x@4@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(push) ; 5
(assert (not (bounded<Bool> x@4@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> x@4@01))
(pop) ; 4
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
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !($result@6@01 > 0) | live]
; [else-branch: 4 | $result@6@01 > 0 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | !($result@6@01 > 0)]
(assert (not (> $result@6@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | $result@6@01 > 0]
(assert (> $result@6@01 0))
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
; ---------- foo_termination_proof ----------
(declare-const x@7@01 Int)
(declare-const x@8@01 Int)
(push) ; 1
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] x >= 0
(assert (>= x@8@01 0))
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
(assert (not (= x@8@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@8@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | x@8@01 != 0 | live]
; [else-branch: 6 | x@8@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | x@8@01 != 0]
(assert (not (= x@8@01 0)))
; [exec]
; assert (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 4
(assert (not (decreasing<Bool> (- x@8@01 1) x@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (- x@8@01 1) x@8@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(push) ; 4
(assert (not (bounded<Bool> x@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> x@8@01))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | x@8@01 == 0]
(assert (= x@8@01 0))
(pop) ; 3
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@8@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@8@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | x@8@01 == 0 | live]
; [else-branch: 7 | x@8@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | x@8@01 == 0]
(assert (= x@8@01 0))
(pop) ; 3
(push) ; 3
; [else-branch: 7 | x@8@01 != 0]
(assert (not (= x@8@01 0)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- foo_posts_termination_proof ----------
(declare-const x@10@01 Int)
(declare-const x@11@01 Int)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] x >= 0
(assert (>= x@11@01 0))
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
(declare-const $result@13@01 Int)
; [eval] $result == x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $result@13@01 x@11@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= $result@13@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | $result@13@01 == x@11@01 | live]
; [else-branch: 8 | $result@13@01 != x@11@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | $result@13@01 == x@11@01]
(assert (= $result@13@01 x@11@01))
; [exec]
; assert (decreasing($result, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing($result, old(x)): Bool)
; [eval] old(x)
(push) ; 4
(assert (not (decreasing<Bool> $result@13@01 x@11@01)))
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
; [eval] (decreasing($result, old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> $result@13@01 x@11@01)))
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
; [eval] (decreasing($result, old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> $result@13@01 x@11@01)))
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
; [eval] (decreasing($result, old(x)): Bool)
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> $result@13@01 x@11@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- g_termination_proof ----------
(declare-const x@14@01 Int)
(declare-const x@15@01 Int)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] x >= 0
(assert (>= x@15@01 0))
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
(assert (not (= x@15@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@15@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | x@15@01 != 0 | live]
; [else-branch: 9 | x@15@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | x@15@01 != 0]
(assert (not (= x@15@01 0)))
; [exec]
; assert (decreasing(x - 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x - 1, old(x)): Bool)
; [eval] x - 1
; [eval] old(x)
(push) ; 4
(assert (not (decreasing<Bool> (- x@15@01 1) x@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (decreasing<Bool> (- x@15@01 1) x@15@01))
; [eval] (bounded(old(x)): Bool)
; [eval] old(x)
(push) ; 4
(assert (not (bounded<Bool> x@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (bounded<Bool> x@15@01))
(pop) ; 3
(push) ; 3
; [else-branch: 9 | x@15@01 == 0]
(assert (= x@15@01 0))
(pop) ; 3
; [eval] x == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@15@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@15@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | x@15@01 == 0 | live]
; [else-branch: 10 | x@15@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | x@15@01 == 0]
(assert (= x@15@01 0))
(pop) ; 3
(push) ; 3
; [else-branch: 10 | x@15@01 != 0]
(assert (not (= x@15@01 0)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- g_posts_termination_proof ----------
(declare-const x@17@01 Int)
(declare-const x@18@01 Int)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] x >= 0
(assert (>= x@18@01 0))
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
(declare-const $result@20@01 Int)
; [eval] $result == x
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $result@20@01 x@18@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= $result@20@01 x@18@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | $result@20@01 == x@18@01 | live]
; [else-branch: 11 | $result@20@01 != x@18@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | $result@20@01 == x@18@01]
(assert (= $result@20@01 x@18@01))
; [exec]
; assert (decreasing(x + 1, old(x)): Bool) && (bounded(old(x)): Bool)
; [eval] (decreasing(x + 1, old(x)): Bool)
; [eval] x + 1
; [eval] old(x)
(push) ; 4
(assert (not (decreasing<Bool> (+ x@18@01 1) x@18@01)))
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
; [eval] (decreasing(x + 1, old(x)): Bool)
; [eval] x + 1
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> (+ x@18@01 1) x@18@01)))
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
; [eval] (decreasing(x + 1, old(x)): Bool)
; [eval] x + 1
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> (+ x@18@01 1) x@18@01)))
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
; [eval] (decreasing(x + 1, old(x)): Bool)
; [eval] x + 1
; [eval] old(x)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(assert (not (decreasing<Bool> (+ x@18@01 1) x@18@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
