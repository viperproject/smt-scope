(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:24:26
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $PSF<p1> 0)
(declare-sort $PSF<p2> 0)
(declare-sort $PSF<p3> 0)
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
(declare-fun $SortWrappers.$PSF<p1>To$Snap ($PSF<p1>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<p1> ($Snap) $PSF<p1>)
(assert (forall ((x $PSF<p1>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<p1>($SortWrappers.$PSF<p1>To$Snap x)))
    :pattern (($SortWrappers.$PSF<p1>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<p1>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<p1>To$Snap($SortWrappers.$SnapTo$PSF<p1> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<p1> x))
    :qid |$Snap.$PSF<p1>To$SnapTo$PSF<p1>|
    )))
(declare-fun $SortWrappers.$PSF<p2>To$Snap ($PSF<p2>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<p2> ($Snap) $PSF<p2>)
(assert (forall ((x $PSF<p2>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<p2>($SortWrappers.$PSF<p2>To$Snap x)))
    :pattern (($SortWrappers.$PSF<p2>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<p2>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<p2>To$Snap($SortWrappers.$SnapTo$PSF<p2> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<p2> x))
    :qid |$Snap.$PSF<p2>To$SnapTo$PSF<p2>|
    )))
(declare-fun $SortWrappers.$PSF<p3>To$Snap ($PSF<p3>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<p3> ($Snap) $PSF<p3>)
(assert (forall ((x $PSF<p3>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<p3>($SortWrappers.$PSF<p3>To$Snap x)))
    :pattern (($SortWrappers.$PSF<p3>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<p3>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<p3>To$Snap($SortWrappers.$SnapTo$PSF<p3> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<p3> x))
    :qid |$Snap.$PSF<p3>To$SnapTo$PSF<p3>|
    )))
; ////////// Symbols
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
; /predicate_snap_functions_declarations.smt2 [p1: Int]
(declare-fun $PSF.domain_p1 ($PSF<p1>) Set<$Snap>)
(declare-fun $PSF.lookup_p1 ($PSF<p1> $Snap) Int)
(declare-fun $PSF.after_p1 ($PSF<p1> $PSF<p1>) Bool)
(declare-fun $PSF.loc_p1 (Int $Snap) Bool)
(declare-fun $PSF.perm_p1 ($PPM $Snap) $Perm)
(declare-const $psfTOP_p1 $PSF<p1>)
; /predicate_snap_functions_declarations.smt2 [p2: Snap]
(declare-fun $PSF.domain_p2 ($PSF<p2>) Set<$Snap>)
(declare-fun $PSF.lookup_p2 ($PSF<p2> $Snap) $Snap)
(declare-fun $PSF.after_p2 ($PSF<p2> $PSF<p2>) Bool)
(declare-fun $PSF.loc_p2 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_p2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_p2 $PSF<p2>)
; /predicate_snap_functions_declarations.smt2 [p3: Snap]
(declare-fun $PSF.domain_p3 ($PSF<p3>) Set<$Snap>)
(declare-fun $PSF.lookup_p3 ($PSF<p3> $Snap) $Snap)
(declare-fun $PSF.after_p3 ($PSF<p3> $PSF<p3>) Bool)
(declare-fun $PSF.loc_p3 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_p3 ($PPM $Snap) $Perm)
(declare-const $psfTOP_p3 $PSF<p3>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p1%trigger ($Snap $Ref) Bool)
(declare-fun p2%trigger ($Snap $Ref) Bool)
(declare-fun p3%trigger ($Snap $Ref Int) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
; /predicate_snap_functions_axioms.smt2 [p1: Int]
(assert (forall ((vs $PSF<p1>) (ws $PSF<p1>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_p1 vs) ($PSF.domain_p1 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_p1 vs))
            (= ($PSF.lookup_p1 vs x) ($PSF.lookup_p1 ws x)))
          :pattern (($PSF.lookup_p1 vs x) ($PSF.lookup_p1 ws x))
          :qid |qp.$PSF<p1>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<p1>To$Snap vs)
              ($SortWrappers.$PSF<p1>To$Snap ws)
              )
    :qid |qp.$PSF<p1>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_p1 pm s))
    :pattern (($PSF.perm_p1 pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_p1 f s) true)
    :pattern (($PSF.loc_p1 f s)))))
; /predicate_snap_functions_axioms.smt2 [p2: Snap]
(assert (forall ((vs $PSF<p2>) (ws $PSF<p2>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_p2 vs) ($PSF.domain_p2 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_p2 vs))
            (= ($PSF.lookup_p2 vs x) ($PSF.lookup_p2 ws x)))
          :pattern (($PSF.lookup_p2 vs x) ($PSF.lookup_p2 ws x))
          :qid |qp.$PSF<p2>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<p2>To$Snap vs)
              ($SortWrappers.$PSF<p2>To$Snap ws)
              )
    :qid |qp.$PSF<p2>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_p2 pm s))
    :pattern (($PSF.perm_p2 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_p2 f s) true)
    :pattern (($PSF.loc_p2 f s)))))
; /predicate_snap_functions_axioms.smt2 [p3: Snap]
(assert (forall ((vs $PSF<p3>) (ws $PSF<p3>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_p3 vs) ($PSF.domain_p3 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_p3 vs))
            (= ($PSF.lookup_p3 vs x) ($PSF.lookup_p3 ws x)))
          :pattern (($PSF.lookup_p3 vs x) ($PSF.lookup_p3 ws x))
          :qid |qp.$PSF<p3>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<p3>To$Snap vs)
              ($SortWrappers.$PSF<p3>To$Snap ws)
              )
    :qid |qp.$PSF<p3>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_p3 pm s))
    :pattern (($PSF.perm_p3 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_p3 f s) true)
    :pattern (($PSF.loc_p3 f s)))))
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
; ---------- m1 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const xs@1@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const r@2@01 $Ref)
(push) ; 2
; [eval] (r in xs)
(assert (Set_in r@2@01 xs@1@01))
(pop) ; 2
(declare-const $t@3@01 $PSF<p1>)
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@2@01 $Ref) (r2@2@01 $Ref)) (!
  (=>
    (and (Set_in r1@2@01 xs@1@01) (Set_in r2@2@01 xs@1@01) (= r1@2@01 r2@2@01))
    (= r1@2@01 r2@2@01))
  
  :qid |p1-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@2@01 $Ref)) (!
  (=>
    (Set_in r@2@01 xs@1@01)
    (and (= (inv@4@01 r@2@01) r@2@01) (img@5@01 r@2@01)))
  :pattern ((Set_in r@2@01 xs@1@01))
  :pattern ((inv@4@01 r@2@01))
  :pattern ((img@5@01 r@2@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) (= (inv@4@01 r) r))
  :pattern ((inv@4@01 r))
  :qid |p1-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall r: Ref ::
;     { (r in xs) }
;     (r in xs) ==> (unfolding acc(p1(r), write) in r.f == 4))
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p1(r), write) in r.f == 4))
(declare-const r@7@01 $Ref)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p1(r), write) in r.f == 4)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 0 | r@7@01 in xs@1@01 | live]
; [else-branch: 0 | !(r@7@01 in xs@1@01) | live]
(push) ; 5
; [then-branch: 0 | r@7@01 in xs@1@01]
(assert (Set_in r@7@01 xs@1@01))
; [eval] (unfolding acc(p1(r), write) in r.f == 4)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@8@01 ((r $Ref) (r@7@01 $Ref)) $Perm
  (ite
    (= r r@7@01)
    ($Perm.min
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) $Perm.Write $Perm.No)
      (pTaken@8@01 r r@7@01))
    $Perm.No)
  
  :qid |quant-u-3|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@8@01 r r@7@01) $Perm.No)
  
  :qid |quant-u-4|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@7@01) (= (- $Perm.Write (pTaken@8@01 r r@7@01)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@9@01 $PSF<p1>)
(declare-const s@10@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@5@01 r@7@01) (Set_in (inv@4@01 r@7@01) xs@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap r@7@01) $Snap.unit))
    (=
      ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))
      ($PSF.lookup_p1 $t@3@01 ($SortWrappers.$RefTo$Snap r@7@01))))))
