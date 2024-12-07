(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0236.vpr
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
(declare-fun array%trigger ($Snap Array_) Bool)
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
  :qid |prog.injectivity|)))
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
; ---------- test ----------
(declare-const a@0@01 Array_)
(declare-const a@1@01 Array_)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $FVF<val>)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 ($Snap.combine ($Snap.first $t@3@01) ($Snap.second $t@3@01))))
(assert (= ($Snap.second $t@3@01) $Snap.unit))
; [eval] (unfolding acc(array(a), write) in (forall i: Int :: { loc(a, i).val } 0 <= i && i < len(a) ==> loc(a, i).val == i))
(push) ; 3
(assert (array%trigger ($Snap.first $t@3@01) a@1@01))
(declare-const i@4@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 0 | !(0 <= i@4@01) | live]
; [else-branch: 0 | 0 <= i@4@01 | live]
(push) ; 6
; [then-branch: 0 | !(0 <= i@4@01)]
(assert (not (<= 0 i@4@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 0 | 0 <= i@4@01]
(assert (<= 0 i@4@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@4@01) (not (<= 0 i@4@01))))
(assert (and (<= 0 i@4@01) (< i@4@01 (len<Int> a@1@01))))
; [eval] loc(a, i)
(declare-const sm@5@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 4
(declare-fun inv@6@01 ($Ref) Int)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@4@01 Int)) (!
  (=>
    (and (<= 0 i@4@01) (< i@4@01 (len<Int> a@1@01)))
    (or (<= 0 i@4@01) (not (<= 0 i@4@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) (loc<Ref> a@1@01 i@4@01)) (loc<Ref> a@1@01 i@4@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@4@01 Int) (i2@4@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@4@01) (< i1@4@01 (len<Int> a@1@01)))
      (and (<= 0 i2@4@01) (< i2@4@01 (len<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i1@4@01) (loc<Ref> a@1@01 i2@4@01)))
    (= i1@4@01 i2@4@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@4@01 Int)) (!
  (=>
    (and (<= 0 i@4@01) (< i@4@01 (len<Int> a@1@01)))
    (and
      (= (inv@6@01 (loc<Ref> a@1@01 i@4@01)) i@4@01)
      (img@7@01 (loc<Ref> a@1@01 i@4@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) (loc<Ref> a@1@01 i@4@01)) (loc<Ref> a@1@01 i@4@01)))
  :qid |quant-u-4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@6@01 r)) r))
  :pattern ((inv@6@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@4@01 Int)) (!
  (=>
    (and (<= 0 i@4@01) (< i@4@01 (len<Int> a@1@01)))
    (not (= (loc<Ref> a@1@01 i@4@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) (loc<Ref> a@1@01 i@4@01)) (loc<Ref> a@1@01 i@4@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@8@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01))))
    (=
      ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r)))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r))
  :pattern ((inv@6@01 r))
  :qid |quant-u-5|)))
; [eval] (forall i: Int :: { loc(a, i).val } 0 <= i && i < len(a) ==> loc(a, i).val == i)
(declare-const i@9@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(a) ==> loc(a, i).val == i
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 1 | !(0 <= i@9@01) | live]
; [else-branch: 1 | 0 <= i@9@01 | live]
(push) ; 6
; [then-branch: 1 | !(0 <= i@9@01)]
(assert (not (<= 0 i@9@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | 0 <= i@9@01]
(assert (<= 0 i@9@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
(push) ; 5
; [then-branch: 2 | 0 <= i@9@01 && i@9@01 < len[Int](a@1@01) | live]
; [else-branch: 2 | !(0 <= i@9@01 && i@9@01 < len[Int](a@1@01)) | live]
(push) ; 6
; [then-branch: 2 | 0 <= i@9@01 && i@9@01 < len[Int](a@1@01)]
(assert (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01))))
; [eval] loc(a, i).val == i
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@7@01 r)
        (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01))))
      (=
        ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r)))
    :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) (loc<Ref> a@1@01 i@9@01)) (loc<Ref> a@1@01 i@9@01)))
