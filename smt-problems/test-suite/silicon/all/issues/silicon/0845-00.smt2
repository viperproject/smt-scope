(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:58:45
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0845.vpr
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
(declare-sort $PSF<hide0> 0)
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
(declare-fun $SortWrappers.$PSF<hide0>To$Snap ($PSF<hide0>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<hide0> ($Snap) $PSF<hide0>)
(assert (forall ((x $PSF<hide0>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<hide0>($SortWrappers.$PSF<hide0>To$Snap x)))
    :pattern (($SortWrappers.$PSF<hide0>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<hide0>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<hide0>To$Snap($SortWrappers.$SnapTo$PSF<hide0> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<hide0> x))
    :qid |$Snap.$PSF<hide0>To$SnapTo$PSF<hide0>|
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
; /predicate_snap_functions_declarations.smt2 [hide0: Snap]
(declare-fun $PSF.domain_hide0 ($PSF<hide0>) Set<$Snap>)
(declare-fun $PSF.lookup_hide0 ($PSF<hide0> $Snap) $Snap)
(declare-fun $PSF.after_hide0 ($PSF<hide0> $PSF<hide0>) Bool)
(declare-fun $PSF.loc_hide0 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_hide0 ($PPM $Snap) $Perm)
(declare-const $psfTOP_hide0 $PSF<hide0>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun aloc ($Snap Array_ Int) $Ref)
(declare-fun aloc%limited ($Snap Array_ Int) $Ref)
(declare-fun aloc%stateless (Array_ Int) Bool)
(declare-fun aloc%precondition ($Snap Array_ Int) Bool)
(declare-fun get0 ($Snap Array_ Int Int) Int)
(declare-fun get0%limited ($Snap Array_ Int Int) Int)
(declare-fun get0%stateless (Array_ Int Int) Bool)
(declare-fun get0%precondition ($Snap Array_ Int Int) Bool)
(declare-fun get1 ($Snap Array_ Int Int) Int)
(declare-fun get1%limited ($Snap Array_ Int Int) Int)
(declare-fun get1%stateless (Array_ Int Int) Bool)
(declare-fun get1%precondition ($Snap Array_ Int Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun hide0%trigger ($Snap Array_ Int Int) Bool)
(declare-fun hide1%trigger ($Snap Array_ Int Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [hide0: Snap]
(assert (forall ((vs $PSF<hide0>) (ws $PSF<hide0>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_hide0 vs) ($PSF.domain_hide0 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_hide0 vs))
            (= ($PSF.lookup_hide0 vs x) ($PSF.lookup_hide0 ws x)))
          :pattern (($PSF.lookup_hide0 vs x) ($PSF.lookup_hide0 ws x))
          :qid |qp.$PSF<hide0>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<hide0>To$Snap vs)
              ($SortWrappers.$PSF<hide0>To$Snap ws)
              )
    :qid |qp.$PSF<hide0>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_hide0 pm s))
    :pattern (($PSF.perm_hide0 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_hide0 f s) true)
    :pattern (($PSF.loc_hide0 f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@13@00 () $Perm)
(declare-fun $k@15@00 () $Perm)
(declare-fun $k@16@00 () $Perm)
(declare-fun $k@17@00 () $Perm)
(declare-fun $k@18@00 () $Perm)
(declare-fun $k@19@00 () $Perm)
(declare-fun $k@20@00 () $Perm)
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
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (let ((result@2@00 (aloc%limited s@$ a@0@00 i@1@00))) true)
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (let ((result@2@00 (aloc%limited s@$ a@0@00 i@1@00))) true)
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (=>
    (aloc%precondition s@$ a@0@00 i@1@00)
    (= (aloc s@$ a@0@00 i@1@00) (array_loc<Ref> a@0@00 i@1@00)))
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  true
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@3@00 Array_) (n@4@00 Int) (i@5@00 Int)) (!
  (= (get0%limited s@$ x@3@00 n@4@00 i@5@00) (get0 s@$ x@3@00 n@4@00 i@5@00))
  :pattern ((get0 s@$ x@3@00 n@4@00 i@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@3@00 Array_) (n@4@00 Int) (i@5@00 Int)) (!
  (get0%stateless x@3@00 n@4@00 i@5@00)
  :pattern ((get0%limited s@$ x@3@00 n@4@00 i@5@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@3@00 Array_) (n@4@00 Int) (i@5@00 Int)) (!
  (let ((result@6@00 (get0%limited s@$ x@3@00 n@4@00 i@5@00))) (=>
    (get0%precondition s@$ x@3@00 n@4@00 i@5@00)
    (=
      result@6@00
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((get0%limited s@$ x@3@00 n@4@00 i@5@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (x@3@00 Array_) (n@4@00 Int) (i@5@00 Int)) (!
  (let ((result@6@00 (get0%limited s@$ x@3@00 n@4@00 i@5@00))) true)
  :pattern ((get0%limited s@$ x@3@00 n@4@00 i@5@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (x@3@00 Array_) (n@4@00 Int) (i@5@00 Int)) (!
  (=>
    (get0%precondition s@$ x@3@00 n@4@00 i@5@00)
    (=
      (get0 s@$ x@3@00 n@4@00 i@5@00)
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((get0 s@$ x@3@00 n@4@00 i@5@00))
  :pattern ((get0%stateless x@3@00 n@4@00 i@5@00) (hide0%trigger ($Snap.second ($Snap.second s@$)) x@3@00 n@4@00 i@5@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (x@3@00 Array_) (n@4@00 Int) (i@5@00 Int)) (!
  true
  :pattern ((get0 s@$ x@3@00 n@4@00 i@5@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (x@7@00 Array_) (n@8@00 Int) (i@9@00 Int)) (!
  (= (get1%limited s@$ x@7@00 n@8@00 i@9@00) (get1 s@$ x@7@00 n@8@00 i@9@00))
  :pattern ((get1 s@$ x@7@00 n@8@00 i@9@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@7@00 Array_) (n@8@00 Int) (i@9@00 Int)) (!
  (get1%stateless x@7@00 n@8@00 i@9@00)
  :pattern ((get1%limited s@$ x@7@00 n@8@00 i@9@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@7@00 Array_) (n@8@00 Int) (i@9@00 Int)) (!
  (let ((result@10@00 (get1%limited s@$ x@7@00 n@8@00 i@9@00))) (and
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@15@00)
    ($Perm.isReadVar $k@16@00)
    (=>
      (get1%precondition s@$ x@7@00 n@8@00 i@9@00)
      (=
        result@10@00
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  :pattern ((get1%limited s@$ x@7@00 n@8@00 i@9@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (x@7@00 Array_) (n@8@00 Int) (i@9@00 Int)) (!
  (let ((result@10@00 (get1%limited s@$ x@7@00 n@8@00 i@9@00))) true)
  :pattern ((get1%limited s@$ x@7@00 n@8@00 i@9@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (x@7@00 Array_) (n@8@00 Int) (i@9@00 Int)) (!
  (and
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@17@00)
    ($Perm.isReadVar $k@18@00)
    ($Perm.isReadVar $k@19@00)
    ($Perm.isReadVar $k@20@00)
    (=>
      (get1%precondition s@$ x@7@00 n@8@00 i@9@00)
      (=
        (get1 s@$ x@7@00 n@8@00 i@9@00)
        ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((get1 s@$ x@7@00 n@8@00 i@9@00))
  :pattern ((get1%stateless x@7@00 n@8@00 i@9@00) (hide1%trigger ($Snap.second ($Snap.second s@$)) x@7@00 n@8@00 i@9@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (x@7@00 Array_) (n@8@00 Int) (i@9@00 Int)) (!
  true
  :pattern ((get1 s@$ x@7@00 n@8@00 i@9@00))
  :qid |quant-u-18|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- main1 ----------
(declare-const tid@0@01 Int)
(declare-const n@1@01 Int)
(declare-const x0@2@01 Array_)
(declare-const x1@3@01 Array_)
(declare-const tid@4@01 Int)
(declare-const n@5@01 Int)
(declare-const x0@6@01 Array_)
(declare-const x1@7@01 Array_)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] 10 < n
(assert (< 10 n@5@01))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] alen(x0) == n
; [eval] alen(x0)
(assert (= (alen<Int> x0@6@01) n@5@01))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(declare-const i@9@01 Int)
(push) ; 2
; [eval] 0 <= i && i < n
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@9@01) | live]
; [else-branch: 0 | 0 <= i@9@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@9@01)]
(assert (not (<= 0 i@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@9@01]
(assert (<= 0 i@9@01))
; [eval] i < n
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
(assert (and (<= 0 i@9@01) (< i@9@01 n@5@01)))
(declare-const sm@10@01 $PSF<hide0>)
(declare-const s@11@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@12@01 (Array_ Int Int) Int)
(declare-fun img@13@01 (Array_ Int Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 n@5@01))
    (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
  :pattern (($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap i@9@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap i@9@01))))
  :qid |hide0-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@9@01) (< i1@9@01 n@5@01))
      (and (<= 0 i2@9@01) (< i2@9@01 n@5@01))
      (= i1@9@01 i2@9@01))
    (= i1@9@01 i2@9@01))
  
  :qid |hide0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 n@5@01))
    (and
      (= (inv@12@01 x0@6@01 n@5@01 i@9@01) i@9@01)
      (img@13@01 x0@6@01 n@5@01 i@9@01)))
  :pattern (($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap i@9@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap i@9@01))))
  :qid |quant-u-20|)))
(assert (forall ((x Array_) (n Int) (i Int)) (!
  (=>
    (and
      (img@13@01 x n i)
      (and (<= 0 (inv@12@01 x n i)) (< (inv@12@01 x n i) n@5@01)))
    (and (= x0@6@01 x) (= n@5@01 n) (= (inv@12@01 x n i) i)))
  :pattern ((inv@12@01 x n i))
  :qid |hide0-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@14@01 $PSF<hide0>)
(declare-const s@15@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (and
      (img@13@01 ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second s@15@01)))
      (and
        (<=
          0
          (inv@12@01 ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second s@15@01))))
        (<
          (inv@12@01 ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second s@15@01)))
          n@5@01)))
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) s@15@01)
        ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) s@15@01))))
  :pattern (($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) s@15@01))
  :pattern (($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) s@15@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) s@15@01) s@15@01)
  :pattern (($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) s@15@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((x Array_) (n Int) (i Int)) (!
  (=>
    (and (<= 0 (inv@12@01 x n i)) (< (inv@12@01 x n i) n@5@01))
    ($PSF.loc_hide0 ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap x)
        ($SortWrappers.IntTo$Snap n))
      ($SortWrappers.IntTo$Snap i))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap x)
        ($SortWrappers.IntTo$Snap n))
      ($SortWrappers.IntTo$Snap i))))
  :pattern ((inv@12@01 x n i))
  :qid |quant-u-21|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] (forall j: Int :: { get0(x0, n, j) } 0 <= j && j < n ==> get0(x0, n, j) == 0)
