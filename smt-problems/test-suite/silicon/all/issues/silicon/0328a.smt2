(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:12
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0328a.vpr
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
(declare-sort Vector9D 0)
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
(declare-fun $SortWrappers.Vector9DTo$Snap (Vector9D) $Snap)
(declare-fun $SortWrappers.$SnapToVector9D ($Snap) Vector9D)
(assert (forall ((x Vector9D)) (!
    (= x ($SortWrappers.$SnapToVector9D($SortWrappers.Vector9DTo$Snap x)))
    :pattern (($SortWrappers.Vector9DTo$Snap x))
    :qid |$Snap.$SnapToVector9DTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Vector9DTo$Snap($SortWrappers.$SnapToVector9D x)))
    :pattern (($SortWrappers.$SnapToVector9D x))
    :qid |$Snap.Vector9DTo$SnapToVector9D|
    )))
; ////////// Symbols
(declare-fun Vector9D_ctor<Vector9D> (Int Int Int Int Int Int Int Int Int) Vector9D)
(declare-fun Vector9D_ctor_syn<Vector9D> (Int Int Int Int Int Int Int Int Int) Vector9D)
(declare-fun Vector9D_f1<Int> (Vector9D) Int)
(declare-fun Vector9D_f2<Int> (Vector9D) Int)
(declare-fun Vector9D_f3<Int> (Vector9D) Int)
(declare-fun Vector9D_f4<Int> (Vector9D) Int)
(declare-fun Vector9D_f5<Int> (Vector9D) Int)
(declare-fun Vector9D_f6<Int> (Vector9D) Int)
(declare-fun Vector9D_f7<Int> (Vector9D) Int)
(declare-fun Vector9D_f8<Int> (Vector9D) Int)
(declare-fun Vector9D_f9<Int> (Vector9D) Int)
; Declaring symbols related to program functions (from program analysis)
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- main ----------
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
; var v1: Vector9D
(declare-const v1@0@01 Vector9D)
; [exec]
; v1 := Vector9D_ctor(1, 2, 3, 4, 5, 6, 7, 8, 9)
; [eval] Vector9D_ctor(1, 2, 3, 4, 5, 6, 7, 8, 9)
(declare-const v1@1@01 Vector9D)
(assert (= v1@1@01 (Vector9D_ctor<Vector9D> 1 2 3 4 5 6 7 8 9)))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@2@01 Vector9D)
(assert (=
  v1@2@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@1@01) (Vector9D_f2<Int> v1@1@01) (Vector9D_f3<Int> v1@1@01) (Vector9D_f4<Int> v1@1@01) (Vector9D_f5<Int> v1@1@01) (Vector9D_f6<Int> v1@1@01) (Vector9D_f7<Int> v1@1@01) (Vector9D_f8<Int> v1@1@01) (Vector9D_f9<Int> v1@1@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@3@01 Vector9D)
(assert (=
  v1@3@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@2@01) (Vector9D_f2<Int> v1@2@01) (Vector9D_f3<Int> v1@2@01) (Vector9D_f4<Int> v1@2@01) (Vector9D_f5<Int> v1@2@01) (Vector9D_f6<Int> v1@2@01) (Vector9D_f7<Int> v1@2@01) (Vector9D_f8<Int> v1@2@01) (Vector9D_f9<Int> v1@2@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@4@01 Vector9D)
(assert (=
  v1@4@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@3@01) (Vector9D_f2<Int> v1@3@01) (Vector9D_f3<Int> v1@3@01) (Vector9D_f4<Int> v1@3@01) (Vector9D_f5<Int> v1@3@01) (Vector9D_f6<Int> v1@3@01) (Vector9D_f7<Int> v1@3@01) (Vector9D_f8<Int> v1@3@01) (Vector9D_f9<Int> v1@3@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@5@01 Vector9D)
(assert (=
  v1@5@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@4@01) (Vector9D_f2<Int> v1@4@01) (Vector9D_f3<Int> v1@4@01) (Vector9D_f4<Int> v1@4@01) (Vector9D_f5<Int> v1@4@01) (Vector9D_f6<Int> v1@4@01) (Vector9D_f7<Int> v1@4@01) (Vector9D_f8<Int> v1@4@01) (Vector9D_f9<Int> v1@4@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@6@01 Vector9D)
(assert (=
  v1@6@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@5@01) (Vector9D_f2<Int> v1@5@01) (Vector9D_f3<Int> v1@5@01) (Vector9D_f4<Int> v1@5@01) (Vector9D_f5<Int> v1@5@01) (Vector9D_f6<Int> v1@5@01) (Vector9D_f7<Int> v1@5@01) (Vector9D_f8<Int> v1@5@01) (Vector9D_f9<Int> v1@5@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@7@01 Vector9D)
(assert (=
  v1@7@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@6@01) (Vector9D_f2<Int> v1@6@01) (Vector9D_f3<Int> v1@6@01) (Vector9D_f4<Int> v1@6@01) (Vector9D_f5<Int> v1@6@01) (Vector9D_f6<Int> v1@6@01) (Vector9D_f7<Int> v1@6@01) (Vector9D_f8<Int> v1@6@01) (Vector9D_f9<Int> v1@6@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@8@01 Vector9D)
(assert (=
  v1@8@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@7@01) (Vector9D_f2<Int> v1@7@01) (Vector9D_f3<Int> v1@7@01) (Vector9D_f4<Int> v1@7@01) (Vector9D_f5<Int> v1@7@01) (Vector9D_f6<Int> v1@7@01) (Vector9D_f7<Int> v1@7@01) (Vector9D_f8<Int> v1@7@01) (Vector9D_f9<Int> v1@7@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@9@01 Vector9D)
(assert (=
  v1@9@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@8@01) (Vector9D_f2<Int> v1@8@01) (Vector9D_f3<Int> v1@8@01) (Vector9D_f4<Int> v1@8@01) (Vector9D_f5<Int> v1@8@01) (Vector9D_f6<Int> v1@8@01) (Vector9D_f7<Int> v1@8@01) (Vector9D_f8<Int> v1@8@01) (Vector9D_f9<Int> v1@8@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@10@01 Vector9D)
(assert (=
  v1@10@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@9@01) (Vector9D_f2<Int> v1@9@01) (Vector9D_f3<Int> v1@9@01) (Vector9D_f4<Int> v1@9@01) (Vector9D_f5<Int> v1@9@01) (Vector9D_f6<Int> v1@9@01) (Vector9D_f7<Int> v1@9@01) (Vector9D_f8<Int> v1@9@01) (Vector9D_f9<Int> v1@9@01))))
; [exec]
; v1 := Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1),
;   Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_ctor(Vector9D_f1(v1), Vector9D_f2(v1), Vector9D_f3(v1), Vector9D_f4(v1), Vector9D_f5(v1), Vector9D_f6(v1), Vector9D_f7(v1), Vector9D_f8(v1), Vector9D_f9(v1))
; [eval] Vector9D_f1(v1)
; [eval] Vector9D_f2(v1)
; [eval] Vector9D_f3(v1)
; [eval] Vector9D_f4(v1)
; [eval] Vector9D_f5(v1)
; [eval] Vector9D_f6(v1)
; [eval] Vector9D_f7(v1)
; [eval] Vector9D_f8(v1)
; [eval] Vector9D_f9(v1)
(declare-const v1@11@01 Vector9D)
(assert (=
  v1@11@01
  (Vector9D_ctor<Vector9D> (Vector9D_f1<Int> v1@10@01) (Vector9D_f2<Int> v1@10@01) (Vector9D_f3<Int> v1@10@01) (Vector9D_f4<Int> v1@10@01) (Vector9D_f5<Int> v1@10@01) (Vector9D_f6<Int> v1@10@01) (Vector9D_f7<Int> v1@10@01) (Vector9D_f8<Int> v1@10@01) (Vector9D_f9<Int> v1@10@01))))
(pop) ; 2
(pop) ; 1
