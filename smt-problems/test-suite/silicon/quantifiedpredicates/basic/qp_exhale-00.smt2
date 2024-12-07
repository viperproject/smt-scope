(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:24:56
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/basic/qp_exhale.vpr
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
(declare-sort $PSF<p2> 0)
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
; /predicate_snap_functions_declarations.smt2 [p2: Int]
(declare-fun $PSF.domain_p2 ($PSF<p2>) Set<$Snap>)
(declare-fun $PSF.lookup_p2 ($PSF<p2> $Snap) Int)
(declare-fun $PSF.after_p2 ($PSF<p2> $PSF<p2>) Bool)
(declare-fun $PSF.loc_p2 (Int $Snap) Bool)
(declare-fun $PSF.perm_p2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_p2 $PSF<p2>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p1%trigger ($Snap) Bool)
(declare-fun p2%trigger ($Snap $Ref) Bool)
(declare-fun p3%trigger ($Snap $Ref) Bool)
(declare-fun p4%trigger ($Snap $Ref Int) Bool)
(declare-fun p5%trigger ($Snap $Ref Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [p2: Int]
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
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_p2 f s) true)
    :pattern (($PSF.loc_p2 f s)))))
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
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const z@2@01 $Ref)
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(declare-const z@5@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(declare-const sm@7@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@7@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap x@3@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(declare-const sm@8@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@8@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@4@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@4@01 x@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@9@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@9@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@5@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@6@01)))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@5@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@5@01 x@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const r@10@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@10@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01)))
(pop) ; 3
(declare-const $t@11@01 $PSF<p2>)
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@10@01 $Ref) (r2@10@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@10@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (Set_in r2@10@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (= r1@10@01 r2@10@01))
    (= r1@10@01 r2@10@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@10@01 $Ref)) (!
  (=>
    (Set_in r@10@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
    (and (= (inv@12@01 r@10@01) r@10@01) (img@13@01 r@10@01)))
  :pattern ((Set_in r@10@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01)))
  :pattern ((inv@12@01 r@10@01))
  :pattern ((img@13@01 r@10@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Set_in (inv@12@01 r) (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01)))
    (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const r@14@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@14@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01)))
(pop) ; 3
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@14@01 $Ref) (r2@14@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@14@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (Set_in r2@14@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (= r1@14@01 r2@14@01))
    (= r1@14@01 r2@14@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@14@01 $Ref)) (!
  (=>
    (Set_in r@14@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
    (and (= (inv@15@01 r@14@01) r@14@01) (img@16@01 r@14@01)))
  :pattern ((Set_in r@14@01 (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01)))
  :pattern ((inv@15@01 r@14@01))
  :pattern ((img@16@01 r@14@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@01 r)
      (Set_in (inv@15@01 r) (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01)))
    (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@15@01 r) (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (img@16@01 r)
      (= r (inv@15@01 r)))
    ($Perm.min (ite (= r x@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@15@01 r) (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (img@16@01 r)
      (= r (inv@15@01 r)))
    ($Perm.min
      (ite (= r y@4@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@17@01 r)))
    $Perm.No))
(define-fun pTaken@19@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@15@01 r) (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (img@16@01 r)
      (= r (inv@15@01 r)))
    ($Perm.min
      (ite (= r z@5@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@17@01 r)) (pTaken@18@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@17@01 x@3@01)) $Perm.No)))
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
      (Set_in (inv@15@01 r) (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (img@16@01 r)
      (= r (inv@15@01 r)))
    (= (- $Perm.Write (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@18@01 y@4@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@18@01 r) $Perm.No)
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
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
      (Set_in (inv@15@01 r) (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (img@16@01 r)
      (= r (inv@15@01 r)))
    (= (- (- $Perm.Write (pTaken@17@01 r)) (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-8|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@19@01 z@5@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@19@01 r) $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
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
      (Set_in (inv@15@01 r) (Set_unionone (Set_unionone (Set_singleton x@3@01) y@4@01) z@5@01))
      (img@16@01 r)
      (= r (inv@15@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@17@01 r)) (pTaken@18@01 r)) (pTaken@19@01 r))
      $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $PSF<p2>)
(declare-const s@21@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@21@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@21@01) x@3@01)
    (and
      (not (= s@21@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@20@01  $PSF<p2>) s@21@01)
        ($PSF.lookup_p2 (as sm@7@01  $PSF<p2>) s@21@01))))
  :pattern (($PSF.lookup_p2 (as sm@20@01  $PSF<p2>) s@21@01))
  :pattern (($PSF.lookup_p2 (as sm@7@01  $PSF<p2>) s@21@01))
  :qid |qp.psmValDef0|)))
