(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0652.vpr
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
(declare-fun array_loc<Ref> (array Int) $Ref)
(declare-fun alen<Int> (array) Int)
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
(declare-fun aloc ($Snap array Int) $Ref)
(declare-fun aloc%limited ($Snap array Int) $Ref)
(declare-fun aloc%stateless (array Int) Bool)
(declare-fun aloc%precondition ($Snap array Int) Bool)
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
    (= (loc_inv_1<array> (array_loc<Ref> a i)) a)
    (= (loc_inv_2<Int> (array_loc<Ref> a i)) i))
  :pattern ((array_loc<Ref> a i))
  )))
(assert (forall ((a array)) (!
  (>= (alen<Int> a) 0)
  :pattern ((alen<Int> a))
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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (a@0@00 array) (i@1@00 Int)) (!
  (= (aloc%limited s@$ a@0@00 i@1@00) (aloc s@$ a@0@00 i@1@00))
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 array) (i@1@00 Int)) (!
  (aloc%stateless a@0@00 i@1@00)
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@0@00 array) (i@1@00 Int)) (!
  (=>
    (aloc%precondition s@$ a@0@00 i@1@00)
    (= (aloc s@$ a@0@00 i@1@00) (array_loc<Ref> a@0@00 i@1@00)))
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@0@00 array) (i@1@00 Int)) (!
  true
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- main ----------
(declare-const arr1@0@01 array)
(declare-const arr2@1@01 array)
(declare-const arr1@2@01 array)
(declare-const arr2@3@01 array)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] alen(arr1) == 6
; [eval] alen(arr1)
(assert (= (alen<Int> arr1@2@01) 6))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] alen(arr2) == 12
; [eval] alen(arr2)
(assert (= (alen<Int> arr2@3@01) 12))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(declare-const i@5@01 Int)
(push) ; 2
; [eval] 0 <= i && i < 6
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@5@01) | live]
; [else-branch: 0 | 0 <= i@5@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@5@01)]
(assert (not (<= 0 i@5@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@5@01]
(assert (<= 0 i@5@01))
; [eval] i < 6
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
(assert (and (<= 0 i@5@01) (< i@5@01 6)))
; [eval] aloc(arr1, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 4
(assert (not (< i@5@01 (alen<Int> arr1@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< i@5@01 (alen<Int> arr1@2@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< i@5@01 (alen<Int> arr1@2@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01)))
(declare-const sm@6@01 $FVF<int>)
; Definitional axioms for snapshot map values
; [eval] aloc(arr1, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(pop) ; 2
(declare-fun inv@7@01 ($Ref) Int)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 6))
    (and
      (or (<= 0 i@5@01) (not (<= 0 i@5@01)))
      (< i@5@01 (alen<Int> arr1@2@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@5@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01)))
  :qid |int-aux|)))
; Check receiver injectivity
(assert (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and (and (<= 0 i1@5@01) (< i1@5@01 6)) (and (<= 0 i2@5@01) (< i2@5@01 6)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i1@5@01)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i2@5@01)))
  
  :qid |int-rcvrInj|)))
(push) ; 2
(assert (not (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@5@01) (< i1@5@01 6))
      (and (<= 0 i2@5@01) (< i2@5@01 6))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i1@5@01)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i2@5@01)))
    (= i1@5@01 i2@5@01))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 6))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01)
      (=>
        (=
          (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01))
          i@5@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@5@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01)))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@7@01 r)))
  :pattern ((inv@7@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 6))
    (and
      (=
        (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01))
        i@5@01)
      (img@8@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@5@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01)))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@7@01 r)) r))
  :pattern ((inv@7@01 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 6))
    (not
      (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01) $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@5@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01)))
  :qid |int-permImpliesNonNull|)))
(declare-const sm@9@01 $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@9@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@9@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
  :pattern (($FVF.lookup_int (as sm@9@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6))
    ($FVF.loc_int ($FVF.lookup_int (as sm@9@01  $FVF<int>) r) r))
  :pattern ((inv@7@01 r))
  :qid |quant-u-6|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) $Snap.unit))
