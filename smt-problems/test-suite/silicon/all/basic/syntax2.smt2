(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:41:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/basic/syntax2.vpr
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
(declare-sort D2<Int> 0)
(declare-sort D1<D1<Int>> 0)
(declare-sort D1<Int> 0)
(declare-sort D2<D1<Int>> 0)
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
(declare-fun $SortWrappers.D2<Int>To$Snap (D2<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<Int> ($Snap) D2<Int>)
(assert (forall ((x D2<Int>)) (!
    (= x ($SortWrappers.$SnapToD2<Int>($SortWrappers.D2<Int>To$Snap x)))
    :pattern (($SortWrappers.D2<Int>To$Snap x))
    :qid |$Snap.$SnapToD2<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<Int>To$Snap($SortWrappers.$SnapToD2<Int> x)))
    :pattern (($SortWrappers.$SnapToD2<Int> x))
    :qid |$Snap.D2<Int>To$SnapToD2<Int>|
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
(declare-fun $SortWrappers.D2<D1<Int>>To$Snap (D2<D1<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToD2<D1<Int>> ($Snap) D2<D1<Int>>)
(assert (forall ((x D2<D1<Int>>)) (!
    (= x ($SortWrappers.$SnapToD2<D1<Int>>($SortWrappers.D2<D1<Int>>To$Snap x)))
    :pattern (($SortWrappers.D2<D1<Int>>To$Snap x))
    :qid |$Snap.$SnapToD2<D1<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.D2<D1<Int>>To$Snap($SortWrappers.$SnapToD2<D1<Int>> x)))
    :pattern (($SortWrappers.$SnapToD2<D1<Int>> x))
    :qid |$Snap.D2<D1<Int>>To$SnapToD2<D1<Int>>|
    )))
; ////////// Symbols
(declare-fun f1<D2<Int>> (D1<Int>) D2<Int>)
(declare-fun make<D1<Int>> (Int) D1<Int>)
(declare-fun f1b<Int> (D1<Int>) Int)
(declare-fun f2<Int> (D2<Int>) Int)
(declare-fun f2b<Int> (D2<Int>) Int)
(declare-fun f2<D1<Int>> (D2<D1<Int>>) D1<Int>)
(declare-fun f2b<Int> (D2<D1<Int>>) Int)
(declare-fun f1<D2<D1<Int>>> (D1<D1<Int>>) D2<D1<Int>>)
(declare-fun make<D1<D1<Int>>> (D1<Int>) D1<D1<Int>>)
(declare-fun f1b<Int> (D1<D1<Int>>) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((x D1<Int>)) (!
  (=> (>= (f1b<Int> x) 0) (> (f2b<Int> (f1<D2<Int>> x)) 0))
  :pattern ((f1b<Int> x))
  :pattern ((f2b<Int> (f1<D2<Int>> x)))
  :qid |prog.ax2a|)))
(assert (forall ((x D1<Int>)) (!
  (=> (> (f2b<Int> (f1<D2<Int>> x)) 0) (= (f1b<Int> x) 0))
  :pattern ((f2b<Int> (f1<D2<Int>> x)))
  :pattern ((f1b<Int> x))
  :qid |prog.ax2b|)))
(assert (forall ((x D1<D1<Int>>)) (!
  (=> (>= (f1b<Int> x) 0) (> (f2b<Int> (f1<D2<D1<Int>>> x)) 0))
  :pattern ((f1b<Int> x))
  :pattern ((f2b<Int> (f1<D2<D1<Int>>> x)))
  :qid |prog.ax2a|)))
(assert (forall ((x D1<D1<Int>>)) (!
  (=> (> (f2b<Int> (f1<D2<D1<Int>>> x)) 0) (= (f1b<Int> x) 0))
  :pattern ((f2b<Int> (f1<D2<D1<Int>>> x)))
  :pattern ((f1b<Int> x))
  :qid |prog.ax2b|)))
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
; ---------- m1 ----------
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
; var x: Int
(declare-const x@0@01 Int)
; [exec]
; var d1x: D1[Int]
(declare-const d1x@1@01 D1<Int>)
; [exec]
; assert (f1b(d1x): Int) >= 0 ==> (f1b(d1x): Int) == 0
; [eval] (f1b(d1x): Int) >= 0 ==> (f1b(d1x): Int) == 0
; [eval] (f1b(d1x): Int) >= 0
; [eval] (f1b(d1x): Int)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (>= (f1b<Int> d1x@1@01) 0))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (>= (f1b<Int> d1x@1@01) 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | f1b[Int](d1x@1@01) >= 0 | live]
; [else-branch: 0 | !(f1b[Int](d1x@1@01) >= 0) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | f1b[Int](d1x@1@01) >= 0]
(assert (>= (f1b<Int> d1x@1@01) 0))
; [eval] (f1b(d1x): Int) == 0
; [eval] (f1b(d1x): Int)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(f1b[Int](d1x@1@01) >= 0)]
(assert (not (>= (f1b<Int> d1x@1@01) 0)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (>= (f1b<Int> d1x@1@01) 0)) (>= (f1b<Int> d1x@1@01) 0)))
(push) ; 3
(assert (not (=> (>= (f1b<Int> d1x@1@01) 0) (= (f1b<Int> d1x@1@01) 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (>= (f1b<Int> d1x@1@01) 0) (= (f1b<Int> d1x@1@01) 0)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
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
; var d11x: D1[D1[Int]]
(declare-const d11x@2@01 D1<D1<Int>>)
; [exec]
; d11x := (make((make(1): D1[Int])): D1[D1[Int]])
; [eval] (make((make(1): D1[Int])): D1[D1[Int]])
; [eval] (make(1): D1[Int])
(declare-const d11x@3@01 D1<D1<Int>>)
(assert (= d11x@3@01 (make<D1<D1<Int>>> (make<D1<Int>> 1))))
(pop) ; 2
(pop) ; 1