(declare-const j@16@01 Int)
(push) ; 2
; [eval] 0 <= j && j < n ==> get0(x0, n, j) == 0
; [eval] 0 <= j && j < n
; [eval] 0 <= j
(push) ; 3
; [then-branch: 1 | !(0 <= j@16@01) | live]
; [else-branch: 1 | 0 <= j@16@01 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= j@16@01)]
(assert (not (<= 0 j@16@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= j@16@01]
(assert (<= 0 j@16@01))
; [eval] j < n
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@16@01) (not (<= 0 j@16@01))))
(push) ; 3
; [then-branch: 2 | 0 <= j@16@01 && j@16@01 < n@5@01 | live]
; [else-branch: 2 | !(0 <= j@16@01 && j@16@01 < n@5@01) | live]
(push) ; 4
; [then-branch: 2 | 0 <= j@16@01 && j@16@01 < n@5@01]
(assert (and (<= 0 j@16@01) (< j@16@01 n@5@01)))
; [eval] get0(x0, n, j) == 0
; [eval] get0(x0, n, j)
(push) ; 5
; [eval] 0 <= i
; [eval] i < n
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($PSF.loc_hide0 ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap x0@6@01)
    ($SortWrappers.IntTo$Snap n@5@01))
  ($SortWrappers.IntTo$Snap j@16@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap x0@6@01)
    ($SortWrappers.IntTo$Snap n@5@01))
  ($SortWrappers.IntTo$Snap j@16@01))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((x Array_) (n Int) (i Int) (j@16@01 Int)) $Perm
  (ite
    (and (= x x0@6@01) (= n n@5@01) (= i j@16@01))
    ($Perm.min
      (ite
        (and
          (img@13@01 x n i)
          (and (<= 0 (inv@12@01 x n i)) (< (inv@12@01 x n i) n@5@01)))
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
(assert (not (forall ((x Array_) (n Int) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@13@01 x n i)
          (and (<= 0 (inv@12@01 x n i)) (< (inv@12@01 x n i) n@5@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@17@01 x n i j@16@01))
    $Perm.No)
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((x Array_) (n Int) (i Int)) (!
  (= (pTaken@17@01 x n i j@16@01) $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((x Array_) (n Int) (i Int)) (!
  (=>
    (and (= x x0@6@01) (= n n@5@01) (= i j@16@01))
    (= (- $Perm.Write (pTaken@17@01 x n i j@16@01)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@13@01 x0@6@01 n@5@01 j@16@01)
    (and
      (<= 0 (inv@12@01 x0@6@01 n@5@01 j@16@01))
      (< (inv@12@01 x0@6@01 n@5@01 j@16@01) n@5@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap j@16@01))
        $Snap.unit))
    (=
      ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap j@16@01)))
      ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap j@16@01)))))))
