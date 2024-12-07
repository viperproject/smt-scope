(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:49
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0648.vpr
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
(declare-sort array 0)
(declare-sort $FVF<int> 0)
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
(declare-fun $SortWrappers.arrayTo$Snap (array) $Snap)
(declare-fun $SortWrappers.$SnapToarray ($Snap) array)
(assert (forall ((x array)) (!
    (= x ($SortWrappers.$SnapToarray($SortWrappers.arrayTo$Snap x)))
    :pattern (($SortWrappers.arrayTo$Snap x))
    :qid |$Snap.$SnapToarrayTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.arrayTo$Snap($SortWrappers.$SnapToarray x)))
    :pattern (($SortWrappers.$SnapToarray x))
    :qid |$Snap.arrayTo$SnapToarray|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<int>To$Snap ($FVF<int>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<int> ($Snap) $FVF<int>)
(assert (forall ((x $FVF<int>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<int>($SortWrappers.$FVF<int>To$Snap x)))
    :pattern (($SortWrappers.$FVF<int>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<int>To$Snap($SortWrappers.$SnapTo$FVF<int> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<int> x))
    :qid |$Snap.$FVF<int>To$SnapTo$FVF<int>|
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
(declare-fun loc<Ref> (array Int) $Ref)
(declare-fun len<Int> (array) Int)
(declare-fun loc_inv_1<array> ($Ref) array)
(declare-fun loc_inv_2<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [int: Int]
(declare-fun $FVF.domain_int ($FVF<int>) Set<$Ref>)
(declare-fun $FVF.lookup_int ($FVF<int> $Ref) Int)
(declare-fun $FVF.after_int ($FVF<int> $FVF<int>) Bool)
(declare-fun $FVF.loc_int (Int $Ref) Bool)
(declare-fun $FVF.perm_int ($FPM $Ref) $Perm)
(declare-const $fvfTOP_int $FVF<int>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun correctness_invar ($Snap array) Bool)
(declare-fun correctness_invar%limited ($Snap array) Bool)
(declare-fun correctness_invar%stateless (array) Bool)
(declare-fun correctness_invar%precondition ($Snap array) Bool)
(declare-fun correctness_upto ($Snap array array Int) Bool)
(declare-fun correctness_upto%limited ($Snap array array Int) Bool)
(declare-fun correctness_upto%stateless (array array Int) Bool)
(declare-fun correctness_upto%precondition ($Snap array array Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((a array) (i Int)) (!
  (and
    (= (loc_inv_1<array> (loc<Ref> a i)) a)
    (= (loc_inv_2<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  )))
(assert (forall ((a array)) (!
  (>= (len<Int> a) 0)
  :pattern ((len<Int> a))
  )))
; /field_value_functions_axioms.smt2 [int: Int]
(assert (forall ((vs $FVF<int>) (ws $FVF<int>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_int vs) ($FVF.domain_int ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_int vs))
            (= ($FVF.lookup_int vs x) ($FVF.lookup_int ws x)))
          :pattern (($FVF.lookup_int vs x) ($FVF.lookup_int ws x))
          :qid |qp.$FVF<int>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<int>To$Snap vs)
              ($SortWrappers.$FVF<int>To$Snap ws)
              )
    :qid |qp.$FVF<int>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_int pm r))
    :pattern (($FVF.perm_int pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_int f r) true)
    :pattern (($FVF.loc_int f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION correctness_invar----------
(declare-fun left@0@00 () array)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const i@6@00 Int)
(push) ; 2
; [eval] 0 <= i && i < len(left)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@6@00) | live]
; [else-branch: 0 | 0 <= i@6@00 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@6@00)]
(assert (not (<= 0 i@6@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@6@00]
(assert (<= 0 i@6@00))
; [eval] i < len(left)
; [eval] len(left)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@6@00) (not (<= 0 i@6@00))))
(assert (and (<= 0 i@6@00) (< i@6@00 (len<Int> left@0@00))))
; [eval] loc(left, i)
(declare-fun sm@7@00 ($Snap array) $FVF<int>)
; Definitional axioms for snapshot map values
; [eval] loc(left, i)
(pop) ; 2
(declare-fun inv@8@00 ($Snap array $Ref) Int)
(declare-fun img@9@00 ($Snap array $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@6@00 Int)) (!
  (=>
    (and (<= 0 i@6@00) (< i@6@00 (len<Int> left@0@00)))
    (or (<= 0 i@6@00) (not (<= 0 i@6@00))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) (loc<Ref> left@0@00 i@6@00)) (loc<Ref> left@0@00 i@6@00)))
  :qid |int-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@6@00 Int) (i2@6@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@6@00) (< i1@6@00 (len<Int> left@0@00)))
      (and (<= 0 i2@6@00) (< i2@6@00 (len<Int> left@0@00)))
      (= (loc<Ref> left@0@00 i1@6@00) (loc<Ref> left@0@00 i2@6@00)))
    (= i1@6@00 i2@6@00))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@6@00 Int)) (!
  (=>
    (and (<= 0 i@6@00) (< i@6@00 (len<Int> left@0@00)))
    (and
      (= (inv@8@00 s@$ left@0@00 (loc<Ref> left@0@00 i@6@00)) i@6@00)
      (img@9@00 s@$ left@0@00 (loc<Ref> left@0@00 i@6@00))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) (loc<Ref> left@0@00 i@6@00)) (loc<Ref> left@0@00 i@6@00)))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ left@0@00 r)
      (and
        (<= 0 (inv@8@00 s@$ left@0@00 r))
        (< (inv@8@00 s@$ left@0@00 r) (len<Int> left@0@00))))
    (= (loc<Ref> left@0@00 (inv@8@00 s@$ left@0@00 r)) r))
  :pattern ((inv@8@00 s@$ left@0@00 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@6@00 Int)) (!
  (=>
    (and (<= 0 i@6@00) (< i@6@00 (len<Int> left@0@00)))
    (not (= (loc<Ref> left@0@00 i@6@00) $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) (loc<Ref> left@0@00 i@6@00)) (loc<Ref> left@0@00 i@6@00)))
  :qid |int-permImpliesNonNull|)))