; [eval] (forall i: Int :: { aloc(arr1, i).int } 0 <= i && i < 6 ==> aloc(arr1, i).int == 0)
(declare-const i@10@01 Int)
(push) ; 2
; [eval] 0 <= i && i < 6 ==> aloc(arr1, i).int == 0
; [eval] 0 <= i && i < 6
; [eval] 0 <= i
(push) ; 3
; [then-branch: 1 | !(0 <= i@10@01) | live]
; [else-branch: 1 | 0 <= i@10@01 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= i@10@01)]
(assert (not (<= 0 i@10@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= i@10@01]
(assert (<= 0 i@10@01))
; [eval] i < 6
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@10@01) (not (<= 0 i@10@01))))
(push) ; 3
; [then-branch: 2 | 0 <= i@10@01 && i@10@01 < 6 | live]
; [else-branch: 2 | !(0 <= i@10@01 && i@10@01 < 6) | live]
(push) ; 4
; [then-branch: 2 | 0 <= i@10@01 && i@10@01 < 6]
(assert (and (<= 0 i@10@01) (< i@10@01 6)))
; [eval] aloc(arr1, i).int == 0
; [eval] aloc(arr1, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@10@01 (alen<Int> arr1@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@10@01 (alen<Int> arr1@2@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (< i@10@01 (alen<Int> arr1@2@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
      (=
        ($FVF.lookup_int (as sm@9@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
    :pattern (($FVF.lookup_int (as sm@9@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
    :pattern (($FVF.lookup_int (as sm@9@01  $FVF<int>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_int ($FVF.lookup_int (as sm@9@01  $FVF<int>) (aloc ($Snap.combine
  $Snap.unit
  $Snap.unit) arr1@2@01 i@10@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01)))
(push) ; 5
(assert (not (and
  (img@8@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01))
  (and
    (<=
      0
      (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01)))
    (<
      (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01))
      6)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(0 <= i@10@01 && i@10@01 < 6)]
(assert (not (and (<= 0 i@10@01) (< i@10@01 6))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@9@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@9@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
  :pattern (($FVF.lookup_int (as sm@9@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and (<= 0 i@10@01) (< i@10@01 6))
  (and
    (<= 0 i@10@01)
    (< i@10@01 6)
    (< i@10@01 (alen<Int> arr1@2@01))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01)
    ($FVF.loc_int ($FVF.lookup_int (as sm@9@01  $FVF<int>) (aloc ($Snap.combine
      $Snap.unit
      $Snap.unit) arr1@2@01 i@10@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01)))))
; Joined path conditions
(assert (or (not (and (<= 0 i@10@01) (< i@10@01 6))) (and (<= 0 i@10@01) (< i@10@01 6))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@9@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@9@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
  :pattern (($FVF.lookup_int (as sm@9@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@10@01 Int)) (!
  (and
    (or (<= 0 i@10@01) (not (<= 0 i@10@01)))
    (=>
      (and (<= 0 i@10@01) (< i@10@01 6))
      (and
        (<= 0 i@10@01)
        (< i@10@01 6)
        (< i@10@01 (alen<Int> arr1@2@01))
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01)
        ($FVF.loc_int ($FVF.lookup_int (as sm@9@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i@10@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i@10@01))))
    (or
      (not (and (<= 0 i@10@01) (< i@10@01 6)))
      (and (<= 0 i@10@01) (< i@10@01 6))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@9@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@10@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0652.vpr@32@13@32@96-aux|)))
(assert (forall ((i@10@01 Int)) (!
  (=>
    (and (<= 0 i@10@01) (< i@10@01 6))
    (=
      ($FVF.lookup_int (as sm@9@01  $FVF<int>) (aloc ($Snap.combine
        $Snap.unit
        $Snap.unit) arr1@2@01 i@10@01))
      0))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@9@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@10@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@10@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0652.vpr@32@13@32@96|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(declare-const i@11@01 Int)
(push) ; 2
; [eval] 0 <= i && i < 12
; [eval] 0 <= i
(push) ; 3
; [then-branch: 3 | !(0 <= i@11@01) | live]
; [else-branch: 3 | 0 <= i@11@01 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= i@11@01)]
(assert (not (<= 0 i@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= i@11@01]
(assert (<= 0 i@11@01))
; [eval] i < 12
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
(assert (and (<= 0 i@11@01) (< i@11@01 12)))
; [eval] aloc(arr2, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 4
(assert (not (< i@11@01 (alen<Int> arr2@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< i@11@01 (alen<Int> arr2@3@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< i@11@01 (alen<Int> arr2@3@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)))
; Definitional axioms for snapshot map values
; [eval] aloc(arr2, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(pop) ; 2
(declare-fun inv@12@01 ($Ref) Int)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 12))
    (and
      (or (<= 0 i@11@01) (not (<= 0 i@11@01)))
      (< i@11@01 (alen<Int> arr2@3@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@11@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)))
  :qid |int-aux|)))
; Check receiver injectivity
(assert (forall ((i1@11@01 Int) (i2@11@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@11@01) (< i1@11@01 12))
      (and (<= 0 i2@11@01) (< i2@11@01 12)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@11@01)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@11@01)))
  
  :qid |int-rcvrInj|)))
(push) ; 2
(assert (not (forall ((i1@11@01 Int) (i2@11@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@11@01) (< i1@11@01 12))
      (and (<= 0 i2@11@01) (< i2@11@01 12))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@11@01)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@11@01)))
    (= i1@11@01 i2@11@01))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 12))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)
      (=>
        (=
          (inv@12@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01))
          i@11@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@11@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@12@01 r)))
  :pattern ((inv@12@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 12))
    (and
      (=
        (inv@12@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01))
        i@11@01)
      (img@13@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@11@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 12))
    (not
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)
        $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@11@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)))
  :qid |int-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@11@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@5@01))
    (=
      (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
      (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))))
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@14@01 $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
    (=
      ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r)))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12))
    ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) r) r))
  :pattern ((inv@12@01 r))
  :qid |quant-u-10|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; [eval] (forall i: Int :: { aloc(arr2, i).int } 0 <= i && i < 6 ==> aloc(arr2, i).int == 0 * (aloc(arr1, i).int - aloc(arr1, 0).int))
(declare-const i@15@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && i < 6 ==> aloc(arr2, i).int == 0 * (aloc(arr1, i).int - aloc(arr1, 0).int)
; [eval] 0 <= i && i < 6
; [eval] 0 <= i
(push) ; 3
; [then-branch: 4 | !(0 <= i@15@01) | live]
; [else-branch: 4 | 0 <= i@15@01 | live]
(push) ; 4
; [then-branch: 4 | !(0 <= i@15@01)]
(assert (not (<= 0 i@15@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | 0 <= i@15@01]
(assert (<= 0 i@15@01))
; [eval] i < 6
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
(push) ; 3
; [then-branch: 5 | 0 <= i@15@01 && i@15@01 < 6 | live]
; [else-branch: 5 | !(0 <= i@15@01 && i@15@01 < 6) | live]
(push) ; 4
; [then-branch: 5 | 0 <= i@15@01 && i@15@01 < 6]
(assert (and (<= 0 i@15@01) (< i@15@01 6)))
; [eval] aloc(arr2, i).int == 0 * (aloc(arr1, i).int - aloc(arr1, 0).int)
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@15@01 (alen<Int> arr2@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@15@01 (alen<Int> arr2@3@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (< i@15@01 (alen<Int> arr2@3@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
      (=
        ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
      (=
        ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r)))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r) r))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
  $Snap.unit
  $Snap.unit) arr2@3@01 i@15@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01)))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@8@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01))
        (and
          (<=
            0
            (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01)))
          (<
            (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01))
            6)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@13@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01))
        (and
          (<=
            0
            (inv@12@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01)))
          (<
            (inv@12@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01))
            12)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] 0 * (aloc(arr1, i).int - aloc(arr1, 0).int)