(assert (p1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))) r@7@01))
(assert (not (= r@7@01 $Ref.null)))
; [eval] r.f == 4
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and (img@5@01 r@7@01) (Set_in (inv@4@01 r@7@01) xs@1@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap r@7@01) $Snap.unit))
      (=
        ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))
        ($PSF.lookup_p1 $t@3@01 ($SortWrappers.$RefTo$Snap r@7@01)))))
  (p1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))) r@7@01)
  (not (= r@7@01 $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 0 | !(r@7@01 in xs@1@01)]
(assert (not (Set_in r@7@01 xs@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@7@01 xs@1@01)
  (and
    (Set_in r@7@01 xs@1@01)
    (=>
      (and (img@5@01 r@7@01) (Set_in (inv@4@01 r@7@01) xs@1@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap r@7@01) $Snap.unit))
        (=
          ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))
          ($PSF.lookup_p1 $t@3@01 ($SortWrappers.$RefTo$Snap r@7@01)))))
    (p1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))) r@7@01)
    (not (= r@7@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in r@7@01 xs@1@01)) (Set_in r@7@01 xs@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@7@01 $Ref)) (!
  (and
    (=>
      (Set_in r@7@01 xs@1@01)
      (and
        (Set_in r@7@01 xs@1@01)
        (=>
          (and (img@5@01 r@7@01) (Set_in (inv@4@01 r@7@01) xs@1@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap r@7@01) $Snap.unit))
            (=
              ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))
              ($PSF.lookup_p1 $t@3@01 ($SortWrappers.$RefTo$Snap r@7@01)))))
        (p1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))) r@7@01)
        (not (= r@7@01 $Ref.null))))
    (or (not (Set_in r@7@01 xs@1@01)) (Set_in r@7@01 xs@1@01)))
  :pattern ((Set_in r@7@01 xs@1@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@26@12@26@67-aux|)))
(assert (forall ((r@7@01 $Ref)) (!
  (=>
    (Set_in r@7@01 xs@1@01)
    (=
      ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@7@01))
      4))
  :pattern ((Set_in r@7@01 xs@1@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@26@12@26@67|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall r: Ref ::
;     { (r in xs) }
;     (r in xs) ==> (unfolding acc(p1(r), write) in r.f == 4))
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p1(r), write) in r.f == 4))
(declare-const r@11@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p1(r), write) in r.f == 4)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 1 | r@11@01 in xs@1@01 | live]
; [else-branch: 1 | !(r@11@01 in xs@1@01) | live]
(push) ; 5
; [then-branch: 1 | r@11@01 in xs@1@01]
(assert (Set_in r@11@01 xs@1@01))
; [eval] (unfolding acc(p1(r), write) in r.f == 4)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@12@01 ((r $Ref) (r@11@01 $Ref)) $Perm
  (ite
    (= r r@11@01)
    ($Perm.min
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) $Perm.Write $Perm.No)
      (pTaken@12@01 r r@11@01))
    $Perm.No)
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@12@01 r r@11@01) $Perm.No)
  
  :qid |quant-u-8|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@11@01) (= (- $Perm.Write (pTaken@12@01 r r@11@01)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@5@01 r@11@01) (Set_in (inv@4@01 r@11@01) xs@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap r@11@01) $Snap.unit))
    (=
      ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))
      ($PSF.lookup_p1 $t@3@01 ($SortWrappers.$RefTo$Snap r@11@01))))))
(assert (p1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))) r@11@01))
(assert (not (= r@11@01 $Ref.null)))
; [eval] r.f == 4
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and (img@5@01 r@11@01) (Set_in (inv@4@01 r@11@01) xs@1@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap r@11@01) $Snap.unit))
      (=
        ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))
        ($PSF.lookup_p1 $t@3@01 ($SortWrappers.$RefTo$Snap r@11@01)))))
  (p1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))) r@11@01)
  (not (= r@11@01 $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | !(r@11@01 in xs@1@01)]
(assert (not (Set_in r@11@01 xs@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@11@01 xs@1@01)
  (and
    (Set_in r@11@01 xs@1@01)
    (=>
      (and (img@5@01 r@11@01) (Set_in (inv@4@01 r@11@01) xs@1@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap r@11@01) $Snap.unit))
        (=
          ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))
          ($PSF.lookup_p1 $t@3@01 ($SortWrappers.$RefTo$Snap r@11@01)))))
    (p1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))) r@11@01)
    (not (= r@11@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in r@11@01 xs@1@01)) (Set_in r@11@01 xs@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@11@01 $Ref)) (!
  (and
    (=>
      (Set_in r@11@01 xs@1@01)
      (and
        (Set_in r@11@01 xs@1@01)
        (=>
          (and (img@5@01 r@11@01) (Set_in (inv@4@01 r@11@01) xs@1@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap r@11@01) $Snap.unit))
            (=
              ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))
              ($PSF.lookup_p1 $t@3@01 ($SortWrappers.$RefTo$Snap r@11@01)))))
        (p1%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))) r@11@01)
        (not (= r@11@01 $Ref.null))))
    (or (not (Set_in r@11@01 xs@1@01)) (Set_in r@11@01 xs@1@01)))
  :pattern ((Set_in r@11@01 xs@1@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@27@12@27@67-aux|)))
(push) ; 3
(assert (not (forall ((r@11@01 $Ref)) (!
  (=>
    (Set_in r@11@01 xs@1@01)
    (=
      ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))
      4))
  :pattern ((Set_in r@11@01 xs@1@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@27@12@27@67|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@11@01 $Ref)) (!
  (=>
    (Set_in r@11@01 xs@1@01)
    (=
      ($PSF.lookup_p1 (as sm@9@01  $PSF<p1>) ($SortWrappers.$RefTo$Snap r@11@01))
      4))
  :pattern ((Set_in r@11@01 xs@1@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@27@12@27@67|)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const xs@13@01 Set<$Ref>)
(declare-const xs@14@01 Set<$Ref>)
(push) ; 1
(declare-const r@15@01 $Ref)
(push) ; 2
; [eval] (r in xs)
(assert (Set_in r@15@01 xs@14@01))
(pop) ; 2
(declare-const $t@16@01 $PSF<p2>)
(declare-fun inv@17@01 ($Ref) $Ref)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@15@01 $Ref) (r2@15@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@15@01 xs@14@01)
      (Set_in r2@15@01 xs@14@01)
      (= r1@15@01 r2@15@01))
    (= r1@15@01 r2@15@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@15@01 $Ref)) (!
  (=>
    (Set_in r@15@01 xs@14@01)
    (and (= (inv@17@01 r@15@01) r@15@01) (img@18@01 r@15@01)))
  :pattern ((Set_in r@15@01 xs@14@01))
  :pattern ((inv@17@01 r@15@01))
  :pattern ((img@18@01 r@15@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@18@01 r) (Set_in (inv@17@01 r) xs@14@01)) (= (inv@17@01 r) r))
  :pattern ((inv@17@01 r))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall r: Ref ::