(push) ; 7
(assert (not (and
  (img@7@01 (loc<Ref> a@1@01 i@9@01))
  (and
    (<= 0 (inv@6@01 (loc<Ref> a@1@01 i@9@01)))
    (< (inv@6@01 (loc<Ref> a@1@01 i@9@01)) (len<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 2 | !(0 <= i@9@01 && i@9@01 < len[Int](a@1@01))]
(assert (not (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01))))
    (=
      ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r)))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01)))
  (and
    (<= 0 i@9@01)
    (< i@9@01 (len<Int> a@1@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) (loc<Ref> a@1@01 i@9@01)) (loc<Ref> a@1@01 i@9@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01))))
  (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01)))))
; Definitional axioms for snapshot map values
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01))))
    (=
      ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r)))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@01 Int)) (!
  (and
    (or (<= 0 i@9@01) (not (<= 0 i@9@01)))
    (=>
      (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01)))
      (and
        (<= 0 i@9@01)
        (< i@9@01 (len<Int> a@1@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) (loc<Ref> a@1@01 i@9@01)) (loc<Ref> a@1@01 i@9@01))))
    (or
      (not (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01))))
      (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01)))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) (loc<Ref> a@1@01 i@9@01)) (loc<Ref> a@1@01 i@9@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0236.vpr@33@35@33@111-aux|)))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@6@01 r)) r))
  :pattern ((inv@6@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01))))
    (=
      ($FVF.lookup_val (as sm@8@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r)))
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@8@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (and
  (array%trigger ($Snap.first $t@3@01) a@1@01)
  (forall ((i@4@01 Int)) (!
    (=>
      (and (<= 0 i@4@01) (< i@4@01 (len<Int> a@1@01)))
      (or (<= 0 i@4@01) (not (<= 0 i@4@01))))
    :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) (loc<Ref> a@1@01 i@4@01)) (loc<Ref> a@1@01 i@4@01)))
    :qid |val-aux|))))
(assert (and
  (forall ((i@4@01 Int)) (!
    (=>
      (and (<= 0 i@4@01) (< i@4@01 (len<Int> a@1@01)))
      (and
        (= (inv@6@01 (loc<Ref> a@1@01 i@4@01)) i@4@01)
        (img@7@01 (loc<Ref> a@1@01 i@4@01))))
    :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) (loc<Ref> a@1@01 i@4@01)) (loc<Ref> a@1@01 i@4@01)))
    :qid |quant-u-4|))
  (forall ((i@4@01 Int)) (!
    (=>
      (and (<= 0 i@4@01) (< i@4@01 (len<Int> a@1@01)))
      (not (= (loc<Ref> a@1@01 i@4@01) $Ref.null)))
    :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@3@01)) (loc<Ref> a@1@01 i@4@01)) (loc<Ref> a@1@01 i@4@01)))
    :qid |val-permImpliesNonNull|))
  (forall ((r $Ref)) (!
    (=>
      (and (<= 0 (inv@6@01 r)) (< (inv@6@01 r) (len<Int> a@1@01)))
      ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) r) r))
    :pattern ((inv@6@01 r))
    :qid |quant-u-5|))
  (forall ((i@9@01 Int)) (!
    (and
      (or (<= 0 i@9@01) (not (<= 0 i@9@01)))
      (=>
        (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01)))
        (and
          (<= 0 i@9@01)
          (< i@9@01 (len<Int> a@1@01))
          ($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) (loc<Ref> a@1@01 i@9@01)) (loc<Ref> a@1@01 i@9@01))))
      (or
        (not (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01))))
        (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01)))))
    :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) (loc<Ref> a@1@01 i@9@01)) (loc<Ref> a@1@01 i@9@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0236.vpr@33@35@33@111-aux|))))
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (len<Int> a@1@01)))
    (= ($FVF.lookup_val (as sm@8@01  $FVF<val>) (loc<Ref> a@1@01 i@9@01)) i@9@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@8@01  $FVF<val>) (loc<Ref> a@1@01 i@9@01)) (loc<Ref> a@1@01 i@9@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0236.vpr@33@35@33@111|)))
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@10@01 Int)
; [exec]
; i := 0
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@11@01 $FVF<val>)
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
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
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 5
(push) ; 5
; [eval] !(i < len(a))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < len(a)
; [eval] len(a)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 (len<Int> a@1@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< 0 (len<Int> a@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | 0 < len[Int](a@1@01) | live]
; [else-branch: 3 | !(0 < len[Int](a@1@01)) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | 0 < len[Int](a@1@01)]
(assert (< 0 (len<Int> a@1@01)))
; [exec]
; unfold acc(array(a), write)
(declare-const i@12@01 Int)
(push) ; 6
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 4 | !(0 <= i@12@01) | live]
; [else-branch: 4 | 0 <= i@12@01 | live]
(push) ; 8
; [then-branch: 4 | !(0 <= i@12@01)]
(assert (not (<= 0 i@12@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 4 | 0 <= i@12@01]
(assert (<= 0 i@12@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@12@01) (not (<= 0 i@12@01))))
(assert (and (<= 0 i@12@01) (< i@12@01 (len<Int> a@1@01))))
; [eval] loc(a, i)
(declare-const sm@13@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 6
(declare-fun inv@14@01 ($Ref) Int)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (<= 0 i@12@01) (< i@12@01 (len<Int> a@1@01)))
    (or (<= 0 i@12@01) (not (<= 0 i@12@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@12@01)) (loc<Ref> a@1@01 i@12@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@12@01 Int) (i2@12@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@12@01) (< i1@12@01 (len<Int> a@1@01)))
      (and (<= 0 i2@12@01) (< i2@12@01 (len<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i1@12@01) (loc<Ref> a@1@01 i2@12@01)))
    (= i1@12@01 i2@12@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (<= 0 i@12@01) (< i@12@01 (len<Int> a@1@01)))
    (and
      (= (inv@14@01 (loc<Ref> a@1@01 i@12@01)) i@12@01)
      (img@15@01 (loc<Ref> a@1@01 i@12@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@12@01)) (loc<Ref> a@1@01 i@12@01)))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (<= 0 i@12@01) (< i@12@01 (len<Int> a@1@01)))
    (not (= (loc<Ref> a@1@01 i@12@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@12@01)) (loc<Ref> a@1@01 i@12@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@16@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
    (= ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r)
  :pattern (($FVF.lookup_val (as sm@16@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) r) r))
  :pattern ((inv@14@01 r))
  :qid |quant-u-8|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap $t@11@01) a@1@01))