; [eval] aloc(arr1, i).int - aloc(arr1, 0).int
; [eval] aloc(arr1, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@15@01 (alen<Int> arr1@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@15@01 (alen<Int> arr1@2@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (< i@15@01 (alen<Int> arr1@2@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
      (=
        ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
      (=
        ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r)))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r) r))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
  $Snap.unit
  $Snap.unit) arr1@2@01 i@15@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01)))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@8@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01))
        (and
          (<=
            0
            (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01)))
          (<
            (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01))
            6)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@13@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01))
        (and
          (<=
            0
            (inv@12@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01)))
          (<
            (inv@12@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01))
            12)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] aloc(arr1, 0)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< 0 (alen<Int> arr1@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< 0 (alen<Int> arr1@2@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0))
(pop) ; 5
; Joined path conditions
(assert (and
  (< 0 (alen<Int> arr1@2@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
      (=
        ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
      (=
        ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r)))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r) r))
    :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
  $Snap.unit
  $Snap.unit) arr1@2@01 0)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0)))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@8@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0))
        (and
          (<=
            0
            (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0)))
          (<
            (inv@7@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0))
            6)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (and
        (img@13@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0))
        (and
          (<=
            0
            (inv@12@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0)))
          (<
            (inv@12@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0))
            12)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(0 <= i@15@01 && i@15@01 < 6)]
(assert (not (and (<= 0 i@15@01) (< i@15@01 6))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
    (=
      ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r)))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (and (<= 0 i@15@01) (< i@15@01 6))
  (and
    (<= 0 i@15@01)
    (< i@15@01 6)
    (< i@15@01 (alen<Int> arr2@3@01))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01)
    ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
      $Snap.unit
      $Snap.unit) arr2@3@01 i@15@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01))
    (< i@15@01 (alen<Int> arr1@2@01))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01)
    ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
      $Snap.unit
      $Snap.unit) arr1@2@01 i@15@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01))
    (< 0 (alen<Int> arr1@2@01))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0)
    ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
      $Snap.unit
      $Snap.unit) arr1@2@01 0)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0)))))
; Joined path conditions
(assert (or (not (and (<= 0 i@15@01) (< i@15@01 6))) (and (<= 0 i@15@01) (< i@15@01 6))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
    (=
      ($FVF.lookup_int (as sm@14@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r)))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_int (as sm@14@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@01 Int)) (!
  (and
    (or (<= 0 i@15@01) (not (<= 0 i@15@01)))
    (=>
      (and (<= 0 i@15@01) (< i@15@01 6))
      (and
        (<= 0 i@15@01)
        (< i@15@01 6)
        (< i@15@01 (alen<Int> arr2@3@01))
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01)
        ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i@15@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i@15@01))
        (< i@15@01 (alen<Int> arr1@2@01))
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@15@01)
        ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i@15@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i@15@01))
        (< 0 (alen<Int> arr1@2@01))
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0)
        ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 0)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 0))))
    (or
      (not (and (<= 0 i@15@01) (< i@15@01 6)))
      (and (<= 0 i@15@01) (< i@15@01 6))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@15@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0652.vpr@35@13@35@138-aux|)))
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= 0 i@15@01) (< i@15@01 6))
    (=
      ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
        $Snap.unit
        $Snap.unit) arr2@3@01 i@15@01))
      0))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@15@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@15@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0652.vpr@35@13@35@138|)))
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
(declare-const x@16@01 Int)
; [exec]
; x := 0
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.first $t@17@01) $Snap.unit))
; [eval] x == x
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(declare-const i@18@01 Int)
(push) ; 4
; [eval] 0 <= i && i < 6
; [eval] 0 <= i
(push) ; 5
; [then-branch: 6 | !(0 <= i@18@01) | live]
; [else-branch: 6 | 0 <= i@18@01 | live]
(push) ; 6
; [then-branch: 6 | !(0 <= i@18@01)]
(assert (not (<= 0 i@18@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | 0 <= i@18@01]
(assert (<= 0 i@18@01))
; [eval] i < 6
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@18@01) (not (<= 0 i@18@01))))
(assert (and (<= 0 i@18@01) (< i@18@01 6)))
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@18@01 (alen<Int> arr2@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@18@01 (alen<Int> arr2@3@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (< i@18@01 (alen<Int> arr2@3@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
(declare-const sm@19@01 $FVF<int>)
; Definitional axioms for snapshot map values
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 5
; Joined path conditions
(pop) ; 4
(declare-fun inv@20@01 ($Ref) Int)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 6))
    (and
      (or (<= 0 i@18@01) (not (<= 0 i@18@01)))
      (< i@18@01 (alen<Int> arr2@3@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@18@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :qid |int-aux|)))
; Check receiver injectivity
(assert (forall ((i1@18@01 Int) (i2@18@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@18@01) (< i1@18@01 6))
      (and (<= 0 i2@18@01) (< i2@18@01 6)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@18@01)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@18@01)))
  
  :qid |int-rcvrInj|)))
(push) ; 4
(assert (not (forall ((i1@18@01 Int) (i2@18@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@18@01) (< i1@18@01 6))
      (and (<= 0 i2@18@01) (< i2@18@01 6))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@18@01)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@18@01)))
    (= i1@18@01 i2@18@01))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 6))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
      (=>
        (=
          (inv@20@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))
          i@18@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@18@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@20@01 r)))
  :pattern ((inv@20@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 6))
    (and
      (=
        (inv@20@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))
        i@18@01)
      (img@21@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@18@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@20@01 r)) r))
  :pattern ((inv@20@01 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 6))
    (not
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
        $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@18@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :qid |int-permImpliesNonNull|)))