;     { (r in xs) }
;     (r in xs) ==> (unfolding acc(p2(r), write) in r.f == 5))
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p2(r), write) in r.f == 5))
(declare-const r@19@01 $Ref)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p2(r), write) in r.f == 5)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 2 | r@19@01 in xs@14@01 | live]
; [else-branch: 2 | !(r@19@01 in xs@14@01) | live]
(push) ; 5
; [then-branch: 2 | r@19@01 in xs@14@01]
(assert (Set_in r@19@01 xs@14@01))
; [eval] (unfolding acc(p2(r), write) in r.f == 5)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((r $Ref) (r@19@01 $Ref)) $Perm
  (ite
    (= r r@19@01)
    ($Perm.min
      (ite
        (and (img@18@01 r) (Set_in (inv@17@01 r) xs@14@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@18@01 r) (Set_in (inv@17@01 r) xs@14@01))
        $Perm.Write
        $Perm.No)
      (pTaken@20@01 r r@19@01))
    $Perm.No)
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@20@01 r r@19@01) $Perm.No)
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@19@01) (= (- $Perm.Write (pTaken@20@01 r r@19@01)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@21@01 $PSF<p2>)
(declare-const s@22@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@18@01 r@19@01) (Set_in (inv@17@01 r@19@01) xs@14@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap r@19@01) $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))
      ($PSF.lookup_p2 $t@16@01 ($SortWrappers.$RefTo$Snap r@19@01))))))
(assert (p2%trigger ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)) r@19@01))
(assert (=
  ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))
    ($Snap.second ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))))))
(assert (not (= r@19@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))
  $Snap.unit))
; [eval] r.f == 5
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))))
  5))
; [eval] r.f == 5
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and (img@18@01 r@19@01) (Set_in (inv@17@01 r@19@01) xs@14@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap r@19@01) $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))
        ($PSF.lookup_p2 $t@16@01 ($SortWrappers.$RefTo$Snap r@19@01)))))
  (p2%trigger ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)) r@19@01)
  (=
    ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))
      ($Snap.second ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))))
  (not (= r@19@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))
    $Snap.unit)
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))))
    5)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | !(r@19@01 in xs@14@01)]
(assert (not (Set_in r@19@01 xs@14@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@19@01 xs@14@01)
  (and
    (Set_in r@19@01 xs@14@01)
    (=>
      (and (img@18@01 r@19@01) (Set_in (inv@17@01 r@19@01) xs@14@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap r@19@01) $Snap.unit))
        (=
          ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))
          ($PSF.lookup_p2 $t@16@01 ($SortWrappers.$RefTo$Snap r@19@01)))))
    (p2%trigger ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)) r@19@01)
    (=
      ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))
        ($Snap.second ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))))
    (not (= r@19@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))
      $Snap.unit)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))))
      5))))
; Joined path conditions
(assert (or (not (Set_in r@19@01 xs@14@01)) (Set_in r@19@01 xs@14@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@19@01 $Ref)) (!
  (and
    (=>
      (Set_in r@19@01 xs@14@01)
      (and
        (Set_in r@19@01 xs@14@01)
        (=>
          (and (img@18@01 r@19@01) (Set_in (inv@17@01 r@19@01) xs@14@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap r@19@01) $Snap.unit))
            (=
              ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))
              ($PSF.lookup_p2 $t@16@01 ($SortWrappers.$RefTo$Snap r@19@01)))))
        (p2%trigger ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)) r@19@01)
        (=
          ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))
            ($Snap.second ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))))
        (not (= r@19@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01)))
          $Snap.unit)
        (=
          ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))))
          5)))
    (or (not (Set_in r@19@01 xs@14@01)) (Set_in r@19@01 xs@14@01)))
  :pattern ((Set_in r@19@01 xs@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@34@12@34@67-aux|)))
(push) ; 3
(assert (not (forall ((r@19@01 $Ref)) (!
  (=>
    (Set_in r@19@01 xs@14@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))))
      5))
  :pattern ((Set_in r@19@01 xs@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@34@12@34@67|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@19@01 $Ref)) (!
  (=>
    (Set_in r@19@01 xs@14@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p2 (as sm@21@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap r@19@01))))
      5))
  :pattern ((Set_in r@19@01 xs@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@34@12@34@67|)))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const xs@23@01 Set<$Ref>)
(declare-const i@24@01 Int)
(declare-const xs@25@01 Set<$Ref>)
(declare-const i@26@01 Int)
(push) ; 1
(declare-const r@27@01 $Ref)
(push) ; 2
; [eval] (r in xs)
(assert (Set_in r@27@01 xs@25@01))
(pop) ; 2
(declare-const $t@28@01 $PSF<p3>)
(declare-fun inv@29@01 ($Ref Int) $Ref)
(declare-fun img@30@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@27@01 $Ref) (r2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@27@01 xs@25@01)
      (Set_in r2@27@01 xs@25@01)
      (= r1@27@01 r2@27@01))
    (= r1@27@01 r2@27@01))
  
  :qid |p3-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@27@01 $Ref)) (!
  (=>
    (Set_in r@27@01 xs@25@01)
    (and (= (inv@29@01 r@27@01 i@26@01) r@27@01) (img@30@01 r@27@01 i@26@01)))
  :pattern ((Set_in r@27@01 xs@25@01))
  :pattern ((inv@29@01 r@27@01 i@26@01))
  :pattern ((img@30@01 r@27@01 i@26@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@30@01 r i) (Set_in (inv@29@01 r i) xs@25@01))
    (and (= (inv@29@01 r i) r) (= i@26@01 i)))
  :pattern ((inv@29@01 r i))
  :qid |p3-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall r: Ref ::
;     { (r in xs) }
;     (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1))
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1))
(declare-const r@32@01 $Ref)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 3 | r@32@01 in xs@25@01 | live]
; [else-branch: 3 | !(r@32@01 in xs@25@01) | live]
(push) ; 5
; [then-branch: 3 | r@32@01 in xs@25@01]
(assert (Set_in r@32@01 xs@25@01))
; [eval] (unfolding acc(p3(r, i), write) in r.f == i + 1)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref) (i Int) (r@32@01 $Ref)) $Perm
  (ite
    (and (= r r@32@01) (= i i@26@01))
    ($Perm.min
      (ite
        (and (img@30@01 r i) (Set_in (inv@29@01 r i) xs@25@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@30@01 r i) (Set_in (inv@29@01 r i) xs@25@01))
        $Perm.Write
        $Perm.No)
      (pTaken@33@01 r i r@32@01))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@33@01 r i r@32@01) $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@32@01) (= i i@26@01))
    (= (- $Perm.Write (pTaken@33@01 r i r@32@01)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@34@01 $PSF<p3>)
(declare-const s@35@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@30@01 r@32@01 i@26@01) (Set_in (inv@29@01 r@32@01 i@26@01) xs@25@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@32@01)
          ($SortWrappers.IntTo$Snap i@26@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@32@01)
        ($SortWrappers.IntTo$Snap i@26@01)))
      ($PSF.lookup_p3 $t@28@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@32@01)
        ($SortWrappers.IntTo$Snap i@26@01)))))))
(assert (p3%trigger ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@32@01)
  ($SortWrappers.IntTo$Snap i@26@01))) r@32@01 i@26@01))