(assert (forall ((s@21@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@21@01) y@4@01)
    (and
      (not (= s@21@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@20@01  $PSF<p2>) s@21@01)
        ($PSF.lookup_p2 (as sm@8@01  $PSF<p2>) s@21@01))))
  :pattern (($PSF.lookup_p2 (as sm@20@01  $PSF<p2>) s@21@01))
  :pattern (($PSF.lookup_p2 (as sm@8@01  $PSF<p2>) s@21@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@21@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@21@01) z@5@01)
    (and
      (not (= s@21@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@20@01  $PSF<p2>) s@21@01)
        ($PSF.lookup_p2 (as sm@9@01  $PSF<p2>) s@21@01))))
  :pattern (($PSF.lookup_p2 (as sm@20@01  $PSF<p2>) s@21@01))
  :pattern (($PSF.lookup_p2 (as sm@9@01  $PSF<p2>) s@21@01))
  :qid |qp.psmValDef2|)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const x@22@01 $Ref)
(declare-const y@23@01 $Ref)
(declare-const z@24@01 $Ref)
(declare-const x@25@01 $Ref)
(declare-const y@26@01 $Ref)
(declare-const z@27@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(declare-const sm@29@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@29@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap x@25@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@28@01))))
(assert (=
  ($Snap.second $t@28@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@28@01))
    ($Snap.second ($Snap.second $t@28@01)))))
(declare-const sm@30@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@30@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@26@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@28@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@26@01 x@25@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@31@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@31@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@27@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@28@01)))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@27@01 y@26@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@27@01 x@25@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(declare-const sm@33@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@33@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@27@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@32@01))))
(declare-const r@34@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y))
; [eval] Set(x, y)
(assert (Set_in r@34@01 (Set_unionone (Set_singleton x@25@01) y@26@01)))
(pop) ; 3
(declare-fun inv@35@01 ($Ref) $Ref)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@34@01 $Ref) (r2@34@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@34@01 (Set_unionone (Set_singleton x@25@01) y@26@01))
      (Set_in r2@34@01 (Set_unionone (Set_singleton x@25@01) y@26@01))
      (= r1@34@01 r2@34@01))
    (= r1@34@01 r2@34@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@34@01 $Ref)) (!
  (=>
    (Set_in r@34@01 (Set_unionone (Set_singleton x@25@01) y@26@01))
    (and (= (inv@35@01 r@34@01) r@34@01) (img@36@01 r@34@01)))
  :pattern ((Set_in r@34@01 (Set_unionone (Set_singleton x@25@01) y@26@01)))
  :pattern ((inv@35@01 r@34@01))
  :pattern ((img@36@01 r@34@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@36@01 r)
      (Set_in (inv@35@01 r) (Set_unionone (Set_singleton x@25@01) y@26@01)))
    (= (inv@35@01 r) r))
  :pattern ((inv@35@01 r))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (= r z@27@01)
    ($Perm.min (ite (= r z@27@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@38@01 ((r $Ref)) $Perm
  (ite
    (= r z@27@01)
    ($Perm.min
      (ite (= r x@25@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@37@01 r)))
    $Perm.No))
(define-fun pTaken@39@01 ((r $Ref)) $Perm
  (ite
    (= r z@27@01)
    ($Perm.min
      (ite (= r y@26@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@37@01 r)) (pTaken@38@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@37@01 z@27@01)) $Perm.No)))
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
  (=> (= r z@27@01) (= (- $Perm.Write (pTaken@37@01 r)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@40@01 $PSF<p2>)
(declare-const s@41@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= z@27@01 x@25@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@27@01) $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@40@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@27@01))
      ($PSF.lookup_p2 (as sm@29@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@27@01))))))