(declare-const sm@22@01 $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@22@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_int (as sm@22@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
  :pattern (($FVF.lookup_int (as sm@22@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6))
    ($FVF.loc_int ($FVF.lookup_int (as sm@22@01  $FVF<int>) r) r))
  :pattern ((inv@20@01 r))
  :qid |quant-u-13|)))
(assert (=
  ($Snap.second ($Snap.second $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
(declare-const i@23@01 Int)
(push) ; 4
; [eval] 6 <= i && i < 12
; [eval] 6 <= i
(push) ; 5
; [then-branch: 7 | !(6 <= i@23@01) | live]
; [else-branch: 7 | 6 <= i@23@01 | live]
(push) ; 6
; [then-branch: 7 | !(6 <= i@23@01)]
(assert (not (<= 6 i@23@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | 6 <= i@23@01]
(assert (<= 6 i@23@01))
; [eval] i < 12
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 i@23@01) (not (<= 6 i@23@01))))
(assert (and (<= 6 i@23@01) (< i@23@01 12)))
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
(push) ; 6
(assert (not (<= 0 i@23@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@23@01))
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@23@01 (alen<Int> arr2@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@23@01 (alen<Int> arr2@3@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 i@23@01)
  (< i@23@01 (alen<Int> arr2@3@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
; Definitional axioms for snapshot map values
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 5
; Joined path conditions
(pop) ; 4
(declare-fun inv@24@01 ($Ref) Int)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 6 i@23@01) (< i@23@01 12))
    (and
      (or (<= 6 i@23@01) (not (<= 6 i@23@01)))
      (<= 0 i@23@01)
      (< i@23@01 (alen<Int> arr2@3@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@23@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :qid |int-aux|)))
; Check receiver injectivity
(assert (forall ((i1@23@01 Int) (i2@23@01 Int)) (!
  (=>
    (and
      (and (<= 6 i1@23@01) (< i1@23@01 12))
      (and (<= 6 i2@23@01) (< i2@23@01 12)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@23@01)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@23@01)))
  
  :qid |int-rcvrInj|)))
(push) ; 4
(assert (not (forall ((i1@23@01 Int) (i2@23@01 Int)) (!
  (=>
    (and
      (and (<= 6 i1@23@01) (< i1@23@01 12))
      (and (<= 6 i2@23@01) (< i2@23@01 12))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@23@01)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@23@01)))
    (= i1@23@01 i2@23@01))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 6 i@23@01) (< i@23@01 12))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)
      (=>
        (=
          (inv@24@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
          i@23@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@23@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@24@01 r)))
  :pattern ((inv@24@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 6 i@23@01) (< i@23@01 12))
    (and
      (=
        (inv@24@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
        i@23@01)
      (img@25@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@23@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@24@01 r)) r))
  :pattern ((inv@24@01 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 6 i@23@01) (< i@23@01 12))
    (not
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)
        $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@23@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :qid |int-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))
    (=
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))))
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const sm@26@01 $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@26@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_int (as sm@26@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
    (=
      ($FVF.lookup_int (as sm@26@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@26@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r) r))
  :pattern (($FVF.lookup_int (as sm@26@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12))
    ($FVF.loc_int ($FVF.lookup_int (as sm@26@01  $FVF<int>) r) r))
  :pattern ((inv@24@01 r))
  :qid |quant-u-17|)))
(declare-const i@27@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < 6
; [eval] 0 <= i
(push) ; 5
; [then-branch: 8 | !(0 <= i@27@01) | live]
; [else-branch: 8 | 0 <= i@27@01 | live]
(push) ; 6
; [then-branch: 8 | !(0 <= i@27@01)]
(assert (not (<= 0 i@27@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | 0 <= i@27@01]
(assert (<= 0 i@27@01))
; [eval] i < 6
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
(assert (and (<= 0 i@27@01) (< i@27@01 6)))
; [eval] aloc(arr1, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@27@01 (alen<Int> arr1@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@27@01 (alen<Int> arr1@2@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (< i@27@01 (alen<Int> arr1@2@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
; Definitional axioms for snapshot map values
; [eval] aloc(arr1, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 5
; Joined path conditions
(pop) ; 4
(declare-fun inv@28@01 ($Ref) Int)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 6))
    (and
      (or (<= 0 i@27@01) (not (<= 0 i@27@01)))
      (< i@27@01 (alen<Int> arr1@2@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@27@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :qid |int-aux|)))
; Check receiver injectivity
(assert (forall ((i1@27@01 Int) (i2@27@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@27@01) (< i1@27@01 6))
      (and (<= 0 i2@27@01) (< i2@27@01 6)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i1@27@01)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i2@27@01)))
  
  :qid |int-rcvrInj|)))
(push) ; 4
(assert (not (forall ((i1@27@01 Int) (i2@27@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@27@01) (< i1@27@01 6))
      (and (<= 0 i2@27@01) (< i2@27@01 6))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i1@27@01)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i2@27@01)))
    (= i1@27@01 i2@27@01))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 6))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)
      (=>
        (=
          (inv@28@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
          i@27@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@27@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@28@01 r)))
  :pattern ((inv@28@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 6))
    (and
      (=
        (inv@28@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
        i@27@01)
      (img@29@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@27@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@28@01 r)) r))
  :pattern ((inv@28@01 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 6))
    (not
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)
        $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@27@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :qid |int-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
    (=
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))))
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))
    (=
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))))
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const sm@30@01 $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
    (=
      ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r) r))
  :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6))
    ($FVF.loc_int ($FVF.lookup_int (as sm@30@01  $FVF<int>) r) r))
  :pattern ((inv@28@01 r))
  :qid |quant-u-22|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; Loop head block: Establish invariant
