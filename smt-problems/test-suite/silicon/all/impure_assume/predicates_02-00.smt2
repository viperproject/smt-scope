(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:22
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/predicates_02.vpr
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
(declare-fun __iar__assume_helper_2<Perm> (Bool Bool $Perm $Perm $Perm) $Perm)
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
(assert (forall ((c_2 Bool) (c_1 Bool) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_2<Perm> c_2 c_1 p_2 p_1 p_0)
    (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No)))
  :pattern ((__iar__assume_helper_2<Perm> c_2 c_1 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_2_axiom|)))
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
(declare-const b@0@01 Bool)
(declare-const b@1@01 Bool)
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
(declare-const x@2@01 $Ref)
; [exec]
; var i: Int
(declare-const i@3@01 Int)
; [exec]
; var y: Ref
(declare-const y@4@01 $Ref)
; [exec]
; var j: Int
(declare-const j@5@01 Int)
; [exec]
; inhale acc(P(x, i), 1 / 3)
(declare-const $t@6@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
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
; [then-branch: 0 | b@1@01 | live]
; [else-branch: 0 | !(b@1@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | b@1@01]
(assert b@1@01)
; [exec]
; inhale acc(P(x, i), 1 / 4)
(declare-const $t@7@01 $Snap)
(assert (= $t@6@01 $t@7@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | b@1@01 | live]
; [else-branch: 1 | !(b@1@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | b@1@01]
; [eval] perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] x == y && i == j
; [eval] x == y
(push) ; 6
; [then-branch: 2 | x@2@01 != y@4@01 | live]
; [else-branch: 2 | x@2@01 == y@4@01 | live]
(push) ; 7
; [then-branch: 2 | x@2@01 != y@4@01]
(assert (not (= x@2@01 y@4@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 2 | x@2@01 == y@4@01]
(assert (= x@2@01 y@4@01))
; [eval] i == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= x@2@01 y@4@01) (not (= x@2@01 y@4@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@1@01 (or (= x@2@01 y@4@01) (not (= x@2@01 y@4@01)))))
(assert (=>
  b@1@01
  (>=
    (ite
      (and (= y@4@01 x@2@01) (= j@5@01 i@3@01))
      (/ (to_real 7) (to_real 12))
      $Perm.No)
    (__iar__assume_helper_1<Perm> (and (= x@2@01 y@4@01) (= i@3@01 j@5@01)) (/
      (to_real 1)
      (to_real 3)) (/ (to_real 3) (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | x@2@01 != y@4@01 | live]
; [else-branch: 3 | x@2@01 == y@4@01 | live]
(push) ; 5
; [then-branch: 3 | x@2@01 != y@4@01]
(assert (not (= x@2@01 y@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | x@2@01 == y@4@01]
(assert (= x@2@01 y@4@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@2@01 y@4@01) (not (= x@2@01 y@4@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 4 | !(b@1@01) | live]
; [else-branch: 4 | b@1@01 | live]
(push) ; 5
; [then-branch: 4 | !(b@1@01)]
(assert (not b@1@01))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | b@1@01]
; [eval] y == y
(push) ; 6
; [then-branch: 5 | False | live]
; [else-branch: 5 | True | live]
(push) ; 7
; [then-branch: 5 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 5 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@1@01 (not b@1@01)))
(assert (>=
  (ite
    (and (= y@4@01 x@2@01) (= j@5@01 i@3@01))
    (/ (to_real 7) (to_real 12))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@2@01 y@4@01) (= i@3@01 j@5@01)) b@1@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | b@1@01 | live]
; [else-branch: 6 | !(b@1@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | b@1@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | b@1@01 | live]
; [else-branch: 7 | !(b@1@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | b@1@01]
; [eval] y == x && j == i
; [eval] y == x
(push) ; 6
; [then-branch: 8 | y@4@01 != x@2@01 | live]
; [else-branch: 8 | y@4@01 == x@2@01 | live]
(push) ; 7
; [then-branch: 8 | y@4@01 != x@2@01]
(assert (not (= y@4@01 x@2@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | y@4@01 == x@2@01]
(assert (= y@4@01 x@2@01))
; [eval] j == i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= y@4@01 x@2@01) (not (= y@4@01 x@2@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@1@01 (or (= y@4@01 x@2@01) (not (= y@4@01 x@2@01)))))
(push) ; 4
(assert (not (=> b@1@01 (and (= y@4@01 x@2@01) (= j@5@01 i@3@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@1@01 (and (= y@4@01 x@2@01) (= j@5@01 i@3@01))))
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 9 | x@2@01 != y@4@01 | live]
; [else-branch: 9 | x@2@01 == y@4@01 | live]
(push) ; 5
; [then-branch: 9 | x@2@01 != y@4@01]
(assert (not (= x@2@01 y@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | x@2@01 == y@4@01]
(assert (= x@2@01 y@4@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | x@2@01 != y@4@01 || i@3@01 != j@5@01 | dead]
; [else-branch: 10 | !(x@2@01 != y@4@01 || i@3@01 != j@5@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 10 | !(x@2@01 != y@4@01 || i@3@01 != j@5@01)]
(assert (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01)))))
(pop) ; 4
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 11 | x@2@01 != y@4@01 | live]
; [else-branch: 11 | x@2@01 == y@4@01 | live]
(push) ; 5
; [then-branch: 11 | x@2@01 != y@4@01]
(assert (not (= x@2@01 y@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | x@2@01 == y@4@01]
(assert (= x@2@01 y@4@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | !(x@2@01 != y@4@01 || i@3@01 != j@5@01) | live]
; [else-branch: 12 | x@2@01 != y@4@01 || i@3@01 != j@5@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | !(x@2@01 != y@4@01 || i@3@01 != j@5@01)]
(assert (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01)))))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(b@1@01)]
(assert (not b@1@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@1@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | !(b@1@01) | live]
; [else-branch: 13 | b@1@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | !(b@1@01)]
(assert (not b@1@01))
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 14 | b@1@01 | dead]
; [else-branch: 14 | !(b@1@01) | live]
(push) ; 5
; [else-branch: 14 | !(b@1@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 15 | x@2@01 != y@4@01 | live]
; [else-branch: 15 | x@2@01 == y@4@01 | live]
(push) ; 5
; [then-branch: 15 | x@2@01 != y@4@01]
(assert (not (= x@2@01 y@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | x@2@01 == y@4@01]
(assert (= x@2@01 y@4@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@2@01 y@4@01) (not (= x@2@01 y@4@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 16 | !(b@1@01) | live]
; [else-branch: 16 | b@1@01 | live]
(push) ; 5
; [then-branch: 16 | !(b@1@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 16 | b@1@01]
(assert b@1@01)
; [eval] y == y
(push) ; 6
; [then-branch: 17 | False | live]
; [else-branch: 17 | True | live]
(push) ; 7
; [then-branch: 17 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 17 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@1@01 (not b@1@01)))
(assert (>=
  (ite
    (and (= y@4@01 x@2@01) (= j@5@01 i@3@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@2@01 y@4@01) (= i@3@01 j@5@01)) b@1@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | b@1@01 | dead]
; [else-branch: 18 | !(b@1@01) | live]
(push) ; 5
; [else-branch: 18 | !(b@1@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
; [then-branch: 19 | b@1@01 | dead]
; [else-branch: 19 | !(b@1@01) | live]
(push) ; 5
; [else-branch: 19 | !(b@1@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 20 | x@2@01 != y@4@01 | live]
; [else-branch: 20 | x@2@01 == y@4@01 | live]
(push) ; 5
; [then-branch: 20 | x@2@01 != y@4@01]
(assert (not (= x@2@01 y@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | x@2@01 == y@4@01]
(assert (= x@2@01 y@4@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | x@2@01 != y@4@01 || i@3@01 != j@5@01 | live]
; [else-branch: 21 | !(x@2@01 != y@4@01 || i@3@01 != j@5@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | x@2@01 != y@4@01 || i@3@01 != j@5@01]
(assert (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01))))
; [exec]
; assert !b
; [eval] !b
; [exec]
; assert perm(P(y, j)) == none
; [eval] perm(P(y, j)) == none
; [eval] perm(P(y, j))
(push) ; 5
(assert (not (=
  (ite
    (and (= y@4@01 x@2@01) (= j@5@01 i@3@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (and (= y@4@01 x@2@01) (= j@5@01 i@3@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  $Perm.No))
(pop) ; 4
(push) ; 4
; [else-branch: 21 | !(x@2@01 != y@4@01 || i@3@01 != j@5@01)]
(assert (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01)))))
(pop) ; 4
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 22 | x@2@01 != y@4@01 | live]
; [else-branch: 22 | x@2@01 == y@4@01 | live]
(push) ; 5
; [then-branch: 22 | x@2@01 != y@4@01]
(assert (not (= x@2@01 y@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 22 | x@2@01 == y@4@01]
(assert (= x@2@01 y@4@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | !(x@2@01 != y@4@01 || i@3@01 != j@5@01) | live]
; [else-branch: 23 | x@2@01 != y@4@01 || i@3@01 != j@5@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | !(x@2@01 != y@4@01 || i@3@01 != j@5@01)]
(assert (not (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01)))))
(pop) ; 4
(push) ; 4
; [else-branch: 23 | x@2@01 != y@4@01 || i@3@01 != j@5@01]
(assert (or (not (= x@2@01 y@4@01)) (not (= i@3@01 j@5@01))))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 13 | b@1@01]
(assert b@1@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01_p1 ----------
(declare-const b@14@01 Bool)
(declare-const b@15@01 Bool)
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
(declare-const x@16@01 $Ref)
; [exec]
; var i: Int
(declare-const i@17@01 Int)
; [exec]
; var y: Ref
(declare-const y@18@01 $Ref)
; [exec]
; var j: Int
(declare-const j@19@01 Int)
; [exec]
; inhale acc(P(x, i), 1 / 3)
(declare-const $t@20@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@15@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@15@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | b@15@01 | live]
; [else-branch: 24 | !(b@15@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 24 | b@15@01]
(assert b@15@01)
; [exec]
; inhale acc(P(x, i), 1 / 4)
(declare-const $t@21@01 $Snap)
(assert (= $t@20@01 $t@21@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@15@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | b@15@01 | live]
; [else-branch: 25 | !(b@15@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | b@15@01]
; [eval] perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] x == y && i == j
; [eval] x == y
(push) ; 6
; [then-branch: 26 | x@16@01 != y@18@01 | live]
; [else-branch: 26 | x@16@01 == y@18@01 | live]
(push) ; 7
; [then-branch: 26 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= x@16@01 y@18@01) (not (= x@16@01 y@18@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@15@01 (or (= x@16@01 y@18@01) (not (= x@16@01 y@18@01)))))
(assert (=>
  b@15@01
  (>=
    (ite
      (and (= y@18@01 x@16@01) (= j@19@01 i@17@01))
      (/ (to_real 7) (to_real 12))
      $Perm.No)
    (__iar__assume_helper_1<Perm> (and (= x@16@01 y@18@01) (= i@17@01 j@19@01)) (/
      (to_real 1)
      (to_real 3)) (/ (to_real 3) (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 27 | x@16@01 != y@18@01 | live]
; [else-branch: 27 | x@16@01 == y@18@01 | live]
(push) ; 5
; [then-branch: 27 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@16@01 y@18@01) (not (= x@16@01 y@18@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 28 | !(b@15@01) | live]
; [else-branch: 28 | b@15@01 | live]
(push) ; 5
; [then-branch: 28 | !(b@15@01)]
(assert (not b@15@01))
(pop) ; 5
(push) ; 5
; [else-branch: 28 | b@15@01]
; [eval] y == y
(push) ; 6
; [then-branch: 29 | False | live]
; [else-branch: 29 | True | live]
(push) ; 7
; [then-branch: 29 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 29 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@15@01 (not b@15@01)))
(assert (>=
  (ite
    (and (= y@18@01 x@16@01) (= j@19@01 i@17@01))
    (/ (to_real 7) (to_real 12))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@16@01 y@18@01) (= i@17@01 j@19@01)) b@15@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@15@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | b@15@01 | live]
; [else-branch: 30 | !(b@15@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | b@15@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@15@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | b@15@01 | live]
; [else-branch: 31 | !(b@15@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 31 | b@15@01]
; [eval] y == x && j == i
; [eval] y == x
(push) ; 6
; [then-branch: 32 | y@18@01 != x@16@01 | live]
; [else-branch: 32 | y@18@01 == x@16@01 | live]
(push) ; 7
; [then-branch: 32 | y@18@01 != x@16@01]
(assert (not (= y@18@01 x@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 32 | y@18@01 == x@16@01]
(assert (= y@18@01 x@16@01))
; [eval] j == i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= y@18@01 x@16@01) (not (= y@18@01 x@16@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@15@01 (or (= y@18@01 x@16@01) (not (= y@18@01 x@16@01)))))
(push) ; 4
(assert (not (=> b@15@01 (and (= y@18@01 x@16@01) (= j@19@01 i@17@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@15@01 (and (= y@18@01 x@16@01) (= j@19@01 i@17@01))))
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 33 | x@16@01 != y@18@01 | live]
; [else-branch: 33 | x@16@01 == y@18@01 | live]
(push) ; 5
; [then-branch: 33 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | x@16@01 != y@18@01 || i@17@01 != j@19@01 | dead]
; [else-branch: 34 | !(x@16@01 != y@18@01 || i@17@01 != j@19@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 34 | !(x@16@01 != y@18@01 || i@17@01 != j@19@01)]
(assert (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01)))))
(pop) ; 4
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 35 | x@16@01 != y@18@01 | live]
; [else-branch: 35 | x@16@01 == y@18@01 | live]
(push) ; 5
; [then-branch: 35 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 35 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | !(x@16@01 != y@18@01 || i@17@01 != j@19@01) | live]
; [else-branch: 36 | x@16@01 != y@18@01 || i@17@01 != j@19@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 36 | !(x@16@01 != y@18@01 || i@17@01 != j@19@01)]
(assert (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01)))))
; [exec]
; inhale b
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != y || i != j
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 37 | x@16@01 != y@18@01 | live]
; [else-branch: 37 | x@16@01 == y@18@01 | live]
(push) ; 6
; [then-branch: 37 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 37 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 24 | !(b@15@01)]
(assert (not b@15@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@15@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@15@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | !(b@15@01) | live]
; [else-branch: 38 | b@15@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 38 | !(b@15@01)]
(assert (not b@15@01))
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 39 | b@15@01 | dead]
; [else-branch: 39 | !(b@15@01) | live]
(push) ; 5
; [else-branch: 39 | !(b@15@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 40 | x@16@01 != y@18@01 | live]
; [else-branch: 40 | x@16@01 == y@18@01 | live]
(push) ; 5
; [then-branch: 40 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 40 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@16@01 y@18@01) (not (= x@16@01 y@18@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 41 | !(b@15@01) | live]
; [else-branch: 41 | b@15@01 | live]
(push) ; 5
; [then-branch: 41 | !(b@15@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 41 | b@15@01]
(assert b@15@01)
; [eval] y == y
(push) ; 6
; [then-branch: 42 | False | live]
; [else-branch: 42 | True | live]
(push) ; 7
; [then-branch: 42 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 42 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@15@01 (not b@15@01)))
(assert (>=
  (ite
    (and (= y@18@01 x@16@01) (= j@19@01 i@17@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@16@01 y@18@01) (= i@17@01 j@19@01)) b@15@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 43 | b@15@01 | dead]
; [else-branch: 43 | !(b@15@01) | live]
(push) ; 5
; [else-branch: 43 | !(b@15@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
; [then-branch: 44 | b@15@01 | dead]
; [else-branch: 44 | !(b@15@01) | live]
(push) ; 5
; [else-branch: 44 | !(b@15@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 45 | x@16@01 != y@18@01 | live]
; [else-branch: 45 | x@16@01 == y@18@01 | live]
(push) ; 5
; [then-branch: 45 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | x@16@01 != y@18@01 || i@17@01 != j@19@01 | live]
; [else-branch: 46 | !(x@16@01 != y@18@01 || i@17@01 != j@19@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 46 | x@16@01 != y@18@01 || i@17@01 != j@19@01]
(assert (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01))))
; [exec]
; assert !b
; [eval] !b
; [exec]
; assert perm(P(y, j)) == none
; [eval] perm(P(y, j)) == none
; [eval] perm(P(y, j))
(push) ; 5
(assert (not (=
  (ite
    (and (= y@18@01 x@16@01) (= j@19@01 i@17@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (and (= y@18@01 x@16@01) (= j@19@01 i@17@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  $Perm.No))
; [exec]
; inhale b
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
(assert b@15@01)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale x != y || i != j
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 47 | x@16@01 != y@18@01 | live]
; [else-branch: 47 | x@16@01 == y@18@01 | live]
(push) ; 6
; [then-branch: 47 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 47 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(push) ; 4
; [else-branch: 46 | !(x@16@01 != y@18@01 || i@17@01 != j@19@01)]
(assert (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01)))))
(pop) ; 4
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 48 | x@16@01 != y@18@01 | live]
; [else-branch: 48 | x@16@01 == y@18@01 | live]
(push) ; 5
; [then-branch: 48 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | !(x@16@01 != y@18@01 || i@17@01 != j@19@01) | live]
; [else-branch: 49 | x@16@01 != y@18@01 || i@17@01 != j@19@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 49 | !(x@16@01 != y@18@01 || i@17@01 != j@19@01)]
(assert (not (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01)))))
; [exec]
; inhale b
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
(assert b@15@01)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale x != y || i != j
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 $Snap.unit))
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 50 | x@16@01 != y@18@01 | live]
; [else-branch: 50 | x@16@01 == y@18@01 | live]
(push) ; 6
; [then-branch: 50 | x@16@01 != y@18@01]
(assert (not (= x@16@01 y@18@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 50 | x@16@01 == y@18@01]
(assert (= x@16@01 y@18@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(push) ; 4
; [else-branch: 49 | x@16@01 != y@18@01 || i@17@01 != j@19@01]
(assert (or (not (= x@16@01 y@18@01)) (not (= i@17@01 j@19@01))))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 38 | b@15@01]
(assert b@15@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01_p2 ----------
(declare-const b@34@01 Bool)
(declare-const b@35@01 Bool)
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
(declare-const x@36@01 $Ref)
; [exec]
; var i: Int
(declare-const i@37@01 Int)
; [exec]
; var y: Ref
(declare-const y@38@01 $Ref)
; [exec]
; var j: Int
(declare-const j@39@01 Int)
; [exec]
; inhale acc(P(x, i), 1 / 3)
(declare-const $t@40@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@35@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@35@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | b@35@01 | live]
; [else-branch: 51 | !(b@35@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 51 | b@35@01]
(assert b@35@01)
; [exec]
; inhale acc(P(x, i), 1 / 4)
(declare-const $t@41@01 $Snap)
(assert (= $t@40@01 $t@41@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@35@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | b@35@01 | live]
; [else-branch: 52 | !(b@35@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 52 | b@35@01]
; [eval] perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] x == y && i == j
; [eval] x == y
(push) ; 6
; [then-branch: 53 | x@36@01 != y@38@01 | live]
; [else-branch: 53 | x@36@01 == y@38@01 | live]
(push) ; 7
; [then-branch: 53 | x@36@01 != y@38@01]
(assert (not (= x@36@01 y@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 53 | x@36@01 == y@38@01]
(assert (= x@36@01 y@38@01))
; [eval] i == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= x@36@01 y@38@01) (not (= x@36@01 y@38@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@35@01 (or (= x@36@01 y@38@01) (not (= x@36@01 y@38@01)))))
(assert (=>
  b@35@01
  (>=
    (ite
      (and (= y@38@01 x@36@01) (= j@39@01 i@37@01))
      (/ (to_real 7) (to_real 12))
      $Perm.No)
    (__iar__assume_helper_1<Perm> (and (= x@36@01 y@38@01) (= i@37@01 j@39@01)) (/
      (to_real 1)
      (to_real 3)) (/ (to_real 3) (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 54 | x@36@01 != y@38@01 | live]
; [else-branch: 54 | x@36@01 == y@38@01 | live]
(push) ; 5
; [then-branch: 54 | x@36@01 != y@38@01]
(assert (not (= x@36@01 y@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 54 | x@36@01 == y@38@01]
(assert (= x@36@01 y@38@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@36@01 y@38@01) (not (= x@36@01 y@38@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 55 | !(b@35@01) | live]
; [else-branch: 55 | b@35@01 | live]
(push) ; 5
; [then-branch: 55 | !(b@35@01)]
(assert (not b@35@01))
(pop) ; 5
(push) ; 5
; [else-branch: 55 | b@35@01]
; [eval] y == y
(push) ; 6
; [then-branch: 56 | False | live]
; [else-branch: 56 | True | live]
(push) ; 7
; [then-branch: 56 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 56 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@35@01 (not b@35@01)))
(assert (>=
  (ite
    (and (= y@38@01 x@36@01) (= j@39@01 i@37@01))
    (/ (to_real 7) (to_real 12))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@36@01 y@38@01) (= i@37@01 j@39@01)) b@35@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@35@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | b@35@01 | live]
; [else-branch: 57 | !(b@35@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 57 | b@35@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@35@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | b@35@01 | live]
; [else-branch: 58 | !(b@35@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 58 | b@35@01]
; [eval] y == x && j == i
; [eval] y == x
(push) ; 6
; [then-branch: 59 | y@38@01 != x@36@01 | live]
; [else-branch: 59 | y@38@01 == x@36@01 | live]
(push) ; 7
; [then-branch: 59 | y@38@01 != x@36@01]
(assert (not (= y@38@01 x@36@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 59 | y@38@01 == x@36@01]
(assert (= y@38@01 x@36@01))
; [eval] j == i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= y@38@01 x@36@01) (not (= y@38@01 x@36@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@35@01 (or (= y@38@01 x@36@01) (not (= y@38@01 x@36@01)))))
(push) ; 4
(assert (not (=> b@35@01 (and (= y@38@01 x@36@01) (= j@39@01 i@37@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@35@01 (and (= y@38@01 x@36@01) (= j@39@01 i@37@01))))
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 60 | x@36@01 != y@38@01 | live]
; [else-branch: 60 | x@36@01 == y@38@01 | live]
(push) ; 5
; [then-branch: 60 | x@36@01 != y@38@01]
(assert (not (= x@36@01 y@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 60 | x@36@01 == y@38@01]
(assert (= x@36@01 y@38@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@36@01 y@38@01)) (not (= i@37@01 j@39@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 61 | x@36@01 != y@38@01 || i@37@01 != j@39@01 | dead]
; [else-branch: 61 | !(x@36@01 != y@38@01 || i@37@01 != j@39@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 61 | !(x@36@01 != y@38@01 || i@37@01 != j@39@01)]
(assert (not (or (not (= x@36@01 y@38@01)) (not (= i@37@01 j@39@01)))))
(pop) ; 4
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 62 | x@36@01 != y@38@01 | live]
; [else-branch: 62 | x@36@01 == y@38@01 | live]
(push) ; 5
; [then-branch: 62 | x@36@01 != y@38@01]
(assert (not (= x@36@01 y@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 62 | x@36@01 == y@38@01]
(assert (= x@36@01 y@38@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@36@01 y@38@01)) (not (= i@37@01 j@39@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@36@01 y@38@01)) (not (= i@37@01 j@39@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 63 | !(x@36@01 != y@38@01 || i@37@01 != j@39@01) | live]
; [else-branch: 63 | x@36@01 != y@38@01 || i@37@01 != j@39@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 63 | !(x@36@01 != y@38@01 || i@37@01 != j@39@01)]
(assert (not (or (not (= x@36@01 y@38@01)) (not (= i@37@01 j@39@01)))))
; [exec]
; inhale b
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !(x != y || i != j)
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 $Snap.unit))
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 64 | x@36@01 != y@38@01 | live]
; [else-branch: 64 | x@36@01 == y@38@01 | live]
(push) ; 6
; [then-branch: 64 | x@36@01 != y@38@01]
(assert (not (= x@36@01 y@38@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 64 | x@36@01 == y@38@01]
(assert (= x@36@01 y@38@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01_p3 ----------
(declare-const b@47@01 Bool)
(declare-const b@48@01 Bool)
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
(declare-const x@49@01 $Ref)
; [exec]
; var i: Int
(declare-const i@50@01 Int)
; [exec]
; var y: Ref
(declare-const y@51@01 $Ref)
; [exec]
; var j: Int
(declare-const j@52@01 Int)
; [exec]
; inhale acc(P(x, i), 1 / 3)
(declare-const $t@53@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@48@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 65 | b@48@01 | live]
; [else-branch: 65 | !(b@48@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 65 | b@48@01]
(assert b@48@01)
; [exec]
; inhale acc(P(x, i), 1 / 4)
(declare-const $t@54@01 $Snap)
(assert (= $t@53@01 $t@54@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@48@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 66 | b@48@01 | live]
; [else-branch: 66 | !(b@48@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 66 | b@48@01]
; [eval] perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] x == y && i == j
; [eval] x == y
(push) ; 6
; [then-branch: 67 | x@49@01 != y@51@01 | live]
; [else-branch: 67 | x@49@01 == y@51@01 | live]
(push) ; 7
; [then-branch: 67 | x@49@01 != y@51@01]
(assert (not (= x@49@01 y@51@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 67 | x@49@01 == y@51@01]
(assert (= x@49@01 y@51@01))
; [eval] i == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= x@49@01 y@51@01) (not (= x@49@01 y@51@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@48@01 (or (= x@49@01 y@51@01) (not (= x@49@01 y@51@01)))))
(assert (=>
  b@48@01
  (>=
    (ite
      (and (= y@51@01 x@49@01) (= j@52@01 i@50@01))
      (/ (to_real 7) (to_real 12))
      $Perm.No)
    (__iar__assume_helper_1<Perm> (and (= x@49@01 y@51@01) (= i@50@01 j@52@01)) (/
      (to_real 1)
      (to_real 3)) (/ (to_real 3) (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 68 | x@49@01 != y@51@01 | live]
; [else-branch: 68 | x@49@01 == y@51@01 | live]
(push) ; 5
; [then-branch: 68 | x@49@01 != y@51@01]
(assert (not (= x@49@01 y@51@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 68 | x@49@01 == y@51@01]
(assert (= x@49@01 y@51@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@49@01 y@51@01) (not (= x@49@01 y@51@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 69 | !(b@48@01) | live]
; [else-branch: 69 | b@48@01 | live]
(push) ; 5
; [then-branch: 69 | !(b@48@01)]
(assert (not b@48@01))
(pop) ; 5
(push) ; 5
; [else-branch: 69 | b@48@01]
; [eval] y == y
(push) ; 6
; [then-branch: 70 | False | live]
; [else-branch: 70 | True | live]
(push) ; 7
; [then-branch: 70 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 70 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@48@01 (not b@48@01)))
(assert (>=
  (ite
    (and (= y@51@01 x@49@01) (= j@52@01 i@50@01))
    (/ (to_real 7) (to_real 12))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@49@01 y@51@01) (= i@50@01 j@52@01)) b@48@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@48@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 71 | b@48@01 | live]
; [else-branch: 71 | !(b@48@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 71 | b@48@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@48@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 72 | b@48@01 | live]
; [else-branch: 72 | !(b@48@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 72 | b@48@01]
; [eval] y == x && j == i
; [eval] y == x
(push) ; 6
; [then-branch: 73 | y@51@01 != x@49@01 | live]
; [else-branch: 73 | y@51@01 == x@49@01 | live]
(push) ; 7
; [then-branch: 73 | y@51@01 != x@49@01]
(assert (not (= y@51@01 x@49@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 73 | y@51@01 == x@49@01]
(assert (= y@51@01 x@49@01))
; [eval] j == i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= y@51@01 x@49@01) (not (= y@51@01 x@49@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@48@01 (or (= y@51@01 x@49@01) (not (= y@51@01 x@49@01)))))
(push) ; 4
(assert (not (=> b@48@01 (and (= y@51@01 x@49@01) (= j@52@01 i@50@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@48@01 (and (= y@51@01 x@49@01) (= j@52@01 i@50@01))))
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 74 | x@49@01 != y@51@01 | live]
; [else-branch: 74 | x@49@01 == y@51@01 | live]
(push) ; 5
; [then-branch: 74 | x@49@01 != y@51@01]
(assert (not (= x@49@01 y@51@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 74 | x@49@01 == y@51@01]
(assert (= x@49@01 y@51@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 75 | x@49@01 != y@51@01 || i@50@01 != j@52@01 | dead]
; [else-branch: 75 | !(x@49@01 != y@51@01 || i@50@01 != j@52@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 75 | !(x@49@01 != y@51@01 || i@50@01 != j@52@01)]
(assert (not (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01)))))
(pop) ; 4
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 76 | x@49@01 != y@51@01 | live]
; [else-branch: 76 | x@49@01 == y@51@01 | live]
(push) ; 5
; [then-branch: 76 | x@49@01 != y@51@01]
(assert (not (= x@49@01 y@51@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 76 | x@49@01 == y@51@01]
(assert (= x@49@01 y@51@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 77 | !(x@49@01 != y@51@01 || i@50@01 != j@52@01) | live]
; [else-branch: 77 | x@49@01 != y@51@01 || i@50@01 != j@52@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 77 | !(x@49@01 != y@51@01 || i@50@01 != j@52@01)]
(assert (not (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01)))))
; [exec]
; inhale !b
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 $Snap.unit))
; [eval] !b
(assert (not b@48@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale x != y || i != j
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 $Snap.unit))
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 78 | x@49@01 != y@51@01 | live]
; [else-branch: 78 | x@49@01 == y@51@01 | live]
(push) ; 6
; [then-branch: 78 | x@49@01 != y@51@01]
(assert (not (= x@49@01 y@51@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 78 | x@49@01 == y@51@01]
(assert (= x@49@01 y@51@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 65 | !(b@48@01)]
(assert (not b@48@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@48@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@48@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 79 | !(b@48@01) | live]
; [else-branch: 79 | b@48@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 79 | !(b@48@01)]
(assert (not b@48@01))
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@60@01 $Snap)
(assert (= $t@60@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 80 | b@48@01 | dead]
; [else-branch: 80 | !(b@48@01) | live]
(push) ; 5
; [else-branch: 80 | !(b@48@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 81 | x@49@01 != y@51@01 | live]
; [else-branch: 81 | x@49@01 == y@51@01 | live]
(push) ; 5
; [then-branch: 81 | x@49@01 != y@51@01]
(assert (not (= x@49@01 y@51@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 81 | x@49@01 == y@51@01]
(assert (= x@49@01 y@51@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@49@01 y@51@01) (not (= x@49@01 y@51@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 82 | !(b@48@01) | live]
; [else-branch: 82 | b@48@01 | live]
(push) ; 5
; [then-branch: 82 | !(b@48@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 82 | b@48@01]
(assert b@48@01)
; [eval] y == y
(push) ; 6
; [then-branch: 83 | False | live]
; [else-branch: 83 | True | live]
(push) ; 7
; [then-branch: 83 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 83 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@48@01 (not b@48@01)))
(assert (>=
  (ite
    (and (= y@51@01 x@49@01) (= j@52@01 i@50@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@49@01 y@51@01) (= i@50@01 j@52@01)) b@48@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 84 | b@48@01 | dead]
; [else-branch: 84 | !(b@48@01) | live]
(push) ; 5
; [else-branch: 84 | !(b@48@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
; [then-branch: 85 | b@48@01 | dead]
; [else-branch: 85 | !(b@48@01) | live]
(push) ; 5
; [else-branch: 85 | !(b@48@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 86 | x@49@01 != y@51@01 | live]
; [else-branch: 86 | x@49@01 == y@51@01 | live]
(push) ; 5
; [then-branch: 86 | x@49@01 != y@51@01]
(assert (not (= x@49@01 y@51@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 86 | x@49@01 == y@51@01]
(assert (= x@49@01 y@51@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 87 | x@49@01 != y@51@01 || i@50@01 != j@52@01 | live]
; [else-branch: 87 | !(x@49@01 != y@51@01 || i@50@01 != j@52@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 87 | x@49@01 != y@51@01 || i@50@01 != j@52@01]
(assert (or (not (= x@49@01 y@51@01)) (not (= i@50@01 j@52@01))))
; [exec]
; assert !b
; [eval] !b
; [exec]
; assert perm(P(y, j)) == none
; [eval] perm(P(y, j)) == none
; [eval] perm(P(y, j))
(push) ; 5
(assert (not (=
  (ite
    (and (= y@51@01 x@49@01) (= j@52@01 i@50@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (and (= y@51@01 x@49@01) (= j@52@01 i@50@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  $Perm.No))
; [exec]
; inhale !b
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 $Snap.unit))
; [eval] !b
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != y || i != j
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 $Snap.unit))
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 88 | x@49@01 != y@51@01 | live]
; [else-branch: 88 | x@49@01 == y@51@01 | live]
(push) ; 6
; [then-branch: 88 | x@49@01 != y@51@01]
(assert (not (= x@49@01 y@51@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 88 | x@49@01 == y@51@01]
(assert (= x@49@01 y@51@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01_p4 ----------
(declare-const b@65@01 Bool)
(declare-const b@66@01 Bool)
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
(declare-const x@67@01 $Ref)
; [exec]
; var i: Int
(declare-const i@68@01 Int)
; [exec]
; var y: Ref
(declare-const y@69@01 $Ref)
; [exec]
; var j: Int
(declare-const j@70@01 Int)
; [exec]
; inhale acc(P(x, i), 1 / 3)
(declare-const $t@71@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@66@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@66@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 89 | b@66@01 | live]
; [else-branch: 89 | !(b@66@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 89 | b@66@01]
(assert b@66@01)
; [exec]
; inhale acc(P(x, i), 1 / 4)
(declare-const $t@72@01 $Snap)
(assert (= $t@71@01 $t@72@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@66@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 90 | b@66@01 | live]
; [else-branch: 90 | !(b@66@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 90 | b@66@01]
; [eval] perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
; [eval] x == y && i == j
; [eval] x == y
(push) ; 6
; [then-branch: 91 | x@67@01 != y@69@01 | live]
; [else-branch: 91 | x@67@01 == y@69@01 | live]
(push) ; 7
; [then-branch: 91 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 91 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= x@67@01 y@69@01) (not (= x@67@01 y@69@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@66@01 (or (= x@67@01 y@69@01) (not (= x@67@01 y@69@01)))))
(assert (=>
  b@66@01
  (>=
    (ite
      (and (= y@69@01 x@67@01) (= j@70@01 i@68@01))
      (/ (to_real 7) (to_real 12))
      $Perm.No)
    (__iar__assume_helper_1<Perm> (and (= x@67@01 y@69@01) (= i@68@01 j@70@01)) (/
      (to_real 1)
      (to_real 3)) (/ (to_real 3) (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 92 | x@67@01 != y@69@01 | live]
; [else-branch: 92 | x@67@01 == y@69@01 | live]
(push) ; 5
; [then-branch: 92 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 92 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@67@01 y@69@01) (not (= x@67@01 y@69@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 93 | !(b@66@01) | live]
; [else-branch: 93 | b@66@01 | live]
(push) ; 5
; [then-branch: 93 | !(b@66@01)]
(assert (not b@66@01))
(pop) ; 5
(push) ; 5
; [else-branch: 93 | b@66@01]
; [eval] y == y
(push) ; 6
; [then-branch: 94 | False | live]
; [else-branch: 94 | True | live]
(push) ; 7
; [then-branch: 94 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 94 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@66@01 (not b@66@01)))
(assert (>=
  (ite
    (and (= y@69@01 x@67@01) (= j@70@01 i@68@01))
    (/ (to_real 7) (to_real 12))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@67@01 y@69@01) (= i@68@01 j@70@01)) b@66@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@66@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 95 | b@66@01 | live]
; [else-branch: 95 | !(b@66@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 95 | b@66@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@66@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 96 | b@66@01 | live]
; [else-branch: 96 | !(b@66@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 96 | b@66@01]
; [eval] y == x && j == i
; [eval] y == x
(push) ; 6
; [then-branch: 97 | y@69@01 != x@67@01 | live]
; [else-branch: 97 | y@69@01 == x@67@01 | live]
(push) ; 7
; [then-branch: 97 | y@69@01 != x@67@01]
(assert (not (= y@69@01 x@67@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 97 | y@69@01 == x@67@01]
(assert (= y@69@01 x@67@01))
; [eval] j == i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= y@69@01 x@67@01) (not (= y@69@01 x@67@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=> b@66@01 (or (= y@69@01 x@67@01) (not (= y@69@01 x@67@01)))))
(push) ; 4
(assert (not (=> b@66@01 (and (= y@69@01 x@67@01) (= j@70@01 i@68@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@66@01 (and (= y@69@01 x@67@01) (= j@70@01 i@68@01))))
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 98 | x@67@01 != y@69@01 | live]
; [else-branch: 98 | x@67@01 == y@69@01 | live]
(push) ; 5
; [then-branch: 98 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 98 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 99 | x@67@01 != y@69@01 || i@68@01 != j@70@01 | dead]
; [else-branch: 99 | !(x@67@01 != y@69@01 || i@68@01 != j@70@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 99 | !(x@67@01 != y@69@01 || i@68@01 != j@70@01)]
(assert (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01)))))
(pop) ; 4
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 100 | x@67@01 != y@69@01 | live]
; [else-branch: 100 | x@67@01 == y@69@01 | live]
(push) ; 5
; [then-branch: 100 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 100 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 101 | !(x@67@01 != y@69@01 || i@68@01 != j@70@01) | live]
; [else-branch: 101 | x@67@01 != y@69@01 || i@68@01 != j@70@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 101 | !(x@67@01 != y@69@01 || i@68@01 != j@70@01)]
(assert (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01)))))
; [exec]
; inhale !b
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 $Snap.unit))
; [eval] !b
(assert (not b@66@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale !(x != y || i != j)
(declare-const $t@77@01 $Snap)
(assert (= $t@77@01 $Snap.unit))
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 102 | x@67@01 != y@69@01 | live]
; [else-branch: 102 | x@67@01 == y@69@01 | live]
(push) ; 6
; [then-branch: 102 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 102 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 89 | !(b@66@01)]
(assert (not b@66@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@66@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@66@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 103 | !(b@66@01) | live]
; [else-branch: 103 | b@66@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 103 | !(b@66@01)]
(assert (not b@66@01))
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b ==>
;   perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 $Snap.unit))
; [eval] b ==> perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 104 | b@66@01 | dead]
; [else-branch: 104 | !(b@66@01) | live]
(push) ; 5
; [else-branch: 104 | !(b@66@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 /
;   16, 0 / 16)
(declare-const $t@80@01 $Snap)
(assert (= $t@80@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_2(x == y && i == j, b && (y == y && j == j), 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 105 | x@67@01 != y@69@01 | live]
; [else-branch: 105 | x@67@01 == y@69@01 | live]
(push) ; 5
; [then-branch: 105 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 105 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i == j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (= x@67@01 y@69@01) (not (= x@67@01 y@69@01))))
; [eval] b && (y == y && j == j)
(push) ; 4
; [then-branch: 106 | !(b@66@01) | live]
; [else-branch: 106 | b@66@01 | live]
(push) ; 5
; [then-branch: 106 | !(b@66@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 106 | b@66@01]
(assert b@66@01)
; [eval] y == y
(push) ; 6
; [then-branch: 107 | False | live]
; [else-branch: 107 | True | live]
(push) ; 7
; [then-branch: 107 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 107 | True]
; [eval] j == j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@66@01 (not b@66@01)))
(assert (>=
  (ite
    (and (= y@69@01 x@67@01) (= j@70@01 i@68@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  (__iar__assume_helper_2<Perm> (and (= x@67@01 y@69@01) (= i@68@01 j@70@01)) b@66@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i)) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(P(x, i))
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 108 | b@66@01 | dead]
; [else-branch: 108 | !(b@66@01) | live]
(push) ; 5
; [else-branch: 108 | !(b@66@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x && j == i
; [eval] b ==> y == x && j == i
(push) ; 4
; [then-branch: 109 | b@66@01 | dead]
; [else-branch: 109 | !(b@66@01) | live]
(push) ; 5
; [else-branch: 109 | !(b@66@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 110 | x@67@01 != y@69@01 | live]
; [else-branch: 110 | x@67@01 == y@69@01 | live]
(push) ; 5
; [then-branch: 110 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 110 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 111 | x@67@01 != y@69@01 || i@68@01 != j@70@01 | live]
; [else-branch: 111 | !(x@67@01 != y@69@01 || i@68@01 != j@70@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 111 | x@67@01 != y@69@01 || i@68@01 != j@70@01]
(assert (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01))))
; [exec]
; assert !b
; [eval] !b
; [exec]
; assert perm(P(y, j)) == none
; [eval] perm(P(y, j)) == none
; [eval] perm(P(y, j))
(push) ; 5
(assert (not (=
  (ite
    (and (= y@69@01 x@67@01) (= j@70@01 i@68@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  (ite
    (and (= y@69@01 x@67@01) (= j@70@01 i@68@01))
    (/ (to_real 1) (to_real 3))
    $Perm.No)
  $Perm.No))
; [exec]
; inhale !b
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 $Snap.unit))
; [eval] !b
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !(x != y || i != j)
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 $Snap.unit))
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 112 | x@67@01 != y@69@01 | live]
; [else-branch: 112 | x@67@01 == y@69@01 | live]
(push) ; 6
; [then-branch: 112 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 112 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(push) ; 4
; [else-branch: 111 | !(x@67@01 != y@69@01 || i@68@01 != j@70@01)]
(assert (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01)))))
(pop) ; 4
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(push) ; 4
; [then-branch: 113 | x@67@01 != y@69@01 | live]
; [else-branch: 113 | x@67@01 == y@69@01 | live]
(push) ; 5
; [then-branch: 113 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 113 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i != j
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 114 | !(x@67@01 != y@69@01 || i@68@01 != j@70@01) | live]
; [else-branch: 114 | x@67@01 != y@69@01 || i@68@01 != j@70@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 114 | !(x@67@01 != y@69@01 || i@68@01 != j@70@01)]
(assert (not (or (not (= x@67@01 y@69@01)) (not (= i@68@01 j@70@01)))))
; [exec]
; inhale !b
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 $Snap.unit))
; [eval] !b
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale !(x != y || i != j)
(declare-const $t@84@01 $Snap)
(assert (= $t@84@01 $Snap.unit))
; [eval] !(x != y || i != j)
; [eval] x != y || i != j
; [eval] x != y
(set-option :timeout 0)
(push) ; 5
; [then-branch: 115 | x@67@01 != y@69@01 | live]
; [else-branch: 115 | x@67@01 == y@69@01 | live]
(push) ; 6
; [then-branch: 115 | x@67@01 != y@69@01]
(assert (not (= x@67@01 y@69@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 115 | x@67@01 == y@69@01]
(assert (= x@67@01 y@69@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