(assert (=>
  (= z@27@01 y@26@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@27@01) $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@40@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@27@01))
      ($PSF.lookup_p2 (as sm@30@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@27@01))))))
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap z@27@01) $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@40@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@27@01))
    ($PSF.lookup_p2 (as sm@31@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@27@01)))))
(declare-const r@42@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in Set(x, y))
; [eval] Set(x, y)
(assert (Set_in r@42@01 (Set_unionone (Set_singleton x@25@01) y@26@01)))
(pop) ; 3
(declare-fun inv@43@01 ($Ref) $Ref)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@42@01 $Ref) (r2@42@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@42@01 (Set_unionone (Set_singleton x@25@01) y@26@01))
      (Set_in r2@42@01 (Set_unionone (Set_singleton x@25@01) y@26@01))
      (= r1@42@01 r2@42@01))
    (= r1@42@01 r2@42@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@42@01 $Ref)) (!
  (=>
    (Set_in r@42@01 (Set_unionone (Set_singleton x@25@01) y@26@01))
    (and (= (inv@43@01 r@42@01) r@42@01) (img@44@01 r@42@01)))
  :pattern ((Set_in r@42@01 (Set_unionone (Set_singleton x@25@01) y@26@01)))
  :pattern ((inv@43@01 r@42@01))
  :pattern ((img@44@01 r@42@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@44@01 r)
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@25@01) y@26@01)))
    (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@25@01) y@26@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    ($Perm.min (ite (= r y@26@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@25@01) y@26@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    ($Perm.min
      (ite (= r x@25@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@45@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@45@01 y@26@01)) $Perm.No)))
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
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@25@01) y@26@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    (= (- $Perm.Write (pTaken@45@01 r)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@46@01 x@25@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@46@01 r) $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
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
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@25@01) y@26@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    (= (- (- $Perm.Write (pTaken@45@01 r)) (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 3
; 0,09s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@47@01 $PSF<p2>)
(declare-const s@48@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@48@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@48@01) y@26@01)
    (and
      (not (= s@48@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@47@01  $PSF<p2>) s@48@01)
        ($PSF.lookup_p2 (as sm@30@01  $PSF<p2>) s@48@01))))
  :pattern (($PSF.lookup_p2 (as sm@47@01  $PSF<p2>) s@48@01))
  :pattern (($PSF.lookup_p2 (as sm@30@01  $PSF<p2>) s@48@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@48@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@48@01) x@25@01)
    (and
      (not (= s@48@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@47@01  $PSF<p2>) s@48@01)
        ($PSF.lookup_p2 (as sm@29@01  $PSF<p2>) s@48@01))))
  :pattern (($PSF.lookup_p2 (as sm@47@01  $PSF<p2>) s@48@01))
  :pattern (($PSF.lookup_p2 (as sm@29@01  $PSF<p2>) s@48@01))
  :qid |qp.psmValDef7|)))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const x@49@01 $Ref)
(declare-const y@50@01 $Ref)
(declare-const z@51@01 $Ref)
(declare-const x@52@01 $Ref)
(declare-const y@53@01 $Ref)
(declare-const z@54@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(declare-const sm@56@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@56@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap x@52@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@55@01))))
(assert (=
  ($Snap.second $t@55@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.second ($Snap.second $t@55@01)))))