(declare-fun sm@10@00 ($Snap array) $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ left@0@00 r)
      (and
        (<= 0 (inv@8@00 s@$ left@0@00 r))
        (< (inv@8@00 s@$ left@0@00 r) (len<Int> left@0@00))))
    (=
      ($FVF.lookup_int (sm@10@00 s@$ left@0@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) r)))
  :pattern (($FVF.lookup_int (sm@10@00 s@$ left@0@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) r) r)
  :pattern (($FVF.lookup_int (sm@10@00 s@$ left@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@8@00 s@$ left@0@00 r))
      (< (inv@8@00 s@$ left@0@00 r) (len<Int> left@0@00)))
    ($FVF.loc_int ($FVF.lookup_int (sm@10@00 s@$ left@0@00) r) r))
  :pattern ((inv@8@00 s@$ left@0@00 r))
  :qid |quant-u-6|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (left@0@00 array)) (!
  (= (correctness_invar%limited s@$ left@0@00) (correctness_invar s@$ left@0@00))
  :pattern ((correctness_invar s@$ left@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (left@0@00 array)) (!
  (correctness_invar%stateless left@0@00)
  :pattern ((correctness_invar%limited s@$ left@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ left@0@00 r)
      (and
        (<= 0 (inv@8@00 s@$ left@0@00 r))
        (< (inv@8@00 s@$ left@0@00 r) (len<Int> left@0@00))))
    (= (loc<Ref> left@0@00 (inv@8@00 s@$ left@0@00 r)) r))
  :pattern ((inv@8@00 s@$ left@0@00 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@00 s@$ left@0@00 r)
      (and
        (<= 0 (inv@8@00 s@$ left@0@00 r))
        (< (inv@8@00 s@$ left@0@00 r) (len<Int> left@0@00))))
    (=
      ($FVF.lookup_int (sm@10@00 s@$ left@0@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) r)))
  :pattern (($FVF.lookup_int (sm@10@00 s@$ left@0@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) r) r)
  :pattern (($FVF.lookup_int (sm@10@00 s@$ left@0@00) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((i@6@00 Int)) (!
  (=>
    (and (<= 0 i@6@00) (< i@6@00 (len<Int> left@0@00)))
    (and
      (= (inv@8@00 s@$ left@0@00 (loc<Ref> left@0@00 i@6@00)) i@6@00)
      (img@9@00 s@$ left@0@00 (loc<Ref> left@0@00 i@6@00))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) (loc<Ref> left@0@00 i@6@00)) (loc<Ref> left@0@00 i@6@00)))
  :qid |quant-u-5|)))
(assert (forall ((i@6@00 Int)) (!
  (=>
    (and (<= 0 i@6@00) (< i@6@00 (len<Int> left@0@00)))
    (not (= (loc<Ref> left@0@00 i@6@00) $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) (loc<Ref> left@0@00 i@6@00)) (loc<Ref> left@0@00 i@6@00)))
  :qid |int-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@8@00 s@$ left@0@00 r))
      (< (inv@8@00 s@$ left@0@00 r) (len<Int> left@0@00)))
    ($FVF.loc_int ($FVF.lookup_int (sm@10@00 s@$ left@0@00) r) r))
  :pattern ((inv@8@00 s@$ left@0@00 r))
  :qid |quant-u-6|)))
(assert (forall ((i@6@00 Int)) (!
  (=>
    (and (<= 0 i@6@00) (< i@6@00 (len<Int> left@0@00)))
    (or (<= 0 i@6@00) (not (<= 0 i@6@00))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) (loc<Ref> left@0@00 i@6@00)) (loc<Ref> left@0@00 i@6@00)))
  :qid |int-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@1@00 true))
