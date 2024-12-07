(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:07
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/basic.vpr
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
(declare-fun add ($Snap $Ref) Int)
(declare-fun add%limited ($Snap $Ref) Int)
(declare-fun add%stateless ($Ref) Bool)
(declare-fun add%precondition ($Snap $Ref) Bool)
(declare-fun tern ($Snap $Ref Bool) Int)
(declare-fun tern%limited ($Snap $Ref Bool) Int)
(declare-fun tern%stateless ($Ref Bool) Bool)
(declare-fun tern%precondition ($Snap $Ref Bool) Bool)
(declare-fun add3 ($Snap $Ref Int) Int)
(declare-fun add3%limited ($Snap $Ref Int) Int)
(declare-fun add3%stateless ($Ref Int) Bool)
(declare-fun add3%precondition ($Snap $Ref Int) Bool)
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
  (= (add%limited s@$ x@0@00) (add s@$ x@0@00))
  :pattern ((add s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (add%stateless x@0@00)
  :pattern ((add%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (add%precondition s@$ x@0@00)
    (=
      (add s@$ x@0@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((add s@$ x@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((add s@$ x@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (b@3@00 Bool)) (!
  (= (tern%limited s@$ x@2@00 b@3@00) (tern s@$ x@2@00 b@3@00))
  :pattern ((tern s@$ x@2@00 b@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (b@3@00 Bool)) (!
  (tern%stateless x@2@00 b@3@00)
  :pattern ((tern%limited s@$ x@2@00 b@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (b@3@00 Bool)) (!
  (=>
    (tern%precondition s@$ x@2@00 b@3@00)
    (= (tern s@$ x@2@00 b@3@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((tern s@$ x@2@00 b@3@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (b@3@00 Bool)) (!
  true
  :pattern ((tern s@$ x@2@00 b@3@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (a@6@00 Int)) (!
  (= (add3%limited s@$ x@5@00 a@6@00) (add3 s@$ x@5@00 a@6@00))
  :pattern ((add3 s@$ x@5@00 a@6@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (a@6@00 Int)) (!
  (add3%stateless x@5@00 a@6@00)
  :pattern ((add3%limited s@$ x@5@00 a@6@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (a@6@00 Int)) (!
  (=>
    (add3%precondition s@$ x@5@00 a@6@00)
    (=
      (add3 s@$ x@5@00 a@6@00)
      (+
        (-
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          a@6@00)
        ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((add3 s@$ x@5@00 a@6@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@5@00 $Ref) (a@6@00 Int)) (!
  true
  :pattern ((add3 s@$ x@5@00 a@6@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test1 ----------
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
; var x: Ref
(declare-const x@0@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@1@01 $Ref)
; [exec]
; x := new(f, g)
(declare-const x@2@01 $Ref)
(assert (not (= x@2@01 $Ref.null)))
(declare-const f@3@01 Int)
(declare-const g@4@01 Int)
(assert (not (= x@2@01 y@1@01)))
(assert (not (= x@2@01 x@0@01)))
; [exec]
; y := new(f, g)
(declare-const y@5@01 $Ref)
(assert (not (= y@5@01 $Ref.null)))
(declare-const f@6@01 Int)
(declare-const g@7@01 Int)
(assert (not (= y@5@01 y@1@01)))
(assert (not (= y@5@01 x@2@01)))
; [exec]
; x.f := y.f
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@5@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; y.g := x.g
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@01 y@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert add(x) == add(y)
; [eval] add(x) == add(y)
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@6@01)
  ($SortWrappers.IntTo$Snap g@4@01)) x@2@01))
(pop) ; 3
; Joined path conditions
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@6@01)
  ($SortWrappers.IntTo$Snap g@4@01)) x@2@01))
; [eval] add(y)
(push) ; 3
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@6@01)
  ($SortWrappers.IntTo$Snap g@4@01)) y@5@01))
(pop) ; 3
; Joined path conditions
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@6@01)
  ($SortWrappers.IntTo$Snap g@4@01)) y@5@01))
(push) ; 3
(assert (not (=
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@6@01)
    ($SortWrappers.IntTo$Snap g@4@01)) x@2@01)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@6@01)
    ($SortWrappers.IntTo$Snap g@4@01)) y@5@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@6@01)
    ($SortWrappers.IntTo$Snap g@4@01)) x@2@01)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@6@01)
    ($SortWrappers.IntTo$Snap g@4@01)) y@5@01)))
; [exec]
; x.f := x.f + 1
; [eval] x.f + 1
(declare-const f@8@01 Int)
(assert (= f@8@01 (+ f@6@01 1)))
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@5@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert add(x) == add(y)
; [eval] add(x) == add(y)
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@8@01)
  ($SortWrappers.IntTo$Snap g@4@01)) x@2@01))
(pop) ; 3
; Joined path conditions
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@8@01)
  ($SortWrappers.IntTo$Snap g@4@01)) x@2@01))
