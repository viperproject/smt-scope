(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr
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
(declare-fun bar01 ($Snap Int) Int)
(declare-fun bar01%limited ($Snap Int) Int)
(declare-fun bar01%stateless (Int) Bool)
(declare-fun bar01%precondition ($Snap Int) Bool)
(declare-fun fun01 ($Snap $Ref Int) Bool)
(declare-fun fun01%limited ($Snap $Ref Int) Bool)
(declare-fun fun01%stateless ($Ref Int) Bool)
(declare-fun fun01%precondition ($Snap $Ref Int) Bool)
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
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (= (bar01%limited s@$ i@0@00) (bar01 s@$ i@0@00))
  :pattern ((bar01 s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (bar01%stateless i@0@00)
  :pattern ((bar01%limited s@$ i@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (i@3@00 Int)) (!
  (= (fun01%limited s@$ x@2@00 i@3@00) (fun01 s@$ x@2@00 i@3@00))
  :pattern ((fun01 s@$ x@2@00 i@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (i@3@00 Int)) (!
  (fun01%stateless x@2@00 i@3@00)
  :pattern ((fun01%limited s@$ x@2@00 i@3@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01a ----------
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
; inhale acc(x.f, write)
(declare-const $t@2@01 Int)
(assert (not (= x@1@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int :: { fun01(x, i) } bar01(i) > 0)
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (forall i: Int :: { fun01(x, i) } bar01(i) > 0)
(declare-const i@4@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] bar01(i) > 0
; [eval] bar01(i)
(push) ; 4
(assert (bar01%precondition $Snap.unit i@4@01))
(pop) ; 4
; Joined path conditions
(assert (bar01%precondition $Snap.unit i@4@01))
; [eval] fun01(x, i)
(push) ; 4
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@2@01) x@1@01 i@4@01))
(pop) ; 4
; Joined path conditions
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@2@01) x@1@01 i@4@01))
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@2@01) x@1@01 i@4@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@4@01 Int)) (!
  (and
    (bar01%precondition $Snap.unit i@4@01)
    (fun01%precondition ($SortWrappers.IntTo$Snap $t@2@01) x@1@01 i@4@01))
  :pattern ((fun01 ($SortWrappers.IntTo$Snap $t@2@01) x@1@01 i@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@14@10@14@53-aux|)))
(assert (forall ((i@4@01 Int)) (!
  (> (bar01 $Snap.unit i@4@01) 0)
  :pattern ((fun01 ($SortWrappers.IntTo$Snap $t@2@01) x@1@01 i@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@14@10@14@53|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(x.f, write)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@5@01 Int)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale fun01(x, 5)
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] fun01(x, 5)
(set-option :timeout 0)
(push) ; 3
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@5@01) x@1@01 5))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@5@01) x@1@01 5))
(assert (fun01 ($SortWrappers.IntTo$Snap $t@5@01) x@1@01 5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert bar01(5) > 0
; [eval] bar01(5) > 0
; [eval] bar01(5)
(set-option :timeout 0)
(push) ; 3
(assert (bar01%precondition $Snap.unit 5))
(pop) ; 3
; Joined path conditions
(assert (bar01%precondition $Snap.unit 5))
(push) ; 3
(assert (not (> (bar01 $Snap.unit 5) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (bar01 $Snap.unit 5) 0))
(pop) ; 2
(pop) ; 1
; ---------- test01b ----------
(declare-const x@7@01 $Ref)
(declare-const y@8@01 $Ref)
(declare-const x@9@01 $Ref)
(declare-const y@10@01 $Ref)
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
; inhale acc(x.f, write) && acc(y.f, write)
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(assert (not (= x@9@01 $Ref.null)))
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@9@01 y@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@10@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x != y
; [eval] x != y
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= x@9@01 y@10@01))))
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
(assert (not (= y@10@01 x@9@01)))
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
    ($SortWrappers.$SnapToInt ($Snap.first $t@11@01))
    ($SortWrappers.$SnapToInt ($Snap.second $t@11@01))))))
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
    ($SortWrappers.$SnapToInt ($Snap.second $t@11@01))
    ($SortWrappers.$SnapToInt ($Snap.first $t@11@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= x@9@01 y@10@01)) (not (= y@10@01 x@9@01))))
