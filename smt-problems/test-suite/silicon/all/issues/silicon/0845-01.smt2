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
(declare-const $t@11@00 $Snap)
(assert (= $t@11@00 ($Snap.combine ($Snap.first $t@11@00) ($Snap.second $t@11@00))))
(assert (= ($Snap.first $t@11@00) $Snap.unit))
; [eval] loc_inv_1(result) == a
; [eval] loc_inv_1(result)
(assert (= (loc_inv_1<Array> result@2@00) a@0@00))
(assert (= ($Snap.second $t@11@00) $Snap.unit))
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
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (let ((result@2@00 (aloc%limited s@$ a@0@00 i@1@00))) true)
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  (let ((result@2@00 (aloc%limited s@$ a@0@00 i@1@00))) true)
  :pattern ((aloc%limited s@$ a@0@00 i@1@00))
  :qid |quant-u-8|)))
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
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (a@0@00 Array_) (i@1@00 Int)) (!
  true
  :pattern ((aloc s@$ a@0@00 i@1@00))
  :qid |quant-u-10|)))
; ---------- FUNCTION get0----------
(declare-fun x@3@00 () Array_)
(declare-fun n@4@00 () Int)
(declare-fun i@5@00 () Int)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@5@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] i < n
(assert (< i@5@00 n@4@00))
(declare-const $t@12@00 $Snap)
(assert (= $t@12@00 $Snap.unit))
; [eval] result == (unfolding acc(hide0(x, n, i), write) in aloc(x, i).int)
; [eval] (unfolding acc(hide0(x, n, i), write) in aloc(x, i).int)
(push) ; 2
(assert (hide0%trigger ($Snap.second ($Snap.second s@$)) x@3@00 n@4@00 i@5@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] n > 0
(assert (> n@4@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] i >= 0
(assert (>= i@5@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] i < n
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] alen(x) == n
; [eval] alen(x)
(assert (= (alen<Int> x@3@00) n@4@00))
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 4
(assert (not (< i@5@00 (alen<Int> x@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< i@5@00 (alen<Int> x@3@00)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00))
(pop) ; 3
; Joined path conditions
(assert (and
  (< i@5@00 (alen<Int> x@3@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00)))
(assert (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00) $Ref.null)))
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(pop) ; 2
; Joined path conditions
(assert (and
  (hide0%trigger ($Snap.second ($Snap.second s@$)) x@3@00 n@4@00 i@5@00)
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (> n@4@00 0)
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (>= i@5@00 0)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (= (alen<Int> x@3@00) n@4@00)
  (< i@5@00 (alen<Int> x@3@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00)
  (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00) $Ref.null))))
(assert (=
  result@6@00
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 i@5@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (< i@5@00 n@4@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(hide0(x, n, i), write) in aloc(x, i).int)
(set-option :timeout 0)
(push) ; 2
(assert (hide0%trigger ($Snap.second ($Snap.second s@$)) x@3@00 n@4@00 i@5@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] n > 0
(assert (> n@4@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] i >= 0
(assert (>= i@5@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] i < n
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] alen(x) == n
; [eval] alen(x)
(assert (= (alen<Int> x@3@00) n@4@00))
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 4
(assert (not (< i@5@00 (alen<Int> x@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< i@5@00 (alen<Int> x@3@00)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00))
(pop) ; 3
; Joined path conditions
(assert (and
  (< i@5@00 (alen<Int> x@3@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00)))
(assert (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00) $Ref.null)))
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(pop) ; 2
; Joined path conditions
(assert (and
  (hide0%trigger ($Snap.second ($Snap.second s@$)) x@3@00 n@4@00 i@5@00)
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (> n@4@00 0)
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (>= i@5@00 0)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (= (alen<Int> x@3@00) n@4@00)
  (< i@5@00 (alen<Int> x@3@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00)
  (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@3@00 i@5@00) $Ref.null))))
(assert (=
  result@6@00
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
; [eval] result == (unfolding acc(hide0(x, n, i), write) in aloc(x, i).int)
; [eval] (unfolding acc(hide0(x, n, i), write) in aloc(x, i).int)
(push) ; 2
; [eval] n > 0
; [eval] i >= 0
; [eval] i < n
; [eval] alen(x) == n
; [eval] alen(x)
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(pop) ; 2
; Joined path conditions
(pop) ; 1
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
; ---------- FUNCTION get1----------
(declare-fun x@7@00 () Array_)
(declare-fun n@8@00 () Int)
(declare-fun i@9@00 () Int)
(declare-fun result@10@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@9@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] i < n
(assert (< i@9@00 n@8@00))
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(assert (<= $Perm.No $k@13@00))
(declare-const $t@14@00 $Snap)
(assert (= $t@14@00 $Snap.unit))
; [eval] result == (unfolding acc(hide1(x, n, i), wildcard) in aloc(x, i).int)
; [eval] (unfolding acc(hide1(x, n, i), wildcard) in aloc(x, i).int)
(declare-const $k@15@00 $Perm)
(assert ($Perm.isReadVar $k@15@00))
(push) ; 2
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@16@00 $Perm)
(assert ($Perm.isReadVar $k@16@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@13@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@16@00 $k@13@00))
(assert (<= $Perm.No (- $k@13@00 $k@16@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (hide1%trigger ($Snap.second ($Snap.second s@$)) x@7@00 n@8@00 i@9@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] n > 0
(assert (> n@8@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] i >= 0
(assert (>= i@9@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] i < n
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] alen(x) == n
; [eval] alen(x)
(assert (= (alen<Int> x@7@00) n@8@00))
; [eval] aloc(x, i)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 4
(assert (not (< i@9@00 (alen<Int> x@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< i@9@00 (alen<Int> x@7@00)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00))
(pop) ; 3
; Joined path conditions
(assert (and
  (< i@9@00 (alen<Int> x@7@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00)))
(assert (<= $Perm.No $k@15@00))
(assert (<= $k@15@00 $Perm.Write))
(assert (=>
  (< $Perm.No $k@15@00)
  (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00) $Ref.null))))
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@16@00))
(assert (and
  (< $k@16@00 $k@13@00)
  (<= $Perm.No (- $k@13@00 $k@16@00))
  (hide1%trigger ($Snap.second ($Snap.second s@$)) x@7@00 n@8@00 i@9@00)
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (> n@8@00 0)
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (>= i@9@00 0)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (= (alen<Int> x@7@00) n@8@00)
  (< i@9@00 (alen<Int> x@7@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00)
  (<= $Perm.No $k@15@00)
  (<= $k@15@00 $Perm.Write)
  (=>
    (< $Perm.No $k@15@00)
    (not
      (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00) $Ref.null)))))
(assert (=
  result@10@00
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(pop) ; 1
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
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert ($Perm.isReadVar $k@13@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (<= 0 i@9@00))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (< i@9@00 n@8@00))
(assert (<= $Perm.No $k@13@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(hide1(x, n, i), wildcard) in aloc(x, i).int)
(declare-const $k@17@00 $Perm)
(assert ($Perm.isReadVar $k@17@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@18@00 $Perm)
(assert ($Perm.isReadVar $k@18@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@13@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@18@00 $k@13@00))
(assert (<= $Perm.No (- $k@13@00 $k@18@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (hide1%trigger ($Snap.second ($Snap.second s@$)) x@7@00 n@8@00 i@9@00))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] n > 0
(assert (> n@8@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit))
; [eval] i >= 0
(assert (>= i@9@00 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] i < n
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  $Snap.unit))
; [eval] alen(x) == n
; [eval] alen(x)
(assert (= (alen<Int> x@7@00) n@8@00))
; [eval] aloc(x, i)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 4
(assert (not (< i@9@00 (alen<Int> x@7@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< i@9@00 (alen<Int> x@7@00)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00))
(pop) ; 3
; Joined path conditions
(assert (and
  (< i@9@00 (alen<Int> x@7@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00)))
(assert (<= $Perm.No $k@17@00))
(assert (<= $k@17@00 $Perm.Write))
(assert (=>
  (< $Perm.No $k@17@00)
  (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00) $Ref.null))))
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@18@00))
(assert (and
  (< $k@18@00 $k@13@00)
  (<= $Perm.No (- $k@13@00 $k@18@00))
  (hide1%trigger ($Snap.second ($Snap.second s@$)) x@7@00 n@8@00 i@9@00)
  (=
    ($Snap.second ($Snap.second s@$))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second s@$)))
      ($Snap.second ($Snap.second ($Snap.second s@$)))))
  (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit)
  (> n@8@00 0)
  (=
    ($Snap.second ($Snap.second ($Snap.second s@$)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
  (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$)))) $Snap.unit)
  (>= i@9@00 0)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    $Snap.unit)
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))
    $Snap.unit)
  (= (alen<Int> x@7@00) n@8@00)
  (< i@9@00 (alen<Int> x@7@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00)
  (<= $Perm.No $k@17@00)
  (<= $k@17@00 $Perm.Write)
  (=>
    (< $Perm.No $k@17@00)
    (not
      (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00) $Ref.null)))))
(assert (=
  result@10@00
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))
; [eval] result == (unfolding acc(hide1(x, n, i), wildcard) in aloc(x, i).int)
; [eval] (unfolding acc(hide1(x, n, i), wildcard) in aloc(x, i).int)
(declare-const $k@19@00 $Perm)
(assert ($Perm.isReadVar $k@19@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@19@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@20@00 $Perm)
(assert ($Perm.isReadVar $k@20@00))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@13@00 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@20@00 $k@13@00))
(assert (<= $Perm.No (- $k@13@00 $k@20@00)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] n > 0
; [eval] i >= 0
; [eval] i < n
; [eval] alen(x) == n
; [eval] alen(x)
; [eval] aloc(x, i)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(assert (<= $Perm.No $k@19@00))
(assert (<= $k@19@00 $Perm.Write))
(assert (=>
  (< $Perm.No $k@19@00)
  (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00) $Ref.null))))
; [eval] aloc(x, i)
(push) ; 3
; [eval] 0 <= i
; [eval] i < alen(a)
; [eval] alen(a)
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@19@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@20@00))
(assert (and
  (< $k@20@00 $k@13@00)
  (<= $Perm.No (- $k@13@00 $k@20@00))
  (<= $Perm.No $k@19@00)
  (<= $k@19@00 $Perm.Write)
  (=>
    (< $Perm.No $k@19@00)
    (not
      (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@7@00 i@9@00) $Ref.null)))))
