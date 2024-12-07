(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/predicates_01.vpr
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
; ---------- test00_single ----------
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
(declare-const x@0@01 $Ref)
; [exec]
; var i: Int
(declare-const i@1@01 Int)
; [exec]
; inhale acc(P(x, i), 1 / 2)
(declare-const $t@2@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 2
; [eval] perm(P(x, i))
; State saturation: after inhale
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
(pop) ; 2
(pop) ; 1
; ---------- test00_same_tight_first ----------
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
(declare-const x@4@01 $Ref)
; [exec]
; var i: Int
(declare-const i@5@01 Int)
; [exec]
; inhale acc(P(x, i), write)
(declare-const $t@6@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 3
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >=
;   __iar__assume_helper_1(x == x && i == i, 1 / 3, 2 / 3)
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] perm(P(x, i)) >= __iar__assume_helper_1(x == x && i == i, 1 / 3, 2 / 3)
; [eval] perm(P(x, i))
; [eval] __iar__assume_helper_1(x == x && i == i, 1 / 3, 2 / 3)
; [eval] x == x && i == i
; [eval] x == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | False | live]
; [else-branch: 0 | True | live]
(push) ; 4
; [then-branch: 0 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (>=
  $Perm.Write
  (__iar__assume_helper_1<Perm> true (/ (to_real 1) (to_real 3)) (/
    (to_real 2)
    (to_real 3)))))
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
(pop) ; 2
(pop) ; 1
; ---------- test00_same_tight_second ----------
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
(declare-const x@9@01 $Ref)
; [exec]
; var i: Int
(declare-const i@10@01 Int)
; [exec]
; inhale acc(P(x, i), write)
(declare-const $t@11@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 2 / 3
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 2 / 3
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >=
;   __iar__assume_helper_1(x == x && i == i, 2 / 3, 1 / 3)
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] perm(P(x, i)) >= __iar__assume_helper_1(x == x && i == i, 2 / 3, 1 / 3)
; [eval] perm(P(x, i))
; [eval] __iar__assume_helper_1(x == x && i == i, 2 / 3, 1 / 3)
; [eval] x == x && i == i
; [eval] x == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | False | live]
; [else-branch: 1 | True | live]
(push) ; 4
; [then-branch: 1 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (>=
  $Perm.Write
  (__iar__assume_helper_1<Perm> true (/ (to_real 2) (to_real 3)) (/
    (to_real 1)
    (to_real 3)))))
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
(pop) ; 2
(pop) ; 1
; ---------- test00_same_tight_three_left_leaning ----------
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
(declare-const x@14@01 $Ref)
; [exec]
; var i: Int
(declare-const i@15@01 Int)
; [exec]
; inhale acc(P(x, i), write)
(declare-const $t@16@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 3 / 6
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 3 / 6
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >=
;   __iar__assume_helper_1(x == x && i == i, 3 / 6, 2 / 6)
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 $Snap.unit))
; [eval] perm(P(x, i)) >= __iar__assume_helper_1(x == x && i == i, 3 / 6, 2 / 6)
; [eval] perm(P(x, i))
; [eval] __iar__assume_helper_1(x == x && i == i, 3 / 6, 2 / 6)
; [eval] x == x && i == i
; [eval] x == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | False | live]
; [else-branch: 2 | True | live]
(push) ; 4
; [then-branch: 2 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (>=
  $Perm.Write
  (__iar__assume_helper_1<Perm> true (/ (to_real 1) (to_real 2)) (/
    (to_real 1)
    (to_real 3)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >=
;   __iar__assume_helper_2(x == x && i == i, x == x && i == i, 3 / 6, 2 / 6, 1 /
;   6)
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] perm(P(x, i)) >= __iar__assume_helper_2(x == x && i == i, x == x && i == i, 3 / 6, 2 / 6, 1 / 6)
; [eval] perm(P(x, i))
; [eval] __iar__assume_helper_2(x == x && i == i, x == x && i == i, 3 / 6, 2 / 6, 1 / 6)
; [eval] x == x && i == i
; [eval] x == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | False | live]
; [else-branch: 3 | True | live]
(push) ; 4
; [then-branch: 3 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
; [eval] x == x && i == i
; [eval] x == x
(push) ; 3
; [then-branch: 4 | False | live]
; [else-branch: 4 | True | live]
(push) ; 4
; [then-branch: 4 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (>=
  $Perm.Write
  (__iar__assume_helper_2<Perm> true true (/ (to_real 1) (to_real 2)) (/
    (to_real 1)
    (to_real 3)) (/ (to_real 1) (to_real 6)))))
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
(pop) ; 2
(pop) ; 1
; ---------- test00_same_tight_three_right_leaning ----------
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
(declare-const x@20@01 $Ref)
; [exec]
; var i: Int
(declare-const i@21@01 Int)
; [exec]
; inhale acc(P(x, i), write)
(declare-const $t@22@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 3 / 6
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 3 / 6
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >=
;   __iar__assume_helper_1(x == x && i == i, 3 / 6, 2 / 6)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] perm(P(x, i)) >= __iar__assume_helper_1(x == x && i == i, 3 / 6, 2 / 6)
; [eval] perm(P(x, i))
; [eval] __iar__assume_helper_1(x == x && i == i, 3 / 6, 2 / 6)
; [eval] x == x && i == i
; [eval] x == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | False | live]
; [else-branch: 5 | True | live]
(push) ; 4
; [then-branch: 5 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (>=
  $Perm.Write
  (__iar__assume_helper_1<Perm> true (/ (to_real 1) (to_real 2)) (/
    (to_real 1)
    (to_real 3)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >=
;   __iar__assume_helper_2(x == x && i == i, x == x && i == i, 3 / 6, 2 / 6, 1 /
;   6)
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] perm(P(x, i)) >= __iar__assume_helper_2(x == x && i == i, x == x && i == i, 3 / 6, 2 / 6, 1 / 6)
; [eval] perm(P(x, i))
; [eval] __iar__assume_helper_2(x == x && i == i, x == x && i == i, 3 / 6, 2 / 6, 1 / 6)
; [eval] x == x && i == i
; [eval] x == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 6 | False | live]
; [else-branch: 6 | True | live]
(push) ; 4
; [then-branch: 6 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
; [eval] x == x && i == i
; [eval] x == x
(push) ; 3
; [then-branch: 7 | False | live]
; [else-branch: 7 | True | live]
(push) ; 4
; [then-branch: 7 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 7 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (>=
  $Perm.Write
  (__iar__assume_helper_2<Perm> true true (/ (to_real 1) (to_real 2)) (/
    (to_real 1)
    (to_real 3)) (/ (to_real 1) (to_real 6)))))
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
(pop) ; 2
(pop) ; 1
; ---------- test01_diff ----------
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
(declare-const x@26@01 $Ref)
; [exec]
; var i: Int
(declare-const i@27@01 Int)
; [exec]
; var y: Ref
(declare-const y@28@01 $Ref)
; [exec]
; var j: Int
(declare-const j@29@01 Int)
; [exec]
; inhale acc(P(x, i), write)
(declare-const $t@30@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 2
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 2
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >=
;   __iar__assume_helper_1(x == y && i == j, 1 / 2, 1 / 2)
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, 1 / 2, 1 / 2)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_1(x == y && i == j, 1 / 2, 1 / 2)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | x@26@01 != y@28@01 | live]
; [else-branch: 8 | x@26@01 == y@28@01 | live]
(push) ; 4
; [then-branch: 8 | x@26@01 != y@28@01]
(assert (not (= x@26@01 y@28@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | x@26@01 == y@28@01]
(assert (= x@26@01 y@28@01))
; [eval] i == j
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= x@26@01 y@28@01) (not (= x@26@01 y@28@01))))
(assert (>=
  (ite (and (= y@28@01 x@26@01) (= j@29@01 i@27@01)) $Perm.Write $Perm.No)
  (__iar__assume_helper_1<Perm> (and (= x@26@01 y@28@01) (= i@27@01 j@29@01)) (/
    (to_real 1)
    (to_real 2)) (/ (to_real 1) (to_real 2)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
(assert (not (= x@26@01 y@28@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@26@01 y@28@01))
; [eval] i == j
(push) ; 3
(assert (not (= i@27@01 j@29@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= i@27@01 j@29@01))
; [exec]
; assert false
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
(pop) ; 2
(pop) ; 1
; ---------- test01_same1 ----------
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
(declare-const x@33@01 $Ref)
; [exec]
; var i: Int
(declare-const i@34@01 Int)
; [exec]
; inhale acc(P(x, i), 2 / 3)
(declare-const $t@35@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 2 / 5
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 2 / 5
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >=
;   __iar__assume_helper_1(x == x && i == i, 2 / 5, 3 / 5)
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] perm(P(x, i)) >= __iar__assume_helper_1(x == x && i == i, 2 / 5, 3 / 5)
; [eval] perm(P(x, i))
; [eval] __iar__assume_helper_1(x == x && i == i, 2 / 5, 3 / 5)
; [eval] x == x && i == i
; [eval] x == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | False | live]
; [else-branch: 9 | True | live]
(push) ; 4
; [then-branch: 9 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 9 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (>=
  (/ (to_real 2) (to_real 3))
  (__iar__assume_helper_1<Perm> true (/ (to_real 2) (to_real 5)) (/
    (to_real 3)
    (to_real 5)))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 2
(pop) ; 1
; ---------- test01_same2 ----------
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
(declare-const x@38@01 $Ref)
; [exec]
; var i: Int
(declare-const i@39@01 Int)
; [exec]
; inhale acc(P(x, i), write)
(declare-const $t@40@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= 1 / 2
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 $Snap.unit))
; [eval] perm(P(x, i)) >= 1 / 2
; [eval] perm(P(x, i))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >=
;   __iar__assume_helper_1(x == x && i == i, 1 / 2, 1 / 2)
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [eval] perm(P(x, i)) >= __iar__assume_helper_1(x == x && i == i, 1 / 2, 1 / 2)
; [eval] perm(P(x, i))
; [eval] __iar__assume_helper_1(x == x && i == i, 1 / 2, 1 / 2)
; [eval] x == x && i == i
; [eval] x == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 10 | False | live]
; [else-branch: 10 | True | live]
(push) ; 4
; [then-branch: 10 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 10 | True]
; [eval] i == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (>=
  $Perm.Write
  (__iar__assume_helper_1<Perm> true (/ (to_real 1) (to_real 2)) (/
    (to_real 1)
    (to_real 2)))))
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
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
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
(declare-const x@43@01 $Ref)
; [exec]
; var i: Int
(declare-const i@44@01 Int)
; [exec]
; var y: Ref
(declare-const y@45@01 $Ref)
; [exec]
; var j: Int
(declare-const j@46@01 Int)
; [exec]
; var px: Perm
(declare-const px@47@01 $Perm)
; [exec]
; var py: Perm
(declare-const py@48@01 $Perm)
; [exec]
; inhale none < px
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 $Snap.unit))
; [eval] none < px
(assert (< $Perm.No px@47@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale none < py
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 $Snap.unit))
; [eval] none < py
(assert (< $Perm.No py@48@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(P(x, i), 1 / 10)
(declare-const $t@51@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(x, i)) >= px
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 $Snap.unit))
; [eval] perm(P(x, i)) >= px
; [eval] perm(P(x, i))
(assert (>= (/ (to_real 1) (to_real 10)) px@47@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, px, py)
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, px, py)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_1(x == y && i == j, px, py)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
; [then-branch: 11 | x@43@01 != y@45@01 | live]
; [else-branch: 11 | x@43@01 == y@45@01 | live]
(push) ; 4
; [then-branch: 11 | x@43@01 != y@45@01]
(assert (not (= x@43@01 y@45@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | x@43@01 == y@45@01]
(assert (= x@43@01 y@45@01))
; [eval] i == j
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= x@43@01 y@45@01) (not (= x@43@01 y@45@01))))
(assert (>=
  (ite
    (and (= y@45@01 x@43@01) (= j@46@01 i@44@01))
    (/ (to_real 1) (to_real 10))
    $Perm.No)
  (__iar__assume_helper_1<Perm> (and (= x@43@01 y@45@01) (= i@44@01 j@46@01)) px@47@01 py@48@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert px <= 1 / 10
; [eval] px <= 1 / 10
(set-option :timeout 0)
(push) ; 3
(assert (not (<= px@47@01 (/ (to_real 1) (to_real 10)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= px@47@01 (/ (to_real 1) (to_real 10))))
; [exec]
; assert y == x && i == j
; [eval] y == x
(push) ; 3
(assert (not (= y@45@01 x@43@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= y@45@01 x@43@01))
; [eval] i == j
(push) ; 3
(assert (not (= i@44@01 j@46@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= i@44@01 j@46@01))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
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
(declare-const x@54@01 $Ref)
; [exec]
; var i: Int
(declare-const i@55@01 Int)
; [exec]
; var y: Ref
(declare-const y@56@01 $Ref)
; [exec]
; var j: Int
(declare-const j@57@01 Int)
; [exec]
; var z: Ref
(declare-const z@58@01 $Ref)
; [exec]
; var k: Int
(declare-const k@59@01 Int)
; [exec]
; var px: Perm
(declare-const px@60@01 $Perm)
; [exec]
; var py: Perm
(declare-const py@61@01 $Perm)
; [exec]
; var pz: Perm
(declare-const pz@62@01 $Perm)
; [exec]
; inhale none < px
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 $Snap.unit))
; [eval] none < px
(assert (< $Perm.No px@60@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale none < py
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 $Snap.unit))
; [eval] none < py
(assert (< $Perm.No py@61@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale none < pz
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 $Snap.unit))
; [eval] none < pz
(assert (< $Perm.No pz@62@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(P(x, i), 1 / 5) && acc(P(y, j), 1 / 10)
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 ($Snap.combine ($Snap.first $t@66@01) ($Snap.second $t@66@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and (= x@54@01 y@56@01) (= i@55@01 j@57@01))))
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
; inhale perm(P(x, i)) >= px
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] perm(P(x, i)) >= px
; [eval] perm(P(x, i))
(assert (>=
  (+
    (ite
      (and (= x@54@01 y@56@01) (= i@55@01 j@57@01))
      (/ (to_real 1) (to_real 10))
      $Perm.No)
    (/ (to_real 1) (to_real 5)))
  px@60@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, px, py)
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 $Snap.unit))
; [eval] perm(P(y, j)) >= __iar__assume_helper_1(x == y && i == j, px, py)
; [eval] perm(P(y, j))
; [eval] __iar__assume_helper_1(x == y && i == j, px, py)
; [eval] x == y && i == j
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | x@54@01 != y@56@01 | live]
; [else-branch: 12 | x@54@01 == y@56@01 | live]
(push) ; 4
; [then-branch: 12 | x@54@01 != y@56@01]
(assert (not (= x@54@01 y@56@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | x@54@01 == y@56@01]
(assert (= x@54@01 y@56@01))
; [eval] i == j
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= x@54@01 y@56@01) (not (= x@54@01 y@56@01))))
(assert (>=
  (+
    (/ (to_real 1) (to_real 10))
    (ite
      (and (= y@56@01 x@54@01) (= j@57@01 i@55@01))
      (/ (to_real 1) (to_real 5))
      $Perm.No))
  (__iar__assume_helper_1<Perm> (and (= x@54@01 y@56@01) (= i@55@01 j@57@01)) px@60@01 py@61@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(P(z, k)) >=
;   __iar__assume_helper_2(x == z && i == k, y == z && j == k, px, py, pz)
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 $Snap.unit))
; [eval] perm(P(z, k)) >= __iar__assume_helper_2(x == z && i == k, y == z && j == k, px, py, pz)
; [eval] perm(P(z, k))
; [eval] __iar__assume_helper_2(x == z && i == k, y == z && j == k, px, py, pz)
; [eval] x == z && i == k
; [eval] x == z
(set-option :timeout 0)
(push) ; 3
; [then-branch: 13 | x@54@01 != z@58@01 | live]
; [else-branch: 13 | x@54@01 == z@58@01 | live]
(push) ; 4
; [then-branch: 13 | x@54@01 != z@58@01]
(assert (not (= x@54@01 z@58@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | x@54@01 == z@58@01]
(assert (= x@54@01 z@58@01))
; [eval] i == k
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= x@54@01 z@58@01) (not (= x@54@01 z@58@01))))
; [eval] y == z && j == k
; [eval] y == z
(push) ; 3
; [then-branch: 14 | y@56@01 != z@58@01 | live]
; [else-branch: 14 | y@56@01 == z@58@01 | live]
(push) ; 4
; [then-branch: 14 | y@56@01 != z@58@01]
(assert (not (= y@56@01 z@58@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | y@56@01 == z@58@01]
(assert (= y@56@01 z@58@01))
; [eval] j == k
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= y@56@01 z@58@01) (not (= y@56@01 z@58@01))))
(assert (>=
  (+
    (ite
      (and (= z@58@01 y@56@01) (= k@59@01 j@57@01))
      (/ (to_real 1) (to_real 10))
      $Perm.No)
    (ite
      (and (= z@58@01 x@54@01) (= k@59@01 i@55@01))
      (/ (to_real 1) (to_real 5))
      $Perm.No))
  (__iar__assume_helper_2<Perm> (and (= x@54@01 z@58@01) (= i@55@01 k@59@01)) (and
    (= y@56@01 z@58@01)
    (= j@57@01 k@59@01)) px@60@01 py@61@01 pz@62@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert z == x && k == i || z == y && k == j
; [eval] z == x && k == i || z == y && k == j
; [eval] z == x && k == i
; [eval] z == x
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | z@58@01 != x@54@01 | live]
; [else-branch: 15 | z@58@01 == x@54@01 | live]
(push) ; 4
; [then-branch: 15 | z@58@01 != x@54@01]
(assert (not (= z@58@01 x@54@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | z@58@01 == x@54@01]
(assert (= z@58@01 x@54@01))
; [eval] k == i
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= z@58@01 x@54@01) (not (= z@58@01 x@54@01))))
(push) ; 3
; [then-branch: 16 | z@58@01 == x@54@01 && k@59@01 == i@55@01 | live]
; [else-branch: 16 | !(z@58@01 == x@54@01 && k@59@01 == i@55@01) | live]
(push) ; 4
; [then-branch: 16 | z@58@01 == x@54@01 && k@59@01 == i@55@01]
(assert (and (= z@58@01 x@54@01) (= k@59@01 i@55@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | !(z@58@01 == x@54@01 && k@59@01 == i@55@01)]
(assert (not (and (= z@58@01 x@54@01) (= k@59@01 i@55@01))))
; [eval] z == y && k == j
; [eval] z == y
(push) ; 5
; [then-branch: 17 | z@58@01 != y@56@01 | live]
; [else-branch: 17 | z@58@01 == y@56@01 | live]
(push) ; 6
; [then-branch: 17 | z@58@01 != y@56@01]
(assert (not (= z@58@01 y@56@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 17 | z@58@01 == y@56@01]
(assert (= z@58@01 y@56@01))
; [eval] k == j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (= z@58@01 y@56@01) (not (= z@58@01 y@56@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (and (= z@58@01 x@54@01) (= k@59@01 i@55@01)))
  (and
    (not (and (= z@58@01 x@54@01) (= k@59@01 i@55@01)))
    (or (= z@58@01 y@56@01) (not (= z@58@01 y@56@01))))))
(assert (or
  (not (and (= z@58@01 x@54@01) (= k@59@01 i@55@01)))
  (and (= z@58@01 x@54@01) (= k@59@01 i@55@01))))
(push) ; 3
(assert (not (or
  (and (= z@58@01 x@54@01) (= k@59@01 i@55@01))
  (and (= z@58@01 y@56@01) (= k@59@01 j@57@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or
  (and (= z@58@01 x@54@01) (= k@59@01 i@55@01))
  (and (= z@58@01 y@56@01) (= k@59@01 j@57@01))))
; [eval] x != y
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@54@01 y@56@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@54@01 y@56@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | x@54@01 != y@56@01 | live]
; [else-branch: 18 | x@54@01 == y@56@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 18 | x@54@01 != y@56@01]
(assert (not (= x@54@01 y@56@01)))
; [exec]
; assert px <= 1 / 5 && py <= 1 / 10
; [eval] px <= 1 / 5
(push) ; 4
(assert (not (<= px@60@01 (/ (to_real 1) (to_real 5)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= px@60@01 (/ (to_real 1) (to_real 5))))
; [eval] py <= 1 / 10
(push) ; 4
(assert (not (<= py@61@01 (/ (to_real 1) (to_real 10)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= py@61@01 (/ (to_real 1) (to_real 10))))
(pop) ; 3
(push) ; 3
; [else-branch: 18 | x@54@01 == y@56@01]
(assert (= x@54@01 y@56@01))
(pop) ; 3
; [eval] !(x != y)
; [eval] x != y
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@54@01 y@56@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@54@01 y@56@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | x@54@01 == y@56@01 | live]
; [else-branch: 19 | x@54@01 != y@56@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 19 | x@54@01 == y@56@01]
(assert (= x@54@01 y@56@01))
; [exec]
; assert px <= 3 / 10 && py <= 3 / 10
; [eval] px <= 3 / 10
(push) ; 4
(assert (not (<= px@60@01 (/ (to_real 3) (to_real 10)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= px@60@01 (/ (to_real 3) (to_real 10))))
; [eval] py <= 3 / 10
(push) ; 4
(assert (not (<= py@61@01 (/ (to_real 3) (to_real 10)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= py@61@01 (/ (to_real 3) (to_real 10))))
(pop) ; 3
(push) ; 3
; [else-branch: 19 | x@54@01 != y@56@01]
(assert (not (= x@54@01 y@56@01)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
