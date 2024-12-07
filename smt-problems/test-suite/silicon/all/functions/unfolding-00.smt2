(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/unfolding.vpr
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
(declare-fun getf ($Snap $Ref) Int)
(declare-fun getf%limited ($Snap $Ref) Int)
(declare-fun getf%stateless ($Ref) Bool)
(declare-fun getf%precondition ($Snap $Ref) Bool)
(declare-fun fun1 ($Snap $Ref) Int)
(declare-fun fun1%limited ($Snap $Ref) Int)
(declare-fun fun1%stateless ($Ref) Bool)
(declare-fun fun1%precondition ($Snap $Ref) Bool)
(declare-fun fun3 ($Snap $Ref) Int)
(declare-fun fun3%limited ($Snap $Ref) Int)
(declare-fun fun3%stateless ($Ref) Bool)
(declare-fun fun3%precondition ($Snap $Ref) Bool)
(declare-fun add ($Snap $Ref $Ref) Int)
(declare-fun add%limited ($Snap $Ref $Ref) Int)
(declare-fun add%stateless ($Ref $Ref) Bool)
(declare-fun add%precondition ($Snap $Ref $Ref) Bool)
(declare-fun fun2 ($Snap $Ref) Int)
(declare-fun fun2%limited ($Snap $Ref) Int)
(declare-fun fun2%stateless ($Ref) Bool)
(declare-fun fun2%precondition ($Snap $Ref) Bool)
(declare-fun sum ($Snap $Ref) Int)
(declare-fun sum%limited ($Snap $Ref) Int)
(declare-fun sum%stateless ($Ref) Bool)
(declare-fun sum%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun F%trigger ($Snap $Ref) Bool)
(declare-fun G%trigger ($Snap $Ref) Bool)
(declare-fun pair%trigger ($Snap $Ref) Bool)
(declare-fun R%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (z@0@00 $Ref)) (!
  (= (getf%limited s@$ z@0@00) (getf s@$ z@0@00))
  :pattern ((getf s@$ z@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (z@0@00 $Ref)) (!
  (getf%stateless z@0@00)
  :pattern ((getf%limited s@$ z@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (z@0@00 $Ref)) (!
  (=>
    (getf%precondition s@$ z@0@00)
    (= (getf s@$ z@0@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((getf s@$ z@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (z@0@00 $Ref)) (!
  true
  :pattern ((getf s@$ z@0@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (fun1%limited s@$ x@2@00) (fun1 s@$ x@2@00))
  :pattern ((fun1 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (fun1%stateless x@2@00)
  :pattern ((fun1%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (fun1%precondition s@$ x@2@00)
    (=
      (fun1 s@$ x@2@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((fun1 s@$ x@2@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  true
  :pattern ((fun1 s@$ x@2@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (y@4@00 $Ref)) (!
  (= (fun3%limited s@$ y@4@00) (fun3 s@$ y@4@00))
  :pattern ((fun3 s@$ y@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (y@4@00 $Ref)) (!
  (fun3%stateless y@4@00)
  :pattern ((fun3%limited s@$ y@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (y@4@00 $Ref)) (!
  (=>
    (fun3%precondition s@$ y@4@00)
    (=
      (fun3 s@$ y@4@00)
      (ite (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null)) 0 1)))
  :pattern ((fun3 s@$ y@4@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (y@4@00 $Ref)) (!
  true
  :pattern ((fun3 s@$ y@4@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (y@7@00 $Ref)) (!
  (= (add%limited s@$ x@6@00 y@7@00) (add s@$ x@6@00 y@7@00))
  :pattern ((add s@$ x@6@00 y@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (y@7@00 $Ref)) (!
  (add%stateless x@6@00 y@7@00)
  :pattern ((add%limited s@$ x@6@00 y@7@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (y@7@00 $Ref)) (!
  (=>
    (add%precondition s@$ x@6@00 y@7@00)
    (=
      (add s@$ x@6@00 y@7@00)
      (+
        (+
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@$)))
          ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@$))))))
  :pattern ((add s@$ x@6@00 y@7@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (y@7@00 $Ref)) (!
  true
  :pattern ((add s@$ x@6@00 y@7@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (x@9@00 $Ref)) (!
  (= (fun2%limited s@$ x@9@00) (fun2 s@$ x@9@00))
  :pattern ((fun2 s@$ x@9@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@9@00 $Ref)) (!
  (fun2%stateless x@9@00)
  :pattern ((fun2%limited s@$ x@9@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@9@00 $Ref)) (!
  (=>
    (fun2%precondition s@$ x@9@00)
    (= (fun2 s@$ x@9@00) ($SortWrappers.$SnapToInt ($Snap.first s@$))))
  :pattern ((fun2 s@$ x@9@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (x@9@00 $Ref)) (!
  true
  :pattern ((fun2 s@$ x@9@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  (= (sum%limited s@$ x@11@00) (sum s@$ x@11@00))
  :pattern ((sum s@$ x@11@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  (sum%stateless x@11@00)
  :pattern ((sum%limited s@$ x@11@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  (=>
    (sum%precondition s@$ x@11@00)
    (=
      (sum s@$ x@11@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((sum s@$ x@11@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref)) (!
  true
  :pattern ((sum s@$ x@11@00))
  :qid |quant-u-23|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test5 ----------
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
; x := new(f)
(declare-const x@1@01 $Ref)
(assert (not (= x@1@01 $Ref.null)))
(declare-const f@2@01 Int)
(assert (not (= x@1@01 x@0@01)))
; [exec]
; x.f := 3
; [exec]
; fold acc(F(x), write)
(assert (F%trigger ($SortWrappers.IntTo$Snap 3) x@1@01))
; [exec]
; assert fun2(x) == 3
; [eval] fun2(x) == 3
; [eval] fun2(x)
(push) ; 3
; [eval] x != null
(assert (fun2%precondition ($Snap.combine ($SortWrappers.IntTo$Snap 3) $Snap.unit) x@1@01))
(pop) ; 3
; Joined path conditions
(assert (fun2%precondition ($Snap.combine ($SortWrappers.IntTo$Snap 3) $Snap.unit) x@1@01))
(push) ; 3
(assert (not (= (fun2 ($Snap.combine ($SortWrappers.IntTo$Snap 3) $Snap.unit) x@1@01) 3)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fun2 ($Snap.combine ($SortWrappers.IntTo$Snap 3) $Snap.unit) x@1@01) 3))
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
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
(declare-const x@3@01 $Ref)
; [exec]
; x := new(f, g)
(declare-const x@4@01 $Ref)
(assert (not (= x@4@01 $Ref.null)))
(declare-const f@5@01 Int)
(declare-const g@6@01 Int)
(assert (not (= x@4@01 x@3@01)))
; [exec]
; x.f := 3
; [exec]
; x.g := 7
; [exec]
; fold acc(F(x), write)
(assert (F%trigger ($SortWrappers.IntTo$Snap 3) x@4@01))
; [exec]
; fold acc(G(x), write)
(assert (G%trigger ($SortWrappers.IntTo$Snap 7) x@4@01))
; [exec]
; assert fun1(x) == 10
; [eval] fun1(x) == 10
; [eval] fun1(x)
(push) ; 3
(assert (fun1%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($SortWrappers.IntTo$Snap 7)) x@4@01))
(pop) ; 3
; Joined path conditions
(assert (fun1%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap 3)
  ($SortWrappers.IntTo$Snap 7)) x@4@01))
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7)) x@4@01)
  10)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun1 ($Snap.combine ($SortWrappers.IntTo$Snap 3) ($SortWrappers.IntTo$Snap 7)) x@4@01)
  10))
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
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
(declare-const x@7@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@8@01 $Ref)
; [exec]
; x := new(f, g)
(declare-const x@9@01 $Ref)
(assert (not (= x@9@01 $Ref.null)))
(declare-const f@10@01 Int)
(declare-const g@11@01 Int)
(assert (not (= x@9@01 y@8@01)))
(assert (not (= x@9@01 x@7@01)))
; [exec]
; y := new(f, g)
(declare-const y@12@01 $Ref)
(assert (not (= y@12@01 $Ref.null)))
(declare-const f@13@01 Int)
(declare-const g@14@01 Int)
(assert (not (= y@12@01 x@9@01)))
(assert (not (= y@12@01 y@8@01)))
; [exec]
; x.f := y.f
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@12@01 x@9@01)))
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
(assert (not (= x@9@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(pair(x), write)
(assert (pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap f@13@01)
  ($SortWrappers.IntTo$Snap g@11@01)) x@9@01))
; [exec]
; fold acc(pair(y), write)
(assert (pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap f@13@01)
  ($SortWrappers.IntTo$Snap g@11@01)) y@12@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@9@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert sum(x) == sum(y)
; [eval] sum(x) == sum(y)
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@13@01)
  ($SortWrappers.IntTo$Snap g@11@01)) x@9@01))
(pop) ; 3
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@13@01)
  ($SortWrappers.IntTo$Snap g@11@01)) x@9@01))
; [eval] sum(y)
(push) ; 3
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@13@01)
  ($SortWrappers.IntTo$Snap g@11@01)) y@12@01))
(pop) ; 3
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@13@01)
  ($SortWrappers.IntTo$Snap g@11@01)) y@12@01))
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@13@01)
    ($SortWrappers.IntTo$Snap g@11@01)) x@9@01)
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@13@01)
    ($SortWrappers.IntTo$Snap g@11@01)) y@12@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@13@01)
    ($SortWrappers.IntTo$Snap g@11@01)) x@9@01)
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@13@01)
    ($SortWrappers.IntTo$Snap g@11@01)) y@12@01)))
; [exec]
; unfold acc(pair(x), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; x.f := x.f + 1
; [eval] x.f + 1
(declare-const f@15@01 Int)
(assert (= f@15@01 (+ f@13@01 1)))
; [exec]
; fold acc(pair(x), write)
(assert (pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap f@15@01)
  ($SortWrappers.IntTo$Snap g@11@01)) x@9@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@12@01 x@9@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert sum(x) == sum(y)
; [eval] sum(x) == sum(y)
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@15@01)
  ($SortWrappers.IntTo$Snap g@11@01)) x@9@01))
(pop) ; 3
; Joined path conditions
(assert (sum%precondition ($Snap.combine
  ($SortWrappers.IntTo$Snap f@15@01)
  ($SortWrappers.IntTo$Snap g@11@01)) x@9@01))
; [eval] sum(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@15@01)
    ($SortWrappers.IntTo$Snap g@11@01)) x@9@01)
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@13@01)
    ($SortWrappers.IntTo$Snap g@11@01)) y@12@01))))
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
(assert (not (= x@9@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@13@01)
      ($SortWrappers.IntTo$Snap g@11@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@15@01)
      ($SortWrappers.IntTo$Snap g@11@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@15@01)
      ($SortWrappers.IntTo$Snap g@11@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@13@01)
      ($SortWrappers.IntTo$Snap g@11@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@12@01 x@9@01)) (not (= x@9@01 y@12@01))))