(assert (=
  ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@32@01)
    ($SortWrappers.IntTo$Snap i@26@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@32@01)
      ($SortWrappers.IntTo$Snap i@26@01))))
    ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@32@01)
      ($SortWrappers.IntTo$Snap i@26@01)))))))
(assert (not (= r@32@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@32@01)
    ($SortWrappers.IntTo$Snap i@26@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@26@01 0))
; [eval] r.f == i + 1
; [eval] i + 1
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@30@01 r@32@01 i@26@01)
      (Set_in (inv@29@01 r@32@01 i@26@01) xs@25@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@32@01)
            ($SortWrappers.IntTo$Snap i@26@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@32@01)
          ($SortWrappers.IntTo$Snap i@26@01)))
        ($PSF.lookup_p3 $t@28@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@32@01)
          ($SortWrappers.IntTo$Snap i@26@01))))))
  (p3%trigger ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@32@01)
    ($SortWrappers.IntTo$Snap i@26@01))) r@32@01 i@26@01)
  (=
    ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@32@01)
      ($SortWrappers.IntTo$Snap i@26@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@32@01)
        ($SortWrappers.IntTo$Snap i@26@01))))
      ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@32@01)
        ($SortWrappers.IntTo$Snap i@26@01))))))
  (not (= r@32@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@32@01)
      ($SortWrappers.IntTo$Snap i@26@01))))
    $Snap.unit)
  (> i@26@01 0)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | !(r@32@01 in xs@25@01)]
(assert (not (Set_in r@32@01 xs@25@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@32@01 xs@25@01)
  (and
    (Set_in r@32@01 xs@25@01)
    (=>
      (and
        (img@30@01 r@32@01 i@26@01)
        (Set_in (inv@29@01 r@32@01 i@26@01) xs@25@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@32@01)
              ($SortWrappers.IntTo$Snap i@26@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@32@01)
            ($SortWrappers.IntTo$Snap i@26@01)))
          ($PSF.lookup_p3 $t@28@01 ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@32@01)
            ($SortWrappers.IntTo$Snap i@26@01))))))
    (p3%trigger ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@32@01)
      ($SortWrappers.IntTo$Snap i@26@01))) r@32@01 i@26@01)
    (=
      ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@32@01)
        ($SortWrappers.IntTo$Snap i@26@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@32@01)
          ($SortWrappers.IntTo$Snap i@26@01))))
        ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@32@01)
          ($SortWrappers.IntTo$Snap i@26@01))))))
    (not (= r@32@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@32@01)
        ($SortWrappers.IntTo$Snap i@26@01))))
      $Snap.unit)
    (> i@26@01 0))))
; Joined path conditions
(assert (or (not (Set_in r@32@01 xs@25@01)) (Set_in r@32@01 xs@25@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@32@01 $Ref)) (!
  (and
    (=>
      (Set_in r@32@01 xs@25@01)
      (and
        (Set_in r@32@01 xs@25@01)
        (=>
          (and
            (img@30@01 r@32@01 i@26@01)
            (Set_in (inv@29@01 r@32@01 i@26@01) xs@25@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@32@01)
                  ($SortWrappers.IntTo$Snap i@26@01))
                $Snap.unit))
            (=
              ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@32@01)
                ($SortWrappers.IntTo$Snap i@26@01)))
              ($PSF.lookup_p3 $t@28@01 ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@32@01)
                ($SortWrappers.IntTo$Snap i@26@01))))))
        (p3%trigger ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@32@01)
          ($SortWrappers.IntTo$Snap i@26@01))) r@32@01 i@26@01)
        (=
          ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@32@01)
            ($SortWrappers.IntTo$Snap i@26@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@32@01)
              ($SortWrappers.IntTo$Snap i@26@01))))
            ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@32@01)
              ($SortWrappers.IntTo$Snap i@26@01))))))
        (not (= r@32@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@32@01)
            ($SortWrappers.IntTo$Snap i@26@01))))
          $Snap.unit)
        (> i@26@01 0)))
    (or (not (Set_in r@32@01 xs@25@01)) (Set_in r@32@01 xs@25@01)))
  :pattern ((Set_in r@32@01 xs@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@40@12@40@72-aux|)))
(assert (forall ((r@32@01 $Ref)) (!
  (=>
    (Set_in r@32@01 xs@25@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@32@01)
        ($SortWrappers.IntTo$Snap i@26@01)))))
      (+ i@26@01 1)))
  :pattern ((Set_in r@32@01 xs@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@40@12@40@72|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall r: Ref ::
;     { (r in xs) }
;     (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1))
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1))
(declare-const r@36@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 4 | r@36@01 in xs@25@01 | live]
; [else-branch: 4 | !(r@36@01 in xs@25@01) | live]
(push) ; 5
; [then-branch: 4 | r@36@01 in xs@25@01]
(assert (Set_in r@36@01 xs@25@01))
; [eval] (unfolding acc(p3(r, i), write) in r.f == i + 1)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@37@01 ((r $Ref) (i Int) (r@36@01 $Ref)) $Perm
  (ite
    (and (= r r@36@01) (= i i@26@01))
    ($Perm.min
      (ite
        (and (img@30@01 r i) (Set_in (inv@29@01 r i) xs@25@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@30@01 r i) (Set_in (inv@29@01 r i) xs@25@01))
        $Perm.Write
        $Perm.No)
      (pTaken@37@01 r i r@36@01))
    $Perm.No)
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@37@01 r i r@36@01) $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@36@01) (= i i@26@01))
    (= (- $Perm.Write (pTaken@37@01 r i r@36@01)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@30@01 r@36@01 i@26@01) (Set_in (inv@29@01 r@36@01 i@26@01) xs@25@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@36@01)
          ($SortWrappers.IntTo$Snap i@26@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@36@01)
        ($SortWrappers.IntTo$Snap i@26@01)))
      ($PSF.lookup_p3 $t@28@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@36@01)
        ($SortWrappers.IntTo$Snap i@26@01)))))))
(assert (p3%trigger ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@36@01)
  ($SortWrappers.IntTo$Snap i@26@01))) r@36@01 i@26@01))
(assert (=
  ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@36@01)
    ($SortWrappers.IntTo$Snap i@26@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@36@01)
      ($SortWrappers.IntTo$Snap i@26@01))))
    ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@36@01)
      ($SortWrappers.IntTo$Snap i@26@01)))))))
(assert (not (= r@36@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@36@01)
    ($SortWrappers.IntTo$Snap i@26@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@26@01 0))
; [eval] r.f == i + 1
; [eval] i + 1
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@30@01 r@36@01 i@26@01)
      (Set_in (inv@29@01 r@36@01 i@26@01) xs@25@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@36@01)
            ($SortWrappers.IntTo$Snap i@26@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@36@01)
          ($SortWrappers.IntTo$Snap i@26@01)))
        ($PSF.lookup_p3 $t@28@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@36@01)
          ($SortWrappers.IntTo$Snap i@26@01))))))
  (p3%trigger ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@36@01)
    ($SortWrappers.IntTo$Snap i@26@01))) r@36@01 i@26@01)
  (=
    ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@36@01)
      ($SortWrappers.IntTo$Snap i@26@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@36@01)
        ($SortWrappers.IntTo$Snap i@26@01))))
      ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@36@01)
        ($SortWrappers.IntTo$Snap i@26@01))))))
  (not (= r@36@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@36@01)
      ($SortWrappers.IntTo$Snap i@26@01))))
    $Snap.unit)
  (> i@26@01 0)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | !(r@36@01 in xs@25@01)]
