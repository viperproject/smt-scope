(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:38
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0302.vpr
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
(declare-fun length<Int> (Array_) Int)
(declare-fun ref_to_array<Array> ($Ref) Array_)
(declare-fun ref_to_index<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun p ($Snap Int Int $Perm) $Perm)
(declare-fun p%limited ($Snap Int Int $Perm) $Perm)
(declare-fun p%stateless (Int Int $Perm) Bool)
(declare-fun p%precondition ($Snap Int Int $Perm) Bool)
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
  (=>
    (<= 0 i)
    (and
      (= (ref_to_array<Array> (loc<Ref> a i)) a)
      (= (ref_to_index<Int> (loc<Ref> a i)) i)))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a Array_)) (!
  (>= (length<Int> a) 0)
  :pattern ((length<Int> a))
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
(assert (forall ((s@$ $Snap) (q@0@00 Int) (size@1@00 Int) (rdAmount@2@00 $Perm)) (!
  (=
    (p%limited s@$ q@0@00 size@1@00 rdAmount@2@00)
    (p s@$ q@0@00 size@1@00 rdAmount@2@00))
  :pattern ((p s@$ q@0@00 size@1@00 rdAmount@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (q@0@00 Int) (size@1@00 Int) (rdAmount@2@00 $Perm)) (!
  (p%stateless q@0@00 size@1@00 rdAmount@2@00)
  :pattern ((p%limited s@$ q@0@00 size@1@00 rdAmount@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (q@0@00 Int) (size@1@00 Int) (rdAmount@2@00 $Perm)) (!
  (let ((result@3@00 (p%limited s@$ q@0@00 size@1@00 rdAmount@2@00))) (=>
    (p%precondition s@$ q@0@00 size@1@00 rdAmount@2@00)
    (and
      (or
        (and
          (not (= (mod q@0@00 2) 0))
          (and
            (>= size@1@00 1)
            (and
              (>= q@0@00 0)
              (and
                (>= size@1@00 (+ 1 q@0@00))
                (and
                  (or (not (= q@0@00 0)) (= result@3@00 $Perm.Write))
                  (or (= q@0@00 0) (= result@3@00 $Perm.Write)))))))
        (or
          (and
            (not (= (mod q@0@00 2) 0))
            (and
              (= (mod (+ q@0@00 1) 2) 0)
              (and
                (>= size@1@00 (+ 2 q@0@00))
                (and
                  (>= q@0@00 0)
                  (and
                    (>= q@0@00 (- 0 1))
                    (and (>= size@1@00 (+ 1 q@0@00)) (= result@3@00 $Perm.Write)))))))
          (or
            (and
              (not (= (mod q@0@00 2) 0))
              (and
                (= (mod q@0@00 2) 0)
                (and
                  (>= size@1@00 (+ 1 q@0@00))
                  (and
                    (>= q@0@00 0)
                    (and
                      (>= q@0@00 0)
                      (and
                        (>= size@1@00 (+ 1 q@0@00))
                        (= result@3@00 $Perm.Write)))))))
            (or
              (and
                (not (= (mod q@0@00 2) 0))
                (and
                  (= (mod (+ q@0@00 2) 2) 0)
                  (and
                    (>= size@1@00 (+ 3 q@0@00))
                    (and
                      (>= q@0@00 0)
                      (and
                        (>= q@0@00 (- 0 2))
                        (and
                          (>= size@1@00 (+ 1 q@0@00))
                          (= result@3@00 $Perm.Write)))))))
              (or
                (and
                  (not (= (mod q@0@00 2) 0))
                  (and
                    (= (mod (+ q@0@00 1) 2) 0)
                    (and
                      (>= size@1@00 (+ 2 q@0@00))
                      (and
                        (>= q@0@00 0)
                        (and
                          (>= q@0@00 (- 0 1))
                          (and
                            (>= size@1@00 (+ 1 q@0@00))
                            (= result@3@00 $Perm.Write)))))))
                (or
                  (or
                    (and
                      (not (= (mod (+ q@0@00 1) 2) 0))
                      (and
                        (>= size@1@00 1)
                        (and
                          (>= q@0@00 (- 0 1))
                          (and
                            (>= size@1@00 (+ 2 q@0@00))
                            (and
                              (or
                                (not (= q@0@00 0))
                                (= result@3@00 rdAmount@2@00))
                              (or (= q@0@00 0) (= result@3@00 $Perm.No)))))))
                    (or
                      (and
                        (not (= (mod (+ q@0@00 1) 2) 0))
                        (and
                          (= (mod (+ q@0@00 1) 2) 0)
                          (and
                            (>= size@1@00 (+ 2 q@0@00))
                            (and
                              (>= q@0@00 (- 0 1))
                              (and
                                (>= q@0@00 (- 0 1))
                                (and
                                  (>= size@1@00 (+ 2 q@0@00))
                                  (= result@3@00 $Perm.No)))))))
                      (or
                        (and
                          (not (= (mod (+ q@0@00 1) 2) 0))
                          (and
                            (= (mod q@0@00 2) 0)
                            (and
                              (>= size@1@00 (+ 1 q@0@00))
                              (and
                                (>= q@0@00 (- 0 1))
                                (and
                                  (>= q@0@00 0)
                                  (and
                                    (>= size@1@00 (+ 2 q@0@00))
                                    (= result@3@00 rdAmount@2@00)))))))
                        (or
                          (and
                            (not (= (mod (+ q@0@00 1) 2) 0))
                            (and
                              (= (mod (+ q@0@00 2) 2) 0)
                              (and
                                (>= size@1@00 (+ 3 q@0@00))
                                (and
                                  (>= q@0@00 (- 0 1))
                                  (and
                                    (>= q@0@00 (- 0 2))
                                    (and
                                      (>= size@1@00 (+ 2 q@0@00))
                                      (= result@3@00 $Perm.No)))))))
                          (and
                            (not (= (mod (+ q@0@00 1) 2) 0))
                            (and
                              (= (mod (+ q@0@00 1) 2) 0)
                              (and
                                (>= size@1@00 (+ 2 q@0@00))
                                (and
                                  (>= q@0@00 (- 0 1))
                                  (and
                                    (>= q@0@00 (- 0 1))
                                    (and
                                      (>= size@1@00 (+ 2 q@0@00))
                                      (= result@3@00 $Perm.No)))))))))))
                  (or
                    (or
                      (and
                        (>= size@1@00 1)
                        (and
                          (>= size@1@00 2)
                          (and
                            (or
                              (not (= q@0@00 0))
                              (or (= q@0@00 1) (= result@3@00 rdAmount@2@00)))
                            (and
                              (or
                                (= q@0@00 0)
                                (or (= q@0@00 1) (= result@3@00 $Perm.No)))
                              (and
                                (or
                                  (= q@0@00 1)
                                  (or (= q@0@00 0) (= result@3@00 $Perm.No)))
                                (and
                                  (or
                                    (not (= q@0@00 1))
                                    (or
                                      (not (= q@0@00 0))
                                      (= result@3@00 $Perm.Write)))
                                  (or
                                    (not (= q@0@00 1))
                                    (or (= q@0@00 0) (= result@3@00 $Perm.Write)))))))))
                      (or
                        (and
                          (= (mod (+ q@0@00 1) 2) 0)
                          (and
                            (>= size@1@00 (+ 2 q@0@00))
                            (and
                              (>= q@0@00 (- 0 1))
                              (and
                                (>= size@1@00 2)
                                (and
                                  (or (= q@0@00 1) (= result@3@00 $Perm.No))
                                  (or
                                    (not (= q@0@00 1))
                                    (= result@3@00 $Perm.Write)))))))
                        (or
                          (and
                            (= (mod q@0@00 2) 0)
                            (and
                              (>= size@1@00 (+ 1 q@0@00))
                              (and
                                (>= q@0@00 0)
                                (and
                                  (>= size@1@00 2)
                                  (and
                                    (or
                                      (= q@0@00 1)
                                      (= result@3@00 rdAmount@2@00))
                                    (or
                                      (not (= q@0@00 1))
                                      (= result@3@00 $Perm.Write)))))))
                          (or
                            (and
                              (= (mod (+ q@0@00 2) 2) 0)
                              (and
                                (>= size@1@00 (+ 3 q@0@00))
                                (and
                                  (>= q@0@00 (- 0 2))
                                  (and
                                    (>= size@1@00 2)
                                    (and
                                      (or (= q@0@00 1) (= result@3@00 $Perm.No))
                                      (or
                                        (not (= q@0@00 1))
                                        (= result@3@00 $Perm.Write)))))))
                            (and
                              (= (mod (+ q@0@00 1) 2) 0)
                              (and
                                (>= size@1@00 (+ 2 q@0@00))
                                (and
                                  (>= q@0@00 (- 0 1))
                                  (and
                                    (>= size@1@00 2)
                                    (and
                                      (or (= q@0@00 1) (= result@3@00 $Perm.No))
                                      (or
                                        (not (= q@0@00 1))
                                        (= result@3@00 $Perm.Write)))))))))))
                    (or
                      (and
                        (not (= (mod (+ q@0@00 2) 2) 0))
                        (and
                          (>= size@1@00 1)
                          (and
                            (>= q@0@00 (- 0 2))
                            (and
                              (>= size@1@00 (+ 3 q@0@00))
                              (and
                                (or
                                  (not (= q@0@00 0))
                                  (= result@3@00 rdAmount@2@00))
                                (or (= q@0@00 0) (= result@3@00 $Perm.No)))))))
                      (or
                        (and
                          (not (= (mod (+ q@0@00 2) 2) 0))
                          (and
                            (= (mod (+ q@0@00 1) 2) 0)
                            (and
                              (>= size@1@00 (+ 2 q@0@00))
                              (and
                                (>= q@0@00 (- 0 2))
                                (and
                                  (>= q@0@00 (- 0 1))
                                  (and
                                    (>= size@1@00 (+ 3 q@0@00))
                                    (= result@3@00 $Perm.No)))))))
                        (or
                          (and
                            (not (= (mod (+ q@0@00 2) 2) 0))
                            (and
                              (= (mod q@0@00 2) 0)
                              (and
                                (>= size@1@00 (+ 1 q@0@00))
                                (and
                                  (>= q@0@00 (- 0 2))
                                  (and
                                    (>= q@0@00 0)
                                    (and
                                      (>= size@1@00 (+ 3 q@0@00))
                                      (= result@3@00 rdAmount@2@00)))))))
                          (or
                            (and
                              (not (= (mod (+ q@0@00 2) 2) 0))
                              (and
                                (= (mod (+ q@0@00 2) 2) 0)
                                (and
                                  (>= size@1@00 (+ 3 q@0@00))
                                  (and
                                    (>= q@0@00 (- 0 2))
                                    (and
                                      (>= q@0@00 (- 0 2))
                                      (and
                                        (>= size@1@00 (+ 3 q@0@00))
                                        (= result@3@00 $Perm.No)))))))
                            (and
                              (not (= (mod (+ q@0@00 2) 2) 0))
                              (and
                                (= (mod (+ q@0@00 1) 2) 0)
                                (and
                                  (>= size@1@00 (+ 2 q@0@00))
                                  (and
                                    (>= q@0@00 (- 0 2))
                                    (and
                                      (>= q@0@00 (- 0 1))
                                      (and
                                        (>= size@1@00 (+ 3 q@0@00))
                                        (= result@3@00 $Perm.No))))))))))))))))))
      (and
        (or
          (= (mod (+ q@0@00 1) 2) 0)
          (or
            (< size@1@00 1)
            (or
              (< q@0@00 (- 0 1))
              (or
                (< size@1@00 (+ 2 q@0@00))
                (and
                  (or (not (= q@0@00 0)) (>= result@3@00 rdAmount@2@00))
                  (or (= q@0@00 0) (>= result@3@00 $Perm.No)))))))
        (and
          (or
            (= (mod (+ q@0@00 1) 2) 0)
            (or
              (not (= (mod q@0@00 2) 0))
              (or
                (< size@1@00 (+ 1 q@0@00))
                (or
                  (< q@0@00 (- 0 1))
                  (or
                    (< q@0@00 0)
                    (or
                      (< size@1@00 (+ 2 q@0@00))
                      (>= result@3@00 rdAmount@2@00)))))))
          (and
            (or
              (= (mod (+ q@0@00 1) 2) 0)
              (or
                (not (= (mod (+ q@0@00 1) 2) 0))
                (or
                  (< size@1@00 (+ 2 q@0@00))
                  (or
                    (< q@0@00 (- 0 1))
                    (or
                      (< q@0@00 (- 0 1))
                      (or (< size@1@00 (+ 2 q@0@00)) (>= result@3@00 $Perm.No)))))))
            (and
              (or
                (= (mod (+ q@0@00 1) 2) 0)
                (or
                  (not (= (mod (+ q@0@00 1) 2) 0))
                  (or
                    (< size@1@00 (+ 2 q@0@00))
                    (or
                      (< q@0@00 (- 0 1))
                      (or
                        (< q@0@00 (- 0 1))
                        (or (< size@1@00 (+ 2 q@0@00)) (>= result@3@00 $Perm.No)))))))
              (and
                (or
                  (= (mod (+ q@0@00 1) 2) 0)
                  (or
                    (not (= (mod (+ q@0@00 2) 2) 0))
                    (or
                      (< size@1@00 (+ 3 q@0@00))
                      (or
                        (< q@0@00 (- 0 1))
                        (or
                          (< q@0@00 (- 0 2))
                          (or
                            (< size@1@00 (+ 2 q@0@00))
                            (>= result@3@00 $Perm.No)))))))
                (and
                  (and
                    (or
                      (= (mod q@0@00 2) 0)
                      (or
                        (< size@1@00 1)
                        (or
                          (< q@0@00 0)
                          (or
                            (< size@1@00 (+ 1 q@0@00))
                            (and
                              (or
                                (not (= q@0@00 0))
                                (>= result@3@00 $Perm.Write))
                              (or (= q@0@00 0) (>= result@3@00 $Perm.Write)))))))
                    (and
                      (or
                        (= (mod q@0@00 2) 0)
                        (or
                          (not (= (mod q@0@00 2) 0))
                          (or
                            (< size@1@00 (+ 1 q@0@00))
                            (or
                              (< q@0@00 0)
                              (or
                                (< q@0@00 0)
                                (or
                                  (< size@1@00 (+ 1 q@0@00))
                                  (>= result@3@00 $Perm.Write)))))))
                      (and
                        (or
                          (= (mod q@0@00 2) 0)
                          (or
                            (not (= (mod (+ q@0@00 1) 2) 0))
                            (or
                              (< size@1@00 (+ 2 q@0@00))
                              (or
                                (< q@0@00 0)
                                (or
                                  (< q@0@00 (- 0 1))
                                  (or
                                    (< size@1@00 (+ 1 q@0@00))
                                    (>= result@3@00 $Perm.Write)))))))
                        (and
                          (or
                            (= (mod q@0@00 2) 0)
                            (or
                              (not (= (mod (+ q@0@00 1) 2) 0))
                              (or
                                (< size@1@00 (+ 2 q@0@00))
                                (or
                                  (< q@0@00 0)
                                  (or
                                    (< q@0@00 (- 0 1))
                                    (or
                                      (< size@1@00 (+ 1 q@0@00))
                                      (>= result@3@00 $Perm.Write)))))))
                          (or
                            (= (mod q@0@00 2) 0)
                            (or
                              (not (= (mod (+ q@0@00 2) 2) 0))
                              (or
                                (< size@1@00 (+ 3 q@0@00))
                                (or
                                  (< q@0@00 0)
                                  (or
                                    (< q@0@00 (- 0 2))
                                    (or
                                      (< size@1@00 (+ 1 q@0@00))
                                      (>= result@3@00 $Perm.Write)))))))))))
                  (and
                    (and
                      (or
                        (< size@1@00 1)
                        (or
                          (< size@1@00 2)
                          (and
                            (or
                              (not (= q@0@00 0))
                              (or (= q@0@00 1) (>= result@3@00 rdAmount@2@00)))
                            (and
                              (or
                                (= q@0@00 0)
                                (or (= q@0@00 1) (>= result@3@00 $Perm.No)))
                              (and
                                (or
                                  (= q@0@00 1)
                                  (or (= q@0@00 0) (>= result@3@00 $Perm.No)))
                                (and
                                  (or
                                    (not (= q@0@00 1))
                                    (or
                                      (not (= q@0@00 0))
                                      (>= result@3@00 $Perm.Write)))
                                  (or
                                    (not (= q@0@00 1))
                                    (or
                                      (= q@0@00 0)
                                      (>= result@3@00 $Perm.Write)))))))))
                      (and
                        (or
                          (not (= (mod q@0@00 2) 0))
                          (or
                            (< size@1@00 (+ 1 q@0@00))
                            (or
                              (< q@0@00 0)
                              (or
                                (< size@1@00 2)
                                (and
                                  (or
                                    (= q@0@00 1)
                                    (>= result@3@00 rdAmount@2@00))
                                  (or
                                    (not (= q@0@00 1))
                                    (>= result@3@00 $Perm.Write)))))))
                        (and
                          (or
                            (not (= (mod (+ q@0@00 1) 2) 0))
                            (or
                              (< size@1@00 (+ 2 q@0@00))
                              (or
                                (< q@0@00 (- 0 1))
                                (or
                                  (< size@1@00 2)
                                  (and
                                    (or (= q@0@00 1) (>= result@3@00 $Perm.No))
                                    (or
                                      (not (= q@0@00 1))
                                      (>= result@3@00 $Perm.Write)))))))
                          (and
                            (or
                              (not (= (mod (+ q@0@00 1) 2) 0))
                              (or
                                (< size@1@00 (+ 2 q@0@00))
                                (or
                                  (< q@0@00 (- 0 1))
                                  (or
                                    (< size@1@00 2)
                                    (and
                                      (or (= q@0@00 1) (>= result@3@00 $Perm.No))
                                      (or
                                        (not (= q@0@00 1))
                                        (>= result@3@00 $Perm.Write)))))))
                            (or
                              (not (= (mod (+ q@0@00 2) 2) 0))
                              (or
                                (< size@1@00 (+ 3 q@0@00))
                                (or
                                  (< q@0@00 (- 0 2))
                                  (or
                                    (< size@1@00 2)
                                    (and
                                      (or (= q@0@00 1) (>= result@3@00 $Perm.No))
                                      (or
                                        (not (= q@0@00 1))
                                        (>= result@3@00 $Perm.Write)))))))))))
                    (and
                      (or
                        (= (mod (+ q@0@00 2) 2) 0)
                        (or
                          (< size@1@00 1)
                          (or
                            (< q@0@00 (- 0 2))
                            (or
                              (< size@1@00 (+ 3 q@0@00))
                              (and
                                (or
                                  (not (= q@0@00 0))
                                  (>= result@3@00 rdAmount@2@00))
                                (or (= q@0@00 0) (>= result@3@00 $Perm.No)))))))
                      (and
                        (or
                          (= (mod (+ q@0@00 2) 2) 0)
                          (or
                            (not (= (mod q@0@00 2) 0))
                            (or
                              (< size@1@00 (+ 1 q@0@00))
                              (or
                                (< q@0@00 (- 0 2))
                                (or
                                  (< q@0@00 0)
                                  (or
                                    (< size@1@00 (+ 3 q@0@00))
                                    (>= result@3@00 rdAmount@2@00)))))))
                        (and
                          (or
                            (= (mod (+ q@0@00 2) 2) 0)
                            (or
                              (not (= (mod (+ q@0@00 1) 2) 0))
                              (or
                                (< size@1@00 (+ 2 q@0@00))
                                (or
                                  (< q@0@00 (- 0 2))
                                  (or
                                    (< q@0@00 (- 0 1))
                                    (or
                                      (< size@1@00 (+ 3 q@0@00))
                                      (>= result@3@00 $Perm.No)))))))
                          (and
                            (or
                              (= (mod (+ q@0@00 2) 2) 0)
                              (or
                                (not (= (mod (+ q@0@00 1) 2) 0))
                                (or
                                  (< size@1@00 (+ 2 q@0@00))
                                  (or
                                    (< q@0@00 (- 0 2))
                                    (or
                                      (< q@0@00 (- 0 1))
                                      (or
                                        (< size@1@00 (+ 3 q@0@00))
                                        (>= result@3@00 $Perm.No)))))))
                            (or
                              (= (mod (+ q@0@00 2) 2) 0)
                              (or
                                (not (= (mod (+ q@0@00 2) 2) 0))
                                (or
                                  (< size@1@00 (+ 3 q@0@00))
                                  (or
                                    (< q@0@00 (- 0 2))
                                    (or
                                      (< q@0@00 (- 0 2))
                                      (or
                                        (< size@1@00 (+ 3 q@0@00))
                                        (>= result@3@00 $Perm.No)))))))))))))))))))))
  :pattern ((p%limited s@$ q@0@00 size@1@00 rdAmount@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (q@0@00 Int) (size@1@00 Int) (rdAmount@2@00 $Perm)) (!
  (let ((result@3@00 (p%limited s@$ q@0@00 size@1@00 rdAmount@2@00))) true)
  :pattern ((p%limited s@$ q@0@00 size@1@00 rdAmount@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- testspec_skipping_indices1 ----------
(declare-const arr@0@01 Array_)
(declare-const size@1@01 Int)
(declare-const rdAmount@2@01 $Perm)
(declare-const arr@3@01 Array_)
(declare-const size@4@01 Int)
(declare-const rdAmount@5@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] none < rdAmount
(assert (< $Perm.No rdAmount@5@01))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] rdAmount < write
(assert (< rdAmount@5@01 $Perm.Write))
(declare-const j@7@01 Int)
(push) ; 2
; [eval] loc(arr, j)
; [eval] p(j, size, rdAmount)
(push) ; 3
(assert (p%precondition $Snap.unit j@7@01 size@4@01 rdAmount@5@01))
(pop) ; 3
; Joined path conditions
(assert (p%precondition $Snap.unit j@7@01 size@4@01 rdAmount@5@01))
(pop) ; 2
(declare-fun inv@8@01 ($Ref) Int)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@7@01 Int)) (!
  (p%precondition $Snap.unit j@7@01 size@4@01 rdAmount@5@01)
  :pattern ((loc<Ref> arr@3@01 j@7@01))
  :qid |val-aux|)))
(push) ; 2
(assert (not (forall ((j@7@01 Int)) (!
  (=>
    (and
      (p%precondition $Snap.unit j@7@01 size@4@01 rdAmount@5@01)
      (=>
        (not (= (p $Snap.unit j@7@01 size@4@01 rdAmount@5@01) $Perm.No))
        (p%precondition $Snap.unit j@7@01 size@4@01 rdAmount@5@01)))
    (or
      (= (p $Snap.unit j@7@01 size@4@01 rdAmount@5@01) $Perm.No)
      (< $Perm.No (p $Snap.unit j@7@01 size@4@01 rdAmount@5@01))))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((j1@7@01 Int) (j2@7@01 Int)) (!
  (and
    (p%precondition $Snap.unit j1@7@01 size@4@01 rdAmount@5@01)
    (=>
      (< $Perm.No (p $Snap.unit j1@7@01 size@4@01 rdAmount@5@01))
      (p%precondition $Snap.unit j2@7@01 size@4@01 rdAmount@5@01)))
  
  :qid |val-rcvrInj|)))
(push) ; 2
(assert (not (forall ((j1@7@01 Int) (j2@7@01 Int)) (!
  (=>
    (and
      (< $Perm.No (p $Snap.unit j1@7@01 size@4@01 rdAmount@5@01))
      (< $Perm.No (p $Snap.unit j2@7@01 size@4@01 rdAmount@5@01))
      (= (loc<Ref> arr@3@01 j1@7@01) (loc<Ref> arr@3@01 j2@7@01)))
    (= j1@7@01 j2@7@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@7@01 Int)) (!
  (p%precondition $Snap.unit j@7@01 size@4@01 rdAmount@5@01)
  :pattern ((loc<Ref> arr@3@01 j@7@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (img@9@01 r)
    (p%precondition $Snap.unit (inv@8@01 r) size@4@01 rdAmount@5@01))
  :pattern ((inv@8@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((j@7@01 Int)) (!
  (=>
    (< $Perm.No (p $Snap.unit j@7@01 size@4@01 rdAmount@5@01))
    (and
      (= (inv@8@01 (loc<Ref> arr@3@01 j@7@01)) j@7@01)
      (img@9@01 (loc<Ref> arr@3@01 j@7@01))))
  :pattern ((loc<Ref> arr@3@01 j@7@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@01 r)
      (< $Perm.No (p $Snap.unit (inv@8@01 r) size@4@01 rdAmount@5@01)))
    (= (loc<Ref> arr@3@01 (inv@8@01 r)) r))
  :pattern ((inv@8@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((j@7@01 Int)) (!
  (<= $Perm.No (p $Snap.unit j@7@01 size@4@01 rdAmount@5@01))
  :pattern ((loc<Ref> arr@3@01 j@7@01))
  :qid |val-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((j@7@01 Int)) (!
  (<= (p $Snap.unit j@7@01 size@4@01 rdAmount@5@01) $Perm.Write)
  :pattern ((loc<Ref> arr@3@01 j@7@01))
  :qid |val-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((j@7@01 Int)) (!
  (=>
    (< $Perm.No (p $Snap.unit j@7@01 size@4@01 rdAmount@5@01))
    (not (= (loc<Ref> arr@3@01 j@7@01) $Ref.null)))
  :pattern ((loc<Ref> arr@3@01 j@7@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall j: Int ::acc(loc(arr, j).val, (j < 0 || j >= size ?
;       none :
;       write)))
(declare-const j@10@01 Int)
(push) ; 3
; [eval] (j < 0 || j >= size ? none : write)
; [eval] j < 0 || j >= size
; [eval] j < 0
(push) ; 4
; [then-branch: 0 | j@10@01 < 0 | live]
; [else-branch: 0 | !(j@10@01 < 0) | live]
(push) ; 5
; [then-branch: 0 | j@10@01 < 0]
(assert (< j@10@01 0))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(j@10@01 < 0)]
(assert (not (< j@10@01 0)))
; [eval] j >= size
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@10@01 0)) (< j@10@01 0)))
(push) ; 4
; [then-branch: 1 | j@10@01 < 0 || j@10@01 >= size@4@01 | live]
; [else-branch: 1 | !(j@10@01 < 0 || j@10@01 >= size@4@01) | live]
(push) ; 5
; [then-branch: 1 | j@10@01 < 0 || j@10@01 >= size@4@01]
(assert (or (< j@10@01 0) (>= j@10@01 size@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(j@10@01 < 0 || j@10@01 >= size@4@01)]
(assert (not (or (< j@10@01 0) (>= j@10@01 size@4@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (or (< j@10@01 0) (>= j@10@01 size@4@01)))
  (or (< j@10@01 0) (>= j@10@01 size@4@01))))
; [eval] loc(arr, j)
(pop) ; 3
(declare-fun inv@11@01 ($Ref) Int)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@10@01 Int)) (!
  (and
    (or (not (< j@10@01 0)) (< j@10@01 0))
    (or
      (not (or (< j@10@01 0) (>= j@10@01 size@4@01)))
      (or (< j@10@01 0) (>= j@10@01 size@4@01))))
  :pattern ((loc<Ref> arr@3@01 j@10@01))
  :qid |val-aux|)))
(push) ; 3
(assert (not (forall ((j@10@01 Int)) (!
  (or
    (=
      (ite (or (< j@10@01 0) (>= j@10@01 size@4@01)) $Perm.No $Perm.Write)
      $Perm.No)
    (not (or (< j@10@01 0) (>= j@10@01 size@4@01))))
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@10@01 Int) (j2@10@01 Int)) (!
  (=>
    (and
      (not (or (< j1@10@01 0) (>= j1@10@01 size@4@01)))
      (not (or (< j2@10@01 0) (>= j2@10@01 size@4@01)))
      (= (loc<Ref> arr@3@01 j1@10@01) (loc<Ref> arr@3@01 j2@10@01)))
    (= j1@10@01 j2@10@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@10@01 Int)) (!
  (=>
    (not (or (< j@10@01 0) (>= j@10@01 size@4@01)))
    (and
      (= (inv@11@01 (loc<Ref> arr@3@01 j@10@01)) j@10@01)
      (img@12@01 (loc<Ref> arr@3@01 j@10@01))))
  :pattern ((loc<Ref> arr@3@01 j@10@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (not (or (< (inv@11@01 r) 0) (>= (inv@11@01 r) size@4@01))))
    (= (loc<Ref> arr@3@01 (inv@11@01 r)) r))
  :pattern ((inv@11@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((r $Ref)) $Perm
  (ite
    (and (img@12@01 r) (= r (loc<Ref> arr@3@01 (inv@11@01 r))))
    ($Perm.min
      (ite
        (img@9@01 r)
        (p $Snap.unit (inv@8@01 r) size@4@01 rdAmount@5@01)
        $Perm.No)
      (ite
        (or (< (inv@11@01 r) 0) (>= (inv@11@01 r) size@4@01))
        $Perm.No
        $Perm.Write))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
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
        (img@9@01 r)
        (p $Snap.unit (inv@8@01 r) size@4@01 rdAmount@5@01)
        $Perm.No)
      (pTaken@13@01 r))
    $Perm.No)
  
  :qid |quant-u-8|))))
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
    (and (img@12@01 r) (= r (loc<Ref> arr@3@01 (inv@11@01 r))))
    (=
      (-
        (ite
          (or (< (inv@11@01 r) 0) (>= (inv@11@01 r) size@4@01))
          $Perm.No
          $Perm.Write)
        (pTaken@13@01 r))
      $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@12@01 r) (= r (loc<Ref> arr@3@01 (inv@11@01 r))))
    (=
      (-
        (ite
          (or (< (inv@11@01 r) 0) (>= (inv@11@01 r) size@4@01))
          $Perm.No
          $Perm.Write)
        (pTaken@13@01 r))
      $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@14@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (img@9@01 r)
      (< $Perm.No (p $Snap.unit (inv@8@01 r) size@4@01 rdAmount@5@01))
      false)
    (=
      ($FVF.lookup_val (as sm@14@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@6@01))) r)))
  :pattern (($FVF.lookup_val (as sm@14@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@6@01))) r))
  :qid |qp.fvfValDef0|)))
(declare-const pm@15@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@15@01  $FPM) r)
    (ite
      (img@9@01 r)
      (p $Snap.unit (inv@8@01 r) size@4@01 rdAmount@5@01)
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@15@01  $FPM) r))
  :qid |qp.resPrmSumDef1|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@15@01  $FPM) r) $Perm.Write)
  :pattern ((inv@8@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const j@16@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j < 0 || j >= size ? none : write)
; [eval] j < 0 || j >= size
; [eval] j < 0
(push) ; 4
; [then-branch: 2 | j@16@01 < 0 | live]
; [else-branch: 2 | !(j@16@01 < 0) | live]
(push) ; 5
; [then-branch: 2 | j@16@01 < 0]
(assert (< j@16@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | !(j@16@01 < 0)]
(assert (not (< j@16@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] j >= size
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@16@01 0)) (< j@16@01 0)))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 3 | j@16@01 < 0 || j@16@01 >= size@4@01 | live]
; [else-branch: 3 | !(j@16@01 < 0 || j@16@01 >= size@4@01) | live]
(push) ; 5
; [then-branch: 3 | j@16@01 < 0 || j@16@01 >= size@4@01]
(assert (or (< j@16@01 0) (>= j@16@01 size@4@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | !(j@16@01 < 0 || j@16@01 >= size@4@01)]
(assert (not (or (< j@16@01 0) (>= j@16@01 size@4@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (or (< j@16@01 0) (>= j@16@01 size@4@01)))
  (or (< j@16@01 0) (>= j@16@01 size@4@01))))
; [eval] loc(arr, j)
(pop) ; 3
(declare-fun inv@17@01 ($Ref) Int)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@16@01 Int)) (!
  (and
    (or (not (< j@16@01 0)) (< j@16@01 0))
    (or
      (not (or (< j@16@01 0) (>= j@16@01 size@4@01)))
      (or (< j@16@01 0) (>= j@16@01 size@4@01))))
  :pattern ((loc<Ref> arr@3@01 j@16@01))
  :qid |val-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@16@01 Int)) (!
  (or
    (=
      (ite (or (< j@16@01 0) (>= j@16@01 size@4@01)) $Perm.No $Perm.Write)
      $Perm.No)
    (not (or (< j@16@01 0) (>= j@16@01 size@4@01))))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@16@01 Int) (j2@16@01 Int)) (!
  (=>
    (and
      (not (or (< j1@16@01 0) (>= j1@16@01 size@4@01)))
      (not (or (< j2@16@01 0) (>= j2@16@01 size@4@01)))
      (= (loc<Ref> arr@3@01 j1@16@01) (loc<Ref> arr@3@01 j2@16@01)))
    (= j1@16@01 j2@16@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@16@01 Int)) (!
  (=>
    (not (or (< j@16@01 0) (>= j@16@01 size@4@01)))
    (and
      (= (inv@17@01 (loc<Ref> arr@3@01 j@16@01)) j@16@01)
      (img@18@01 (loc<Ref> arr@3@01 j@16@01))))
  :pattern ((loc<Ref> arr@3@01 j@16@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (not (or (< (inv@17@01 r) 0) (>= (inv@17@01 r) size@4@01))))
    (= (loc<Ref> arr@3@01 (inv@17@01 r)) r))
  :pattern ((inv@17@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((r $Ref)) $Perm
  (ite
    (and (img@18@01 r) (= r (loc<Ref> arr@3@01 (inv@17@01 r))))
    ($Perm.min
      (ite
        (img@9@01 r)
        (p $Snap.unit (inv@8@01 r) size@4@01 rdAmount@5@01)
        $Perm.No)
      (ite
        (or (< (inv@17@01 r) 0) (>= (inv@17@01 r) size@4@01))
        $Perm.No
        $Perm.Write))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
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
        (img@9@01 r)
        (p $Snap.unit (inv@8@01 r) size@4@01 rdAmount@5@01)
        $Perm.No)
      (pTaken@19@01 r))
    $Perm.No)
  
  :qid |quant-u-12|))))
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
    (and (img@18@01 r) (= r (loc<Ref> arr@3@01 (inv@17@01 r))))
    (=
      (-
        (ite
          (or (< (inv@17@01 r) 0) (>= (inv@17@01 r) size@4@01))
          $Perm.No
          $Perm.Write)
        (pTaken@19@01 r))
      $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@18@01 r) (= r (loc<Ref> arr@3@01 (inv@17@01 r))))
    (=
      (-
        (ite
          (or (< (inv@17@01 r) 0) (>= (inv@17@01 r) size@4@01))
          $Perm.No
          $Perm.Write)
        (pTaken@19@01 r))
      $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- testspec_skipping_indices2 ----------
(declare-const arr@20@01 Array_)
(declare-const size@21@01 Int)
(declare-const rdAmount@22@01 $Perm)
(declare-const arr@23@01 Array_)
(declare-const size@24@01 Int)
(declare-const rdAmount@25@01 $Perm)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] none < rdAmount
(assert (< $Perm.No rdAmount@25@01))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(assert (= ($Snap.first ($Snap.second $t@26@01)) $Snap.unit))
; [eval] rdAmount < write
(assert (< rdAmount@25@01 $Perm.Write))
(declare-const j@27@01 Int)
(push) ; 2
; [eval] loc(arr, j)
; [eval] p(j, size, rdAmount)
(push) ; 3
(assert (p%precondition $Snap.unit j@27@01 size@24@01 rdAmount@25@01))
(pop) ; 3
; Joined path conditions
(assert (p%precondition $Snap.unit j@27@01 size@24@01 rdAmount@25@01))
(pop) ; 2
(declare-fun inv@28@01 ($Ref) Int)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@27@01 Int)) (!
  (p%precondition $Snap.unit j@27@01 size@24@01 rdAmount@25@01)
  :pattern ((loc<Ref> arr@23@01 j@27@01))
  :qid |val-aux|)))