; [exec]
; loc(a, i).val := i
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@16@01  $FVF<val>) (loc<Ref> a@1@01 0)) (loc<Ref> a@1@01 0)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@1@01 0))
    ($Perm.min
      (ite
        (and
          (img@15@01 r)
          (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
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
          (img@15@01 r)
          (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@17@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@17@01 r) $Perm.No)
  
  :qid |quant-u-11|))))
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
  (=> (= r (loc<Ref> a@1@01 0)) (= (- $Perm.Write (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@18@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@18@01  $FVF<val>) (loc<Ref> a@1@01 0)) 0))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@18@01  $FVF<val>) (loc<Ref> a@1@01 0)) (loc<Ref> a@1@01 0)))
; [exec]
; fold acc(array(a), write)
(declare-const i@19@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 5 | !(0 <= i@19@01) | live]
; [else-branch: 5 | 0 <= i@19@01 | live]
(push) ; 8
; [then-branch: 5 | !(0 <= i@19@01)]
(assert (not (<= 0 i@19@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 5 | 0 <= i@19@01]
(assert (<= 0 i@19@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
(assert (and (<= 0 i@19@01) (< i@19@01 (len<Int> a@1@01))))
; [eval] loc(a, i)
(declare-const sm@20@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 0))
    (=
      ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@18@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@18@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@15@01 r)
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
      (< $Perm.No (- $Perm.Write (pTaken@17@01 r)))
      false)
    (= ($FVF.lookup_val (as sm@20@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@18@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef8|)))
; [eval] loc(a, i)
(pop) ; 6
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 0))
    (=
      ($FVF.lookup_val (as sm@20@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@18@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@18@01  $FVF<val>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@15@01 r)
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
      (< $Perm.No (- $Perm.Write (pTaken@17@01 r)))
      false)
    (= ($FVF.lookup_val (as sm@20@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@18@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r))
  :pattern (($FVF.lookup_val (as sm@20@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef8|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 (len<Int> a@1@01)))
    (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) (loc<Ref> a@1@01 i@19@01)) (loc<Ref> a@1@01 i@19@01)))
  :qid |val-aux|)))
