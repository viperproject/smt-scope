(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:27
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/scoped.vpr
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
(declare-fun P%trigger ($Snap $Ref) Bool)
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
; ---------- test01a ----------
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const z@2@01 $Ref)
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(declare-const z@5@01 $Ref)
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
(declare-const $t@6@01 Int)
(assert (not (= x@3@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(P(x), write)
(declare-const $t@7@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(P(x), write) in
;     perm(y.f) >= 1 / 2 &&
;     perm(z.f) >= __iar__assume_helper_1(y == z, 1 / 2, x.p))
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] (unfolding acc(P(x), write) in perm(y.f) >= 1 / 2 && perm(z.f) >= __iar__assume_helper_1(y == z, 1 / 2, x.p))
(set-option :timeout 0)
(push) ; 3
(assert (P%trigger $t@7@01 x@3@01))
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] none < x.p
(assert (< $Perm.No ($SortWrappers.$SnapTo$Perm ($Snap.first $t@7@01))))
; [eval] perm(y.f) >= 1 / 2 && perm(z.f) >= __iar__assume_helper_1(y == z, 1 / 2, x.p)
; [eval] perm(y.f) >= 1 / 2
; [eval] perm(y.f)
(push) ; 4
; [then-branch: 0 | !((y@4@01 == x@3@01 ? W : Z) >= 1/2) | live]
; [else-branch: 0 | (y@4@01 == x@3@01 ? W : Z) >= 1/2 | live]
(push) ; 5
; [then-branch: 0 | !((y@4@01 == x@3@01 ? W : Z) >= 1/2)]
(assert (not
  (>= (ite (= y@4@01 x@3@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | (y@4@01 == x@3@01 ? W : Z) >= 1/2]
(assert (>= (ite (= y@4@01 x@3@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2))))
; [eval] perm(z.f) >= __iar__assume_helper_1(y == z, 1 / 2, x.p)
; [eval] perm(z.f)
; [eval] __iar__assume_helper_1(y == z, 1 / 2, x.p)
; [eval] y == z
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (>= (ite (= y@4@01 x@3@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))
  (not
    (>= (ite (= y@4@01 x@3@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2))))))
(pop) ; 3
; Joined path conditions
(assert (and
  (P%trigger $t@7@01 x@3@01)
  (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01)))
  (= ($Snap.second $t@7@01) $Snap.unit)
  (< $Perm.No ($SortWrappers.$SnapTo$Perm ($Snap.first $t@7@01)))
  (or
    (>= (ite (= y@4@01 x@3@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))
    (not
      (>=
        (ite (= y@4@01 x@3@01) $Perm.Write $Perm.No)
        (/ (to_real 1) (to_real 2)))))))
(assert (and
  (>= (ite (= y@4@01 x@3@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))
  (>=
    (ite (= z@5@01 x@3@01) $Perm.Write $Perm.No)
    (__iar__assume_helper_1<Perm> (= y@4@01 z@5@01) (/ (to_real 1) (to_real 2)) ($SortWrappers.$SnapTo$Perm ($Snap.first $t@7@01))))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x == y && y == z
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
(assert (not (= x@3@01 y@4@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= x@3@01 y@4@01))
; [eval] y == z
(push) ; 3
(assert (not (= y@4@01 z@5@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= y@4@01 z@5@01))
(pop) ; 2
(pop) ; 1
; ---------- test01b ----------
(declare-const x@9@01 $Ref)
(declare-const y@10@01 $Ref)
(declare-const z@11@01 $Ref)
(declare-const x@12@01 $Ref)
(declare-const y@13@01 $Ref)
(declare-const z@14@01 $Ref)
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
(declare-const $t@15@01 Int)
(assert (not (= x@12@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(P(x), write)
(declare-const $t@16@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (unfolding acc(P(x), write) in
;     perm(y.f) >= 1 / 2 &&
;     perm(z.f) >= __iar__assume_helper_1(y == z, 1 / 2, x.p))
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] (unfolding acc(P(x), write) in perm(y.f) >= 1 / 2 && perm(z.f) >= __iar__assume_helper_1(y == z, 1 / 2, x.p))
(set-option :timeout 0)
(push) ; 3
(assert (P%trigger $t@16@01 x@12@01))
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.second $t@16@01) $Snap.unit))
; [eval] none < x.p
(assert (< $Perm.No ($SortWrappers.$SnapTo$Perm ($Snap.first $t@16@01))))
; [eval] perm(y.f) >= 1 / 2 && perm(z.f) >= __iar__assume_helper_1(y == z, 1 / 2, x.p)
; [eval] perm(y.f) >= 1 / 2
; [eval] perm(y.f)
(push) ; 4
; [then-branch: 1 | !((y@13@01 == x@12@01 ? W : Z) >= 1/2) | live]
; [else-branch: 1 | (y@13@01 == x@12@01 ? W : Z) >= 1/2 | live]
(push) ; 5
; [then-branch: 1 | !((y@13@01 == x@12@01 ? W : Z) >= 1/2)]
(assert (not
  (>= (ite (= y@13@01 x@12@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | (y@13@01 == x@12@01 ? W : Z) >= 1/2]
(assert (>= (ite (= y@13@01 x@12@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2))))
; [eval] perm(z.f) >= __iar__assume_helper_1(y == z, 1 / 2, x.p)
; [eval] perm(z.f)
; [eval] __iar__assume_helper_1(y == z, 1 / 2, x.p)
; [eval] y == z
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (>= (ite (= y@13@01 x@12@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))
  (not
    (>=
      (ite (= y@13@01 x@12@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2))))))
(pop) ; 3
; Joined path conditions
(assert (and
  (P%trigger $t@16@01 x@12@01)
  (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01)))
  (= ($Snap.second $t@16@01) $Snap.unit)
  (< $Perm.No ($SortWrappers.$SnapTo$Perm ($Snap.first $t@16@01)))
  (or
    (>=
      (ite (= y@13@01 x@12@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    (not
      (>=
        (ite (= y@13@01 x@12@01) $Perm.Write $Perm.No)
        (/ (to_real 1) (to_real 2)))))))
(assert (and
  (>= (ite (= y@13@01 x@12@01) $Perm.Write $Perm.No) (/ (to_real 1) (to_real 2)))
  (>=
    (ite (= z@14@01 x@12@01) $Perm.Write $Perm.No)
    (__iar__assume_helper_1<Perm> (= y@13@01 z@14@01) (/ (to_real 1) (to_real 2)) ($SortWrappers.$SnapTo$Perm ($Snap.first $t@16@01))))))
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
; ---------- test02a ----------
(declare-const x@18@01 $Ref)
(declare-const x@19@01 $Ref)
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
; inhale acc(x.r, 1 / 2)
(declare-const $t@20@01 $Ref)
(assert (not (= x@19@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let y ==
;     (x.r) in
;     perm(y.r) >= 1 / 2)
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 $Snap.unit))
; [eval] (let y == (x.r) in perm(y.r) >= 1 / 2)
(declare-const letvar@22@01 $Ref)
(assert (= (as letvar@22@01  $Ref) $t@20@01))
; [eval] perm(y.r) >= 1 / 2
; [eval] perm(y.r)
(assert (>=
  (ite (= $t@20@01 x@19@01) (/ (to_real 1) (to_real 2)) $Perm.No)
  (/ (to_real 1) (to_real 2))))
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
; ---------- test02b ----------
(declare-const x@23@01 $Ref)
(declare-const x@24@01 $Ref)
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
; inhale acc(x.r, 1 / 2)
(declare-const $t@25@01 $Ref)
(assert (not (= x@24@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let y ==
;     (x.r) in
;     perm(y.r) >= 2 / 3)
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] (let y == (x.r) in perm(y.r) >= 2 / 3)
(declare-const letvar@27@01 $Ref)
(assert (= (as letvar@27@01  $Ref) $t@25@01))
; [eval] perm(y.r) >= 2 / 3
; [eval] perm(y.r)
(assert (>=
  (ite (= $t@25@01 x@24@01) (/ (to_real 1) (to_real 2)) $Perm.No)
  (/ (to_real 2) (to_real 3))))
; State saturation: after inhale
(check-sat)
; unsat
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unsat
(pop) ; 2
(pop) ; 1
