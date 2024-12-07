(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:31
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0393b.vpr
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
(declare-sort dummy 0)
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
(declare-fun $SortWrappers.dummyTo$Snap (dummy) $Snap)
(declare-fun $SortWrappers.$SnapTodummy ($Snap) dummy)
(assert (forall ((x dummy)) (!
    (= x ($SortWrappers.$SnapTodummy($SortWrappers.dummyTo$Snap x)))
    :pattern (($SortWrappers.dummyTo$Snap x))
    :qid |$Snap.$SnapTodummyTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.dummyTo$Snap($SortWrappers.$SnapTodummy x)))
    :pattern (($SortWrappers.$SnapTodummy x))
    :qid |$Snap.dummyTo$SnapTodummy|
    )))
; ////////// Symbols
(declare-fun foo<Bool> (Int Int) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap Int) Bool)
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
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
; var i: Int
(declare-const i@0@01 Int)
; [exec]
; var b: Bool
(declare-const b@1@01 Bool)
; [exec]
; inhale acc(P(i), write)
(declare-const $t@2@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; b := (unfolding acc(P(i), write) in true)
; [eval] (unfolding acc(P(i), write) in true)
(set-option :timeout 0)
(push) ; 3
(assert (P%trigger $t@2@01 i@0@01))
(assert (= $t@2@01 $Snap.unit))
; [eval] (forall i: Int :: { foo(i, idx) } 0 <= i && i < 10 ==> foo(i, idx))
(declare-const i@3@01 Int)
(push) ; 4
; [eval] 0 <= i && i < 10 ==> foo(i, idx)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 5
; [then-branch: 0 | !(0 <= i@3@01) | live]
; [else-branch: 0 | 0 <= i@3@01 | live]
(push) ; 6
; [then-branch: 0 | !(0 <= i@3@01)]
(assert (not (<= 0 i@3@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 0 | 0 <= i@3@01]
(assert (<= 0 i@3@01))
; [eval] i < 10
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@3@01) (not (<= 0 i@3@01))))
(push) ; 5
; [then-branch: 1 | 0 <= i@3@01 && i@3@01 < 10 | live]
; [else-branch: 1 | !(0 <= i@3@01 && i@3@01 < 10) | live]
(push) ; 6
; [then-branch: 1 | 0 <= i@3@01 && i@3@01 < 10]
(assert (and (<= 0 i@3@01) (< i@3@01 10)))
; [eval] foo(i, idx)
(pop) ; 6
(push) ; 6
; [else-branch: 1 | !(0 <= i@3@01 && i@3@01 < 10)]
(assert (not (and (<= 0 i@3@01) (< i@3@01 10))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (and (<= 0 i@3@01) (< i@3@01 10))) (and (<= 0 i@3@01) (< i@3@01 10))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int)) (!
  (and
    (or (<= 0 i@3@01) (not (<= 0 i@3@01)))
    (or
      (not (and (<= 0 i@3@01) (< i@3@01 10)))
      (and (<= 0 i@3@01) (< i@3@01 10))))
  :pattern ((foo<Bool> i@3@01 i@0@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0393b.vpr@9@5@10@41-aux|)))
(assert (forall ((i@3@01 Int)) (!
  (=> (and (<= 0 i@3@01) (< i@3@01 10)) (foo<Bool> i@3@01 i@0@01))
  :pattern ((foo<Bool> i@3@01 i@0@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0393b.vpr@9@5@10@41|)))
(pop) ; 3
; Joined path conditions
(assert (and
  (P%trigger $t@2@01 i@0@01)
  (= $t@2@01 $Snap.unit)
  (forall ((i@3@01 Int)) (!
    (and
      (or (<= 0 i@3@01) (not (<= 0 i@3@01)))
      (or
        (not (and (<= 0 i@3@01) (< i@3@01 10)))
        (and (<= 0 i@3@01) (< i@3@01 10))))
    :pattern ((foo<Bool> i@3@01 i@0@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0393b.vpr@9@5@10@41-aux|))
  (forall ((i@3@01 Int)) (!
    (=> (and (<= 0 i@3@01) (< i@3@01 10)) (foo<Bool> i@3@01 i@0@01))
    :pattern ((foo<Bool> i@3@01 i@0@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0393b.vpr@9@5@10@41|))))
; [exec]
; assert foo(0, i)
; [eval] foo(0, i)
(push) ; 3
(assert (not (foo<Bool> 0 i@0@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (foo<Bool> 0 i@0@01))
(pop) ; 2
(pop) ; 1
