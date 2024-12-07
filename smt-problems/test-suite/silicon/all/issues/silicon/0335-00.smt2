(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:24
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0335.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Array_ 0)
(declare-sort $FVF<val> 0)
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
(declare-fun $SortWrappers.Set<Int>To$Snap (Set<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Int> ($Snap) Set<Int>)
(assert (forall ((x Set<Int>)) (!
    (= x ($SortWrappers.$SnapToSet<Int>($SortWrappers.Set<Int>To$Snap x)))
    :pattern (($SortWrappers.Set<Int>To$Snap x))
    :qid |$Snap.$SnapToSet<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Int>To$Snap($SortWrappers.$SnapToSet<Int> x)))
    :pattern (($SortWrappers.$SnapToSet<Int> x))
    :qid |$Snap.Set<Int>To$SnapToSet<Int>|
    )))
(declare-fun $SortWrappers.Set<$Ref>To$Snap (Set<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Ref> ($Snap) Set<$Ref>)
(assert (forall ((x Set<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSet<$Ref>($SortWrappers.Set<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Set<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSet<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Ref>To$Snap($SortWrappers.$SnapToSet<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSet<$Ref> x))
    :qid |$Snap.Set<$Ref>To$SnapToSet<$Ref>|
    )))
(declare-fun $SortWrappers.Set<$Snap>To$Snap (Set<$Snap>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<$Snap> ($Snap) Set<$Snap>)
(assert (forall ((x Set<$Snap>)) (!
    (= x ($SortWrappers.$SnapToSet<$Snap>($SortWrappers.Set<$Snap>To$Snap x)))
    :pattern (($SortWrappers.Set<$Snap>To$Snap x))
    :qid |$Snap.$SnapToSet<$Snap>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<$Snap>To$Snap($SortWrappers.$SnapToSet<$Snap> x)))
    :pattern (($SortWrappers.$SnapToSet<$Snap> x))
    :qid |$Snap.Set<$Snap>To$SnapToSet<$Snap>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Array_To$Snap (Array_) $Snap)
(declare-fun $SortWrappers.$SnapToArray_ ($Snap) Array_)
(assert (forall ((x Array_)) (!
    (= x ($SortWrappers.$SnapToArray_($SortWrappers.Array_To$Snap x)))
    :pattern (($SortWrappers.Array_To$Snap x))
    :qid |$Snap.$SnapToArray_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Array_To$Snap($SortWrappers.$SnapToArray_ x)))
    :pattern (($SortWrappers.$SnapToArray_ x))
    :qid |$Snap.Array_To$SnapToArray_|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<val>To$Snap ($FVF<val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val> ($Snap) $FVF<val>)
(assert (forall ((x $FVF<val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val>($SortWrappers.$FVF<val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val>To$Snap($SortWrappers.$SnapTo$FVF<val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val> x))
    :qid |$Snap.$FVF<val>To$SnapTo$FVF<val>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_skolem_diff (Set<Int> Set<Int>) Int)
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_skolem_diff (Set<$Ref> Set<$Ref>) $Ref)
(declare-fun Set_card (Set<$Snap>) Int)
(declare-const Set_empty Set<$Snap>)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
(declare-fun Set_unionone (Set<$Snap> $Snap) Set<$Snap>)
(declare-fun Set_union (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_intersection (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_difference (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_subset (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_skolem_diff (Set<$Snap> Set<$Snap>) $Snap)
(declare-fun loc<Ref> (Array_ Int) $Ref)
(declare-fun len<Int> (Array_) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun array%trigger ($Snap Array_) Bool)
(declare-fun tree%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Int)) (!
  (not (Set_in o (as Set_empty  Set<Int>)))
  :pattern ((Set_in o (as Set_empty  Set<Int>)))
  )))
(assert (forall ((s Set<Int>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Int))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Int)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Int) (o Int)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Int)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Int>) (x Int) (o Int)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Int>) (x Int) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (Set_subset a b)
    (forall ((o Int)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Ref)) (!
  (not (Set_in o (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in o (as Set_empty  Set<$Ref>)))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Ref))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Ref)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Ref) (o $Ref)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Ref)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (o $Ref)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Ref)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Snap)) (!
  (not (Set_in o (as Set_empty  Set<$Snap>)))
  :pattern ((Set_in o (as Set_empty  Set<$Snap>)))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Snap>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Snap))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Snap)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Snap) (o $Snap)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Snap)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (o $Snap)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Snap)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Array_) (i Int) (j Int)) (!
  (=>
    (and
      (>= i 0)
      (and
        (>= j 0)
        (and (< i (len<Int> a)) (and (< j (len<Int> a)) (not (= i j))))))
    (not (= (loc<Ref> a i) (loc<Ref> a j))))
  :pattern ((loc<Ref> a i) (loc<Ref> a j))
  :qid |prog.loc_inject|)))
; /field_value_functions_axioms.smt2 [val: Int]
(assert (forall ((vs $FVF<val>) (ws $FVF<val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val vs) ($FVF.domain_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val vs))
            (= ($FVF.lookup_val vs x) ($FVF.lookup_val ws x)))
          :pattern (($FVF.lookup_val vs x) ($FVF.lookup_val ws x))
          :qid |qp.$FVF<val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val>To$Snap vs)
              ($SortWrappers.$FVF<val>To$Snap ws)
              )
    :qid |qp.$FVF<val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val pm r))
    :pattern (($FVF.perm_val pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
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
; ---------- _treeToArray ----------
(declare-const root@0@01 $Ref)
(declare-const a@1@01 Array_)
(declare-const i@2@01 Int)
(declare-const root@3@01 $Ref)
(declare-const a@4@01 Array_)
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 3
(assert (tree%trigger ($Snap.first $t@7@01) root@3@01))
(assert (=
  ($Snap.first $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@7@01))
    ($Snap.second ($Snap.first $t@7@01)))))
