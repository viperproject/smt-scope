(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:03:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0208.vpr
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
(declare-sort Foo 0)
(declare-sort test04 0)
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
(declare-fun $SortWrappers.FooTo$Snap (Foo) $Snap)
(declare-fun $SortWrappers.$SnapToFoo ($Snap) Foo)
(assert (forall ((x Foo)) (!
    (= x ($SortWrappers.$SnapToFoo($SortWrappers.FooTo$Snap x)))
    :pattern (($SortWrappers.FooTo$Snap x))
    :qid |$Snap.$SnapToFooTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FooTo$Snap($SortWrappers.$SnapToFoo x)))
    :pattern (($SortWrappers.$SnapToFoo x))
    :qid |$Snap.FooTo$SnapToFoo|
    )))
(declare-fun $SortWrappers.test04To$Snap (test04) $Snap)
(declare-fun $SortWrappers.$SnapTotest04 ($Snap) test04)
(assert (forall ((x test04)) (!
    (= x ($SortWrappers.$SnapTotest04($SortWrappers.test04To$Snap x)))
    :pattern (($SortWrappers.test04To$Snap x))
    :qid |$Snap.$SnapTotest04To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.test04To$Snap($SortWrappers.$SnapTotest04 x)))
    :pattern (($SortWrappers.$SnapTotest04 x))
    :qid |$Snap.test04To$SnapTotest04|
    )))
; ////////// Symbols
(declare-fun foo<Bool> (Int Int) Bool)
(declare-fun boo<Bool> (Int Int) Bool)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun test05%trigger ($Snap) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((i Int)) (!
  (foo<Bool> i i)
  :pattern ((foo<Bool> i i))
  :qid |prog.foo_ax|)))
(assert (and
  (forall ((i Int)) 
    (forall ((i$0 Int)) (!
      (boo<Bool> i i$0)
      :pattern ((boo<Bool> i i$0))
      )))
  (and
    (forall ((i$1 Int)) (!
      (boo<Bool> 1 i$1)
      :pattern ((boo<Bool> 1 i$1))
      ))
    (forall ((i Int)) 
      (forall ((i$2 Int)) (!
        (boo<Bool> i i$2)
        :pattern ((boo<Bool> i i$2))
        ))))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- test05 ----------
(set-option :timeout 0)
(push) ; 1
(declare-const $t@0@00 $Snap)
(assert (= $t@0@00 ($Snap.combine ($Snap.first $t@0@00) ($Snap.second $t@0@00))))
(assert (= ($Snap.first $t@0@00) $Snap.unit))
; [eval] (forall i: Int ::(forall i$0: Int :: { foo(i, i$0) } foo(i, i$0)))
(declare-const i@1@00 Int)
(push) ; 2
; [eval] (forall i$0: Int :: { foo(i, i$0) } foo(i, i$0))
(declare-const i$0@2@00 Int)
(push) ; 3
; [eval] foo(i, i$0)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@1@00 Int)) (!
  (forall ((i$0@2@00 Int)) (!
    (foo<Bool> i@1@00 i$0@2@00)
    :pattern ((foo<Bool> i@1@00 i$0@2@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0208.vpr@35@24@35@28|))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0208.vpr@35@7@35@28|)))
(assert (=
  ($Snap.second $t@0@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@0@00))
    ($Snap.second ($Snap.second $t@0@00)))))
(assert (= ($Snap.first ($Snap.second $t@0@00)) $Snap.unit))
; [eval] (forall i$1: Int :: { foo(1, i$1) } foo(1, i$1))
(declare-const i$1@3@00 Int)
(push) ; 2
; [eval] foo(1, i$1)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$1@3@00 Int)) (!
  (foo<Bool> 1 i$1@3@00)
  :pattern ((foo<Bool> 1 i$1@3@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0208.vpr@36@6@36@10|)))
(assert (= ($Snap.second ($Snap.second $t@0@00)) $Snap.unit))
; [eval] (forall i: Int ::(forall i$2: Int :: { foo(i, i$2) } foo(i, i$2)))
(declare-const i@4@00 Int)
(push) ; 2
; [eval] (forall i$2: Int :: { foo(i, i$2) } foo(i, i$2))
(declare-const i$2@5@00 Int)
(push) ; 3
; [eval] foo(i, i$2)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@4@00 Int)) (!
  (forall ((i$2@5@00 Int)) (!
    (foo<Bool> i@4@00 i$2@5@00)
    :pattern ((foo<Bool> i@4@00 i$2@5@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0208.vpr@37@24@37@28|))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0208.vpr@37@7@37@28|)))
(pop) ; 1