; [eval] add(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@8@01)
    ($SortWrappers.IntTo$Snap g@4@01)) x@2@01)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@6@01)
    ($SortWrappers.IntTo$Snap g@4@01)) y@5@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@5@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@01 y@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@6@01 f@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@8@01 f@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= x@2@01 y@5@01)) (not (= y@5@01 x@2@01)))
  (and (not (= y@5@01 x@2@01)) (not (= x@2@01 y@5@01)))))
(assert (and (not (= y@5@01 x@2@01)) (not (= x@2@01 y@5@01))))
; [eval] add(x) == add(y)
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] add(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@8@01)
    ($SortWrappers.IntTo$Snap g@4@01)) x@2@01)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@6@01)
    ($SortWrappers.IntTo$Snap g@4@01)) y@5@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@5@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@01 y@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@6@01 f@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@8@01 f@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= x@2@01 y@5@01)) (not (= y@5@01 x@2@01)))
  (and (not (= y@5@01 x@2@01)) (not (= x@2@01 y@5@01)))))
(assert (and (not (= y@5@01 x@2@01)) (not (= x@2@01 y@5@01))))
; [eval] add(x) == add(y)
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] add(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@8@01)
    ($SortWrappers.IntTo$Snap g@4@01)) x@2@01)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@6@01)
    ($SortWrappers.IntTo$Snap g@4@01)) y@5@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@5@01 x@2@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@2@01 y@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@6@01 f@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= f@8@01 f@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= x@2@01 y@5@01)) (not (= y@5@01 x@2@01)))
  (and (not (= y@5@01 x@2@01)) (not (= x@2@01 y@5@01)))))
(assert (and (not (= y@5@01 x@2@01)) (not (= x@2@01 y@5@01))))
; [eval] add(x) == add(y)
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] add(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@8@01)
    ($SortWrappers.IntTo$Snap g@4@01)) x@2@01)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@6@01)
    ($SortWrappers.IntTo$Snap g@4@01)) y@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
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
; var x: Ref
(declare-const x@9@01 $Ref)
; [exec]
; x := new(f, g)
(declare-const x@10@01 $Ref)
(assert (not (= x@10@01 $Ref.null)))
(declare-const f@11@01 Int)
(declare-const g@12@01 Int)
(assert (not (= x@10@01 x@9@01)))
; [exec]
; x.g := 10
; [exec]
; assert add3(x, 0) == add(x)
; [eval] add3(x, 0) == add(x)
; [eval] add3(x, 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.g > 0
(assert (add3%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 10)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@11@01)
      ($SortWrappers.IntTo$Snap 10)))) x@10@01 0))
(pop) ; 3
; Joined path conditions
(assert (add3%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 10)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@11@01)
      ($SortWrappers.IntTo$Snap 10)))) x@10@01 0))
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@11@01)
  ($SortWrappers.IntTo$Snap 10)) x@10@01))
(pop) ; 3
; Joined path conditions
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@11@01)
  ($SortWrappers.IntTo$Snap 10)) x@10@01))
(push) ; 3
(assert (not (=
  (add3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 10)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap f@11@01)
        ($SortWrappers.IntTo$Snap 10)))) x@10@01 0)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@11@01)
    ($SortWrappers.IntTo$Snap 10)) x@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (add3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 10)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap f@11@01)
        ($SortWrappers.IntTo$Snap 10)))) x@10@01 0)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap f@11@01)
    ($SortWrappers.IntTo$Snap 10)) x@10@01)))
; [exec]
; x.f := -5
; [eval] -5
; [exec]
; assert add3(x, 5) == 0
; [eval] add3(x, 5) == 0
; [eval] add3(x, 5)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.g > 0
(assert (add3%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 10)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap (- 0 5))
      ($SortWrappers.IntTo$Snap 10)))) x@10@01 5))
(pop) ; 3
; Joined path conditions
(assert (add3%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 10)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap (- 0 5))
      ($SortWrappers.IntTo$Snap 10)))) x@10@01 5))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (add3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 10)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap (- 0 5))
        ($SortWrappers.IntTo$Snap 10)))) x@10@01 5)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (add3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 10)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap (- 0 5))
        ($SortWrappers.IntTo$Snap 10)))) x@10@01 5)
  0))
; [exec]
; assert add3(x, 1) == add(x)
; [eval] add3(x, 1) == add(x)
; [eval] add3(x, 1)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.g > 0
(assert (add3%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 10)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap (- 0 5))
      ($SortWrappers.IntTo$Snap 10)))) x@10@01 1))
(pop) ; 3
; Joined path conditions
(assert (add3%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 10)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap (- 0 5))
      ($SortWrappers.IntTo$Snap 10)))) x@10@01 1))
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap (- 0 5))
  ($SortWrappers.IntTo$Snap 10)) x@10@01))
(pop) ; 3
; Joined path conditions
(assert (add%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap (- 0 5))
  ($SortWrappers.IntTo$Snap 10)) x@10@01))