(declare-const sm@8@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01)))))
(assert (not (= root@3@01 $Ref.null)))
(declare-const sm@9@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@7@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))))
; [eval] root.left != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(First:($t@7@01))) != Null | live]
; [else-branch: 0 | First:(Second:(First:($t@7@01))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | First:(Second:(First:($t@7@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(Second:(Second:(First:($t@7@01))))) != Null | live]
; [else-branch: 1 | First:(Second:(Second:(Second:(First:($t@7@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | First:(Second:(Second:(Second:(First:($t@7@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
    $Ref.null)))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@9@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef1|))))
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(set-option :timeout 0)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@10@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@11@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 2 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 2 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 3 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 3 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 3 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 2 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 4 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 4 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(pop) ; 8
(push) ; 8
; [else-branch: 4 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef3|))))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@12@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@12@01  Int)
    ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@12@01  Int)
    ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@12@01  Int)
    ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@12@01  Int)
    ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | First:(Second:(Second:(Second:(First:($t@7@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@9@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef1|))))
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@13@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@14@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 5 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 5 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 6 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 6 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef5|))))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 6 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef5|))))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 5 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 7 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 7 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef5|))))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef5|))))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@15@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@15@01  Int)
    ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@15@01  Int)
    ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@15@01  Int)
    ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@15@01  Int)
    ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 0 | First:(Second:(First:($t@7@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(Second:(Second:(First:($t@7@01))))) != Null | live]
; [else-branch: 8 | First:(Second:(Second:(Second:(First:($t@7@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 8 | First:(Second:(Second:(Second:(First:($t@7@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
    $Ref.null)))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@9@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef1|))))
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@16@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@17@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 9 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 9 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 10 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 10 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef7|))))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 10 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef7|))))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 9 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 11 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 11 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef7|))))
(pop) ; 8
(push) ; 8
; [else-branch: 11 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef7|))))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@18@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@18@01  Int)
    ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@18@01  Int)
    ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@18@01  Int)
    ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@18@01  Int)
    ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | First:(Second:(Second:(Second:(First:($t@7@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@9@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef1|))))
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@19@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@20@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 12 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 13 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 13 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef9|))))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 13 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef9|))))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 12 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 14 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 14 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef9|))))
(pop) ; 8
(push) ; 8
; [else-branch: 14 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef9|))))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@21@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@21@01  Int)
    ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@21@01  Int)
    ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@21@01  Int)
    ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (=
    (as joined_unfolding@21@01  Int)
    ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.first $t@6@01) root@3@01)
  (=
    ($Snap.first $t@6@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@6@01))
      ($Snap.second ($Snap.first $t@6@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@6@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(declare-const joined_unfolding@22@01 Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@22@01  Bool)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01)
      (as joined_unfolding@12@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@22@01  Bool)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01)
      (as joined_unfolding@15@01  Int)))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (=
    (as joined_unfolding@22@01  Bool)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01)
      (as joined_unfolding@18@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (=
    (as joined_unfolding@22@01  Bool)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01)
      (as joined_unfolding@21@01  Int)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@9@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@9@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@10@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef3|)))
(assert (and
  (tree%trigger ($Snap.first $t@7@01) root@3@01)
  (=
    ($Snap.first $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@7@01))
      ($Snap.second ($Snap.first $t@7@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))))
  (not (= root@3@01 $Ref.null))
  ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@7@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@12@01  Int)
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@12@01  Int)
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@12@01  Int)
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@12@01  Int)
        ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01)))
    (tree%trigger ($Snap.first $t@6@01) root@3@01)
    (=
      ($Snap.first $t@6@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.second ($Snap.first $t@6@01))))
    (=
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($Snap.second ($Snap.first $t@6@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (and
  (tree%trigger ($Snap.first $t@7@01) root@3@01)
  (=
    ($Snap.first $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@7@01))
      ($Snap.second ($Snap.first $t@7@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))))
  (not (= root@3@01 $Ref.null))
  ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@7@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@15@01  Int)
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@15@01  Int)
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@15@01  Int)
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@15@01  Int)
        ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01)))
    (tree%trigger ($Snap.first $t@6@01) root@3@01)
    (=
      ($Snap.first $t@6@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.second ($Snap.first $t@6@01))))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@14@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($Snap.second ($Snap.first $t@6@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@16@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (and
  (tree%trigger ($Snap.first $t@7@01) root@3@01)
  (=
    ($Snap.first $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@7@01))
      ($Snap.second ($Snap.first $t@7@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))))
  (not (= root@3@01 $Ref.null))
  ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@7@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@18@01  Int)
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@18@01  Int)
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@18@01  Int)
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@18@01  Int)
        ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01)))
    (tree%trigger ($Snap.first $t@6@01) root@3@01)
    (=
      ($Snap.first $t@6@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.second ($Snap.first $t@6@01))))
    (=
      ($FVF.lookup_val (as sm@16@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($Snap.second ($Snap.first $t@6@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef9|)))
(assert (and
  (tree%trigger ($Snap.first $t@7@01) root@3@01)
  (=
    ($Snap.first $t@7@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@7@01))
      ($Snap.second ($Snap.first $t@7@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@8@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@7@01))))
  (not (= root@3@01 $Ref.null))
  ($FVF.loc_val ($FVF.lookup_val (as sm@9@01  $FVF<val>) root@3@01) root@3@01)
  (=
    ($Snap.second ($Snap.first $t@7@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@7@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@7@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@7@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@21@01  Int)
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (=
        (as joined_unfolding@21@01  Int)
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@21@01  Int)
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (=
        (as joined_unfolding@21@01  Int)
        ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01)))
    (tree%trigger ($Snap.first $t@6@01) root@3@01)
    (=
      ($Snap.first $t@6@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@6@01))
        ($Snap.second ($Snap.first $t@6@01))))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($Snap.second ($Snap.first $t@6@01))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
        ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    (=
      ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
            $Ref.null)))))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@7@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@7@01))))
        $Ref.null)))))
(assert (as joined_unfolding@22@01  Bool))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(tree(root), write)
(assert (=
  ($Snap.first $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@6@01))
    ($Snap.second ($Snap.first $t@6@01)))))
(declare-const sm@23@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(assert (not (= root@3@01 $Ref.null)))
(declare-const sm@24@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01) root@3@01))
(assert (=
  ($Snap.second ($Snap.first $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
; [eval] root.left != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 15 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 16 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
; [exec]
; unfold acc(array(a), write)
(declare-const i@25@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 17 | !(0 <= i@25@01) | live]
; [else-branch: 17 | 0 <= i@25@01 | live]
(push) ; 7
; [then-branch: 17 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 17 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
(assert (and (<= 0 i@25@01) (< i@25@01 (len<Int> a@4@01))))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@26@01 ($Ref) Int)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (len<Int> a@4@01)))
    (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@25@01)) (loc<Ref> a@4@01 i@25@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@25@01 Int) (i2@25@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@25@01) (< i1@25@01 (len<Int> a@4@01)))
      (and (<= 0 i2@25@01) (< i2@25@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 i1@25@01) (loc<Ref> a@4@01 i2@25@01)))
    (= i1@25@01 i2@25@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (len<Int> a@4@01)))
    (and
      (= (inv@26@01 (loc<Ref> a@4@01 i@25@01)) i@25@01)
      (img@27@01 (loc<Ref> a@4@01 i@25@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@25@01)) (loc<Ref> a@4@01 i@25@01)))
  :qid |quant-u-4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@26@01 r)) r))
  :pattern ((inv@26@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 (len<Int> a@4@01)))
    (not (= (loc<Ref> a@4@01 i@25@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@25@01)) (loc<Ref> a@4@01 i@25@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@28@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) (len<Int> a@4@01))))
    (=
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) (len<Int> a@4@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern ((inv@26@01 r))
  :qid |quant-u-5|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($Snap.second $t@6@01) a@4@01))
