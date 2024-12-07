(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:39
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0282.vpr
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
(declare-sort dummy 0)
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
(declare-fun $SortWrappers.dummyTo$Snap (dummy) $Snap)
(declare-fun $SortWrappers.$SnapTodummy ($Snap) dummy)
(assert (forall ((x dummy)) (!
    (= x ($SortWrappers.$SnapTodummy($SortWrappers.dummyTo$Snap x)))
    :pattern (($SortWrappers.dummyTo$Snap x))
    :qid |$Snap.$SnapTodummyTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.dummyTo$Snap($SortWrappers.$SnapTodummy x)))
    :pattern (($SortWrappers.$SnapTodummy x))
    :qid |$Snap.dummyTo$SnapTodummy|
    )))
; ////////// Symbols
(declare-fun foo<Bool> (Int Int) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun f1 ($Snap Int) Bool)
(declare-fun f1%limited ($Snap Int) Bool)
(declare-fun f1%stateless (Int) Bool)
(declare-fun f1%precondition ($Snap Int) Bool)
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
(assert (forall ((s@$ $Snap) (idx@0@00 Int)) (!
  (= (f1%limited s@$ idx@0@00) (f1 s@$ idx@0@00))
  :pattern ((f1 s@$ idx@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (idx@0@00 Int)) (!
  (f1%stateless idx@0@00)
  :pattern ((f1%limited s@$ idx@0@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m1 ----------
(declare-const j@0@01 Int)
(declare-const j@1@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] j == 0
(assert (= j@1@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (forall i: Int :: { foo(i, j) } foo(i, j))
(declare-const i@4@01 Int)
(push) ; 3
; [eval] foo(i, j)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@4@01 Int)) (!
  (foo<Bool> i@4@01 j@1@01)
  :pattern ((foo<Bool> i@4@01 j@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@10@11@10@49|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
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
; var i: Int
(declare-const i@5@01 Int)
; [exec]
; i := 0
; [exec]
; m1(i)
; [eval] j == 0
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forall i: Int :: { foo(i, j) } foo(i, j))
(declare-const i@7@01 Int)
(push) ; 3
; [eval] foo(i, j)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int)) (!
  (foo<Bool> i@7@01 0)
  :pattern ((foo<Bool> i@7@01 0))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@10@11@10@49|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert (forall j: Int :: { foo(j, j) } foo(j, j))
; [eval] (forall j: Int :: { foo(j, j) } foo(j, j))
(declare-const j@8@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] foo(j, j)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((j@8@01 Int)) (!
  (foo<Bool> j@8@01 j@8@01)
  :pattern ((foo<Bool> j@8@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@17@10@17@48|))))
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
; [eval] (forall j: Int :: { foo(j, j) } foo(j, j))
(declare-const j@9@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] foo(j, j)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((j@9@01 Int)) (!
  (foo<Bool> j@9@01 j@9@01)
  :pattern ((foo<Bool> j@9@01 j@9@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@17@10@17@48|))))
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
; [eval] (forall j: Int :: { foo(j, j) } foo(j, j))
(declare-const j@10@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] foo(j, j)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((j@10@01 Int)) (!
  (foo<Bool> j@10@01 j@10@01)
  :pattern ((foo<Bool> j@10@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@17@10@17@48|))))
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
; [eval] (forall j: Int :: { foo(j, j) } foo(j, j))
(declare-const j@11@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] foo(j, j)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((j@11@01 Int)) (!
  (foo<Bool> j@11@01 j@11@01)
  :pattern ((foo<Bool> j@11@01 j@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@17@10@17@48|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
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
; var i: Int
(declare-const i@12@01 Int)
; [exec]
; var b: Bool
(declare-const b@13@01 Bool)
; [exec]
; inhale (forall j: Int :: { foo(j, i) } 0 <= j && j < 10 ==> foo(j, i))
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] (forall j: Int :: { foo(j, i) } 0 <= j && j < 10 ==> foo(j, i))
(declare-const j@15@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 10 ==> foo(j, i)
; [eval] 0 <= j && j < 10
; [eval] 0 <= j
(push) ; 4
; [then-branch: 0 | !(0 <= j@15@01) | live]
; [else-branch: 0 | 0 <= j@15@01 | live]
(push) ; 5
; [then-branch: 0 | !(0 <= j@15@01)]
(assert (not (<= 0 j@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | 0 <= j@15@01]
(assert (<= 0 j@15@01))
; [eval] j < 10
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@15@01) (not (<= 0 j@15@01))))
(push) ; 4
; [then-branch: 1 | 0 <= j@15@01 && j@15@01 < 10 | live]
; [else-branch: 1 | !(0 <= j@15@01 && j@15@01 < 10) | live]
(push) ; 5
; [then-branch: 1 | 0 <= j@15@01 && j@15@01 < 10]
(assert (and (<= 0 j@15@01) (< j@15@01 10)))
; [eval] foo(j, i)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(0 <= j@15@01 && j@15@01 < 10)]
(assert (not (and (<= 0 j@15@01) (< j@15@01 10))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 j@15@01) (< j@15@01 10)))
  (and (<= 0 j@15@01) (< j@15@01 10))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@15@01 Int)) (!
  (and
    (or (<= 0 j@15@01) (not (<= 0 j@15@01)))
    (or
      (not (and (<= 0 j@15@01) (< j@15@01 10)))
      (and (<= 0 j@15@01) (< j@15@01 10))))
  :pattern ((foo<Bool> j@15@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@26@10@26@69-aux|)))
(assert (forall ((j@15@01 Int)) (!
  (=> (and (<= 0 j@15@01) (< j@15@01 10)) (foo<Bool> j@15@01 i@12@01))
  :pattern ((foo<Bool> j@15@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@26@10@26@69|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; b := f1(i)
; [eval] f1(i)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int ::0 <= i && i < 10 ==> foo(i, idx))
(declare-const i@16@01 Int)
(push) ; 4
; [eval] 0 <= i && i < 10 ==> foo(i, idx)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 5
; [then-branch: 2 | !(0 <= i@16@01) | live]
; [else-branch: 2 | 0 <= i@16@01 | live]
(push) ; 6
; [then-branch: 2 | !(0 <= i@16@01)]
(assert (not (<= 0 i@16@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | 0 <= i@16@01]
(assert (<= 0 i@16@01))
; [eval] i < 10
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@16@01) (not (<= 0 i@16@01))))
(push) ; 5
; [then-branch: 3 | 0 <= i@16@01 && i@16@01 < 10 | live]
; [else-branch: 3 | !(0 <= i@16@01 && i@16@01 < 10) | live]
(push) ; 6
; [then-branch: 3 | 0 <= i@16@01 && i@16@01 < 10]
(assert (and (<= 0 i@16@01) (< i@16@01 10)))
; [eval] foo(i, idx)
(pop) ; 6
(push) ; 6
; [else-branch: 3 | !(0 <= i@16@01 && i@16@01 < 10)]
(assert (not (and (<= 0 i@16@01) (< i@16@01 10))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@16@01) (< i@16@01 10)))
  (and (<= 0 i@16@01) (< i@16@01 10))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@16@01 Int)) (!
  (=> (and (<= 0 i@16@01) (< i@16@01 10)) (foo<Bool> i@16@01 i@12@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@21@12@21@75|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@16@01 Int)) (!
  (=> (and (<= 0 i@16@01) (< i@16@01 10)) (foo<Bool> i@16@01 i@12@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@21@12@21@75|)))
(assert (f1%precondition $Snap.unit i@12@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (forall ((i@16@01 Int)) (!
    (=> (and (<= 0 i@16@01) (< i@16@01 10)) (foo<Bool> i@16@01 i@12@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@21@12@21@75|))
  (f1%precondition $Snap.unit i@12@01)))
(declare-const b@17@01 Bool)
(assert (= b@17@01 (f1 $Snap.unit i@12@01)))
(pop) ; 2
(pop) ; 1
