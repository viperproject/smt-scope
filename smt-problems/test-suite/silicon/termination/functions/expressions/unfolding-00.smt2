(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:29:08
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/expressions/unfolding.vpr
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
; ////////// Symbols
; Declaring symbols related to program functions (from program analysis)
(declare-fun nonTerminating ($Snap $Ref) Bool)
(declare-fun nonTerminating%limited ($Snap $Ref) Bool)
(declare-fun nonTerminating%stateless ($Ref) Bool)
(declare-fun nonTerminating%precondition ($Snap $Ref) Bool)
(declare-fun partiallyTerminating ($Snap $Ref) Bool)
(declare-fun partiallyTerminating%limited ($Snap $Ref) Bool)
(declare-fun partiallyTerminating%stateless ($Ref) Bool)
(declare-fun partiallyTerminating%precondition ($Snap $Ref) Bool)
(declare-fun test ($Snap $Ref) Bool)
(declare-fun test%limited ($Snap $Ref) Bool)
(declare-fun test%stateless ($Ref) Bool)
(declare-fun test%precondition ($Snap $Ref) Bool)
(declare-fun test2 ($Snap $Ref) Bool)
(declare-fun test2%limited ($Snap $Ref) Bool)
(declare-fun test2%stateless ($Ref) Bool)
(declare-fun test2%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun foo%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@8@00 () $Perm)
(declare-fun $k@9@00 () $Perm)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (nonTerminating%limited s@$ x@0@00) (nonTerminating s@$ x@0@00))
  :pattern ((nonTerminating s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (nonTerminating%stateless x@0@00)
  :pattern ((nonTerminating%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (partiallyTerminating%limited s@$ x@2@00) (partiallyTerminating s@$ x@2@00))
  :pattern ((partiallyTerminating s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (partiallyTerminating%stateless x@2@00)
  :pattern ((partiallyTerminating%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (= (test%limited s@$ x@4@00) (test s@$ x@4@00))
  :pattern ((test s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (test%stateless x@4@00)
  :pattern ((test%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (test%precondition s@$ x@4@00)
    (= (test s@$ x@4@00) (nonTerminating $Snap.unit x@4@00)))
  :pattern ((test s@$ x@4@00))
  :pattern ((test%stateless x@4@00) (foo%trigger s@$ x@4@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (test%precondition s@$ x@4@00)
    (nonTerminating%precondition $Snap.unit x@4@00))
  :pattern ((test s@$ x@4@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (= (test2%limited s@$ x@6@00) (test2 s@$ x@6@00))
  :pattern ((test2 s@$ x@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (test2%stateless x@6@00)
  :pattern ((test2%limited s@$ x@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    (=>
      (test2%precondition s@$ x@6@00)
      (= (test2 s@$ x@6@00) (partiallyTerminating ($Snap.first s@$) x@6@00))))
  :pattern ((test2 s@$ x@6@00))
  :pattern ((test2%stateless x@6@00) (foo%trigger s@$ x@6@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (=>
    (test2%precondition s@$ x@6@00)
    (partiallyTerminating%precondition ($Snap.first s@$) x@6@00))
  :pattern ((test2 s@$ x@6@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test_termination_proof ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var b: Bool
(declare-const b@3@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@3@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@3@01 | live]
; [else-branch: 0 | !(b@3@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b@3@01]
(assert b@3@01)
; [exec]
; unfold acc(foo(x), write)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] x.f == 42
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@2@01)) 42))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (foo%trigger $t@2@01 x@1@01))
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test_pres_termination_proof ----------
(declare-const x@4@01 $Ref)
(declare-const x@5@01 $Ref)
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
(declare-const $condInEx@6@01 Bool)
; [exec]
; inhale acc(foo(x), write)
(declare-const $t@7@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test2_termination_proof ----------
(declare-const x@8@01 $Ref)
(declare-const x@9@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@10@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var b1: Bool
(declare-const b1@11@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b1@11@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b1@11@01 | live]
; [else-branch: 1 | !(b1@11@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | b1@11@01]
(assert b1@11@01)
; [exec]
; unfold acc(foo(x), write)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (not (= x@9@01 $Ref.null)))
(assert (= ($Snap.second $t@10@01) $Snap.unit))
; [eval] x.f == 42
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@10@01)) 42))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (foo%trigger $t@10@01 x@9@01))
; [exec]
; assert x.f == 42
; [eval] x.f == 42
; [exec]
; inhale false
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 1 | !(b1@11@01)]
(assert (not b1@11@01))
(pop) ; 3
; [eval] !b1
(push) ; 3
(set-option :timeout 10)
(assert (not b1@11@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@11@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | !(b1@11@01) | live]
; [else-branch: 2 | b1@11@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | !(b1@11@01)]
(assert (not b1@11@01))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | b1@11@01]
(assert b1@11@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2_pres_termination_proof ----------
(declare-const x@12@01 $Ref)
(declare-const x@13@01 $Ref)
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
(declare-const $condInEx@14@01 Bool)
; [exec]
; inhale acc(foo(x), write)
(declare-const $t@15@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- partiallyTerminating_pres_termination_proof ----------
(declare-const x@16@01 $Ref)
(declare-const x@17@01 $Ref)
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
(declare-const $condInEx@18@01 Bool)
; [exec]
; inhale acc(x.f, wildcard)
(declare-const $k@19@01 $Perm)
(assert ($Perm.isReadVar $k@19@01))
(declare-const $t@20@01 Int)
(assert (<= $Perm.No $k@19@01))
(assert (<= $k@19@01 $Perm.Write))
(assert (=> (< $Perm.No $k@19@01) (not (= x@17@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