; [exec]
; fold acc(array(a), write)
(declare-const i@29@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 18 | !(0 <= i@29@01) | live]
; [else-branch: 18 | 0 <= i@29@01 | live]
(push) ; 7
; [then-branch: 18 | !(0 <= i@29@01)]
(assert (not (<= 0 i@29@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 18 | 0 <= i@29@01]
(assert (<= 0 i@29@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
(assert (and (<= 0 i@29@01) (< i@29@01 (len<Int> a@4@01))))
; [eval] loc(a, i)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@30@01 ($Ref) Int)
(declare-fun img@31@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 0 i@29@01) (< i@29@01 (len<Int> a@4@01)))
    (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@4@01 i@29@01)) (loc<Ref> a@4@01 i@29@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@29@01) (< i1@29@01 (len<Int> a@4@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@4@01 i1@29@01)) (loc<Ref> a@4@01 i1@29@01)))
      (and
        (and (<= 0 i2@29@01) (< i2@29@01 (len<Int> a@4@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@4@01 i2@29@01)) (loc<Ref> a@4@01 i2@29@01)))
      (= (loc<Ref> a@4@01 i1@29@01) (loc<Ref> a@4@01 i2@29@01)))
    (= i1@29@01 i2@29@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 0 i@29@01) (< i@29@01 (len<Int> a@4@01)))
    (and
      (= (inv@30@01 (loc<Ref> a@4@01 i@29@01)) i@29@01)
      (img@31@01 (loc<Ref> a@4@01 i@29@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@4@01 i@29@01)) (loc<Ref> a@4@01 i@29@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@01 r)
      (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern ((inv@30@01 r))
  :qid |quant-u-7|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@32@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01)))
      (img@31@01 r)
      (= r (loc<Ref> a@4@01 (inv@30@01 r))))
    ($Perm.min
      (ite
        (and
          (img@27@01 r)
          (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01)))
      (img@31@01 r)
      (= r (loc<Ref> a@4@01 (inv@30@01 r))))
    ($Perm.min
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@32@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@27@01 r)
          (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@32@01 r))
    $Perm.No)
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01)))
      (img@31@01 r)
      (= r (loc<Ref> a@4@01 (inv@30@01 r))))
    (= (- $Perm.Write (pTaken@32@01 r)) $Perm.No))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@34@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))
      (and
        (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01)))
        (img@31@01 r)))
    (=>
      (and
        (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01)))
        (img@31@01 r))
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>))))
  :qid |qp.fvfDomDef18|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01)))
        (img@31@01 r))
      (= r root@3@01))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) (len<Int> a@4@01)))
        (img@31@01 r))
      (and
        (img@27@01 r)
        (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) (len<Int> a@4@01)))))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef17|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@34@01  $FVF<val>)) a@4@01))
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 19 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
; [exec]
; _treeToArray(root.right, a, 0)
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@35@01) $Snap.unit))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(set-option :timeout 0)
(push) ; 6
(assert (tree%trigger ($Snap.first $t@35@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.first $t@35@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@35@01))
    ($Snap.second ($Snap.first $t@35@01)))))
(declare-const sm@36@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@35@01)))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
(declare-const sm@37@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef21|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.first $t@35@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@35@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@35@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:(First:($t@35@01))) != Null | live]
; [else-branch: 20 | First:(Second:(First:($t@35@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 20 | First:(Second:(First:($t@35@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
    $Ref.null)))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | First:(Second:(Second:(Second:(First:($t@35@01))))) != Null | live]
; [else-branch: 21 | First:(Second:(Second:(Second:(First:($t@35@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 21 | First:(Second:(Second:(Second:(First:($t@35@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef21|))))
(set-option :timeout 0)
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@38@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@39@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 22 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 22 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 23 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 23 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef24|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 23 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef24|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 22 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 24 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 24 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef24|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 24 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
    :qid |qp.fvfValDef23|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef24|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@40@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@40@01  Int)
    ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@40@01  Int)
    ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@40@01  Int)
    ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@40@01  Int)
    ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 21 | First:(Second:(Second:(Second:(First:($t@35@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef21|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@41@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@41@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@42@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef27|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 26 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 26 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef27|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 26 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef27|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 25 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 27 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 27 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef27|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 27 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef25|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef27|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@43@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@43@01  Int)
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@43@01  Int)
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@43@01  Int)
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@43@01  Int)
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@41@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@41@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@41@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@41@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 20 | First:(Second:(First:($t@35@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@35@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | First:(Second:(Second:(Second:(First:($t@35@01))))) != Null | live]
; [else-branch: 28 | First:(Second:(Second:(Second:(First:($t@35@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 28 | First:(Second:(Second:(Second:(First:($t@35@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef21|))))
(set-option :timeout 0)
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@44@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@44@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@45@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef30|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 29 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 29 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef28|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
    :qid |qp.fvfValDef29|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef30|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 30 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef28|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
    :qid |qp.fvfValDef29|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef30|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 29 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 31 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 31 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef28|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
    :qid |qp.fvfValDef29|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef30|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 31 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef28|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
    :qid |qp.fvfValDef29|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef30|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@46@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@46@01  Int)
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@46@01  Int)
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@46@01  Int)
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@46@01  Int)
    ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef30|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@44@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@44@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@44@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@44@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 28 | First:(Second:(Second:(Second:(First:($t@35@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef21|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@47@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@48@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef33|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 32 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 32 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 33 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 33 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef31|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
    :qid |qp.fvfValDef32|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef33|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 33 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef31|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
    :qid |qp.fvfValDef32|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef33|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 32 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 34 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 34 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef31|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
    :qid |qp.fvfValDef32|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef33|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 34 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef31|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
    :qid |qp.fvfValDef32|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef33|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@49@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@49@01  Int)
    ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@49@01  Int)
    ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@49@01  Int)
    ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@49@01  Int)
    ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef33|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@50@01 Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@50@01  Bool)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@40@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@50@01  Bool)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@43@01  Int)))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
      $Ref.null))
  (=
    (as joined_unfolding@50@01  Bool)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@46@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
      $Ref.null))
  (=
    (as joined_unfolding@50@01  Bool)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@49@01  Int)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@37@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef24|)))
(assert (and
  (tree%trigger ($Snap.first $t@35@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@35@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@35@01))
      ($Snap.second ($Snap.first $t@35@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@35@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@35@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@35@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@35@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@40@01  Int)
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@40@01  Int)
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@40@01  Int)
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@40@01  Int)
        ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@39@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (and
  (tree%trigger ($Snap.first $t@35@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@35@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@35@01))
      ($Snap.second ($Snap.first $t@35@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@35@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@35@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@35@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@35@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@43@01  Int)
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@43@01  Int)
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@43@01  Int)
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@43@01  Int)
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@41@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@42@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@45@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@44@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@45@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef30|)))
(assert (and
  (tree%trigger ($Snap.first $t@35@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@35@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@35@01))
      ($Snap.second ($Snap.first $t@35@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@35@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@35@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@35@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@35@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@46@01  Int)
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@46@01  Int)
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@46@01  Int)
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@46@01  Int)
        ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@45@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@48@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@48@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef33|)))
(assert (and
  (tree%trigger ($Snap.first $t@35@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@35@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@35@01))
      ($Snap.second ($Snap.first $t@35@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@36@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@35@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@37@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@35@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@35@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@35@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@35@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@49@01  Int)
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@49@01  Int)
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@49@01  Int)
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@49@01  Int)
        ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@48@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@35@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@35@01))))
        $Ref.null)))))
