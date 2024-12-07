(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/expressions/inhaleexhale.vpr
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
(declare-fun g ($Snap Bool) Bool)
(declare-fun g%limited ($Snap Bool) Bool)
(declare-fun g%stateless (Bool) Bool)
(declare-fun g%precondition ($Snap Bool) Bool)
(declare-fun f ($Snap Int) Bool)
(declare-fun f%limited ($Snap Int) Bool)
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
(assert (forall ((s@$ $Snap) (b@0@00 Bool)) (!
  (= (g%limited s@$ b@0@00) (g s@$ b@0@00))
  :pattern ((g s@$ b@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (b@0@00 Bool)) (!
  (g%stateless b@0@00)
  :pattern ((g%limited s@$ b@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (= (f%limited s@$ x@2@00) (f s@$ x@2@00))
  :pattern ((f s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (f%stateless x@2@00)
  :pattern ((f%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  (=> (f%precondition s@$ x@2@00) (= (f s@$ x@2@00) true))
  :pattern ((f s@$ x@2@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@2@00 Int)) (!
  true
  :pattern ((f s@$ x@2@00))
  :qid |quant-u-5|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- f_pres_termination_proof ----------
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
; [exec]
; var $condInEx: Bool
(declare-const $condInEx@2@01 Bool)
; [exec]
; var b1: Bool
(declare-const b1@3@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b1@3@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b1@3@01 | live]
; [else-branch: 0 | !(b1@3@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b1@3@01]
(assert b1@3@01)
; [exec]
; inhale false
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b1@3@01)]
(assert (not b1@3@01))
(pop) ; 3
; [eval] !b1
(push) ; 3
(set-option :timeout 10)
(assert (not b1@3@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(b1@3@01) | live]
; [else-branch: 1 | b1@3@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(b1@3@01)]
(assert (not b1@3@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not $condInEx@2@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not $condInEx@2@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | $condInEx@2@01 | live]
; [else-branch: 2 | !($condInEx@2@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | $condInEx@2@01]
(assert $condInEx@2@01)
; [exec]
; inhale [x >= 0, x < 0]
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 $Snap.unit))
; [eval] x >= 0
(assert (>= x@1@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !$condInEx
; [then-branch: 3 | !($condInEx@2@01) | dead]
; [else-branch: 3 | $condInEx@2@01 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | $condInEx@2@01]
(pop) ; 5
(push) ; 5
(set-option :timeout 10)
(assert (not (not $condInEx@2@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | $condInEx@2@01 | live]
; [else-branch: 4 | !($condInEx@2@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | $condInEx@2@01]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !($condInEx@2@01)]
(assert (not $condInEx@2@01))
(pop) ; 4
; [eval] !$condInEx
(push) ; 4
(set-option :timeout 10)
(assert (not $condInEx@2@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not $condInEx@2@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !($condInEx@2@01) | live]
; [else-branch: 5 | $condInEx@2@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | !($condInEx@2@01)]
(assert (not $condInEx@2@01))
; [exec]
; inhale x < 0
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
; [eval] x < 0
(assert (< x@1@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] !$condInEx
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not $condInEx@2@01))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !($condInEx@2@01) | live]
; [else-branch: 6 | $condInEx@2@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | !($condInEx@2@01)]
; [exec]
; assert !old(x >= 0)
; [eval] !old(x >= 0)
; [eval] old(x >= 0)
; [eval] x >= 0
(push) ; 6
(assert (not (not (>= x@1@01 0))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (>= x@1@01 0)))
(pop) ; 5
; [then-branch: 7 | $condInEx@2@01 | dead]
; [else-branch: 7 | !($condInEx@2@01) | live]
(push) ; 5
; [else-branch: 7 | !($condInEx@2@01)]
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 5 | $condInEx@2@01]
(assert $condInEx@2@01)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 1 | b1@3@01]
(assert b1@3@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
