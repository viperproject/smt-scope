(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:28:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/termination/functions/expressions/access.vpr
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
(declare-fun test2 ($Snap $Ref) Bool)
(declare-fun test2%limited ($Snap $Ref) Bool)
(declare-fun test2%stateless ($Ref) Bool)
(declare-fun test2%precondition ($Snap $Ref) Bool)
(declare-fun test1 ($Snap $Ref) Bool)
(declare-fun test1%limited ($Snap $Ref) Bool)
(declare-fun test1%stateless ($Ref) Bool)
(declare-fun test1%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (nonTerminating%limited s@$ x@0@00) (nonTerminating s@$ x@0@00))
  :pattern ((nonTerminating s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (nonTerminating%stateless x@0@00)
  :pattern ((nonTerminating%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (test2%limited s@$ x@2@00) (test2 s@$ x@2@00))
  :pattern ((test2 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (test2%stateless x@2@00)
  :pattern ((test2%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (test2%precondition s@$ x@2@00)
    (= (test2 s@$ x@2@00) (nonTerminating $Snap.unit x@2@00)))
  :pattern ((test2 s@$ x@2@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (test2%precondition s@$ x@2@00)
    (nonTerminating%precondition $Snap.unit x@2@00))
  :pattern ((test2 s@$ x@2@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (= (test1%limited s@$ x@4@00) (test1 s@$ x@4@00))
  :pattern ((test1 s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (test1%stateless x@4@00)
  :pattern ((test1%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (test1%precondition s@$ x@4@00)
    (= (test1 s@$ x@4@00) (nonTerminating $Snap.unit x@4@00)))
  :pattern ((test1 s@$ x@4@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (test1%precondition s@$ x@4@00)
    (nonTerminating%precondition $Snap.unit x@4@00))
  :pattern ((test1 s@$ x@4@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test1_termination_proof ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= x@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert false
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
(pop) ; 2
(pop) ; 1
; ---------- test1_pres_termination_proof ----------
(declare-const x@3@01 $Ref)
(declare-const x@4@01 $Ref)
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
(declare-const $condInEx@5@01 Bool)
; [exec]
; var b: Bool
(declare-const b@6@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@6@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | b@6@01 | live]
; [else-branch: 0 | !(b@6@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b@6@01]
(assert b@6@01)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@7@01 Int)
(assert (not (= x@4@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale false
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 0 | !(b@6@01)]
(assert (not b@6@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@6@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | !(b@6@01) | live]
; [else-branch: 1 | b@6@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | !(b@6@01)]
(assert (not b@6@01))
; [exec]
; inhale acc(x.f, write)
(declare-const $t@8@01 Int)
(assert (not (= x@4@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(x.g, write)
(declare-const $t@9@01 Int)
; State saturation: after inhale
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 1 | b@6@01]
(assert b@6@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2_termination_proof ----------
(declare-const x@10@01 $Ref)
(declare-const x@11@01 $Ref)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (not (= x@11@01 $Ref.null)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first $t@12@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@12@01)))))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert false
(check-sat)
; unsat
(pop) ; 2
(pop) ; 1
; ---------- test2_pres_termination_proof ----------
(declare-const x@13@01 $Ref)
(declare-const x@14@01 $Ref)
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
(declare-const $condInEx@15@01 Bool)
; [exec]
; var b1: Bool
(declare-const b1@16@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b1@16@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b1@16@01 | live]
; [else-branch: 2 | !(b1@16@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | b1@16@01]
(assert b1@16@01)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@17@01 Int)
(assert (not (= x@14@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale false
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 2 | !(b1@16@01)]
(assert (not b1@16@01))
(pop) ; 3
; [eval] !b1
(push) ; 3
(set-option :timeout 10)
(assert (not b1@16@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | !(b1@16@01) | live]
; [else-branch: 3 | b1@16@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | !(b1@16@01)]
(assert (not b1@16@01))
; [exec]
; inhale acc(x.f, write)
(declare-const $t@18@01 Int)
(assert (not (= x@14@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; var b2: Bool
(declare-const b2@19@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@19@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@19@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | b2@19@01 | live]
; [else-branch: 4 | !(b2@19@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | b2@19@01]
(assert b2@19@01)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@20@01 Int)
(assert (= $t@18@01 $t@20@01))
(assert false)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale false
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | !(b2@19@01)]
(assert (not b2@19@01))
(pop) ; 4
; [eval] !b2
(push) ; 4
(set-option :timeout 10)
(assert (not b2@19@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@19@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | !(b2@19@01) | live]
; [else-branch: 5 | b2@19@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | !(b2@19@01)]
(assert (not b2@19@01))
; [exec]
; inhale acc(x.f, write)
(declare-const $t@21@01 Int)
(assert (= $t@18@01 $t@21@01))
(assert false)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale acc(x.g, write)
(declare-const $t@22@01 Int)
; State saturation: after inhale
(check-sat)
; unsat
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | b2@19@01]
(assert b2@19@01)
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 3 | b1@16@01]
(assert b1@16@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