(declare-const sm@57@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@57@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@53@01))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@55@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@53@01 x@52@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-const sm@58@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@58@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@54@01))
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second $t@55@01)))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@54@01 y@53@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@54@01 x@52@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@59@01 $Snap)
(assert (= $t@59@01 ($Snap.combine ($Snap.first $t@59@01) ($Snap.second $t@59@01))))
(declare-const r@60@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y))
; [eval] Set(x, y)
(assert (Set_in r@60@01 (Set_unionone (Set_singleton x@52@01) y@53@01)))
(pop) ; 3
(declare-fun inv@61@01 ($Ref) $Ref)
(declare-fun img@62@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@60@01 $Ref) (r2@60@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@60@01 (Set_unionone (Set_singleton x@52@01) y@53@01))
      (Set_in r2@60@01 (Set_unionone (Set_singleton x@52@01) y@53@01))
      (= r1@60@01 r2@60@01))
    (= r1@60@01 r2@60@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@60@01 $Ref)) (!
  (=>
    (Set_in r@60@01 (Set_unionone (Set_singleton x@52@01) y@53@01))
    (and (= (inv@61@01 r@60@01) r@60@01) (img@62@01 r@60@01)))
  :pattern ((Set_in r@60@01 (Set_unionone (Set_singleton x@52@01) y@53@01)))
  :pattern ((inv@61@01 r@60@01))
  :pattern ((img@62@01 r@60@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@01 r)
      (Set_in (inv@61@01 r) (Set_unionone (Set_singleton x@52@01) y@53@01)))
    (= (inv@61@01 r) r))
  :pattern ((inv@61@01 r))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@63@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@63@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@54@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@59@01))))
(pop) ; 2
(push) ; 2
(declare-const r@64@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y))
; [eval] Set(x, y)
(assert (Set_in r@64@01 (Set_unionone (Set_singleton x@52@01) y@53@01)))
(pop) ; 3
(declare-fun inv@65@01 ($Ref) $Ref)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@64@01 $Ref) (r2@64@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@64@01 (Set_unionone (Set_singleton x@52@01) y@53@01))
      (Set_in r2@64@01 (Set_unionone (Set_singleton x@52@01) y@53@01))
      (= r1@64@01 r2@64@01))
    (= r1@64@01 r2@64@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@64@01 $Ref)) (!
  (=>
    (Set_in r@64@01 (Set_unionone (Set_singleton x@52@01) y@53@01))
    (and (= (inv@65@01 r@64@01) r@64@01) (img@66@01 r@64@01)))
  :pattern ((Set_in r@64@01 (Set_unionone (Set_singleton x@52@01) y@53@01)))
  :pattern ((inv@65@01 r@64@01))
  :pattern ((img@66@01 r@64@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@01 r)
      (Set_in (inv@65@01 r) (Set_unionone (Set_singleton x@52@01) y@53@01)))
    (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@67@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@65@01 r) (Set_unionone (Set_singleton x@52@01) y@53@01))
      (img@66@01 r)
      (= r (inv@65@01 r)))
    ($Perm.min (ite (= r x@52@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@65@01 r) (Set_unionone (Set_singleton x@52@01) y@53@01))
      (img@66@01 r)
      (= r (inv@65@01 r)))
    ($Perm.min
      (ite (= r y@53@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@67@01 r)))
    $Perm.No))
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@65@01 r) (Set_unionone (Set_singleton x@52@01) y@53@01))
      (img@66@01 r)
      (= r (inv@65@01 r)))
    ($Perm.min
      (ite (= r z@54@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@67@01 r)) (pTaken@68@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@67@01 x@52@01)) $Perm.No)))
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
      (Set_in (inv@65@01 r) (Set_unionone (Set_singleton x@52@01) y@53@01))
      (img@66@01 r)
      (= r (inv@65@01 r)))
    (= (- $Perm.Write (pTaken@67@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@68@01 y@53@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@68@01 r) $Perm.No)
  
  :qid |quant-u-31|))))
(check-sat)
; unknown
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
      (Set_in (inv@65@01 r) (Set_unionone (Set_singleton x@52@01) y@53@01))
      (img@66@01 r)
      (= r (inv@65@01 r)))
    (= (- (- $Perm.Write (pTaken@67@01 r)) (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@70@01 $PSF<p2>)
(declare-const s@71@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@71@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@71@01) x@52@01)
    (and
      (not (= s@71@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01)
        ($PSF.lookup_p2 (as sm@56@01  $PSF<p2>) s@71@01))))
  :pattern (($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01))
  :pattern (($PSF.lookup_p2 (as sm@56@01  $PSF<p2>) s@71@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@71@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@71@01) y@53@01)
    (and
      (not (= s@71@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01)
        ($PSF.lookup_p2 (as sm@57@01  $PSF<p2>) s@71@01))))
  :pattern (($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01))
  :pattern (($PSF.lookup_p2 (as sm@57@01  $PSF<p2>) s@71@01))
  :qid |qp.psmValDef9|)))
