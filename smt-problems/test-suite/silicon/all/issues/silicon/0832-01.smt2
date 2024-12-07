(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:34
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0832.vpr
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
(declare-sort $FVF<int> 0)
(declare-sort $PSF<arrR> 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<arrR>To$Snap ($PSF<arrR>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<arrR> ($Snap) $PSF<arrR>)
(assert (forall ((x $PSF<arrR>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<arrR>($SortWrappers.$PSF<arrR>To$Snap x)))
    :pattern (($SortWrappers.$PSF<arrR>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<arrR>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<arrR>To$Snap($SortWrappers.$SnapTo$PSF<arrR> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<arrR> x))
    :qid |$Snap.$PSF<arrR>To$SnapTo$PSF<arrR>|
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
(declare-fun array_loc<Ref> (Array_ Int) $Ref)
(declare-fun alen<Int> (Array_) Int)
(declare-fun loc_inv_1<Array> ($Ref) Array_)
(declare-fun loc_inv_2<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [int: Int]
(declare-fun $FVF.domain_int ($FVF<int>) Set<$Ref>)
(declare-fun $FVF.lookup_int ($FVF<int> $Ref) Int)
(declare-fun $FVF.after_int ($FVF<int> $FVF<int>) Bool)
(declare-fun $FVF.loc_int (Int $Ref) Bool)
(declare-fun $FVF.perm_int ($FPM $Ref) $Perm)
(declare-const $fvfTOP_int $FVF<int>)
; /predicate_snap_functions_declarations.smt2 [arrR: Snap]
(declare-fun $PSF.domain_arrR ($PSF<arrR>) Set<$Snap>)
(declare-fun $PSF.lookup_arrR ($PSF<arrR> $Snap) $Snap)
(declare-fun $PSF.after_arrR ($PSF<arrR> $PSF<arrR>) Bool)
(declare-fun $PSF.loc_arrR ($Snap $Snap) Bool)
(declare-fun $PSF.perm_arrR ($PPM $Snap) $Perm)
(declare-const $psfTOP_arrR $PSF<arrR>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun aloc ($Snap Array_ Int) $Ref)
(declare-fun aloc%limited ($Snap Array_ Int) $Ref)
(declare-fun aloc%stateless (Array_ Int) Bool)
(declare-fun aloc%precondition ($Snap Array_ Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun arrR%trigger ($Snap Int Array_ Int) Bool)
(declare-fun arr%trigger ($Snap Array_ Int) Bool)
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
  (and
    (= (loc_inv_1<Array> (array_loc<Ref> a i)) a)
    (= (loc_inv_2<Int> (array_loc<Ref> a i)) i))
  :pattern ((array_loc<Ref> a i))
  )))
(assert (forall ((a Array_)) (!
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
; /predicate_snap_functions_axioms.smt2 [arrR: Snap]
(assert (forall ((vs $PSF<arrR>) (ws $PSF<arrR>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_arrR vs) ($PSF.domain_arrR ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_arrR vs))
            (= ($PSF.lookup_arrR vs x) ($PSF.lookup_arrR ws x)))
          :pattern (($PSF.lookup_arrR vs x) ($PSF.lookup_arrR ws x))
          :qid |qp.$PSF<arrR>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<arrR>To$Snap vs)
              ($SortWrappers.$PSF<arrR>To$Snap ws)
              )
    :qid |qp.$PSF<arrR>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_arrR pm s))
    :pattern (($PSF.perm_arrR pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_arrR f s) true)
    :pattern (($PSF.loc_arrR f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ---------- FUNCTION aloc----------
(declare-fun a@0@00 () Array_)
(declare-fun i@1@00 () Int)
(declare-fun result@2@00 () $Ref)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@1@00))
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] i < alen(a)
; [eval] alen(a)
(assert (< i@1@00 (alen<Int> a@0@00)))
(declare-const $t@3@00 $Snap)
(assert (= $t@3@00 ($Snap.combine ($Snap.first $t@3@00) ($Snap.second $t@3@00))))
(assert (= ($Snap.first $t@3@00) $Snap.unit))
; [eval] loc_inv_1(result) == a
; [eval] loc_inv_1(result)
(assert (= (loc_inv_1<Array> result@2@00) a@0@00))
(assert (= ($Snap.second $t@3@00) $Snap.unit))
; [eval] loc_inv_2(result) == i
; [eval] loc_inv_2(result)
(assert (= (loc_inv_2<Int> result@2@00) i@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (= (aloc%limited s@$ a@0@00 i@1@00) (aloc s@$ a@0@00 i@1@00))
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (aloc%stateless a@0@00 i@1@00)
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (let ((result@2@00 (aloc%limited s@$ a@0@00 i@1@00))) (=>
    (aloc%precondition s@$ a@0@00 i@1@00)
    (and
      (= (loc_inv_1<Array> result@2@00) a@0@00)
      (= (loc_inv_2<Int> result@2@00) i@1@00))))
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (let ((result@2@00 (aloc%limited s@$ a@0@00 i@1@00))) true)
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (let ((result@2@00 (aloc%limited s@$ a@0@00 i@1@00))) true)
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-4|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 i@1@00))
(assert (= ($Snap.second s@$) $Snap.unit))
(assert (< i@1@00 (alen<Int> a@0@00)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] array_loc(a, i)
(assert (= result@2@00 (array_loc<Ref> a@0@00 i@1@00)))
; [eval] loc_inv_1(result) == a
; [eval] loc_inv_1(result)
(set-option :timeout 0)
(push) ; 2
(assert (not (= (loc_inv_1<Array> result@2@00) a@0@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= (loc_inv_1<Array> result@2@00) a@0@00))
; [eval] loc_inv_2(result) == i
; [eval] loc_inv_2(result)
(push) ; 2
(assert (not (= (loc_inv_2<Int> result@2@00) i@1@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= (loc_inv_2<Int> result@2@00) i@1@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (=>
    (aloc%precondition s@$ a@0@00 i@1@00)
    (= (aloc s@$ a@0@00 i@1@00) (array_loc<Ref> a@0@00 i@1@00)))
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  true
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-6|)))
; ---------- arrR ----------
(declare-const x@4@00 Int)
(declare-const a@5@00 Array_)
(declare-const n@6@00 Int)
(push) ; 1
(declare-const $t@7@00 $Snap)
(assert (= $t@7@00 ($Snap.combine ($Snap.first $t@7@00) ($Snap.second $t@7@00))))
(assert (= ($Snap.first $t@7@00) $Snap.unit))
; [eval] alen(a) == n
; [eval] alen(a)
(assert (= (alen<Int> a@5@00) n@6@00))
(assert (=
  ($Snap.second $t@7@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@7@00))
    ($Snap.second ($Snap.second $t@7@00)))))
(assert (= ($Snap.first ($Snap.second $t@7@00)) $Snap.unit))
; [eval] 0 <= x
(assert (<= 0 x@4@00))
(assert (=
  ($Snap.second ($Snap.second $t@7@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@7@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@7@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@7@00))) $Snap.unit))
; [eval] x < n
(assert (< x@4@00 n@6@00))
; [eval] aloc(a, x)
(push) ; 2
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 3
(assert (not (< x@4@00 (alen<Int> a@5@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< x@4@00 (alen<Int> a@5@00)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@5@00 x@4@00))
(pop) ; 2
; Joined path conditions
(assert (and
  (< x@4@00 (alen<Int> a@5@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@5@00 x@4@00)))
(assert (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) a@5@00 x@4@00) $Ref.null)))
(pop) ; 1
; ---------- arr ----------
(declare-const a@8@00 Array_)
(declare-const n@9@00 Int)
(push) ; 1
(declare-const $t@10@00 $Snap)
(assert (= $t@10@00 ($Snap.combine ($Snap.first $t@10@00) ($Snap.second $t@10@00))))
(assert (= ($Snap.first $t@10@00) $Snap.unit))
; [eval] alen(a) == n
; [eval] alen(a)
(assert (= (alen<Int> a@8@00) n@9@00))
(declare-const i@11@00 Int)
(push) ; 2
; [eval] 0 <= i && i < alen(a)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@11@00) | live]
; [else-branch: 0 | 0 <= i@11@00 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@11@00)]
(assert (not (<= 0 i@11@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@11@00]
(assert (<= 0 i@11@00))
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@11@00) (not (<= 0 i@11@00))))
(assert (and (<= 0 i@11@00) (< i@11@00 (alen<Int> a@8@00))))
; [eval] aloc(a, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))
(pop) ; 3
; Joined path conditions
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))
(pop) ; 2
(declare-fun inv@12@00 ($Ref) Int)
(declare-fun img@13@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (alen<Int> a@8@00)))
    (and
      (or (<= 0 i@11@00) (not (<= 0 i@11@00)))
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00)))
  :pattern ((aloc%limited ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))
  :qid |int-aux|)))
