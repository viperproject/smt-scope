(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:37
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0567.vpr
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
(declare-fun id ($Snap Int) Int)
(declare-fun id%limited ($Snap Int) Int)
(declare-fun id%stateless (Int) Bool)
(declare-fun id%precondition ($Snap Int) Bool)
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
  (= (id%limited s@$ i@0@00) (id s@$ i@0@00))
  :pattern ((id s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (id%stateless i@0@00)
  :pattern ((id%limited s@$ i@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (=> (id%precondition s@$ i@0@00) (= (id s@$ i@0@00) i@0@00))
  :pattern ((id s@$ i@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  true
  :pattern ((id s@$ i@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const i@0@01 Int)
(declare-const i@1@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (forall y: Int :: { id(y) } id(y) == i)
(declare-const y@3@01 Int)
(push) ; 2
; [eval] id(y) == i
; [eval] id(y)
(push) ; 3
(assert (id%precondition $Snap.unit y@3@01))
(pop) ; 3
; Joined path conditions
(assert (id%precondition $Snap.unit y@3@01))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@3@01 Int)) (!
  (id%precondition $Snap.unit y@3@01)
  :pattern ((id%limited $Snap.unit y@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@7@12@7@47-aux|)))
(assert (forall ((y@3@01 Int)) (!
  (= (id $Snap.unit y@3@01) i@1@01)
  :pattern ((id%limited $Snap.unit y@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@7@12@7@47|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] id(0) == 0
; [eval] id(0)
(push) ; 3
(assert (id%precondition $Snap.unit 0))
(pop) ; 3
; Joined path conditions
(assert (id%precondition $Snap.unit 0))
(assert (= (id $Snap.unit 0) 0))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] id(1) == 1
; [eval] id(1)
(push) ; 3
(assert (id%precondition $Snap.unit 1))
(pop) ; 3
; Joined path conditions
(assert (id%precondition $Snap.unit 1))
(assert (= (id $Snap.unit 1) 1))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
; [eval] id(0) == 0
; [eval] id(0)
(push) ; 3
(assert (id%precondition $Snap.unit 0))
(pop) ; 3
; Joined path conditions
(assert (id%precondition $Snap.unit 0))
(push) ; 3
(assert (not (= (id $Snap.unit 0) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (id $Snap.unit 0) 0))
; [eval] id(1) == 1
; [eval] id(1)
(push) ; 3
(assert (id%precondition $Snap.unit 1))
(pop) ; 3
; Joined path conditions
(assert (id%precondition $Snap.unit 1))
(push) ; 3
(assert (not (= (id $Snap.unit 1) 1)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (id $Snap.unit 1) 1))
(push) ; 3
(assert (not false))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert false)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const i@5@01 Int)
(declare-const i@6@01 Int)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
; [eval] (forall y: Int :: { id(y) } id(y) == i)
(declare-const y@8@01 Int)
(push) ; 2
; [eval] id(y) == i
; [eval] id(y)
(push) ; 3
(assert (id%precondition $Snap.unit y@8@01))
(pop) ; 3
; Joined path conditions
(assert (id%precondition $Snap.unit y@8@01))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@8@01 Int)) (!
  (id%precondition $Snap.unit y@8@01)
  :pattern ((id%limited $Snap.unit y@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@13@12@13@47-aux|)))
(assert (forall ((y@8@01 Int)) (!
  (= (id $Snap.unit y@8@01) i@6@01)
  :pattern ((id%limited $Snap.unit y@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@13@12@13@47|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] (forall y: Int :: { id(y) } id(y) == y && id(y) == i)
(declare-const y@10@01 Int)
(push) ; 3
; [eval] id(y) == y && id(y) == i
; [eval] id(y) == y
; [eval] id(y)
(push) ; 4
(assert (id%precondition $Snap.unit y@10@01))
(pop) ; 4
; Joined path conditions
(assert (id%precondition $Snap.unit y@10@01))
(push) ; 4
; [then-branch: 0 | id(_, y@10@01) != y@10@01 | live]
; [else-branch: 0 | id(_, y@10@01) == y@10@01 | live]
(push) ; 5
; [then-branch: 0 | id(_, y@10@01) != y@10@01]
(assert (not (= (id $Snap.unit y@10@01) y@10@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | id(_, y@10@01) == y@10@01]
(assert (= (id $Snap.unit y@10@01) y@10@01))
; [eval] id(y) == i
; [eval] id(y)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (= (id $Snap.unit y@10@01) y@10@01)
  (not (= (id $Snap.unit y@10@01) y@10@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@10@01 Int)) (!
  (and
    (id%precondition $Snap.unit y@10@01)
    (or
      (= (id $Snap.unit y@10@01) y@10@01)
      (not (= (id $Snap.unit y@10@01) y@10@01))))
  :pattern ((id%limited $Snap.unit y@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@15@12@15@61-aux|)))
(assert (forall ((y@10@01 Int)) (!
  (and (= (id $Snap.unit y@10@01) y@10@01) (= (id $Snap.unit y@10@01) i@6@01))
  :pattern ((id%limited $Snap.unit y@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@15@12@15@61|)))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] (forall y: Int :: { id(y) } id(y) == y && y == i)
(declare-const y@11@01 Int)
(push) ; 3
; [eval] id(y) == y && y == i
; [eval] id(y) == y
; [eval] id(y)
(push) ; 4
(assert (id%precondition $Snap.unit y@11@01))
(pop) ; 4
; Joined path conditions
(assert (id%precondition $Snap.unit y@11@01))
(push) ; 4
; [then-branch: 1 | id(_, y@11@01) != y@11@01 | live]
; [else-branch: 1 | id(_, y@11@01) == y@11@01 | live]
(push) ; 5
; [then-branch: 1 | id(_, y@11@01) != y@11@01]
(assert (not (= (id $Snap.unit y@11@01) y@11@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | id(_, y@11@01) == y@11@01]
(assert (= (id $Snap.unit y@11@01) y@11@01))
; [eval] y == i
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (= (id $Snap.unit y@11@01) y@11@01)
  (not (= (id $Snap.unit y@11@01) y@11@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@11@01 Int)) (!
  (and
    (id%precondition $Snap.unit y@11@01)
    (or
      (= (id $Snap.unit y@11@01) y@11@01)
      (not (= (id $Snap.unit y@11@01) y@11@01))))
  :pattern ((id%limited $Snap.unit y@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@16@12@16@57-aux|)))
(assert (forall ((y@11@01 Int)) (!
  (and (= (id $Snap.unit y@11@01) y@11@01) (= y@11@01 i@6@01))
  :pattern ((id%limited $Snap.unit y@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@16@12@16@57|)))
(pop) ; 2
(push) ; 2
; [eval] (forall y: Int :: { id(y) } id(y) == y && id(y) == i)
(declare-const y@12@01 Int)
(push) ; 3
; [eval] id(y) == y && id(y) == i
; [eval] id(y) == y
; [eval] id(y)
(push) ; 4
(assert (id%precondition $Snap.unit y@12@01))
(pop) ; 4
; Joined path conditions
(assert (id%precondition $Snap.unit y@12@01))
(push) ; 4
; [then-branch: 2 | id(_, y@12@01) != y@12@01 | live]
; [else-branch: 2 | id(_, y@12@01) == y@12@01 | live]
(push) ; 5
; [then-branch: 2 | id(_, y@12@01) != y@12@01]
(assert (not (= (id $Snap.unit y@12@01) y@12@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | id(_, y@12@01) == y@12@01]
(assert (= (id $Snap.unit y@12@01) y@12@01))
; [eval] id(y) == i
; [eval] id(y)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (= (id $Snap.unit y@12@01) y@12@01)
  (not (= (id $Snap.unit y@12@01) y@12@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@12@01 Int)) (!
  (and
    (id%precondition $Snap.unit y@12@01)
    (or
      (= (id $Snap.unit y@12@01) y@12@01)
      (not (= (id $Snap.unit y@12@01) y@12@01))))
  :pattern ((id%limited $Snap.unit y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@15@12@15@61-aux|)))
(assert (forall ((y@12@01 Int)) (!
  (and
    (id%precondition $Snap.unit y@12@01)
    (=> (= (id $Snap.unit y@12@01) y@12@01) (id%precondition $Snap.unit y@12@01)))
  :pattern ((id%limited $Snap.unit y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@15@12@15@61_precondition|)))
(push) ; 3
(assert (not (forall ((y@12@01 Int)) (!
  (=>
    (and
      (id%precondition $Snap.unit y@12@01)
      (=>
        (= (id $Snap.unit y@12@01) y@12@01)
        (id%precondition $Snap.unit y@12@01)))
    (and (= (id $Snap.unit y@12@01) y@12@01) (= (id $Snap.unit y@12@01) i@6@01)))
  :pattern ((id%limited $Snap.unit y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@15@12@15@61|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((y@12@01 Int)) (!
  (and (= (id $Snap.unit y@12@01) y@12@01) (= (id $Snap.unit y@12@01) i@6@01))
  :pattern ((id%limited $Snap.unit y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@15@12@15@61|)))
; [eval] (forall y: Int :: { id(y) } id(y) == y && y == i)
(declare-const y@13@01 Int)
(push) ; 3
; [eval] id(y) == y && y == i
; [eval] id(y) == y
; [eval] id(y)
(push) ; 4
(assert (id%precondition $Snap.unit y@13@01))
(pop) ; 4
; Joined path conditions
(assert (id%precondition $Snap.unit y@13@01))
(push) ; 4
; [then-branch: 3 | id(_, y@13@01) != y@13@01 | live]
; [else-branch: 3 | id(_, y@13@01) == y@13@01 | live]
(push) ; 5
; [then-branch: 3 | id(_, y@13@01) != y@13@01]
(assert (not (= (id $Snap.unit y@13@01) y@13@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | id(_, y@13@01) == y@13@01]
(assert (= (id $Snap.unit y@13@01) y@13@01))
; [eval] y == i
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (= (id $Snap.unit y@13@01) y@13@01)
  (not (= (id $Snap.unit y@13@01) y@13@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@13@01 Int)) (!
  (and
    (id%precondition $Snap.unit y@13@01)
    (or
      (= (id $Snap.unit y@13@01) y@13@01)
      (not (= (id $Snap.unit y@13@01) y@13@01))))
  :pattern ((id%limited $Snap.unit y@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@16@12@16@57-aux|)))
(assert (forall ((y@13@01 Int)) (!
  (id%precondition $Snap.unit y@13@01)
  :pattern ((id%limited $Snap.unit y@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@16@12@16@57_precondition|)))
(push) ; 3
(assert (not (forall ((y@13@01 Int)) (!
  (=>
    (id%precondition $Snap.unit y@13@01)
    (and (= (id $Snap.unit y@13@01) y@13@01) (= y@13@01 i@6@01)))
  :pattern ((id%limited $Snap.unit y@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@16@12@16@57|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((y@13@01 Int)) (!
  (and (= (id $Snap.unit y@13@01) y@13@01) (= y@13@01 i@6@01))
  :pattern ((id%limited $Snap.unit y@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@16@12@16@57|)))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const i@14@01 Int)
(declare-const i@15@01 Int)
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
; inhale (forall y: Int :: { id(y) } id(y) == i)
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 $Snap.unit))
; [eval] (forall y: Int :: { id(y) } id(y) == i)
(declare-const y@17@01 Int)
(push) ; 3
; [eval] id(y) == i
; [eval] id(y)
(push) ; 4
(assert (id%precondition $Snap.unit y@17@01))
(pop) ; 4
; Joined path conditions
(assert (id%precondition $Snap.unit y@17@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@17@01 Int)) (!
  (id%precondition $Snap.unit y@17@01)
  :pattern ((id%limited $Snap.unit y@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@21@10@21@45-aux|)))
(assert (forall ((y@17@01 Int)) (!
  (= (id $Snap.unit y@17@01) i@15@01)
  :pattern ((id%limited $Snap.unit y@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@21@10@21@45|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall y: Int :: { id(y) } id(y) == y && y == i)
; [eval] (forall y: Int :: { id(y) } id(y) == y && y == i)
(declare-const y@18@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] id(y) == y && y == i
; [eval] id(y) == y
; [eval] id(y)
(push) ; 4
(assert (id%precondition $Snap.unit y@18@01))
(pop) ; 4
; Joined path conditions
(assert (id%precondition $Snap.unit y@18@01))
(push) ; 4
; [then-branch: 4 | id(_, y@18@01) != y@18@01 | live]
; [else-branch: 4 | id(_, y@18@01) == y@18@01 | live]
(push) ; 5
; [then-branch: 4 | id(_, y@18@01) != y@18@01]
(assert (not (= (id $Snap.unit y@18@01) y@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | id(_, y@18@01) == y@18@01]
(assert (= (id $Snap.unit y@18@01) y@18@01))
; [eval] y == i
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (= (id $Snap.unit y@18@01) y@18@01)
  (not (= (id $Snap.unit y@18@01) y@18@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@18@01 Int)) (!
  (and
    (id%precondition $Snap.unit y@18@01)
    (or
      (= (id $Snap.unit y@18@01) y@18@01)
      (not (= (id $Snap.unit y@18@01) y@18@01))))
  :pattern ((id%limited $Snap.unit y@18@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@22@10@22@55-aux|)))
(assert (forall ((y@18@01 Int)) (!
  (id%precondition $Snap.unit y@18@01)
  :pattern ((id%limited $Snap.unit y@18@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@22@10@22@55_precondition|)))
(push) ; 3
(assert (not (forall ((y@18@01 Int)) (!
  (=>
    (id%precondition $Snap.unit y@18@01)
    (and (= (id $Snap.unit y@18@01) y@18@01) (= y@18@01 i@15@01)))
  :pattern ((id%limited $Snap.unit y@18@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@22@10@22@55|))))
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
; [eval] (forall y: Int :: { id(y) } id(y) == y && y == i)
(declare-const y@19@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] id(y) == y && y == i
; [eval] id(y) == y
; [eval] id(y)
(push) ; 4
(assert (id%precondition $Snap.unit y@19@01))
(pop) ; 4
; Joined path conditions
(assert (id%precondition $Snap.unit y@19@01))
(push) ; 4
; [then-branch: 5 | id(_, y@19@01) != y@19@01 | live]
; [else-branch: 5 | id(_, y@19@01) == y@19@01 | live]
(push) ; 5
; [then-branch: 5 | id(_, y@19@01) != y@19@01]
(assert (not (= (id $Snap.unit y@19@01) y@19@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 5 | id(_, y@19@01) == y@19@01]
(assert (= (id $Snap.unit y@19@01) y@19@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] y == i
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (= (id $Snap.unit y@19@01) y@19@01)
  (not (= (id $Snap.unit y@19@01) y@19@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@19@01 Int)) (!
  (and
    (id%precondition $Snap.unit y@19@01)
    (or
      (= (id $Snap.unit y@19@01) y@19@01)
      (not (= (id $Snap.unit y@19@01) y@19@01))))
  :pattern ((id%limited $Snap.unit y@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@22@10@22@55-aux|)))
(assert (forall ((y@19@01 Int)) (!
  (id%precondition $Snap.unit y@19@01)
  :pattern ((id%limited $Snap.unit y@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@22@10@22@55_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((y@19@01 Int)) (!
  (=>
    (id%precondition $Snap.unit y@19@01)
    (and (= (id $Snap.unit y@19@01) y@19@01) (= y@19@01 i@15@01)))
  :pattern ((id%limited $Snap.unit y@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@22@10@22@55|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((y@19@01 Int)) (!
  (and (= (id $Snap.unit y@19@01) y@19@01) (= y@19@01 i@15@01))
  :pattern ((id%limited $Snap.unit y@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0567.vpr@22@10@22@55|)))
(pop) ; 2
(pop) ; 1
