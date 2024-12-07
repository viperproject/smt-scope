(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/fields_02.vpr
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
; var y: Ref
(declare-const y@3@01 $Ref)
; [exec]
; inhale acc(x.f, 1 / 3)
(declare-const $t@4@01 Int)
(assert (not (= x@2@01 $Ref.null)))
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
; inhale acc(x.f, 1 / 4)
(declare-const $t@5@01 Int)
(assert (= $t@4@01 $t@5@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
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
; [eval] perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] x == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  b@1@01
  (>=
    (ite (= y@3@01 x@2@01) (/ (to_real 7) (to_real 12)) $Perm.No)
    (__iar__assume_helper_1<Perm> (= x@2@01 y@3@01) (/ (to_real 1) (to_real 3)) (/
      (to_real 3)
      (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | !(b@1@01) | live]
; [else-branch: 2 | b@1@01 | live]
(push) ; 5
; [then-branch: 2 | !(b@1@01)]
(assert (not b@1@01))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | b@1@01]
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@1@01 (not b@1@01)))
(assert (>=
  (ite (= y@3@01 x@2@01) (/ (to_real 7) (to_real 12)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@2@01 y@3@01) b@1@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
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
; [then-branch: 3 | b@1@01 | live]
; [else-branch: 3 | !(b@1@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | b@1@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@1@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | b@1@01 | live]
; [else-branch: 4 | !(b@1@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 4 | b@1@01]
; [eval] y == x
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> b@1@01 (= y@3@01 x@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@1@01 (= y@3@01 x@2@01)))
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | x@2@01 != y@3@01 | dead]
; [else-branch: 5 | x@2@01 == y@3@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | x@2@01 == y@3@01]
(assert (= x@2@01 y@3@01))
(pop) ; 4
; [eval] !(x != y)
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@2@01 y@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | x@2@01 == y@3@01 | live]
; [else-branch: 6 | x@2@01 != y@3@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | x@2@01 == y@3@01]
(assert (= x@2@01 y@3@01))
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
; [then-branch: 7 | !(b@1@01) | live]
; [else-branch: 7 | b@1@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 7 | !(b@1@01)]
(assert (not b@1@01))
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | b@1@01 | dead]
; [else-branch: 8 | !(b@1@01) | live]
(push) ; 5
; [else-branch: 8 | !(b@1@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | !(b@1@01) | live]
; [else-branch: 9 | b@1@01 | live]
(push) ; 5
; [then-branch: 9 | !(b@1@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 9 | b@1@01]
(assert b@1@01)
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@1@01 (not b@1@01)))
(assert (>=
  (ite (= y@3@01 x@2@01) (/ (to_real 1) (to_real 3)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@2@01 y@3@01) b@1@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | b@1@01 | dead]
; [else-branch: 10 | !(b@1@01) | live]
(push) ; 5
; [else-branch: 10 | !(b@1@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
; [then-branch: 11 | b@1@01 | dead]
; [else-branch: 11 | !(b@1@01) | live]
(push) ; 5
; [else-branch: 11 | !(b@1@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@2@01 y@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | x@2@01 != y@3@01 | live]
; [else-branch: 12 | x@2@01 == y@3@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 12 | x@2@01 != y@3@01]
(assert (not (= x@2@01 y@3@01)))
; [exec]
; assert !b
; [eval] !b
; [exec]
; assert perm(y.f) == none
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(push) ; 5
(assert (not (= (ite (= y@3@01 x@2@01) (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= (ite (= y@3@01 x@2@01) (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | x@2@01 == y@3@01]
(assert (= x@2@01 y@3@01))
(pop) ; 4
; [eval] !(x != y)
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@2@01 y@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@2@01 y@3@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | x@2@01 == y@3@01 | live]
; [else-branch: 13 | x@2@01 != y@3@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | x@2@01 == y@3@01]
(assert (= x@2@01 y@3@01))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | x@2@01 != y@3@01]
(assert (not (= x@2@01 y@3@01)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 7 | b@1@01]
(assert b@1@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01_p1 ----------
(declare-const b@12@01 Bool)
(declare-const b@13@01 Bool)
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
; var y: Ref
(declare-const y@15@01 $Ref)
; [exec]
; inhale acc(x.f, 1 / 3)
(declare-const $t@16@01 Int)
(assert (not (= x@14@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@13@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | b@13@01 | live]
; [else-branch: 14 | !(b@13@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | b@13@01]
(assert b@13@01)
; [exec]
; inhale acc(x.f, 1 / 4)
(declare-const $t@17@01 Int)
(assert (= $t@16@01 $t@17@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | b@13@01 | live]
; [else-branch: 15 | !(b@13@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | b@13@01]
; [eval] perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] x == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  b@13@01
  (>=
    (ite (= y@15@01 x@14@01) (/ (to_real 7) (to_real 12)) $Perm.No)
    (__iar__assume_helper_1<Perm> (= x@14@01 y@15@01) (/ (to_real 1) (to_real 3)) (/
      (to_real 3)
      (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | !(b@13@01) | live]
; [else-branch: 16 | b@13@01 | live]
(push) ; 5
; [then-branch: 16 | !(b@13@01)]
(assert (not b@13@01))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | b@13@01]
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@13@01 (not b@13@01)))
(assert (>=
  (ite (= y@15@01 x@14@01) (/ (to_real 7) (to_real 12)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@14@01 y@15@01) b@13@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | b@13@01 | live]
; [else-branch: 17 | !(b@13@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | b@13@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@13@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | b@13@01 | live]
; [else-branch: 18 | !(b@13@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | b@13@01]
; [eval] y == x
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> b@13@01 (= y@15@01 x@14@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@13@01 (= y@15@01 x@14@01)))
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@14@01 y@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | x@14@01 != y@15@01 | dead]
; [else-branch: 19 | x@14@01 == y@15@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 19 | x@14@01 == y@15@01]
(assert (= x@14@01 y@15@01))
(pop) ; 4
; [eval] !(x != y)
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@14@01 y@15@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@14@01 y@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | x@14@01 == y@15@01 | live]
; [else-branch: 20 | x@14@01 != y@15@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | x@14@01 == y@15@01]
(assert (= x@14@01 y@15@01))
; [exec]
; inhale b
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != y
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@14@01 y@15@01)))
; State saturation: after inhale
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
; [else-branch: 14 | !(b@13@01)]
(assert (not b@13@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@13@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | !(b@13@01) | live]
; [else-branch: 21 | b@13@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 21 | !(b@13@01)]
(assert (not b@13@01))
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | b@13@01 | dead]
; [else-branch: 22 | !(b@13@01) | live]
(push) ; 5
; [else-branch: 22 | !(b@13@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | !(b@13@01) | live]
; [else-branch: 23 | b@13@01 | live]
(push) ; 5
; [then-branch: 23 | !(b@13@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 23 | b@13@01]
(assert b@13@01)
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@13@01 (not b@13@01)))
(assert (>=
  (ite (= y@15@01 x@14@01) (/ (to_real 1) (to_real 3)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@14@01 y@15@01) b@13@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 24 | b@13@01 | dead]
; [else-branch: 24 | !(b@13@01) | live]
(push) ; 5
; [else-branch: 24 | !(b@13@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
; [then-branch: 25 | b@13@01 | dead]
; [else-branch: 25 | !(b@13@01) | live]
(push) ; 5
; [else-branch: 25 | !(b@13@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@14@01 y@15@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@14@01 y@15@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | x@14@01 != y@15@01 | live]
; [else-branch: 26 | x@14@01 == y@15@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 26 | x@14@01 != y@15@01]
(assert (not (= x@14@01 y@15@01)))
; [exec]
; assert !b
; [eval] !b
; [exec]
; assert perm(y.f) == none
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(push) ; 5
(assert (not (= (ite (= y@15@01 x@14@01) (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= (ite (= y@15@01 x@14@01) (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No))
; [exec]
; inhale b
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
(assert b@13@01)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale x != y
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 $Snap.unit))
; [eval] x != y
; State saturation: after inhale
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(push) ; 4
; [else-branch: 26 | x@14@01 == y@15@01]
(assert (= x@14@01 y@15@01))
(pop) ; 4
; [eval] !(x != y)
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@14@01 y@15@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@14@01 y@15@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | x@14@01 == y@15@01 | live]
; [else-branch: 27 | x@14@01 != y@15@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 27 | x@14@01 == y@15@01]
(assert (= x@14@01 y@15@01))
; [exec]
; inhale b
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
(assert b@13@01)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale x != y
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@14@01 y@15@01)))
; State saturation: after inhale
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(push) ; 4
; [else-branch: 27 | x@14@01 != y@15@01]
(assert (not (= x@14@01 y@15@01)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 21 | b@13@01]
(assert b@13@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01_p2 ----------
(declare-const b@30@01 Bool)
(declare-const b@31@01 Bool)
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
(declare-const x@32@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@33@01 $Ref)
; [exec]
; inhale acc(x.f, 1 / 3)
(declare-const $t@34@01 Int)
(assert (not (= x@32@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@31@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@31@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | b@31@01 | live]
; [else-branch: 28 | !(b@31@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 28 | b@31@01]
(assert b@31@01)
; [exec]
; inhale acc(x.f, 1 / 4)
(declare-const $t@35@01 Int)
(assert (= $t@34@01 $t@35@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@31@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | b@31@01 | live]
; [else-branch: 29 | !(b@31@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 29 | b@31@01]
; [eval] perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] x == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  b@31@01
  (>=
    (ite (= y@33@01 x@32@01) (/ (to_real 7) (to_real 12)) $Perm.No)
    (__iar__assume_helper_1<Perm> (= x@32@01 y@33@01) (/ (to_real 1) (to_real 3)) (/
      (to_real 3)
      (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 30 | !(b@31@01) | live]
; [else-branch: 30 | b@31@01 | live]
(push) ; 5
; [then-branch: 30 | !(b@31@01)]
(assert (not b@31@01))
(pop) ; 5
(push) ; 5
; [else-branch: 30 | b@31@01]
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@31@01 (not b@31@01)))
(assert (>=
  (ite (= y@33@01 x@32@01) (/ (to_real 7) (to_real 12)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@32@01 y@33@01) b@31@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@31@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | b@31@01 | live]
; [else-branch: 31 | !(b@31@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 31 | b@31@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@31@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | b@31@01 | live]
; [else-branch: 32 | !(b@31@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 32 | b@31@01]
; [eval] y == x
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> b@31@01 (= y@33@01 x@32@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@31@01 (= y@33@01 x@32@01)))
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@32@01 y@33@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | x@32@01 != y@33@01 | dead]
; [else-branch: 33 | x@32@01 == y@33@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 33 | x@32@01 == y@33@01]
(assert (= x@32@01 y@33@01))
(pop) ; 4
; [eval] !(x != y)
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@32@01 y@33@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@32@01 y@33@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | x@32@01 == y@33@01 | live]
; [else-branch: 34 | x@32@01 != y@33@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 34 | x@32@01 == y@33@01]
(assert (= x@32@01 y@33@01))
; [exec]
; inhale b
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 $Snap.unit))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x == y
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 $Snap.unit))
; [eval] x == y
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
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01_p3 ----------
(declare-const b@41@01 Bool)
(declare-const b@42@01 Bool)
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
; var y: Ref
(declare-const y@44@01 $Ref)
; [exec]
; inhale acc(x.f, 1 / 3)
(declare-const $t@45@01 Int)
(assert (not (= x@43@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@42@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | b@42@01 | live]
; [else-branch: 35 | !(b@42@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 35 | b@42@01]
(assert b@42@01)
; [exec]
; inhale acc(x.f, 1 / 4)
(declare-const $t@46@01 Int)
(assert (= $t@45@01 $t@46@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@42@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | b@42@01 | live]
; [else-branch: 36 | !(b@42@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 36 | b@42@01]
; [eval] perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] x == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  b@42@01
  (>=
    (ite (= y@44@01 x@43@01) (/ (to_real 7) (to_real 12)) $Perm.No)
    (__iar__assume_helper_1<Perm> (= x@43@01 y@44@01) (/ (to_real 1) (to_real 3)) (/
      (to_real 3)
      (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 37 | !(b@42@01) | live]
; [else-branch: 37 | b@42@01 | live]
(push) ; 5
; [then-branch: 37 | !(b@42@01)]
(assert (not b@42@01))
(pop) ; 5
(push) ; 5
; [else-branch: 37 | b@42@01]
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@42@01 (not b@42@01)))
(assert (>=
  (ite (= y@44@01 x@43@01) (/ (to_real 7) (to_real 12)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@43@01 y@44@01) b@42@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@42@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | b@42@01 | live]
; [else-branch: 38 | !(b@42@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | b@42@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@42@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | b@42@01 | live]
; [else-branch: 39 | !(b@42@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 39 | b@42@01]
; [eval] y == x
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> b@42@01 (= y@44@01 x@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@42@01 (= y@44@01 x@43@01)))
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@43@01 y@44@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | x@43@01 != y@44@01 | dead]
; [else-branch: 40 | x@43@01 == y@44@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 40 | x@43@01 == y@44@01]
(assert (= x@43@01 y@44@01))
(pop) ; 4
; [eval] !(x != y)
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@43@01 y@44@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@43@01 y@44@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | x@43@01 == y@44@01 | live]
; [else-branch: 41 | x@43@01 != y@44@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 41 | x@43@01 == y@44@01]
(assert (= x@43@01 y@44@01))
; [exec]
; inhale !b
(declare-const $t@50@01 $Snap)
(assert (= $t@50@01 $Snap.unit))
; [eval] !b
(assert (not b@42@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale x != y
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@43@01 y@44@01)))
; State saturation: after inhale
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
; [else-branch: 35 | !(b@42@01)]
(assert (not b@42@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@42@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@42@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | !(b@42@01) | live]
; [else-branch: 42 | b@42@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 42 | !(b@42@01)]
(assert (not b@42@01))
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 43 | b@42@01 | dead]
; [else-branch: 43 | !(b@42@01) | live]
(push) ; 5
; [else-branch: 43 | !(b@42@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 44 | !(b@42@01) | live]
; [else-branch: 44 | b@42@01 | live]
(push) ; 5
; [then-branch: 44 | !(b@42@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 44 | b@42@01]
(assert b@42@01)
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@42@01 (not b@42@01)))
(assert (>=
  (ite (= y@44@01 x@43@01) (/ (to_real 1) (to_real 3)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@43@01 y@44@01) b@42@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 45 | b@42@01 | dead]
; [else-branch: 45 | !(b@42@01) | live]
(push) ; 5
; [else-branch: 45 | !(b@42@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
; [then-branch: 46 | b@42@01 | dead]
; [else-branch: 46 | !(b@42@01) | live]
(push) ; 5
; [else-branch: 46 | !(b@42@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@43@01 y@44@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@43@01 y@44@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | x@43@01 != y@44@01 | live]
; [else-branch: 47 | x@43@01 == y@44@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 47 | x@43@01 != y@44@01]
(assert (not (= x@43@01 y@44@01)))
; [exec]
; assert !b
; [eval] !b
; [exec]
; assert perm(y.f) == none
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(push) ; 5
(assert (not (= (ite (= y@44@01 x@43@01) (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= (ite (= y@44@01 x@43@01) (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No))
; [exec]
; inhale !b
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 $Snap.unit))
; [eval] !b
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != y
(declare-const $t@56@01 $Snap)
(assert (= $t@56@01 $Snap.unit))
; [eval] x != y
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
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test01_p4 ----------
(declare-const b@57@01 Bool)
(declare-const b@58@01 Bool)
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
(declare-const x@59@01 $Ref)
; [exec]
; var y: Ref
(declare-const y@60@01 $Ref)
; [exec]
; inhale acc(x.f, 1 / 3)
(declare-const $t@61@01 Int)
(assert (not (= x@59@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@58@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@58@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | b@58@01 | live]
; [else-branch: 48 | !(b@58@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 48 | b@58@01]
(assert b@58@01)
; [exec]
; inhale acc(x.f, 1 / 4)
(declare-const $t@62@01 Int)
(assert (= $t@61@01 $t@62@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | b@58@01 | live]
; [else-branch: 49 | !(b@58@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 49 | b@58@01]
; [eval] perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
; [eval] x == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  b@58@01
  (>=
    (ite (= y@60@01 x@59@01) (/ (to_real 7) (to_real 12)) $Perm.No)
    (__iar__assume_helper_1<Perm> (= x@59@01 y@60@01) (/ (to_real 1) (to_real 3)) (/
      (to_real 3)
      (to_real 16))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 50 | !(b@58@01) | live]
; [else-branch: 50 | b@58@01 | live]
(push) ; 5
; [then-branch: 50 | !(b@58@01)]
(assert (not b@58@01))
(pop) ; 5
(push) ; 5
; [else-branch: 50 | b@58@01]
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@58@01 (not b@58@01)))
(assert (>=
  (ite (= y@60@01 x@59@01) (/ (to_real 7) (to_real 12)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@59@01 y@60@01) b@58@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 51 | b@58@01 | live]
; [else-branch: 51 | !(b@58@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 51 | b@58@01]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not b@58@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | b@58@01 | live]
; [else-branch: 52 | !(b@58@01) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 52 | b@58@01]
; [eval] y == x
(pop) ; 5
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=> b@58@01 (= y@60@01 x@59@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=> b@58@01 (= y@60@01 x@59@01)))
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@59@01 y@60@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | x@59@01 != y@60@01 | dead]
; [else-branch: 53 | x@59@01 == y@60@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 53 | x@59@01 == y@60@01]
(assert (= x@59@01 y@60@01))
(pop) ; 4
; [eval] !(x != y)
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@59@01 y@60@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@59@01 y@60@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 54 | x@59@01 == y@60@01 | live]
; [else-branch: 54 | x@59@01 != y@60@01 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 54 | x@59@01 == y@60@01]
(assert (= x@59@01 y@60@01))
; [exec]
; inhale !b
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 $Snap.unit))
; [eval] !b
(assert (not b@58@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unsat
; [exec]
; inhale x == y
(declare-const $t@67@01 $Snap)
(assert (= $t@67@01 $Snap.unit))
; [eval] x == y
; State saturation: after inhale
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
; [else-branch: 48 | !(b@58@01)]
(assert (not b@58@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@58@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@58@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 55 | !(b@58@01) | live]
; [else-branch: 55 | b@58@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 55 | !(b@58@01)]
(assert (not b@58@01))
; [exec]
; inhale perm(x.f) >= 1 / 3
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 $Snap.unit))
; [eval] perm(x.f) >= 1 / 3
; [eval] perm(x.f)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 $Snap.unit))
; [eval] b ==> perm(y.f) >= __iar__assume_helper_1(x == y, 1 / 3, 3 / 16)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 56 | b@58@01 | dead]
; [else-branch: 56 | !(b@58@01) | live]
(push) ; 5
; [else-branch: 56 | !(b@58@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >=
;   __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_2(x == y, b && y == y, 1 / 3, 3 / 16, 0 / 16)
; [eval] x == y
; [eval] b && y == y
(set-option :timeout 0)
(push) ; 4
; [then-branch: 57 | !(b@58@01) | live]
; [else-branch: 57 | b@58@01 | live]
(push) ; 5
; [then-branch: 57 | !(b@58@01)]
(pop) ; 5
(push) ; 5
; [else-branch: 57 | b@58@01]
(assert b@58@01)
; [eval] y == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or b@58@01 (not b@58@01)))
(assert (>=
  (ite (= y@60@01 x@59@01) (/ (to_real 1) (to_real 3)) $Perm.No)
  (__iar__assume_helper_2<Perm> (= x@59@01 y@60@01) b@58@01 (/
    (to_real 1)
    (to_real 3)) (/ (to_real 3) (to_real 16)) $Perm.No)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f) == 1 / 3 + (b ? 1 / 4 : none)
; [eval] perm(x.f)
; [eval] 1 / 3 + (b ? 1 / 4 : none)
; [eval] (b ? 1 / 4 : none)
(set-option :timeout 0)
(push) ; 4
; [then-branch: 58 | b@58@01 | dead]
; [else-branch: 58 | !(b@58@01) | live]
(push) ; 5
; [else-branch: 58 | !(b@58@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [exec]
; assert b ==> y == x
; [eval] b ==> y == x
(push) ; 4
; [then-branch: 59 | b@58@01 | dead]
; [else-branch: 59 | !(b@58@01) | live]
(push) ; 5
; [else-branch: 59 | !(b@58@01)]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@59@01 y@60@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@59@01 y@60@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 60 | x@59@01 != y@60@01 | live]
; [else-branch: 60 | x@59@01 == y@60@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 60 | x@59@01 != y@60@01]
(assert (not (= x@59@01 y@60@01)))
; [exec]
; assert !b
; [eval] !b
; [exec]
; assert perm(y.f) == none
; [eval] perm(y.f) == none
; [eval] perm(y.f)
(push) ; 5
(assert (not (= (ite (= y@60@01 x@59@01) (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= (ite (= y@60@01 x@59@01) (/ (to_real 1) (to_real 3)) $Perm.No) $Perm.No))
; [exec]
; inhale !b
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 $Snap.unit))
; [eval] !b
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x == y
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 $Snap.unit))
; [eval] x == y
(assert (= x@59@01 y@60@01))
; State saturation: after inhale
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 4
(push) ; 4
; [else-branch: 60 | x@59@01 == y@60@01]
(assert (= x@59@01 y@60@01))
(pop) ; 4
; [eval] !(x != y)
; [eval] x != y
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@59@01 y@60@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@59@01 y@60@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 61 | x@59@01 == y@60@01 | live]
; [else-branch: 61 | x@59@01 != y@60@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 61 | x@59@01 == y@60@01]
(assert (= x@59@01 y@60@01))
; [exec]
; inhale !b
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 $Snap.unit))
; [eval] !b
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x == y
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [eval] x == y
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
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
