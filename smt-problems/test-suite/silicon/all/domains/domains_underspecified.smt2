(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:43:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/domains/domains_underspecified.vpr
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
(declare-sort D<Bool~_Int> 0)
(declare-sort D<Int~_Bool> 0)
(declare-sort D<Bool~_Bool> 0)
(declare-sort D<Int~_Int> 0)
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
(declare-fun $SortWrappers.D<Bool~_Int>To$Snap (D<Bool~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD<Bool~_Int> ($Snap) D<Bool~_Int>)
(assert (forall ((x D<Bool~_Int>)) (!
    (= x ($SortWrappers.$SnapToD<Bool~_Int>($SortWrappers.D<Bool~_Int>To$Snap x)))
    :pattern (($SortWrappers.D<Bool~_Int>To$Snap x))
    :qid |$Snap.$SnapToD<Bool~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D<Bool~_Int>To$Snap($SortWrappers.$SnapToD<Bool~_Int> x)))
    :pattern (($SortWrappers.$SnapToD<Bool~_Int> x))
    :qid |$Snap.D<Bool~_Int>To$SnapToD<Bool~_Int>|
    )))
(declare-fun $SortWrappers.D<Int~_Bool>To$Snap (D<Int~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD<Int~_Bool> ($Snap) D<Int~_Bool>)
(assert (forall ((x D<Int~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD<Int~_Bool>($SortWrappers.D<Int~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D<Int~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD<Int~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D<Int~_Bool>To$Snap($SortWrappers.$SnapToD<Int~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD<Int~_Bool> x))
    :qid |$Snap.D<Int~_Bool>To$SnapToD<Int~_Bool>|
    )))
(declare-fun $SortWrappers.D<Bool~_Bool>To$Snap (D<Bool~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToD<Bool~_Bool> ($Snap) D<Bool~_Bool>)
(assert (forall ((x D<Bool~_Bool>)) (!
    (= x ($SortWrappers.$SnapToD<Bool~_Bool>($SortWrappers.D<Bool~_Bool>To$Snap x)))
    :pattern (($SortWrappers.D<Bool~_Bool>To$Snap x))
    :qid |$Snap.$SnapToD<Bool~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D<Bool~_Bool>To$Snap($SortWrappers.$SnapToD<Bool~_Bool> x)))
    :pattern (($SortWrappers.$SnapToD<Bool~_Bool> x))
    :qid |$Snap.D<Bool~_Bool>To$SnapToD<Bool~_Bool>|
    )))
(declare-fun $SortWrappers.D<Int~_Int>To$Snap (D<Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD<Int~_Int> ($Snap) D<Int~_Int>)
(assert (forall ((x D<Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToD<Int~_Int>($SortWrappers.D<Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.D<Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToD<Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D<Int~_Int>To$Snap($SortWrappers.$SnapToD<Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToD<Int~_Int> x))
    :qid |$Snap.D<Int~_Int>To$SnapToD<Int~_Int>|
    )))
; ////////// Symbols
(declare-fun f1<Int> (Int) Int)
(declare-fun f2<D<Int~_Int>> (D<Int~_Int>) D<Int~_Int>)
(declare-fun f3<Int> (D<Int~_Int>) Int)
(declare-fun f4<D<Int~_Int>> (Int) D<Int~_Int>)
(declare-fun f5<D<Int~_Int>> (Int) D<Int~_Int>)
(declare-const f6<D<Int~_Int>> D<Int~_Int>)
(declare-fun f1<Int> (Bool) Int)
(declare-fun f2<D<Int~_Int>> (D<Bool~_Int>) D<Int~_Int>)
(declare-fun f3<Bool> (D<Bool~_Int>) Bool)
(declare-fun f4<D<Bool~_Int>> (Bool) D<Bool~_Int>)
(declare-fun f5<D<Bool~_Int>> (Int) D<Bool~_Int>)
(declare-const f6<D<Bool~_Int>> D<Bool~_Int>)
(declare-fun f1<Bool> (Bool) Bool)
(declare-fun f2<D<Bool~_Bool>> (D<Bool~_Bool>) D<Bool~_Bool>)
(declare-fun f3<Bool> (D<Bool~_Bool>) Bool)
(declare-fun f4<D<Bool~_Bool>> (Bool) D<Bool~_Bool>)
(declare-fun f5<D<Bool~_Bool>> (Bool) D<Bool~_Bool>)
(declare-const f6<D<Bool~_Bool>> D<Bool~_Bool>)
(declare-fun f1<Bool> (Int) Bool)
(declare-fun f2<D<Bool~_Bool>> (D<Int~_Bool>) D<Bool~_Bool>)
(declare-fun f3<Int> (D<Int~_Bool>) Int)
(declare-fun f4<D<Int~_Bool>> (Int) D<Int~_Bool>)
(declare-fun f5<D<Int~_Bool>> (Bool) D<Int~_Bool>)
(declare-const f6<D<Int~_Bool>> D<Int~_Bool>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((x Int)) (!
  (= (f3<Int> (f4<D<Int~_Int>> x)) x)
  :pattern ((f3<Int> (f4<D<Int~_Int>> x)))
  :qid |prog.A1|)))
(assert (forall ((x Int)) (!
  (= (f2<D<Int~_Int>> (f5<D<Int~_Int>> x)) (as f6<D<Int~_Int>>  D<Int~_Int>))
  :pattern ((f2<D<Int~_Int>> (f5<D<Int~_Int>> x)))
  :qid |prog.A2|)))
(assert (forall ((x Bool)) (!
  (= (f3<Bool> (f4<D<Bool~_Int>> x)) x)
  :pattern ((f3<Bool> (f4<D<Bool~_Int>> x)))
  :qid |prog.A1|)))
(assert (forall ((x Int)) (!
  (= (f2<D<Int~_Int>> (f5<D<Bool~_Int>> x)) (as f6<D<Int~_Int>>  D<Int~_Int>))
  :pattern ((f2<D<Int~_Int>> (f5<D<Bool~_Int>> x)))
  :qid |prog.A2|)))
(assert (forall ((x Bool)) (!
  (= (f3<Bool> (f4<D<Bool~_Bool>> x)) x)
  :pattern ((f3<Bool> (f4<D<Bool~_Bool>> x)))
  :qid |prog.A1|)))
(assert (forall ((x Bool)) (!
  (=
    (f2<D<Bool~_Bool>> (f5<D<Bool~_Bool>> x))
    (as f6<D<Bool~_Bool>>  D<Bool~_Bool>))
  :pattern ((f2<D<Bool~_Bool>> (f5<D<Bool~_Bool>> x)))
  :qid |prog.A2|)))
(assert (forall ((x Int)) (!
  (= (f3<Int> (f4<D<Int~_Bool>> x)) x)
  :pattern ((f3<Int> (f4<D<Int~_Bool>> x)))
  :qid |prog.A1|)))
(assert (forall ((x Bool)) (!
  (=
    (f2<D<Bool~_Bool>> (f5<D<Int~_Bool>> x))
    (as f6<D<Bool~_Bool>>  D<Bool~_Bool>))
  :pattern ((f2<D<Bool~_Bool>> (f5<D<Int~_Bool>> x)))
  :qid |prog.A2|)))
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
(declare-const x@0@01 D<Int~_Bool>)
(declare-const r@1@01 D<Bool~_Int>)
(declare-const x@2@01 D<Int~_Bool>)
(declare-const r@3@01 D<Bool~_Int>)
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
; y := (f3((f5((f1(y): Int)): D[Int, Int])): Int)
; [eval] (f3((f5((f1(y): Int)): D[Int, Int])): Int)
; [eval] (f5((f1(y): Int)): D[Int, Int])
; [eval] (f1(y): Int)
(declare-const y@5@01 Int)
(assert (= y@5@01 (f3<Int> (f5<D<Int~_Int>> (f1<Int> y@4@01)))))
(pop) ; 2
(pop) ; 1