; [eval] x != y
; [exec]
; inhale (forall i: Int :: { fun01(x, i) } bar01(i) > 0)
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] (forall i: Int :: { fun01(x, i) } bar01(i) > 0)
(declare-const i@13@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] bar01(i) > 0
; [eval] bar01(i)
(push) ; 4
(assert (bar01%precondition $Snap.unit i@13@01))
(pop) ; 4
; Joined path conditions
(assert (bar01%precondition $Snap.unit i@13@01))
; [eval] fun01(x, i)
(push) ; 4
(assert (fun01%precondition ($Snap.first $t@11@01) x@9@01 i@13@01))
(pop) ; 4
; Joined path conditions
(assert (fun01%precondition ($Snap.first $t@11@01) x@9@01 i@13@01))
(assert (fun01%precondition ($Snap.first $t@11@01) x@9@01 i@13@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@13@01 Int)) (!
  (and
    (bar01%precondition $Snap.unit i@13@01)
    (fun01%precondition ($Snap.first $t@11@01) x@9@01 i@13@01))
  :pattern ((fun01 ($Snap.first $t@11@01) x@9@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@30@10@30@53-aux|)))
(assert (forall ((i@13@01 Int)) (!
  (> (bar01 $Snap.unit i@13@01) 0)
  :pattern ((fun01 ($Snap.first $t@11@01) x@9@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@30@10@30@53|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(y.f, write)
; [exec]
; inhale acc(y.f, write)
(declare-const $t@14@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@9@01 y@10@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun01(x, 5)
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] fun01(x, 5)
(set-option :timeout 0)
(push) ; 3
(assert (fun01%precondition ($Snap.first $t@11@01) x@9@01 5))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($Snap.first $t@11@01) x@9@01 5))
(assert (fun01 ($Snap.first $t@11@01) x@9@01 5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert bar01(5) > 0
; [eval] bar01(5) > 0
; [eval] bar01(5)
(set-option :timeout 0)
(push) ; 3
(assert (bar01%precondition $Snap.unit 5))
(pop) ; 3
; Joined path conditions
(assert (bar01%precondition $Snap.unit 5))
(push) ; 3
(assert (not (> (bar01 $Snap.unit 5) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (bar01 $Snap.unit 5) 0))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@16@01 $Ref)
(declare-const x@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (not (= x@17@01 $Ref.null)))
(assert (= ($Snap.second $t@18@01) $Snap.unit))
; [eval] (forall i: Int :: { fun01(x, i) } bar01(i) > 0)
(declare-const i@19@01 Int)
(push) ; 2
; [eval] bar01(i) > 0
; [eval] bar01(i)
(push) ; 3
(assert (bar01%precondition $Snap.unit i@19@01))
(pop) ; 3
; Joined path conditions
(assert (bar01%precondition $Snap.unit i@19@01))
; [eval] fun01(x, i)
(push) ; 3
(assert (fun01%precondition ($Snap.first $t@18@01) x@17@01 i@19@01))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($Snap.first $t@18@01) x@17@01 i@19@01))
(assert (fun01%precondition ($Snap.first $t@18@01) x@17@01 i@19@01))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@19@01 Int)) (!
  (and
    (bar01%precondition $Snap.unit i@19@01)
    (fun01%precondition ($Snap.first $t@18@01) x@17@01 i@19@01))
  :pattern ((fun01 ($Snap.first $t@18@01) x@17@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@41@12@41@55-aux|)))
(assert (forall ((i@19@01 Int)) (!
  (> (bar01 $Snap.unit i@19@01) 0)
  :pattern ((fun01 ($Snap.first $t@18@01) x@17@01 i@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@41@12@41@55|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale acc(x.f, write)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@20@01 Int)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale old(fun01(x, 5))
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 $Snap.unit))
; [eval] old(fun01(x, 5))
; [eval] fun01(x, 5)
(set-option :timeout 0)
(push) ; 3
(assert (fun01%precondition ($Snap.first $t@18@01) x@17@01 5))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($Snap.first $t@18@01) x@17@01 5))
(assert (fun01 ($Snap.first $t@18@01) x@17@01 5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert old(bar01(5)) > 0
; [eval] old(bar01(5)) > 0
; [eval] old(bar01(5))
; [eval] bar01(5)
(set-option :timeout 0)
(push) ; 3
(assert (bar01%precondition $Snap.unit 5))
(pop) ; 3
; Joined path conditions
(assert (bar01%precondition $Snap.unit 5))
(push) ; 3
(assert (not (> (bar01 $Snap.unit 5) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (bar01 $Snap.unit 5) 0))
(pop) ; 2
(pop) ; 1
; ---------- test03a ----------
(declare-const x@22@01 $Ref)
(declare-const x@23@01 $Ref)
(push) ; 1
(declare-const $t@24@01 Int)
(assert (not (= x@23@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall i: Int :: { old(fun01(x, i)) } bar01(i) > 0)
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] (forall i: Int :: { old(fun01(x, i)) } bar01(i) > 0)
(declare-const i@26@01 Int)
(push) ; 3
; [eval] bar01(i) > 0
; [eval] bar01(i)
(push) ; 4
(assert (bar01%precondition $Snap.unit i@26@01))
(pop) ; 4
; Joined path conditions
(assert (bar01%precondition $Snap.unit i@26@01))
; [eval] old(fun01(x, i))
; [eval] fun01(x, i)
(push) ; 4
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 i@26@01))
(pop) ; 4
; Joined path conditions
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 i@26@01))
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 i@26@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int)) (!
  (and
    (bar01%precondition $Snap.unit i@26@01)
    (fun01%precondition ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 i@26@01))
  :pattern ((fun01 ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@53@10@53@58-aux|)))