(pop) ; 1
(assert (forall ((s@$ $Snap) (left@0@00 array)) (!
  (and
    (forall ((i@6@00 Int)) (!
      (=>
        (and (<= 0 i@6@00) (< i@6@00 (len<Int> left@0@00)))
        (and
          (= (inv@8@00 s@$ left@0@00 (loc<Ref> left@0@00 i@6@00)) i@6@00)
          (img@9@00 s@$ left@0@00 (loc<Ref> left@0@00 i@6@00))))
      :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> s@$) (loc<Ref> left@0@00 i@6@00)) (loc<Ref> left@0@00 i@6@00)))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@9@00 s@$ left@0@00 r)
          (and
            (<= 0 (inv@8@00 s@$ left@0@00 r))
            (< (inv@8@00 s@$ left@0@00 r) (len<Int> left@0@00))))
        (= (loc<Ref> left@0@00 (inv@8@00 s@$ left@0@00 r)) r))
      :pattern ((inv@8@00 s@$ left@0@00 r))
      :qid |int-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_int (sm@7@00 s@$ left@0@00) r))
      :qid |qp.fvfResTrgDef0|))
    (=>
      (correctness_invar%precondition s@$ left@0@00)
      (= (correctness_invar s@$ left@0@00) true)))
  :pattern ((correctness_invar s@$ left@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (left@0@00 array)) (!
  true
  :pattern ((correctness_invar s@$ left@0@00))
  :qid |quant-u-8|)))
; ---------- FUNCTION correctness_upto----------
(declare-fun parent@2@00 () array)
(declare-fun left@3@00 () array)
(declare-fun root@4@00 () Int)
(declare-fun result@5@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const i@11@00 Int)
(push) ; 2
; [eval] 0 <= i && i < len(left)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 1 | !(0 <= i@11@00) | live]
; [else-branch: 1 | 0 <= i@11@00 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= i@11@00)]
(assert (not (<= 0 i@11@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= i@11@00]
(assert (<= 0 i@11@00))
; [eval] i < len(left)
; [eval] len(left)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@11@00) (not (<= 0 i@11@00))))
(assert (and (<= 0 i@11@00) (< i@11@00 (len<Int> left@3@00))))
; [eval] loc(left, i)
(pop) ; 2
(declare-fun inv@12@00 ($Snap array array Int $Ref) Int)
(declare-fun img@13@00 ($Snap array array Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (len<Int> left@3@00)))
    (or (<= 0 i@11@00) (not (<= 0 i@11@00))))
  :pattern ((loc<Ref> left@3@00 i@11@00))
  :qid |int-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@11@00 Int) (i2@11@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@11@00) (< i1@11@00 (len<Int> left@3@00)))
      (and (<= 0 i2@11@00) (< i2@11@00 (len<Int> left@3@00)))
      (= (loc<Ref> left@3@00 i1@11@00) (loc<Ref> left@3@00 i2@11@00)))
    (= i1@11@00 i2@11@00))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (len<Int> left@3@00)))
    (and
      (=
        (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@11@00))
        i@11@00)
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@11@00))))
  :pattern ((loc<Ref> left@3@00 i@11@00))
  :qid |quant-u-10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (= (loc<Ref> left@3@00 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)) r))
  :pattern ((inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (len<Int> left@3@00)))
    (not (= (loc<Ref> left@3@00 i@11@00) $Ref.null)))
  :pattern ((loc<Ref> left@3@00 i@11@00))
  :qid |int-permImpliesNonNull|)))