(push) ; 2
(assert (not (forall ((j@27@01 Int)) (!
  (=>
    (and
      (p%precondition $Snap.unit j@27@01 size@24@01 rdAmount@25@01)
      (=>
        (not (= (p $Snap.unit j@27@01 size@24@01 rdAmount@25@01) $Perm.No))
        (p%precondition $Snap.unit j@27@01 size@24@01 rdAmount@25@01)))
    (or
      (= (p $Snap.unit j@27@01 size@24@01 rdAmount@25@01) $Perm.No)
      (< $Perm.No (p $Snap.unit j@27@01 size@24@01 rdAmount@25@01))))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((j1@27@01 Int) (j2@27@01 Int)) (!
  (and
    (p%precondition $Snap.unit j1@27@01 size@24@01 rdAmount@25@01)
    (=>
      (< $Perm.No (p $Snap.unit j1@27@01 size@24@01 rdAmount@25@01))
      (p%precondition $Snap.unit j2@27@01 size@24@01 rdAmount@25@01)))
  
  :qid |val-rcvrInj|)))
(push) ; 2
(assert (not (forall ((j1@27@01 Int) (j2@27@01 Int)) (!
  (=>
    (and
      (< $Perm.No (p $Snap.unit j1@27@01 size@24@01 rdAmount@25@01))
      (< $Perm.No (p $Snap.unit j2@27@01 size@24@01 rdAmount@25@01))
      (= (loc<Ref> arr@23@01 j1@27@01) (loc<Ref> arr@23@01 j2@27@01)))
    (= j1@27@01 j2@27@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@27@01 Int)) (!
  (p%precondition $Snap.unit j@27@01 size@24@01 rdAmount@25@01)
  :pattern ((loc<Ref> arr@23@01 j@27@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (img@29@01 r)
    (p%precondition $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01))
  :pattern ((inv@28@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((j@27@01 Int)) (!
  (=>
    (< $Perm.No (p $Snap.unit j@27@01 size@24@01 rdAmount@25@01))
    (and
      (= (inv@28@01 (loc<Ref> arr@23@01 j@27@01)) j@27@01)
      (img@29@01 (loc<Ref> arr@23@01 j@27@01))))
  :pattern ((loc<Ref> arr@23@01 j@27@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (< $Perm.No (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01)))
    (= (loc<Ref> arr@23@01 (inv@28@01 r)) r))
  :pattern ((inv@28@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((j@27@01 Int)) (!
  (<= $Perm.No (p $Snap.unit j@27@01 size@24@01 rdAmount@25@01))
  :pattern ((loc<Ref> arr@23@01 j@27@01))
  :qid |val-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((j@27@01 Int)) (!
  (<= (p $Snap.unit j@27@01 size@24@01 rdAmount@25@01) $Perm.Write)
  :pattern ((loc<Ref> arr@23@01 j@27@01))
  :qid |val-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((j@27@01 Int)) (!
  (=>
    (< $Perm.No (p $Snap.unit j@27@01 size@24@01 rdAmount@25@01))
    (not (= (loc<Ref> arr@23@01 j@27@01) $Ref.null)))
  :pattern ((loc<Ref> arr@23@01 j@27@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall j: Int ::acc(loc(arr, j).val, (j < 0 || j >= size ?
;       none :
;       (j % 2 == 0 ? rdAmount : write))))
(declare-const j@30@01 Int)
(push) ; 3
; [eval] (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write))
; [eval] j < 0 || j >= size
; [eval] j < 0
(push) ; 4
; [then-branch: 4 | j@30@01 < 0 | live]
; [else-branch: 4 | !(j@30@01 < 0) | live]
(push) ; 5
; [then-branch: 4 | j@30@01 < 0]
(assert (< j@30@01 0))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(j@30@01 < 0)]
(assert (not (< j@30@01 0)))
; [eval] j >= size
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@30@01 0)) (< j@30@01 0)))
(push) ; 4
; [then-branch: 5 | j@30@01 < 0 || j@30@01 >= size@24@01 | live]
; [else-branch: 5 | !(j@30@01 < 0 || j@30@01 >= size@24@01) | live]
(push) ; 5
; [then-branch: 5 | j@30@01 < 0 || j@30@01 >= size@24@01]
(assert (or (< j@30@01 0) (>= j@30@01 size@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(j@30@01 < 0 || j@30@01 >= size@24@01)]
(assert (not (or (< j@30@01 0) (>= j@30@01 size@24@01))))
; [eval] (j % 2 == 0 ? rdAmount : write)
; [eval] j % 2 == 0
; [eval] j % 2
(push) ; 6
; [then-branch: 6 | j@30@01 % 2 == 0 | live]
; [else-branch: 6 | j@30@01 % 2 != 0 | live]
(push) ; 7
; [then-branch: 6 | j@30@01 % 2 == 0]
(assert (= (mod j@30@01 2) 0))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | j@30@01 % 2 != 0]
(assert (not (= (mod j@30@01 2) 0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= (mod j@30@01 2) 0)) (= (mod j@30@01 2) 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (or (< j@30@01 0) (>= j@30@01 size@24@01)))
  (and
    (not (or (< j@30@01 0) (>= j@30@01 size@24@01)))
    (or (not (= (mod j@30@01 2) 0)) (= (mod j@30@01 2) 0)))))
(assert (or
  (not (or (< j@30@01 0) (>= j@30@01 size@24@01)))
  (or (< j@30@01 0) (>= j@30@01 size@24@01))))
; [eval] loc(arr, j)
(pop) ; 3
(declare-fun inv@31@01 ($Ref) Int)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@30@01 Int)) (!
  (and
    (or (not (< j@30@01 0)) (< j@30@01 0))
    (=>
      (not (or (< j@30@01 0) (>= j@30@01 size@24@01)))
      (and
        (not (or (< j@30@01 0) (>= j@30@01 size@24@01)))
        (or (not (= (mod j@30@01 2) 0)) (= (mod j@30@01 2) 0))))
    (or
      (not (or (< j@30@01 0) (>= j@30@01 size@24@01)))
      (or (< j@30@01 0) (>= j@30@01 size@24@01))))
  :pattern ((loc<Ref> arr@23@01 j@30@01))
  :qid |val-aux|)))
(push) ; 3
(assert (not (forall ((j@30@01 Int)) (!
  (or
    (=
      (ite
        (or (< j@30@01 0) (>= j@30@01 size@24@01))
        $Perm.No
        (ite (= (mod j@30@01 2) 0) rdAmount@25@01 $Perm.Write))
      $Perm.No)
    (ite
      (or (< j@30@01 0) (>= j@30@01 size@24@01))
      false
      (ite (= (mod j@30@01 2) 0) (< $Perm.No rdAmount@25@01) true)))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@30@01 Int) (j2@30@01 Int)) (!
  (=>
    (and
      (ite
        (or (< j1@30@01 0) (>= j1@30@01 size@24@01))
        false
        (ite (= (mod j1@30@01 2) 0) (< $Perm.No rdAmount@25@01) true))
      (ite
        (or (< j2@30@01 0) (>= j2@30@01 size@24@01))
        false
        (ite (= (mod j2@30@01 2) 0) (< $Perm.No rdAmount@25@01) true))
      (= (loc<Ref> arr@23@01 j1@30@01) (loc<Ref> arr@23@01 j2@30@01)))
    (= j1@30@01 j2@30@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@30@01 Int)) (!
  (=>
    (ite
      (or (< j@30@01 0) (>= j@30@01 size@24@01))
      false
      (ite (= (mod j@30@01 2) 0) (< $Perm.No rdAmount@25@01) true))
    (and
      (= (inv@31@01 (loc<Ref> arr@23@01 j@30@01)) j@30@01)
      (img@32@01 (loc<Ref> arr@23@01 j@30@01))))
  :pattern ((loc<Ref> arr@23@01 j@30@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@01 r)
      (ite
        (or (< (inv@31@01 r) 0) (>= (inv@31@01 r) size@24@01))
        false
        (ite (= (mod (inv@31@01 r) 2) 0) (< $Perm.No rdAmount@25@01) true)))
    (= (loc<Ref> arr@23@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (and (img@32@01 r) (= r (loc<Ref> arr@23@01 (inv@31@01 r))))
    ($Perm.min
      (ite
        (img@29@01 r)
        (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01)
        $Perm.No)
      (ite
        (or (< (inv@31@01 r) 0) (>= (inv@31@01 r) size@24@01))
        $Perm.No
        (ite (= (mod (inv@31@01 r) 2) 0) rdAmount@25@01 $Perm.Write)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
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
        (img@29@01 r)
        (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01)
        $Perm.No)
      (pTaken@33@01 r))
    $Perm.No)
  
  :qid |quant-u-18|))))
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
    (and (img@32@01 r) (= r (loc<Ref> arr@23@01 (inv@31@01 r))))
    (=
      (-
        (ite
          (or (< (inv@31@01 r) 0) (>= (inv@31@01 r) size@24@01))
          $Perm.No
          (ite (= (mod (inv@31@01 r) 2) 0) rdAmount@25@01 $Perm.Write))
        (pTaken@33@01 r))
      $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@34@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (img@29@01 r)
      (< $Perm.No (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01))
      false)
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@26@01))) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second ($Snap.second $t@26@01))) r))
  :qid |qp.fvfValDef2|)))