(declare-const sm@23@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@1@01 0))
    (=
      ($FVF.lookup_val (as sm@23@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@18@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@18@01  $FVF<val>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@15@01 r)
        (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
      (< $Perm.No (- $Perm.Write (pTaken@17@01 r)))
      false)
    (= ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@18@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r))
  :pattern (($FVF.lookup_val (as sm@23@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef11|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@19@01 Int) (i2@19@01 Int)) (!
  (=>
    (and
      (and
        (and (<= 0 i1@19@01) (< i1@19@01 (len<Int> a@1@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) (loc<Ref> a@1@01 i1@19@01)) (loc<Ref> a@1@01 i1@19@01)))
      (and
        (and (<= 0 i2@19@01) (< i2@19@01 (len<Int> a@1@01)))
        ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) (loc<Ref> a@1@01 i2@19@01)) (loc<Ref> a@1@01 i2@19@01)))
      (= (loc<Ref> a@1@01 i1@19@01) (loc<Ref> a@1@01 i2@19@01)))
    (= i1@19@01 i2@19@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 (len<Int> a@1@01)))
    (and
      (= (inv@21@01 (loc<Ref> a@1@01 i@19@01)) i@19@01)
      (img@22@01 (loc<Ref> a@1@01 i@19@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@20@01  $FVF<val>) (loc<Ref> a@1@01 i@19@01)) (loc<Ref> a@1@01 i@19@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@01 r)
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@23@01  $FVF<val>) r) r))
  :pattern ((inv@21@01 r))
  :qid |quant-u-14|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
      (img@22@01 r)
      (= r (loc<Ref> a@1@01 (inv@21@01 r))))
    ($Perm.min
      (ite
        (and
          (img@15@01 r)
          (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
        (- $Perm.Write (pTaken@17@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@25@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
      (img@22@01 r)
      (= r (loc<Ref> a@1@01 (inv@21@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@1@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@24@01 r)))
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
          (img@15@01 r)
          (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
        (- $Perm.Write (pTaken@17@01 r))
        $Perm.No)
      (pTaken@24@01 r))
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
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
      (img@22@01 r)
      (= r (loc<Ref> a@1@01 (inv@21@01 r))))
    (= (- $Perm.Write (pTaken@24@01 r)) $Perm.No))
  
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
    (ite (= (loc<Ref> a@1@01 0) (loc<Ref> a@1@01 0)) $Perm.Write $Perm.No)
    (pTaken@25@01 (loc<Ref> a@1@01 0)))
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
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
      (img@22@01 r)
      (= r (loc<Ref> a@1@01 (inv@21@01 r))))
    (= (- (- $Perm.Write (pTaken@24@01 r)) (pTaken@25@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@26@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@26@01  $FVF<val>)))
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
        (img@22@01 r)))
    (=>
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
        (img@22@01 r))
      (Set_in r ($FVF.domain_val (as sm@26@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@26@01  $FVF<val>))))
  :qid |qp.fvfDomDef15|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
        (img@22@01 r))
      (= r (loc<Ref> a@1@01 0)))
    (=
      ($FVF.lookup_val (as sm@26@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@18@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@26@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@18@01  $FVF<val>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) (len<Int> a@1@01)))
        (img@22@01 r))
      (ite
        (and
          (img@15@01 r)
          (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (len<Int> a@1@01))))
        (< $Perm.No (- $Perm.Write (pTaken@17@01 r)))
        false))
    (= ($FVF.lookup_val (as sm@26@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@26@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@18@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r))
  :pattern (($FVF.lookup_val (as sm@26@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef14|)))
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap (as sm@26@01  $FVF<val>)) a@1@01))
; Loop head block: Re-establish invariant
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | !(0 < len[Int](a@1@01))]
(assert (not (< 0 (len<Int> a@1@01))))
(pop) ; 5
; [eval] !(i < len(a))
; [eval] i < len(a)
; [eval] len(a)
(push) ; 5
(set-option :timeout 10)
(assert (not (< 0 (len<Int> a@1@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 (len<Int> a@1@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | !(0 < len[Int](a@1@01)) | live]
; [else-branch: 6 | 0 < len[Int](a@1@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 6 | !(0 < len[Int](a@1@01))]
(assert (not (< 0 (len<Int> a@1@01))))
; [eval] (unfolding acc(array(a), write) in (forall i: Int :: { loc(a, i).val } 0 <= i && i < len(a) ==> loc(a, i).val == i))
(push) ; 6
(assert (array%trigger ($SortWrappers.$FVF<val>To$Snap $t@11@01) a@1@01))
(declare-const i@27@01 Int)
(push) ; 7
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 8
; [then-branch: 7 | !(0 <= i@27@01) | live]
; [else-branch: 7 | 0 <= i@27@01 | live]
(push) ; 9
; [then-branch: 7 | !(0 <= i@27@01)]
(assert (not (<= 0 i@27@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 7 | 0 <= i@27@01]
(assert (<= 0 i@27@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
(assert (and (<= 0 i@27@01) (< i@27@01 (len<Int> a@1@01))))
; [eval] loc(a, i)
(declare-const sm@28@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 7
(declare-fun inv@29@01 ($Ref) Int)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (len<Int> a@1@01)))
    (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@27@01)) (loc<Ref> a@1@01 i@27@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((i1@27@01 Int) (i2@27@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@27@01) (< i1@27@01 (len<Int> a@1@01)))
      (and (<= 0 i2@27@01) (< i2@27@01 (len<Int> a@1@01)))
      (= (loc<Ref> a@1@01 i1@27@01) (loc<Ref> a@1@01 i2@27@01)))
    (= i1@27@01 i2@27@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (len<Int> a@1@01)))
    (and
      (= (inv@29@01 (loc<Ref> a@1@01 i@27@01)) i@27@01)
      (img@30@01 (loc<Ref> a@1@01 i@27@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@27@01)) (loc<Ref> a@1@01 i@27@01)))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@29@01 r)) r))
  :pattern ((inv@29@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (<= 0 i@27@01) (< i@27@01 (len<Int> a@1@01)))
    (not (= (loc<Ref> a@1@01 i@27@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@27@01)) (loc<Ref> a@1@01 i@27@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@31@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01))))
    (= ($FVF.lookup_val (as sm@31@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r)
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) r) r))
  :pattern ((inv@29@01 r))
  :qid |quant-u-22|)))