(assert (forall ((s@71@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@71@01) z@54@01)
    (and
      (not (= s@71@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01)
        ($PSF.lookup_p2 (as sm@58@01  $PSF<p2>) s@71@01))))
  :pattern (($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01))
  :pattern (($PSF.lookup_p2 (as sm@58@01  $PSF<p2>) s@71@01))
  :qid |qp.psmValDef10|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((r $Ref)) $Perm
  (ite
    (= r z@54@01)
    ($Perm.min (ite (= r z@54@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@73@01 ((r $Ref)) $Perm
  (ite
    (= r z@54@01)
    ($Perm.min
      (ite (= r y@53@01) (- $Perm.Write (pTaken@68@01 r)) $Perm.No)
      (- $Perm.Write (pTaken@72@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@72@01 z@54@01)) $Perm.No)))
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
  (=> (= r z@54@01) (= (- $Perm.Write (pTaken@72@01 r)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@74@01 $PSF<p2>)
(declare-const s@75@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap z@54@01) $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@74@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@54@01))
    ($PSF.lookup_p2 (as sm@58@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@54@01)))))
(assert (=>
  (ite
    (= z@54@01 y@53@01)
    (< $Perm.No (- $Perm.Write (pTaken@68@01 z@54@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@54@01) $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@74@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@54@01))
      ($PSF.lookup_p2 (as sm@57@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@54@01))))))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const x@76@01 $Ref)
