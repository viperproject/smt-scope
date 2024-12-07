(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:40:44
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/abstract_funcs_and_preds.vpr
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
(declare-fun fun02 ($Snap $Ref) Bool)
(declare-fun fun02%limited ($Snap $Ref) Bool)
(declare-fun fun02%stateless ($Ref) Bool)
(declare-fun fun02%precondition ($Snap $Ref) Bool)
(declare-fun fun03 ($Snap $Ref) Bool)
(declare-fun fun03%limited ($Snap $Ref) Bool)
(declare-fun fun03%stateless ($Ref) Bool)
(declare-fun fun03%precondition ($Snap $Ref) Bool)
(declare-fun fun01 ($Snap $Ref) Int)
(declare-fun fun01%limited ($Snap $Ref) Int)
(declare-fun fun01%stateless ($Ref) Bool)
(declare-fun fun01%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun file%trigger ($Snap Int) Bool)
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
  (= (fun02%limited s@$ x@0@00) (fun02 s@$ x@0@00))
  :pattern ((fun02 s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (fun02%stateless x@0@00)
  :pattern ((fun02%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (fun02%limited s@$ x@0@00))) (=>
    (and
      (fun02%precondition s@$ x@0@00)
      (= x@0@00 ($SortWrappers.$SnapTo$Ref s@$)))
    result@1@00))
  :pattern ((fun02%limited s@$ x@0@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (let ((result@1@00 (fun02%limited s@$ x@0@00))) true)
  :pattern ((fun02%limited s@$ x@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (= (fun03%limited s@$ x@2@00) (fun03 s@$ x@2@00))
  :pattern ((fun03 s@$ x@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (fun03%stateless x@2@00)
  :pattern ((fun03%limited s@$ x@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (let ((result@3@00 (fun03%limited s@$ x@2@00))) (=>
    (and
      (fun03%precondition s@$ x@2@00)
      (= x@2@00 ($SortWrappers.$SnapTo$Ref s@$)))
    (not result@3@00)))
  :pattern ((fun03%limited s@$ x@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (let ((result@3@00 (fun03%limited s@$ x@2@00))) true)
  :pattern ((fun03%limited s@$ x@2@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=>
    (fun03%precondition s@$ x@2@00)
    (= (fun03 s@$ x@2@00) (not (fun02 s@$ x@2@00))))
  :pattern ((fun03 s@$ x@2@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref)) (!
  (=> (fun03%precondition s@$ x@2@00) (fun02%precondition s@$ x@2@00))
  :pattern ((fun03 s@$ x@2@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (= (fun01%limited s@$ x@4@00) (fun01 s@$ x@4@00))
  :pattern ((fun01 s@$ x@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (fun01%stateless x@4@00)
  :pattern ((fun01%limited s@$ x@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (let ((result@5@00 (fun01%limited s@$ x@4@00))) (=>
    (fun01%precondition s@$ x@4@00)
    (< 0 result@5@00)))
  :pattern ((fun01%limited s@$ x@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@4@00 $Ref)) (!
  (let ((result@5@00 (fun01%limited s@$ x@4@00))) true)
  :pattern ((fun01%limited s@$ x@4@00))
  :qid |quant-u-13|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
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
; assert fun01(x) >= 0
; [eval] fun01(x) >= 0
; [eval] fun01(x)
(push) ; 3
(assert (fun01%precondition $Snap.unit x@1@01))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition $Snap.unit x@1@01))
(push) ; 3
(assert (not (>= (fun01 $Snap.unit x@1@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= (fun01 $Snap.unit x@1@01) 0))
; [exec]
; assert fun01(x) == 0
; [eval] fun01(x) == 0
; [eval] fun01(x)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@1@01) 0)))
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
; [eval] fun01(x) == 0
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@1@01) 0)))
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
; [eval] fun01(x) == 0
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@1@01) 0)))
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
; [eval] fun01(x) == 0
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@1@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@2@01 $Ref)
(declare-const y@3@01 $Ref)
(declare-const x@4@01 $Ref)
(declare-const y@5@01 $Ref)
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
; var r: Int
(declare-const r@6@01 Int)
; [exec]
; r := fun01(x)
; [eval] fun01(x)
(push) ; 3
(assert (fun01%precondition $Snap.unit x@4@01))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition $Snap.unit x@4@01))
(declare-const r@7@01 Int)
(assert (= r@7@01 (fun01 $Snap.unit x@4@01)))
; [exec]
; assert fun01(x) == r
; [eval] fun01(x) == r
; [eval] fun01(x)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@4@01) r@7@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (fun01 $Snap.unit x@4@01) r@7@01))
; [exec]
; assert fun01(x) == fun01(y)
; [eval] fun01(x) == fun01(y)
; [eval] fun01(x)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] fun01(y)
(push) ; 3
(assert (fun01%precondition $Snap.unit y@5@01))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition $Snap.unit y@5@01))
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@4@01) (fun01 $Snap.unit y@5@01))))
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
; [eval] fun01(x) == fun01(y)
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] fun01(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@4@01) (fun01 $Snap.unit y@5@01))))
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
; [eval] fun01(x) == fun01(y)
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] fun01(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@4@01) (fun01 $Snap.unit y@5@01))))
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
; [eval] fun01(x) == fun01(y)
; [eval] fun01(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] fun01(y)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (= (fun01 $Snap.unit x@4@01) (fun01 $Snap.unit y@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@8@01 $Ref)
(declare-const y@9@01 $Ref)
(declare-const x@10@01 $Ref)
(declare-const y@11@01 $Ref)
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
; inhale acc(x.f, write)
(declare-const $t@12@01 $Ref)
(assert (not (= x@10@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x == x.f
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] x == x.f
(assert (= x@10@01 $t@12@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert fun02(x)
; [eval] fun02(x)
(set-option :timeout 0)
(push) ; 3
(assert (fun02%precondition ($SortWrappers.$RefTo$Snap $t@12@01) x@10@01))
(pop) ; 3
; Joined path conditions
(assert (fun02%precondition ($SortWrappers.$RefTo$Snap $t@12@01) x@10@01))
(push) ; 3
(assert (not (fun02 ($SortWrappers.$RefTo$Snap $t@12@01) x@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (fun02 ($SortWrappers.$RefTo$Snap $t@12@01) x@10@01))
; [exec]
; x.f := y
; [exec]
; assert fun02(x)
; [eval] fun02(x)
(push) ; 3
(assert (fun02%precondition ($SortWrappers.$RefTo$Snap y@11@01) x@10@01))
(pop) ; 3
; Joined path conditions
(assert (fun02%precondition ($SortWrappers.$RefTo$Snap y@11@01) x@10@01))
(push) ; 3
(assert (not (fun02 ($SortWrappers.$RefTo$Snap y@11@01) x@10@01)))
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
; [eval] fun02(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (fun02 ($SortWrappers.$RefTo$Snap y@11@01) x@10@01)))
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
; [eval] fun02(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (fun02 ($SortWrappers.$RefTo$Snap y@11@01) x@10@01)))
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
; [eval] fun02(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (fun02 ($SortWrappers.$RefTo$Snap y@11@01) x@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@14@01 $Ref)
(declare-const y@15@01 $Ref)
(declare-const x@16@01 $Ref)
(declare-const y@17@01 $Ref)
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
; inhale acc(x.f, write)
(declare-const $t@18@01 $Ref)
(assert (not (= x@16@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x == x.f
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] x == x.f
(assert (= x@16@01 $t@18@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert !fun03(x)
; [eval] !fun03(x)
; [eval] fun03(x)
(set-option :timeout 0)
(push) ; 3
(assert (fun03%precondition ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (fun03%precondition ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01))
(push) ; 3
(assert (not (not (fun03 ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (fun03 ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01)))
; [exec]
; assert fun03(x) == !fun02(x)
; [eval] fun03(x) == !fun02(x)
; [eval] fun03(x)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [eval] !fun02(x)
; [eval] fun02(x)
(push) ; 3
(assert (fun02%precondition ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (fun02%precondition ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01))
(push) ; 3
(assert (not (=
  (fun03 ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01)
  (not (fun02 ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun03 ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01)
  (not (fun02 ($SortWrappers.$RefTo$Snap $t@18@01) x@16@01))))
; [exec]
; x.f := y
; [exec]
; assert !fun03(x)
; [eval] !fun03(x)
; [eval] fun03(x)
(push) ; 3
(assert (fun03%precondition ($SortWrappers.$RefTo$Snap y@17@01) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (fun03%precondition ($SortWrappers.$RefTo$Snap y@17@01) x@16@01))
(push) ; 3
(assert (not (not (fun03 ($SortWrappers.$RefTo$Snap y@17@01) x@16@01))))
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
; [eval] !fun03(x)
; [eval] fun03(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (not (fun03 ($SortWrappers.$RefTo$Snap y@17@01) x@16@01))))
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
; [eval] !fun03(x)
; [eval] fun03(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (not (fun03 ($SortWrappers.$RefTo$Snap y@17@01) x@16@01))))
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
; [eval] !fun03(x)
; [eval] fun03(x)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (not (fun03 ($SortWrappers.$RefTo$Snap y@17@01) x@16@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- file_open ----------
(declare-const id@20@01 Int)
(declare-const id@21@01 Int)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@22@01 $Snap)
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- file_close ----------
(declare-const id@23@01 Int)
(declare-const id@24@01 Int)
(push) ; 1
(declare-const $t@25@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
; ---------- client ----------
(declare-const id@26@01 Int)
(declare-const id@27@01 Int)
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
; file_open(id)
(declare-const $t@28@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; file_close(id)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; file_close(id)
(set-option :timeout 0)
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