; [eval] x == x
(declare-const i@31@01 Int)
(push) ; 4
; [eval] 0 <= i && i < 6
; [eval] 0 <= i
(push) ; 5
; [then-branch: 9 | !(0 <= i@31@01) | live]
; [else-branch: 9 | 0 <= i@31@01 | live]
(push) ; 6
; [then-branch: 9 | !(0 <= i@31@01)]
(assert (not (<= 0 i@31@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | 0 <= i@31@01]
(assert (<= 0 i@31@01))
; [eval] i < 6
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@31@01) (not (<= 0 i@31@01))))
(assert (and (<= 0 i@31@01) (< i@31@01 6)))
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@31@01 (alen<Int> arr2@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@31@01 (alen<Int> arr2@3@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (< i@31@01 (alen<Int> arr2@3@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01)))
; Definitional axioms for snapshot map values
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 5
; Joined path conditions
(pop) ; 4
(declare-fun inv@32@01 ($Ref) Int)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@31@01 Int)) (!
  (=>
    (and (<= 0 i@31@01) (< i@31@01 6))
    (and
      (or (<= 0 i@31@01) (not (<= 0 i@31@01)))
      (< i@31@01 (alen<Int> arr2@3@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@31@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01)))
  :qid |int-aux|)))
; Definitional axioms for snapshot map values
; Check receiver injectivity
(assert (forall ((i1@31@01 Int) (i2@31@01 Int)) (!
  (and
    (=>
      (and (<= 0 i1@31@01) (< i1@31@01 6))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@31@01))
    (=>
      (and
        (and (<= 0 i1@31@01) (< i1@31@01 6))
        ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i1@31@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i1@31@01)))
      (and
        (=>
          (and (<= 0 i2@31@01) (< i2@31@01 6))
          (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@31@01))
        (=>
          (and
            (and (<= 0 i2@31@01) (< i2@31@01 6))
            ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
              $Snap.unit
              $Snap.unit) arr2@3@01 i2@31@01)) (aloc ($Snap.combine
              $Snap.unit
              $Snap.unit) arr2@3@01 i2@31@01)))
          (and
            (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@31@01)
            (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@31@01))))))
  
  :qid |int-rcvrInj|)))