(assert (not (Set_in r@36@01 xs@25@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@36@01 xs@25@01)
  (and
    (Set_in r@36@01 xs@25@01)
    (=>
      (and
        (img@30@01 r@36@01 i@26@01)
        (Set_in (inv@29@01 r@36@01 i@26@01) xs@25@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@36@01)
              ($SortWrappers.IntTo$Snap i@26@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@36@01)
            ($SortWrappers.IntTo$Snap i@26@01)))
          ($PSF.lookup_p3 $t@28@01 ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@36@01)
            ($SortWrappers.IntTo$Snap i@26@01))))))
    (p3%trigger ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@36@01)
      ($SortWrappers.IntTo$Snap i@26@01))) r@36@01 i@26@01)
    (=
      ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@36@01)
        ($SortWrappers.IntTo$Snap i@26@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@36@01)
          ($SortWrappers.IntTo$Snap i@26@01))))
        ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@36@01)
          ($SortWrappers.IntTo$Snap i@26@01))))))
    (not (= r@36@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@36@01)
        ($SortWrappers.IntTo$Snap i@26@01))))
      $Snap.unit)
    (> i@26@01 0))))
; Joined path conditions
(assert (or (not (Set_in r@36@01 xs@25@01)) (Set_in r@36@01 xs@25@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@36@01 $Ref)) (!
  (and
    (=>
      (Set_in r@36@01 xs@25@01)
      (and
        (Set_in r@36@01 xs@25@01)
        (=>
          (and
            (img@30@01 r@36@01 i@26@01)
            (Set_in (inv@29@01 r@36@01 i@26@01) xs@25@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@36@01)
                  ($SortWrappers.IntTo$Snap i@26@01))
                $Snap.unit))
            (=
              ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@36@01)
                ($SortWrappers.IntTo$Snap i@26@01)))
              ($PSF.lookup_p3 $t@28@01 ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@36@01)
                ($SortWrappers.IntTo$Snap i@26@01))))))
        (p3%trigger ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@36@01)
          ($SortWrappers.IntTo$Snap i@26@01))) r@36@01 i@26@01)
        (=
          ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@36@01)
            ($SortWrappers.IntTo$Snap i@26@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@36@01)
              ($SortWrappers.IntTo$Snap i@26@01))))
            ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@36@01)
              ($SortWrappers.IntTo$Snap i@26@01))))))
        (not (= r@36@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@36@01)
            ($SortWrappers.IntTo$Snap i@26@01))))
          $Snap.unit)
        (> i@26@01 0)))
    (or (not (Set_in r@36@01 xs@25@01)) (Set_in r@36@01 xs@25@01)))
  :pattern ((Set_in r@36@01 xs@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@41@12@41@72-aux|)))
(push) ; 3
(assert (not (forall ((r@36@01 $Ref)) (!
  (=>
    (Set_in r@36@01 xs@25@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@36@01)
        ($SortWrappers.IntTo$Snap i@26@01)))))
      (+ i@26@01 1)))
  :pattern ((Set_in r@36@01 xs@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@41@12@41@72|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((r@36@01 $Ref)) (!
  (=>
    (Set_in r@36@01 xs@25@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p3 (as sm@34@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@36@01)
        ($SortWrappers.IntTo$Snap i@26@01)))))
      (+ i@26@01 1)))
  :pattern ((Set_in r@36@01 xs@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@41@12@41@72|)))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const xs@38@01 Set<$Ref>)
(declare-const i@39@01 Int)
(declare-const xs@40@01 Set<$Ref>)
(declare-const i@41@01 Int)
(push) ; 1
(declare-const r@42@01 $Ref)
(push) ; 2
; [eval] (r in xs)
(assert (Set_in r@42@01 xs@40@01))
(pop) ; 2
(declare-const $t@43@01 $PSF<p3>)
(declare-fun inv@44@01 ($Ref Int) $Ref)
(declare-fun img@45@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@42@01 $Ref) (r2@42@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@42@01 xs@40@01)
      (Set_in r2@42@01 xs@40@01)
      (= r1@42@01 r2@42@01))
    (= r1@42@01 r2@42@01))
  
  :qid |p3-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@42@01 $Ref)) (!
  (=>
    (Set_in r@42@01 xs@40@01)
    (and (= (inv@44@01 r@42@01 i@41@01) r@42@01) (img@45@01 r@42@01 i@41@01)))
  :pattern ((Set_in r@42@01 xs@40@01))
  :pattern ((inv@44@01 r@42@01 i@41@01))
  :pattern ((img@45@01 r@42@01 i@41@01))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref) (i Int)) (!
  (=>
    (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
    (and (= (inv@44@01 r i) r) (= i@41@01 i)))
  :pattern ((inv@44@01 r i))
  :qid |p3-fctOfInv|)))
; Permissions are non-negative
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall r: Ref ::
;     { (r in xs) }
;     (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1))
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 $Snap.unit))
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1))
(declare-const r@47@01 $Ref)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i + 1)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 5 | r@47@01 in xs@40@01 | live]
; [else-branch: 5 | !(r@47@01 in xs@40@01) | live]
(push) ; 5
; [then-branch: 5 | r@47@01 in xs@40@01]
(assert (Set_in r@47@01 xs@40@01))
; [eval] (unfolding acc(p3(r, i), write) in r.f == i + 1)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@48@01 ((r $Ref) (i Int) (r@47@01 $Ref)) $Perm
  (ite
    (and (= r r@47@01) (= i i@41@01))
    ($Perm.min
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
        $Perm.Write
        $Perm.No)
      (pTaken@48@01 r i r@47@01))
    $Perm.No)
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@48@01 r i r@47@01) $Perm.No)
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@47@01) (= i i@41@01))
    (= (- $Perm.Write (pTaken@48@01 r i r@47@01)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $PSF<p3>)
(declare-const s@50@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@45@01 r@47@01 i@41@01) (Set_in (inv@44@01 r@47@01 i@41@01) xs@40@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@47@01)
          ($SortWrappers.IntTo$Snap i@41@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($PSF.lookup_p3 $t@43@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@47@01)
  ($SortWrappers.IntTo$Snap i@41@01))) r@47@01 i@41@01))
(assert (=
  ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@47@01)
    ($SortWrappers.IntTo$Snap i@41@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@47@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@47@01)
      ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (not (= r@47@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@47@01)
    ($SortWrappers.IntTo$Snap i@41@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@41@01 0))
; [eval] r.f == i + 1
; [eval] i + 1
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@45@01 r@47@01 i@41@01)
      (Set_in (inv@44@01 r@47@01 i@41@01) xs@40@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@47@01)
            ($SortWrappers.IntTo$Snap i@41@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@47@01)
          ($SortWrappers.IntTo$Snap i@41@01)))
        ($PSF.lookup_p3 $t@43@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@47@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
  (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@47@01)
    ($SortWrappers.IntTo$Snap i@41@01))) r@47@01 i@41@01)
  (=
    ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@47@01)
      ($SortWrappers.IntTo$Snap i@41@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap i@41@01))))))
  (not (= r@47@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@47@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    $Snap.unit)
  (> i@41@01 0)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 5 | !(r@47@01 in xs@40@01)]
