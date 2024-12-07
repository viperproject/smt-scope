(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:39
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0282.vpr
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
(declare-fun f1 ($Snap Int) Bool)
(declare-fun f1%limited ($Snap Int) Bool)
(declare-fun f1%stateless (Int) Bool)
(declare-fun f1%precondition ($Snap Int) Bool)
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
; ---------- FUNCTION f1----------
(declare-fun idx@0@00 () Int)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall i: Int :: { foo(i, idx) } 0 <= i && i < 10 ==> foo(i, idx))
(declare-const i@2@00 Int)
(push) ; 2
; [eval] 0 <= i && i < 10 ==> foo(i, idx)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@2@00) | live]
; [else-branch: 0 | 0 <= i@2@00 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@2@00)]
(assert (not (<= 0 i@2@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@2@00]
(assert (<= 0 i@2@00))
; [eval] i < 10
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@2@00) (not (<= 0 i@2@00))))
(push) ; 3
; [then-branch: 1 | 0 <= i@2@00 && i@2@00 < 10 | live]
; [else-branch: 1 | !(0 <= i@2@00 && i@2@00 < 10) | live]
(push) ; 4
; [then-branch: 1 | 0 <= i@2@00 && i@2@00 < 10]
(assert (and (<= 0 i@2@00) (< i@2@00 10)))
; [eval] foo(i, idx)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(0 <= i@2@00 && i@2@00 < 10)]
(assert (not (and (<= 0 i@2@00) (< i@2@00 10))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (and (<= 0 i@2@00) (< i@2@00 10))) (and (<= 0 i@2@00) (< i@2@00 10))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@2@00 Int)) (!
  (and
    (or (<= 0 i@2@00) (not (<= 0 i@2@00)))
    (or
      (not (and (<= 0 i@2@00) (< i@2@00 10)))
      (and (<= 0 i@2@00) (< i@2@00 10))))
  :pattern ((foo<Bool> i@2@00 idx@0@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@21@12@21@75-aux|)))
(assert (forall ((i@2@00 Int)) (!
  (=> (and (<= 0 i@2@00) (< i@2@00 10)) (foo<Bool> i@2@00 idx@0@00))
  :pattern ((foo<Bool> i@2@00 idx@0@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0282.vpr@21@12@21@75|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (idx@0@00 Int)) (!
  (= (f1%limited s@$ idx@0@00) (f1 s@$ idx@0@00))
  :pattern ((f1 s@$ idx@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (idx@0@00 Int)) (!
  (f1%stateless idx@0@00)
  :pattern ((f1%limited s@$ idx@0@00))
  :qid |quant-u-1|)))