(declare-fun sm@14@00 ($Snap array array Int) $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@14@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@14@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_int (sm@14@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (< (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r) (len<Int> left@3@00)))
    ($FVF.loc_int ($FVF.lookup_int (sm@14@00 s@$ parent@2@00 left@3@00 root@4@00) r) r))
  :pattern ((inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |quant-u-11|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const i@15@00 Int)
(push) ; 2
; [eval] 0 <= i && i < len(parent)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 2 | !(0 <= i@15@00) | live]
; [else-branch: 2 | 0 <= i@15@00 | live]
(push) ; 4
; [then-branch: 2 | !(0 <= i@15@00)]
(assert (not (<= 0 i@15@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | 0 <= i@15@00]
(assert (<= 0 i@15@00))
; [eval] i < len(parent)
; [eval] len(parent)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@15@00) (not (<= 0 i@15@00))))
(assert (and (<= 0 i@15@00) (< i@15@00 (len<Int> parent@2@00))))
; [eval] loc(parent, i)
(pop) ; 2
(declare-fun inv@16@00 ($Snap array array Int $Ref) Int)
(declare-fun img@17@00 ($Snap array array Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@15@00 Int)) (!
  (=>
    (and (<= 0 i@15@00) (< i@15@00 (len<Int> parent@2@00)))
    (or (<= 0 i@15@00) (not (<= 0 i@15@00))))
  :pattern ((loc<Ref> parent@2@00 i@15@00))
  :qid |int-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@15@00 Int) (i2@15@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@15@00) (< i1@15@00 (len<Int> parent@2@00)))
      (and (<= 0 i2@15@00) (< i2@15@00 (len<Int> parent@2@00)))
      (= (loc<Ref> parent@2@00 i1@15@00) (loc<Ref> parent@2@00 i2@15@00)))
    (= i1@15@00 i2@15@00))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@15@00 Int)) (!
  (=>
    (and (<= 0 i@15@00) (< i@15@00 (len<Int> parent@2@00)))
    (and
      (=
        (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> parent@2@00 i@15@00))
        i@15@00)
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> parent@2@00 i@15@00))))
  :pattern ((loc<Ref> parent@2@00 i@15@00))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      (loc<Ref> parent@2@00 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      r))
  :pattern ((inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@15@00 Int)) (!
  (=>
    (and (<= 0 i@15@00) (< i@15@00 (len<Int> parent@2@00)))
    (not (= (loc<Ref> parent@2@00 i@15@00) $Ref.null)))
  :pattern ((loc<Ref> parent@2@00 i@15@00))
  :qid |int-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (loc<Ref> parent@2@00 i@15@00) (loc<Ref> left@3@00 i@11@00))
    (=
      (and
        (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (and
          (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> parent@2@00))))
      (and
        (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (and
          (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00))))))
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@18@00 ($Snap array array Int) $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (<
        (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (len<Int> parent@2@00)))
    ($FVF.loc_int ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r) r))
  :pattern ((inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |quant-u-15|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] correctness_invar(left)
(set-option :timeout 0)
(push) ; 2
(declare-const i@19@00 Int)
(push) ; 3
; [eval] 0 <= i && i < len(left)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 3 | !(0 <= i@19@00) | live]
; [else-branch: 3 | 0 <= i@19@00 | live]
(push) ; 5
; [then-branch: 3 | !(0 <= i@19@00)]
(assert (not (<= 0 i@19@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | 0 <= i@19@00]
(assert (<= 0 i@19@00))
; [eval] i < len(left)
; [eval] len(left)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@19@00) (not (<= 0 i@19@00))))
(assert (and (<= 0 i@19@00) (< i@19@00 (len<Int> left@3@00))))
; [eval] loc(left, i)
(pop) ; 3
(declare-fun inv@20@00 ($Snap array array Int $Ref) Int)
(declare-fun img@21@00 ($Snap array array Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 (len<Int> left@3@00)))
    (or (<= 0 i@19@00) (not (<= 0 i@19@00))))
  :pattern ((loc<Ref> left@3@00 i@19@00))
  :qid |int-aux|)))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@19@00 Int) (i2@19@00 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@19@00) (< i1@19@00 (len<Int> left@3@00)))
        ($FVF.loc_int ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> left@3@00 i1@19@00)) (loc<Ref> left@3@00 i1@19@00)))
      (and
        (and (<= 0 i2@19@00) (< i2@19@00 (len<Int> left@3@00)))
        ($FVF.loc_int ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> left@3@00 i2@19@00)) (loc<Ref> left@3@00 i2@19@00)))
      (= (loc<Ref> left@3@00 i1@19@00) (loc<Ref> left@3@00 i2@19@00)))
    (= i1@19@00 i2@19@00))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 (len<Int> left@3@00)))
    (and
      (=
        (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@19@00))
        i@19@00)
      (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@19@00))))
  :pattern ((loc<Ref> left@3@00 i@19@00))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (= (loc<Ref> left@3@00 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)) r))
  :pattern ((inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (< (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r) (len<Int> left@3@00)))
    ($FVF.loc_int ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r) r))
  :pattern ((inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |quant-u-17|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@19@00 Int)) (!
  (= (loc<Ref> left@3@00 i@19@00) (loc<Ref> parent@2@00 i@19@00))
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (and
            (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00)))
          (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (=
            r
            (loc<Ref> left@3@00 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))))
        ($Perm.min
          (ite
            (and
              (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (and
                (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
                (<
                  (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                  (len<Int> left@3@00))))
            (/ (to_real 1) (to_real 2))
            $Perm.No)
          (/ (to_real 1) (to_real 2)))
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00)))
      (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (=
        r
        (loc<Ref> left@3@00 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))))
    (=
      (-
        (/ (to_real 1) (to_real 2))
        (ite
          (and
            (and
              (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
              (<
                (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                (len<Int> left@3@00)))
            (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (=
              r
              (loc<Ref> left@3@00 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))))
          ($Perm.min
            (ite
              (and
                (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                (and
                  (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
                  (<
                    (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                    (len<Int> left@3@00))))
              (/ (to_real 1) (to_real 2))
              $Perm.No)
            (/ (to_real 1) (to_real 2)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@22@00 ($Snap array array Int) $FVF<int>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)))
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)))))
  :pattern ((Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00))))
  :qid |qp.fvfDomDef11|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (and
        (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (and
          (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))))
    (=
      ($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (and
        (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (and
          (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> parent@2@00)))))
    (=
      ($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (correctness_invar%precondition ($SortWrappers.$FVF<int>To$Snap (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)) left@3@00))
(pop) ; 2
; Joined path conditions
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 (len<Int> left@3@00)))
    (and
      (=
        (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@19@00))
        i@19@00)
      (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@19@00))))
  :pattern ((loc<Ref> left@3@00 i@19@00))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (= (loc<Ref> left@3@00 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)) r))
  :pattern ((inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)))
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)))))
  :pattern ((Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00))))
  :qid |qp.fvfDomDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (and
        (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (and
          (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))))
    (=
      ($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (and
        (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (and
          (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> parent@2@00)))))
    (=
      ($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (and
  (forall ((i@19@00 Int)) (!
    (=>
      (and (<= 0 i@19@00) (< i@19@00 (len<Int> left@3@00)))
      (or (<= 0 i@19@00) (not (<= 0 i@19@00))))
    :pattern ((loc<Ref> left@3@00 i@19@00))
    :qid |int-aux|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00)))
      ($FVF.loc_int ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r) r))
    :pattern ((inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
    :qid |quant-u-17|))
  (correctness_invar%precondition ($SortWrappers.$FVF<int>To$Snap (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)) left@3@00)))
