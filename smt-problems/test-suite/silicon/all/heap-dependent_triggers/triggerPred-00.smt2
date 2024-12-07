(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:18
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/heap-dependent_triggers/triggerPred.vpr
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
(declare-sort $PSF<p> 0)
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
(declare-fun $SortWrappers.$PSF<p>To$Snap ($PSF<p>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<p> ($Snap) $PSF<p>)
(assert (forall ((x $PSF<p>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<p>($SortWrappers.$PSF<p>To$Snap x)))
    :pattern (($SortWrappers.$PSF<p>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<p>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<p>To$Snap($SortWrappers.$SnapTo$PSF<p> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<p> x))
    :qid |$Snap.$PSF<p>To$SnapTo$PSF<p>|
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
; /predicate_snap_functions_declarations.smt2 [p: Int]
(declare-fun $PSF.domain_p ($PSF<p>) Set<$Snap>)
(declare-fun $PSF.lookup_p ($PSF<p> $Snap) Int)
(declare-fun $PSF.after_p ($PSF<p> $PSF<p>) Bool)
(declare-fun $PSF.loc_p (Int $Snap) Bool)
(declare-fun $PSF.perm_p ($PPM $Snap) $Perm)
(declare-const $psfTOP_p $PSF<p>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p%trigger ($Snap $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [p: Int]
(assert (forall ((vs $PSF<p>) (ws $PSF<p>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_p vs) ($PSF.domain_p ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_p vs))
            (= ($PSF.lookup_p vs x) ($PSF.lookup_p ws x)))
          :pattern (($PSF.lookup_p vs x) ($PSF.lookup_p ws x))
          :qid |qp.$PSF<p>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<p>To$Snap vs)
              ($SortWrappers.$PSF<p>To$Snap ws)
              )
    :qid |qp.$PSF<p>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_p pm s))
    :pattern (($PSF.perm_p pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_p f s) true)
    :pattern (($PSF.loc_p f s)))))
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
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var y: Ref
(declare-const y@2@01 $Ref)
; [exec]
; inhale (forall x: Ref :: { p(x) } (x in xs) ==> acc(p(x), write))
(declare-const x@3@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@3@01 xs@1@01))
(declare-const sm@4@01 $PSF<p>)
(declare-const s@5@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@6@01 $PSF<p>)
(declare-fun inv@7@01 ($Ref) $Ref)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@3@01 $Ref) (x2@3@01 $Ref)) (!
  (=>
    (and (Set_in x1@3@01 xs@1@01) (Set_in x2@3@01 xs@1@01) (= x1@3@01 x2@3@01))
    (= x1@3@01 x2@3@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@3@01 $Ref)) (!
  (=>
    (Set_in x@3@01 xs@1@01)
    (and (= (inv@7@01 x@3@01) x@3@01) (img@8@01 x@3@01)))
  :pattern (($PSF.loc_p ($PSF.lookup_p $t@6@01 ($SortWrappers.$RefTo$Snap x@3@01)) ($SortWrappers.$RefTo$Snap x@3@01)))
  :qid |quant-u-1|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@8@01 x) (Set_in (inv@7@01 x) xs@1@01)) (= (inv@7@01 x) x))
  :pattern ((inv@7@01 x))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@9@01 $PSF<p>)
(declare-const s@10@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@10@01 $Snap)) (!
  (=>
    (and
      (img@8@01 ($SortWrappers.$SnapTo$Ref s@10@01))
      (Set_in (inv@7@01 ($SortWrappers.$SnapTo$Ref s@10@01)) xs@1@01))
    (and
      (not (= s@10@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@9@01  $PSF<p>) s@10@01)
        ($PSF.lookup_p $t@6@01 s@10@01))))
  :pattern (($PSF.lookup_p (as sm@9@01  $PSF<p>) s@10@01))
  :pattern (($PSF.lookup_p $t@6@01 s@10@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@10@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p $t@6@01 s@10@01) s@10@01)
  :pattern (($PSF.lookup_p (as sm@9@01  $PSF<p>) s@10@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@7@01 x) xs@1@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@9@01  $PSF<p>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@7@01 x))
  :qid |quant-u-2|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (y in xs)
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@2@01 xs@1@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert acc(p(y), write)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@9@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@2@01)) ($SortWrappers.$RefTo$Snap y@2@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@12@01 ((x $Ref)) $Perm
  (ite
    (= x y@2@01)
    ($Perm.min
      (ite (and (img@8@01 x) (Set_in (inv@7@01 x) xs@1@01)) $Perm.Write $Perm.No)
      $Perm.Write)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (and (img@8@01 x) (Set_in (inv@7@01 x) xs@1@01)) $Perm.Write $Perm.No)
      (pTaken@12@01 x))
    $Perm.No)
  
  :qid |quant-u-4|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@12@01 x) $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x y@2@01) (= (- $Perm.Write (pTaken@12@01 x)) $Perm.No))
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@8@01 y@2@01) (Set_in (inv@7@01 y@2@01) xs@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@2@01) $Snap.unit))
    (=
      ($PSF.lookup_p (as sm@9@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@2@01))
      ($PSF.lookup_p $t@6@01 ($SortWrappers.$RefTo$Snap y@2@01))))))