; Check receiver injectivity
(assert (forall ((i1@11@00 Int) (i2@11@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@11@00) (< i1@11@00 (alen<Int> a@8@00)))
      (and (<= 0 i2@11@00) (< i2@11@00 (alen<Int> a@8@00))))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i1@11@00)
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i2@11@00)))
  
  :qid |int-rcvrInj|)))
(push) ; 2
(assert (not (forall ((i1@11@00 Int) (i2@11@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@11@00) (< i1@11@00 (alen<Int> a@8@00)))
      (and (<= 0 i2@11@00) (< i2@11@00 (alen<Int> a@8@00)))
      (=
        (aloc ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i1@11@00)
        (aloc ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i2@11@00)))
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
    (and (<= 0 i@11@00) (< i@11@00 (alen<Int> a@8@00)))
    (and
      (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00)
      (=>
        (=
          (inv@12@00 (aloc ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))
          i@11@00)
        (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))))
  :pattern ((aloc%limited ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 r)
      (and (<= 0 (inv@12@00 r)) (< (inv@12@00 r) (alen<Int> a@8@00))))
    (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) a@8@00 (inv@12@00 r)))
  :pattern ((inv@12@00 r))
  :qid |int-fctOfInv|)))
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (alen<Int> a@8@00)))
    (and
      (=
        (inv@12@00 (aloc ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))
        i@11@00)
      (img@13@00 (aloc ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))))
  :pattern ((aloc%limited ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@00 r)
      (and (<= 0 (inv@12@00 r)) (< (inv@12@00 r) (alen<Int> a@8@00))))
    (= (aloc ($Snap.combine $Snap.unit $Snap.unit) a@8@00 (inv@12@00 r)) r))
  :pattern ((inv@12@00 r))
  :qid |int-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@11@00 Int)) (!
  (=>
    (and (<= 0 i@11@00) (< i@11@00 (alen<Int> a@8@00)))
    (not
      (= (aloc ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00) $Ref.null)))
  :pattern ((aloc%limited ($Snap.combine $Snap.unit $Snap.unit) a@8@00 i@11@00))
  :qid |int-permImpliesNonNull|)))
(pop) ; 1