; [eval] (forall i: Int :: { loc(a, i).val } 0 <= i && i < len(a) ==> loc(a, i).val == i)
(declare-const i@32@01 Int)
(push) ; 7
; [eval] 0 <= i && i < len(a) ==> loc(a, i).val == i
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 8
; [then-branch: 8 | !(0 <= i@32@01) | live]
; [else-branch: 8 | 0 <= i@32@01 | live]
(push) ; 9
; [then-branch: 8 | !(0 <= i@32@01)]
(assert (not (<= 0 i@32@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 8 | 0 <= i@32@01]
(assert (<= 0 i@32@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@32@01) (not (<= 0 i@32@01))))
(push) ; 8
; [then-branch: 9 | 0 <= i@32@01 && i@32@01 < len[Int](a@1@01) | live]
; [else-branch: 9 | !(0 <= i@32@01 && i@32@01 < len[Int](a@1@01)) | live]
(push) ; 9
; [then-branch: 9 | 0 <= i@32@01 && i@32@01 < len[Int](a@1@01)]
(assert (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01))))
; [eval] loc(a, i).val == i
; [eval] loc(a, i)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@30@01 r)
        (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01))))
      (=
        ($FVF.lookup_val (as sm@31@01  $FVF<val>) r)
        ($FVF.lookup_val $t@11@01 r)))
    :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val $t@11@01 r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r)
    :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef18|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01)) (loc<Ref> a@1@01 i@32@01)))
