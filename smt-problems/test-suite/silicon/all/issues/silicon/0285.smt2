(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:11
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0285.vpr
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
(declare-fun first<Array> ($Ref) Array_)
(declare-fun second<Int> ($Ref) Int)
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
(assert (forall ((a Array_) (i Int)) (!
  (and (= (first<Array> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a Array_)) (!
  (>= (len<Int> a) 0)
  :pattern ((len<Int> a))
  :qid |prog.length_nonneg|)))
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
; ---------- havocArray ----------
(declare-const a@0@01 Array_)
(declare-const a@1@01 Array_)
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
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- havocInt ----------
(declare-const i@2@01 Int)
(declare-const i@3@01 Int)
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
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- setToArray ----------
(declare-const vals@4@01 Set<Int>)
(declare-const a@5@01 Array_)
(declare-const vals@6@01 Set<Int>)
(declare-const a@7@01 Array_)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] len(a) == |vals|
; [eval] len(a)
; [eval] |vals|
(assert (= (len<Int> a@7@01) (Set_card vals@6@01)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(declare-const i@9@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | !(0 <= i@9@01) | live]
; [else-branch: 0 | 0 <= i@9@01 | live]
(push) ; 5
; [then-branch: 0 | !(0 <= i@9@01)]
(assert (not (<= 0 i@9@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | 0 <= i@9@01]
(assert (<= 0 i@9@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
(assert (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@7@01))))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@10@01 ($Ref) Int)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@7@01)))
    (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
  :pattern ((loc<Ref> a@7@01 i@9@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@9@01) (< i1@9@01 (len<Int> a@7@01)))
      (and (<= 0 i2@9@01) (< i2@9@01 (len<Int> a@7@01)))
      (= (loc<Ref> a@7@01 i1@9@01) (loc<Ref> a@7@01 i2@9@01)))
    (= i1@9@01 i2@9@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@7@01)))
    (and
      (= (inv@10@01 (loc<Ref> a@7@01 i@9@01)) i@9@01)
      (img@11@01 (loc<Ref> a@7@01 i@9@01))))
  :pattern ((loc<Ref> a@7@01 i@9@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (len<Int> a@7@01))))
    (= (loc<Ref> a@7@01 (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@7@01)))
    (not (= (loc<Ref> a@7@01 i@9@01) $Ref.null)))
  :pattern ((loc<Ref> a@7@01 i@9@01))
  :qid |val-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@8@01)) $Snap.unit))