(assert (not (Set_in r@47@01 xs@40@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@47@01 xs@40@01)
  (and
    (Set_in r@47@01 xs@40@01)
    (=>
      (and
        (img@45@01 r@47@01 i@41@01)
        (Set_in (inv@44@01 r@47@01 i@41@01) xs@40@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@47@01)
              ($SortWrappers.IntTo$Snap i@41@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@47@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($PSF.lookup_p3 $t@43@01 ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@47@01)
            ($SortWrappers.IntTo$Snap i@41@01))))))
    (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@47@01)
      ($SortWrappers.IntTo$Snap i@41@01))) r@47@01 i@41@01)
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@47@01)
          ($SortWrappers.IntTo$Snap i@41@01))))
        ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@47@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
    (not (= r@47@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      $Snap.unit)
    (> i@41@01 0))))
; Joined path conditions
(assert (or (not (Set_in r@47@01 xs@40@01)) (Set_in r@47@01 xs@40@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@47@01 $Ref)) (!
  (and
    (=>
      (Set_in r@47@01 xs@40@01)
      (and
        (Set_in r@47@01 xs@40@01)
        (=>
          (and
            (img@45@01 r@47@01 i@41@01)
            (Set_in (inv@44@01 r@47@01 i@41@01) xs@40@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@47@01)
                  ($SortWrappers.IntTo$Snap i@41@01))
                $Snap.unit))
            (=
              ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@47@01)
                ($SortWrappers.IntTo$Snap i@41@01)))
              ($PSF.lookup_p3 $t@43@01 ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@47@01)
                ($SortWrappers.IntTo$Snap i@41@01))))))
        (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@47@01)
          ($SortWrappers.IntTo$Snap i@41@01))) r@47@01 i@41@01)
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@47@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@47@01)
              ($SortWrappers.IntTo$Snap i@41@01))))
            ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@47@01)
              ($SortWrappers.IntTo$Snap i@41@01))))))
        (not (= r@47@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@47@01)
            ($SortWrappers.IntTo$Snap i@41@01))))
          $Snap.unit)
        (> i@41@01 0)))
    (or (not (Set_in r@47@01 xs@40@01)) (Set_in r@47@01 xs@40@01)))
  :pattern ((Set_in r@47@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@47@11@47@71-aux|)))
(assert (forall ((r@47@01 $Ref)) (!
  (=>
    (Set_in r@47@01 xs@40@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@47@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))
      (+ i@41@01 1)))
  :pattern ((Set_in r@47@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@47@11@47@71|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall r: Ref ::
;     { (r in xs) }
;     (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i))
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i))
(declare-const r@51@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 6 | r@51@01 in xs@40@01 | live]
; [else-branch: 6 | !(r@51@01 in xs@40@01) | live]
(push) ; 5
; [then-branch: 6 | r@51@01 in xs@40@01]
(assert (Set_in r@51@01 xs@40@01))
; [eval] (unfolding acc(p3(r, i), write) in r.f == i)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@52@01 ((r $Ref) (i Int) (r@51@01 $Ref)) $Perm
  (ite
    (and (= r r@51@01) (= i i@41@01))
    ($Perm.min
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
        $Perm.Write
        $Perm.No)
      (pTaken@52@01 r i r@51@01))
    $Perm.No)
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@52@01 r i r@51@01) $Perm.No)
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@51@01) (= i i@41@01))
    (= (- $Perm.Write (pTaken@52@01 r i r@51@01)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@45@01 r@51@01 i@41@01) (Set_in (inv@44@01 r@51@01 i@41@01) xs@40@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@51@01)
          ($SortWrappers.IntTo$Snap i@41@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@51@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($PSF.lookup_p3 $t@43@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@51@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@51@01)
  ($SortWrappers.IntTo$Snap i@41@01))) r@51@01 i@41@01))
(assert (=
  ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@51@01)
    ($SortWrappers.IntTo$Snap i@41@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@51@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@51@01)
      ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (not (= r@51@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@51@01)
    ($SortWrappers.IntTo$Snap i@41@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@41@01 0))
; [eval] r.f == i
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@45@01 r@51@01 i@41@01)
      (Set_in (inv@44@01 r@51@01 i@41@01) xs@40@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@51@01)
            ($SortWrappers.IntTo$Snap i@41@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@51@01)
          ($SortWrappers.IntTo$Snap i@41@01)))
        ($PSF.lookup_p3 $t@43@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@51@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
  (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@51@01)
    ($SortWrappers.IntTo$Snap i@41@01))) r@51@01 i@41@01)
  (=
    ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@51@01)
      ($SortWrappers.IntTo$Snap i@41@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@51@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@51@01)
        ($SortWrappers.IntTo$Snap i@41@01))))))
  (not (= r@51@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@51@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    $Snap.unit)
  (> i@41@01 0)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 6 | !(r@51@01 in xs@40@01)]
(assert (not (Set_in r@51@01 xs@40@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@51@01 xs@40@01)
  (and
    (Set_in r@51@01 xs@40@01)
    (=>
      (and
        (img@45@01 r@51@01 i@41@01)
        (Set_in (inv@44@01 r@51@01 i@41@01) xs@40@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@51@01)
              ($SortWrappers.IntTo$Snap i@41@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@51@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($PSF.lookup_p3 $t@43@01 ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@51@01)
            ($SortWrappers.IntTo$Snap i@41@01))))))
    (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@51@01)
      ($SortWrappers.IntTo$Snap i@41@01))) r@51@01 i@41@01)
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@51@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@51@01)
          ($SortWrappers.IntTo$Snap i@41@01))))
        ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@51@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
    (not (= r@51@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@51@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      $Snap.unit)
    (> i@41@01 0))))
; Joined path conditions
(assert (or (not (Set_in r@51@01 xs@40@01)) (Set_in r@51@01 xs@40@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@51@01 $Ref)) (!
  (and
    (=>
      (Set_in r@51@01 xs@40@01)
      (and
        (Set_in r@51@01 xs@40@01)
        (=>
          (and
            (img@45@01 r@51@01 i@41@01)
            (Set_in (inv@44@01 r@51@01 i@41@01) xs@40@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@51@01)
                  ($SortWrappers.IntTo$Snap i@41@01))
                $Snap.unit))
            (=
              ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@51@01)
                ($SortWrappers.IntTo$Snap i@41@01)))
              ($PSF.lookup_p3 $t@43@01 ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@51@01)
                ($SortWrappers.IntTo$Snap i@41@01))))))
        (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@51@01)
          ($SortWrappers.IntTo$Snap i@41@01))) r@51@01 i@41@01)
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@51@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@51@01)
              ($SortWrappers.IntTo$Snap i@41@01))))
            ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@51@01)
              ($SortWrappers.IntTo$Snap i@41@01))))))
        (not (= r@51@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@51@01)
            ($SortWrappers.IntTo$Snap i@41@01))))
          $Snap.unit)
        (> i@41@01 0)))
    (or (not (Set_in r@51@01 xs@40@01)) (Set_in r@51@01 xs@40@01)))
  :pattern ((Set_in r@51@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@49@11@49@69-aux|)))
