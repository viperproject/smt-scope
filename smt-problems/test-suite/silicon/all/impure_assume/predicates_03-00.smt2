(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:25
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/predicates_03.vpr
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
(declare-sort __ns__impure_assume_rewriter 0)
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
(declare-fun $SortWrappers.__ns__impure_assume_rewriterTo$Snap (__ns__impure_assume_rewriter) $Snap)
(declare-fun $SortWrappers.$SnapTo__ns__impure_assume_rewriter ($Snap) __ns__impure_assume_rewriter)
(assert (forall ((x __ns__impure_assume_rewriter)) (!
    (= x ($SortWrappers.$SnapTo__ns__impure_assume_rewriter($SortWrappers.__ns__impure_assume_rewriterTo$Snap x)))
    :pattern (($SortWrappers.__ns__impure_assume_rewriterTo$Snap x))
    :qid |$Snap.$SnapTo__ns__impure_assume_rewriterTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.__ns__impure_assume_rewriterTo$Snap($SortWrappers.$SnapTo__ns__impure_assume_rewriter x)))
    :pattern (($SortWrappers.$SnapTo__ns__impure_assume_rewriter x))
    :qid |$Snap.__ns__impure_assume_rewriterTo$SnapTo__ns__impure_assume_rewriter|
    )))
; ////////// Symbols
(declare-fun __iar__assume_helper_1<Perm> (Bool $Perm $Perm) $Perm)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref Int) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((c_1 Bool) (p_1 $Perm) (p_0 $Perm)) (!
  (= (__iar__assume_helper_1<Perm> c_1 p_1 p_0) (+ p_0 (ite c_1 p_1 $Perm.No)))
  :pattern ((__iar__assume_helper_1<Perm> c_1 p_1 p_0))
  :qid |prog.__iar__assume_helper_1_axiom|)))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const x@0@01 $Ref)
(declare-const i@1@01 Int)
(declare-const y@2@01 $Ref)
(declare-const j@3@01 Int)
(declare-const z@4@01 $Ref)
(declare-const k@5@01 Int)
(declare-const p@6@01 $Perm)
(declare-const q@7@01 $Perm)
(declare-const x@8@01 $Ref)
(declare-const i@9@01 Int)
(declare-const y@10@01 $Ref)
(declare-const j@11@01 Int)
(declare-const z@12@01 $Ref)
(declare-const k@13@01 Int)
(declare-const p@14@01 $Perm)
(declare-const q@15@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] none <= q
(assert (<= $Perm.No q@15@01))
(assert (=
  ($Snap.second $t@16@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@16@01))
    ($Snap.second ($Snap.second $t@16@01)))))
