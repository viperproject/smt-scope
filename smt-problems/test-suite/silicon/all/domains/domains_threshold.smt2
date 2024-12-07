(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/domains/domains_threshold.vpr
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
(declare-sort D1<D1<Bool>> 0)
(declare-sort D1<D1<D1<D1<Int>>>> 0)
(declare-sort D1<D1<Int>> 0)
(declare-sort D1<Int> 0)
(declare-sort D1<D1<D1<Int>>> 0)
(declare-sort D1<Bool> 0)
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
(declare-fun $SortWrappers.D1<D1<Bool>>To$Snap (D1<D1<Bool>>) $Snap)
(declare-fun $SortWrappers.$SnapToD1<D1<Bool>> ($Snap) D1<D1<Bool>>)
(assert (forall ((x D1<D1<Bool>>)) (!
    (= x ($SortWrappers.$SnapToD1<D1<Bool>>($SortWrappers.D1<D1<Bool>>To$Snap x)))
    :pattern (($SortWrappers.D1<D1<Bool>>To$Snap x))
    :qid |$Snap.$SnapToD1<D1<Bool>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D1<D1<Bool>>To$Snap($SortWrappers.$SnapToD1<D1<Bool>> x)))
    :pattern (($SortWrappers.$SnapToD1<D1<Bool>> x))
    :qid |$Snap.D1<D1<Bool>>To$SnapToD1<D1<Bool>>|
    )))
(declare-fun $SortWrappers.D1<D1<D1<D1<Int>>>>To$Snap (D1<D1<D1<D1<Int>>>>) $Snap)
(declare-fun $SortWrappers.$SnapToD1<D1<D1<D1<Int>>>> ($Snap) D1<D1<D1<D1<Int>>>>)
(assert (forall ((x D1<D1<D1<D1<Int>>>>)) (!
    (= x ($SortWrappers.$SnapToD1<D1<D1<D1<Int>>>>($SortWrappers.D1<D1<D1<D1<Int>>>>To$Snap x)))
    :pattern (($SortWrappers.D1<D1<D1<D1<Int>>>>To$Snap x))
    :qid |$Snap.$SnapToD1<D1<D1<D1<Int>>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D1<D1<D1<D1<Int>>>>To$Snap($SortWrappers.$SnapToD1<D1<D1<D1<Int>>>> x)))
    :pattern (($SortWrappers.$SnapToD1<D1<D1<D1<Int>>>> x))
    :qid |$Snap.D1<D1<D1<D1<Int>>>>To$SnapToD1<D1<D1<D1<Int>>>>|
    )))
(declare-fun $SortWrappers.D1<D1<Int>>To$Snap (D1<D1<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD1<D1<Int>> ($Snap) D1<D1<Int>>)
(assert (forall ((x D1<D1<Int>>)) (!
    (= x ($SortWrappers.$SnapToD1<D1<Int>>($SortWrappers.D1<D1<Int>>To$Snap x)))
    :pattern (($SortWrappers.D1<D1<Int>>To$Snap x))
    :qid |$Snap.$SnapToD1<D1<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D1<D1<Int>>To$Snap($SortWrappers.$SnapToD1<D1<Int>> x)))
    :pattern (($SortWrappers.$SnapToD1<D1<Int>> x))
    :qid |$Snap.D1<D1<Int>>To$SnapToD1<D1<Int>>|
    )))
(declare-fun $SortWrappers.D1<Int>To$Snap (D1<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD1<Int> ($Snap) D1<Int>)
(assert (forall ((x D1<Int>)) (!
    (= x ($SortWrappers.$SnapToD1<Int>($SortWrappers.D1<Int>To$Snap x)))
    :pattern (($SortWrappers.D1<Int>To$Snap x))
    :qid |$Snap.$SnapToD1<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D1<Int>To$Snap($SortWrappers.$SnapToD1<Int> x)))
    :pattern (($SortWrappers.$SnapToD1<Int> x))
    :qid |$Snap.D1<Int>To$SnapToD1<Int>|
    )))
(declare-fun $SortWrappers.D1<D1<D1<Int>>>To$Snap (D1<D1<D1<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToD1<D1<D1<Int>>> ($Snap) D1<D1<D1<Int>>>)
(assert (forall ((x D1<D1<D1<Int>>>)) (!
    (= x ($SortWrappers.$SnapToD1<D1<D1<Int>>>($SortWrappers.D1<D1<D1<Int>>>To$Snap x)))
    :pattern (($SortWrappers.D1<D1<D1<Int>>>To$Snap x))
    :qid |$Snap.$SnapToD1<D1<D1<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D1<D1<D1<Int>>>To$Snap($SortWrappers.$SnapToD1<D1<D1<Int>>> x)))
    :pattern (($SortWrappers.$SnapToD1<D1<D1<Int>>> x))
    :qid |$Snap.D1<D1<D1<Int>>>To$SnapToD1<D1<D1<Int>>>|
    )))