; [exec]
; assert (forall j: Int ::
;     { p(j, size, rdAmount) }
;     (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write)) <=
;     p(j, size, rdAmount))
; [eval] (forall j: Int :: { p(j, size, rdAmount) } (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write)) <= p(j, size, rdAmount))
(declare-const j@35@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write)) <= p(j, size, rdAmount)
; [eval] (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write))
; [eval] j < 0 || j >= size
; [eval] j < 0
(push) ; 4
; [then-branch: 7 | j@35@01 < 0 | live]
; [else-branch: 7 | !(j@35@01 < 0) | live]
(push) ; 5
; [then-branch: 7 | j@35@01 < 0]
(assert (< j@35@01 0))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(j@35@01 < 0)]
(assert (not (< j@35@01 0)))
; [eval] j >= size
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@35@01 0)) (< j@35@01 0)))
(push) ; 4
; [then-branch: 8 | j@35@01 < 0 || j@35@01 >= size@24@01 | live]
; [else-branch: 8 | !(j@35@01 < 0 || j@35@01 >= size@24@01) | live]
(push) ; 5
; [then-branch: 8 | j@35@01 < 0 || j@35@01 >= size@24@01]
(assert (or (< j@35@01 0) (>= j@35@01 size@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(j@35@01 < 0 || j@35@01 >= size@24@01)]
(assert (not (or (< j@35@01 0) (>= j@35@01 size@24@01))))
; [eval] (j % 2 == 0 ? rdAmount : write)
; [eval] j % 2 == 0
; [eval] j % 2
(push) ; 6
; [then-branch: 9 | j@35@01 % 2 == 0 | live]
; [else-branch: 9 | j@35@01 % 2 != 0 | live]
(push) ; 7
; [then-branch: 9 | j@35@01 % 2 == 0]
(assert (= (mod j@35@01 2) 0))
(pop) ; 7
(push) ; 7
; [else-branch: 9 | j@35@01 % 2 != 0]
(assert (not (= (mod j@35@01 2) 0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= (mod j@35@01 2) 0)) (= (mod j@35@01 2) 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (or (< j@35@01 0) (>= j@35@01 size@24@01)))
  (and
    (not (or (< j@35@01 0) (>= j@35@01 size@24@01)))
    (or (not (= (mod j@35@01 2) 0)) (= (mod j@35@01 2) 0)))))
(assert (or
  (not (or (< j@35@01 0) (>= j@35@01 size@24@01)))
  (or (< j@35@01 0) (>= j@35@01 size@24@01))))
; [eval] p(j, size, rdAmount)
(push) ; 4
(assert (p%precondition $Snap.unit j@35@01 size@24@01 rdAmount@25@01))
(pop) ; 4
; Joined path conditions
(assert (p%precondition $Snap.unit j@35@01 size@24@01 rdAmount@25@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@35@01 Int)) (!
  (and
    (or (not (< j@35@01 0)) (< j@35@01 0))
    (=>
      (not (or (< j@35@01 0) (>= j@35@01 size@24@01)))
      (and
        (not (or (< j@35@01 0) (>= j@35@01 size@24@01)))
        (or (not (= (mod j@35@01 2) 0)) (= (mod j@35@01 2) 0))))
    (or
      (not (or (< j@35@01 0) (>= j@35@01 size@24@01)))
      (or (< j@35@01 0) (>= j@35@01 size@24@01)))
    (p%precondition $Snap.unit j@35@01 size@24@01 rdAmount@25@01))
  :pattern ((p%limited $Snap.unit j@35@01 size@24@01 rdAmount@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0302.vpr@46@12@46@113-aux|)))
(assert (forall ((j@35@01 Int)) (!
  (p%precondition $Snap.unit j@35@01 size@24@01 rdAmount@25@01)
  :pattern ((p%limited $Snap.unit j@35@01 size@24@01 rdAmount@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0302.vpr@46@12@46@113_precondition|)))
(push) ; 3
(assert (not (forall ((j@35@01 Int)) (!
  (=>
    (p%precondition $Snap.unit j@35@01 size@24@01 rdAmount@25@01)
    (<=
      (ite
        (or (< j@35@01 0) (>= j@35@01 size@24@01))
        $Perm.No
        (ite (= (mod j@35@01 2) 0) rdAmount@25@01 $Perm.Write))
      (p $Snap.unit j@35@01 size@24@01 rdAmount@25@01)))
  :pattern ((p%limited $Snap.unit j@35@01 size@24@01 rdAmount@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0302.vpr@46@12@46@113|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@35@01 Int)) (!
  (<=
    (ite
      (or (< j@35@01 0) (>= j@35@01 size@24@01))
      $Perm.No
      (ite (= (mod j@35@01 2) 0) rdAmount@25@01 $Perm.Write))
    (p $Snap.unit j@35@01 size@24@01 rdAmount@25@01))
  :pattern ((p%limited $Snap.unit j@35@01 size@24@01 rdAmount@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0302.vpr@46@12@46@113|)))
; [exec]
; assert (forall j: Int ::
;     { p(j, size, rdAmount) }
;     (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write)) >=
;     p(j, size, rdAmount))
; [eval] (forall j: Int :: { p(j, size, rdAmount) } (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write)) >= p(j, size, rdAmount))
(declare-const j@36@01 Int)
(push) ; 3
; [eval] (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write)) >= p(j, size, rdAmount)
; [eval] (j < 0 || j >= size ? none : (j % 2 == 0 ? rdAmount : write))
; [eval] j < 0 || j >= size
; [eval] j < 0
(push) ; 4
; [then-branch: 10 | j@36@01 < 0 | live]
; [else-branch: 10 | !(j@36@01 < 0) | live]
(push) ; 5
; [then-branch: 10 | j@36@01 < 0]
(assert (< j@36@01 0))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(j@36@01 < 0)]
(assert (not (< j@36@01 0)))
; [eval] j >= size
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@36@01 0)) (< j@36@01 0)))
(push) ; 4
; [then-branch: 11 | j@36@01 < 0 || j@36@01 >= size@24@01 | live]
; [else-branch: 11 | !(j@36@01 < 0 || j@36@01 >= size@24@01) | live]
(push) ; 5
; [then-branch: 11 | j@36@01 < 0 || j@36@01 >= size@24@01]
(assert (or (< j@36@01 0) (>= j@36@01 size@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(j@36@01 < 0 || j@36@01 >= size@24@01)]
(assert (not (or (< j@36@01 0) (>= j@36@01 size@24@01))))
; [eval] (j % 2 == 0 ? rdAmount : write)
; [eval] j % 2 == 0
; [eval] j % 2
(push) ; 6
; [then-branch: 12 | j@36@01 % 2 == 0 | live]
; [else-branch: 12 | j@36@01 % 2 != 0 | live]
(push) ; 7
; [then-branch: 12 | j@36@01 % 2 == 0]
(assert (= (mod j@36@01 2) 0))
(pop) ; 7
(push) ; 7
; [else-branch: 12 | j@36@01 % 2 != 0]
(assert (not (= (mod j@36@01 2) 0)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= (mod j@36@01 2) 0)) (= (mod j@36@01 2) 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (or (< j@36@01 0) (>= j@36@01 size@24@01)))
  (and
    (not (or (< j@36@01 0) (>= j@36@01 size@24@01)))
    (or (not (= (mod j@36@01 2) 0)) (= (mod j@36@01 2) 0)))))
