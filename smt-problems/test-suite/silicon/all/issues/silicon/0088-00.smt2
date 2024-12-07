(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0088.vpr
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
(declare-fun fib ($Snap Int) Int)
(declare-fun fib%limited ($Snap Int) Int)
(declare-fun fib%stateless (Int) Bool)
(declare-fun fib%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (= (fib%limited s@$ n@0@00) (fib s@$ n@0@00))
  :pattern ((fib s@$ n@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (fib%stateless n@0@00)
  :pattern ((fib%limited s@$ n@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (let ((result@1@00 (fib%limited s@$ n@0@00))) (=>
    (fib%precondition s@$ n@0@00)
    (and (= (= result@1@00 0) (= n@0@00 0)) (>= result@1@00 0))))
  :pattern ((fib%limited s@$ n@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (let ((result@1@00 (fib%limited s@$ n@0@00))) true)
  :pattern ((fib%limited s@$ n@0@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (let ((result@1@00 (fib%limited s@$ n@0@00))) true)
  :pattern ((fib%limited s@$ n@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (=>
    (fib%precondition s@$ n@0@00)
    (=
      (fib s@$ n@0@00)
      (ite
        (<= n@0@00 1)
        n@0@00
        (+
          (fib%limited $Snap.unit (- n@0@00 1))
          (fib%limited $Snap.unit (- n@0@00 2))))))
  :pattern ((fib s@$ n@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (n@0@00 Int)) (!
  (=>
    (fib%precondition s@$ n@0@00)
    (ite
      (<= n@0@00 1)
      true
      (and
        (fib%precondition $Snap.unit (- n@0@00 1))
        (fib%precondition $Snap.unit (- n@0@00 2)))))
  :pattern ((fib s@$ n@0@00))
  :qid |quant-u-6|)))
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
; assert (forall n: Int :: { fib(n) } n >= 1 ==> fib(n) >= fib(n + 1))
; [eval] (forall n: Int :: { fib(n) } n >= 1 ==> fib(n) >= fib(n + 1))
(declare-const n@0@01 Int)
(push) ; 3
; [eval] n >= 1 ==> fib(n) >= fib(n + 1)
; [eval] n >= 1
(push) ; 4
; [then-branch: 0 | n@0@01 >= 1 | live]
; [else-branch: 0 | !(n@0@01 >= 1) | live]
(push) ; 5
; [then-branch: 0 | n@0@01 >= 1]
(assert (>= n@0@01 1))
; [eval] fib(n) >= fib(n + 1)
; [eval] fib(n)
(push) ; 6
; [eval] n >= 0
(push) ; 7
(assert (not (>= n@0@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= n@0@01 0))
(assert (fib%precondition $Snap.unit n@0@01))
(pop) ; 6
; Joined path conditions
(assert (and (>= n@0@01 0) (fib%precondition $Snap.unit n@0@01)))
; [eval] fib(n + 1)
; [eval] n + 1
(push) ; 6
; [eval] n >= 0
(push) ; 7
(assert (not (>= (+ n@0@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ n@0@01 1) 0))
(assert (fib%precondition $Snap.unit (+ n@0@01 1)))
(pop) ; 6
; Joined path conditions
(assert (and (>= (+ n@0@01 1) 0) (fib%precondition $Snap.unit (+ n@0@01 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(n@0@01 >= 1)]
(assert (not (>= n@0@01 1)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= n@0@01 1)
  (and
    (>= n@0@01 1)
    (>= n@0@01 0)
    (fib%precondition $Snap.unit n@0@01)
    (>= (+ n@0@01 1) 0)
    (fib%precondition $Snap.unit (+ n@0@01 1)))))
; Joined path conditions
(assert (or (not (>= n@0@01 1)) (>= n@0@01 1)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@0@01 Int)) (!
  (and
    (=>
      (>= n@0@01 1)
      (and
        (>= n@0@01 1)
        (>= n@0@01 0)
        (fib%precondition $Snap.unit n@0@01)
        (>= (+ n@0@01 1) 0)
        (fib%precondition $Snap.unit (+ n@0@01 1))))
    (or (not (>= n@0@01 1)) (>= n@0@01 1)))
  :pattern ((fib%limited $Snap.unit n@0@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58-aux|)))
(assert (forall ((n@0@01 Int)) (!
  (=>
    (>= n@0@01 1)
    (and
      (fib%precondition $Snap.unit n@0@01)
      (fib%precondition $Snap.unit (+ n@0@01 1))))
  :pattern ((fib%limited $Snap.unit n@0@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58_precondition|)))
(push) ; 3
(assert (not (forall ((n@0@01 Int)) (!
  (=>
    (and
      (=>
        (>= n@0@01 1)
        (and
          (fib%precondition $Snap.unit n@0@01)
          (fib%precondition $Snap.unit (+ n@0@01 1))))
      (>= n@0@01 1))
    (>= (fib $Snap.unit n@0@01) (fib $Snap.unit (+ n@0@01 1))))
  :pattern ((fib%limited $Snap.unit n@0@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58|))))
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
; [eval] (forall n: Int :: { fib(n) } n >= 1 ==> fib(n) >= fib(n + 1))
(declare-const n@1@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] n >= 1 ==> fib(n) >= fib(n + 1)
; [eval] n >= 1
(push) ; 4
; [then-branch: 1 | n@1@01 >= 1 | live]
; [else-branch: 1 | !(n@1@01 >= 1) | live]
(push) ; 5
; [then-branch: 1 | n@1@01 >= 1]
(assert (>= n@1@01 1))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fib(n) >= fib(n + 1)
; [eval] fib(n)
(set-option :timeout 0)
(push) ; 6
; [eval] n >= 0
(push) ; 7
(assert (not (>= n@1@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= n@1@01 0))
(assert (fib%precondition $Snap.unit n@1@01))
(pop) ; 6
; Joined path conditions
(assert (and (>= n@1@01 0) (fib%precondition $Snap.unit n@1@01)))
; [eval] fib(n + 1)
; [eval] n + 1
(push) ; 6
; [eval] n >= 0
(push) ; 7
(assert (not (>= (+ n@1@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ n@1@01 1) 0))
(assert (fib%precondition $Snap.unit (+ n@1@01 1)))
(pop) ; 6
; Joined path conditions
(assert (and (>= (+ n@1@01 1) 0) (fib%precondition $Snap.unit (+ n@1@01 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(n@1@01 >= 1)]
(assert (not (>= n@1@01 1)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= n@1@01 1)
  (and
    (>= n@1@01 1)
    (>= n@1@01 0)
    (fib%precondition $Snap.unit n@1@01)
    (>= (+ n@1@01 1) 0)
    (fib%precondition $Snap.unit (+ n@1@01 1)))))
; Joined path conditions
(assert (or (not (>= n@1@01 1)) (>= n@1@01 1)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@1@01 Int)) (!
  (and
    (=>
      (>= n@1@01 1)
      (and
        (>= n@1@01 1)
        (>= n@1@01 0)
        (fib%precondition $Snap.unit n@1@01)
        (>= (+ n@1@01 1) 0)
        (fib%precondition $Snap.unit (+ n@1@01 1))))
    (or (not (>= n@1@01 1)) (>= n@1@01 1)))
  :pattern ((fib%limited $Snap.unit n@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58-aux|)))
(assert (forall ((n@1@01 Int)) (!
  (=>
    (>= n@1@01 1)
    (and
      (fib%precondition $Snap.unit n@1@01)
      (fib%precondition $Snap.unit (+ n@1@01 1))))
  :pattern ((fib%limited $Snap.unit n@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((n@1@01 Int)) (!
  (=>
    (and
      (=>
        (>= n@1@01 1)
        (and
          (fib%precondition $Snap.unit n@1@01)
          (fib%precondition $Snap.unit (+ n@1@01 1))))
      (>= n@1@01 1))
    (>= (fib $Snap.unit n@1@01) (fib $Snap.unit (+ n@1@01 1))))
  :pattern ((fib%limited $Snap.unit n@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58|))))
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
; [eval] (forall n: Int :: { fib(n) } n >= 1 ==> fib(n) >= fib(n + 1))
(declare-const n@2@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] n >= 1 ==> fib(n) >= fib(n + 1)
; [eval] n >= 1
(push) ; 4
; [then-branch: 2 | n@2@01 >= 1 | live]
; [else-branch: 2 | !(n@2@01 >= 1) | live]
(push) ; 5
; [then-branch: 2 | n@2@01 >= 1]
(assert (>= n@2@01 1))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fib(n) >= fib(n + 1)
; [eval] fib(n)
(set-option :timeout 0)
(push) ; 6
; [eval] n >= 0
(push) ; 7
(assert (not (>= n@2@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= n@2@01 0))
(assert (fib%precondition $Snap.unit n@2@01))
(pop) ; 6
; Joined path conditions
(assert (and (>= n@2@01 0) (fib%precondition $Snap.unit n@2@01)))
; [eval] fib(n + 1)
; [eval] n + 1
(push) ; 6
; [eval] n >= 0
(push) ; 7
(assert (not (>= (+ n@2@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ n@2@01 1) 0))
(assert (fib%precondition $Snap.unit (+ n@2@01 1)))
(pop) ; 6
; Joined path conditions
(assert (and (>= (+ n@2@01 1) 0) (fib%precondition $Snap.unit (+ n@2@01 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(n@2@01 >= 1)]
(assert (not (>= n@2@01 1)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= n@2@01 1)
  (and
    (>= n@2@01 1)
    (>= n@2@01 0)
    (fib%precondition $Snap.unit n@2@01)
    (>= (+ n@2@01 1) 0)
    (fib%precondition $Snap.unit (+ n@2@01 1)))))
; Joined path conditions
(assert (or (not (>= n@2@01 1)) (>= n@2@01 1)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@2@01 Int)) (!
  (and
    (=>
      (>= n@2@01 1)
      (and
        (>= n@2@01 1)
        (>= n@2@01 0)
        (fib%precondition $Snap.unit n@2@01)
        (>= (+ n@2@01 1) 0)
        (fib%precondition $Snap.unit (+ n@2@01 1))))
    (or (not (>= n@2@01 1)) (>= n@2@01 1)))
  :pattern ((fib%limited $Snap.unit n@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58-aux|)))
(assert (forall ((n@2@01 Int)) (!
  (=>
    (>= n@2@01 1)
    (and
      (fib%precondition $Snap.unit n@2@01)
      (fib%precondition $Snap.unit (+ n@2@01 1))))
  :pattern ((fib%limited $Snap.unit n@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((n@2@01 Int)) (!
  (=>
    (and
      (=>
        (>= n@2@01 1)
        (and
          (fib%precondition $Snap.unit n@2@01)
          (fib%precondition $Snap.unit (+ n@2@01 1))))
      (>= n@2@01 1))
    (>= (fib $Snap.unit n@2@01) (fib $Snap.unit (+ n@2@01 1))))
  :pattern ((fib%limited $Snap.unit n@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58|))))
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
; [eval] (forall n: Int :: { fib(n) } n >= 1 ==> fib(n) >= fib(n + 1))
(declare-const n@3@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] n >= 1 ==> fib(n) >= fib(n + 1)
; [eval] n >= 1
(push) ; 4
; [then-branch: 3 | n@3@01 >= 1 | live]
; [else-branch: 3 | !(n@3@01 >= 1) | live]
(push) ; 5
; [then-branch: 3 | n@3@01 >= 1]
(assert (>= n@3@01 1))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] fib(n) >= fib(n + 1)
; [eval] fib(n)
(set-option :timeout 0)
(push) ; 6
; [eval] n >= 0
(push) ; 7
(assert (not (>= n@3@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= n@3@01 0))
(assert (fib%precondition $Snap.unit n@3@01))
(pop) ; 6
; Joined path conditions
(assert (and (>= n@3@01 0) (fib%precondition $Snap.unit n@3@01)))
; [eval] fib(n + 1)
; [eval] n + 1
(push) ; 6
; [eval] n >= 0
(push) ; 7
(assert (not (>= (+ n@3@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (>= (+ n@3@01 1) 0))
(assert (fib%precondition $Snap.unit (+ n@3@01 1)))
(pop) ; 6
; Joined path conditions
(assert (and (>= (+ n@3@01 1) 0) (fib%precondition $Snap.unit (+ n@3@01 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(n@3@01 >= 1)]
(assert (not (>= n@3@01 1)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= n@3@01 1)
  (and
    (>= n@3@01 1)
    (>= n@3@01 0)
    (fib%precondition $Snap.unit n@3@01)
    (>= (+ n@3@01 1) 0)
    (fib%precondition $Snap.unit (+ n@3@01 1)))))
; Joined path conditions
(assert (or (not (>= n@3@01 1)) (>= n@3@01 1)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@3@01 Int)) (!
  (and
    (=>
      (>= n@3@01 1)
      (and
        (>= n@3@01 1)
        (>= n@3@01 0)
        (fib%precondition $Snap.unit n@3@01)
        (>= (+ n@3@01 1) 0)
        (fib%precondition $Snap.unit (+ n@3@01 1))))
    (or (not (>= n@3@01 1)) (>= n@3@01 1)))
  :pattern ((fib%limited $Snap.unit n@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58-aux|)))
(assert (forall ((n@3@01 Int)) (!
  (=>
    (>= n@3@01 1)
    (and
      (fib%precondition $Snap.unit n@3@01)
      (fib%precondition $Snap.unit (+ n@3@01 1))))
  :pattern ((fib%limited $Snap.unit n@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((n@3@01 Int)) (!
  (=>
    (and
      (=>
        (>= n@3@01 1)
        (and
          (fib%precondition $Snap.unit n@3@01)
          (fib%precondition $Snap.unit (+ n@3@01 1))))
      (>= n@3@01 1))
    (>= (fib $Snap.unit n@3@01) (fib $Snap.unit (+ n@3@01 1))))
  :pattern ((fib%limited $Snap.unit n@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@14@10@14@58|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@4@01 $Ref)
(declare-const x@5@01 $Ref)
(push) ; 1
(declare-const $t@6@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall n: Int ::n >= 1 ==>
;     (unfolding acc(P(x), write) in n < n + 1))
; [eval] (forall n: Int ::n >= 1 ==> (unfolding acc(P(x), write) in n < n + 1))
(declare-const n@7@01 Int)
(push) ; 3
; [eval] n >= 1 ==> (unfolding acc(P(x), write) in n < n + 1)
; [eval] n >= 1
(push) ; 4
; [then-branch: 4 | n@7@01 >= 1 | live]
; [else-branch: 4 | !(n@7@01 >= 1) | live]
(push) ; 5
; [then-branch: 4 | n@7@01 >= 1]
(assert (>= n@7@01 1))
; [eval] (unfolding acc(P(x), write) in n < n + 1)
(push) ; 6
(assert (P%trigger $t@6@01 x@5@01))
(assert (= $t@6@01 $Snap.unit))
; [eval] n < n + 1
; [eval] n + 1
(pop) ; 6
; Joined path conditions
(assert (and (P%trigger $t@6@01 x@5@01) (= $t@6@01 $Snap.unit)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(n@7@01 >= 1)]
(assert (not (>= n@7@01 1)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= n@7@01 1)
  (and (>= n@7@01 1) (P%trigger $t@6@01 x@5@01) (= $t@6@01 $Snap.unit))))
; Joined path conditions
(assert (or (not (>= n@7@01 1)) (>= n@7@01 1)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((n@7@01 Int)) (!
  (=> (>= n@7@01 1) (< n@7@01 (+ n@7@01 1)))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@23@10@23@70|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n@7@01 Int)) (!
  (=> (>= n@7@01 1) (< n@7@01 (+ n@7@01 1)))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0088.vpr@23@10@23@70|)))
(pop) ; 2
(pop) ; 1