(push) ; 3
(assert (not (forall ((r@51@01 $Ref)) (!
  (=>
    (Set_in r@51@01 xs@40@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@51@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))
      i@41@01))
  :pattern ((Set_in r@51@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@49@11@49@69|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i))
(declare-const r@53@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 7 | r@53@01 in xs@40@01 | live]
; [else-branch: 7 | !(r@53@01 in xs@40@01) | live]
(push) ; 5
; [then-branch: 7 | r@53@01 in xs@40@01]
(assert (Set_in r@53@01 xs@40@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(p3(r, i), write) in r.f == i)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref) (i Int) (r@53@01 $Ref)) $Perm
  (ite
    (and (= r r@53@01) (= i i@41@01))
    ($Perm.min
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
        $Perm.Write
        $Perm.No)
      (pTaken@54@01 r i r@53@01))
    $Perm.No)
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@54@01 r i r@53@01) $Perm.No)
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@53@01) (= i i@41@01))
    (= (- $Perm.Write (pTaken@54@01 r i r@53@01)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@45@01 r@53@01 i@41@01) (Set_in (inv@44@01 r@53@01 i@41@01) xs@40@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@53@01)
          ($SortWrappers.IntTo$Snap i@41@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@53@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($PSF.lookup_p3 $t@43@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@53@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@53@01)
  ($SortWrappers.IntTo$Snap i@41@01))) r@53@01 i@41@01))
(assert (=
  ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@53@01)
    ($SortWrappers.IntTo$Snap i@41@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@53@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@53@01)
      ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (not (= r@53@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@53@01)
    ($SortWrappers.IntTo$Snap i@41@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@41@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.f == i
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@45@01 r@53@01 i@41@01)
      (Set_in (inv@44@01 r@53@01 i@41@01) xs@40@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@53@01)
            ($SortWrappers.IntTo$Snap i@41@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@53@01)
          ($SortWrappers.IntTo$Snap i@41@01)))
        ($PSF.lookup_p3 $t@43@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@53@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
  (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@53@01)
    ($SortWrappers.IntTo$Snap i@41@01))) r@53@01 i@41@01)
  (=
    ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@53@01)
      ($SortWrappers.IntTo$Snap i@41@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@53@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@53@01)
        ($SortWrappers.IntTo$Snap i@41@01))))))
  (not (= r@53@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@53@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    $Snap.unit)
  (> i@41@01 0)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | !(r@53@01 in xs@40@01)]
(assert (not (Set_in r@53@01 xs@40@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@53@01 xs@40@01)
  (and
    (Set_in r@53@01 xs@40@01)
    (=>
      (and
        (img@45@01 r@53@01 i@41@01)
        (Set_in (inv@44@01 r@53@01 i@41@01) xs@40@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@53@01)
              ($SortWrappers.IntTo$Snap i@41@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@53@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($PSF.lookup_p3 $t@43@01 ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@53@01)
            ($SortWrappers.IntTo$Snap i@41@01))))))
    (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@53@01)
      ($SortWrappers.IntTo$Snap i@41@01))) r@53@01 i@41@01)
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@53@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@53@01)
          ($SortWrappers.IntTo$Snap i@41@01))))
        ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@53@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
    (not (= r@53@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@53@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      $Snap.unit)
    (> i@41@01 0))))
; Joined path conditions
(assert (or (not (Set_in r@53@01 xs@40@01)) (Set_in r@53@01 xs@40@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@53@01 $Ref)) (!
  (and
    (=>
      (Set_in r@53@01 xs@40@01)
      (and
        (Set_in r@53@01 xs@40@01)
        (=>
          (and
            (img@45@01 r@53@01 i@41@01)
            (Set_in (inv@44@01 r@53@01 i@41@01) xs@40@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@53@01)
                  ($SortWrappers.IntTo$Snap i@41@01))
                $Snap.unit))
            (=
              ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@53@01)
                ($SortWrappers.IntTo$Snap i@41@01)))
              ($PSF.lookup_p3 $t@43@01 ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@53@01)
                ($SortWrappers.IntTo$Snap i@41@01))))))
        (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@53@01)
          ($SortWrappers.IntTo$Snap i@41@01))) r@53@01 i@41@01)
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@53@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@53@01)
              ($SortWrappers.IntTo$Snap i@41@01))))
            ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@53@01)
              ($SortWrappers.IntTo$Snap i@41@01))))))
        (not (= r@53@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@53@01)
            ($SortWrappers.IntTo$Snap i@41@01))))
          $Snap.unit)
        (> i@41@01 0)))
    (or (not (Set_in r@53@01 xs@40@01)) (Set_in r@53@01 xs@40@01)))
  :pattern ((Set_in r@53@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@49@11@49@69-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r@53@01 $Ref)) (!
  (=>
    (Set_in r@53@01 xs@40@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@53@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))
      i@41@01))
  :pattern ((Set_in r@53@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@49@11@49@69|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i))
(declare-const r@55@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 8 | r@55@01 in xs@40@01 | live]
; [else-branch: 8 | !(r@55@01 in xs@40@01) | live]
(push) ; 5
; [then-branch: 8 | r@55@01 in xs@40@01]
(assert (Set_in r@55@01 xs@40@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(p3(r, i), write) in r.f == i)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@56@01 ((r $Ref) (i Int) (r@55@01 $Ref)) $Perm
  (ite
    (and (= r r@55@01) (= i i@41@01))
    ($Perm.min
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
        $Perm.Write
        $Perm.No)
      (pTaken@56@01 r i r@55@01))
    $Perm.No)
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@56@01 r i r@55@01) $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@55@01) (= i i@41@01))
    (= (- $Perm.Write (pTaken@56@01 r i r@55@01)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@45@01 r@55@01 i@41@01) (Set_in (inv@44@01 r@55@01 i@41@01) xs@40@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@55@01)
          ($SortWrappers.IntTo$Snap i@41@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@55@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($PSF.lookup_p3 $t@43@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@55@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@55@01)
  ($SortWrappers.IntTo$Snap i@41@01))) r@55@01 i@41@01))
(assert (=
  ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@55@01)
    ($SortWrappers.IntTo$Snap i@41@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@55@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@55@01)
      ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (not (= r@55@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@55@01)
    ($SortWrappers.IntTo$Snap i@41@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@41@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.f == i
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@45@01 r@55@01 i@41@01)
      (Set_in (inv@44@01 r@55@01 i@41@01) xs@40@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@55@01)
            ($SortWrappers.IntTo$Snap i@41@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@55@01)
          ($SortWrappers.IntTo$Snap i@41@01)))
        ($PSF.lookup_p3 $t@43@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@55@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
  (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@55@01)
    ($SortWrappers.IntTo$Snap i@41@01))) r@55@01 i@41@01)
  (=
    ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@55@01)
      ($SortWrappers.IntTo$Snap i@41@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@55@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@55@01)
        ($SortWrappers.IntTo$Snap i@41@01))))))
  (not (= r@55@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@55@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    $Snap.unit)
  (> i@41@01 0)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 8 | !(r@55@01 in xs@40@01)]
(assert (not (Set_in r@55@01 xs@40@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@55@01 xs@40@01)
  (and
    (Set_in r@55@01 xs@40@01)
    (=>
      (and
        (img@45@01 r@55@01 i@41@01)
        (Set_in (inv@44@01 r@55@01 i@41@01) xs@40@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@55@01)
              ($SortWrappers.IntTo$Snap i@41@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@55@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($PSF.lookup_p3 $t@43@01 ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@55@01)
            ($SortWrappers.IntTo$Snap i@41@01))))))
    (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@55@01)
      ($SortWrappers.IntTo$Snap i@41@01))) r@55@01 i@41@01)
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@55@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@55@01)
          ($SortWrappers.IntTo$Snap i@41@01))))
        ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@55@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
    (not (= r@55@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@55@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      $Snap.unit)
    (> i@41@01 0))))