; [eval] (forall i: Int :: { (i in vals) } (i in vals) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < len(a) && loc(a, k).val == i)))
(declare-const i@12@01 Int)
(push) ; 3
; [eval] (i in vals) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < len(a) && loc(a, k).val == i))
; [eval] (i in vals)
(push) ; 4
; [then-branch: 1 | i@12@01 in vals@6@01 | live]
; [else-branch: 1 | !(i@12@01 in vals@6@01) | live]
(push) ; 5
; [then-branch: 1 | i@12@01 in vals@6@01]
(assert (Set_in i@12@01 vals@6@01))
; [eval] (exists k: Int :: { loc(a, k) } 0 <= k && (k < len(a) && loc(a, k).val == i))
(declare-const k@13@01 Int)
(push) ; 6
; [eval] 0 <= k && (k < len(a) && loc(a, k).val == i)
; [eval] 0 <= k
(push) ; 7
; [then-branch: 2 | !(0 <= k@13@01) | live]
; [else-branch: 2 | 0 <= k@13@01 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= k@13@01)]
(assert (not (<= 0 k@13@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= k@13@01]
(assert (<= 0 k@13@01))
; [eval] k < len(a)
; [eval] len(a)
(push) ; 9
; [then-branch: 3 | !(k@13@01 < len[Int](a@7@01)) | live]
; [else-branch: 3 | k@13@01 < len[Int](a@7@01) | live]
(push) ; 10
; [then-branch: 3 | !(k@13@01 < len[Int](a@7@01))]
(assert (not (< k@13@01 (len<Int> a@7@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | k@13@01 < len[Int](a@7@01)]
(assert (< k@13@01 (len<Int> a@7@01)))
; [eval] loc(a, k).val == i
; [eval] loc(a, k)
(push) ; 11
(assert (not (and
  (img@11@01 (loc<Ref> a@7@01 k@13@01))
  (and
    (<= 0 (inv@10@01 (loc<Ref> a@7@01 k@13@01)))
    (< (inv@10@01 (loc<Ref> a@7@01 k@13@01)) (len<Int> a@7@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@13@01 (len<Int> a@7@01)) (not (< k@13@01 (len<Int> a@7@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@13@01)
  (and
    (<= 0 k@13@01)
    (or (< k@13@01 (len<Int> a@7@01)) (not (< k@13@01 (len<Int> a@7@01)))))))
(assert (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((k@13@01 Int)) (!
  (and
    (=>
      (<= 0 k@13@01)
      (and
        (<= 0 k@13@01)
        (or (< k@13@01 (len<Int> a@7@01)) (not (< k@13@01 (len<Int> a@7@01))))))
    (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
  :pattern ((loc<Ref> a@7@01 k@13@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99-aux|)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(i@12@01 in vals@6@01)]
(assert (not (Set_in i@12@01 vals@6@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in i@12@01 vals@6@01)
  (and
    (Set_in i@12@01 vals@6@01)
    (exists ((k@13@01 Int)) (!
      (and
        (=>
          (<= 0 k@13@01)
          (and
            (<= 0 k@13@01)
            (or
              (< k@13@01 (len<Int> a@7@01))
              (not (< k@13@01 (len<Int> a@7@01))))))
        (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
      :pattern ((loc<Ref> a@7@01 k@13@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99-aux|)))))
; Joined path conditions
(assert (or (not (Set_in i@12@01 vals@6@01)) (Set_in i@12@01 vals@6@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@12@01 Int)) (!
  (and
    (=>
      (Set_in i@12@01 vals@6@01)
      (and
        (Set_in i@12@01 vals@6@01)
        (exists ((k@13@01 Int)) (!
          (and
            (=>
              (<= 0 k@13@01)
              (and
                (<= 0 k@13@01)
                (or
                  (< k@13@01 (len<Int> a@7@01))
                  (not (< k@13@01 (len<Int> a@7@01))))))
            (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
          :pattern ((loc<Ref> a@7@01 k@13@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99-aux|))))
    (or (not (Set_in i@12@01 vals@6@01)) (Set_in i@12@01 vals@6@01)))
  :pattern ((Set_in i@12@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@11@28@99-aux|)))
(assert (forall ((i@12@01 Int)) (!
  (=>
    (Set_in i@12@01 vals@6@01)
    (exists ((k@13@01 Int)) (!
      (and
        (<= 0 k@13@01)
        (and
          (< k@13@01 (len<Int> a@7@01))
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second $t@8@01))) (loc<Ref> a@7@01 k@13@01))
            i@12@01)))
      :pattern ((loc<Ref> a@7@01 k@13@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99|)))
  :pattern ((Set_in i@12@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@11@28@99|)))
(pop) ; 2
(push) ; 2
; [exec]
; var s: Set[Int]
(declare-const s@14@01 Set<Int>)
; [exec]
; var element: Int
(declare-const element@15@01 Int)
; [exec]
; var j: Int
(declare-const j@16@01 Int)
; [exec]
; a := havocArray()
(declare-const a@17@01 Array_)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale len(a) == |vals|
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 $Snap.unit))
; [eval] len(a) == |vals|
; [eval] len(a)
; [eval] |vals|
(assert (= (len<Int> a@17@01) (Set_card vals@6@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < len(a) ==> acc(loc(a, i).val, write))
(declare-const i@19@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 4 | !(0 <= i@19@01) | live]
; [else-branch: 4 | 0 <= i@19@01 | live]
(push) ; 5
; [then-branch: 4 | !(0 <= i@19@01)]
(assert (not (<= 0 i@19@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | 0 <= i@19@01]
(assert (<= 0 i@19@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
(assert (and (<= 0 i@19@01) (< i@19@01 (len<Int> a@17@01))))
; [eval] loc(a, i)
(pop) ; 3
(declare-const $t@20@01 $FVF<val>)
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 (len<Int> a@17@01)))
    (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
  :pattern ((loc<Ref> a@17@01 i@19@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@19@01 Int) (i2@19@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@19@01) (< i1@19@01 (len<Int> a@17@01)))
      (and (<= 0 i2@19@01) (< i2@19@01 (len<Int> a@17@01)))
      (= (loc<Ref> a@17@01 i1@19@01) (loc<Ref> a@17@01 i2@19@01)))
    (= i1@19@01 i2@19@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 (len<Int> a@17@01)))
    (and
      (= (inv@21@01 (loc<Ref> a@17@01 i@19@01)) i@19@01)
      (img@22@01 (loc<Ref> a@17@01 i@19@01))))
  :pattern ((loc<Ref> a@17@01 i@19@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@01 r)
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@17@01))))
    (= (loc<Ref> a@17@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 (len<Int> a@17@01)))
    (not (= (loc<Ref> a@17@01 i@19@01) $Ref.null)))
  :pattern ((loc<Ref> a@17@01 i@19@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; s := vals
; [exec]
; j := 0
(declare-const t@23@01 Set<Int>)
(declare-const element@24@01 Int)
(declare-const s@25@01 Set<Int>)
(declare-const j@26@01 Int)
(set-option :timeout 0)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@27@01 $Snap)
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(declare-const i@28@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 5 | !(0 <= i@28@01) | live]
; [else-branch: 5 | 0 <= i@28@01 | live]
(push) ; 6
; [then-branch: 5 | !(0 <= i@28@01)]
(assert (not (<= 0 i@28@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | 0 <= i@28@01]
(assert (<= 0 i@28@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@28@01) (not (<= 0 i@28@01))))
(assert (and (<= 0 i@28@01) (< i@28@01 (len<Int> a@17@01))))
; [eval] loc(a, i)
(pop) ; 4
(declare-fun inv@29@01 ($Ref) Int)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= 0 i@28@01) (< i@28@01 (len<Int> a@17@01)))
    (or (<= 0 i@28@01) (not (<= 0 i@28@01))))
  :pattern ((loc<Ref> a@17@01 i@28@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@28@01 Int) (i2@28@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@28@01) (< i1@28@01 (len<Int> a@17@01)))
      (and (<= 0 i2@28@01) (< i2@28@01 (len<Int> a@17@01)))
      (= (loc<Ref> a@17@01 i1@28@01) (loc<Ref> a@17@01 i2@28@01)))
    (= i1@28@01 i2@28@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= 0 i@28@01) (< i@28@01 (len<Int> a@17@01)))
    (and
      (= (inv@29@01 (loc<Ref> a@17@01 i@28@01)) i@28@01)
      (img@30@01 (loc<Ref> a@17@01 i@28@01))))
  :pattern ((loc<Ref> a@17@01 i@28@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
    (= (loc<Ref> a@17@01 (inv@29@01 r)) r))
  :pattern ((inv@29@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= 0 i@28@01) (< i@28@01 (len<Int> a@17@01)))
    (not (= (loc<Ref> a@17@01 i@28@01) $Ref.null)))
  :pattern ((loc<Ref> a@17@01 i@28@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(assert (= ($Snap.first ($Snap.second $t@27@01)) $Snap.unit))
; [eval] (s subset vals)
(assert (Set_subset s@25@01 vals@6@01))
(assert (=
  ($Snap.second ($Snap.second $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
; [eval] j == |(vals setminus s)|
; [eval] |(vals setminus s)|
; [eval] (vals setminus s)
(assert (= j@26@01 (Set_card (Set_difference vals@6@01 s@25@01))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
; [eval] (forall i: Int :: { (i in vals) } (i in (vals setminus s)) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i)))
(declare-const i@31@01 Int)
(push) ; 4
; [eval] (i in (vals setminus s)) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i))
; [eval] (i in (vals setminus s))
; [eval] (vals setminus s)
(push) ; 5
; [then-branch: 6 | i@31@01 in vals@6@01 \ s@25@01 | live]
; [else-branch: 6 | !(i@31@01 in vals@6@01 \ s@25@01) | live]
(push) ; 6
; [then-branch: 6 | i@31@01 in vals@6@01 \ s@25@01]
(assert (Set_in i@31@01 (Set_difference vals@6@01 s@25@01)))
; [eval] (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i))
(declare-const k@32@01 Int)
(push) ; 7
; [eval] 0 <= k && (k < j && loc(a, k).val == i)
; [eval] 0 <= k
(push) ; 8
; [then-branch: 7 | !(0 <= k@32@01) | live]
; [else-branch: 7 | 0 <= k@32@01 | live]
(push) ; 9
; [then-branch: 7 | !(0 <= k@32@01)]
(assert (not (<= 0 k@32@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 7 | 0 <= k@32@01]
(assert (<= 0 k@32@01))
; [eval] k < j
(push) ; 10
; [then-branch: 8 | !(k@32@01 < j@26@01) | live]
; [else-branch: 8 | k@32@01 < j@26@01 | live]
(push) ; 11
; [then-branch: 8 | !(k@32@01 < j@26@01)]
(assert (not (< k@32@01 j@26@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 8 | k@32@01 < j@26@01]
(assert (< k@32@01 j@26@01))
; [eval] loc(a, k).val == i
; [eval] loc(a, k)
(push) ; 12
(assert (not (and
  (img@30@01 (loc<Ref> a@17@01 k@32@01))
  (and
    (<= 0 (inv@29@01 (loc<Ref> a@17@01 k@32@01)))
    (< (inv@29@01 (loc<Ref> a@17@01 k@32@01)) (len<Int> a@17@01))))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@32@01 j@26@01) (not (< k@32@01 j@26@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@32@01)
  (and (<= 0 k@32@01) (or (< k@32@01 j@26@01) (not (< k@32@01 j@26@01))))))
(assert (or (<= 0 k@32@01) (not (<= 0 k@32@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((k@32@01 Int)) (!
  (and
    (=>
      (<= 0 k@32@01)
      (and (<= 0 k@32@01) (or (< k@32@01 j@26@01) (not (< k@32@01 j@26@01)))))
    (or (<= 0 k@32@01) (not (<= 0 k@32@01))))
  :pattern ((loc<Ref> a@17@01 k@32@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|)))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(i@31@01 in vals@6@01 \ s@25@01)]
(assert (not (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))
  (and
    (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))
    (exists ((k@32@01 Int)) (!
      (and
        (=>
          (<= 0 k@32@01)
          (and (<= 0 k@32@01) (or (< k@32@01 j@26@01) (not (< k@32@01 j@26@01)))))
        (or (<= 0 k@32@01) (not (<= 0 k@32@01))))
      :pattern ((loc<Ref> a@17@01 k@32@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|)))))
; Joined path conditions
(assert (or
  (not (Set_in i@31@01 (Set_difference vals@6@01 s@25@01)))
  (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))))
; [eval] (i in vals)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@31@01 Int)) (!
  (and
    (=>
      (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))
      (and
        (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))
        (exists ((k@32@01 Int)) (!
          (and
            (=>
              (<= 0 k@32@01)
              (and
                (<= 0 k@32@01)
                (or (< k@32@01 j@26@01) (not (< k@32@01 j@26@01)))))
            (or (<= 0 k@32@01) (not (<= 0 k@32@01))))
          :pattern ((loc<Ref> a@17@01 k@32@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|))))
    (or
      (not (Set_in i@31@01 (Set_difference vals@6@01 s@25@01)))
      (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))))
  :pattern ((Set_in i@31@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121-aux|)))
(assert (forall ((i@31@01 Int)) (!
  (=>
    (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))
    (exists ((k@32@01 Int)) (!
      (and
        (<= 0 k@32@01)
        (and
          (< k@32@01 j@26@01)
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) (loc<Ref> a@17@01 k@32@01))
            i@31@01)))
      :pattern ((loc<Ref> a@17@01 k@32@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121|)))
  :pattern ((Set_in i@31@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
(declare-const i@33@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 9 | !(0 <= i@33@01) | live]
; [else-branch: 9 | 0 <= i@33@01 | live]
(push) ; 6
; [then-branch: 9 | !(0 <= i@33@01)]
(assert (not (<= 0 i@33@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | 0 <= i@33@01]
(assert (<= 0 i@33@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
(assert (and (<= 0 i@33@01) (< i@33@01 (len<Int> a@17@01))))
; [eval] loc(a, i)
(pop) ; 4
(declare-fun inv@34@01 ($Ref) Int)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 (len<Int> a@17@01)))
    (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
  :pattern ((loc<Ref> a@17@01 i@33@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@33@01 Int) (i2@33@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@33@01) (< i1@33@01 (len<Int> a@17@01)))
      (and (<= 0 i2@33@01) (< i2@33@01 (len<Int> a@17@01)))
      (= (loc<Ref> a@17@01 i1@33@01) (loc<Ref> a@17@01 i2@33@01)))
    (= i1@33@01 i2@33@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 (len<Int> a@17@01)))
    (and
      (= (inv@34@01 (loc<Ref> a@17@01 i@33@01)) i@33@01)
      (img@35@01 (loc<Ref> a@17@01 i@33@01))))
  :pattern ((loc<Ref> a@17@01 i@33@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@01 r)
      (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) (len<Int> a@17@01))))
    (= (loc<Ref> a@17@01 (inv@34@01 r)) r))
  :pattern ((inv@34@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) (len<Int> a@17@01)))
      (img@35@01 r)
      (= r (loc<Ref> a@17@01 (inv@34@01 r))))
    ($Perm.min
      (ite
        (and
          (img@22@01 r)
          (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@17@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
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
        (and
          (img@22@01 r)
          (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@17@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@36@01 r))
    $Perm.No)
  
  :qid |quant-u-8|))))
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
      (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) (len<Int> a@17@01)))
      (img@35@01 r)
      (= r (loc<Ref> a@17@01 (inv@34@01 r))))
    (= (- $Perm.Write (pTaken@36@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@37@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@01 r)
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@17@01))))
    (= ($FVF.lookup_val (as sm@37@01  $FVF<val>) r) ($FVF.lookup_val $t@20@01 r)))
  :pattern (($FVF.lookup_val (as sm@37@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@20@01 r))
  :qid |qp.fvfValDef0|)))
; [eval] (s subset vals)
(set-option :timeout 0)
(push) ; 4
(assert (not (Set_subset vals@6@01 vals@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Set_subset vals@6@01 vals@6@01))
; [eval] j == |(vals setminus s)|
; [eval] |(vals setminus s)|
; [eval] (vals setminus s)
(push) ; 4
(assert (not (= 0 (Set_card (Set_difference vals@6@01 vals@6@01)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= 0 (Set_card (Set_difference vals@6@01 vals@6@01))))
; [eval] (forall i: Int :: { (i in vals) } (i in (vals setminus s)) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i)))
(declare-const i@38@01 Int)
(push) ; 4
; [eval] (i in (vals setminus s)) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i))
; [eval] (i in (vals setminus s))
; [eval] (vals setminus s)
(push) ; 5
; [then-branch: 10 | i@38@01 in vals@6@01 \ vals@6@01 | live]
; [else-branch: 10 | !(i@38@01 in vals@6@01 \ vals@6@01) | live]
(push) ; 6
; [then-branch: 10 | i@38@01 in vals@6@01 \ vals@6@01]
(assert (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01)))
; [eval] (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i))
(declare-const k@39@01 Int)
(push) ; 7
; [eval] 0 <= k && (k < j && loc(a, k).val == i)
; [eval] 0 <= k
(push) ; 8
; [then-branch: 11 | !(0 <= k@39@01) | live]
; [else-branch: 11 | 0 <= k@39@01 | live]
(push) ; 9
; [then-branch: 11 | !(0 <= k@39@01)]
(assert (not (<= 0 k@39@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 11 | 0 <= k@39@01]
(assert (<= 0 k@39@01))
; [eval] k < j
(push) ; 10
; [then-branch: 12 | !(k@39@01 < 0) | live]
; [else-branch: 12 | k@39@01 < 0 | live]
(push) ; 11
; [then-branch: 12 | !(k@39@01 < 0)]
(assert (not (< k@39@01 0)))
(pop) ; 11
(push) ; 11
; [else-branch: 12 | k@39@01 < 0]
(assert (< k@39@01 0))
; [eval] loc(a, k).val == i
; [eval] loc(a, k)
(push) ; 12
(assert (not (and
  (img@22@01 (loc<Ref> a@17@01 k@39@01))
  (and
    (<= 0 (inv@21@01 (loc<Ref> a@17@01 k@39@01)))
    (< (inv@21@01 (loc<Ref> a@17@01 k@39@01)) (len<Int> a@17@01))))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@39@01 0) (not (< k@39@01 0))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=> (<= 0 k@39@01) (and (<= 0 k@39@01) (or (< k@39@01 0) (not (< k@39@01 0))))))
(assert (or (<= 0 k@39@01) (not (<= 0 k@39@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((k@39@01 Int)) (!
  (and
    (=>
      (<= 0 k@39@01)
      (and (<= 0 k@39@01) (or (< k@39@01 0) (not (< k@39@01 0)))))
    (or (<= 0 k@39@01) (not (<= 0 k@39@01))))
  :pattern ((loc<Ref> a@17@01 k@39@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(i@38@01 in vals@6@01 \ vals@6@01)]
(assert (not (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))
  (and
    (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))
    (exists ((k@39@01 Int)) (!
      (and
        (=>
          (<= 0 k@39@01)
          (and (<= 0 k@39@01) (or (< k@39@01 0) (not (< k@39@01 0)))))
        (or (<= 0 k@39@01) (not (<= 0 k@39@01))))
      :pattern ((loc<Ref> a@17@01 k@39@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|)))))
; Joined path conditions
(assert (or
  (not (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01)))
  (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))))
; [eval] (i in vals)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@38@01 Int)) (!
  (and
    (=>
      (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))
      (and
        (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))
        (exists ((k@39@01 Int)) (!
          (and
            (=>
              (<= 0 k@39@01)
              (and (<= 0 k@39@01) (or (< k@39@01 0) (not (< k@39@01 0)))))
            (or (<= 0 k@39@01) (not (<= 0 k@39@01))))
          :pattern ((loc<Ref> a@17@01 k@39@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|))))
    (or
      (not (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01)))
      (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))))
  :pattern ((Set_in i@38@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121-aux|)))
(push) ; 4
(assert (not (forall ((i@38@01 Int)) (!
  (=>
    (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))
    (exists ((k@39@01 Int)) (!
      (and
        (<= 0 k@39@01)
        (and
          (< k@39@01 0)
          (=
            ($FVF.lookup_val (as sm@37@01  $FVF<val>) (loc<Ref> a@17@01 k@39@01))
            i@38@01)))
      :pattern ((loc<Ref> a@17@01 k@39@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121|)))
  :pattern ((Set_in i@38@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@38@01 Int)) (!
  (=>
    (Set_in i@38@01 (Set_difference vals@6@01 vals@6@01))
    (exists ((k@39@01 Int)) (!
      (and
        (<= 0 k@39@01)
        (and
          (< k@39@01 0)
          (=
            ($FVF.lookup_val (as sm@37@01  $FVF<val>) (loc<Ref> a@17@01 k@39@01))
            i@38@01)))
      :pattern ((loc<Ref> a@17@01 k@39@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121|)))
  :pattern ((Set_in i@38@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
    (= (loc<Ref> a@17@01 (inv@29@01 r)) r))
  :pattern ((inv@29@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= 0 i@28@01) (< i@28@01 (len<Int> a@17@01)))
    (and
      (= (inv@29@01 (loc<Ref> a@17@01 i@28@01)) i@28@01)
      (img@30@01 (loc<Ref> a@17@01 i@28@01))))
  :pattern ((loc<Ref> a@17@01 i@28@01))
  :qid |quant-u-5|)))
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= 0 i@28@01) (< i@28@01 (len<Int> a@17@01)))
    (not (= (loc<Ref> a@17@01 i@28@01) $Ref.null)))
  :pattern ((loc<Ref> a@17@01 i@28@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@27@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@27@01))
    ($Snap.second ($Snap.second $t@27@01)))))
(assert (= ($Snap.first ($Snap.second $t@27@01)) $Snap.unit))
(assert (Set_subset s@25@01 vals@6@01))
(assert (=
  ($Snap.second ($Snap.second $t@27@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@27@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@27@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
(assert (= j@26@01 (Set_card (Set_difference vals@6@01 s@25@01))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@27@01))) $Snap.unit))
(assert (forall ((i@31@01 Int)) (!
  (and
    (=>
      (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))
      (and
        (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))
        (exists ((k@32@01 Int)) (!
          (and
            (=>
              (<= 0 k@32@01)
              (and
                (<= 0 k@32@01)
                (or (< k@32@01 j@26@01) (not (< k@32@01 j@26@01)))))
            (or (<= 0 k@32@01) (not (<= 0 k@32@01))))
          :pattern ((loc<Ref> a@17@01 k@32@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|))))
    (or
      (not (Set_in i@31@01 (Set_difference vals@6@01 s@25@01)))
      (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))))
  :pattern ((Set_in i@31@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121-aux|)))
(assert (forall ((i@31@01 Int)) (!
  (=>
    (Set_in i@31@01 (Set_difference vals@6@01 s@25@01))
    (exists ((k@32@01 Int)) (!
      (and
        (<= 0 k@32@01)
        (and
          (< k@32@01 j@26@01)
          (=
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) (loc<Ref> a@17@01 k@32@01))
            i@31@01)))
      :pattern ((loc<Ref> a@17@01 k@32@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121|)))
  :pattern ((Set_in i@31@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121|)))
(assert (= $t@27@01 ($Snap.combine ($Snap.first $t@27@01) ($Snap.second $t@27@01))))
(assert (forall ((i@28@01 Int)) (!
  (=>
    (and (<= 0 i@28@01) (< i@28@01 (len<Int> a@17@01)))
    (or (<= 0 i@28@01) (not (<= 0 i@28@01))))
  :pattern ((loc<Ref> a@17@01 i@28@01))
  :qid |val-aux|)))
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
; [eval] |s| > 0
; [eval] |s|
(pop) ; 5
(push) ; 5
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] |s| > 0
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (Set_card s@25@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> (Set_card s@25@01) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | |s@25@01| > 0 | live]
; [else-branch: 13 | !(|s@25@01| > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 13 | |s@25@01| > 0]
(assert (> (Set_card s@25@01) 0))
; [exec]
; var t: Set[Int]
(declare-const t@40@01 Set<Int>)
; [exec]
; t := s
; [exec]
; element := havocInt()
(declare-const i@41@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale (element in s)
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [eval] (element in s)
(assert (Set_in i@41@01 s@25@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; loc(a, j).val := element
; [eval] loc(a, j)
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@17@01 j@26@01))
    ($Perm.min
      (ite
        (and
          (img@30@01 r)
          (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@30@01 r)
          (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@43@01 r))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@43@01 r) $Perm.No)
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@17@01 j@26@01))
    (= (- $Perm.Write (pTaken@43@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@44@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@44@01  $FVF<val>) (loc<Ref> a@17@01 j@26@01)) i@41@01))
; [exec]
; s := (s setminus Set(element))
; [eval] (s setminus Set(element))
; [eval] Set(element)
(declare-const s@45@01 Set<Int>)
(assert (= s@45@01 (Set_difference s@25@01 (Set_singleton i@41@01))))
; [exec]
; j := j + 1
; [eval] j + 1
(declare-const j@46@01 Int)
(assert (= j@46@01 (+ j@26@01 1)))
; Loop head block: Re-establish invariant
(declare-const i@47@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 14 | !(0 <= i@47@01) | live]
; [else-branch: 14 | 0 <= i@47@01 | live]
(push) ; 8
; [then-branch: 14 | !(0 <= i@47@01)]
(assert (not (<= 0 i@47@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 14 | 0 <= i@47@01]
(assert (<= 0 i@47@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@47@01) (not (<= 0 i@47@01))))
(assert (and (<= 0 i@47@01) (< i@47@01 (len<Int> a@17@01))))
; [eval] loc(a, i)
(pop) ; 6
(declare-fun inv@48@01 ($Ref) Int)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and (<= 0 i@47@01) (< i@47@01 (len<Int> a@17@01)))
    (or (<= 0 i@47@01) (not (<= 0 i@47@01))))
  :pattern ((loc<Ref> a@17@01 i@47@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@47@01 Int) (i2@47@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@47@01) (< i1@47@01 (len<Int> a@17@01)))
      (and (<= 0 i2@47@01) (< i2@47@01 (len<Int> a@17@01)))
      (= (loc<Ref> a@17@01 i1@47@01) (loc<Ref> a@17@01 i2@47@01)))
    (= i1@47@01 i2@47@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and (<= 0 i@47@01) (< i@47@01 (len<Int> a@17@01)))
    (and
      (= (inv@48@01 (loc<Ref> a@17@01 i@47@01)) i@47@01)
      (img@49@01 (loc<Ref> a@17@01 i@47@01))))
  :pattern ((loc<Ref> a@17@01 i@47@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@49@01 r)
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) (len<Int> a@17@01))))
    (= (loc<Ref> a@17@01 (inv@48@01 r)) r))
  :pattern ((inv@48@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) (len<Int> a@17@01)))
      (img@49@01 r)
      (= r (loc<Ref> a@17@01 (inv@48@01 r))))
    ($Perm.min
      (ite
        (and
          (img@30@01 r)
          (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
        (- $Perm.Write (pTaken@43@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) (len<Int> a@17@01)))
      (img@49@01 r)
      (= r (loc<Ref> a@17@01 (inv@48@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@17@01 j@26@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@50@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@30@01 r)
          (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
        (- $Perm.Write (pTaken@43@01 r))
        $Perm.No)
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-16|))))
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
  (=>
    (and
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) (len<Int> a@17@01)))
      (img@49@01 r)
      (= r (loc<Ref> a@17@01 (inv@48@01 r))))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@17@01 j@26@01) (loc<Ref> a@17@01 j@26@01))
      $Perm.Write
      $Perm.No)
    (pTaken@51@01 (loc<Ref> a@17@01 j@26@01)))
  $Perm.No)))
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
  (=>
    (and
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) (len<Int> a@17@01)))
      (img@49@01 r)
      (= r (loc<Ref> a@17@01 (inv@48@01 r))))
    (= (- (- $Perm.Write (pTaken@50@01 r)) (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@17@01 j@26@01))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@30@01 r)
        (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
      (< $Perm.No (- $Perm.Write (pTaken@43@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r))
  :qid |qp.fvfValDef2|)))