(assert (correctness_invar ($SortWrappers.$FVF<int>To$Snap (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)) left@3@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (parent@2@00 array) (left@3@00 array) (root@4@00 Int)) (!
  (=
    (correctness_upto%limited s@$ parent@2@00 left@3@00 root@4@00)
    (correctness_upto s@$ parent@2@00 left@3@00 root@4@00))
  :pattern ((correctness_upto s@$ parent@2@00 left@3@00 root@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (parent@2@00 array) (left@3@00 array) (root@4@00 Int)) (!
  (correctness_upto%stateless parent@2@00 left@3@00 root@4@00)
  :pattern ((correctness_upto%limited s@$ parent@2@00 left@3@00 root@4@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      (loc<Ref> parent@2@00 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      r))
  :pattern ((inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 (len<Int> left@3@00)))
    (and
      (=
        (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@19@00))
        i@19@00)
      (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@19@00))))
  :pattern ((loc<Ref> left@3@00 i@19@00))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (= (loc<Ref> left@3@00 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)) r))
  :pattern ((inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)))
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)))
    (=>
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)))))
  :pattern ((Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00))))
  :qid |qp.fvfDomDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (and
        (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (and
          (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))))
    (=
      ($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> left@3@00)))
        (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (and
        (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (and
          (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (<
            (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (len<Int> parent@2@00)))))
    (=
      ($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (forall ((i@15@00 Int)) (!
  (=>
    (and (<= 0 i@15@00) (< i@15@00 (len<Int> parent@2@00)))
    (and
      (=
        (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> parent@2@00 i@15@00))
        i@15@00)
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> parent@2@00 i@15@00))))
  :pattern ((loc<Ref> parent@2@00 i@15@00))
  :qid |quant-u-13|)))
(assert (forall ((i@15@00 Int)) (!
  (=>
    (and (<= 0 i@15@00) (< i@15@00 (len<Int> parent@2@00)))
    (not (= (loc<Ref> parent@2@00 i@15@00) $Ref.null)))
  :pattern ((loc<Ref> parent@2@00 i@15@00))
  :qid |int-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (<
        (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
        (len<Int> parent@2@00)))
    ($FVF.loc_int ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r) r))
  :pattern ((inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |quant-u-15|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (forall ((i@19@00 Int)) (!
  (=>
    (and (<= 0 i@19@00) (< i@19@00 (len<Int> left@3@00)))
    (or (<= 0 i@19@00) (not (<= 0 i@19@00))))
  :pattern ((loc<Ref> left@3@00 i@19@00))
  :qid |int-aux|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (< (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r) (len<Int> left@3@00)))
    ($FVF.loc_int ($FVF.lookup_int (sm@18@00 s@$ parent@2@00 left@3@00 root@4@00) r) r))
  :pattern ((inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |quant-u-17|)))
(assert (correctness_invar%precondition ($SortWrappers.$FVF<int>To$Snap (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)) left@3@00))
(assert (correctness_invar ($SortWrappers.$FVF<int>To$Snap (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)) left@3@00))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (= (loc<Ref> left@3@00 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)) r))
  :pattern ((inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@14@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@14@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
  :pattern (($FVF.lookup_int (sm@14@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (len<Int> left@3@00)))
    (and
      (=
        (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@11@00))
        i@11@00)
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@11@00))))
  :pattern ((loc<Ref> left@3@00 i@11@00))
  :qid |quant-u-10|)))
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (len<Int> left@3@00)))
    (not (= (loc<Ref> left@3@00 i@11@00) $Ref.null)))
  :pattern ((loc<Ref> left@3@00 i@11@00))
  :qid |int-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      (< (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r) (len<Int> left@3@00)))
    ($FVF.loc_int ($FVF.lookup_int (sm@14@00 s@$ parent@2@00 left@3@00 root@4@00) r) r))
  :pattern ((inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
  :qid |quant-u-11|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (forall ((i@15@00 Int)) (!
  (=>
    (and (<= 0 i@15@00) (< i@15@00 (len<Int> parent@2@00)))
    (or (<= 0 i@15@00) (not (<= 0 i@15@00))))
  :pattern ((loc<Ref> parent@2@00 i@15@00))
  :qid |int-aux|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (len<Int> left@3@00)))
    (or (<= 0 i@11@00) (not (<= 0 i@11@00))))
  :pattern ((loc<Ref> left@3@00 i@11@00))
  :qid |int-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (forall i: Int :: { loc(parent, i).int } 0 <= i && i < len(parent) ==> loc(parent, i).int == 0) && (forall i: Int :: { loc(parent, i).int } 0 <= i && i < len(parent) ==> loc(parent, i).int == 0)
; [eval] (forall i: Int :: { loc(parent, i).int } 0 <= i && i < len(parent) ==> loc(parent, i).int == 0)
(declare-const i@23@00 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && i < len(parent) ==> loc(parent, i).int == 0
; [eval] 0 <= i && i < len(parent)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 4 | !(0 <= i@23@00) | live]
; [else-branch: 4 | 0 <= i@23@00 | live]
(push) ; 4
; [then-branch: 4 | !(0 <= i@23@00)]
(assert (not (<= 0 i@23@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | 0 <= i@23@00]
(assert (<= 0 i@23@00))
; [eval] i < len(parent)
; [eval] len(parent)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@23@00) (not (<= 0 i@23@00))))
(push) ; 3
; [then-branch: 5 | 0 <= i@23@00 && i@23@00 < len[Int](parent@2@00) | live]
; [else-branch: 5 | !(0 <= i@23@00 && i@23@00 < len[Int](parent@2@00)) | live]
(push) ; 4
; [then-branch: 5 | 0 <= i@23@00 && i@23@00 < len[Int](parent@2@00)]
(assert (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00))))
; [eval] loc(parent, i).int == 0
; [eval] loc(parent, i)
(declare-fun sm@24@00 ($Snap array array Int) $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef14|)))
(declare-const pm@25@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@25@00  $FPM) r)
    (+
      (ite
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@25@00  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.perm_int (as pm@25@00  $FPM) r))
  :qid |qp.resTrgDef16|)))