; [eval] sum(x) == sum(y)
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] sum(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@15@01)
    ($SortWrappers.IntTo$Snap g@11@01)) x@9@01)
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@13@01)
    ($SortWrappers.IntTo$Snap g@11@01)) y@12@01))))
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
(assert (not (= x@9@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@13@01)
      ($SortWrappers.IntTo$Snap g@11@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@15@01)
      ($SortWrappers.IntTo$Snap g@11@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@15@01)
      ($SortWrappers.IntTo$Snap g@11@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@13@01)
      ($SortWrappers.IntTo$Snap g@11@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@12@01 x@9@01)) (not (= x@9@01 y@12@01))))
; [eval] sum(x) == sum(y)
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] sum(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@15@01)
    ($SortWrappers.IntTo$Snap g@11@01)) x@9@01)
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@13@01)
    ($SortWrappers.IntTo$Snap g@11@01)) y@12@01))))
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
(assert (not (= x@9@01 y@12@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@13@01)
      ($SortWrappers.IntTo$Snap g@11@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@15@01)
      ($SortWrappers.IntTo$Snap g@11@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@15@01)
      ($SortWrappers.IntTo$Snap g@11@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap f@13@01)
      ($SortWrappers.IntTo$Snap g@11@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@12@01 x@9@01)) (not (= x@9@01 y@12@01))))