; [eval] (s subset vals)
(set-option :timeout 0)
(push) ; 6
(assert (not (Set_subset s@45@01 vals@6@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (Set_subset s@45@01 vals@6@01))
; [eval] j == |(vals setminus s)|
; [eval] |(vals setminus s)|
; [eval] (vals setminus s)
(push) ; 6
(assert (not (= j@46@01 (Set_card (Set_difference vals@6@01 s@45@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= j@46@01 (Set_card (Set_difference vals@6@01 s@45@01))))
; [eval] (forall i: Int :: { (i in vals) } (i in (vals setminus s)) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i)))
(declare-const i@53@01 Int)
(push) ; 6
; [eval] (i in (vals setminus s)) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i))
; [eval] (i in (vals setminus s))
; [eval] (vals setminus s)
(push) ; 7
; [then-branch: 15 | i@53@01 in vals@6@01 \ s@45@01 | live]
; [else-branch: 15 | !(i@53@01 in vals@6@01 \ s@45@01) | live]
(push) ; 8
; [then-branch: 15 | i@53@01 in vals@6@01 \ s@45@01]
(assert (Set_in i@53@01 (Set_difference vals@6@01 s@45@01)))
; [eval] (exists k: Int :: { loc(a, k) } 0 <= k && (k < j && loc(a, k).val == i))
(declare-const k@54@01 Int)
(push) ; 9
; [eval] 0 <= k && (k < j && loc(a, k).val == i)
; [eval] 0 <= k
(push) ; 10
; [then-branch: 16 | !(0 <= k@54@01) | live]
; [else-branch: 16 | 0 <= k@54@01 | live]
(push) ; 11
; [then-branch: 16 | !(0 <= k@54@01)]
(assert (not (<= 0 k@54@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 16 | 0 <= k@54@01]
(assert (<= 0 k@54@01))
; [eval] k < j
(push) ; 12
; [then-branch: 17 | !(k@54@01 < j@46@01) | live]
; [else-branch: 17 | k@54@01 < j@46@01 | live]
(push) ; 13
; [then-branch: 17 | !(k@54@01 < j@46@01)]
(assert (not (< k@54@01 j@46@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 17 | k@54@01 < j@46@01]
(assert (< k@54@01 j@46@01))
; [eval] loc(a, k).val == i
; [eval] loc(a, k)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (loc<Ref> a@17@01 j@26@01))
      (=
        ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@30@01 r)
          (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
        (< $Perm.No (- $Perm.Write (pTaken@43@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r)))
    :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r))
    :qid |qp.fvfValDef2|))))