(assert ($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap x0@6@01)
    ($SortWrappers.IntTo$Snap n@5@01))
  ($SortWrappers.IntTo$Snap j@16@01))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap x0@6@01)
    ($SortWrappers.IntTo$Snap n@5@01))
  ($SortWrappers.IntTo$Snap j@16@01))))
(assert (get0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap x0@6@01)
        ($SortWrappers.IntTo$Snap n@5@01))
      ($SortWrappers.IntTo$Snap j@16@01))))) x0@6@01 n@5@01 j@16@01))
(pop) ; 5
; Joined path conditions
(assert (and
  ($PSF.loc_hide0 ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap j@16@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap j@16@01)))
  (=>
    (and
      (img@13@01 x0@6@01 n@5@01 j@16@01)
      (and
        (<= 0 (inv@12@01 x0@6@01 n@5@01 j@16@01))
        (< (inv@12@01 x0@6@01 n@5@01 j@16@01) n@5@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.Array_To$Snap x0@6@01)
              ($SortWrappers.IntTo$Snap n@5@01))
            ($SortWrappers.IntTo$Snap j@16@01))
          $Snap.unit))
      (=
        ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap j@16@01)))
        ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap j@16@01))))))
  ($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap j@16@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap j@16@01)))
  (get0%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap j@16@01))))) x0@6@01 n@5@01 j@16@01)))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 2 | !(0 <= j@16@01 && j@16@01 < n@5@01)]