; [eval] sum(x) == sum(y)
; [eval] sum(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] sum(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@15@01)
    ($SortWrappers.IntTo$Snap g@11@01)) x@9@01)
  (sum ($Snap.combine
    ($SortWrappers.IntTo$Snap f@13@01)
    ($SortWrappers.IntTo$Snap g@11@01)) y@12@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const y@16@01 $Ref)
(declare-const y@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.second $t@18@01) $Snap.unit))
; [eval] getf(y) > 0
; [eval] getf(y)
(push) ; 2
(assert (getf%precondition ($Snap.first $t@18@01) y@17@01))
(pop) ; 2
; Joined path conditions
(assert (getf%precondition ($Snap.first $t@18@01) y@17@01))
(assert (> (getf ($Snap.first $t@18@01) y@17@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var v: Int
(declare-const v@19@01 Int)
; [exec]
; v := (unfolding acc(pair(y), write) in y.g)
; [eval] (unfolding acc(pair(y), write) in y.g)
(push) ; 3
(assert (pair%trigger ($Snap.first $t@18@01) y@17@01))
(assert (=
  ($Snap.first $t@18@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@18@01))
    ($Snap.second ($Snap.first $t@18@01)))))
(assert (not (= y@17@01 $Ref.null)))
(pop) ; 3
; Joined path conditions
(assert (and
  (pair%trigger ($Snap.first $t@18@01) y@17@01)
  (=
    ($Snap.first $t@18@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@18@01))
      ($Snap.second ($Snap.first $t@18@01))))
  (not (= y@17@01 $Ref.null))))