(assert (forall ((i@26@01 Int)) (!
  (> (bar01 $Snap.unit i@26@01) 0)
  :pattern ((fun01 ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@53@10@53@58|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale old(fun01(x, 5))
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] old(fun01(x, 5))
; [eval] fun01(x, 5)
(set-option :timeout 0)
(push) ; 3
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 5))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 5))
(assert (fun01 ($SortWrappers.IntTo$Snap $t@24@01) x@23@01 5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert old(bar01(5)) > 0
; [eval] old(bar01(5)) > 0
; [eval] old(bar01(5))
; [eval] bar01(5)
(set-option :timeout 0)
(push) ; 3
(assert (bar01%precondition $Snap.unit 5))
(pop) ; 3
; Joined path conditions
(assert (bar01%precondition $Snap.unit 5))
(push) ; 3
(assert (not (> (bar01 $Snap.unit 5) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (bar01 $Snap.unit 5) 0))
(pop) ; 2
(pop) ; 1
; ---------- test03b ----------
(declare-const x@28@01 $Ref)
(declare-const y@29@01 $Ref)
(declare-const x@30@01 $Ref)
(declare-const y@31@01 $Ref)
(push) ; 1
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(assert (not (= x@30@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@30@01 y@31@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@31@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall i: Int :: { old(fun01(x, i)) } bar01(i) > 0)
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 $Snap.unit))
; [eval] (forall i: Int :: { old(fun01(x, i)) } bar01(i) > 0)
(declare-const i@34@01 Int)
(push) ; 3
; [eval] bar01(i) > 0
; [eval] bar01(i)
(push) ; 4
(assert (bar01%precondition $Snap.unit i@34@01))
(pop) ; 4
; Joined path conditions
(assert (bar01%precondition $Snap.unit i@34@01))
; [eval] old(fun01(x, i))
; [eval] fun01(x, i)
(push) ; 4
(assert (fun01%precondition ($Snap.first $t@32@01) x@30@01 i@34@01))
(pop) ; 4
; Joined path conditions
(assert (fun01%precondition ($Snap.first $t@32@01) x@30@01 i@34@01))
(assert (fun01%precondition ($Snap.first $t@32@01) x@30@01 i@34@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@34@01 Int)) (!
  (and
    (bar01%precondition $Snap.unit i@34@01)
    (fun01%precondition ($Snap.first $t@32@01) x@30@01 i@34@01))
  :pattern ((fun01 ($Snap.first $t@32@01) x@30@01 i@34@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@62@10@62@58-aux|)))
(assert (forall ((i@34@01 Int)) (!
  (> (bar01 $Snap.unit i@34@01) 0)
  :pattern ((fun01 ($Snap.first $t@32@01) x@30@01 i@34@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@62@10@62@58|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(y.f, write)
; [exec]
; inhale acc(y.f, write)
(declare-const $t@35@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@30@01 y@31@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun01(x, 5)
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] fun01(x, 5)
(set-option :timeout 0)
(push) ; 3
(assert (fun01%precondition ($Snap.first $t@32@01) x@30@01 5))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($Snap.first $t@32@01) x@30@01 5))
(assert (fun01 ($Snap.first $t@32@01) x@30@01 5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert bar01(5) > 0
; [eval] bar01(5) > 0
; [eval] bar01(5)
(set-option :timeout 0)
(push) ; 3
(assert (bar01%precondition $Snap.unit 5))
(pop) ; 3
; Joined path conditions
(assert (bar01%precondition $Snap.unit 5))
(push) ; 3
(assert (not (> (bar01 $Snap.unit 5) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (bar01 $Snap.unit 5) 0))
(pop) ; 2
(pop) ; 1
; ---------- test03c ----------
(declare-const x@37@01 $Ref)
(declare-const y@38@01 $Ref)
(declare-const x@39@01 $Ref)
(declare-const y@40@01 $Ref)
(push) ; 1
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 ($Snap.combine ($Snap.first $t@41@01) ($Snap.second $t@41@01))))
(assert (not (= x@39@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= x@39@01 y@40@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@40@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall i: Int :: { old(fun01(x, i)) } bar01(i) > 0)
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [eval] (forall i: Int :: { old(fun01(x, i)) } bar01(i) > 0)
(declare-const i@43@01 Int)
(push) ; 3
; [eval] bar01(i) > 0
; [eval] bar01(i)
(push) ; 4
(assert (bar01%precondition $Snap.unit i@43@01))
(pop) ; 4
; Joined path conditions
(assert (bar01%precondition $Snap.unit i@43@01))
; [eval] old(fun01(x, i))
; [eval] fun01(x, i)
(push) ; 4
(assert (fun01%precondition ($Snap.first $t@41@01) x@39@01 i@43@01))
(pop) ; 4
; Joined path conditions
(assert (fun01%precondition ($Snap.first $t@41@01) x@39@01 i@43@01))
(assert (fun01%precondition ($Snap.first $t@41@01) x@39@01 i@43@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@43@01 Int)) (!
  (and
    (bar01%precondition $Snap.unit i@43@01)
    (fun01%precondition ($Snap.first $t@41@01) x@39@01 i@43@01))
  :pattern ((fun01 ($Snap.first $t@41@01) x@39@01 i@43@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@74@10@74@58-aux|)))
(assert (forall ((i@43@01 Int)) (!
  (> (bar01 $Snap.unit i@43@01) 0)
  :pattern ((fun01 ($Snap.first $t@41@01) x@39@01 i@43@01))
  :qid |prog./silicon/silver/src/test/resources/all/functions/heap_dependent_triggers.vpr@74@10@74@58|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale acc(x.f, write)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@44@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@40@01 x@39@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale fun01(x, 5)
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 $Snap.unit))
; [eval] fun01(x, 5)
(set-option :timeout 0)
(push) ; 3
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@44@01) x@39@01 5))
(pop) ; 3
; Joined path conditions
(assert (fun01%precondition ($SortWrappers.IntTo$Snap $t@44@01) x@39@01 5))
(assert (fun01 ($SortWrappers.IntTo$Snap $t@44@01) x@39@01 5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert bar01(5) > 0
; [eval] bar01(5) > 0
; [eval] bar01(5)
(set-option :timeout 0)
(push) ; 3
(assert (bar01%precondition $Snap.unit 5))
(pop) ; 3
; Joined path conditions
(assert (bar01%precondition $Snap.unit 5))
(push) ; 3
(assert (not (> (bar01 $Snap.unit 5) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> (bar01 $Snap.unit 5) 0))
(pop) ; 2
(pop) ; 1
