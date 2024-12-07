(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:14
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/func2.vpr
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
(declare-fun f4 ($Snap $Ref) Int)
(declare-fun f4%limited ($Snap $Ref) Int)
(declare-fun f4%stateless ($Ref) Bool)
(declare-fun f4%precondition ($Snap $Ref) Bool)
(declare-fun f5 ($Snap $Ref) Int)
(declare-fun f5%limited ($Snap $Ref) Int)
(declare-fun f5%stateless ($Ref) Bool)
(declare-fun f5%precondition ($Snap $Ref) Bool)
(declare-fun f3_b ($Snap $Ref) Int)
(declare-fun f3_b%limited ($Snap $Ref) Int)
(declare-fun f3_b%stateless ($Ref) Bool)
(declare-fun f3_b%precondition ($Snap $Ref) Bool)
(declare-fun f1 ($Snap $Ref) Int)
(declare-fun f1%limited ($Snap $Ref) Int)
(declare-fun f1%stateless ($Ref) Bool)
(declare-fun f1%precondition ($Snap $Ref) Bool)
(declare-fun f3_a ($Snap $Ref) Int)
(declare-fun f3_a%limited ($Snap $Ref) Int)
(declare-fun f3_a%stateless ($Ref) Bool)
(declare-fun f3_a%precondition ($Snap $Ref) Bool)
(declare-fun f6 ($Snap $Ref) Int)
(declare-fun f6%limited ($Snap $Ref) Int)
(declare-fun f6%stateless ($Ref) Bool)
(declare-fun f6%precondition ($Snap $Ref) Bool)
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
(declare-fun $k@12@00 () $Perm)
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (f4%limited s@$ r@0@00) (f4 s@$ r@0@00))
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (f4%stateless r@0@00)
  :pattern ((f4%limited s@$ r@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (=> (f4%precondition s@$ r@0@00) (= (f4 s@$ r@0@00) 2))
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  true
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (f5%limited s@$ r@2@00) (f5 s@$ r@2@00))
  :pattern ((f5 s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (f5%stateless r@2@00)
  :pattern ((f5%limited s@$ r@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (= (f1%limited s@$ r@6@00) (f1 s@$ r@6@00))
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (f1%stateless r@6@00)
  :pattern ((f1%limited s@$ r@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@12@00)
    (=>
      (f1%precondition s@$ r@6@00)
      (= (f1 s@$ r@6@00) ($SortWrappers.$SnapToInt s@$))))
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  true
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (= (f6%limited s@$ r@10@00) (f6 s@$ r@10@00))
  :pattern ((f6 s@$ r@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (f6%stateless r@10@00)
  :pattern ((f6%limited s@$ r@10@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- t1 ----------
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 Int)
(assert (not (= r@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r.f := 1
; [exec]
; assert f1(r) == 1
; [eval] f1(r) == 1
; [eval] f1(r)
(push) ; 3
(declare-const $k@3@01 $Perm)
(assert ($Perm.isReadVar $k@3@01))
(assert (< $k@3@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@3@01)))
(assert (<= (- $Perm.Write $k@3@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@3@01)) (not (= r@1@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (f1%precondition ($SortWrappers.IntTo$Snap 1) r@1@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@3@01))
(assert (and
  (< $k@3@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@3@01))
  (<= (- $Perm.Write $k@3@01) $Perm.Write)
  (=> (< $Perm.No (- $Perm.Write $k@3@01)) (not (= r@1@01 $Ref.null)))
  (f1%precondition ($SortWrappers.IntTo$Snap 1) r@1@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (f1 ($SortWrappers.IntTo$Snap 1) r@1@01) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (f1 ($SortWrappers.IntTo$Snap 1) r@1@01) 1))
; [exec]
; assert f4(r) > 0
; [eval] f4(r) > 0
; [eval] f4(r)
(push) ; 3
; [eval] r.f == 2
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f4(r) > 0
; [eval] f4(r)
(set-option :timeout 0)
(push) ; 3
; [eval] r.f == 2
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f4(r) > 0
; [eval] f4(r)
(set-option :timeout 0)
(push) ; 3
; [eval] r.f == 2
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] f4(r) > 0
; [eval] f4(r)
(set-option :timeout 0)
(push) ; 3
; [eval] r.f == 2
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
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
; [eval] r.f == 2
(set-option :timeout 0)
(push) ; 4
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