(push) ; 3
(assert (not (=
  (add3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 10)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap (- 0 5))
        ($SortWrappers.IntTo$Snap 10)))) x@10@01 1)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap (- 0 5))
    ($SortWrappers.IntTo$Snap 10)) x@10@01))))
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
; [eval] add3(x, 1) == add(x)
; [eval] add3(x, 1)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.g > 0
(pop) ; 3
; Joined path conditions
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (add3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 10)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap (- 0 5))
        ($SortWrappers.IntTo$Snap 10)))) x@10@01 1)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap (- 0 5))
    ($SortWrappers.IntTo$Snap 10)) x@10@01))))
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
; [eval] add3(x, 1) == add(x)
; [eval] add3(x, 1)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.g > 0
(pop) ; 3
; Joined path conditions
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (add3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 10)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap (- 0 5))
        ($SortWrappers.IntTo$Snap 10)))) x@10@01 1)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap (- 0 5))
    ($SortWrappers.IntTo$Snap 10)) x@10@01))))
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
; [eval] add3(x, 1) == add(x)
; [eval] add3(x, 1)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] x.g > 0
(pop) ; 3
; Joined path conditions
; [eval] add(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (add3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 10)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.IntTo$Snap (- 0 5))
        ($SortWrappers.IntTo$Snap 10)))) x@10@01 1)
  (add ($Snap.combine
    ($SortWrappers.IntTo$Snap (- 0 5))
    ($SortWrappers.IntTo$Snap 10)) x@10@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
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
; var x: Ref
(declare-const x@13@01 $Ref)
; [exec]
; var b1: Bool
(declare-const b1@14@01 Bool)
; [exec]
; var b2: Bool
(declare-const b2@15@01 Bool)
; [exec]
; x := new(f, g)
(declare-const x@16@01 $Ref)
(assert (not (= x@16@01 $Ref.null)))
(declare-const f@17@01 Int)
(declare-const g@18@01 Int)
(assert (not (= x@16@01 x@13@01)))
; [exec]
; x.f := 1
; [exec]
; x.g := 2
; [exec]
; b1 := x.f > x.g
; [eval] x.f > x.g
; [exec]
; b2 := x.f == x.g
; [eval] x.f == x.g
; [exec]
; assert tern(x, b1) == x.g
; [eval] tern(x, b1) == x.g
; [eval] tern(x, b1)
(push) ; 3
; [then-branch: 0 | False | dead]
; [else-branch: 0 | True | live]
(push) ; 4
; [else-branch: 0 | True]
(assert (tern%precondition ($SortWrappers.IntTo$Snap 2) x@16@01 false))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (tern%precondition ($SortWrappers.IntTo$Snap 2) x@16@01 false))
(push) ; 3
(assert (not (= (tern ($SortWrappers.IntTo$Snap 2) x@16@01 false) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (tern ($SortWrappers.IntTo$Snap 2) x@16@01 false) 2))
; [exec]
; assert tern(x, !b1) == x.f
; [eval] tern(x, !b1) == x.f
; [eval] tern(x, !b1)
; [eval] !b1
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | True]
(assert (tern%precondition ($SortWrappers.IntTo$Snap 1) x@16@01 true))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (tern%precondition ($SortWrappers.IntTo$Snap 1) x@16@01 true))
(push) ; 3
(assert (not (= (tern ($SortWrappers.IntTo$Snap 1) x@16@01 true) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (tern ($SortWrappers.IntTo$Snap 1) x@16@01 true) 1))
; [exec]
; assert tern(x, b2) > 0
; [eval] tern(x, b2) > 0
; [eval] tern(x, b2)
(push) ; 3
; [then-branch: 2 | False | dead]
; [else-branch: 2 | True | live]
(push) ; 4
; [else-branch: 2 | True]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (tern ($SortWrappers.IntTo$Snap 2) x@16@01 false) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (tern ($SortWrappers.IntTo$Snap 2) x@16@01 false) 0))
; [exec]
; assert tern(x, !b2) > 1
; [eval] tern(x, !b2) > 1
; [eval] tern(x, !b2)
; [eval] !b2
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | True]
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (> (tern ($SortWrappers.IntTo$Snap 1) x@16@01 true) 1)))
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
; [eval] tern(x, !b2) > 1
; [eval] tern(x, !b2)
; [eval] !b2
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | True | live]
; [else-branch: 4 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (> (tern ($SortWrappers.IntTo$Snap 1) x@16@01 true) 1)))
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
; [eval] tern(x, !b2) > 1
; [eval] tern(x, !b2)
; [eval] !b2
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | True | live]
; [else-branch: 5 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (> (tern ($SortWrappers.IntTo$Snap 1) x@16@01 true) 1)))
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
; [eval] tern(x, !b2) > 1
; [eval] tern(x, !b2)
; [eval] !b2
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | True | live]
; [else-branch: 6 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | True]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (> (tern ($SortWrappers.IntTo$Snap 1) x@16@01 true) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
