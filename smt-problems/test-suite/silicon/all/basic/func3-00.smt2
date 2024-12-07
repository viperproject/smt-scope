(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/func3.vpr
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
(declare-fun f4 ($Snap $Ref) $Ref)
(declare-fun f4%limited ($Snap $Ref) $Ref)
(declare-fun f4%stateless ($Ref) Bool)
(declare-fun f4%precondition ($Snap $Ref) Bool)
(declare-fun f3 ($Snap $Ref) Int)
(declare-fun f3%limited ($Snap $Ref) Int)
(declare-fun f3%stateless ($Ref) Bool)
(declare-fun f3%precondition ($Snap $Ref) Bool)
(declare-fun f2 ($Snap $Ref) Int)
(declare-fun f2%limited ($Snap $Ref) Int)
(declare-fun f2%stateless ($Ref) Bool)
(declare-fun f2%precondition ($Snap $Ref) Bool)
(declare-fun f1 ($Snap $Ref) Int)
(declare-fun f1%limited ($Snap $Ref) Int)
(declare-fun f1%stateless ($Ref) Bool)
(declare-fun f1%precondition ($Snap $Ref) Bool)
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
(declare-fun $k@8@00 () $Perm)
(declare-fun $k@9@00 () $Perm)
(declare-fun $k@11@00 () $Perm)
(declare-fun $k@13@00 () $Perm)
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (f4%limited s@$ r@0@00) (f4 s@$ r@0@00))
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (f4%stateless r@0@00)
  :pattern ((f4%limited s@$ r@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@8@00)
    (=>
      (f4%precondition s@$ r@0@00)
      (= (f4 s@$ r@0@00) ($SortWrappers.$SnapTo$Ref s@$))))
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  true
  :pattern ((f4 s@$ r@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (f3%limited s@$ r@2@00) (f3 s@$ r@2@00))
  :pattern ((f3 s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (f3%stateless r@2@00)
  :pattern ((f3%limited s@$ r@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (f3%limited s@$ r@2@00))) (and
    ($Perm.isReadVar $k@9@00)
    (=> (f3%precondition s@$ r@2@00) (= result@3@00 2))))
  :pattern ((f3%limited s@$ r@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (let ((result@3@00 (f3%limited s@$ r@2@00))) true)
  :pattern ((f3%limited s@$ r@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@9@00)
    (=>
      (f3%precondition s@$ r@2@00)
      (= (f3 s@$ r@2@00) ($SortWrappers.$SnapToInt ($Snap.first s@$)))))
  :pattern ((f3 s@$ r@2@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  true
  :pattern ((f3 s@$ r@2@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (= (f2%limited s@$ r@4@00) (f2 s@$ r@4@00))
  :pattern ((f2 s@$ r@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (f2%stateless r@4@00)
  :pattern ((f2%limited s@$ r@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (let ((result@5@00 (f2%limited s@$ r@4@00))) (and
    ($Perm.isReadVar $k@11@00)
    (=> (f2%precondition s@$ r@4@00) (= result@5@00 2))))
  :pattern ((f2%limited s@$ r@4@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (let ((result@5@00 (f2%limited s@$ r@4@00))) true)
  :pattern ((f2%limited s@$ r@4@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (= (f1%limited s@$ r@6@00) (f1 s@$ r@6@00))
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (f1%stateless r@6@00)
  :pattern ((f1%limited s@$ r@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (let ((result@7@00 (f1%limited s@$ r@6@00))) (and
    ($Perm.isReadVar $k@13@00)
    (=>
      (f1%precondition s@$ r@6@00)
      (= result@7@00 ($SortWrappers.$SnapToInt s@$)))))
  :pattern ((f1%limited s@$ r@6@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (let ((result@7@00 (f1%limited s@$ r@6@00))) true)
  :pattern ((f1%limited s@$ r@6@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@13@00)
    (=>
      (f1%precondition s@$ r@6@00)
      (= (f1 s@$ r@6@00) ($SortWrappers.$SnapToInt s@$))))
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  true
  :pattern ((f1 s@$ r@6@00))
  :qid |quant-u-19|)))
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
; r.f := 2
; [exec]
; assert f3(r) == 2
; [eval] f3(r) == 2
; [eval] f3(r)
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
; [eval] r.f == 2
(assert (f3%precondition ($Snap.combine ($SortWrappers.IntTo$Snap 2) $Snap.unit) r@1@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@3@01))
(assert (and
  (< $k@3@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@3@01))
  (<= (- $Perm.Write $k@3@01) $Perm.Write)
  (=> (< $Perm.No (- $Perm.Write $k@3@01)) (not (= r@1@01 $Ref.null)))
  (f3%precondition ($Snap.combine ($SortWrappers.IntTo$Snap 2) $Snap.unit) r@1@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (f3 ($Snap.combine ($SortWrappers.IntTo$Snap 2) $Snap.unit) r@1@01) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (f3 ($Snap.combine ($SortWrappers.IntTo$Snap 2) $Snap.unit) r@1@01) 2))
; [exec]
; assert f3(r) == 1
; [eval] f3(r) == 1
; [eval] f3(r)
(push) ; 3
(declare-const $k@4@01 $Perm)
(assert ($Perm.isReadVar $k@4@01))
(assert (< $k@4@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@4@01)))
(assert (<= (- $Perm.Write $k@4@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@4@01)) (not (= r@1@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] r.f == 2
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@4@01))
(assert (and
  (< $k@4@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@4@01))
  (<= (- $Perm.Write $k@4@01) $Perm.Write)
  (=> (< $Perm.No (- $Perm.Write $k@4@01)) (not (= r@1@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (f3 ($Snap.combine ($SortWrappers.IntTo$Snap 2) $Snap.unit) r@1@01) 1)))
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
; [eval] f3(r) == 1
; [eval] f3(r)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@5@01 $Perm)
(assert ($Perm.isReadVar $k@5@01))
(assert (< $k@5@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@5@01)))
(assert (<= (- $Perm.Write $k@5@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@5@01)) (not (= r@1@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@5@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] r.f == 2
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@5@01))
(assert (and
  (< $k@5@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@5@01))
  (<= (- $Perm.Write $k@5@01) $Perm.Write)
  (=> (< $Perm.No (- $Perm.Write $k@5@01)) (not (= r@1@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (f3 ($Snap.combine ($SortWrappers.IntTo$Snap 2) $Snap.unit) r@1@01) 1)))
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
; [eval] f3(r) == 1
; [eval] f3(r)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (< $k@6@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@6@01)))
(assert (<= (- $Perm.Write $k@6@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@6@01)) (not (= r@1@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] r.f == 2
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@6@01))
(assert (and
  (< $k@6@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@6@01))
  (<= (- $Perm.Write $k@6@01) $Perm.Write)
  (=> (< $Perm.No (- $Perm.Write $k@6@01)) (not (= r@1@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (f3 ($Snap.combine ($SortWrappers.IntTo$Snap 2) $Snap.unit) r@1@01) 1)))
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
; [eval] f3(r) == 1
; [eval] f3(r)
(set-option :timeout 0)
(push) ; 3
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (< $k@7@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@7@01)))
(assert (<= (- $Perm.Write $k@7@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@7@01)) (not (= r@1@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] r.f == 2
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@7@01))
(assert (and
  (< $k@7@01 $Perm.Write)
  (<= $Perm.No (- $Perm.Write $k@7@01))
  (<= (- $Perm.Write $k@7@01) $Perm.Write)
  (=> (< $Perm.No (- $Perm.Write $k@7@01)) (not (= r@1@01 $Ref.null)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (f3 ($Snap.combine ($SortWrappers.IntTo$Snap 2) $Snap.unit) r@1@01) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- t3 ----------
(declare-const r@8@01 $Ref)
(declare-const r@9@01 $Ref)
(push) ; 1
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(declare-const $t@11@01 $Ref)
(assert (<= $Perm.No $k@10@01))
(assert (<= $k@10@01 $Perm.Write))
(assert (=> (< $Perm.No $k@10@01) (not (= r@9@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var y: Ref
(declare-const y@12@01 $Ref)
; [exec]
; var x: Ref
(declare-const x@13@01 $Ref)
; [exec]
; y := f4(r)
; [eval] f4(r)
(push) ; 3
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@10@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@14@01 $k@10@01))
(assert (<= $Perm.No (- $k@10@01 $k@14@01)))
(assert (<= (- $k@10@01 $k@14@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@10@01 $k@14@01)) (not (= r@9@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (f4%precondition ($SortWrappers.$RefTo$Snap $t@11@01) r@9@01))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@14@01))
(assert (and
  (< $k@14@01 $k@10@01)
  (<= $Perm.No (- $k@10@01 $k@14@01))
  (<= (- $k@10@01 $k@14@01) $Perm.Write)
  (=> (< $Perm.No (- $k@10@01 $k@14@01)) (not (= r@9@01 $Ref.null)))
  (f4%precondition ($SortWrappers.$RefTo$Snap $t@11@01) r@9@01)))
(declare-const y@15@01 $Ref)
(assert (= y@15@01 (f4 ($SortWrappers.$RefTo$Snap $t@11@01) r@9@01)))
; [exec]
; x := new()
(declare-const x@16@01 $Ref)
(assert (not (= x@16@01 $Ref.null)))
(assert (not (= x@16@01 y@15@01)))
(assert (not (= x@16@01 x@13@01)))
(assert (not (= x@16@01 $t@11@01)))
(assert (not (= x@16@01 r@9@01)))
; [exec]
; assert x != y
; [eval] x != y
(pop) ; 2
(pop) ; 1