(declare-fun $SortWrappers.D1<Bool>To$Snap (D1<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD1<Bool> ($Snap) D1<Bool>)
(assert (forall ((x D1<Bool>)) (!
    (= x ($SortWrappers.$SnapToD1<Bool>($SortWrappers.D1<Bool>To$Snap x)))
    :pattern (($SortWrappers.D1<Bool>To$Snap x))
    :qid |$Snap.$SnapToD1<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D1<Bool>To$Snap($SortWrappers.$SnapToD1<Bool> x)))
    :pattern (($SortWrappers.$SnapToD1<Bool> x))
    :qid |$Snap.D1<Bool>To$SnapToD1<Bool>|
    )))
; ////////// Symbols
(declare-fun f1<D1<Bool>> (Bool) D1<Bool>)
(declare-fun f2<D1<Bool>> (D1<Bool>) D1<Bool>)
(declare-fun f3<Bool> (D1<Bool>) Bool)
(declare-fun f4<Bool> (D1<D1<Bool>>) Bool)
(declare-fun f5<D1<D1<Bool>>> (Bool) D1<D1<Bool>>)
(declare-fun f6<D1<D1<Bool>>> (D1<Bool>) D1<D1<Bool>>)
(declare-fun f1<D1<D1<Int>>> (D1<Int>) D1<D1<Int>>)
(declare-fun f2<D1<D1<Int>>> (D1<D1<Int>>) D1<D1<Int>>)
(declare-fun f3<D1<Int>> (D1<D1<Int>>) D1<Int>)
(declare-fun f4<D1<Int>> (D1<D1<D1<Int>>>) D1<Int>)
(declare-fun f5<D1<D1<D1<Int>>>> (D1<Int>) D1<D1<D1<Int>>>)
(declare-fun f6<D1<D1<D1<Int>>>> (D1<D1<Int>>) D1<D1<D1<Int>>>)
(declare-fun f1<D1<D1<Bool>>> (D1<Bool>) D1<D1<Bool>>)
(declare-fun f2<D1<D1<Bool>>> (D1<D1<Bool>>) D1<D1<Bool>>)
(declare-fun f3<D1<Bool>> (D1<D1<Bool>>) D1<Bool>)
(declare-fun f1<D1<D1<D1<D1<Int>>>>> (D1<D1<D1<Int>>>) D1<D1<D1<D1<Int>>>>)
(declare-fun f2<D1<D1<D1<D1<Int>>>>> (D1<D1<D1<D1<Int>>>>) D1<D1<D1<D1<Int>>>>)
(declare-fun f3<D1<D1<D1<Int>>>> (D1<D1<D1<D1<Int>>>>) D1<D1<D1<Int>>>)
(declare-fun f1<D1<Int>> (Int) D1<Int>)
(declare-fun f2<D1<Int>> (D1<Int>) D1<Int>)
(declare-fun f3<Int> (D1<Int>) Int)
(declare-fun f4<Int> (D1<D1<Int>>) Int)
(declare-fun f5<D1<D1<Int>>> (Int) D1<D1<Int>>)
(declare-fun f6<D1<D1<Int>>> (D1<Int>) D1<D1<Int>>)
(declare-fun f1<D1<D1<D1<Int>>>> (D1<D1<Int>>) D1<D1<D1<Int>>>)
(declare-fun f2<D1<D1<D1<Int>>>> (D1<D1<D1<Int>>>) D1<D1<D1<Int>>>)
(declare-fun f3<D1<D1<Int>>> (D1<D1<D1<Int>>>) D1<D1<Int>>)
(declare-fun f4<D1<D1<Int>>> (D1<D1<D1<D1<Int>>>>) D1<D1<Int>>)
(declare-fun f5<D1<D1<D1<D1<Int>>>>> (D1<D1<Int>>) D1<D1<D1<D1<Int>>>>)
(declare-fun f6<D1<D1<D1<D1<Int>>>>> (D1<D1<D1<Int>>>) D1<D1<D1<D1<Int>>>>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((x Bool)) (!
  (= (f6<D1<D1<Bool>>> (f1<D1<Bool>> x)) (f1<D1<D1<Bool>>> (f1<D1<Bool>> x)))
  :pattern ((f6<D1<D1<Bool>>> (f1<D1<Bool>> x)))
  :pattern ((f1<D1<D1<Bool>>> (f1<D1<Bool>> x)))
  :qid |prog.A1|)))
(assert (forall ((y D1<Bool>)) (!
  (= y (f2<D1<Bool>> y))
  :pattern ((f2<D1<Bool>> y))
  :qid |prog.A2|)))
(assert (forall ((z D1<D1<Bool>>)) (!
  (= (f4<Bool> z) (f3<Bool> (f3<D1<Bool>> z)))
  :pattern ((f4<Bool> z))
  :pattern ((f3<Bool> (f3<D1<Bool>> z)))
  :qid |prog.A3|)))