(assert ($FVF.loc_int ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_int (as pm@25@00  $FPM) (loc<Ref> parent@2@00 i@23@00)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(0 <= i@23@00 && i@23@00 < len[Int](parent@2@00))]
(assert (not (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@25@00  $FPM) r)
    (+
      (ite
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@25@00  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.perm_int (as pm@25@00  $FPM) r))
  :qid |qp.resTrgDef16|)))
(assert (=>
  (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
  (and
    (<= 0 i@23@00)
    (< i@23@00 (len<Int> parent@2@00))
    ($FVF.loc_int ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00))))
  (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))))
(declare-fun sm@26@00 ($Snap array array Int) $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef19|)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@25@00  $FPM) r)
    (+
      (ite
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@25@00  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.perm_int (as pm@25@00  $FPM) r))
  :qid |qp.resTrgDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef19|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@23@00 Int)) (!
  (and
    (or (<= 0 i@23@00) (not (<= 0 i@23@00)))
    (=>
      (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
      (and
        (<= 0 i@23@00)
        (< i@23@00 (len<Int> parent@2@00))
        ($FVF.loc_int ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00))))
    (or
      (not (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00))))
      (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@26@4@26@97-aux|)))
(push) ; 2
; [then-branch: 6 | !(QA i@23@00 :: 0 <= i@23@00 && i@23@00 < len[Int](parent@2@00) ==> Lookup(int, sm@24@00(s@$, parent@2@00, left@3@00, root@4@00), loc[Ref](parent@2@00, i@23@00)) == 0) | live]
; [else-branch: 6 | QA i@23@00 :: 0 <= i@23@00 && i@23@00 < len[Int](parent@2@00) ==> Lookup(int, sm@24@00(s@$, parent@2@00, left@3@00, root@4@00), loc[Ref](parent@2@00, i@23@00)) == 0 | live]
(push) ; 3
; [then-branch: 6 | !(QA i@23@00 :: 0 <= i@23@00 && i@23@00 < len[Int](parent@2@00) ==> Lookup(int, sm@24@00(s@$, parent@2@00, left@3@00, root@4@00), loc[Ref](parent@2@00, i@23@00)) == 0)]
(assert (not
  (forall ((i@23@00 Int)) (!
    (=>
      (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
      (=
        ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00))
        0))
    :pattern (($FVF.loc_int ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@26@4@26@97|))))
(pop) ; 3
(push) ; 3
; [else-branch: 6 | QA i@23@00 :: 0 <= i@23@00 && i@23@00 < len[Int](parent@2@00) ==> Lookup(int, sm@24@00(s@$, parent@2@00, left@3@00, root@4@00), loc[Ref](parent@2@00, i@23@00)) == 0]
(assert (forall ((i@23@00 Int)) (!
  (=>
    (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
    (=
      ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00))
      0))
  :pattern (($FVF.loc_int ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@26@4@26@97|)))
; [eval] (forall i: Int :: { loc(parent, i).int } 0 <= i && i < len(parent) ==> loc(parent, i).int == 0)
(declare-const i@27@00 Int)
(push) ; 4
; [eval] 0 <= i && i < len(parent) ==> loc(parent, i).int == 0
; [eval] 0 <= i && i < len(parent)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 7 | !(0 <= i@27@00) | live]
; [else-branch: 7 | 0 <= i@27@00 | live]
(push) ; 6
; [then-branch: 7 | !(0 <= i@27@00)]
(assert (not (<= 0 i@27@00)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | 0 <= i@27@00]
(assert (<= 0 i@27@00))
; [eval] i < len(parent)
; [eval] len(parent)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@27@00) (not (<= 0 i@27@00))))
(push) ; 5
; [then-branch: 8 | 0 <= i@27@00 && i@27@00 < len[Int](parent@2@00) | live]
; [else-branch: 8 | !(0 <= i@27@00 && i@27@00 < len[Int](parent@2@00)) | live]
(push) ; 6
; [then-branch: 8 | 0 <= i@27@00 && i@27@00 < len[Int](parent@2@00)]
(assert (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00))))
; [eval] loc(parent, i).int == 0
; [eval] loc(parent, i)
(declare-fun sm@28@00 ($Snap array array Int) $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef22|)))
(declare-const pm@29@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@29@00  $FPM) r)
    (+
      (ite
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@29@00  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.perm_int (as pm@29@00  $FPM) r))
  :qid |qp.resTrgDef24|)))