(declare-const v@20@01 Int)
(assert (= v@20@01 ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first $t@18@01)))))
; [exec]
; assert getf(y) == sum(y) - v
; [eval] getf(y) == sum(y) - v
; [eval] getf(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] sum(y) - v
; [eval] sum(y)
(push) ; 3
(assert (sum%precondition ($Snap.first $t@18@01) y@17@01))
(pop) ; 3
; Joined path conditions
(assert (sum%precondition ($Snap.first $t@18@01) y@17@01))
(push) ; 3
(assert (not (=
  (getf ($Snap.first $t@18@01) y@17@01)
  (- (sum ($Snap.first $t@18@01) y@17@01) v@20@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (getf ($Snap.first $t@18@01) y@17@01)
  (- (sum ($Snap.first $t@18@01) y@17@01) v@20@01)))
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const a@21@01 Int)
(declare-const a@22@01 Int)
(push) ; 1
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] a > 10
(assert (> a@22@01 10))
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
(declare-const x@24@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@25@01 $Ref)
; [exec]
; x := new(f, g)
(declare-const x@26@01 $Ref)
(assert (not (= x@26@01 $Ref.null)))
(declare-const f@27@01 Int)
(declare-const g@28@01 Int)
(assert (not (= x@26@01 y@25@01)))
(assert (not (= x@26@01 x@24@01)))
; [exec]
; y := new(f, g)
(declare-const y@29@01 $Ref)
(assert (not (= y@29@01 $Ref.null)))
(declare-const f@30@01 Int)
(declare-const g@31@01 Int)
(assert (not (= y@29@01 x@26@01)))
(assert (not (= y@29@01 y@25@01)))
; [exec]
; x.f := 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@29@01 x@26@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; x.g := a
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@29@01 x@26@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; y.f := 2
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@26@01 y@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; y.g := -a
; [eval] -a
(declare-const g@32@01 Int)
(assert (= g@32@01 (- 0 a@22@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@26@01 y@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(pair(x), write)
(assert (pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($SortWrappers.IntTo$Snap a@22@01)) x@26@01))
; [exec]
; fold acc(pair(y), write)
(assert (pair%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 2)
  ($SortWrappers.IntTo$Snap g@32@01)) y@29@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@26@01 y@29@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert add(x, x) == 2 + a
; [eval] add(x, x) == 2 + a
; [eval] add(x, x)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (add%precondition ($Snap.combine
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) ($SortWrappers.IntTo$Snap a@22@01))
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) ($SortWrappers.IntTo$Snap a@22@01))) x@26@01 x@26@01))
(pop) ; 3
; Joined path conditions
(assert (add%precondition ($Snap.combine
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) ($SortWrappers.IntTo$Snap a@22@01))
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) ($SortWrappers.IntTo$Snap a@22@01))) x@26@01 x@26@01))
; [eval] 2 + a
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))) x@26@01 x@26@01)
  (+ 2 a@22@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))) x@26@01 x@26@01)
  (+ 2 a@22@01)))