(assert (as joined_unfolding@50@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(tree(root), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (= r root@3@01)
    ($Perm.min (ite (= r root@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@51@01 root@3@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r root@3@01) (= (- $Perm.Write (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 35 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 35 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 36 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 36 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.first $t@35@01))))) root@3@01))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 8
(declare-const sm@52@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@52@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01)))
(declare-const sm@53@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@53@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@53@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@52@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@53@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef35|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@53@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 37 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 37 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 37 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 38 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 38 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@53@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@53@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
    :qid |qp.fvfValDef34|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@52@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@53@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef35|))))
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(set-option :timeout 0)
(push) ; 11
(declare-const sm@54@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@54@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@55@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 39 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 39 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 40 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 40 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 40 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(push) ; 14
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef37|))))
(pop) ; 13
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@54@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) root@3@01) root@3@01)))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@53@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@53@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@52@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@53@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@55@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@54@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@55@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@52@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@53@01  $FVF<val>) root@3@01) root@3@01)))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (and
    (=
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@55@01  $FVF<val>) root@3@01) root@3@01)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(set-option :timeout 0)
(push) ; 8
(assert (not (=
  ($FVF.lookup_val (as sm@53@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@55@01  $FVF<val>) root@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@53@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@55@01  $FVF<val>) root@3@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !(root.right != null)
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
; [else-branch: 41 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 41 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 16 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
; [exec]
; unfold acc(array(a), write)
(declare-const i@56@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 42 | !(0 <= i@56@01) | live]
; [else-branch: 42 | 0 <= i@56@01 | live]
(push) ; 7
; [then-branch: 42 | !(0 <= i@56@01)]
(assert (not (<= 0 i@56@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 42 | 0 <= i@56@01]
(assert (<= 0 i@56@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
(assert (and (<= 0 i@56@01) (< i@56@01 (len<Int> a@4@01))))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@57@01 ($Ref) Int)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 (len<Int> a@4@01)))
    (or (<= 0 i@56@01) (not (<= 0 i@56@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@56@01)) (loc<Ref> a@4@01 i@56@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@56@01 Int) (i2@56@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@56@01) (< i1@56@01 (len<Int> a@4@01)))
      (and (<= 0 i2@56@01) (< i2@56@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 i1@56@01) (loc<Ref> a@4@01 i2@56@01)))
    (= i1@56@01 i2@56@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 (len<Int> a@4@01)))
    (and
      (= (inv@57@01 (loc<Ref> a@4@01 i@56@01)) i@56@01)
      (img@58@01 (loc<Ref> a@4@01 i@56@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@56@01)) (loc<Ref> a@4@01 i@56@01)))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and (<= 0 i@56@01) (< i@56@01 (len<Int> a@4@01)))
    (not (= (loc<Ref> a@4@01 i@56@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@56@01)) (loc<Ref> a@4@01 i@56@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@59@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (len<Int> a@4@01))))
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (len<Int> a@4@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) r) r))
  :pattern ((inv@57@01 r))
  :qid |quant-u-16|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($Snap.second $t@6@01) a@4@01))
; [exec]
; fold acc(array(a), write)
(declare-const i@60@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 43 | !(0 <= i@60@01) | live]
; [else-branch: 43 | 0 <= i@60@01 | live]
(push) ; 7
; [then-branch: 43 | !(0 <= i@60@01)]
(assert (not (<= 0 i@60@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 43 | 0 <= i@60@01]
(assert (<= 0 i@60@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@60@01) (not (<= 0 i@60@01))))
(assert (and (<= 0 i@60@01) (< i@60@01 (len<Int> a@4@01))))
; [eval] loc(a, i)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@61@01 ($Ref) Int)
(declare-fun img@62@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@60@01 Int)) (!
  (=>
    (and (<= 0 i@60@01) (< i@60@01 (len<Int> a@4@01)))
    (or (<= 0 i@60@01) (not (<= 0 i@60@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@4@01 i@60@01)) (loc<Ref> a@4@01 i@60@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@60@01 Int) (i2@60@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@60@01) (< i1@60@01 (len<Int> a@4@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@4@01 i1@60@01)) (loc<Ref> a@4@01 i1@60@01)))
      (and
        (and (<= 0 i2@60@01) (< i2@60@01 (len<Int> a@4@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@4@01 i2@60@01)) (loc<Ref> a@4@01 i2@60@01)))
      (= (loc<Ref> a@4@01 i1@60@01) (loc<Ref> a@4@01 i2@60@01)))
    (= i1@60@01 i2@60@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@60@01 Int)) (!
  (=>
    (and (<= 0 i@60@01) (< i@60@01 (len<Int> a@4@01)))
    (and
      (= (inv@61@01 (loc<Ref> a@4@01 i@60@01)) i@60@01)
      (img@62@01 (loc<Ref> a@4@01 i@60@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@4@01 i@60@01)) (loc<Ref> a@4@01 i@60@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@01 r)
      (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@61@01 r)) r))
  :pattern ((inv@61@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) r) r))
  :pattern ((inv@61@01 r))
  :qid |quant-u-18|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01)))
      (img@62@01 r)
      (= r (loc<Ref> a@4@01 (inv@61@01 r))))
    ($Perm.min
      (ite
        (and
          (img@58@01 r)
          (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01)))
      (img@62@01 r)
      (= r (loc<Ref> a@4@01 (inv@61@01 r))))
    ($Perm.min
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@63@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@58@01 r)
          (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@63@01 r))
    $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01)))
      (img@62@01 r)
      (= r (loc<Ref> a@4@01 (inv@61@01 r))))
    (= (- $Perm.Write (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@65@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@65@01  $FVF<val>)))
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01)))
        (img@62@01 r)))
    (=>
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01)))
        (img@62@01 r))
      (Set_in r ($FVF.domain_val (as sm@65@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@65@01  $FVF<val>))))
  :qid |qp.fvfDomDef44|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01)))
        (img@62@01 r))
      (= r root@3@01))
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (len<Int> a@4@01)))
        (img@62@01 r))
      (and
        (img@58@01 r)
        (and (<= 0 (inv@57@01 r)) (< (inv@57@01 r) (len<Int> a@4@01)))))
    (=
      ($FVF.lookup_val (as sm@65@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@65@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef43|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@65@01  $FVF<val>)) a@4@01))