(assert (not (and (<= 0 j@16@01) (< j@16@01 n@5@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 j@16@01) (< j@16@01 n@5@01))
  (and
    (<= 0 j@16@01)
    (< j@16@01 n@5@01)
    ($PSF.loc_hide0 ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap x0@6@01)
        ($SortWrappers.IntTo$Snap n@5@01))
      ($SortWrappers.IntTo$Snap j@16@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap x0@6@01)
        ($SortWrappers.IntTo$Snap n@5@01))
      ($SortWrappers.IntTo$Snap j@16@01)))
    (=>
      (and
        (img@13@01 x0@6@01 n@5@01 j@16@01)
        (and
          (<= 0 (inv@12@01 x0@6@01 n@5@01 j@16@01))
          (< (inv@12@01 x0@6@01 n@5@01 j@16@01) n@5@01)))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.Array_To$Snap x0@6@01)
                ($SortWrappers.IntTo$Snap n@5@01))
              ($SortWrappers.IntTo$Snap j@16@01))
            $Snap.unit))
        (=
          ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
            ($Snap.combine
              ($SortWrappers.Array_To$Snap x0@6@01)
              ($SortWrappers.IntTo$Snap n@5@01))
            ($SortWrappers.IntTo$Snap j@16@01)))
          ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
            ($Snap.combine
              ($SortWrappers.Array_To$Snap x0@6@01)
              ($SortWrappers.IntTo$Snap n@5@01))
            ($SortWrappers.IntTo$Snap j@16@01))))))
    ($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap x0@6@01)
        ($SortWrappers.IntTo$Snap n@5@01))
      ($SortWrappers.IntTo$Snap j@16@01))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap x0@6@01)
        ($SortWrappers.IntTo$Snap n@5@01))
      ($SortWrappers.IntTo$Snap j@16@01)))
    (get0%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap j@16@01))))) x0@6@01 n@5@01 j@16@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 j@16@01) (< j@16@01 n@5@01)))
  (and (<= 0 j@16@01) (< j@16@01 n@5@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@16@01 Int)) (!
  (and
    (or (<= 0 j@16@01) (not (<= 0 j@16@01)))
    (=>
      (and (<= 0 j@16@01) (< j@16@01 n@5@01))
      (and
        (<= 0 j@16@01)
        (< j@16@01 n@5@01)
        ($PSF.loc_hide0 ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap j@16@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap j@16@01)))
        (=>
          (and
            (img@13@01 x0@6@01 n@5@01 j@16@01)
            (and
              (<= 0 (inv@12@01 x0@6@01 n@5@01 j@16@01))
              (< (inv@12@01 x0@6@01 n@5@01 j@16@01) n@5@01)))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.Array_To$Snap x0@6@01)
                    ($SortWrappers.IntTo$Snap n@5@01))
                  ($SortWrappers.IntTo$Snap j@16@01))
                $Snap.unit))
            (=
              ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.Array_To$Snap x0@6@01)
                  ($SortWrappers.IntTo$Snap n@5@01))
                ($SortWrappers.IntTo$Snap j@16@01)))
              ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.Array_To$Snap x0@6@01)
                  ($SortWrappers.IntTo$Snap n@5@01))
                ($SortWrappers.IntTo$Snap j@16@01))))))
        ($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap j@16@01))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap j@16@01)))
        (get0%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
              ($Snap.combine
                ($SortWrappers.Array_To$Snap x0@6@01)
                ($SortWrappers.IntTo$Snap n@5@01))
              ($SortWrappers.IntTo$Snap j@16@01))))) x0@6@01 n@5@01 j@16@01)))
    (or
      (not (and (<= 0 j@16@01) (< j@16@01 n@5@01)))
      (and (<= 0 j@16@01) (< j@16@01 n@5@01))))
  :pattern ((get0%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap j@16@01))))) x0@6@01 n@5@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0845.vpr@10@13@13@30-aux|)))