(push) ; 4
(assert (not (forall ((i1@31@01 Int) (i2@31@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@31@01) (< i1@31@01 6))
        ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i1@31@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i1@31@01)))
      (and
        (and (<= 0 i2@31@01) (< i2@31@01 6))
        ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i2@31@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i2@31@01)))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@31@01)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@31@01)))
    (= i1@31@01 i2@31@01))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@31@01 Int)) (!
  (=>
    (and (<= 0 i@31@01) (< i@31@01 6))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01)
      (=>
        (=
          (inv@32@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01))
          i@31@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@31@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01)))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@01 r) (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) 6)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@32@01 r)))
  :pattern ((inv@32@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@31@01 Int)) (!
  (=>
    (and (<= 0 i@31@01) (< i@31@01 6))
    (and
      (=
        (inv@32@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01))
        i@31@01)
      (img@33@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@31@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01)))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@01 r) (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) 6)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@32@01 r)) r))
  :pattern ((inv@32@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) 6))
    ($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) r) r))
  :pattern ((inv@32@01 r))
  :qid |quant-u-24|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@31@01 Int)) (!
  (=
    (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@31@01)
    (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@31@01))
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) 6))
      (img@33@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@32@01 r))))
    ($Perm.min
      (ite
        (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@35@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) 6))
      (img@33@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@32@01 r))))
    ($Perm.min
      (ite
        (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@34@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
        $Perm.Write
        $Perm.No)
      (pTaken@34@01 r))
    $Perm.No)
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@34@01 r) $Perm.No)
  
  :qid |quant-u-28|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@32@01 r)) (< (inv@32@01 r) 6))
      (img@33@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@32@01 r))))
    (= (- $Perm.Write (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const i@36@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 6 <= i && i < 12
; [eval] 6 <= i
(push) ; 5
; [then-branch: 10 | !(6 <= i@36@01) | live]
; [else-branch: 10 | 6 <= i@36@01 | live]
(push) ; 6
; [then-branch: 10 | !(6 <= i@36@01)]
(assert (not (<= 6 i@36@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | 6 <= i@36@01]
(assert (<= 6 i@36@01))
; [eval] i < 12
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 6 i@36@01) (not (<= 6 i@36@01))))
(assert (and (<= 6 i@36@01) (< i@36@01 12)))
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
(push) ; 6
(assert (not (<= 0 i@36@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@36@01))
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@36@01 (alen<Int> arr2@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@36@01 (alen<Int> arr2@3@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (<= 0 i@36@01)
  (< i@36@01 (alen<Int> arr2@3@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01)))
; Definitional axioms for snapshot map values
; [eval] aloc(arr2, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 5
; Joined path conditions
(pop) ; 4
(declare-fun inv@37@01 ($Ref) Int)
(declare-fun img@38@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 6 i@36@01) (< i@36@01 12))
    (and
      (or (<= 6 i@36@01) (not (<= 6 i@36@01)))
      (<= 0 i@36@01)
      (< i@36@01 (alen<Int> arr2@3@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@36@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01)))
  :qid |int-aux|)))
(declare-const sm@39@01 $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@39@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@39@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
      (< $Perm.No (- $Perm.Write (pTaken@34@01 r)))
      false)
    (=
      ($FVF.lookup_int (as sm@39@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r)))
  :pattern (($FVF.lookup_int (as sm@39@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_int (as sm@39@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef18|)))
; Check receiver injectivity
(assert (forall ((i1@36@01 Int) (i2@36@01 Int)) (!
  (and
    (=>
      (and (<= 6 i1@36@01) (< i1@36@01 12))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@36@01))
    (=>
      (and
        (and (<= 6 i1@36@01) (< i1@36@01 12))
        ($FVF.loc_int ($FVF.lookup_int (as sm@39@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i1@36@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i1@36@01)))
      (and
        (=>
          (and (<= 6 i2@36@01) (< i2@36@01 12))
          (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@36@01))
        (=>
          (and
            (and (<= 6 i2@36@01) (< i2@36@01 12))
            ($FVF.loc_int ($FVF.lookup_int (as sm@39@01  $FVF<int>) (aloc ($Snap.combine
              $Snap.unit
              $Snap.unit) arr2@3@01 i2@36@01)) (aloc ($Snap.combine
              $Snap.unit
              $Snap.unit) arr2@3@01 i2@36@01)))
          (and
            (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@36@01)
            (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@36@01))))))
  
  :qid |int-rcvrInj|)))
(push) ; 4
(assert (not (forall ((i1@36@01 Int) (i2@36@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 6 i1@36@01) (< i1@36@01 12))
        ($FVF.loc_int ($FVF.lookup_int (as sm@39@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i1@36@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i1@36@01)))
      (and
        (and (<= 6 i2@36@01) (< i2@36@01 12))
        ($FVF.loc_int ($FVF.lookup_int (as sm@39@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i2@36@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr2@3@01 i2@36@01)))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@36@01)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@36@01)))
    (= i1@36@01 i2@36@01))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 6 i@36@01) (< i@36@01 12))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01)
      (=>
        (=
          (inv@37@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01))
          i@36@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@36@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01)))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@38@01 r) (and (<= 6 (inv@37@01 r)) (< (inv@37@01 r) 12)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@37@01 r)))
  :pattern ((inv@37@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 6 i@36@01) (< i@36@01 12))
    (and
      (=
        (inv@37@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01))
        i@36@01)
      (img@38@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@36@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01)))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@38@01 r) (and (<= 6 (inv@37@01 r)) (< (inv@37@01 r) 12)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@37@01 r)) r))
  :pattern ((inv@37@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 6 (inv@37@01 r)) (< (inv@37@01 r) 12))
    ($FVF.loc_int ($FVF.lookup_int (as sm@39@01  $FVF<int>) r) r))
  :pattern ((inv@37@01 r))
  :qid |quant-u-31|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@36@01 Int)) (!
  (=
    (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@36@01)
    (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@36@01))
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@37@01 r)) (< (inv@37@01 r) 12))
      (img@38@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@37@01 r))))
    ($Perm.min
      (ite
        (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
        (- $Perm.Write (pTaken@34@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 6 (inv@37@01 r)) (< (inv@37@01 r) 12))
      (img@38@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@37@01 r))))
    ($Perm.min
      (ite
        (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@40@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
        (- $Perm.Write (pTaken@34@01 r))
        $Perm.No)
      (pTaken@40@01 r))
    $Perm.No)
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@40@01 r) $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 6 (inv@37@01 r)) (< (inv@37@01 r) 12))
      (img@38@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@37@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@40@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const i@42@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < 6
; [eval] 0 <= i
(push) ; 5
; [then-branch: 11 | !(0 <= i@42@01) | live]
; [else-branch: 11 | 0 <= i@42@01 | live]
(push) ; 6
; [then-branch: 11 | !(0 <= i@42@01)]
(assert (not (<= 0 i@42@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | 0 <= i@42@01]
(assert (<= 0 i@42@01))
; [eval] i < 6
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@42@01) (not (<= 0 i@42@01))))
(assert (and (<= 0 i@42@01) (< i@42@01 6)))
; [eval] aloc(arr1, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 6
(assert (not (< i@42@01 (alen<Int> arr1@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@42@01 (alen<Int> arr1@2@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01))
(pop) ; 5
; Joined path conditions
(assert (and
  (< i@42@01 (alen<Int> arr1@2@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01)))
; Definitional axioms for snapshot map values
; [eval] aloc(arr1, i)
(push) ; 5
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 5
; Joined path conditions
(pop) ; 4
(declare-fun inv@43@01 ($Ref) Int)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 6))
    (and
      (or (<= 0 i@42@01) (not (<= 0 i@42@01)))
      (< i@42@01 (alen<Int> arr1@2@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@42@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01)))
  :qid |int-aux|)))