; Joined path conditions
(assert (or (not (Set_in r@55@01 xs@40@01)) (Set_in r@55@01 xs@40@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@55@01 $Ref)) (!
  (and
    (=>
      (Set_in r@55@01 xs@40@01)
      (and
        (Set_in r@55@01 xs@40@01)
        (=>
          (and
            (img@45@01 r@55@01 i@41@01)
            (Set_in (inv@44@01 r@55@01 i@41@01) xs@40@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@55@01)
                  ($SortWrappers.IntTo$Snap i@41@01))
                $Snap.unit))
            (=
              ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@55@01)
                ($SortWrappers.IntTo$Snap i@41@01)))
              ($PSF.lookup_p3 $t@43@01 ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@55@01)
                ($SortWrappers.IntTo$Snap i@41@01))))))
        (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@55@01)
          ($SortWrappers.IntTo$Snap i@41@01))) r@55@01 i@41@01)
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@55@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@55@01)
              ($SortWrappers.IntTo$Snap i@41@01))))
            ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@55@01)
              ($SortWrappers.IntTo$Snap i@41@01))))))
        (not (= r@55@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@55@01)
            ($SortWrappers.IntTo$Snap i@41@01))))
          $Snap.unit)
        (> i@41@01 0)))
    (or (not (Set_in r@55@01 xs@40@01)) (Set_in r@55@01 xs@40@01)))
  :pattern ((Set_in r@55@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@49@11@49@69-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r@55@01 $Ref)) (!
  (=>
    (Set_in r@55@01 xs@40@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@55@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))
      i@41@01))
  :pattern ((Set_in r@55@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@49@11@49@69|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (forall r: Ref :: { (r in xs) } (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i))
(declare-const r@57@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in xs) ==> (unfolding acc(p3(r, i), write) in r.f == i)
; [eval] (r in xs)
(push) ; 4
; [then-branch: 9 | r@57@01 in xs@40@01 | live]
; [else-branch: 9 | !(r@57@01 in xs@40@01) | live]
(push) ; 5
; [then-branch: 9 | r@57@01 in xs@40@01]
(assert (Set_in r@57@01 xs@40@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (unfolding acc(p3(r, i), write) in r.f == i)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((r $Ref) (i Int) (r@57@01 $Ref)) $Perm
  (ite
    (and (= r r@57@01) (= i i@41@01))
    ($Perm.min
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=
    (-
      (ite
        (and (img@45@01 r i) (Set_in (inv@44@01 r i) xs@40@01))
        $Perm.Write
        $Perm.No)
      (pTaken@58@01 r i r@57@01))
    $Perm.No)
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref) (i Int)) (!
  (= (pTaken@58@01 r i r@57@01) $Perm.No)
  
  :qid |quant-u-46|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref) (i Int)) (!
  (=>
    (and (= r r@57@01) (= i i@41@01))
    (= (- $Perm.Write (pTaken@58@01 r i r@57@01)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@45@01 r@57@01 i@41@01) (Set_in (inv@44@01 r@57@01 i@41@01) xs@40@01))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@57@01)
          ($SortWrappers.IntTo$Snap i@41@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@57@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($PSF.lookup_p3 $t@43@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@57@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@57@01)
  ($SortWrappers.IntTo$Snap i@41@01))) r@57@01 i@41@01))
(assert (=
  ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@57@01)
    ($SortWrappers.IntTo$Snap i@41@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@57@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@57@01)
      ($SortWrappers.IntTo$Snap i@41@01)))))))
(assert (not (= r@57@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@57@01)
    ($SortWrappers.IntTo$Snap i@41@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@41@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] r.f == i
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@45@01 r@57@01 i@41@01)
      (Set_in (inv@44@01 r@57@01 i@41@01) xs@40@01))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@57@01)
            ($SortWrappers.IntTo$Snap i@41@01))
          $Snap.unit))
      (=
        ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@57@01)
          ($SortWrappers.IntTo$Snap i@41@01)))
        ($PSF.lookup_p3 $t@43@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@57@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
  (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@57@01)
    ($SortWrappers.IntTo$Snap i@41@01))) r@57@01 i@41@01)
  (=
    ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@57@01)
      ($SortWrappers.IntTo$Snap i@41@01)))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@57@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@57@01)
        ($SortWrappers.IntTo$Snap i@41@01))))))
  (not (= r@57@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@57@01)
      ($SortWrappers.IntTo$Snap i@41@01))))
    $Snap.unit)
  (> i@41@01 0)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | !(r@57@01 in xs@40@01)]
(assert (not (Set_in r@57@01 xs@40@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in r@57@01 xs@40@01)
  (and
    (Set_in r@57@01 xs@40@01)
    (=>
      (and
        (img@45@01 r@57@01 i@41@01)
        (Set_in (inv@44@01 r@57@01 i@41@01) xs@40@01))
      (and
        (not
          (=
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@57@01)
              ($SortWrappers.IntTo$Snap i@41@01))
            $Snap.unit))
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@57@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($PSF.lookup_p3 $t@43@01 ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@57@01)
            ($SortWrappers.IntTo$Snap i@41@01))))))
    (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r@57@01)
      ($SortWrappers.IntTo$Snap i@41@01))) r@57@01 i@41@01)
    (=
      ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@57@01)
        ($SortWrappers.IntTo$Snap i@41@01)))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@57@01)
          ($SortWrappers.IntTo$Snap i@41@01))))
        ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@57@01)
          ($SortWrappers.IntTo$Snap i@41@01))))))
    (not (= r@57@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@57@01)
        ($SortWrappers.IntTo$Snap i@41@01))))
      $Snap.unit)
    (> i@41@01 0))))
; Joined path conditions
(assert (or (not (Set_in r@57@01 xs@40@01)) (Set_in r@57@01 xs@40@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((r@57@01 $Ref)) (!
  (and
    (=>
      (Set_in r@57@01 xs@40@01)
      (and
        (Set_in r@57@01 xs@40@01)
        (=>
          (and
            (img@45@01 r@57@01 i@41@01)
            (Set_in (inv@44@01 r@57@01 i@41@01) xs@40@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap r@57@01)
                  ($SortWrappers.IntTo$Snap i@41@01))
                $Snap.unit))
            (=
              ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@57@01)
                ($SortWrappers.IntTo$Snap i@41@01)))
              ($PSF.lookup_p3 $t@43@01 ($Snap.combine
                ($SortWrappers.$RefTo$Snap r@57@01)
                ($SortWrappers.IntTo$Snap i@41@01))))))
        (p3%trigger ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@57@01)
          ($SortWrappers.IntTo$Snap i@41@01))) r@57@01 i@41@01)
        (=
          ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@57@01)
            ($SortWrappers.IntTo$Snap i@41@01)))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@57@01)
              ($SortWrappers.IntTo$Snap i@41@01))))
            ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
              ($SortWrappers.$RefTo$Snap r@57@01)
              ($SortWrappers.IntTo$Snap i@41@01))))))
        (not (= r@57@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
            ($SortWrappers.$RefTo$Snap r@57@01)
            ($SortWrappers.IntTo$Snap i@41@01))))
          $Snap.unit)
        (> i@41@01 0)))
    (or (not (Set_in r@57@01 xs@40@01)) (Set_in r@57@01 xs@40@01)))
  :pattern ((Set_in r@57@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@49@11@49@69-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r@57@01 $Ref)) (!
  (=>
    (Set_in r@57@01 xs@40@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($PSF.lookup_p3 (as sm@49@01  $PSF<p3>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@57@01)
        ($SortWrappers.IntTo$Snap i@41@01)))))
      i@41@01))
  :pattern ((Set_in r@57@01 xs@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpredicates/arity/unfolding_arity.vpr@49@11@49@69|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