(assert (= ($Snap.first ($Snap.second $t@16@01)) $Snap.unit))
; [eval] none <= p
(assert (<= $Perm.No p@14@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale perm(P(y, j)) >= p
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] perm(P(y, j)) >= p
; [eval] perm(P(y, j))
(assert (>=
  (ite
    (and (= y@10@01 x@8@01) (= j@11@01 i@9@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  p@14@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(z, k)) >= __iar__assume_helper_1(y == z && j == k, p, q)
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 $Snap.unit))
; [eval] perm(P(z, k)) >= __iar__assume_helper_1(y == z && j == k, p, q)
; [eval] perm(P(z, k))
; [eval] __iar__assume_helper_1(y == z && j == k, p, q)
; [eval] y == z && j == k
; [eval] y == z
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | y@10@01 != z@12@01 | live]
; [else-branch: 0 | y@10@01 == z@12@01 | live]
(push) ; 4
; [then-branch: 0 | y@10@01 != z@12@01]
(assert (not (= y@10@01 z@12@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | y@10@01 == z@12@01]
(assert (= y@10@01 z@12@01))
; [eval] j == k
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= y@10@01 z@12@01) (not (= y@10@01 z@12@01))))
(assert (>=
  (ite
    (and (= z@12@01 x@8@01) (= k@13@01 i@9@01))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  (__iar__assume_helper_1<Perm> (and (= y@10@01 z@12@01) (= j@11@01 k@13@01)) p@14@01 q@15@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert none <= p && p <= 1 / 2
; [eval] none <= p
; [eval] p <= 1 / 2
(set-option :timeout 0)
(push) ; 3
(assert (not (<= p@14@01 (/ (to_real 1) (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= p@14@01 (/ (to_real 1) (to_real 2))))
; [exec]
; assert none <= q && q <= 1 / 2
; [eval] none <= q
; [eval] q <= 1 / 2
(push) ; 3
(assert (not (<= q@15@01 (/ (to_real 1) (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= q@15@01 (/ (to_real 1) (to_real 2))))
; [exec]
; assert y == z && j == k ==> q + p <= 1 / 2
; [eval] y == z && j == k ==> q + p <= 1 / 2
; [eval] y == z && j == k
; [eval] y == z
(push) ; 3
; [then-branch: 1 | y@10@01 != z@12@01 | live]
; [else-branch: 1 | y@10@01 == z@12@01 | live]
(push) ; 4
; [then-branch: 1 | y@10@01 != z@12@01]
(assert (not (= y@10@01 z@12@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | y@10@01 == z@12@01]
(assert (= y@10@01 z@12@01))
; [eval] j == k
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and (= y@10@01 z@12@01) (= j@11@01 k@13@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and (= y@10@01 z@12@01) (= j@11@01 k@13@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | y@10@01 == z@12@01 && j@11@01 == k@13@01 | live]
; [else-branch: 2 | !(y@10@01 == z@12@01 && j@11@01 == k@13@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | y@10@01 == z@12@01 && j@11@01 == k@13@01]
(assert (and (= y@10@01 z@12@01) (= j@11@01 k@13@01)))
; [eval] q + p <= 1 / 2
; [eval] q + p
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(y@10@01 == z@12@01 && j@11@01 == k@13@01)]
(assert (not (and (= y@10@01 z@12@01) (= j@11@01 k@13@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (= y@10@01 z@12@01) (= j@11@01 k@13@01)))
  (and (= y@10@01 z@12@01) (= j@11@01 k@13@01))))
(push) ; 3
(assert (not (=>
  (and (= y@10@01 z@12@01) (= j@11@01 k@13@01))
  (<= (+ q@15@01 p@14@01) (/ (to_real 1) (to_real 2))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and (= y@10@01 z@12@01) (= j@11@01 k@13@01))
  (<= (+ q@15@01 p@14@01) (/ (to_real 1) (to_real 2)))))
; [exec]
; assert y == z ==> none <= q && q <= p
; [eval] y == z ==> none <= q && q <= p
; [eval] y == z
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@10@01 z@12@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@10@01 z@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | y@10@01 == z@12@01 | live]
; [else-branch: 3 | y@10@01 != z@12@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | y@10@01 == z@12@01]
(assert (= y@10@01 z@12@01))
; [eval] none <= q && q <= p
; [eval] none <= q
(push) ; 5
; [then-branch: 4 | !(Z <= q@15@01) | live]
; [else-branch: 4 | Z <= q@15@01 | live]
(push) ; 6
; [then-branch: 4 | !(Z <= q@15@01)]
(assert (not (<= $Perm.No q@15@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | Z <= q@15@01]
; [eval] q <= p
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= $Perm.No q@15@01) (not (<= $Perm.No q@15@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | y@10@01 != z@12@01]
(assert (not (= y@10@01 z@12@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= y@10@01 z@12@01)
  (and
    (= y@10@01 z@12@01)
    (or (<= $Perm.No q@15@01) (not (<= $Perm.No q@15@01))))))
; Joined path conditions
(assert (or (not (= y@10@01 z@12@01)) (= y@10@01 z@12@01)))
(push) ; 3
(assert (not (=> (= y@10@01 z@12@01) (and (<= $Perm.No q@15@01) (<= q@15@01 p@14@01)))))
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
; [eval] y == z ==> none <= q && q <= p
; [eval] y == z
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@10@01 z@12@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@10@01 z@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | y@10@01 == z@12@01 | live]
; [else-branch: 5 | y@10@01 != z@12@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 5 | y@10@01 == z@12@01]
(assert (= y@10@01 z@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] none <= q && q <= p
; [eval] none <= q
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | !(Z <= q@15@01) | live]
; [else-branch: 6 | Z <= q@15@01 | live]
(push) ; 6
; [then-branch: 6 | !(Z <= q@15@01)]
(assert (not (<= $Perm.No q@15@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 6 | Z <= q@15@01]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] q <= p
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= $Perm.No q@15@01) (not (<= $Perm.No q@15@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | y@10@01 != z@12@01]
(assert (not (= y@10@01 z@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (= y@10@01 z@12@01) (and (<= $Perm.No q@15@01) (<= q@15@01 p@14@01)))))
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
; [eval] y == z ==> none <= q && q <= p
; [eval] y == z
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@10@01 z@12@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@10@01 z@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | y@10@01 == z@12@01 | live]
; [else-branch: 7 | y@10@01 != z@12@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | y@10@01 == z@12@01]
(assert (= y@10@01 z@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] none <= q && q <= p
; [eval] none <= q
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | !(Z <= q@15@01) | live]
; [else-branch: 8 | Z <= q@15@01 | live]
(push) ; 6
; [then-branch: 8 | !(Z <= q@15@01)]
(assert (not (<= $Perm.No q@15@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 8 | Z <= q@15@01]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] q <= p
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= $Perm.No q@15@01) (not (<= $Perm.No q@15@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 7 | y@10@01 != z@12@01]
(assert (not (= y@10@01 z@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (= y@10@01 z@12@01) (and (<= $Perm.No q@15@01) (<= q@15@01 p@14@01)))))
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
; [eval] y == z ==> none <= q && q <= p
; [eval] y == z
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= y@10@01 z@12@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= y@10@01 z@12@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | y@10@01 == z@12@01 | live]
; [else-branch: 9 | y@10@01 != z@12@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | y@10@01 == z@12@01]
(assert (= y@10@01 z@12@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] none <= q && q <= p
; [eval] none <= q
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | !(Z <= q@15@01) | live]
; [else-branch: 10 | Z <= q@15@01 | live]
(push) ; 6
; [then-branch: 10 | !(Z <= q@15@01)]
(assert (not (<= $Perm.No q@15@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 10 | Z <= q@15@01]
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] q <= p
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= $Perm.No q@15@01) (not (<= $Perm.No q@15@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 9 | y@10@01 != z@12@01]
(assert (not (= y@10@01 z@12@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> (= y@10@01 z@12@01) (and (<= $Perm.No q@15@01) (<= q@15@01 p@14@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const x@19@01 $Ref)
(declare-const i@20@01 Int)
(declare-const y@21@01 $Ref)
(declare-const j@22@01 Int)
(declare-const z@23@01 $Ref)
(declare-const k@24@01 Int)
(declare-const b1@25@01 Bool)
(declare-const b2@26@01 Bool)
(declare-const x@27@01 $Ref)
(declare-const i@28@01 Int)
(declare-const y@29@01 $Ref)
(declare-const j@30@01 Int)
(declare-const z@31@01 $Ref)
(declare-const k@32@01 Int)
(declare-const b1@33@01 Bool)
(declare-const b2@34@01 Bool)
(push) ; 1
(declare-const $t@35@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale b1 ==> perm(P(y, j)) >= write
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] b1 ==> perm(P(y, j)) >= write
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@33@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@33@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b1@33@01 | live]
; [else-branch: 11 | !(b1@33@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | b1@33@01]
(assert b1@33@01)
; [eval] perm(P(y, j)) >= write
; [eval] perm(P(y, j))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(b1@33@01)]
(assert (not b1@33@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b1@33@01) b1@33@01))
(assert (=>
  b1@33@01
  (>=
    (ite (and (= y@29@01 x@27@01) (= j@30@01 i@28@01)) $Perm.Write $Perm.No)
    $Perm.Write)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b2 ==>
;   perm(P(z, k)) >=
;   __iar__assume_helper_1(b1 && (y == z && j == k), write, write)
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] b2 ==> perm(P(z, k)) >= __iar__assume_helper_1(b1 && (y == z && j == k), write, write)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@34@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@34@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | b2@34@01 | live]
; [else-branch: 12 | !(b2@34@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | b2@34@01]
(assert b2@34@01)
; [eval] perm(P(z, k)) >= __iar__assume_helper_1(b1 && (y == z && j == k), write, write)
; [eval] perm(P(z, k))
; [eval] __iar__assume_helper_1(b1 && (y == z && j == k), write, write)
; [eval] b1 && (y == z && j == k)
(push) ; 5
; [then-branch: 13 | !(b1@33@01) | live]
; [else-branch: 13 | b1@33@01 | live]
(push) ; 6
; [then-branch: 13 | !(b1@33@01)]
(assert (not b1@33@01))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | b1@33@01]
(assert b1@33@01)
; [eval] y == z
(push) ; 7
; [then-branch: 14 | y@29@01 != z@31@01 | live]
; [else-branch: 14 | y@29@01 == z@31@01 | live]
(push) ; 8
; [then-branch: 14 | y@29@01 != z@31@01]
(assert (not (= y@29@01 z@31@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 14 | y@29@01 == z@31@01]
(assert (= y@29@01 z@31@01))
; [eval] j == k
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (= y@29@01 z@31@01) (not (= y@29@01 z@31@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=> b1@33@01 (and b1@33@01 (or (= y@29@01 z@31@01) (not (= y@29@01 z@31@01))))))
(assert (or b1@33@01 (not b1@33@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | !(b2@34@01)]
(assert (not b2@34@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  b2@34@01
  (and
    b2@34@01
    (=>
      b1@33@01
      (and b1@33@01 (or (= y@29@01 z@31@01) (not (= y@29@01 z@31@01)))))
    (or b1@33@01 (not b1@33@01)))))
; Joined path conditions
(assert (or (not b2@34@01) b2@34@01))
(assert (=>
  b2@34@01
  (>=
    (ite (and (= z@31@01 x@27@01) (= k@32@01 i@28@01)) $Perm.Write $Perm.No)
    (__iar__assume_helper_1<Perm> (and
      b1@33@01
      (and (= y@29@01 z@31@01) (= j@30@01 k@32@01))) $Perm.Write $Perm.Write))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert b1 ==> y == x
; [eval] b1 ==> y == x
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@33@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@33@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | b1@33@01 | live]
; [else-branch: 15 | !(b1@33@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | b1@33@01]
(assert b1@33@01)
; [eval] y == x
(pop) ; 4
(push) ; 4
; [else-branch: 15 | !(b1@33@01)]
(assert (not b1@33@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> b1@33@01 (= y@29@01 x@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> b1@33@01 (= y@29@01 x@27@01)))
; [exec]
; assert b2 ==> z == x
; [eval] b2 ==> z == x
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@34@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@34@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | b2@34@01 | live]
; [else-branch: 16 | !(b2@34@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | b2@34@01]
(assert b2@34@01)
; [eval] z == x
(pop) ; 4
(push) ; 4
; [else-branch: 16 | !(b2@34@01)]
(assert (not b2@34@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> b2@34@01 (= z@31@01 x@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> b2@34@01 (= z@31@01 x@27@01)))
; [exec]
; assert b1 && b2 ==> false
; [eval] b1 && b2 ==> false
; [eval] b1 && b2
(push) ; 3
; [then-branch: 17 | !(b1@33@01) | live]
; [else-branch: 17 | b1@33@01 | live]
(push) ; 4
; [then-branch: 17 | !(b1@33@01)]
(assert (not b1@33@01))
(pop) ; 4
(push) ; 4
; [else-branch: 17 | b1@33@01]
(assert b1@33@01)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or b1@33@01 (not b1@33@01)))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and b1@33@01 b2@34@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | b1@33@01 && b2@34@01 | dead]
; [else-branch: 18 | !(b1@33@01 && b2@34@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 18 | !(b1@33@01 && b2@34@01)]
(assert (not (and b1@33@01 b2@34@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (and b1@33@01 b2@34@01)))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const x@38@01 $Ref)
(declare-const i@39@01 Int)
(declare-const y@40@01 $Ref)
(declare-const j@41@01 Int)
(declare-const z@42@01 $Ref)
(declare-const k@43@01 Int)
(declare-const b1@44@01 Bool)
(declare-const b2@45@01 Bool)
(declare-const x@46@01 $Ref)
(declare-const i@47@01 Int)
(declare-const y@48@01 $Ref)
(declare-const j@49@01 Int)
(declare-const z@50@01 $Ref)
(declare-const k@51@01 Int)
(declare-const b1@52@01 Bool)
(declare-const b2@53@01 Bool)
(push) ; 1
(declare-const $t@54@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale b1 ==> perm(P(y, j)) >= write
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 $Snap.unit))
; [eval] b1 ==> perm(P(y, j)) >= write
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@52@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@52@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | b1@52@01 | live]
; [else-branch: 19 | !(b1@52@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | b1@52@01]
(assert b1@52@01)
; [eval] perm(P(y, j)) >= write
; [eval] perm(P(y, j))
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(b1@52@01)]
(assert (not b1@52@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b1@52@01) b1@52@01))
(assert (=>
  b1@52@01
  (>=
    (ite (and (= y@48@01 x@46@01) (= j@49@01 i@47@01)) $Perm.Write $Perm.No)
    $Perm.Write)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b2 ==>
;   perm(P(z, k)) >=
;   __iar__assume_helper_1(b1 && (y == z && j == k), write, write)
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; [eval] b2 ==> perm(P(z, k)) >= __iar__assume_helper_1(b1 && (y == z && j == k), write, write)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@53@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | b2@53@01 | live]
; [else-branch: 20 | !(b2@53@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | b2@53@01]
(assert b2@53@01)
; [eval] perm(P(z, k)) >= __iar__assume_helper_1(b1 && (y == z && j == k), write, write)
; [eval] perm(P(z, k))
; [eval] __iar__assume_helper_1(b1 && (y == z && j == k), write, write)
; [eval] b1 && (y == z && j == k)
(push) ; 5
; [then-branch: 21 | !(b1@52@01) | live]
; [else-branch: 21 | b1@52@01 | live]
(push) ; 6
; [then-branch: 21 | !(b1@52@01)]
(assert (not b1@52@01))
(pop) ; 6
(push) ; 6
; [else-branch: 21 | b1@52@01]
(assert b1@52@01)
; [eval] y == z
(push) ; 7
; [then-branch: 22 | y@48@01 != z@50@01 | live]
; [else-branch: 22 | y@48@01 == z@50@01 | live]
(push) ; 8
; [then-branch: 22 | y@48@01 != z@50@01]
(assert (not (= y@48@01 z@50@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 22 | y@48@01 == z@50@01]
(assert (= y@48@01 z@50@01))
; [eval] j == k
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (= y@48@01 z@50@01) (not (= y@48@01 z@50@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=> b1@52@01 (and b1@52@01 (or (= y@48@01 z@50@01) (not (= y@48@01 z@50@01))))))
(assert (or b1@52@01 (not b1@52@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | !(b2@53@01)]
(assert (not b2@53@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  b2@53@01
  (and
    b2@53@01
    (=>
      b1@52@01
      (and b1@52@01 (or (= y@48@01 z@50@01) (not (= y@48@01 z@50@01)))))
    (or b1@52@01 (not b1@52@01)))))
; Joined path conditions
(assert (or (not b2@53@01) b2@53@01))
(assert (=>
  b2@53@01
  (>=
    (ite (and (= z@50@01 x@46@01) (= k@51@01 i@47@01)) $Perm.Write $Perm.No)
    (__iar__assume_helper_1<Perm> (and
      b1@52@01
      (and (= y@48@01 z@50@01) (= j@49@01 k@51@01))) $Perm.Write $Perm.Write))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert b2 ==> false
; [eval] b2 ==> false
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@53@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | b2@53@01 | live]
; [else-branch: 23 | !(b2@53@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | b2@53@01]
(assert b2@53@01)
(pop) ; 4
(push) ; 4
; [else-branch: 23 | !(b2@53@01)]
(assert (not b2@53@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> b2@53@01 false)))
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
; [eval] b2 ==> false
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@53@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | b2@53@01 | live]
; [else-branch: 24 | !(b2@53@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 24 | b2@53@01]
(assert b2@53@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 24 | !(b2@53@01)]
(assert (not b2@53@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> b2@53@01 false)))
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
; [eval] b2 ==> false
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@53@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | b2@53@01 | live]
; [else-branch: 25 | !(b2@53@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | b2@53@01]
(assert b2@53@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 25 | !(b2@53@01)]
(assert (not b2@53@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> b2@53@01 false)))
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
; [eval] b2 ==> false
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@53@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@53@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | b2@53@01 | live]
; [else-branch: 26 | !(b2@53@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 26 | b2@53@01]
(assert b2@53@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 26 | !(b2@53@01)]
(assert (not b2@53@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(set-option :timeout 0)
(push) ; 3
(assert (not (=> b2@53@01 false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