; [exec]
; assert add(x, y) == a + 3
; [eval] add(x, y) == a + 3
; [eval] add(x, y)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (add%precondition ($Snap.combine
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) ($SortWrappers.IntTo$Snap a@22@01))
  ($Snap.combine ($SortWrappers.IntTo$Snap 2) ($SortWrappers.IntTo$Snap g@32@01))) x@26@01 y@29@01))
(pop) ; 3
; Joined path conditions
(assert (add%precondition ($Snap.combine
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) ($SortWrappers.IntTo$Snap a@22@01))
  ($Snap.combine ($SortWrappers.IntTo$Snap 2) ($SortWrappers.IntTo$Snap g@32@01))) x@26@01 y@29@01))
; [eval] a + 3
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))) x@26@01 y@29@01)
  (+ a@22@01 3))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))) x@26@01 y@29@01)
  (+ a@22@01 3)))
; [exec]
; assert add(y, x) < 0
; [eval] add(y, x) < 0
; [eval] add(y, x)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (add%precondition ($Snap.combine
  ($Snap.combine ($SortWrappers.IntTo$Snap 2) ($SortWrappers.IntTo$Snap g@32@01))
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) ($SortWrappers.IntTo$Snap a@22@01))) y@29@01 x@26@01))
(pop) ; 3
; Joined path conditions
(assert (add%precondition ($Snap.combine
  ($Snap.combine ($SortWrappers.IntTo$Snap 2) ($SortWrappers.IntTo$Snap g@32@01))
  ($Snap.combine ($SortWrappers.IntTo$Snap 1) ($SortWrappers.IntTo$Snap a@22@01))) y@29@01 x@26@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))) y@29@01 x@26@01)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))) y@29@01 x@26@01)
  0))
; [exec]
; assert add(x, y) < 0
; [eval] add(x, y) < 0
; [eval] add(x, y)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))) x@26@01 y@29@01)
  0)))
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
(assert (not (= y@29@01 x@26@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@26@01 y@29@01)) (not (= y@29@01 x@26@01))))
; [eval] add(x, y) < 0
; [eval] add(x, y)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))) x@26@01 y@29@01)
  0)))
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
(assert (not (= y@29@01 x@26@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@26@01 y@29@01)) (not (= y@29@01 x@26@01))))
; [eval] add(x, y) < 0
; [eval] add(x, y)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))) x@26@01 y@29@01)
  0)))
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
(assert (not (= y@29@01 x@26@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@26@01 y@29@01)) (not (= y@29@01 x@26@01))))
; [eval] add(x, y) < 0
; [eval] add(x, y)
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (<
  (add ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($SortWrappers.IntTo$Snap a@22@01))
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($SortWrappers.IntTo$Snap g@32@01))) x@26@01 y@29@01)
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