(assert (forall ((j@16@01 Int)) (!
  (=>
    (and (<= 0 j@16@01) (< j@16@01 n@5@01))
    (=
      (get0 ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
            ($Snap.combine
              ($SortWrappers.Array_To$Snap x0@6@01)
              ($SortWrappers.IntTo$Snap n@5@01))
            ($SortWrappers.IntTo$Snap j@16@01))))) x0@6@01 n@5@01 j@16@01)
      0))
  :pattern ((get0%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap j@16@01))))) x0@6@01 n@5@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0845.vpr@10@13@13@30|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert get0(x0, n, 0) == 0
; [eval] get0(x0, n, 0) == 0
; [eval] get0(x0, n, 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < n
(push) ; 4
(assert (not (< 0 n@5@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< 0 n@5@01))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert ($PSF.loc_hide0 ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap x0@6@01)
    ($SortWrappers.IntTo$Snap n@5@01))
  ($SortWrappers.IntTo$Snap 0))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap x0@6@01)
    ($SortWrappers.IntTo$Snap n@5@01))
  ($SortWrappers.IntTo$Snap 0))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((x Array_) (n Int) (i Int)) $Perm
  (ite
    (and (= x x0@6@01) (= n n@5@01) (= i 0))
    ($Perm.min
      (ite
        (and
          (img@13@01 x n i)
          (and (<= 0 (inv@12@01 x n i)) (< (inv@12@01 x n i) n@5@01)))
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
(assert (not (forall ((x Array_) (n Int) (i Int)) (!
  (=
    (-
      (ite
        (and
          (img@13@01 x n i)
          (and (<= 0 (inv@12@01 x n i)) (< (inv@12@01 x n i) n@5@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@18@01 x n i))
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
(assert (not (forall ((x Array_) (n Int) (i Int)) (!
  (= (pTaken@18@01 x n i) $Perm.No)
  
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
(assert (not (forall ((x Array_) (n Int) (i Int)) (!
  (=>
    (and (= x x0@6@01) (= n n@5@01) (= i 0))
    (= (- $Perm.Write (pTaken@18@01 x n i)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@13@01 x0@6@01 n@5@01 0)
    (and
      (<= 0 (inv@12@01 x0@6@01 n@5@01 0))
      (< (inv@12@01 x0@6@01 n@5@01 0) n@5@01)))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap 0))
        $Snap.unit))
    (=
      ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap 0)))
      ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap 0)))))))
(assert ($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap x0@6@01)
    ($SortWrappers.IntTo$Snap n@5@01))
  ($SortWrappers.IntTo$Snap 0))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Array_To$Snap x0@6@01)
    ($SortWrappers.IntTo$Snap n@5@01))
  ($SortWrappers.IntTo$Snap 0))))
(assert (get0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Array_To$Snap x0@6@01)
        ($SortWrappers.IntTo$Snap n@5@01))
      ($SortWrappers.IntTo$Snap 0))))) x0@6@01 n@5@01 0))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 n@5@01)
  ($PSF.loc_hide0 ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap 0))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap 0)))
  (=>
    (and
      (img@13@01 x0@6@01 n@5@01 0)
      (and
        (<= 0 (inv@12@01 x0@6@01 n@5@01 0))
        (< (inv@12@01 x0@6@01 n@5@01 0) n@5@01)))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.Array_To$Snap x0@6@01)
              ($SortWrappers.IntTo$Snap n@5@01))
            ($SortWrappers.IntTo$Snap 0))
          $Snap.unit))
      (=
        ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap 0)))
        ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Array_To$Snap x0@6@01)
            ($SortWrappers.IntTo$Snap n@5@01))
          ($SortWrappers.IntTo$Snap 0))))))
  ($PSF.loc_hide0 ($PSF.lookup_hide0 ($SortWrappers.$SnapTo$PSF<hide0> ($Snap.first ($Snap.second ($Snap.second $t@8@01)))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap 0))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Array_To$Snap x0@6@01)
      ($SortWrappers.IntTo$Snap n@5@01))
    ($SortWrappers.IntTo$Snap 0)))
  (get0%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap 0))))) x0@6@01 n@5@01 0)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (get0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap 0))))) x0@6@01 n@5@01 0)
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($PSF.lookup_hide0 (as sm@14@01  $PSF<hide0>) ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Array_To$Snap x0@6@01)
          ($SortWrappers.IntTo$Snap n@5@01))
        ($SortWrappers.IntTo$Snap 0))))) x0@6@01 n@5@01 0)
  0))
(pop) ; 2
(pop) ; 1
; ---------- aloc_pres_termination_proof ----------
(declare-const a@19@01 Array_)
(declare-const i@20@01 Int)
(declare-const a@21@01 Array_)
(declare-const i@22@01 Int)
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
; var $condInEx: Bool
(declare-const $condInEx@23@01 Bool)
; [exec]
; var b: Bool
(declare-const b@24@01 Bool)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@24@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b@24@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | b@24@01 | live]
; [else-branch: 3 | !(b@24@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | b@24@01]
(assert b@24@01)
; [exec]
; inhale false
(pop) ; 3
(push) ; 3
; [else-branch: 3 | !(b@24@01)]
(assert (not b@24@01))
(pop) ; 3
; [eval] !b
(push) ; 3
(set-option :timeout 10)
(assert (not b@24@01))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b@24@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | !(b@24@01) | live]
; [else-branch: 4 | b@24@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | !(b@24@01)]
(assert (not b@24@01))
; [exec]
; inhale 0 <= i
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@22@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 4 | b@24@01]
(assert b@24@01)
(pop) ; 3
(pop) ; 2
(pop) ; 1