; [eval] root.right != null
; [then-branch: 44 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 44 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 44 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(pop) ; 5
; [eval] !(root.right != null)
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 45 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
; [else-branch: 45 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 45 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
; [exec]
; fold acc(tree(root), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@66@01 ((r $Ref)) $Perm
  (ite
    (= r root@3@01)
    ($Perm.min (ite (= r root@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@66@01 root@3@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r root@3@01) (= (- $Perm.Write (pTaken@66@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 46 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 46 | First:(Second:(First:($t@6@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
; [eval] root.right != null
; [then-branch: 47 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 47 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 7
; [else-branch: 47 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        $Snap.unit)))) root@3@01))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 8
(declare-const sm@67@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@67@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01)))
(declare-const sm@68@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@68@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@67@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@68@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 48 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 48 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
; [then-branch: 49 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 49 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 10
; [else-branch: 49 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@68@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
    :qid |qp.fvfValDef45|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@67@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef46|))))
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 11
(declare-const sm@69@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@69@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@70@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@70@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@70@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@69@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@70@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | First:(Second:(First:($t@6@01))) != Null | live]
; [else-branch: 50 | First:(Second:(First:($t@6@01))) == Null | dead]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 50 | First:(Second:(First:($t@6@01))) != Null]
; [eval] root.right != null
; [then-branch: 51 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 51 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 13
; [else-branch: 51 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@70@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@70@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
    :qid |qp.fvfValDef47|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@69@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@70@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef48|))))
(pop) ; 13
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@70@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@70@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@69@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@70@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@69@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01) root@3@01)))
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@68@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@67@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@67@01  $FVF<val>) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@67@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@70@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@70@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@69@01  $FVF<val>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@69@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@70@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@67@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@68@01  $FVF<val>) root@3@01) root@3@01)))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($FVF.lookup_val (as sm@69@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
        $Ref.null)))))
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(push) ; 8
(assert (not (=
  ($FVF.lookup_val (as sm@68@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@68@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@70@01  $FVF<val>) root@3@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 15 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@6@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
; [eval] root.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 52 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 52 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 52 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
; [exec]
; unfold acc(array(a), write)
(declare-const i@71@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 53 | !(0 <= i@71@01) | live]
; [else-branch: 53 | 0 <= i@71@01 | live]
(push) ; 7
; [then-branch: 53 | !(0 <= i@71@01)]
(assert (not (<= 0 i@71@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 53 | 0 <= i@71@01]
(assert (<= 0 i@71@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@71@01) (not (<= 0 i@71@01))))
(assert (and (<= 0 i@71@01) (< i@71@01 (len<Int> a@4@01))))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@72@01 ($Ref) Int)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@71@01 Int)) (!
  (=>
    (and (<= 0 i@71@01) (< i@71@01 (len<Int> a@4@01)))
    (or (<= 0 i@71@01) (not (<= 0 i@71@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@71@01)) (loc<Ref> a@4@01 i@71@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@71@01 Int) (i2@71@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@71@01) (< i1@71@01 (len<Int> a@4@01)))
      (and (<= 0 i2@71@01) (< i2@71@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 i1@71@01) (loc<Ref> a@4@01 i2@71@01)))
    (= i1@71@01 i2@71@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@71@01 Int)) (!
  (=>
    (and (<= 0 i@71@01) (< i@71@01 (len<Int> a@4@01)))
    (and
      (= (inv@72@01 (loc<Ref> a@4@01 i@71@01)) i@71@01)
      (img@73@01 (loc<Ref> a@4@01 i@71@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@71@01)) (loc<Ref> a@4@01 i@71@01)))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@01 r)
      (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@72@01 r)) r))
  :pattern ((inv@72@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@71@01 Int)) (!
  (=>
    (and (<= 0 i@71@01) (< i@71@01 (len<Int> a@4@01)))
    (not (= (loc<Ref> a@4@01 i@71@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@71@01)) (loc<Ref> a@4@01 i@71@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@74@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@01 r)
      (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) (len<Int> a@4@01))))
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) (len<Int> a@4@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) r) r))
  :pattern ((inv@72@01 r))
  :qid |quant-u-27|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($Snap.second $t@6@01) a@4@01))
; [exec]
; fold acc(array(a), write)
(declare-const i@75@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 54 | !(0 <= i@75@01) | live]
; [else-branch: 54 | 0 <= i@75@01 | live]
(push) ; 7
; [then-branch: 54 | !(0 <= i@75@01)]
(assert (not (<= 0 i@75@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 54 | 0 <= i@75@01]
(assert (<= 0 i@75@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@75@01) (not (<= 0 i@75@01))))
(assert (and (<= 0 i@75@01) (< i@75@01 (len<Int> a@4@01))))
; [eval] loc(a, i)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@76@01 ($Ref) Int)
(declare-fun img@77@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (< i@75@01 (len<Int> a@4@01)))
    (or (<= 0 i@75@01) (not (<= 0 i@75@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) (loc<Ref> a@4@01 i@75@01)) (loc<Ref> a@4@01 i@75@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@75@01 Int) (i2@75@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@75@01) (< i1@75@01 (len<Int> a@4@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) (loc<Ref> a@4@01 i1@75@01)) (loc<Ref> a@4@01 i1@75@01)))
      (and
        (and (<= 0 i2@75@01) (< i2@75@01 (len<Int> a@4@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) (loc<Ref> a@4@01 i2@75@01)) (loc<Ref> a@4@01 i2@75@01)))
      (= (loc<Ref> a@4@01 i1@75@01) (loc<Ref> a@4@01 i2@75@01)))
    (= i1@75@01 i2@75@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (< i@75@01 (len<Int> a@4@01)))
    (and
      (= (inv@76@01 (loc<Ref> a@4@01 i@75@01)) i@75@01)
      (img@77@01 (loc<Ref> a@4@01 i@75@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) (loc<Ref> a@4@01 i@75@01)) (loc<Ref> a@4@01 i@75@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@77@01 r)
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@76@01 r)) r))
  :pattern ((inv@76@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@74@01  $FVF<val>) r) r))
  :pattern ((inv@76@01 r))
  :qid |quant-u-29|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01)))
      (img@77@01 r)
      (= r (loc<Ref> a@4@01 (inv@76@01 r))))
    ($Perm.min
      (ite
        (and
          (img@73@01 r)
          (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01)))
      (img@77@01 r)
      (= r (loc<Ref> a@4@01 (inv@76@01 r))))
    ($Perm.min
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@78@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@73@01 r)
          (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@78@01 r))
    $Perm.No)
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01)))
      (img@77@01 r)
      (= r (loc<Ref> a@4@01 (inv@76@01 r))))
    (= (- $Perm.Write (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@80@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01)))
        (img@77@01 r)))
    (=>
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01)))
        (img@77@01 r))
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>))))
  :qid |qp.fvfDomDef55|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01)))
        (img@77@01 r))
      (= r root@3@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (len<Int> a@4@01)))
        (img@77@01 r))
      (and
        (img@73@01 r)
        (and (<= 0 (inv@72@01 r)) (< (inv@72@01 r) (len<Int> a@4@01)))))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef54|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@80@01  $FVF<val>)) a@4@01))
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 55 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 55 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 55 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
; [exec]
; _treeToArray(root.right, a, 0)
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 ($Snap.combine ($Snap.first $t@81@01) ($Snap.second $t@81@01))))
(assert (= ($Snap.second $t@81@01) $Snap.unit))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 6
(assert (tree%trigger ($Snap.first $t@81@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.first $t@81@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@81@01))
    ($Snap.second ($Snap.first $t@81@01)))))