(assert ($FVF.loc_int ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@27@00)) (loc<Ref> parent@2@00 i@27@00)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_int (as pm@29@00  $FPM) (loc<Ref> parent@2@00 i@27@00)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 8 | !(0 <= i@27@00 && i@27@00 < len[Int](parent@2@00))]
(assert (not (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@29@00  $FPM) r)
    (+
      (ite
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@29@00  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.perm_int (as pm@29@00  $FPM) r))
  :qid |qp.resTrgDef24|)))
(assert (=>
  (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00)))
  (and
    (<= 0 i@27@00)
    (< i@27@00 (len<Int> parent@2@00))
    ($FVF.loc_int ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@27@00)) (loc<Ref> parent@2@00 i@27@00)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00))))
  (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00)))))
(declare-fun sm@30@00 ($Snap array array Int) $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef27|)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@29@00  $FPM) r)
    (+
      (ite
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@29@00  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.perm_int (as pm@29@00  $FPM) r))
  :qid |qp.resTrgDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef27|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@27@00 Int)) (!
  (and
    (or (<= 0 i@27@00) (not (<= 0 i@27@00)))
    (=>
      (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00)))
      (and
        (<= 0 i@27@00)
        (< i@27@00 (len<Int> parent@2@00))
        ($FVF.loc_int ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@27@00)) (loc<Ref> parent@2@00 i@27@00))))
    (or
      (not (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00))))
      (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00)))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@27@00)) (loc<Ref> parent@2@00 i@27@00)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@27@4@27@97-aux|)))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@29@00  $FPM) r)
    (+
      (ite
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@29@00  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.perm_int (as pm@29@00  $FPM) r))
  :qid |qp.resTrgDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> left@3@00))))
    (=
      ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
      (and
        (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
        (<
          (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (len<Int> parent@2@00))))
    (=
      ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
  :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
  :qid |qp.fvfResTrgDef27|)))
(assert (=>
  (forall ((i@23@00 Int)) (!
    (=>
      (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
      (=
        ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00))
        0))
    :pattern (($FVF.loc_int ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@26@4@26@97|))
  (and
    (forall ((i@23@00 Int)) (!
      (=>
        (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
        (=
          ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00))
          0))
      :pattern (($FVF.loc_int ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@26@4@26@97|))
    (forall ((i@27@00 Int)) (!
      (and
        (or (<= 0 i@27@00) (not (<= 0 i@27@00)))
        (=>
          (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00)))
          (and
            (<= 0 i@27@00)
            (< i@27@00 (len<Int> parent@2@00))
            ($FVF.loc_int ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@27@00)) (loc<Ref> parent@2@00 i@27@00))))
        (or
          (not (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00))))
          (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00)))))
      :pattern (($FVF.loc_int ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@27@00)) (loc<Ref> parent@2@00 i@27@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@27@4@27@97-aux|)))))