(assert (or
  (not (or (< j@36@01 0) (>= j@36@01 size@24@01)))
  (or (< j@36@01 0) (>= j@36@01 size@24@01))))
; [eval] p(j, size, rdAmount)
(push) ; 4
(assert (p%precondition $Snap.unit j@36@01 size@24@01 rdAmount@25@01))
(pop) ; 4
; Joined path conditions
(assert (p%precondition $Snap.unit j@36@01 size@24@01 rdAmount@25@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@36@01 Int)) (!
  (and
    (or (not (< j@36@01 0)) (< j@36@01 0))
    (=>
      (not (or (< j@36@01 0) (>= j@36@01 size@24@01)))
      (and
        (not (or (< j@36@01 0) (>= j@36@01 size@24@01)))
        (or (not (= (mod j@36@01 2) 0)) (= (mod j@36@01 2) 0))))
    (or
      (not (or (< j@36@01 0) (>= j@36@01 size@24@01)))
      (or (< j@36@01 0) (>= j@36@01 size@24@01)))
    (p%precondition $Snap.unit j@36@01 size@24@01 rdAmount@25@01))
  :pattern ((p%limited $Snap.unit j@36@01 size@24@01 rdAmount@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0302.vpr@47@12@47@113-aux|)))
(assert (forall ((j@36@01 Int)) (!
  (p%precondition $Snap.unit j@36@01 size@24@01 rdAmount@25@01)
  :pattern ((p%limited $Snap.unit j@36@01 size@24@01 rdAmount@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0302.vpr@47@12@47@113_precondition|)))
(push) ; 3
(assert (not (forall ((j@36@01 Int)) (!
  (=>
    (p%precondition $Snap.unit j@36@01 size@24@01 rdAmount@25@01)
    (>=
      (ite
        (or (< j@36@01 0) (>= j@36@01 size@24@01))
        $Perm.No
        (ite (= (mod j@36@01 2) 0) rdAmount@25@01 $Perm.Write))
      (p $Snap.unit j@36@01 size@24@01 rdAmount@25@01)))
  :pattern ((p%limited $Snap.unit j@36@01 size@24@01 rdAmount@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0302.vpr@47@12@47@113|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@36@01 Int)) (!
  (>=
    (ite
      (or (< j@36@01 0) (>= j@36@01 size@24@01))
      $Perm.No
      (ite (= (mod j@36@01 2) 0) rdAmount@25@01 $Perm.Write))
    (p $Snap.unit j@36@01 size@24@01 rdAmount@25@01))
  :pattern ((p%limited $Snap.unit j@36@01 size@24@01 rdAmount@25@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0302.vpr@47@12@47@113|)))
; [exec]
; assert (forall j: Int ::acc(loc(arr, j).val, (j < 0 || j >= size ?
;       none :
;       write)))
(declare-const j@37@01 Int)
(push) ; 3
; [eval] (j < 0 || j >= size ? none : write)
; [eval] j < 0 || j >= size
; [eval] j < 0
(push) ; 4
; [then-branch: 13 | j@37@01 < 0 | live]
; [else-branch: 13 | !(j@37@01 < 0) | live]
(push) ; 5
; [then-branch: 13 | j@37@01 < 0]
(assert (< j@37@01 0))
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(j@37@01 < 0)]
(assert (not (< j@37@01 0)))
; [eval] j >= size
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@37@01 0)) (< j@37@01 0)))
(push) ; 4
; [then-branch: 14 | j@37@01 < 0 || j@37@01 >= size@24@01 | live]
; [else-branch: 14 | !(j@37@01 < 0 || j@37@01 >= size@24@01) | live]
(push) ; 5
; [then-branch: 14 | j@37@01 < 0 || j@37@01 >= size@24@01]
(assert (or (< j@37@01 0) (>= j@37@01 size@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(j@37@01 < 0 || j@37@01 >= size@24@01)]
(assert (not (or (< j@37@01 0) (>= j@37@01 size@24@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (or (< j@37@01 0) (>= j@37@01 size@24@01)))
  (or (< j@37@01 0) (>= j@37@01 size@24@01))))
; [eval] loc(arr, j)
(pop) ; 3
(declare-fun inv@38@01 ($Ref) Int)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@37@01 Int)) (!
  (and
    (or (not (< j@37@01 0)) (< j@37@01 0))
    (or
      (not (or (< j@37@01 0) (>= j@37@01 size@24@01)))
      (or (< j@37@01 0) (>= j@37@01 size@24@01))))
  :pattern ((loc<Ref> arr@23@01 j@37@01))
  :qid |val-aux|)))