(declare-const sm@82@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@82@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@81@01)))))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))))
(declare-const sm@83@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@82@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@82@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef58|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.first $t@81@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@81@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@81@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 56 | First:(Second:(First:($t@81@01))) != Null | live]
; [else-branch: 56 | First:(Second:(First:($t@81@01))) == Null | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 56 | First:(Second:(First:($t@81@01))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 57 | First:(Second:(Second:(Second:(First:($t@81@01))))) != Null | live]
; [else-branch: 57 | First:(Second:(Second:(Second:(First:($t@81@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 57 | First:(Second:(Second:(Second:(First:($t@81@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@82@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
    :qid |qp.fvfValDef57|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@82@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef58|))))
(set-option :timeout 0)
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@84@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@84@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@85@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@84@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@84@01  $FVF<val>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@84@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef61|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef59|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@84@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@84@01  $FVF<val>) r))
    :qid |qp.fvfValDef60|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@84@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef61|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 59 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef59|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@84@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@84@01  $FVF<val>) r))
    :qid |qp.fvfValDef60|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@84@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef61|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 58 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 60 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 60 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 60 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef59|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@84@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@84@01  $FVF<val>) r))
    :qid |qp.fvfValDef60|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@84@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef61|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 60 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef59|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@84@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@84@01  $FVF<val>) r))
    :qid |qp.fvfValDef60|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@84@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef61|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@86@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@86@01  Int)
    ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@86@01  Int)
    ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@86@01  Int)
    ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@86@01  Int)
    ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@84@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@84@01  $FVF<val>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@84@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef61|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@84@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@84@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@84@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@84@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 57 | First:(Second:(Second:(Second:(First:($t@81@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@82@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
    :qid |qp.fvfValDef57|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@82@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef58|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@87@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@87@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@88@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef64|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 61 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 61 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 61 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 62 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 62 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 62 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef62|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
    :qid |qp.fvfValDef63|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef64|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 62 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef62|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
    :qid |qp.fvfValDef63|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef64|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 61 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 63 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 63 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 63 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef62|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
    :qid |qp.fvfValDef63|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef64|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 63 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef62|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
    :qid |qp.fvfValDef63|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef64|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@89@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@89@01  Int)
    ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@89@01  Int)
    ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@89@01  Int)
    ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@89@01  Int)
    ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@87@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@87@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@87@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@87@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
(push) ; 7
; [else-branch: 56 | First:(Second:(First:($t@81@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
  $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@81@01)))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 64 | First:(Second:(Second:(Second:(First:($t@81@01))))) != Null | live]
; [else-branch: 64 | First:(Second:(Second:(Second:(First:($t@81@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 64 | First:(Second:(Second:(Second:(First:($t@81@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
    $Ref.null)))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@82@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
    :qid |qp.fvfValDef57|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@82@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef58|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@90@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@90@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@91@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@90@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@90@01  $FVF<val>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@90@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef67|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 65 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 65 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 65 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 66 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 66 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 66 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef65|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@90@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@90@01  $FVF<val>) r))
    :qid |qp.fvfValDef66|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@90@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef67|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 66 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef65|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@90@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@90@01  $FVF<val>) r))
    :qid |qp.fvfValDef66|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@90@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef67|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 65 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 67 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 67 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 67 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef65|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@90@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@90@01  $FVF<val>) r))
    :qid |qp.fvfValDef66|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@90@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef67|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 67 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef65|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@90@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@90@01  $FVF<val>) r))
    :qid |qp.fvfValDef66|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@90@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef67|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@92@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@92@01  Int)
    ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@92@01  Int)
    ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@92@01  Int)
    ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@92@01  Int)
    ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@90@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@90@01  $FVF<val>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@90@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef67|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@90@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@90@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@90@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@90@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(push) ; 8
; [else-branch: 64 | First:(Second:(Second:(Second:(First:($t@81@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
  $Snap.unit))
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef56|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@82@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
    :qid |qp.fvfValDef57|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@82@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef58|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 9
(assert (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(declare-const sm@93@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@93@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  root@3@01)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const sm@94@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@93@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef70|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 68 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null | live]
; [else-branch: 68 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 68 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 69 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 69 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 69 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
(check-sat)
; unknown
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef68|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
    :qid |qp.fvfValDef69|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@93@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef70|))))
(set-option :timeout 0)
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 69 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef68|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
    :qid |qp.fvfValDef69|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@93@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef70|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 68 | First:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  root@3@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [eval] root.right != null
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; [then-branch: 70 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null | live]
; [else-branch: 70 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 70 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    $Ref.null)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef68|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
    :qid |qp.fvfValDef69|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@93@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef70|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(push) ; 11
; [else-branch: 70 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:($t@6@01))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  $Snap.unit))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
    :qid |qp.fvfValDef68|))
  (forall ((r $Ref)) (!
    (=>
      (=
        r
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (=
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
    :qid |qp.fvfValDef69|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
      ($FVF.loc_val ($FVF.lookup_val (as sm@93@01  $FVF<val>) r) r))
    :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef70|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        root@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
(pop) ; 9
(declare-const joined_unfolding@95@01 Int)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@95@01  Int)
    ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (=
    (as joined_unfolding@95@01  Int)
    ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@95@01  Int)
    ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (=
    (as joined_unfolding@95@01  Int)
    ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@93@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef70|)))
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@93@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@93@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@93@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null)))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))))
; Joined path conditions
(assert (and
  (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@93@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
      $Snap.unit))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(declare-const joined_unfolding@96@01 Bool)
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@96@01  Bool)
    (=
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@86@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
        $Ref.null)))
  (=
    (as joined_unfolding@96@01  Bool)
    (=
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@89@01  Int)))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
      $Ref.null))
  (=
    (as joined_unfolding@96@01  Bool)
    (=
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@92@01  Int)))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
      $Ref.null))
  (=
    (as joined_unfolding@96@01  Bool)
    (=
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      (as joined_unfolding@95@01  Int)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@83@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@82@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@82@01  $FVF<val>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@82@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@83@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@84@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@84@01  $FVF<val>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@84@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef61|)))
(assert (and
  (tree%trigger ($Snap.first $t@81@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@81@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@81@01))
      ($Snap.second ($Snap.first $t@81@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@82@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@81@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@81@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@81@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@81@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))))
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
        $Ref.null))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@86@01  Int)
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@86@01  Int)
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@86@01  Int)
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@86@01  Int)
        ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@84@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@87@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@87@01  $FVF<val>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@87@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef64|)))
(assert (and
  (tree%trigger ($Snap.first $t@81@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@81@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@81@01))
      ($Snap.second ($Snap.first $t@81@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@82@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@81@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@81@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@81@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@81@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))))
(assert (=>
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@89@01  Int)
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@89@01  Int)
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@89@01  Int)
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@89@01  Int)
        ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@87@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@88@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@91@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@90@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@90@01  $FVF<val>) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@90@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@91@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef67|)))