(push) ; 14
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (loc<Ref> a@17@01 k@54@01) (loc<Ref> a@17@01 j@26@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@30@01 (loc<Ref> a@17@01 k@54@01))
        (and
          (<= 0 (inv@29@01 (loc<Ref> a@17@01 k@54@01)))
          (< (inv@29@01 (loc<Ref> a@17@01 k@54@01)) (len<Int> a@17@01))))
      (- $Perm.Write (pTaken@43@01 (loc<Ref> a@17@01 k@54@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@17@01 j@26@01))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@30@01 r)
        (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
      (< $Perm.No (- $Perm.Write (pTaken@43@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (or (< k@54@01 j@46@01) (not (< k@54@01 j@46@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@17@01 j@26@01))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@30@01 r)
        (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
      (< $Perm.No (- $Perm.Write (pTaken@43@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (<= 0 k@54@01)
  (and (<= 0 k@54@01) (or (< k@54@01 j@46@01) (not (< k@54@01 j@46@01))))))
(assert (or (<= 0 k@54@01) (not (<= 0 k@54@01))))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@17@01 j@26@01))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@30@01 r)
        (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
      (< $Perm.No (- $Perm.Write (pTaken@43@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((k@54@01 Int)) (!
  (and
    (=>
      (<= 0 k@54@01)
      (and (<= 0 k@54@01) (or (< k@54@01 j@46@01) (not (< k@54@01 j@46@01)))))
    (or (<= 0 k@54@01) (not (<= 0 k@54@01))))
  :pattern ((loc<Ref> a@17@01 k@54@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|)))
(pop) ; 8
(push) ; 8
; [else-branch: 15 | !(i@53@01 in vals@6@01 \ s@45@01)]
(assert (not (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@17@01 j@26@01))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@30@01 r)
        (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
      (< $Perm.No (- $Perm.Write (pTaken@43@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))
  (and
    (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))
    (exists ((k@54@01 Int)) (!
      (and
        (=>
          (<= 0 k@54@01)
          (and (<= 0 k@54@01) (or (< k@54@01 j@46@01) (not (< k@54@01 j@46@01)))))
        (or (<= 0 k@54@01) (not (<= 0 k@54@01))))
      :pattern ((loc<Ref> a@17@01 k@54@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|)))))
; Joined path conditions
(assert (or
  (not (Set_in i@53@01 (Set_difference vals@6@01 s@45@01)))
  (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))))
; [eval] (i in vals)
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@17@01 j@26@01))
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@44@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@44@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@30@01 r)
        (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
      (< $Perm.No (- $Perm.Write (pTaken@43@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@52@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r)))
  :pattern (($FVF.lookup_val (as sm@52@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@53@01 Int)) (!
  (and
    (=>
      (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))
      (and
        (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))
        (exists ((k@54@01 Int)) (!
          (and
            (=>
              (<= 0 k@54@01)
              (and
                (<= 0 k@54@01)
                (or (< k@54@01 j@46@01) (not (< k@54@01 j@46@01)))))
            (or (<= 0 k@54@01) (not (<= 0 k@54@01))))
          :pattern ((loc<Ref> a@17@01 k@54@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121-aux|))))
    (or
      (not (Set_in i@53@01 (Set_difference vals@6@01 s@45@01)))
      (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))))
  :pattern ((Set_in i@53@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121-aux|)))
(push) ; 6
(assert (not (forall ((i@53@01 Int)) (!
  (=>
    (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))
    (exists ((k@54@01 Int)) (!
      (and
        (<= 0 k@54@01)
        (and
          (< k@54@01 j@46@01)
          (=
            ($FVF.lookup_val (as sm@52@01  $FVF<val>) (loc<Ref> a@17@01 k@54@01))
            i@53@01)))
      :pattern ((loc<Ref> a@17@01 k@54@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121|)))
  :pattern ((Set_in i@53@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@53@01 Int)) (!
  (=>
    (Set_in i@53@01 (Set_difference vals@6@01 s@45@01))
    (exists ((k@54@01 Int)) (!
      (and
        (<= 0 k@54@01)
        (and
          (< k@54@01 j@46@01)
          (=
            ($FVF.lookup_val (as sm@52@01  $FVF<val>) (loc<Ref> a@17@01 k@54@01))
            i@53@01)))
      :pattern ((loc<Ref> a@17@01 k@54@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@68@42@121|)))
  :pattern ((Set_in i@53@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@42@13@42@121|)))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(|s@25@01| > 0)]
(assert (not (> (Set_card s@25@01) 0)))
(pop) ; 5
; [eval] !(|s| > 0)
; [eval] |s| > 0
; [eval] |s|
(push) ; 5
(set-option :timeout 10)
(assert (not (> (Set_card s@25@01) 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> (Set_card s@25@01) 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | !(|s@25@01| > 0) | live]
; [else-branch: 18 | |s@25@01| > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | !(|s@25@01| > 0)]
(assert (not (> (Set_card s@25@01) 0)))
; [eval] len(a) == |vals|
; [eval] len(a)
; [eval] |vals|
(declare-const i@55@01 Int)
(push) ; 6
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 19 | !(0 <= i@55@01) | live]
; [else-branch: 19 | 0 <= i@55@01 | live]
(push) ; 8
; [then-branch: 19 | !(0 <= i@55@01)]
(assert (not (<= 0 i@55@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | 0 <= i@55@01]
(assert (<= 0 i@55@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@55@01) (not (<= 0 i@55@01))))
(assert (and (<= 0 i@55@01) (< i@55@01 (len<Int> a@17@01))))
; [eval] loc(a, i)
(pop) ; 6
(declare-fun inv@56@01 ($Ref) Int)
(declare-fun img@57@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@55@01 Int)) (!
  (=>
    (and (<= 0 i@55@01) (< i@55@01 (len<Int> a@17@01)))
    (or (<= 0 i@55@01) (not (<= 0 i@55@01))))
  :pattern ((loc<Ref> a@17@01 i@55@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@55@01 Int) (i2@55@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@55@01) (< i1@55@01 (len<Int> a@17@01)))
      (and (<= 0 i2@55@01) (< i2@55@01 (len<Int> a@17@01)))
      (= (loc<Ref> a@17@01 i1@55@01) (loc<Ref> a@17@01 i2@55@01)))
    (= i1@55@01 i2@55@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@55@01 Int)) (!
  (=>
    (and (<= 0 i@55@01) (< i@55@01 (len<Int> a@17@01)))
    (and
      (= (inv@56@01 (loc<Ref> a@17@01 i@55@01)) i@55@01)
      (img@57@01 (loc<Ref> a@17@01 i@55@01))))
  :pattern ((loc<Ref> a@17@01 i@55@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@57@01 r)
      (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) (len<Int> a@17@01))))
    (= (loc<Ref> a@17@01 (inv@56@01 r)) r))
  :pattern ((inv@56@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) (len<Int> a@17@01)))
      (img@57@01 r)
      (= r (loc<Ref> a@17@01 (inv@56@01 r))))
    ($Perm.min
      (ite
        (and
          (img@30@01 r)
          (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@30@01 r)
          (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@58@01 r))
    $Perm.No)
  
  :qid |quant-u-22|))))
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
  (=>
    (and
      (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) (len<Int> a@17@01)))
      (img@57@01 r)
      (= r (loc<Ref> a@17@01 (inv@56@01 r))))
    (= (- $Perm.Write (pTaken@58@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@59@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@17@01))))
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@27@01)) r))
  :qid |qp.fvfValDef3|)))