(push) ; 3
(assert (not (forall ((j@37@01 Int)) (!
  (or
    (=
      (ite (or (< j@37@01 0) (>= j@37@01 size@24@01)) $Perm.No $Perm.Write)
      $Perm.No)
    (not (or (< j@37@01 0) (>= j@37@01 size@24@01))))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@37@01 Int) (j2@37@01 Int)) (!
  (=>
    (and
      (not (or (< j1@37@01 0) (>= j1@37@01 size@24@01)))
      (not (or (< j2@37@01 0) (>= j2@37@01 size@24@01)))
      (= (loc<Ref> arr@23@01 j1@37@01) (loc<Ref> arr@23@01 j2@37@01)))
    (= j1@37@01 j2@37@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@37@01 Int)) (!
  (=>
    (not (or (< j@37@01 0) (>= j@37@01 size@24@01)))
    (and
      (= (inv@38@01 (loc<Ref> arr@23@01 j@37@01)) j@37@01)
      (img@39@01 (loc<Ref> arr@23@01 j@37@01))))
  :pattern ((loc<Ref> arr@23@01 j@37@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@01 r)
      (not (or (< (inv@38@01 r) 0) (>= (inv@38@01 r) size@24@01))))
    (= (loc<Ref> arr@23@01 (inv@38@01 r)) r))
  :pattern ((inv@38@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and (img@39@01 r) (= r (loc<Ref> arr@23@01 (inv@38@01 r))))
    ($Perm.min
      (ite
        (img@29@01 r)
        (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01)
        $Perm.No)
      (ite
        (or (< (inv@38@01 r) 0) (>= (inv@38@01 r) size@24@01))
        $Perm.No
        $Perm.Write))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
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
        (img@29@01 r)
        (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01)
        $Perm.No)
      (pTaken@40@01 r))
    $Perm.No)
  
  :qid |quant-u-22|))))
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
    (and (img@39@01 r) (= r (loc<Ref> arr@23@01 (inv@38@01 r))))
    (=
      (-
        (ite
          (or (< (inv@38@01 r) 0) (>= (inv@38@01 r) size@24@01))
          $Perm.No
          $Perm.Write)
        (pTaken@40@01 r))
      $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@39@01 r) (= r (loc<Ref> arr@23@01 (inv@38@01 r))))
    (=
      (-
        (ite
          (or (< (inv@38@01 r) 0) (>= (inv@38@01 r) size@24@01))
          $Perm.No
          $Perm.Write)
        (pTaken@40@01 r))
      $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@41@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@41@01  $FPM) r)
    (ite
      (img@29@01 r)
      (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01)
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@41@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@41@01  $FPM) r) $Perm.Write)
  :pattern ((inv@28@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const j@42@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j < 0 || j >= size ? none : write)
; [eval] j < 0 || j >= size
; [eval] j < 0
(push) ; 4
; [then-branch: 15 | j@42@01 < 0 | live]
; [else-branch: 15 | !(j@42@01 < 0) | live]
(push) ; 5
; [then-branch: 15 | j@42@01 < 0]
(assert (< j@42@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 15 | !(j@42@01 < 0)]
(assert (not (< j@42@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] j >= size
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@42@01 0)) (< j@42@01 0)))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 16 | j@42@01 < 0 || j@42@01 >= size@24@01 | live]
; [else-branch: 16 | !(j@42@01 < 0 || j@42@01 >= size@24@01) | live]
(push) ; 5
; [then-branch: 16 | j@42@01 < 0 || j@42@01 >= size@24@01]
(assert (or (< j@42@01 0) (>= j@42@01 size@24@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 16 | !(j@42@01 < 0 || j@42@01 >= size@24@01)]
(assert (not (or (< j@42@01 0) (>= j@42@01 size@24@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (or (< j@42@01 0) (>= j@42@01 size@24@01)))
  (or (< j@42@01 0) (>= j@42@01 size@24@01))))
; [eval] loc(arr, j)
(pop) ; 3
(declare-fun inv@43@01 ($Ref) Int)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@42@01 Int)) (!
  (and
    (or (not (< j@42@01 0)) (< j@42@01 0))
    (or
      (not (or (< j@42@01 0) (>= j@42@01 size@24@01)))
      (or (< j@42@01 0) (>= j@42@01 size@24@01))))
  :pattern ((loc<Ref> arr@23@01 j@42@01))
  :qid |val-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@42@01 Int)) (!
  (or
    (=
      (ite (or (< j@42@01 0) (>= j@42@01 size@24@01)) $Perm.No $Perm.Write)
      $Perm.No)
    (not (or (< j@42@01 0) (>= j@42@01 size@24@01))))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@42@01 Int) (j2@42@01 Int)) (!
  (=>
    (and
      (not (or (< j1@42@01 0) (>= j1@42@01 size@24@01)))
      (not (or (< j2@42@01 0) (>= j2@42@01 size@24@01)))
      (= (loc<Ref> arr@23@01 j1@42@01) (loc<Ref> arr@23@01 j2@42@01)))
    (= j1@42@01 j2@42@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@42@01 Int)) (!
  (=>
    (not (or (< j@42@01 0) (>= j@42@01 size@24@01)))
    (and
      (= (inv@43@01 (loc<Ref> arr@23@01 j@42@01)) j@42@01)
      (img@44@01 (loc<Ref> arr@23@01 j@42@01))))
  :pattern ((loc<Ref> arr@23@01 j@42@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@44@01 r)
      (not (or (< (inv@43@01 r) 0) (>= (inv@43@01 r) size@24@01))))
    (= (loc<Ref> arr@23@01 (inv@43@01 r)) r))
  :pattern ((inv@43@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (and (img@44@01 r) (= r (loc<Ref> arr@23@01 (inv@43@01 r))))
    ($Perm.min
      (ite
        (img@29@01 r)
        (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01)
        $Perm.No)
      (ite
        (or (< (inv@43@01 r) 0) (>= (inv@43@01 r) size@24@01))
        $Perm.No
        $Perm.Write))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
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
        (img@29@01 r)
        (p $Snap.unit (inv@28@01 r) size@24@01 rdAmount@25@01)
        $Perm.No)
      (pTaken@45@01 r))
    $Perm.No)
  
  :qid |quant-u-26|))))
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
    (and (img@44@01 r) (= r (loc<Ref> arr@23@01 (inv@43@01 r))))
    (=
      (-
        (ite
          (or (< (inv@43@01 r) 0) (>= (inv@43@01 r) size@24@01))
          $Perm.No
          $Perm.Write)
        (pTaken@45@01 r))
      $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (= r (loc<Ref> arr@23@01 (inv@43@01 r))))
    (=
      (-
        (ite
          (or (< (inv@43@01 r) 0) (>= (inv@43@01 r) size@24@01))
          $Perm.No
          $Perm.Write)
        (pTaken@45@01 r))
      $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
