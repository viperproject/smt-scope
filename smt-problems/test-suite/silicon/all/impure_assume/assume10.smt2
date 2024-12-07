(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:57
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/impure_assume/assume10.vpr
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
(declare-fun __iar__assume_helper_3<Perm> (Bool Bool Bool $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_4<Perm> (Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_5<Perm> (Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_6<Perm> (Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_7<Perm> (Bool Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_8<Perm> (Bool Bool Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_9<Perm> (Bool Bool Bool Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
(declare-fun __iar__assume_helper_10<Perm> (Bool Bool Bool Bool Bool Bool Bool Bool Bool Bool $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm $Perm) $Perm)
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
(assert (forall ((c_3 Bool) (c_2 Bool) (c_1 Bool) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_3<Perm> c_3 c_2 c_1 p_3 p_2 p_1 p_0)
    (+
      (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
      (ite c_3 p_3 $Perm.No)))
  :pattern ((__iar__assume_helper_3<Perm> c_3 c_2 c_1 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_3_axiom|)))
(assert (forall ((c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_4<Perm> c_4 c_3 c_2 c_1 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
        (ite c_3 p_3 $Perm.No))
      (ite c_4 p_4 $Perm.No)))
  :pattern ((__iar__assume_helper_4<Perm> c_4 c_3 c_2 c_1 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_4_axiom|)))
(assert (forall ((c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_5<Perm> c_5 c_4 c_3 c_2 c_1 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
          (ite c_3 p_3 $Perm.No))
        (ite c_4 p_4 $Perm.No))
      (ite c_5 p_5 $Perm.No)))
  :pattern ((__iar__assume_helper_5<Perm> c_5 c_4 c_3 c_2 c_1 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_5_axiom|)))
(assert (forall ((c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_6<Perm> c_6 c_5 c_4 c_3 c_2 c_1 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
            (ite c_3 p_3 $Perm.No))
          (ite c_4 p_4 $Perm.No))
        (ite c_5 p_5 $Perm.No))
      (ite c_6 p_6 $Perm.No)))
  :pattern ((__iar__assume_helper_6<Perm> c_6 c_5 c_4 c_3 c_2 c_1 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_6_axiom|)))
(assert (forall ((c_7 Bool) (c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_7 $Perm) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_7<Perm> c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+
              (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
              (ite c_3 p_3 $Perm.No))
            (ite c_4 p_4 $Perm.No))
          (ite c_5 p_5 $Perm.No))
        (ite c_6 p_6 $Perm.No))
      (ite c_7 p_7 $Perm.No)))
  :pattern ((__iar__assume_helper_7<Perm> c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_7_axiom|)))
(assert (forall ((c_8 Bool) (c_7 Bool) (c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_8 $Perm) (p_7 $Perm) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_8<Perm> c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+
              (+
                (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
                (ite c_3 p_3 $Perm.No))
              (ite c_4 p_4 $Perm.No))
            (ite c_5 p_5 $Perm.No))
          (ite c_6 p_6 $Perm.No))
        (ite c_7 p_7 $Perm.No))
      (ite c_8 p_8 $Perm.No)))
  :pattern ((__iar__assume_helper_8<Perm> c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_8_axiom|)))
(assert (forall ((c_9 Bool) (c_8 Bool) (c_7 Bool) (c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_9 $Perm) (p_8 $Perm) (p_7 $Perm) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_9<Perm> c_9 c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_9 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+
              (+
                (+
                  (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
                  (ite c_3 p_3 $Perm.No))
                (ite c_4 p_4 $Perm.No))
              (ite c_5 p_5 $Perm.No))
            (ite c_6 p_6 $Perm.No))
          (ite c_7 p_7 $Perm.No))
        (ite c_8 p_8 $Perm.No))
      (ite c_9 p_9 $Perm.No)))
  :pattern ((__iar__assume_helper_9<Perm> c_9 c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_9 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_9_axiom|)))