; [eval] (forall i: Int :: { (i in vals) } (i in vals) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < len(a) && loc(a, k).val == i)))
(declare-const i@60@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i in vals) ==> (exists k: Int :: { loc(a, k) } 0 <= k && (k < len(a) && loc(a, k).val == i))
; [eval] (i in vals)
(push) ; 7
; [then-branch: 20 | i@60@01 in vals@6@01 | live]
; [else-branch: 20 | !(i@60@01 in vals@6@01) | live]
(push) ; 8
; [then-branch: 20 | i@60@01 in vals@6@01]
(assert (Set_in i@60@01 vals@6@01))
; [eval] (exists k: Int :: { loc(a, k) } 0 <= k && (k < len(a) && loc(a, k).val == i))
(declare-const k@61@01 Int)
(push) ; 9
; [eval] 0 <= k && (k < len(a) && loc(a, k).val == i)
; [eval] 0 <= k
(push) ; 10
; [then-branch: 21 | !(0 <= k@61@01) | live]
; [else-branch: 21 | 0 <= k@61@01 | live]
(push) ; 11
; [then-branch: 21 | !(0 <= k@61@01)]
(assert (not (<= 0 k@61@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 21 | 0 <= k@61@01]
(assert (<= 0 k@61@01))
; [eval] k < len(a)
; [eval] len(a)
(push) ; 12
; [then-branch: 22 | !(k@61@01 < len[Int](a@17@01)) | live]
; [else-branch: 22 | k@61@01 < len[Int](a@17@01) | live]
(push) ; 13
; [then-branch: 22 | !(k@61@01 < len[Int](a@17@01))]
(assert (not (< k@61@01 (len<Int> a@17@01))))
(pop) ; 13
(push) ; 13
; [else-branch: 22 | k@61@01 < len[Int](a@17@01)]
(assert (< k@61@01 (len<Int> a@17@01)))
; [eval] loc(a, k).val == i
; [eval] loc(a, k)
(push) ; 14
(assert (not (and
  (img@30@01 (loc<Ref> a@17@01 k@61@01))
  (and
    (<= 0 (inv@29@01 (loc<Ref> a@17@01 k@61@01)))
    (< (inv@29@01 (loc<Ref> a@17@01 k@61@01)) (len<Int> a@17@01))))))
(check-sat)
; unsat
(pop) ; 14
; 0,00s
; (get-info :all-statistics)
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (< k@61@01 (len<Int> a@17@01)) (not (< k@61@01 (len<Int> a@17@01)))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@61@01)
  (and
    (<= 0 k@61@01)
    (or (< k@61@01 (len<Int> a@17@01)) (not (< k@61@01 (len<Int> a@17@01)))))))