(declare-const sm@45@01 $FVF<int>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@45@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@45@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
      (< $Perm.No (- (- $Perm.Write (pTaken@34@01 r)) (pTaken@40@01 r)))
      false)
    (=
      ($FVF.lookup_int (as sm@45@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r)))
  :pattern (($FVF.lookup_int (as sm@45@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_int (as sm@45@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef21|)))
; Check receiver injectivity
(assert (forall ((i1@42@01 Int) (i2@42@01 Int)) (!
  (and
    (=>
      (and (<= 0 i1@42@01) (< i1@42@01 6))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i1@42@01))
    (=>
      (and
        (and (<= 0 i1@42@01) (< i1@42@01 6))
        ($FVF.loc_int ($FVF.lookup_int (as sm@45@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i1@42@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i1@42@01)))
      (and
        (=>
          (and (<= 0 i2@42@01) (< i2@42@01 6))
          (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i2@42@01))
        (=>
          (and
            (and (<= 0 i2@42@01) (< i2@42@01 6))
            ($FVF.loc_int ($FVF.lookup_int (as sm@45@01  $FVF<int>) (aloc ($Snap.combine
              $Snap.unit
              $Snap.unit) arr1@2@01 i2@42@01)) (aloc ($Snap.combine
              $Snap.unit
              $Snap.unit) arr1@2@01 i2@42@01)))
          (and
            (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i1@42@01)
            (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i2@42@01))))))
  
  :qid |int-rcvrInj|)))
(push) ; 4
(assert (not (forall ((i1@42@01 Int) (i2@42@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@42@01) (< i1@42@01 6))
        ($FVF.loc_int ($FVF.lookup_int (as sm@45@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i1@42@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i1@42@01)))
      (and
        (and (<= 0 i2@42@01) (< i2@42@01 6))
        ($FVF.loc_int ($FVF.lookup_int (as sm@45@01  $FVF<int>) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i2@42@01)) (aloc ($Snap.combine
          $Snap.unit
          $Snap.unit) arr1@2@01 i2@42@01)))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i1@42@01)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i2@42@01)))
    (= i1@42@01 i2@42@01))
  
  :qid |int-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 6))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01)
      (=>
        (=
          (inv@43@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01))
          i@42@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@42@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01)))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) 6)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@43@01 r)))
  :pattern ((inv@43@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 6))
    (and
      (=
        (inv@43@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01))
        i@42@01)
      (img@44@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@14@01  $FVF<int>) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@42@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01)))
  :qid |int-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) 6)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@43@01 r)) r))
  :pattern ((inv@43@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) 6))
    ($FVF.loc_int ($FVF.lookup_int (as sm@45@01  $FVF<int>) r) r))
  :pattern ((inv@43@01 r))
  :qid |quant-u-38|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@42@01 Int)) (!
  (=
    (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@42@01)
    (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@42@01))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) 6))
      (img@44@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@43@01 r))))
    ($Perm.min
      (ite
        (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@47@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) 6))
      (img@44@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@43@01 r))))
    ($Perm.min
      (ite
        (and (img@13@01 r) (and (<= 0 (inv@12@01 r)) (< (inv@12@01 r) 12)))
        (- (- $Perm.Write (pTaken@34@01 r)) (pTaken@40@01 r))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@46@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@8@01 r) (and (<= 0 (inv@7@01 r)) (< (inv@7@01 r) 6)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@46@01 r))
    $Perm.No)
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) 6))
      (img@44@01 r)
      (= r (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@43@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; Loop head block: Execute statements of loop head block (in invariant state)
(set-option :timeout 0)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@28@01 r)))
  :pattern ((inv@28@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 (inv@28@01 r)) r))
  :pattern ((inv@28@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
    (=
      ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r) r))
  :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 6))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)
      (=>
        (=
          (inv@28@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
          i@27@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@27@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :qid |quant-u-19|)))
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 6))
    (and
      (=
        (inv@28@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
        i@27@01)
      (img@29@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@27@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :qid |quant-u-19|)))
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 6))
    (not
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)
        $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@27@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :qid |int-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6))
    ($FVF.loc_int ($FVF.lookup_int (as sm@30@01  $FVF<int>) r) r))
  :pattern ((inv@28@01 r))
  :qid |quant-u-22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@24@01 r)))
  :pattern ((inv@24@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@24@01 r)) r))
  :pattern ((inv@24@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@26@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_int (as sm@26@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
    (=
      ($FVF.lookup_int (as sm@26@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r)))
  :pattern (($FVF.lookup_int (as sm@26@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r) r))
  :pattern (($FVF.lookup_int (as sm@26@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 6 i@23@01) (< i@23@01 12))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)
      (=>
        (=
          (inv@24@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
          i@23@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@23@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :qid |quant-u-15|)))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 6 i@23@01) (< i@23@01 12))
    (and
      (=
        (inv@24@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
        i@23@01)
      (img@25@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@23@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :qid |quant-u-15|)))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 6 i@23@01) (< i@23@01 12))
    (not
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)
        $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@23@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :qid |int-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12))
    ($FVF.loc_int ($FVF.lookup_int (as sm@26@01  $FVF<int>) r) r))
  :pattern ((inv@24@01 r))
  :qid |quant-u-17|)))
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 6))
    (and
      (or (<= 0 i@27@01) (not (<= 0 i@27@01)))
      (< i@27@01 (alen<Int> arr1@2@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr1@2@01 i@27@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01)))
  :qid |int-aux|)))
(assert (forall ((i1@27@01 Int) (i2@27@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@27@01) (< i1@27@01 6))
      (and (<= 0 i2@27@01) (< i2@27@01 6)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i1@27@01)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i2@27@01)))
  
  :qid |int-rcvrInj|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@20@01 r)))
  :pattern ((inv@20@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 (inv@20@01 r)) r))
  :pattern ((inv@20@01 r))
  :qid |int-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
    (=
      ($FVF.lookup_int (as sm@22@01  $FVF<int>) r)
      ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_int (as sm@22@01  $FVF<int>) r))
  :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
  :pattern (($FVF.lookup_int (as sm@22@01  $FVF<int>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 6))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
      (=>
        (=
          (inv@20@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))
          i@18@01)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@18@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :qid |quant-u-12|)))
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 6))
    (and
      (=
        (inv@20@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))
        i@18@01)
      (img@21@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01))))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@18@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :qid |quant-u-12|)))
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 6))
    (not
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
        $Ref.null)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@18@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :qid |int-permImpliesNonNull|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6))
    ($FVF.loc_int ($FVF.lookup_int (as sm@22@01  $FVF<int>) r) r))
  :pattern ((inv@20@01 r))
  :qid |quant-u-13|)))
(assert (=
  ($Snap.second ($Snap.second $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 6 i@23@01) (< i@23@01 12))
    (and
      (or (<= 6 i@23@01) (not (<= 6 i@23@01)))
      (<= 0 i@23@01)
      (< i@23@01 (alen<Int> arr2@3@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@23@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)))
  :qid |int-aux|)))