(push) ; 10
(assert (not (and
  (img@30@01 (loc<Ref> a@1@01 i@32@01))
  (and
    (<= 0 (inv@29@01 (loc<Ref> a@1@01 i@32@01)))
    (< (inv@29@01 (loc<Ref> a@1@01 i@32@01)) (len<Int> a@1@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 9 | !(0 <= i@32@01 && i@32@01 < len[Int](a@1@01))]
(assert (not (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01))))
    (= ($FVF.lookup_val (as sm@31@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r)
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (=>
  (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))
  (and
    (<= 0 i@32@01)
    (< i@32@01 (len<Int> a@1@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01)) (loc<Ref> a@1@01 i@32@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01))))
  (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))))
; Definitional axioms for snapshot map values
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01))))
    (= ($FVF.lookup_val (as sm@31@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r)
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@32@01 Int)) (!
  (and
    (or (<= 0 i@32@01) (not (<= 0 i@32@01)))
    (=>
      (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))
      (and
        (<= 0 i@32@01)
        (< i@32@01 (len<Int> a@1@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01)) (loc<Ref> a@1@01 i@32@01))))
    (or
      (not (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01))))
      (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01)) (loc<Ref> a@1@01 i@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0236.vpr@33@35@33@111-aux|)))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01))))
    (= (loc<Ref> a@1@01 (inv@29@01 r)) r))
  :pattern ((inv@29@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01))))
    (= ($FVF.lookup_val (as sm@31@01  $FVF<val>) r) ($FVF.lookup_val $t@11@01 r)))
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@11@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@11@01 r) r)
  :pattern (($FVF.lookup_val (as sm@31@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (and
  (array%trigger ($SortWrappers.$FVF<val>To$Snap $t@11@01) a@1@01)
  (forall ((i@27@01 Int)) (!
    (=>
      (and (<= 0 i@27@01) (< i@27@01 (len<Int> a@1@01)))
      (or (<= 0 i@27@01) (not (<= 0 i@27@01))))
    :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@27@01)) (loc<Ref> a@1@01 i@27@01)))
    :qid |val-aux|))))
(assert (and
  (forall ((i@27@01 Int)) (!
    (=>
      (and (<= 0 i@27@01) (< i@27@01 (len<Int> a@1@01)))
      (and
        (= (inv@29@01 (loc<Ref> a@1@01 i@27@01)) i@27@01)
        (img@30@01 (loc<Ref> a@1@01 i@27@01))))
    :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@27@01)) (loc<Ref> a@1@01 i@27@01)))
    :qid |quant-u-21|))
  (forall ((i@27@01 Int)) (!
    (=>
      (and (<= 0 i@27@01) (< i@27@01 (len<Int> a@1@01)))
      (not (= (loc<Ref> a@1@01 i@27@01) $Ref.null)))
    :pattern (($FVF.loc_val ($FVF.lookup_val $t@11@01 (loc<Ref> a@1@01 i@27@01)) (loc<Ref> a@1@01 i@27@01)))
    :qid |val-permImpliesNonNull|))
  (forall ((r $Ref)) (!
    (=>
      (and (<= 0 (inv@29@01 r)) (< (inv@29@01 r) (len<Int> a@1@01)))
      ($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) r) r))
    :pattern ((inv@29@01 r))
    :qid |quant-u-22|))
  (forall ((i@32@01 Int)) (!
    (and
      (or (<= 0 i@32@01) (not (<= 0 i@32@01)))
      (=>
        (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))
        (and
          (<= 0 i@32@01)
          (< i@32@01 (len<Int> a@1@01))
          ($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01)) (loc<Ref> a@1@01 i@32@01))))
      (or
        (not (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01))))
        (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))))
    :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01)) (loc<Ref> a@1@01 i@32@01)))
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0236.vpr@33@35@33@111-aux|))))
(push) ; 6
(assert (not (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))
    (=
      ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01))
      i@32@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01)) (loc<Ref> a@1@01 i@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0236.vpr@33@35@33@111|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 (len<Int> a@1@01)))
    (=
      ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01))
      i@32@01))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@31@01  $FVF<val>) (loc<Ref> a@1@01 i@32@01)) (loc<Ref> a@1@01 i@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0236.vpr@33@35@33@111|)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 < len[Int](a@1@01)]
(assert (< 0 (len<Int> a@1@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
