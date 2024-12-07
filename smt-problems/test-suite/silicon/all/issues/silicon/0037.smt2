(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:50:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0037.vpr
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
(declare-sort Natural 0)
(declare-sort List<Any> 0)
(declare-sort Any 0)
(declare-sort List<Natural> 0)
(declare-sort List<Int> 0)
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
(declare-fun $SortWrappers.NaturalTo$Snap (Natural) $Snap)
(declare-fun $SortWrappers.$SnapToNatural ($Snap) Natural)
(assert (forall ((x Natural)) (!
    (= x ($SortWrappers.$SnapToNatural($SortWrappers.NaturalTo$Snap x)))
    :pattern (($SortWrappers.NaturalTo$Snap x))
    :qid |$Snap.$SnapToNaturalTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.NaturalTo$Snap($SortWrappers.$SnapToNatural x)))
    :pattern (($SortWrappers.$SnapToNatural x))
    :qid |$Snap.NaturalTo$SnapToNatural|
    )))
(declare-fun $SortWrappers.List<Any>To$Snap (List<Any>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Any> ($Snap) List<Any>)
(assert (forall ((x List<Any>)) (!
    (= x ($SortWrappers.$SnapToList<Any>($SortWrappers.List<Any>To$Snap x)))
    :pattern (($SortWrappers.List<Any>To$Snap x))
    :qid |$Snap.$SnapToList<Any>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Any>To$Snap($SortWrappers.$SnapToList<Any> x)))
    :pattern (($SortWrappers.$SnapToList<Any> x))
    :qid |$Snap.List<Any>To$SnapToList<Any>|
    )))
(declare-fun $SortWrappers.AnyTo$Snap (Any) $Snap)
(declare-fun $SortWrappers.$SnapToAny ($Snap) Any)
(assert (forall ((x Any)) (!
    (= x ($SortWrappers.$SnapToAny($SortWrappers.AnyTo$Snap x)))
    :pattern (($SortWrappers.AnyTo$Snap x))
    :qid |$Snap.$SnapToAnyTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.AnyTo$Snap($SortWrappers.$SnapToAny x)))
    :pattern (($SortWrappers.$SnapToAny x))
    :qid |$Snap.AnyTo$SnapToAny|
    )))
(declare-fun $SortWrappers.List<Natural>To$Snap (List<Natural>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Natural> ($Snap) List<Natural>)
(assert (forall ((x List<Natural>)) (!
    (= x ($SortWrappers.$SnapToList<Natural>($SortWrappers.List<Natural>To$Snap x)))
    :pattern (($SortWrappers.List<Natural>To$Snap x))
    :qid |$Snap.$SnapToList<Natural>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Natural>To$Snap($SortWrappers.$SnapToList<Natural> x)))
    :pattern (($SortWrappers.$SnapToList<Natural> x))
    :qid |$Snap.List<Natural>To$SnapToList<Natural>|
    )))
(declare-fun $SortWrappers.List<Int>To$Snap (List<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToList<Int> ($Snap) List<Int>)
(assert (forall ((x List<Int>)) (!
    (= x ($SortWrappers.$SnapToList<Int>($SortWrappers.List<Int>To$Snap x)))
    :pattern (($SortWrappers.List<Int>To$Snap x))
    :qid |$Snap.$SnapToList<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.List<Int>To$Snap($SortWrappers.$SnapToList<Int> x)))
    :pattern (($SortWrappers.$SnapToList<Int> x))
    :qid |$Snap.List<Int>To$SnapToList<Int>|
    )))
; ////////// Symbols
(declare-const zero<Natural> Natural)
(declare-fun successor<Natural> (Natural) Natural)
(declare-fun nil<List<Int>> (Int) List<Int>)
(declare-fun cons<List<Int>> (Int List<Int>) List<Int>)
(declare-fun drop<List<Int>> (Natural List<Int>) List<Int>)
(declare-fun nil<List<Natural>> (Natural) List<Natural>)
(declare-fun cons<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun drop<List<Natural>> (Natural List<Natural>) List<Natural>)
(declare-fun nil<List<Any>> (Any) List<Any>)
(declare-fun cons<List<Any>> (Any List<Any>) List<Any>)
(declare-fun drop<List<Any>> (Natural List<Any>) List<Any>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((l Natural) (r Natural)) (!
  (= (nil<List<Natural>> l) (nil<List<Natural>> r))
  :pattern ((nil<List<Natural>> l) (nil<List<Natural>> r))
  :qid |prog.equalNilNil|)))
(assert (forall ((x Natural) (xs List<Natural>) (t Natural)) (!
  (not (= (cons<List<Natural>> x xs) (nil<List<Natural>> t)))
  :pattern ((cons<List<Natural>> x xs) (nil<List<Natural>> t))
  :qid |prog.equalConsNil|)))
(assert (forall ((t Natural) (y Natural) (ys List<Natural>)) (!
  (not (= (nil<List<Natural>> t) (cons<List<Natural>> y ys)))
  :pattern ((nil<List<Natural>> t) (cons<List<Natural>> y ys))
  :qid |prog.equalNilCons|)))