(assert (forall ((i1@23@01 Int) (i2@23@01 Int)) (!
  (=>
    (and
      (and (<= 6 i1@23@01) (< i1@23@01 12))
      (and (<= 6 i2@23@01) (< i2@23@01 12)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@23@01)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@23@01)))
  
  :qid |int-rcvrInj|)))
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(assert (= ($Snap.first $t@17@01) $Snap.unit))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (<= 0 i@18@01) (< i@18@01 6))
    (and
      (or (<= 0 i@18@01) (not (<= 0 i@18@01)))
      (< i@18@01 (alen<Int> arr2@3@01))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :pattern (($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) (aloc ($Snap.combine
    $Snap.unit
    $Snap.unit) arr2@3@01 i@18@01)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)))
  :qid |int-aux|)))
(assert (forall ((i1@18@01 Int) (i2@18@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@18@01) (< i1@18@01 6))
      (and (<= 0 i2@18@01) (< i2@18@01 6)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i1@18@01)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i2@18@01)))
  
  :qid |int-rcvrInj|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
(pop) ; 5
(push) ; 5
; [eval] !true
(pop) ; 5
; Loop head block: Follow loop-internal edges
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | True | live]
; [else-branch: 12 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | True]
; [exec]
; assert aloc(arr2, 6).int == aloc(arr2, 6).int
; [eval] aloc(arr2, 6).int == aloc(arr2, 6).int
; [eval] aloc(arr2, 6)
(push) ; 6
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 7
(assert (not (< 6 (alen<Int> arr2@3@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< 6 (alen<Int> arr2@3@01)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
(pop) ; 6
; Joined path conditions
(assert (and
  (< 6 (alen<Int> arr2@3@01))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
      (=
        ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r)))
    :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
      (=
        ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r)))
    :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
      (=
        ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r)))
    :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r) r)
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r) r))
    :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
    :qid |qp.fvfResTrgDef15|))))
(assert ($FVF.loc_int ($FVF.lookup_int (as sm@30@01  $FVF<int>) (aloc ($Snap.combine
  $Snap.unit
  $Snap.unit) arr2@3@01 6)) (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6)))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@21@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
          (and
            (<=
              0
              (inv@20@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6)))
            (<
              (inv@20@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
              6)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@25@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
          (and
            (<=
              6
              (inv@24@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6)))
            (<
              (inv@24@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
              12)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@29@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
        (and
          (<=
            0
            (inv@28@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6)))
          (<
            (inv@28@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
            6)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] aloc(arr2, 6)
(push) ; 6
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 6
; Joined path conditions
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
      (=
        ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r)))
    :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r))
    :qid |qp.fvfValDef12|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
      (=
        ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r)))
    :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
      (=
        ($FVF.lookup_int (as sm@30@01  $FVF<int>) r)
        ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r)))
    :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
    :pattern (($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r) r)
      ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r) r))
    :pattern (($FVF.lookup_int (as sm@30@01  $FVF<int>) r))
    :qid |qp.fvfResTrgDef15|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@21@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
          (and
            (<=
              0
              (inv@20@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6)))
            (<
              (inv@20@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
              6)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@25@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
          (and
            (<=
              6
              (inv@24@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6)))
            (<
              (inv@24@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
              12)))
        (/ (to_real 1) (to_real 2))
        $Perm.No))
    (ite
      (and
        (img@29@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
        (and
          (<=
            0
            (inv@28@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6)))
          (<
            (inv@28@01 (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 6))
            6)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert 3 + 8 == 38
; [eval] 3 + 8 == 38
; [eval] 3 + 8
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
    (=
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
    (=
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))))
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
    (=
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(declare-const pm@48@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@48@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
          $Perm.Write
          $Perm.No)
        (ite
          (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (as sm@30@01  $FVF<int>) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r) r))
  :pattern (($FVF.perm_int (as pm@48@01  $FPM) r))
  :qid |qp.resTrgDef23|)))
; Assume upper permission bound for field int
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_int (as pm@48@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@30@01  $FVF<int>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 3 + 8 == 38
; [eval] 3 + 8
(set-option :timeout 0)
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
    (=
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))))
  
  :qid |quant-u-46|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
    (=
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
    (=
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(declare-const pm@49@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_int (as pm@49@01  $FPM) r)
    (+
      (+
        (ite
          (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
          $Perm.Write
          $Perm.No)
        (ite
          (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
          (/ (to_real 1) (to_real 2))
          $Perm.No))
      (ite
        (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)))
  :pattern (($FVF.perm_int (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_int ($FVF.lookup_int (as sm@30@01  $FVF<int>) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second $t@17@01))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.first ($Snap.second ($Snap.second $t@17@01)))) r) r)
    ($FVF.loc_int ($FVF.lookup_int ($SortWrappers.$SnapTo$FVF<int> ($Snap.second ($Snap.second ($Snap.second $t@17@01)))) r) r))
  :pattern (($FVF.perm_int (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
; Assume upper permission bound for field int
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_int (as pm@49@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_int ($FVF.lookup_int (as sm@30@01  $FVF<int>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 3 + 8 == 38
; [eval] 3 + 8
(set-option :timeout 0)
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
    (=
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))))
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@23@01))
    (=
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
      (and (img@25@01 r) (and (<= 6 (inv@24@01 r)) (< (inv@24@01 r) 12)))))
  
  :qid |quant-u-50|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr2@3@01 i@18@01)
      (aloc ($Snap.combine $Snap.unit $Snap.unit) arr1@2@01 i@27@01))
    (=
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) 6)))
      (and (img@29@01 r) (and (<= 0 (inv@28@01 r)) (< (inv@28@01 r) 6)))))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Assume upper permission bound for field int
; [eval] 3 + 8 == 38
; [eval] 3 + 8
(set-option :timeout 0)
(push) ; 6
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