(declare-const y@77@01 $Ref)
(declare-const z@78@01 $Ref)
(declare-const x@79@01 $Ref)
(declare-const y@80@01 $Ref)
(declare-const z@81@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 ($Snap.combine ($Snap.first $t@82@01) ($Snap.second $t@82@01))))
(declare-const sm@83@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@83@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap x@79@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@82@01))))
(declare-const sm@84@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@84@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@80@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@82@01))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@80@01 x@79@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const r@85@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@85@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
(pop) ; 3
(declare-const $t@86@01 $PSF<p2>)
(declare-fun inv@87@01 ($Ref) $Ref)
(declare-fun img@88@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@85@01 $Ref) (r2@85@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@85@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (Set_in r2@85@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (= r1@85@01 r2@85@01))
    (= r1@85@01 r2@85@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@85@01 $Ref)) (!
  (=>
    (Set_in r@85@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
    (and (= (inv@87@01 r@85@01) r@85@01) (img@88@01 r@85@01)))
  :pattern ((Set_in r@85@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
  :pattern ((inv@87@01 r@85@01))
  :pattern ((img@88@01 r@85@01))
  :qid |quant-u-37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@88@01 r)
      (Set_in (inv@87@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
    (= (inv@87@01 r) r))
  :pattern ((inv@87@01 r))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const r@89@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@89@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
(pop) ; 3
(declare-fun inv@90@01 ($Ref) $Ref)
(declare-fun img@91@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@89@01 $Ref) (r2@89@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@89@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (Set_in r2@89@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (= r1@89@01 r2@89@01))
    (= r1@89@01 r2@89@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@89@01 $Ref)) (!
  (=>
    (Set_in r@89@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
    (and (= (inv@90@01 r@89@01) r@89@01) (img@91@01 r@89@01)))
  :pattern ((Set_in r@89@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
  :pattern ((inv@90@01 r@89@01))
  :pattern ((img@91@01 r@89@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@91@01 r)
      (Set_in (inv@90@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
    (= (inv@90@01 r) r))
  :pattern ((inv@90@01 r))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@92@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@90@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@91@01 r)
      (= r (inv@90@01 r)))
    ($Perm.min (ite (= r x@79@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@90@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@91@01 r)
      (= r (inv@90@01 r)))
    ($Perm.min
      (ite (= r y@80@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@92@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@92@01 x@79@01)) $Perm.No)))
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
      (Set_in (inv@90@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@91@01 r)
      (= r (inv@90@01 r)))
    (= (- $Perm.Write (pTaken@92@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@93@01 y@80@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@93@01 r) $Perm.No)
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
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
      (Set_in (inv@90@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@91@01 r)
      (= r (inv@90@01 r)))
    (= (- (- $Perm.Write (pTaken@92@01 r)) (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-44|))))
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
    (and
      (Set_in (inv@90@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@91@01 r)
      (= r (inv@90@01 r)))
    (= (- (- $Perm.Write (pTaken@92@01 r)) (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-44|))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@79@01 y@80@01)))
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
    ($PSF.lookup_p2 (as sm@83@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap x@79@01))
    ($PSF.lookup_p2 (as sm@84@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@80@01))))))
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
    ($PSF.lookup_p2 (as sm@84@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@80@01))
    ($PSF.lookup_p2 (as sm@83@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap x@79@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const r@94@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@94@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
(pop) ; 3
(declare-fun inv@95@01 ($Ref) $Ref)
(declare-fun img@96@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@94@01 $Ref) (r2@94@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@94@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (Set_in r2@94@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (= r1@94@01 r2@94@01))
    (= r1@94@01 r2@94@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@94@01 $Ref)) (!
  (=>
    (Set_in r@94@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
    (and (= (inv@95@01 r@94@01) r@94@01) (img@96@01 r@94@01)))
  :pattern ((Set_in r@94@01 (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
  :pattern ((inv@95@01 r@94@01))
  :pattern ((img@96@01 r@94@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@96@01 r)
      (Set_in (inv@95@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01)))
    (= (inv@95@01 r) r))
  :pattern ((inv@95@01 r))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@97@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@95@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@96@01 r)
      (= r (inv@95@01 r)))
    ($Perm.min (ite (= r y@80@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@98@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@95@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@96@01 r)
      (= r (inv@95@01 r)))
    ($Perm.min
      (ite (= r x@79@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@97@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@97@01 y@80@01)) $Perm.No)))
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
      (Set_in (inv@95@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@96@01 r)
      (= r (inv@95@01 r)))
    (= (- $Perm.Write (pTaken@97@01 r)) $Perm.No))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@98@01 x@79@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@98@01 r) $Perm.No)
  
  :qid |quant-u-50|))))
