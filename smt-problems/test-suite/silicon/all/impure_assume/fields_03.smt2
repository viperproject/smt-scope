(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:45:17
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/fields_03.vpr
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
(declare-const a@0@01 $Ref)
(declare-const x@1@01 $Ref)
(declare-const y@2@01 $Ref)
(declare-const p@3@01 $Perm)
(declare-const q@4@01 $Perm)
(declare-const a@5@01 $Ref)
(declare-const x@6@01 $Ref)
(declare-const y@7@01 $Ref)
(declare-const p@8@01 $Perm)
(declare-const q@9@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 ($Snap.combine ($Snap.first $t@10@01) ($Snap.second $t@10@01))))
(assert (= ($Snap.first $t@10@01) $Snap.unit))
; [eval] none <= q
(assert (<= $Perm.No q@9@01))
(assert (=
  ($Snap.second $t@10@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@10@01))
    ($Snap.second ($Snap.second $t@10@01)))))
(assert (= ($Snap.first ($Snap.second $t@10@01)) $Snap.unit))
; [eval] none <= p
(assert (<= $Perm.No p@8@01))
(assert (not (= a@5@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale perm(x.f) >= p
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] perm(x.f) >= p
; [eval] perm(x.f)
(assert (>= (ite (= x@6@01 a@5@01) (/ (to_real 1) (to_real 2)) $Perm.No) p@8@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(y.f) >= __iar__assume_helper_1(x == y, p, q)
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] perm(y.f) >= __iar__assume_helper_1(x == y, p, q)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_1(x == y, p, q)
; [eval] x == y
(assert (>=
  (ite (= y@7@01 a@5@01) (/ (to_real 1) (to_real 2)) $Perm.No)
  (__iar__assume_helper_1<Perm> (= x@6@01 y@7@01) p@8@01 q@9@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert none <= p && p <= 1 / 2
; [eval] none <= p
; [eval] p <= 1 / 2
(set-option :timeout 0)
(push) ; 3
(assert (not (<= p@8@01 (/ (to_real 1) (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= p@8@01 (/ (to_real 1) (to_real 2))))
; [exec]
; assert none <= q && q <= 1 / 2
; [eval] none <= q
; [eval] q <= 1 / 2
(push) ; 3
(assert (not (<= q@9@01 (/ (to_real 1) (to_real 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= q@9@01 (/ (to_real 1) (to_real 2))))
; [exec]
; assert x == y ==> none <= q && q <= 1 / 2 - p
; [eval] x == y ==> none <= q && q <= 1 / 2 - p
; [eval] x == y
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@6@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@6@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | x@6@01 == y@7@01 | live]
; [else-branch: 0 | x@6@01 != y@7@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | x@6@01 == y@7@01]
(assert (= x@6@01 y@7@01))
; [eval] none <= q && q <= 1 / 2 - p
; [eval] none <= q
(push) ; 5
; [then-branch: 1 | !(Z <= q@9@01) | live]
; [else-branch: 1 | Z <= q@9@01 | live]
(push) ; 6
; [then-branch: 1 | !(Z <= q@9@01)]
(assert (not (<= $Perm.No q@9@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | Z <= q@9@01]
; [eval] q <= 1 / 2 - p
; [eval] 1 / 2 - p
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= $Perm.No q@9@01) (not (<= $Perm.No q@9@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | x@6@01 != y@7@01]
(assert (not (= x@6@01 y@7@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (= x@6@01 y@7@01)
  (and (= x@6@01 y@7@01) (or (<= $Perm.No q@9@01) (not (<= $Perm.No q@9@01))))))
; Joined path conditions
(assert (or (not (= x@6@01 y@7@01)) (= x@6@01 y@7@01)))
(push) ; 3
(assert (not (=>
  (= x@6@01 y@7@01)
  (and (<= $Perm.No q@9@01) (<= q@9@01 (- (/ (to_real 1) (to_real 2)) p@8@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (= x@6@01 y@7@01)
  (and (<= $Perm.No q@9@01) (<= q@9@01 (- (/ (to_real 1) (to_real 2)) p@8@01)))))
; [exec]
; assert x == y ==> none <= q && q <= p
; [eval] x == y ==> none <= q && q <= p
; [eval] x == y
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@6@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@6@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@6@01 == y@7@01 | live]
; [else-branch: 2 | x@6@01 != y@7@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | x@6@01 == y@7@01]
(assert (= x@6@01 y@7@01))
; [eval] none <= q && q <= p
; [eval] none <= q
(push) ; 5
; [then-branch: 3 | !(Z <= q@9@01) | live]
; [else-branch: 3 | Z <= q@9@01 | live]
(push) ; 6
; [then-branch: 3 | !(Z <= q@9@01)]
(assert (not (<= $Perm.No q@9@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 3 | Z <= q@9@01]
; [eval] q <= p
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= $Perm.No q@9@01) (not (<= $Perm.No q@9@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | x@6@01 != y@7@01]
(assert (not (= x@6@01 y@7@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> (= x@6@01 y@7@01) (and (<= $Perm.No q@9@01) (<= q@9@01 p@8@01)))))
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
; [eval] x == y ==> none <= q && q <= p
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@6@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@6@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | x@6@01 == y@7@01 | live]
; [else-branch: 4 | x@6@01 != y@7@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | x@6@01 == y@7@01]
(assert (= x@6@01 y@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] none <= q && q <= p
; [eval] none <= q
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | !(Z <= q@9@01) | live]
; [else-branch: 5 | Z <= q@9@01 | live]
(push) ; 6
; [then-branch: 5 | !(Z <= q@9@01)]
(assert (not (<= $Perm.No q@9@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 5 | Z <= q@9@01]
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
(assert (or (<= $Perm.No q@9@01) (not (<= $Perm.No q@9@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | x@6@01 != y@7@01]
(assert (not (= x@6@01 y@7@01)))
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
(assert (not (=> (= x@6@01 y@7@01) (and (<= $Perm.No q@9@01) (<= q@9@01 p@8@01)))))
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
; [eval] x == y ==> none <= q && q <= p
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@6@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@6@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | x@6@01 == y@7@01 | live]
; [else-branch: 6 | x@6@01 != y@7@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | x@6@01 == y@7@01]
(assert (= x@6@01 y@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] none <= q && q <= p
; [eval] none <= q
(set-option :timeout 0)
(push) ; 5
; [then-branch: 7 | !(Z <= q@9@01) | live]
; [else-branch: 7 | Z <= q@9@01 | live]
(push) ; 6
; [then-branch: 7 | !(Z <= q@9@01)]
(assert (not (<= $Perm.No q@9@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 7 | Z <= q@9@01]
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
(assert (or (<= $Perm.No q@9@01) (not (<= $Perm.No q@9@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 6 | x@6@01 != y@7@01]
(assert (not (= x@6@01 y@7@01)))
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
(assert (not (=> (= x@6@01 y@7@01) (and (<= $Perm.No q@9@01) (<= q@9@01 p@8@01)))))
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
; [eval] x == y ==> none <= q && q <= p
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= x@6@01 y@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= x@6@01 y@7@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | x@6@01 == y@7@01 | live]
; [else-branch: 8 | x@6@01 != y@7@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 8 | x@6@01 == y@7@01]
(assert (= x@6@01 y@7@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] none <= q && q <= p
; [eval] none <= q
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | !(Z <= q@9@01) | live]
; [else-branch: 9 | Z <= q@9@01 | live]
(push) ; 6
; [then-branch: 9 | !(Z <= q@9@01)]
(assert (not (<= $Perm.No q@9@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 9 | Z <= q@9@01]
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
(assert (or (<= $Perm.No q@9@01) (not (<= $Perm.No q@9@01))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 8 | x@6@01 != y@7@01]
(assert (not (= x@6@01 y@7@01)))
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
(assert (not (=> (= x@6@01 y@7@01) (and (<= $Perm.No q@9@01) (<= q@9@01 p@8@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const a@13@01 $Ref)
(declare-const x@14@01 $Ref)
(declare-const y@15@01 $Ref)
(declare-const b1@16@01 Bool)
(declare-const b2@17@01 Bool)
(declare-const a@18@01 $Ref)
(declare-const x@19@01 $Ref)
(declare-const y@20@01 $Ref)
(declare-const b1@21@01 Bool)
(declare-const b2@22@01 Bool)
(push) ; 1
(declare-const $t@23@01 Int)
(assert (not (= a@18@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale b1 ==> perm(x.f) >= write
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] b1 ==> perm(x.f) >= write
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@21@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@21@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | b1@21@01 | live]
; [else-branch: 10 | !(b1@21@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | b1@21@01]
(assert b1@21@01)
; [eval] perm(x.f) >= write
; [eval] perm(x.f)
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(b1@21@01)]
(assert (not b1@21@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b1@21@01) b1@21@01))
(assert (=> b1@21@01 (>= (ite (= x@19@01 a@18@01) $Perm.Write $Perm.No) $Perm.Write)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b2 ==>
;   perm(y.f) >= __iar__assume_helper_1(b1 && x == y, write, write)
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] b2 ==> perm(y.f) >= __iar__assume_helper_1(b1 && x == y, write, write)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@22@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@22@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | b2@22@01 | live]
; [else-branch: 11 | !(b2@22@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | b2@22@01]
(assert b2@22@01)
; [eval] perm(y.f) >= __iar__assume_helper_1(b1 && x == y, write, write)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_1(b1 && x == y, write, write)
; [eval] b1 && x == y
(push) ; 5
; [then-branch: 12 | !(b1@21@01) | live]
; [else-branch: 12 | b1@21@01 | live]
(push) ; 6
; [then-branch: 12 | !(b1@21@01)]
(assert (not b1@21@01))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | b1@21@01]
(assert b1@21@01)
; [eval] x == y
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or b1@21@01 (not b1@21@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(b2@22@01)]
(assert (not b2@22@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> b2@22@01 (and b2@22@01 (or b1@21@01 (not b1@21@01)))))
; Joined path conditions
(assert (or (not b2@22@01) b2@22@01))
(assert (=>
  b2@22@01
  (>=
    (ite (= y@20@01 a@18@01) $Perm.Write $Perm.No)
    (__iar__assume_helper_1<Perm> (and b1@21@01 (= x@19@01 y@20@01)) $Perm.Write $Perm.Write))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert b1 ==> x == a
; [eval] b1 ==> x == a
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@21@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@21@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | b1@21@01 | live]
; [else-branch: 13 | !(b1@21@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | b1@21@01]
(assert b1@21@01)
; [eval] x == a
(pop) ; 4
(push) ; 4
; [else-branch: 13 | !(b1@21@01)]
(assert (not b1@21@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> b1@21@01 (= x@19@01 a@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> b1@21@01 (= x@19@01 a@18@01)))
; [exec]
; assert b2 ==> y == a
; [eval] b2 ==> y == a
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@22@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@22@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | b2@22@01 | live]
; [else-branch: 14 | !(b2@22@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 14 | b2@22@01]
(assert b2@22@01)
; [eval] y == a
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(b2@22@01)]
(assert (not b2@22@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> b2@22@01 (= y@20@01 a@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> b2@22@01 (= y@20@01 a@18@01)))
; [exec]
; assert b1 && b2 ==> false
; [eval] b1 && b2 ==> false
; [eval] b1 && b2
(push) ; 3
; [then-branch: 15 | !(b1@21@01) | live]
; [else-branch: 15 | b1@21@01 | live]
(push) ; 4
; [then-branch: 15 | !(b1@21@01)]
(assert (not b1@21@01))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | b1@21@01]
(assert b1@21@01)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or b1@21@01 (not b1@21@01)))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and b1@21@01 b2@22@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | b1@21@01 && b2@22@01 | dead]
; [else-branch: 16 | !(b1@21@01 && b2@22@01) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 16 | !(b1@21@01 && b2@22@01)]
(assert (not (and b1@21@01 b2@22@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (and b1@21@01 b2@22@01)))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const a@26@01 $Ref)
(declare-const x@27@01 $Ref)
(declare-const y@28@01 $Ref)
(declare-const b1@29@01 Bool)
(declare-const b2@30@01 Bool)
(declare-const a@31@01 $Ref)
(declare-const x@32@01 $Ref)
(declare-const y@33@01 $Ref)
(declare-const b1@34@01 Bool)
(declare-const b2@35@01 Bool)
(push) ; 1
(declare-const $t@36@01 Int)
(assert (not (= a@31@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale b1 ==> perm(x.f) >= write
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] b1 ==> perm(x.f) >= write
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b1@34@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b1@34@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | b1@34@01 | live]
; [else-branch: 17 | !(b1@34@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | b1@34@01]
(assert b1@34@01)
; [eval] perm(x.f) >= write
; [eval] perm(x.f)
(pop) ; 4
(push) ; 4
; [else-branch: 17 | !(b1@34@01)]
(assert (not b1@34@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not b1@34@01) b1@34@01))
(assert (=> b1@34@01 (>= (ite (= x@32@01 a@31@01) $Perm.Write $Perm.No) $Perm.Write)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b2 ==>
;   perm(y.f) >= __iar__assume_helper_1(b1 && x == y, write, write)
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 $Snap.unit))
; [eval] b2 ==> perm(y.f) >= __iar__assume_helper_1(b1 && x == y, write, write)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@35@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@35@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | b2@35@01 | live]
; [else-branch: 18 | !(b2@35@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | b2@35@01]
(assert b2@35@01)
; [eval] perm(y.f) >= __iar__assume_helper_1(b1 && x == y, write, write)
; [eval] perm(y.f)
; [eval] __iar__assume_helper_1(b1 && x == y, write, write)
; [eval] b1 && x == y
(push) ; 5
; [then-branch: 19 | !(b1@34@01) | live]
; [else-branch: 19 | b1@34@01 | live]
(push) ; 6
; [then-branch: 19 | !(b1@34@01)]
(assert (not b1@34@01))
(pop) ; 6
(push) ; 6
; [else-branch: 19 | b1@34@01]
(assert b1@34@01)
; [eval] x == y
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or b1@34@01 (not b1@34@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | !(b2@35@01)]
(assert (not b2@35@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=> b2@35@01 (and b2@35@01 (or b1@34@01 (not b1@34@01)))))
; Joined path conditions
(assert (or (not b2@35@01) b2@35@01))
(assert (=>
  b2@35@01
  (>=
    (ite (= y@33@01 a@31@01) $Perm.Write $Perm.No)
    (__iar__assume_helper_1<Perm> (and b1@34@01 (= x@32@01 y@33@01)) $Perm.Write $Perm.Write))))
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
(assert (not (not b2@35@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@35@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | b2@35@01 | live]
; [else-branch: 20 | !(b2@35@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | b2@35@01]
(assert b2@35@01)
(pop) ; 4
(push) ; 4
; [else-branch: 20 | !(b2@35@01)]
(assert (not b2@35@01))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(assert (not (=> b2@35@01 false)))
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
(assert (not (not b2@35@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@35@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | b2@35@01 | live]
; [else-branch: 21 | !(b2@35@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 21 | b2@35@01]
(assert b2@35@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 21 | !(b2@35@01)]
(assert (not b2@35@01))
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
(assert (not (=> b2@35@01 false)))
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
(assert (not (not b2@35@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@35@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | b2@35@01 | live]
; [else-branch: 22 | !(b2@35@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 22 | b2@35@01]
(assert b2@35@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 22 | !(b2@35@01)]
(assert (not b2@35@01))
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
(assert (not (=> b2@35@01 false)))
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
(assert (not (not b2@35@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@35@01))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | b2@35@01 | live]
; [else-branch: 23 | !(b2@35@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | b2@35@01]
(assert b2@35@01)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 23 | !(b2@35@01)]
(assert (not b2@35@01))
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
(assert (not (=> b2@35@01 false)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