(assert (forall ((x Natural) (xs List<Natural>) (y Natural) (ys List<Natural>)) (!
  (=
    (= (cons<List<Natural>> x xs) (cons<List<Natural>> y ys))
    (and (= x y) (= xs ys)))
  :pattern ((cons<List<Natural>> x xs) (cons<List<Natural>> y ys))
  :qid |prog.equalConsCons|)))
(assert (forall ((xs List<Int>)) (!
  (= (drop<List<Int>> (as zero<Natural>  Natural) xs) xs)
  :pattern ((drop<List<Int>> (as zero<Natural>  Natural) xs))
  :qid |prog.dropZeroList|)))
(assert (forall ((n Natural) (t Int)) (!
  (=
    (drop<List<Int>> (successor<Natural> n) (nil<List<Int>> t))
    (nil<List<Int>> t))
  :pattern ((drop<List<Int>> (successor<Natural> n) (nil<List<Int>> t)))
  :qid |prog.dropSuccessorNil|)))
(assert (forall ((x Natural) (e Int) (xs List<Int>)) (!
  (=
    (drop<List<Int>> (successor<Natural> x) (cons<List<Int>> e xs))
    (drop<List<Int>> x xs))
  :pattern ((cons<List<Int>> e xs) (drop<List<Int>> x xs))
  :pattern ((drop<List<Int>> (successor<Natural> x) (cons<List<Int>> e xs)))
  :qid |prog.dropSuccessorCons|)))
(assert (forall ((xs List<Natural>)) (!
  (= (drop<List<Natural>> (as zero<Natural>  Natural) xs) xs)
  :pattern ((drop<List<Natural>> (as zero<Natural>  Natural) xs))
  :qid |prog.dropZeroList|)))
(assert (forall ((n Natural) (t Natural)) (!
  (=
    (drop<List<Natural>> (successor<Natural> n) (nil<List<Natural>> t))
    (nil<List<Natural>> t))
  :pattern ((drop<List<Natural>> (successor<Natural> n) (nil<List<Natural>> t)))
  :qid |prog.dropSuccessorNil|)))
(assert (forall ((x Natural) (e Natural) (xs List<Natural>)) (!
  (=
    (drop<List<Natural>> (successor<Natural> x) (cons<List<Natural>> e xs))
    (drop<List<Natural>> x xs))
  :pattern ((cons<List<Natural>> e xs) (drop<List<Natural>> x xs))
  :pattern ((drop<List<Natural>> (successor<Natural> x) (cons<List<Natural>> e xs)))
  :qid |prog.dropSuccessorCons|)))
(assert (forall ((xs List<Any>)) (!
  (= (drop<List<Any>> (as zero<Natural>  Natural) xs) xs)
  :pattern ((drop<List<Any>> (as zero<Natural>  Natural) xs))
  :qid |prog.dropZeroList|)))
(assert (forall ((n Natural) (t Any)) (!
  (=
    (drop<List<Any>> (successor<Natural> n) (nil<List<Any>> t))
    (nil<List<Any>> t))
  :pattern ((drop<List<Any>> (successor<Natural> n) (nil<List<Any>> t)))
  :qid |prog.dropSuccessorNil|)))
(assert (forall ((x Natural) (e Any) (xs List<Any>)) (!
  (=
    (drop<List<Any>> (successor<Natural> x) (cons<List<Any>> e xs))
    (drop<List<Any>> x xs))
  :pattern ((cons<List<Any>> e xs) (drop<List<Any>> x xs))
  :pattern ((drop<List<Any>> (successor<Natural> x) (cons<List<Any>> e xs)))
  :qid |prog.dropSuccessorCons|)))
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
; ---------- property11 ----------
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@0@01 $Snap)
(assert (= $t@0@01 $Snap.unit))
; [eval] (forall xs: List[Any] :: { (drop(zero(), xs): List[Any]) } (drop(zero(), xs): List[Any]) == xs)
(declare-const xs@1@01 List<Any>)
(push) ; 3
; [eval] (drop(zero(), xs): List[Any]) == xs
; [eval] (drop(zero(), xs): List[Any])
; [eval] zero()
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((xs@1@01 List<Any>)) (!
  (= (drop<List<Any>> (as zero<Natural>  Natural) xs@1@01) xs@1@01)
  :pattern ((drop<List<Any>> (as zero<Natural>  Natural) xs@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0037.vpr@52@11@52@57|)))
(pop) ; 2
(push) ; 2
; [eval] (forall xs: List[Any] :: { (drop(zero(), xs): List[Any]) } (drop(zero(), xs): List[Any]) == xs)
(declare-const xs@2@01 List<Any>)
(push) ; 3
; [eval] (drop(zero(), xs): List[Any]) == xs
; [eval] (drop(zero(), xs): List[Any])
; [eval] zero()
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((xs@2@01 List<Any>)) (!
  (= (drop<List<Any>> (as zero<Natural>  Natural) xs@2@01) xs@2@01)
  :pattern ((drop<List<Any>> (as zero<Natural>  Natural) xs@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0037.vpr@52@11@52@57|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((xs@2@01 List<Any>)) (!
  (= (drop<List<Any>> (as zero<Natural>  Natural) xs@2@01) xs@2@01)
  :pattern ((drop<List<Any>> (as zero<Natural>  Natural) xs@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0037.vpr@52@11@52@57|)))
(pop) ; 2
(pop) ; 1