(assert ($PSF.loc_p ($PSF.lookup_p $t@6@01 ($SortWrappers.$RefTo$Snap y@2@01)) ($SortWrappers.$RefTo$Snap y@2@01)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const xs@13@01 Set<$Ref>)
(declare-const xs@14@01 Set<$Ref>)
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
; var y: Ref
(declare-const y@15@01 $Ref)
; [exec]
; inhale (forall x: Ref :: { p(x) } (x in xs) ==> acc(p(x), write))
(declare-const x@16@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@16@01 xs@14@01))
(declare-const sm@17@01 $PSF<p>)
(declare-const s@18@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@19@01 $PSF<p>)
(declare-fun inv@20@01 ($Ref) $Ref)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@16@01 $Ref) (x2@16@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@16@01 xs@14@01)
      (Set_in x2@16@01 xs@14@01)
      (= x1@16@01 x2@16@01))
    (= x1@16@01 x2@16@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@16@01 $Ref)) (!
  (=>
    (Set_in x@16@01 xs@14@01)
    (and (= (inv@20@01 x@16@01) x@16@01) (img@21@01 x@16@01)))
  :pattern (($PSF.loc_p ($PSF.lookup_p $t@19@01 ($SortWrappers.$RefTo$Snap x@16@01)) ($SortWrappers.$RefTo$Snap x@16@01)))
  :qid |quant-u-8|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@21@01 x) (Set_in (inv@20@01 x) xs@14@01)) (= (inv@20@01 x) x))
  :pattern ((inv@20@01 x))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@22@01 $PSF<p>)
(declare-const s@23@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@23@01 $Snap)) (!
  (=>
    (and
      (img@21@01 ($SortWrappers.$SnapTo$Ref s@23@01))
      (Set_in (inv@20@01 ($SortWrappers.$SnapTo$Ref s@23@01)) xs@14@01))
    (and
      (not (= s@23@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01)
        ($PSF.lookup_p $t@19@01 s@23@01))))
  :pattern (($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01))
  :pattern (($PSF.lookup_p $t@19@01 s@23@01))
  :qid |qp.psmValDef4|)))
(assert (forall ((s@23@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p $t@19@01 s@23@01) s@23@01)
  :pattern (($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01))
  :qid |qp.psmResTrgDef5|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@20@01 x) xs@14@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@22@01  $PSF<p>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@20@01 x))
  :qid |quant-u-9|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (y in xs)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@15@01 xs@14@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(p(y), write)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@22@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01)) ($SortWrappers.$RefTo$Snap y@15@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@25@01 ((x $Ref)) $Perm
  (ite
    (= x y@15@01)
    ($Perm.min
      (ite
        (and (img@21@01 x) (Set_in (inv@20@01 x) xs@14@01))
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@21@01 x) (Set_in (inv@20@01 x) xs@14@01))
        $Perm.Write
        $Perm.No)
      (pTaken@25@01 x))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@25@01 x) $Perm.No)
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x y@15@01) (= (- $Perm.Write (pTaken@25@01 x)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@21@01 y@15@01) (Set_in (inv@20@01 y@15@01) xs@14@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@15@01) $Snap.unit))
    (=
      ($PSF.lookup_p (as sm@22@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01))
      ($PSF.lookup_p $t@19@01 ($SortWrappers.$RefTo$Snap y@15@01))))))
