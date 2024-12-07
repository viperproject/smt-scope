(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:02:44
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0189.vpr
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
(declare-fun otherDummy ($Snap Int) Bool)
(declare-fun otherDummy%limited ($Snap Int) Bool)
(declare-fun otherDummy%stateless (Int) Bool)
(declare-fun otherDummy%precondition ($Snap Int) Bool)
(declare-fun thirdDummy ($Snap Int) Bool)
(declare-fun thirdDummy%limited ($Snap Int) Bool)
(declare-fun thirdDummy%stateless (Int) Bool)
(declare-fun thirdDummy%precondition ($Snap Int) Bool)
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
  (= (otherDummy%limited s@$ i@0@00) (otherDummy s@$ i@0@00))
  :pattern ((otherDummy s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (otherDummy%stateless i@0@00)
  :pattern ((otherDummy%limited s@$ i@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (= (thirdDummy%limited s@$ i@2@00) (thirdDummy s@$ i@2@00))
  :pattern ((thirdDummy s@$ i@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (thirdDummy%stateless i@2@00)
  :pattern ((thirdDummy%limited s@$ i@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- shouldNotTrigger ----------
(declare-const b@0@01 Bool)
(declare-const b@1@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (exists i: Int :: { thirdDummy(i) } !(i > 0 ==> otherDummy(i))) ==> !b
; [eval] (exists i: Int :: { thirdDummy(i) } !(i > 0 ==> otherDummy(i)))
(declare-const i@3@01 Int)
(push) ; 2
; [eval] !(i > 0 ==> otherDummy(i))
; [eval] i > 0 ==> otherDummy(i)
; [eval] i > 0
(push) ; 3
; [then-branch: 0 | i@3@01 > 0 | live]
; [else-branch: 0 | !(i@3@01 > 0) | live]
(push) ; 4
; [then-branch: 0 | i@3@01 > 0]
(assert (> i@3@01 0))
; [eval] otherDummy(i)
(push) ; 5
(assert (otherDummy%precondition $Snap.unit i@3@01))
(pop) ; 5
; Joined path conditions
(assert (otherDummy%precondition $Snap.unit i@3@01))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(i@3@01 > 0)]
(assert (not (> i@3@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> (> i@3@01 0) (and (> i@3@01 0) (otherDummy%precondition $Snap.unit i@3@01))))
; Joined path conditions
(assert (or (not (> i@3@01 0)) (> i@3@01 0)))
; [eval] thirdDummy(i)
(push) ; 3
(assert (thirdDummy%precondition $Snap.unit i@3@01))
(pop) ; 3
; Joined path conditions
(assert (thirdDummy%precondition $Snap.unit i@3@01))
(assert (thirdDummy%precondition $Snap.unit i@3@01))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((i@3@01 Int)) (!
  (and
    (=>
      (> i@3@01 0)
      (and (> i@3@01 0) (otherDummy%precondition $Snap.unit i@3@01)))
    (or (not (> i@3@01 0)) (> i@3@01 0))
    (thirdDummy%precondition $Snap.unit i@3@01))
  :pattern ((thirdDummy $Snap.unit i@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75-aux|)))
(assert (forall ((i@3@01 Int)) (!
  (=> (> i@3@01 0) (otherDummy%precondition $Snap.unit i@3@01))
  :pattern ((thirdDummy $Snap.unit i@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75|)))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (exists ((i@3@01 Int)) (!
    (not (=> (> i@3@01 0) (otherDummy $Snap.unit i@3@01)))
    :pattern ((thirdDummy $Snap.unit i@3@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75|)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (exists ((i@3@01 Int)) (!
  (not (=> (> i@3@01 0) (otherDummy $Snap.unit i@3@01)))
  :pattern ((thirdDummy $Snap.unit i@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | QE i@3@01 :: !(i@3@01 > 0 ==> otherDummy(_, i@3@01)) | live]
; [else-branch: 1 | !(QE i@3@01 :: !(i@3@01 > 0 ==> otherDummy(_, i@3@01))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | QE i@3@01 :: !(i@3@01 > 0 ==> otherDummy(_, i@3@01))]
(assert (exists ((i@3@01 Int)) (!
  (not (=> (> i@3@01 0) (otherDummy $Snap.unit i@3@01)))
  :pattern ((thirdDummy $Snap.unit i@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75|)))
; [eval] !b
(pop) ; 3
(push) ; 3
; [else-branch: 1 | !(QE i@3@01 :: !(i@3@01 > 0 ==> otherDummy(_, i@3@01)))]
(assert (not
  (exists ((i@3@01 Int)) (!
    (not (=> (> i@3@01 0) (otherDummy $Snap.unit i@3@01)))
    :pattern ((thirdDummy $Snap.unit i@3@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75|))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (exists ((i@3@01 Int)) (!
      (not (=> (> i@3@01 0) (otherDummy $Snap.unit i@3@01)))
      :pattern ((thirdDummy $Snap.unit i@3@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75|)))
  (exists ((i@3@01 Int)) (!
    (not (=> (> i@3@01 0) (otherDummy $Snap.unit i@3@01)))
    :pattern ((thirdDummy $Snap.unit i@3@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75|))))
(assert (=>
  (exists ((i@3@01 Int)) (!
    (not (=> (> i@3@01 0) (otherDummy $Snap.unit i@3@01)))
    :pattern ((thirdDummy $Snap.unit i@3@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@6@15@6@75|))
  (not b@1@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@1@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | b@1@01 | live]
; [else-branch: 2 | !(b@1@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | b@1@01]
(assert b@1@01)
; [exec]
; assert otherDummy(5)
; [eval] otherDummy(5)
(push) ; 4
(assert (otherDummy%precondition $Snap.unit 5))
(pop) ; 4
; Joined path conditions
(assert (otherDummy%precondition $Snap.unit 5))
(push) ; 4
(assert (not (otherDummy $Snap.unit 5)))
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
; [eval] otherDummy(5)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (otherDummy $Snap.unit 5)))
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
; [eval] otherDummy(5)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (otherDummy $Snap.unit 5)))
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
; [eval] otherDummy(5)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (otherDummy $Snap.unit 5)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- shouldTrigger ----------
(declare-const b@4@01 Bool)
(declare-const b@5@01 Bool)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (exists i: Int :: { otherDummy(i) } !(i > 0 ==> otherDummy(i))) ==> !b
; [eval] (exists i: Int :: { otherDummy(i) } !(i > 0 ==> otherDummy(i)))
(declare-const i@7@01 Int)
(push) ; 2
; [eval] !(i > 0 ==> otherDummy(i))
; [eval] i > 0 ==> otherDummy(i)
; [eval] i > 0
(push) ; 3
; [then-branch: 3 | i@7@01 > 0 | live]
; [else-branch: 3 | !(i@7@01 > 0) | live]
(push) ; 4
; [then-branch: 3 | i@7@01 > 0]
(assert (> i@7@01 0))
; [eval] otherDummy(i)
(push) ; 5
(assert (otherDummy%precondition $Snap.unit i@7@01))
(pop) ; 5
; Joined path conditions
(assert (otherDummy%precondition $Snap.unit i@7@01))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(i@7@01 > 0)]
(assert (not (> i@7@01 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> (> i@7@01 0) (and (> i@7@01 0) (otherDummy%precondition $Snap.unit i@7@01))))
; Joined path conditions
(assert (or (not (> i@7@01 0)) (> i@7@01 0)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((i@7@01 Int)) (!
  (and
    (=>
      (> i@7@01 0)
      (and (> i@7@01 0) (otherDummy%precondition $Snap.unit i@7@01)))
    (or (not (> i@7@01 0)) (> i@7@01 0)))
  :pattern ((otherDummy%limited $Snap.unit i@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75-aux|)))
(assert (forall ((i@7@01 Int)) (!
  (=> (> i@7@01 0) (otherDummy%precondition $Snap.unit i@7@01))
  :pattern ((otherDummy%limited $Snap.unit i@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75|)))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (exists ((i@7@01 Int)) (!
    (not (=> (> i@7@01 0) (otherDummy $Snap.unit i@7@01)))
    :pattern ((otherDummy%limited $Snap.unit i@7@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75|)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (exists ((i@7@01 Int)) (!
  (not (=> (> i@7@01 0) (otherDummy $Snap.unit i@7@01)))
  :pattern ((otherDummy%limited $Snap.unit i@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | QE i@7@01 :: !(i@7@01 > 0 ==> otherDummy(_, i@7@01)) | live]
; [else-branch: 4 | !(QE i@7@01 :: !(i@7@01 > 0 ==> otherDummy(_, i@7@01))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | QE i@7@01 :: !(i@7@01 > 0 ==> otherDummy(_, i@7@01))]
(assert (exists ((i@7@01 Int)) (!
  (not (=> (> i@7@01 0) (otherDummy $Snap.unit i@7@01)))
  :pattern ((otherDummy%limited $Snap.unit i@7@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75|)))
; [eval] !b
(pop) ; 3
(push) ; 3
; [else-branch: 4 | !(QE i@7@01 :: !(i@7@01 > 0 ==> otherDummy(_, i@7@01)))]
(assert (not
  (exists ((i@7@01 Int)) (!
    (not (=> (> i@7@01 0) (otherDummy $Snap.unit i@7@01)))
    :pattern ((otherDummy%limited $Snap.unit i@7@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75|))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (exists ((i@7@01 Int)) (!
      (not (=> (> i@7@01 0) (otherDummy $Snap.unit i@7@01)))
      :pattern ((otherDummy%limited $Snap.unit i@7@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75|)))
  (exists ((i@7@01 Int)) (!
    (not (=> (> i@7@01 0) (otherDummy $Snap.unit i@7@01)))
    :pattern ((otherDummy%limited $Snap.unit i@7@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75|))))
(assert (=>
  (exists ((i@7@01 Int)) (!
    (not (=> (> i@7@01 0) (otherDummy $Snap.unit i@7@01)))
    :pattern ((otherDummy%limited $Snap.unit i@7@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0189.vpr@15@15@15@75|))
  (not b@5@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@5@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | b@5@01 | live]
; [else-branch: 5 | !(b@5@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | b@5@01]
(assert b@5@01)
; [exec]
; assert otherDummy(5)
; [eval] otherDummy(5)
(push) ; 4
(assert (otherDummy%precondition $Snap.unit 5))
(pop) ; 4
; Joined path conditions
(assert (otherDummy%precondition $Snap.unit 5))
(push) ; 4
(assert (not (otherDummy $Snap.unit 5)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (otherDummy $Snap.unit 5))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | !(b@5@01)]
(assert (not b@5@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@5@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(b@5@01) | live]
; [else-branch: 6 | b@5@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | !(b@5@01)]
(assert (not b@5@01))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | b@5@01]
(assert b@5@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