(assert (or
  (forall ((i@23@00 Int)) (!
    (=>
      (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
      (=
        ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00))
        0))
    :pattern (($FVF.loc_int ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@26@4@26@97|))
  (not
    (forall ((i@23@00 Int)) (!
      (=>
        (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
        (=
          ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00))
          0))
      :pattern (($FVF.loc_int ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@26@4@26@97|)))))
(assert (=
  result@5@00
  (and
    (forall ((i@23@00 Int)) (!
      (=>
        (and (<= 0 i@23@00) (< i@23@00 (len<Int> parent@2@00)))
        (=
          ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00))
          0))
      :pattern (($FVF.loc_int ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@23@00)) (loc<Ref> parent@2@00 i@23@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@26@4@26@97|))
    (forall ((i@27@00 Int)) (!
      (=>
        (and (<= 0 i@27@00) (< i@27@00 (len<Int> parent@2@00)))
        (=
          ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@27@00))
          0))
      :pattern (($FVF.loc_int ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i@27@00)) (loc<Ref> parent@2@00 i@27@00)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0648.vpr@27@4@27@97|)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (parent@2@00 array) (left@3@00 array) (root@4@00 Int)) (!
  (and
    (forall ((i@11@00 Int)) (!
      (=>
        (and (<= 0 i@11@00) (< i@11@00 (len<Int> left@3@00)))
        (and
          (=
            (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@11@00))
            i@11@00)
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@11@00))))
      :pattern ((loc<Ref> left@3@00 i@11@00))
      :qid |quant-u-10|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (=
          (loc<Ref> left@3@00 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          r))
      :pattern ((inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      :qid |int-fctOfInv|))
    (forall ((i@15@00 Int)) (!
      (=>
        (and (<= 0 i@15@00) (< i@15@00 (len<Int> parent@2@00)))
        (and
          (=
            (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> parent@2@00 i@15@00))
            i@15@00)
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> parent@2@00 i@15@00))))
      :pattern ((loc<Ref> parent@2@00 i@15@00))
      :qid |quant-u-13|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (=
          (loc<Ref> parent@2@00 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          r))
      :pattern ((inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      :qid |int-fctOfInv|))
    (forall ((i@19@00 Int)) (!
      (=>
        (and (<= 0 i@19@00) (< i@19@00 (len<Int> left@3@00)))
        (and
          (=
            (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@19@00))
            i@19@00)
          (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 (loc<Ref> left@3@00 i@19@00))))
      :pattern ((loc<Ref> left@3@00 i@19@00))
      :qid |int-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (=
          (loc<Ref> left@3@00 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          r))
      :pattern ((inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
      :qid |int-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)))
          (and
            (and
              (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
              (<
                (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                (len<Int> left@3@00)))
            (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
              (<
                (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                (len<Int> left@3@00)))
            (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00)))))
      :pattern ((Set_in r ($FVF.domain_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00))))
      :qid |qp.fvfDomDef11|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
              (<
                (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                (len<Int> left@3@00)))
            (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (and
            (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (and
              (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
              (<
                (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                (len<Int> left@3@00)))))
        (=
          ($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r))
              (<
                (inv@20@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                (len<Int> left@3@00)))
            (img@21@00 s@$ parent@2@00 left@3@00 root@4@00 r))
          (and
            (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
            (and
              (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
              (<
                (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
                (len<Int> parent@2@00)))))
        (=
          ($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef9|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_int (sm@22@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :qid |qp.fvfResTrgDef10|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (=
          ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef12|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (=
          ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef13|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :qid |qp.fvfResTrgDef14|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (=
          ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (=
          ($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef18|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_int (sm@26@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :qid |qp.fvfResTrgDef19|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (=
          ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef20|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (=
          ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef21|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :qid |qp.fvfResTrgDef22|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@13@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@12@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> left@3@00))))
        (=
          ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@17@00 s@$ parent@2@00 left@3@00 root@4@00 r)
          (and
            (<= 0 (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r))
            (<
              (inv@16@00 s@$ parent@2@00 left@3@00 root@4@00 r)
              (len<Int> parent@2@00))))
        (=
          ($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r)
          ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef26|))
    (forall ((r $Ref)) (!
      (and
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first s@$)) r) r)
        ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second s@$))) r) r))
      :pattern (($FVF.lookup_int (sm@30@00 s@$ parent@2@00 left@3@00 root@4@00) r))
      :qid |qp.fvfResTrgDef27|))
    (=>
      (correctness_upto%precondition s@$ parent@2@00 left@3@00 root@4@00)
      (=
        (correctness_upto s@$ parent@2@00 left@3@00 root@4@00)
        (forall ((i Int)) (!
          (=>
            (and (<= 0 i) (< i (len<Int> parent@2@00)))
            (=
              (ite
                (and (<= 0 i) (< i (len<Int> parent@2@00)))
                ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i))
                ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i)))
              0))
          :pattern ((ite
            (and (<= 0 i) (< i (len<Int> parent@2@00)))
            ($FVF.lookup_int (sm@24@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i))
            ($FVF.lookup_int (sm@28@00 s@$ parent@2@00 left@3@00 root@4@00) (loc<Ref> parent@2@00 i))))
          )))))
  :pattern ((correctness_upto s@$ parent@2@00 left@3@00 root@4@00))
  :qid |quant-u-22|)))
; WARNING: (2873,11): 'and' cannot be used in patterns.
; WARNING: (2873,11): 'if' cannot be used in patterns.
(assert (forall ((s@$ $Snap) (parent@2@00 array) (left@3@00 array) (root@4@00 Int)) (!
  true
  :pattern ((correctness_upto s@$ parent@2@00 left@3@00 root@4@00))
  :qid |quant-u-23|)))