(assert (and
  (tree%trigger ($Snap.first $t@81@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@81@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@81@01))
      ($Snap.second ($Snap.first $t@81@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@82@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@81@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@81@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@81@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@81@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))))
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
    $Ref.null)
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
      $Ref.null)
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
      $Snap.unit)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
        $Ref.null))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@92@01  Int)
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@92@01  Int)
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@92@01  Int)
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@92@01  Int)
        ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@90@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@91@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@93@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef70|)))
(assert (and
  (tree%trigger ($Snap.first $t@81@01) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.first $t@81@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@81@01))
      ($Snap.second ($Snap.first $t@81@01))))))
(assert (and
  (=
    ($FVF.lookup_val (as sm@82@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@81@01))))
  (<=
    $Perm.No
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No))
  (<=
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  (=>
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  ($FVF.loc_val ($FVF.lookup_val (as sm@83@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
  (=
    ($Snap.second ($Snap.first $t@81@01))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first $t@81@01)))
      ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
  (=
    ($Snap.second ($Snap.second ($Snap.first $t@81@01)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@81@01))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
      $Ref.null)
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01)))))
      $Snap.unit)
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@95@01  Int)
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (=
        (as joined_unfolding@95@01  Int)
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@95@01  Int)
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (=
        (as joined_unfolding@95@01  Int)
        ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (tree%trigger ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    (=
      ($FVF.lookup_val (as sm@93@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@94@01  $FVF<val>) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
        $Ref.null)
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Snap.unit)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          ($Snap.combine
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
            ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))))))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null)))
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)))
    (=>
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))))))
          $Snap.unit)))
    (or
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
          $Ref.null))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
          $Ref.null)
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))))
            $Ref.null))
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))))
            $Ref.null)))))))
(assert (or
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
      $Ref.null))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
        $Ref.null)))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@81@01))))))
        $Ref.null))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@81@01))))
        $Ref.null)))))
(assert (as joined_unfolding@96@01  Bool))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(tree(root), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@97@01 ((r $Ref)) $Perm
  (ite
    (= r root@3@01)
    ($Perm.min (ite (= r root@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@97@01 root@3@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r root@3@01) (= (- $Perm.Write (pTaken@97@01 r)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 71 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 71 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 71 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 72 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 72 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 72 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        ($Snap.first $t@81@01))))) root@3@01))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 8
(declare-const sm@98@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@98@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01)))
(declare-const sm@99@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@99@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef72|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 73 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 73 | First:(Second:(First:($t@6@01))) == Null | live]
(push) ; 9
; [else-branch: 73 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [then-branch: 74 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 74 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 74 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@99@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
    :qid |qp.fvfValDef71|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef72|))))
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 11
(declare-const sm@100@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@100@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@101@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef74|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 75 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 75 | First:(Second:(First:($t@6@01))) == Null | live]
(push) ; 12
; [else-branch: 75 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; [then-branch: 76 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
; [else-branch: 76 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 13
; [then-branch: 76 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
    :qid |qp.fvfValDef73|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef74|))))
(pop) ; 13
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef74|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@100@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) root@3@01) root@3@01)))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@99@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@98@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@98@01  $FVF<val>) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@98@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@101@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@100@01  $FVF<val>) r))
  :qid |qp.fvfValDef73|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@100@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@101@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef74|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@98@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) root@3@01) root@3@01)))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null)))
  (and
    (=
      ($FVF.lookup_val (as sm@100@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@101@01  $FVF<val>) root@3@01) root@3@01)
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
        $Ref.null))
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (and
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(push) ; 8
(assert (not (=
  ($FVF.lookup_val (as sm@99@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@101@01  $FVF<val>) root@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@99@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@101@01  $FVF<val>) root@3@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !(root.right != null)
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 77 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | dead]
; [else-branch: 77 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 77 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 52 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (tree%trigger ($Snap.first $t@6@01) root@3@01))
; [exec]
; unfold acc(array(a), write)
(declare-const i@102@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 78 | !(0 <= i@102@01) | live]
; [else-branch: 78 | 0 <= i@102@01 | live]
(push) ; 7
; [then-branch: 78 | !(0 <= i@102@01)]
(assert (not (<= 0 i@102@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 78 | 0 <= i@102@01]
(assert (<= 0 i@102@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@102@01) (not (<= 0 i@102@01))))
(assert (and (<= 0 i@102@01) (< i@102@01 (len<Int> a@4@01))))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@103@01 ($Ref) Int)
(declare-fun img@104@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@102@01 Int)) (!
  (=>
    (and (<= 0 i@102@01) (< i@102@01 (len<Int> a@4@01)))
    (or (<= 0 i@102@01) (not (<= 0 i@102@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@102@01)) (loc<Ref> a@4@01 i@102@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@102@01 Int) (i2@102@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@102@01) (< i1@102@01 (len<Int> a@4@01)))
      (and (<= 0 i2@102@01) (< i2@102@01 (len<Int> a@4@01)))
      (= (loc<Ref> a@4@01 i1@102@01) (loc<Ref> a@4@01 i2@102@01)))
    (= i1@102@01 i2@102@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@102@01 Int)) (!
  (=>
    (and (<= 0 i@102@01) (< i@102@01 (len<Int> a@4@01)))
    (and
      (= (inv@103@01 (loc<Ref> a@4@01 i@102@01)) i@102@01)
      (img@104@01 (loc<Ref> a@4@01 i@102@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@102@01)) (loc<Ref> a@4@01 i@102@01)))
  :qid |quant-u-37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@104@01 r)
      (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@103@01 r)) r))
  :pattern ((inv@103@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@102@01 Int)) (!
  (=>
    (and (<= 0 i@102@01) (< i@102@01 (len<Int> a@4@01)))
    (not (= (loc<Ref> a@4@01 i@102@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) (loc<Ref> a@4@01 i@102@01)) (loc<Ref> a@4@01 i@102@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@105@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@105@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@105@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@104@01 r)
      (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (len<Int> a@4@01))))
    (=
      ($FVF.lookup_val (as sm@105@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@105@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@105@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (len<Int> a@4@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@105@01  $FVF<val>) r) r))
  :pattern ((inv@103@01 r))
  :qid |quant-u-38|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($Snap.second $t@6@01) a@4@01))