(check-sat)
; unknown
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
      (Set_in (inv@95@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@96@01 r)
      (= r (inv@95@01 r)))
    (= (- (- $Perm.Write (pTaken@97@01 r)) (pTaken@98@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
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
    (and
      (Set_in (inv@95@01 r) (Set_unionone (Set_unionone (Set_singleton x@79@01) y@80@01) z@81@01))
      (img@96@01 r)
      (= r (inv@95@01 r)))
    (= (- (- $Perm.Write (pTaken@97@01 r)) (pTaken@98@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const x@99@01 $Ref)
(declare-const y@100@01 $Ref)
(declare-const z@101@01 $Ref)
(declare-const x@102@01 $Ref)
(declare-const y@103@01 $Ref)
(declare-const z@104@01 $Ref)
(push) ; 1
(declare-const $t@105@01 $Snap)
(assert (= $t@105@01 ($Snap.combine ($Snap.first $t@105@01) ($Snap.second $t@105@01))))
(declare-const sm@106@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@106@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@103@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@105@01))))
(declare-const sm@107@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@107@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@104@01))
  ($SortWrappers.$SnapToInt ($Snap.second $t@105@01))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@104@01 y@103@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const r@108@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@108@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
(pop) ; 3
(declare-const $t@109@01 $PSF<p2>)
(declare-fun inv@110@01 ($Ref) $Ref)
(declare-fun img@111@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@108@01 $Ref) (r2@108@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@108@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (Set_in r2@108@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (= r1@108@01 r2@108@01))
    (= r1@108@01 r2@108@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@108@01 $Ref)) (!
  (=>
    (Set_in r@108@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
    (and (= (inv@110@01 r@108@01) r@108@01) (img@111@01 r@108@01)))
  :pattern ((Set_in r@108@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
  :pattern ((inv@110@01 r@108@01))
  :pattern ((img@111@01 r@108@01))
  :qid |quant-u-53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Set_in (inv@110@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
    (= (inv@110@01 r) r))
  :pattern ((inv@110@01 r))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
(pop) ; 2
(push) ; 2
(declare-const r@112@01 $Ref)
(push) ; 3
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@112@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
(pop) ; 3
(declare-fun inv@113@01 ($Ref) $Ref)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@112@01 $Ref) (r2@112@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@112@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (Set_in r2@112@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (= r1@112@01 r2@112@01))
    (= r1@112@01 r2@112@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@112@01 $Ref)) (!
  (=>
    (Set_in r@112@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
    (and (= (inv@113@01 r@112@01) r@112@01) (img@114@01 r@112@01)))
  :pattern ((Set_in r@112@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
  :pattern ((inv@113@01 r@112@01))
  :pattern ((img@114@01 r@112@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Set_in (inv@113@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
    (= (inv@113@01 r) r))
  :pattern ((inv@113@01 r))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@113@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@114@01 r)
      (= r (inv@113@01 r)))
    ($Perm.min (ite (= r y@103@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@116@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@113@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@114@01 r)
      (= r (inv@113@01 r)))
    ($Perm.min
      (ite (= r z@104@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@115@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@115@01 y@103@01)) $Perm.No)))
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
      (Set_in (inv@113@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@114@01 r)
      (= r (inv@113@01 r)))
    (= (- $Perm.Write (pTaken@115@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@116@01 z@104@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@116@01 r) $Perm.No)
  
  :qid |quant-u-59|))))
(check-sat)
; unknown
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
      (Set_in (inv@113@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@114@01 r)
      (= r (inv@113@01 r)))
    (= (- (- $Perm.Write (pTaken@115@01 r)) (pTaken@116@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
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
    (and
      (Set_in (inv@113@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@114@01 r)
      (= r (inv@113@01 r)))
    (= (- (- $Perm.Write (pTaken@115@01 r)) (pTaken@116@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@103@01 z@104@01)))
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
    ($PSF.lookup_p2 (as sm@106@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@103@01))
    ($PSF.lookup_p2 (as sm@107@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@104@01))))))
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
    ($PSF.lookup_p2 (as sm@107@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap z@104@01))
    ($PSF.lookup_p2 (as sm@106@01  $PSF<p2>) ($SortWrappers.$RefTo$Snap y@103@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const r@117@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@117@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
(pop) ; 3
(declare-fun inv@118@01 ($Ref) $Ref)
(declare-fun img@119@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@117@01 $Ref) (r2@117@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@117@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (Set_in r2@117@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (= r1@117@01 r2@117@01))
    (= r1@117@01 r2@117@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@117@01 $Ref)) (!
  (=>
    (Set_in r@117@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
    (and (= (inv@118@01 r@117@01) r@117@01) (img@119@01 r@117@01)))
  :pattern ((Set_in r@117@01 (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
  :pattern ((inv@118@01 r@117@01))
  :pattern ((img@119@01 r@117@01))
  :qid |p2-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@119@01 r)
      (Set_in (inv@118@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01)))
    (= (inv@118@01 r) r))
  :pattern ((inv@118@01 r))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@118@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    ($Perm.min (ite (= r z@104@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@121@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@118@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    ($Perm.min
      (ite (= r y@103@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@120@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@120@01 z@104@01)) $Perm.No)))
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
      (Set_in (inv@118@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    (= (- $Perm.Write (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@121@01 y@103@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@121@01 r) $Perm.No)
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
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
      (Set_in (inv@118@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    (= (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@121@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
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
    (and
      (Set_in (inv@118@01 r) (Set_unionone (Set_unionone (Set_singleton x@102@01) y@103@01) z@104@01))
      (img@119@01 r)
      (= r (inv@118@01 r)))
    (= (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@121@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