(assert ($PSF.loc_p ($PSF.lookup_p $t@19@01 ($SortWrappers.$RefTo$Snap y@15@01)) ($SortWrappers.$RefTo$Snap y@15@01)))
(assert (not (= y@15@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p (as sm@22@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01))) y@15@01))
; [exec]
; assert perm(p(y)) == none
; [eval] perm(p(y)) == none
; [eval] perm(p(y))
(declare-const sm@26@01 $PSF<p>)
(declare-const s@27@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@27@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@21@01 ($SortWrappers.$SnapTo$Ref s@27@01))
        (Set_in (inv@20@01 ($SortWrappers.$SnapTo$Ref s@27@01)) xs@14@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@25@01 ($SortWrappers.$SnapTo$Ref s@27@01))))
      false)
    (and
      (not (= s@27@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@26@01  $PSF<p>) s@27@01)
        ($PSF.lookup_p $t@19@01 s@27@01))))
  :pattern (($PSF.lookup_p (as sm@26@01  $PSF<p>) s@27@01))
  :pattern (($PSF.lookup_p $t@19@01 s@27@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@27@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p $t@19@01 s@27@01) s@27@01)
  :pattern (($PSF.lookup_p (as sm@26@01  $PSF<p>) s@27@01))
  :qid |qp.psmResTrgDef7|)))
(declare-const pm@28@01 $PPM)
(assert (forall ((x $Ref)) (!
  (=
    ($PSF.perm_p (as pm@28@01  $PPM) ($SortWrappers.$RefTo$Snap x))
    (ite
      (and (img@21@01 x) (Set_in (inv@20@01 x) xs@14@01))
      (- $Perm.Write (pTaken@25@01 x))
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@28@01  $PPM) ($SortWrappers.$RefTo$Snap x)))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((x $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@26@01  $PSF<p>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x))
    ($PSF.loc_p ($PSF.lookup_p $t@19@01 ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.perm_p (as pm@28@01  $PPM) ($SortWrappers.$RefTo$Snap x)))
  :qid |qp.resTrgDef9|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@26@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01)) ($SortWrappers.$RefTo$Snap y@15@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_p (as pm@28@01  $PPM) ($SortWrappers.$RefTo$Snap y@15@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_p (as pm@28@01  $PPM) ($SortWrappers.$RefTo$Snap y@15@01))
  $Perm.No))
; [exec]
; fold acc(p(y), write)
(declare-const sm@29@01 $PSF<p>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p (as sm@29@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01))
  ($PSF.lookup_p (as sm@22@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01))))
(declare-const sm@30@01 $PSF<p>)
(declare-const s@31@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@31@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@31@01) y@15@01)
    (and
      (not (= s@31@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@30@01  $PSF<p>) s@31@01)
        ($PSF.lookup_p (as sm@29@01  $PSF<p>) s@31@01))))
  :pattern (($PSF.lookup_p (as sm@30@01  $PSF<p>) s@31@01))
  :pattern (($PSF.lookup_p (as sm@29@01  $PSF<p>) s@31@01))
  :qid |qp.psmValDef10|)))
(assert (forall ((s@31@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@21@01 ($SortWrappers.$SnapTo$Ref s@31@01))
        (Set_in (inv@20@01 ($SortWrappers.$SnapTo$Ref s@31@01)) xs@14@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@25@01 ($SortWrappers.$SnapTo$Ref s@31@01))))
      false)
    (and
      (not (= s@31@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@30@01  $PSF<p>) s@31@01)
        ($PSF.lookup_p $t@19@01 s@31@01))))
  :pattern (($PSF.lookup_p (as sm@30@01  $PSF<p>) s@31@01))
  :pattern (($PSF.lookup_p $t@19@01 s@31@01))
  :qid |qp.psmValDef11|)))
(assert (forall ((s@31@01 $Snap)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@29@01  $PSF<p>) s@31@01) s@31@01)
    ($PSF.loc_p ($PSF.lookup_p $t@19@01 s@31@01) s@31@01))
  :pattern (($PSF.lookup_p (as sm@30@01  $PSF<p>) s@31@01))
  :qid |qp.psmResTrgDef12|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@30@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01)) ($SortWrappers.$RefTo$Snap y@15@01)))