(assert (forall ((x D1<Int>)) (!
  (=
    (f6<D1<D1<D1<Int>>>> (f1<D1<D1<Int>>> x))
    (f1<D1<D1<D1<Int>>>> (f1<D1<D1<Int>>> x)))
  :pattern ((f6<D1<D1<D1<Int>>>> (f1<D1<D1<Int>>> x)))
  :pattern ((f1<D1<D1<D1<Int>>>> (f1<D1<D1<Int>>> x)))
  :qid |prog.A1|)))
(assert (forall ((y D1<D1<Int>>)) (!
  (= y (f2<D1<D1<Int>>> y))
  :pattern ((f2<D1<D1<Int>>> y))
  :qid |prog.A2|)))
(assert (forall ((z D1<D1<D1<Int>>>)) (!
  (= (f4<D1<Int>> z) (f3<D1<Int>> (f3<D1<D1<Int>>> z)))
  :pattern ((f4<D1<Int>> z))
  :pattern ((f3<D1<Int>> (f3<D1<D1<Int>>> z)))
  :qid |prog.A3|)))
(assert (forall ((y D1<D1<Bool>>)) (!
  (= y (f2<D1<D1<Bool>>> y))
  :pattern ((f2<D1<D1<Bool>>> y))
  :qid |prog.A2|)))
(assert (forall ((y D1<D1<D1<D1<Int>>>>)) (!
  (= y (f2<D1<D1<D1<D1<Int>>>>> y))
  :pattern ((f2<D1<D1<D1<D1<Int>>>>> y))
  :qid |prog.A2|)))
(assert (forall ((x Int)) (!
  (= (f6<D1<D1<Int>>> (f1<D1<Int>> x)) (f1<D1<D1<Int>>> (f1<D1<Int>> x)))
  :pattern ((f6<D1<D1<Int>>> (f1<D1<Int>> x)))
  :pattern ((f1<D1<D1<Int>>> (f1<D1<Int>> x)))
  :qid |prog.A1|)))
(assert (forall ((y D1<Int>)) (!
  (= y (f2<D1<Int>> y))
  :pattern ((f2<D1<Int>> y))
  :qid |prog.A2|)))
(assert (forall ((z D1<D1<Int>>)) (!
  (= (f4<Int> z) (f3<Int> (f3<D1<Int>> z)))
  :pattern ((f4<Int> z))
  :pattern ((f3<Int> (f3<D1<Int>> z)))
  :qid |prog.A3|)))
(assert (forall ((x D1<D1<Int>>)) (!
  (=
    (f6<D1<D1<D1<D1<Int>>>>> (f1<D1<D1<D1<Int>>>> x))
    (f1<D1<D1<D1<D1<Int>>>>> (f1<D1<D1<D1<Int>>>> x)))
  :pattern ((f6<D1<D1<D1<D1<Int>>>>> (f1<D1<D1<D1<Int>>>> x)))
  :pattern ((f1<D1<D1<D1<D1<Int>>>>> (f1<D1<D1<D1<Int>>>> x)))
  :qid |prog.A1|)))
(assert (forall ((y D1<D1<D1<Int>>>)) (!
  (= y (f2<D1<D1<D1<Int>>>> y))
  :pattern ((f2<D1<D1<D1<Int>>>> y))
  :qid |prog.A2|)))
(assert (forall ((z D1<D1<D1<D1<Int>>>>)) (!
  (= (f4<D1<D1<Int>>> z) (f3<D1<D1<Int>>> (f3<D1<D1<D1<Int>>>> z)))
  :pattern ((f4<D1<D1<Int>>> z))
  :pattern ((f3<D1<D1<Int>>> (f3<D1<D1<D1<Int>>>> z)))
  :qid |prog.A3|)))
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
(declare-const x@0@01 D1<Int>)
(declare-const r@1@01 D1<Bool>)
(declare-const x@2@01 D1<Int>)
(declare-const r@3@01 D1<Bool>)
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
; var y: Int
(declare-const y@4@01 Int)
; [exec]
; var z: D1[D1[D1[Int]]]
(declare-const z@5@01 D1<D1<D1<Int>>>)
; [exec]
; y := 5
; [exec]
; y := (f4((f1(x): D1[D1[Int]])): Int)
; [eval] (f4((f1(x): D1[D1[Int]])): Int)
; [eval] (f1(x): D1[D1[Int]])
(declare-const y@6@01 Int)
(assert (= y@6@01 (f4<Int> (f1<D1<D1<Int>>> x@2@01))))
; [exec]
; z := (f5(x): D1[D1[D1[Int]]])
; [eval] (f5(x): D1[D1[D1[Int]]])
(declare-const z@7@01 D1<D1<D1<Int>>>)
(assert (= z@7@01 (f5<D1<D1<D1<Int>>>> x@2@01)))
(pop) ; 2
(pop) ; 1