(pop) ; 1
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
; ---------- hide0 ----------
(declare-const x@21@00 Array_)
(declare-const n@22@00 Int)
(declare-const i@23@00 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@24@00 $Snap)
(assert (= $t@24@00 ($Snap.combine ($Snap.first $t@24@00) ($Snap.second $t@24@00))))
(assert (= ($Snap.first $t@24@00) $Snap.unit))
; [eval] n > 0
(assert (> n@22@00 0))
(assert (=
  ($Snap.second $t@24@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@24@00))
    ($Snap.second ($Snap.second $t@24@00)))))
(assert (= ($Snap.first ($Snap.second $t@24@00)) $Snap.unit))
; [eval] i >= 0
(assert (>= i@23@00 0))
(assert (=
  ($Snap.second ($Snap.second $t@24@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@24@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@24@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@24@00))) $Snap.unit))
; [eval] i < n
(assert (< i@23@00 n@22@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@24@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@00))))
  $Snap.unit))
; [eval] alen(x) == n
; [eval] alen(x)
(assert (= (alen<Int> x@21@00) n@22@00))
; [eval] aloc(x, i)
(push) ; 2
; [eval] 0 <= i
(push) ; 3
(assert (not (<= 0 i@23@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@23@00))
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 3
(assert (not (< i@23@00 (alen<Int> x@21@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< i@23@00 (alen<Int> x@21@00)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@21@00 i@23@00))
(pop) ; 2
; Joined path conditions
(assert (and
  (<= 0 i@23@00)
  (< i@23@00 (alen<Int> x@21@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@21@00 i@23@00)))
(assert (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@21@00 i@23@00) $Ref.null)))
(pop) ; 1
; ---------- hide1 ----------
(declare-const x@25@00 Array_)
(declare-const n@26@00 Int)
(declare-const i@27@00 Int)
(push) ; 1
(declare-const $t@28@00 $Snap)
(assert (= $t@28@00 ($Snap.combine ($Snap.first $t@28@00) ($Snap.second $t@28@00))))
(assert (= ($Snap.first $t@28@00) $Snap.unit))
; [eval] n > 0
(assert (> n@26@00 0))
(assert (=
  ($Snap.second $t@28@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@28@00))
    ($Snap.second ($Snap.second $t@28@00)))))