; [exec]
; fold acc(array(a), write)
(declare-const i@106@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 79 | !(0 <= i@106@01) | live]
; [else-branch: 79 | 0 <= i@106@01 | live]
(push) ; 7
; [then-branch: 79 | !(0 <= i@106@01)]
(assert (not (<= 0 i@106@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 79 | 0 <= i@106@01]
(assert (<= 0 i@106@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@106@01) (not (<= 0 i@106@01))))
(assert (and (<= 0 i@106@01) (< i@106@01 (len<Int> a@4@01))))
; [eval] loc(a, i)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 5
(declare-fun inv@107@01 ($Ref) Int)
(declare-fun img@108@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@106@01 Int)) (!
  (=>
    (and (<= 0 i@106@01) (< i@106@01 (len<Int> a@4@01)))
    (or (<= 0 i@106@01) (not (<= 0 i@106@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@105@01  $FVF<val>) (loc<Ref> a@4@01 i@106@01)) (loc<Ref> a@4@01 i@106@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@106@01 Int) (i2@106@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@106@01) (< i1@106@01 (len<Int> a@4@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@105@01  $FVF<val>) (loc<Ref> a@4@01 i1@106@01)) (loc<Ref> a@4@01 i1@106@01)))
      (and
        (and (<= 0 i2@106@01) (< i2@106@01 (len<Int> a@4@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@105@01  $FVF<val>) (loc<Ref> a@4@01 i2@106@01)) (loc<Ref> a@4@01 i2@106@01)))
      (= (loc<Ref> a@4@01 i1@106@01) (loc<Ref> a@4@01 i2@106@01)))
    (= i1@106@01 i2@106@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@106@01 Int)) (!
  (=>
    (and (<= 0 i@106@01) (< i@106@01 (len<Int> a@4@01)))
    (and
      (= (inv@107@01 (loc<Ref> a@4@01 i@106@01)) i@106@01)
      (img@108@01 (loc<Ref> a@4@01 i@106@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@105@01  $FVF<val>) (loc<Ref> a@4@01 i@106@01)) (loc<Ref> a@4@01 i@106@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@108@01 r)
      (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01))))
    (= (loc<Ref> a@4@01 (inv@107@01 r)) r))
  :pattern ((inv@107@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@105@01  $FVF<val>) r) r))
  :pattern ((inv@107@01 r))
  :qid |quant-u-40|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@109@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01)))
      (img@108@01 r)
      (= r (loc<Ref> a@4@01 (inv@107@01 r))))
    ($Perm.min
      (ite
        (and
          (img@104@01 r)
          (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@110@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01)))
      (img@108@01 r)
      (= r (loc<Ref> a@4@01 (inv@107@01 r))))
    ($Perm.min
      (ite (= r root@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@109@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@104@01 r)
          (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (len<Int> a@4@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@109@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01)))
      (img@108@01 r)
      (= r (loc<Ref> a@4@01 (inv@107@01 r))))
    (= (- $Perm.Write (pTaken@109@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@111@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@111@01  $FVF<val>)))
      (and
        (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01)))
        (img@108@01 r)))
    (=>
      (and
        (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01)))
        (img@108@01 r))
      (Set_in r ($FVF.domain_val (as sm@111@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@111@01  $FVF<val>))))
  :qid |qp.fvfDomDef81|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01)))
        (img@108@01 r))
      (= r root@3@01))
    (=
      ($FVF.lookup_val (as sm@111@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@107@01 r)) (< (inv@107@01 r) (len<Int> a@4@01)))
        (img@108@01 r))
      (and
        (img@104@01 r)
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (len<Int> a@4@01)))))
    (=
      ($FVF.lookup_val (as sm@111@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@111@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@111@01  $FVF<val>)) a@4@01))
; [eval] root.right != null
; [then-branch: 80 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 80 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 80 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(pop) ; 5
; [eval] !(root.right != null)
; [eval] root.right != null
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 81 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
; [else-branch: 81 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 81 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
; [exec]
; fold acc(tree(root), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@112@01 ((r $Ref)) $Perm
  (ite
    (= r root@3@01)
    ($Perm.min (ite (= r root@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@112@01 root@3@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r root@3@01) (= (- $Perm.Write (pTaken@112@01 r)) $Perm.No))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 82 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 82 | First:(Second:(First:($t@6@01))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 82 | First:(Second:(First:($t@6@01))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
  $Ref.null))
; [eval] root.right != null
; [then-branch: 83 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 83 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 7
; [else-branch: 83 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (tree%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@6@01)))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01)))))
        $Snap.unit)))) root@3@01))
; [eval] (unfolding acc(tree(root), write) in root.val == old((unfolding acc(tree(root), write) in root.val)))
(push) ; 8
(declare-const sm@113@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@113@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01)))
(declare-const sm@114@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef83|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 84 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 84 | First:(Second:(First:($t@6@01))) == Null | live]
(push) ; 9
; [else-branch: 84 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
; [then-branch: 85 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 85 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 10
; [else-branch: 85 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
; [eval] root.val == old((unfolding acc(tree(root), write) in root.val))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
    :qid |qp.fvfValDef82|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef83|))))
; [eval] old((unfolding acc(tree(root), write) in root.val))
; [eval] (unfolding acc(tree(root), write) in root.val)
(push) ; 11
(declare-const sm@115@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@115@01  $FVF<val>) root@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01)))))
(declare-const sm@116@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@116@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@115@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@115@01  $FVF<val>) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@115@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef85|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@116@01  $FVF<val>) root@3@01) root@3@01))
; [eval] root.left != null
; [then-branch: 86 | First:(Second:(First:($t@6@01))) != Null | dead]
; [else-branch: 86 | First:(Second:(First:($t@6@01))) == Null | live]
(push) ; 12
; [else-branch: 86 | First:(Second:(First:($t@6@01))) == Null]
; [eval] root.right != null
; [then-branch: 87 | First:(Second:(Second:(Second:(First:($t@6@01))))) != Null | dead]
; [else-branch: 87 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null | live]
(push) ; 13
; [else-branch: 87 | First:(Second:(Second:(Second:(First:($t@6@01))))) == Null]
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r root@3@01)
      (=
        ($FVF.lookup_val (as sm@116@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@115@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@115@01  $FVF<val>) r))
    :qid |qp.fvfValDef84|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val (as sm@115@01  $FVF<val>) r) r)
    :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef85|))))
(pop) ; 13
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@116@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@115@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@115@01  $FVF<val>) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@115@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef85|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@115@01  $FVF<val>) root@3@01)
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
  ($FVF.loc_val ($FVF.lookup_val (as sm@116@01  $FVF<val>) root@3@01) root@3@01)))
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@113@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@113@01  $FVF<val>) r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@113@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r root@3@01)
    (=
      ($FVF.lookup_val (as sm@116@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@115@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@115@01  $FVF<val>) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val (as sm@115@01  $FVF<val>) r) r)
  :pattern (($FVF.lookup_val (as sm@116@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef85|)))
(assert (and
  (=
    ($FVF.lookup_val (as sm@113@01  $FVF<val>) root@3@01)
    ($FVF.lookup_val (as sm@24@01  $FVF<val>) root@3@01))
  ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) root@3@01) root@3@01)))
(assert (=>
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null))
  (and
    (=
      ($FVF.lookup_val (as sm@115@01  $FVF<val>) root@3@01)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@6@01))))
    ($FVF.loc_val ($FVF.lookup_val (as sm@116@01  $FVF<val>) root@3@01) root@3@01)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
      $Ref.null)
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
      $Ref.null))))
(assert (and
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@6@01))))))
    $Ref.null)
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first $t@6@01))))
    $Ref.null)))
(push) ; 8
(assert (not (=
  ($FVF.lookup_val (as sm@114@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@116@01  $FVF<val>) root@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_val (as sm@114@01  $FVF<val>) root@3@01)
  ($FVF.lookup_val (as sm@116@01  $FVF<val>) root@3@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
