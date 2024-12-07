(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/nested.vpr
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
(declare-fun fun2 ($Snap $Ref) Int)
(declare-fun fun2%limited ($Snap $Ref) Int)
(declare-fun fun2%stateless ($Ref) Bool)
(declare-fun fun2%precondition ($Snap $Ref) Bool)
(declare-fun fun7 ($Snap $Ref) Int)
(declare-fun fun7%limited ($Snap $Ref) Int)
(declare-fun fun7%stateless ($Ref) Bool)
(declare-fun fun7%precondition ($Snap $Ref) Bool)
(declare-fun fun1 ($Snap $Ref) Int)
(declare-fun fun1%limited ($Snap $Ref) Int)
(declare-fun fun1%stateless ($Ref) Bool)
(declare-fun fun1%precondition ($Snap $Ref) Bool)
(declare-fun fun3 ($Snap $Ref) Int)
(declare-fun fun3%limited ($Snap $Ref) Int)
(declare-fun fun3%stateless ($Ref) Bool)
(declare-fun fun3%precondition ($Snap $Ref) Bool)
(declare-fun fun6 ($Snap $Ref) Int)
(declare-fun fun6%limited ($Snap $Ref) Int)
(declare-fun fun6%stateless ($Ref) Bool)
(declare-fun fun6%precondition ($Snap $Ref) Bool)
(declare-fun fun4 ($Snap Bool $Ref $Ref) Int)
(declare-fun fun4%limited ($Snap Bool $Ref $Ref) Int)
(declare-fun fun4%stateless (Bool $Ref $Ref) Bool)
(declare-fun fun4%precondition ($Snap Bool $Ref $Ref) Bool)
(declare-fun fun5 ($Snap $Ref) Int)
(declare-fun fun5%limited ($Snap $Ref) Int)
(declare-fun fun5%stateless ($Ref) Bool)
(declare-fun fun5%precondition ($Snap $Ref) Bool)
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
  (= (fun2%limited s@$ x@0@00) (fun2 s@$ x@0@00))
  :pattern ((fun2 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (fun2%stateless x@0@00)
  :pattern ((fun2%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (fun2%precondition s@$ x@0@00)
    (= (fun2 s@$ x@0@00) (- 0 ($SortWrappers.$SnapToInt s@$))))
  :pattern ((fun2 s@$ x@0@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((fun2 s@$ x@0@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (fun7%limited s@$ x@2@00) (fun7 s@$ x@2@00))
  :pattern ((fun7 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (fun7%stateless x@2@00)
  :pattern ((fun7%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (let ((result@3@00 (fun7%limited s@$ x@2@00))) (=>
    (fun7%precondition s@$ x@2@00)
    (>= result@3@00 0)))
  :pattern ((fun7%limited s@$ x@2@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (let ((result@3@00 (fun7%limited s@$ x@2@00))) true)
  :pattern ((fun7%limited s@$ x@2@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (fun7%precondition s@$ x@2@00)
    (=
      (fun7 s@$ x@2@00)
      (ite
        (< ($SortWrappers.$SnapToInt s@$) 0)
        (- 0 ($SortWrappers.$SnapToInt s@$))
        ($SortWrappers.$SnapToInt s@$))))
  :pattern ((fun7 s@$ x@2@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  true
  :pattern ((fun7 s@$ x@2@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (= (fun1%limited s@$ x@4@00) (fun1 s@$ x@4@00))
  :pattern ((fun1 s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (fun1%stateless x@4@00)
  :pattern ((fun1%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (fun1%precondition s@$ x@4@00)
    (=
      (fun1 s@$ x@4@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        (fun2 ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))))
  :pattern ((fun1 s@$ x@4@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (=>
    (fun1%precondition s@$ x@4@00)
    (fun2%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second s@$)))))
  :pattern ((fun1 s@$ x@4@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (= (fun3%limited s@$ x@6@00) (fun3 s@$ x@6@00))
  :pattern ((fun3 s@$ x@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (fun3%stateless x@6@00)
  :pattern ((fun3%limited s@$ x@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (=>
    (fun3%precondition s@$ x@6@00)
    (= (fun3 s@$ x@6@00) (+ 1 (fun2 ($Snap.first s@$) x@6@00))))
  :pattern ((fun3 s@$ x@6@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref)) (!
  (=>
    (fun3%precondition s@$ x@6@00)
    (fun2%precondition ($Snap.first s@$) x@6@00))
  :pattern ((fun3 s@$ x@6@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (x@8@00 $Ref)) (!
  (= (fun6%limited s@$ x@8@00) (fun6 s@$ x@8@00))
  :pattern ((fun6 s@$ x@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@8@00 $Ref)) (!
  (fun6%stateless x@8@00)
  :pattern ((fun6%limited s@$ x@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@8@00 $Ref)) (!
  (let ((result@9@00 (fun6%limited s@$ x@8@00))) (=>
    (fun6%precondition s@$ x@8@00)
    (>= result@9@00 0)))
  :pattern ((fun6%limited s@$ x@8@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (x@8@00 $Ref)) (!
  (let ((result@9@00 (fun6%limited s@$ x@8@00))) true)
  :pattern ((fun6%limited s@$ x@8@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (x@8@00 $Ref)) (!
  (=> (fun6%precondition s@$ x@8@00) (= (fun6 s@$ x@8@00) (fun7 s@$ x@8@00)))
  :pattern ((fun6 s@$ x@8@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (x@8@00 $Ref)) (!
  (=> (fun6%precondition s@$ x@8@00) (fun7%precondition s@$ x@8@00))
  :pattern ((fun6 s@$ x@8@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (b@10@00 Bool) (x@11@00 $Ref) (y@12@00 $Ref)) (!
  (=
    (fun4%limited s@$ b@10@00 x@11@00 y@12@00)
    (fun4 s@$ b@10@00 x@11@00 y@12@00))
  :pattern ((fun4 s@$ b@10@00 x@11@00 y@12@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (b@10@00 Bool) (x@11@00 $Ref) (y@12@00 $Ref)) (!
  (fun4%stateless b@10@00 x@11@00 y@12@00)
  :pattern ((fun4%limited s@$ b@10@00 x@11@00 y@12@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (b@10@00 Bool) (x@11@00 $Ref) (y@12@00 $Ref)) (!
  (=>
    (fun4%precondition s@$ b@10@00 x@11@00 y@12@00)
    (=
      (fun4 s@$ b@10@00 x@11@00 y@12@00)
      (+
        (-
          7
          (ite
            (not b@10@00)
            (fun2 ($Snap.first s@$) y@12@00)
            (fun1 ($Snap.combine
              ($Snap.first s@$)
              ($Snap.combine
                ($Snap.first ($Snap.second s@$))
                ($Snap.first ($Snap.second ($Snap.second s@$))))) y@12@00)))
        (ite
          b@10@00
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second s@$))))
          99))))
  :pattern ((fun4 s@$ b@10@00 x@11@00 y@12@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (b@10@00 Bool) (x@11@00 $Ref) (y@12@00 $Ref)) (!
  (=>
    (fun4%precondition s@$ b@10@00 x@11@00 y@12@00)
    (ite
      (not b@10@00)
      (fun2%precondition ($Snap.first s@$) y@12@00)
      (fun1%precondition ($Snap.combine
        ($Snap.first s@$)
        ($Snap.combine
          ($Snap.first ($Snap.second s@$))
          ($Snap.first ($Snap.second ($Snap.second s@$))))) y@12@00)))
  :pattern ((fun4 s@$ b@10@00 x@11@00 y@12@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (x@14@00 $Ref)) (!
  (= (fun5%limited s@$ x@14@00) (fun5 s@$ x@14@00))
  :pattern ((fun5 s@$ x@14@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@14@00 $Ref)) (!
  (fun5%stateless x@14@00)
  :pattern ((fun5%limited s@$ x@14@00))
  :qid |quant-u-13|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test02 ----------
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
; x := new(f, g)
(declare-const x@1@01 $Ref)
(assert (not (= x@1@01 $Ref.null)))
(declare-const f@2@01 Int)
(declare-const g@3@01 $Ref)
(assert (not (= x@1@01 x@0@01)))
; [exec]
; x.f := 1
; [exec]
; assert fun3(x) == 0
; [eval] fun3(x) == 0
; [eval] fun3(x)
(push) ; 3
(assert (fun3%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($SortWrappers.$RefTo$Snap g@3@01)) x@1@01))
(pop) ; 3
; Joined path conditions
(assert (fun3%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($SortWrappers.$RefTo$Snap g@3@01)) x@1@01))
(push) ; 3
(assert (not (=
  (fun3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($SortWrappers.$RefTo$Snap g@3@01)) x@1@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun3 ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($SortWrappers.$RefTo$Snap g@3@01)) x@1@01)
  0))
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
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
(declare-const x@4@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@5@01 $Ref)
; [exec]
; x := new(f, g)
(declare-const x@6@01 $Ref)
(assert (not (= x@6@01 $Ref.null)))
(declare-const f@7@01 Int)
(declare-const g@8@01 $Ref)
(assert (not (= x@6@01 x@4@01)))
(assert (not (= x@6@01 y@5@01)))
; [exec]
; y := new(f, g)
(declare-const y@9@01 $Ref)
(assert (not (= y@9@01 $Ref.null)))
(declare-const f@10@01 Int)
(declare-const g@11@01 $Ref)
(assert (not (= y@9@01 x@6@01)))
(assert (not (= y@9@01 g@8@01)))
(assert (not (= y@9@01 y@5@01)))
; [exec]
; x.f := 3
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@9@01 x@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.g := y
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@9@01 x@6@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.g.f := 9
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@6@01 y@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert fun1(x) == -6
; [eval] fun1(x) == -6
; [eval] fun1(x)
(set-option :timeout 0)
(push) ; 3
(assert (fun1%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($Snap.combine ($SortWrappers.$RefTo$Snap y@9@01) ($SortWrappers.IntTo$Snap 9))) x@6@01))
(pop) ; 3
; Joined path conditions
(assert (fun1%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($Snap.combine ($SortWrappers.$RefTo$Snap y@9@01) ($SortWrappers.IntTo$Snap 9))) x@6@01))
; [eval] -6
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap y@9@01)
      ($SortWrappers.IntTo$Snap 9))) x@6@01)
  (- 0 6))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun1 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap y@9@01)
      ($SortWrappers.IntTo$Snap 9))) x@6@01)
  (- 0 6)))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
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
(declare-const x@12@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@13@01 $Ref)
; [exec]
; x := new(f, g)
(declare-const x@14@01 $Ref)
(assert (not (= x@14@01 $Ref.null)))
(declare-const f@15@01 Int)
(declare-const g@16@01 $Ref)
(assert (not (= x@14@01 y@13@01)))
(assert (not (= x@14@01 x@12@01)))
; [exec]
; y := new(f, g)
(declare-const y@17@01 $Ref)
(assert (not (= y@17@01 $Ref.null)))
(declare-const f@18@01 Int)
(declare-const g@19@01 $Ref)
(assert (not (= y@17@01 y@13@01)))
(assert (not (= y@17@01 g@16@01)))
(assert (not (= y@17@01 x@14@01)))
; [exec]
; x.f := 3
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@14@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.g := y
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@14@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.g.f := 17
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@14@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert fun4(true, x, x) == 7 - 3 + 17 + 17
; [eval] fun4(true, x, x) == 7 - 3 + 17 + 17
; [eval] fun4(true, x, x)
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
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | True]
; [eval] x == y
(assert (fun4%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap y@17@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 17) $Snap.unit))) true x@14@01 x@14@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (fun4%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap y@17@01)
    ($Snap.combine ($SortWrappers.IntTo$Snap 17) $Snap.unit))) true x@14@01 x@14@01))
; [eval] 7 - 3 + 17 + 17
; [eval] 7 - 3 + 17
; [eval] 7 - 3
(push) ; 3
(assert (not (=
  (fun4 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap y@17@01)
      ($Snap.combine ($SortWrappers.IntTo$Snap 17) $Snap.unit))) true x@14@01 x@14@01)
  38)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun4 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap y@17@01)
      ($Snap.combine ($SortWrappers.IntTo$Snap 17) $Snap.unit))) true x@14@01 x@14@01)
  38))
; [exec]
; assert fun4(false, x, x) == 7 + 3 + 99
; [eval] fun4(false, x, x) == 7 + 3 + 99
; [eval] fun4(false, x, x)
(push) ; 3
; [then-branch: 1 | False | dead]
; [else-branch: 1 | True | live]
(push) ; 4
; [else-branch: 1 | True]
; [eval] x == y
(assert (fun4%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap y@17@01)
    ($Snap.combine $Snap.unit $Snap.unit))) false x@14@01 x@14@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (fun4%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap y@17@01)
    ($Snap.combine $Snap.unit $Snap.unit))) false x@14@01 x@14@01))
; [eval] 7 + 3 + 99
; [eval] 7 + 3
(push) ; 3
(assert (not (=
  (fun4 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap y@17@01)
      ($Snap.combine $Snap.unit $Snap.unit))) false x@14@01 x@14@01)
  109)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun4 ($Snap.combine
    ($SortWrappers.IntTo$Snap 3)
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap y@17@01)
      ($Snap.combine $Snap.unit $Snap.unit))) false x@14@01 x@14@01)
  109))
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
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@14@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@14@01 y@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= g@19@01 y@17@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= y@17@01 g@19@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and (not (= y@17@01 x@14@01)) (not (= x@14@01 y@17@01)))
  (and (not (= x@14@01 y@17@01)) (not (= y@17@01 x@14@01)))))
(assert (and (not (= x@14@01 y@17@01)) (not (= y@17@01 x@14@01))))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