(assert (= ($Snap.first ($Snap.second $t@28@00)) $Snap.unit))
; [eval] i >= 0
(assert (>= i@27@00 0))
(assert (=
  ($Snap.second ($Snap.second $t@28@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@28@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@28@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@28@00))) $Snap.unit))
; [eval] i < n
(assert (< i@27@00 n@26@00))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@28@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@00))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@28@00)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@28@00))))
  $Snap.unit))
; [eval] alen(x) == n
; [eval] alen(x)
(assert (= (alen<Int> x@25@00) n@26@00))
; [eval] aloc(x, i)
(push) ; 2
; [eval] 0 <= i
(push) ; 3
(assert (not (<= 0 i@27@00)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@27@00))
; [eval] i < alen(a)
; [eval] alen(a)
(push) ; 3
(assert (not (< i@27@00 (alen<Int> x@25@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< i@27@00 (alen<Int> x@25@00)))
(assert (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@25@00 i@27@00))
(pop) ; 2
; Joined path conditions
(assert (and
  (<= 0 i@27@00)
  (< i@27@00 (alen<Int> x@25@00))
  (aloc%precondition ($Snap.combine $Snap.unit $Snap.unit) x@25@00 i@27@00)))
(assert (not (= (aloc ($Snap.combine $Snap.unit $Snap.unit) x@25@00 i@27@00) $Ref.null)))
(pop) ; 1