; [exec]
; assert acc(p(y), write)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@32@01 ((x $Ref)) $Perm
  (ite
    (= x y@15@01)
    ($Perm.min (ite (= x y@15@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@33@01 ((x $Ref)) $Perm
  (ite
    (= x y@15@01)
    ($Perm.min
      (ite
        (and (img@21@01 x) (Set_in (inv@20@01 x) xs@14@01))
        (- $Perm.Write (pTaken@25@01 x))
        $Perm.No)
      (- $Perm.Write (pTaken@32@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@32@01 y@15@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x y@15@01) (= (- $Perm.Write (pTaken@32@01 x)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap y@15@01) $Snap.unit))
  (=
    ($PSF.lookup_p (as sm@30@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01))
    ($PSF.lookup_p (as sm@29@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01)))))
(assert (=>
  (ite
    (and (img@21@01 y@15@01) (Set_in (inv@20@01 y@15@01) xs@14@01))
    (< $Perm.No (- $Perm.Write (pTaken@25@01 y@15@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@15@01) $Snap.unit))
    (=
      ($PSF.lookup_p (as sm@30@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01))
      ($PSF.lookup_p $t@19@01 ($SortWrappers.$RefTo$Snap y@15@01))))))
(assert (and
  ($PSF.loc_p ($PSF.lookup_p (as sm@29@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@15@01)) ($SortWrappers.$RefTo$Snap y@15@01))
  ($PSF.loc_p ($PSF.lookup_p $t@19@01 ($SortWrappers.$RefTo$Snap y@15@01)) ($SortWrappers.$RefTo$Snap y@15@01))))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const xs@34@01 Set<$Ref>)
(declare-const xs@35@01 Set<$Ref>)
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
; var y: Ref
(declare-const y@36@01 $Ref)
; [exec]
; inhale (forall x: Ref :: { p(x) } (x in xs) ==> acc(p(x), write))
(declare-const x@37@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@37@01 xs@35@01))
(declare-const sm@38@01 $PSF<p>)
(declare-const s@39@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@40@01 $PSF<p>)
(declare-fun inv@41@01 ($Ref) $Ref)
(declare-fun img@42@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@37@01 $Ref) (x2@37@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@37@01 xs@35@01)
      (Set_in x2@37@01 xs@35@01)
      (= x1@37@01 x2@37@01))
    (= x1@37@01 x2@37@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@37@01 $Ref)) (!
  (=>
    (Set_in x@37@01 xs@35@01)
    (and (= (inv@41@01 x@37@01) x@37@01) (img@42@01 x@37@01)))
  :pattern (($PSF.loc_p ($PSF.lookup_p $t@40@01 ($SortWrappers.$RefTo$Snap x@37@01)) ($SortWrappers.$RefTo$Snap x@37@01)))
  :qid |quant-u-18|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@42@01 x) (Set_in (inv@41@01 x) xs@35@01)) (= (inv@41@01 x) x))
  :pattern ((inv@41@01 x))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@43@01 $PSF<p>)
(declare-const s@44@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@44@01 $Snap)) (!
  (=>
    (and
      (img@42@01 ($SortWrappers.$SnapTo$Ref s@44@01))
      (Set_in (inv@41@01 ($SortWrappers.$SnapTo$Ref s@44@01)) xs@35@01))
    (and
      (not (= s@44@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@43@01  $PSF<p>) s@44@01)
        ($PSF.lookup_p $t@40@01 s@44@01))))
  :pattern (($PSF.lookup_p (as sm@43@01  $PSF<p>) s@44@01))
  :pattern (($PSF.lookup_p $t@40@01 s@44@01))
  :qid |qp.psmValDef14|)))
(assert (forall ((s@44@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p $t@40@01 s@44@01) s@44@01)
  :pattern (($PSF.lookup_p (as sm@43@01  $PSF<p>) s@44@01))
  :qid |qp.psmResTrgDef15|)))
(assert (forall ((x $Ref)) (!
  (=>
    (Set_in (inv@41@01 x) xs@35@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@43@01  $PSF<p>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern ((inv@41@01 x))
  :qid |quant-u-19|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (y in xs)
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@36@01 xs@35@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert perm(p(y)) == write
; [eval] perm(p(y)) == write
; [eval] perm(p(y))
; Definitional axioms for snapshot map values
(declare-const pm@46@01 $PPM)
(assert (forall ((x $Ref)) (!
  (=
    ($PSF.perm_p (as pm@46@01  $PPM) ($SortWrappers.$RefTo$Snap x))
    (ite
      (and (img@42@01 x) (Set_in (inv@41@01 x) xs@35@01))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_p (as pm@46@01  $PPM) ($SortWrappers.$RefTo$Snap x)))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((x $Ref)) (!
  (and
    ($PSF.loc_p ($PSF.lookup_p (as sm@43@01  $PSF<p>) ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x))
    ($PSF.loc_p ($PSF.lookup_p $t@40@01 ($SortWrappers.$RefTo$Snap x)) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.perm_p (as pm@46@01  $PPM) ($SortWrappers.$RefTo$Snap x)))
  :qid |qp.resTrgDef17|)))
(assert ($PSF.loc_p ($PSF.lookup_p (as sm@43@01  $PSF<p>) ($SortWrappers.$RefTo$Snap y@36@01)) ($SortWrappers.$RefTo$Snap y@36@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_p (as pm@46@01  $PPM) ($SortWrappers.$RefTo$Snap y@36@01))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_p (as pm@46@01  $PPM) ($SortWrappers.$RefTo$Snap y@36@01))
  $Perm.Write))
(pop) ; 2
(pop) ; 1