(assert (forall ((c_10 Bool) (c_9 Bool) (c_8 Bool) (c_7 Bool) (c_6 Bool) (c_5 Bool) (c_4 Bool) (c_3 Bool) (c_2 Bool) (c_1 Bool) (p_10 $Perm) (p_9 $Perm) (p_8 $Perm) (p_7 $Perm) (p_6 $Perm) (p_5 $Perm) (p_4 $Perm) (p_3 $Perm) (p_2 $Perm) (p_1 $Perm) (p_0 $Perm)) (!
  (=
    (__iar__assume_helper_10<Perm> c_10 c_9 c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_10 p_9 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0)
    (+
      (+
        (+
          (+
            (+
              (+
                (+
                  (+
                    (+ (+ p_0 (ite c_1 p_1 $Perm.No)) (ite c_2 p_2 $Perm.No))
                    (ite c_3 p_3 $Perm.No))
                  (ite c_4 p_4 $Perm.No))
                (ite c_5 p_5 $Perm.No))
              (ite c_6 p_6 $Perm.No))
            (ite c_7 p_7 $Perm.No))
          (ite c_8 p_8 $Perm.No))
        (ite c_9 p_9 $Perm.No))
      (ite c_10 p_10 $Perm.No)))
  :pattern ((__iar__assume_helper_10<Perm> c_10 c_9 c_8 c_7 c_6 c_5 c_4 c_3 c_2 c_1 p_10 p_9 p_8 p_7 p_6 p_5 p_4 p_3 p_2 p_1 p_0))
  :qid |prog.__iar__assume_helper_10_axiom|)))
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
; ---------- m ----------
(declare-const x1@0@01 $Ref)
(declare-const x2@1@01 $Ref)
(declare-const x3@2@01 $Ref)
(declare-const x4@3@01 $Ref)
(declare-const x5@4@01 $Ref)
(declare-const x6@5@01 $Ref)
(declare-const x7@6@01 $Ref)
(declare-const x8@7@01 $Ref)
(declare-const x9@8@01 $Ref)
(declare-const x10@9@01 $Ref)
(declare-const x11@10@01 $Ref)
(declare-const x12@11@01 $Ref)
(declare-const p@12@01 $Perm)
(declare-const x1@13@01 $Ref)
(declare-const x2@14@01 $Ref)
(declare-const x3@15@01 $Ref)
(declare-const x4@16@01 $Ref)
(declare-const x5@17@01 $Ref)
(declare-const x6@18@01 $Ref)
(declare-const x7@19@01 $Ref)
(declare-const x8@20@01 $Ref)
(declare-const x9@21@01 $Ref)
(declare-const x10@22@01 $Ref)
(declare-const x11@23@01 $Ref)
(declare-const x12@24@01 $Ref)
(declare-const p@25@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] p >= none
(assert (>= p@25@01 $Perm.No))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale acc(x1.f, p)
(push) ; 3
(assert (not (or (= p@25@01 $Perm.No) (< $Perm.No p@25@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@27@01 Int)
(assert (<= $Perm.No p@25@01))
(assert (<= p@25@01 $Perm.Write))
(assert (=> (< $Perm.No p@25@01) (not (= x1@13@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale perm(x2.f) >= p
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] perm(x2.f) >= p
; [eval] perm(x2.f)
(assert (>= (ite (= x2@14@01 x1@13@01) p@25@01 $Perm.No) p@25@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x3.f) >= __iar__assume_helper_1(x2 == x3, p, p)
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 $Snap.unit))
; [eval] perm(x3.f) >= __iar__assume_helper_1(x2 == x3, p, p)
; [eval] perm(x3.f)
; [eval] __iar__assume_helper_1(x2 == x3, p, p)
; [eval] x2 == x3
(assert (>=
  (ite (= x3@15@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_1<Perm> (= x2@14@01 x3@15@01) p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x4.f) >= __iar__assume_helper_2(x2 == x4, x3 == x4, p, p, p)
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] perm(x4.f) >= __iar__assume_helper_2(x2 == x4, x3 == x4, p, p, p)
; [eval] perm(x4.f)
; [eval] __iar__assume_helper_2(x2 == x4, x3 == x4, p, p, p)
; [eval] x2 == x4
; [eval] x3 == x4
(assert (>=
  (ite (= x4@16@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_2<Perm> (= x2@14@01 x4@16@01) (= x3@15@01 x4@16@01) p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x5.f) >=
;   __iar__assume_helper_3(x2 == x5, x3 == x5, x4 == x5, p, p, p, p)
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] perm(x5.f) >= __iar__assume_helper_3(x2 == x5, x3 == x5, x4 == x5, p, p, p, p)
; [eval] perm(x5.f)
; [eval] __iar__assume_helper_3(x2 == x5, x3 == x5, x4 == x5, p, p, p, p)
; [eval] x2 == x5
; [eval] x3 == x5
; [eval] x4 == x5
(assert (>=
  (ite (= x5@17@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_3<Perm> (= x2@14@01 x5@17@01) (= x3@15@01 x5@17@01) (=
    x4@16@01
    x5@17@01) p@25@01 p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x6.f) >=
;   __iar__assume_helper_4(x2 == x6, x3 == x6, x4 == x6, x5 == x6, p, p, p, p,
;   p)
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; [eval] perm(x6.f) >= __iar__assume_helper_4(x2 == x6, x3 == x6, x4 == x6, x5 == x6, p, p, p, p, p)
; [eval] perm(x6.f)
; [eval] __iar__assume_helper_4(x2 == x6, x3 == x6, x4 == x6, x5 == x6, p, p, p, p, p)
; [eval] x2 == x6
; [eval] x3 == x6
; [eval] x4 == x6
; [eval] x5 == x6
(assert (>=
  (ite (= x6@18@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_4<Perm> (= x2@14@01 x6@18@01) (= x3@15@01 x6@18@01) (=
    x4@16@01
    x6@18@01) (= x5@17@01 x6@18@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x7.f) >=
;   __iar__assume_helper_5(x2 == x7, x3 == x7, x4 == x7, x5 == x7, x6 == x7, p,
;   p, p, p, p, p)
(declare-const $t@33@01 $Snap)
(assert (= $t@33@01 $Snap.unit))
; [eval] perm(x7.f) >= __iar__assume_helper_5(x2 == x7, x3 == x7, x4 == x7, x5 == x7, x6 == x7, p, p, p, p, p, p)
; [eval] perm(x7.f)
; [eval] __iar__assume_helper_5(x2 == x7, x3 == x7, x4 == x7, x5 == x7, x6 == x7, p, p, p, p, p, p)
; [eval] x2 == x7
; [eval] x3 == x7
; [eval] x4 == x7
; [eval] x5 == x7
; [eval] x6 == x7
(assert (>=
  (ite (= x7@19@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_5<Perm> (= x2@14@01 x7@19@01) (= x3@15@01 x7@19@01) (=
    x4@16@01
    x7@19@01) (= x5@17@01 x7@19@01) (= x6@18@01 x7@19@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x8.f) >=
;   __iar__assume_helper_6(x2 == x8, x3 == x8, x4 == x8, x5 == x8, x6 == x8, x7 ==
;   x8, p, p, p, p, p, p, p)
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 $Snap.unit))
; [eval] perm(x8.f) >= __iar__assume_helper_6(x2 == x8, x3 == x8, x4 == x8, x5 == x8, x6 == x8, x7 == x8, p, p, p, p, p, p, p)
; [eval] perm(x8.f)
; [eval] __iar__assume_helper_6(x2 == x8, x3 == x8, x4 == x8, x5 == x8, x6 == x8, x7 == x8, p, p, p, p, p, p, p)
; [eval] x2 == x8
; [eval] x3 == x8
; [eval] x4 == x8
; [eval] x5 == x8
; [eval] x6 == x8
; [eval] x7 == x8
(assert (>=
  (ite (= x8@20@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_6<Perm> (= x2@14@01 x8@20@01) (= x3@15@01 x8@20@01) (=
    x4@16@01
    x8@20@01) (= x5@17@01 x8@20@01) (= x6@18@01 x8@20@01) (= x7@19@01 x8@20@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x9.f) >=
;   __iar__assume_helper_7(x2 == x9, x3 == x9, x4 == x9, x5 == x9, x6 == x9, x7 ==
;   x9, x8 == x9, p, p, p, p, p, p, p, p)
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 $Snap.unit))
; [eval] perm(x9.f) >= __iar__assume_helper_7(x2 == x9, x3 == x9, x4 == x9, x5 == x9, x6 == x9, x7 == x9, x8 == x9, p, p, p, p, p, p, p, p)
; [eval] perm(x9.f)
; [eval] __iar__assume_helper_7(x2 == x9, x3 == x9, x4 == x9, x5 == x9, x6 == x9, x7 == x9, x8 == x9, p, p, p, p, p, p, p, p)
; [eval] x2 == x9
; [eval] x3 == x9
; [eval] x4 == x9
; [eval] x5 == x9
; [eval] x6 == x9
; [eval] x7 == x9
; [eval] x8 == x9
(assert (>=
  (ite (= x9@21@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_7<Perm> (= x2@14@01 x9@21@01) (= x3@15@01 x9@21@01) (=
    x4@16@01
    x9@21@01) (= x5@17@01 x9@21@01) (= x6@18@01 x9@21@01) (= x7@19@01 x9@21@01) (=
    x8@20@01
    x9@21@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x10.f) >=
;   __iar__assume_helper_8(x2 == x10, x3 == x10, x4 == x10, x5 == x10, x6 ==
;   x10, x7 == x10, x8 == x10, x9 == x10, p, p, p, p, p, p, p, p, p)
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] perm(x10.f) >= __iar__assume_helper_8(x2 == x10, x3 == x10, x4 == x10, x5 == x10, x6 == x10, x7 == x10, x8 == x10, x9 == x10, p, p, p, p, p, p, p, p, p)
; [eval] perm(x10.f)
; [eval] __iar__assume_helper_8(x2 == x10, x3 == x10, x4 == x10, x5 == x10, x6 == x10, x7 == x10, x8 == x10, x9 == x10, p, p, p, p, p, p, p, p, p)
; [eval] x2 == x10
; [eval] x3 == x10
; [eval] x4 == x10
; [eval] x5 == x10
; [eval] x6 == x10
; [eval] x7 == x10
; [eval] x8 == x10
; [eval] x9 == x10
(assert (>=
  (ite (= x10@22@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_8<Perm> (= x2@14@01 x10@22@01) (= x3@15@01 x10@22@01) (=
    x4@16@01
    x10@22@01) (= x5@17@01 x10@22@01) (= x6@18@01 x10@22@01) (=
    x7@19@01
    x10@22@01) (= x8@20@01 x10@22@01) (= x9@21@01 x10@22@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x11.f) >=
;   __iar__assume_helper_9(x2 == x11, x3 == x11, x4 == x11, x5 == x11, x6 ==
;   x11, x7 == x11, x8 == x11, x9 == x11, x10 == x11, p, p, p, p, p, p, p, p,
;   p, p)
(declare-const $t@37@01 $Snap)
(assert (= $t@37@01 $Snap.unit))
; [eval] perm(x11.f) >= __iar__assume_helper_9(x2 == x11, x3 == x11, x4 == x11, x5 == x11, x6 == x11, x7 == x11, x8 == x11, x9 == x11, x10 == x11, p, p, p, p, p, p, p, p, p, p)
; [eval] perm(x11.f)
; [eval] __iar__assume_helper_9(x2 == x11, x3 == x11, x4 == x11, x5 == x11, x6 == x11, x7 == x11, x8 == x11, x9 == x11, x10 == x11, p, p, p, p, p, p, p, p, p, p)
; [eval] x2 == x11
; [eval] x3 == x11
; [eval] x4 == x11
; [eval] x5 == x11
; [eval] x6 == x11
; [eval] x7 == x11
; [eval] x8 == x11
; [eval] x9 == x11
; [eval] x10 == x11
(assert (>=
  (ite (= x11@23@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_9<Perm> (= x2@14@01 x11@23@01) (= x3@15@01 x11@23@01) (=
    x4@16@01
    x11@23@01) (= x5@17@01 x11@23@01) (= x6@18@01 x11@23@01) (=
    x7@19@01
    x11@23@01) (= x8@20@01 x11@23@01) (= x9@21@01 x11@23@01) (=
    x10@22@01
    x11@23@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale perm(x12.f) >=
;   __iar__assume_helper_10(x2 == x12, x3 == x12, x4 == x12, x5 == x12, x6 ==
;   x12, x7 == x12, x8 == x12, x9 == x12, x10 == x12, x11 == x12, p, p, p, p,
;   p, p, p, p, p, p, p)
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 $Snap.unit))
; [eval] perm(x12.f) >= __iar__assume_helper_10(x2 == x12, x3 == x12, x4 == x12, x5 == x12, x6 == x12, x7 == x12, x8 == x12, x9 == x12, x10 == x12, x11 == x12, p, p, p, p, p, p, p, p, p, p, p)
; [eval] perm(x12.f)
; [eval] __iar__assume_helper_10(x2 == x12, x3 == x12, x4 == x12, x5 == x12, x6 == x12, x7 == x12, x8 == x12, x9 == x12, x10 == x12, x11 == x12, p, p, p, p, p, p, p, p, p, p, p)
; [eval] x2 == x12
; [eval] x3 == x12
; [eval] x4 == x12
; [eval] x5 == x12
; [eval] x6 == x12
; [eval] x7 == x12
; [eval] x8 == x12
; [eval] x9 == x12
; [eval] x10 == x12
; [eval] x11 == x12
(assert (>=
  (ite (= x12@24@01 x1@13@01) p@25@01 $Perm.No)
  (__iar__assume_helper_10<Perm> (= x2@14@01 x12@24@01) (= x3@15@01 x12@24@01) (=
    x4@16@01
    x12@24@01) (= x5@17@01 x12@24@01) (= x6@18@01 x12@24@01) (=
    x7@19@01
    x12@24@01) (= x8@20@01 x12@24@01) (= x9@21@01 x12@24@01) (=
    x10@22@01
    x12@24@01) (= x11@23@01 x12@24@01) p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01 p@25@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert p > none ==> false
; [eval] p > none ==> false
; [eval] p > none
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (> p@25@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | p@25@01 > Z | dead]
; [else-branch: 0 | !(p@25@01 > Z) | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 0 | !(p@25@01 > Z)]
(assert (not (> p@25@01 $Perm.No)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (not (> p@25@01 $Perm.No)))
(pop) ; 2
(pop) ; 1