(assert (or (<= 0 k@61@01) (not (<= 0 k@61@01))))
(pop) ; 9
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((k@61@01 Int)) (!
  (and
    (=>
      (<= 0 k@61@01)
      (and
        (<= 0 k@61@01)
        (or (< k@61@01 (len<Int> a@17@01)) (not (< k@61@01 (len<Int> a@17@01))))))
    (or (<= 0 k@61@01) (not (<= 0 k@61@01))))
  :pattern ((loc<Ref> a@17@01 k@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99-aux|)))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | !(i@60@01 in vals@6@01)]
(assert (not (Set_in i@60@01 vals@6@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (Set_in i@60@01 vals@6@01)
  (and
    (Set_in i@60@01 vals@6@01)
    (exists ((k@61@01 Int)) (!
      (and
        (=>
          (<= 0 k@61@01)
          (and
            (<= 0 k@61@01)
            (or
              (< k@61@01 (len<Int> a@17@01))
              (not (< k@61@01 (len<Int> a@17@01))))))
        (or (<= 0 k@61@01) (not (<= 0 k@61@01))))
      :pattern ((loc<Ref> a@17@01 k@61@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99-aux|)))))
; Joined path conditions
(assert (or (not (Set_in i@60@01 vals@6@01)) (Set_in i@60@01 vals@6@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@60@01 Int)) (!
  (and
    (=>
      (Set_in i@60@01 vals@6@01)
      (and
        (Set_in i@60@01 vals@6@01)
        (exists ((k@61@01 Int)) (!
          (and
            (=>
              (<= 0 k@61@01)
              (and
                (<= 0 k@61@01)
                (or
                  (< k@61@01 (len<Int> a@17@01))
                  (not (< k@61@01 (len<Int> a@17@01))))))
            (or (<= 0 k@61@01) (not (<= 0 k@61@01))))
          :pattern ((loc<Ref> a@17@01 k@61@01))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99-aux|))))
    (or (not (Set_in i@60@01 vals@6@01)) (Set_in i@60@01 vals@6@01)))
  :pattern ((Set_in i@60@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@11@28@99-aux|)))
(push) ; 6
(assert (not (forall ((i@60@01 Int)) (!
  (=>
    (Set_in i@60@01 vals@6@01)
    (exists ((k@61@01 Int)) (!
      (and
        (<= 0 k@61@01)
        (and
          (< k@61@01 (len<Int> a@17@01))
          (=
            ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@17@01 k@61@01))
            i@60@01)))
      :pattern ((loc<Ref> a@17@01 k@61@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99|)))
  :pattern ((Set_in i@60@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@11@28@99|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@60@01 Int)) (!
  (=>
    (Set_in i@60@01 vals@6@01)
    (exists ((k@61@01 Int)) (!
      (and
        (<= 0 k@61@01)
        (and
          (< k@61@01 (len<Int> a@17@01))
          (=
            ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@17@01 k@61@01))
            i@60@01)))
      :pattern ((loc<Ref> a@17@01 k@61@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@41@28@99|)))
  :pattern ((Set_in i@60@01 vals@6@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0285.vpr@28@11@28@99|)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | |s@25@01| > 0]
(assert (> (Set_card s@25@01) 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
