(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:00
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0493a.vpr
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
(declare-fun foo ($Snap Set<$Ref>) Int)
(declare-fun foo%limited ($Snap Set<$Ref>) Int)
(declare-fun foo%stateless (Set<$Ref>) Bool)
(declare-fun foo%precondition ($Snap Set<$Ref>) Bool)
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
(declare-fun inv@5@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@6@00 ($Snap Set<$Ref> $Ref) Bool)
(declare-fun sm@3@00 ($Snap Set<$Ref>) $PSF<p>)
(assert (forall ((s@$ $Snap) (set@0@00 Set<$Ref>)) (!
  (= (foo%limited s@$ set@0@00) (foo s@$ set@0@00))
  :pattern ((foo s@$ set@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (set@0@00 Set<$Ref>)) (!
  (foo%stateless set@0@00)
  :pattern ((foo%limited s@$ set@0@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- meth ----------
(declare-const set@0@01 Set<$Ref>)
(declare-const set@1@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(declare-const a@3@01 $Ref)
(push) ; 2
; [eval] (a in set)
(assert (Set_in a@3@01 set@1@01))
(declare-const sm@4@01 $PSF<p>)
(declare-const s@5@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((a1@3@01 $Ref) (a2@3@01 $Ref)) (!
  (=>
    (and (Set_in a1@3@01 set@1@01) (Set_in a2@3@01 set@1@01) (= a1@3@01 a2@3@01))
    (= a1@3@01 a2@3@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@3@01 $Ref)) (!
  (=>
    (Set_in a@3@01 set@1@01)
    (and (= (inv@6@01 a@3@01) a@3@01) (img@7@01 a@3@01)))
  :pattern (($PSF.loc_p ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) ($SortWrappers.$RefTo$Snap a@3@01)) ($SortWrappers.$RefTo$Snap a@3@01)))
  :qid |quant-u-6|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@7@01 a) (Set_in (inv@6@01 a) set@1@01)) (= (inv@6@01 a) a))
  :pattern ((inv@6@01 a))
  :qid |p-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@8@01 $PSF<p>)
(declare-const s@9@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@9@01 $Snap)) (!
  (=>
    (and
      (img@7@01 ($SortWrappers.$SnapTo$Ref s@9@01))
      (Set_in (inv@6@01 ($SortWrappers.$SnapTo$Ref s@9@01)) set@1@01))
    (and
      (not (= s@9@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@8@01  $PSF<p>) s@9@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@9@01))))
  :pattern (($PSF.lookup_p (as sm@8@01  $PSF<p>) s@9@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@9@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@9@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@9@01) s@9@01)
  :pattern (($PSF.lookup_p (as sm@8@01  $PSF<p>) s@9@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@6@01 a) set@1@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@8@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@6@01 a))
  :qid |quant-u-7|)))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] foo(set) == 0
; [eval] foo(set)
(push) ; 2
(declare-const a@10@01 $Ref)
(push) ; 3
; [eval] (a in set)
(assert (Set_in a@10@01 set@1@01))
(pop) ; 3
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@10@01 $Ref) (a2@10@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@10@01 set@1@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@8@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a1@10@01)) ($SortWrappers.$RefTo$Snap a1@10@01)))
      (and
        (Set_in a2@10@01 set@1@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@8@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a2@10@01)) ($SortWrappers.$RefTo$Snap a2@10@01)))
      (= a1@10@01 a2@10@01))
    (= a1@10@01 a2@10@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@10@01 $Ref)) (!
  (=>
    (Set_in a@10@01 set@1@01)
    (and (= (inv@11@01 a@10@01) a@10@01) (img@12@01 a@10@01)))
  :pattern ((Set_in a@10@01 set@1@01))
  :pattern ((inv@11@01 a@10@01))
  :pattern ((img@12@01 a@10@01))
  :qid |p-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@12@01 a) (Set_in (inv@11@01 a) set@1@01)) (= (inv@11@01 a) a))
  :pattern ((inv@11@01 a))
  :qid |p-fctOfInv|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@11@01 a) set@1@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@8@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@11@01 a))
  :qid |quant-u-9|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@11@01 a) set@1@01) (img@12@01 a) (= a (inv@11@01 a)))
    ($Perm.min
      (ite
        (and (img@7@01 a) (Set_in (inv@6@01 a) set@1@01))
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
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@7@01 a) (Set_in (inv@6@01 a) set@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@13@01 a))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Set_in (inv@11@01 a) set@1@01) (img@12@01 a) (= a (inv@11@01 a)))
    (= (- $Perm.Write (pTaken@13@01 a)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@14@01 $PSF<p>)
(declare-const s@15@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@15@01 $Snap)) (!
  (and
    (=>
      (Set_in s@15@01 ($PSF.domain_p (as sm@14@01  $PSF<p>)))
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@15@01)) set@1@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@15@01))))
    (=>
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@15@01)) set@1@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@15@01)))
      (Set_in s@15@01 ($PSF.domain_p (as sm@14@01  $PSF<p>)))))
  :pattern ((Set_in s@15@01 ($PSF.domain_p (as sm@14@01  $PSF<p>))))
  :qid |qp.psmDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@15@01)) set@1@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@15@01)))
      (and
        (img@7@01 ($SortWrappers.$SnapTo$Ref s@15@01))
        (Set_in (inv@6@01 ($SortWrappers.$SnapTo$Ref s@15@01)) set@1@01)))
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@14@01  $PSF<p>) s@15@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@15@01))))
  :pattern (($PSF.lookup_p (as sm@14@01  $PSF<p>) s@15@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@15@01))
  :qid |qp.psmValDef3|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@15@01) s@15@01)
  :pattern (($PSF.lookup_p (as sm@14@01  $PSF<p>) s@15@01))
  :qid |qp.psmResTrgDef4|)))
(assert (foo%precondition ($SortWrappers.$PSF<p>To$Snap (as sm@14@01  $PSF<p>)) set@1@01))
(pop) ; 2
; Joined path conditions
(assert (forall ((a@10@01 $Ref)) (!
  (=>
    (Set_in a@10@01 set@1@01)
    (and (= (inv@11@01 a@10@01) a@10@01) (img@12@01 a@10@01)))
  :pattern ((Set_in a@10@01 set@1@01))
  :pattern ((inv@11@01 a@10@01))
  :pattern ((img@12@01 a@10@01))
  :qid |p-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@12@01 a) (Set_in (inv@11@01 a) set@1@01)) (= (inv@11@01 a) a))
  :pattern ((inv@11@01 a))
  :qid |p-fctOfInv|)))
(assert (forall ((s@15@01 $Snap)) (!
  (and
    (=>
      (Set_in s@15@01 ($PSF.domain_p (as sm@14@01  $PSF<p>)))
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@15@01)) set@1@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@15@01))))
    (=>
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@15@01)) set@1@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@15@01)))
      (Set_in s@15@01 ($PSF.domain_p (as sm@14@01  $PSF<p>)))))
  :pattern ((Set_in s@15@01 ($PSF.domain_p (as sm@14@01  $PSF<p>))))
  :qid |qp.psmDomDef5|)))
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@15@01)) set@1@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@15@01)))
      (and
        (img@7@01 ($SortWrappers.$SnapTo$Ref s@15@01))
        (Set_in (inv@6@01 ($SortWrappers.$SnapTo$Ref s@15@01)) set@1@01)))
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@14@01  $PSF<p>) s@15@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@15@01))))
  :pattern (($PSF.lookup_p (as sm@14@01  $PSF<p>) s@15@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@15@01))
  :qid |qp.psmValDef3|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@15@01) s@15@01)
  :pattern (($PSF.lookup_p (as sm@14@01  $PSF<p>) s@15@01))
  :qid |qp.psmResTrgDef4|)))
(assert (and
  (forall ((a $Ref)) (!
    (=>
      (Set_in (inv@11@01 a) set@1@01)
      ($PSF.loc_p ($PSF.lookup_p (as sm@8@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
    :pattern ((inv@11@01 a))
    :qid |quant-u-9|))
  (foo%precondition ($SortWrappers.$PSF<p>To$Snap (as sm@14@01  $PSF<p>)) set@1@01)))
(assert (= (foo ($SortWrappers.$PSF<p>To$Snap (as sm@14@01  $PSF<p>)) set@1@01) 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert foo(set) == 0
; [eval] foo(set) == 0
; [eval] foo(set)
(push) ; 3
(declare-const a@16@01 $Ref)
(push) ; 4
; [eval] (a in set)
(assert (Set_in a@16@01 set@1@01))
(pop) ; 4
(declare-fun inv@17@01 ($Ref) $Ref)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@19@01 $PSF<p>)
(declare-const s@20@01 $Snap)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((s@20@01 $Snap)) (!
  (=>
    (and
      (img@7@01 ($SortWrappers.$SnapTo$Ref s@20@01))
      (Set_in (inv@6@01 ($SortWrappers.$SnapTo$Ref s@20@01)) set@1@01))
    (and
      (not (= s@20@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@19@01  $PSF<p>) s@20@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@20@01))))
  :pattern (($PSF.lookup_p (as sm@19@01  $PSF<p>) s@20@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@20@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@20@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@20@01) s@20@01)
  :pattern (($PSF.lookup_p (as sm@19@01  $PSF<p>) s@20@01))
  :qid |qp.psmResTrgDef7|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@16@01 $Ref) (a2@16@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in a1@16@01 set@1@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@19@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a1@16@01)) ($SortWrappers.$RefTo$Snap a1@16@01)))
      (and
        (Set_in a2@16@01 set@1@01)
        ($PSF.loc_p ($PSF.lookup_p (as sm@19@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a2@16@01)) ($SortWrappers.$RefTo$Snap a2@16@01)))
      (= a1@16@01 a2@16@01))
    (= a1@16@01 a2@16@01))
  
  :qid |p-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@16@01 $Ref)) (!
  (=>
    (Set_in a@16@01 set@1@01)
    (and (= (inv@17@01 a@16@01) a@16@01) (img@18@01 a@16@01)))
  :pattern ((Set_in a@16@01 set@1@01))
  :pattern ((inv@17@01 a@16@01))
  :pattern ((img@18@01 a@16@01))
  :qid |p-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@18@01 a) (Set_in (inv@17@01 a) set@1@01)) (= (inv@17@01 a) a))
  :pattern ((inv@17@01 a))
  :qid |p-fctOfInv|)))
(assert (forall ((a $Ref)) (!
  (=>
    (Set_in (inv@17@01 a) set@1@01)
    ($PSF.loc_p ($PSF.lookup_p (as sm@19@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
  :pattern ((inv@17@01 a))
  :qid |quant-u-14|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((a $Ref)) $Perm
  (ite
    (and (Set_in (inv@17@01 a) set@1@01) (img@18@01 a) (= a (inv@17@01 a)))
    ($Perm.min
      (ite
        (and (img@7@01 a) (Set_in (inv@6@01 a) set@1@01))
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
(assert (not (forall ((a $Ref)) (!
  (=
    (-
      (ite
        (and (img@7@01 a) (Set_in (inv@6@01 a) set@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 a))
    $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref)) (!
  (=>
    (and (Set_in (inv@17@01 a) set@1@01) (img@18@01 a) (= a (inv@17@01 a)))
    (= (- $Perm.Write (pTaken@21@01 a)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $PSF<p>)
(declare-const s@23@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@23@01 $Snap)) (!
  (and
    (=>
      (Set_in s@23@01 ($PSF.domain_p (as sm@22@01  $PSF<p>)))
      (and
        (Set_in (inv@17@01 ($SortWrappers.$SnapTo$Ref s@23@01)) set@1@01)
        (img@18@01 ($SortWrappers.$SnapTo$Ref s@23@01))))
    (=>
      (and
        (Set_in (inv@17@01 ($SortWrappers.$SnapTo$Ref s@23@01)) set@1@01)
        (img@18@01 ($SortWrappers.$SnapTo$Ref s@23@01)))
      (Set_in s@23@01 ($PSF.domain_p (as sm@22@01  $PSF<p>)))))
  :pattern ((Set_in s@23@01 ($PSF.domain_p (as sm@22@01  $PSF<p>))))
  :qid |qp.psmDomDef10|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@23@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@17@01 ($SortWrappers.$SnapTo$Ref s@23@01)) set@1@01)
        (img@18@01 ($SortWrappers.$SnapTo$Ref s@23@01)))
      (and
        (img@7@01 ($SortWrappers.$SnapTo$Ref s@23@01))
        (Set_in (inv@6@01 ($SortWrappers.$SnapTo$Ref s@23@01)) set@1@01)))
    (and
      (not (= s@23@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@23@01))))
  :pattern (($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@23@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@23@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@23@01) s@23@01)
  :pattern (($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01))
  :qid |qp.psmResTrgDef9|)))
(assert (foo%precondition ($SortWrappers.$PSF<p>To$Snap (as sm@22@01  $PSF<p>)) set@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((s@20@01 $Snap)) (!
  (=>
    (and
      (img@7@01 ($SortWrappers.$SnapTo$Ref s@20@01))
      (Set_in (inv@6@01 ($SortWrappers.$SnapTo$Ref s@20@01)) set@1@01))
    (and
      (not (= s@20@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@19@01  $PSF<p>) s@20@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@20@01))))
  :pattern (($PSF.lookup_p (as sm@19@01  $PSF<p>) s@20@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@20@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@20@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@20@01) s@20@01)
  :pattern (($PSF.lookup_p (as sm@19@01  $PSF<p>) s@20@01))
  :qid |qp.psmResTrgDef7|)))
(assert (forall ((a@16@01 $Ref)) (!
  (=>
    (Set_in a@16@01 set@1@01)
    (and (= (inv@17@01 a@16@01) a@16@01) (img@18@01 a@16@01)))
  :pattern ((Set_in a@16@01 set@1@01))
  :pattern ((inv@17@01 a@16@01))
  :pattern ((img@18@01 a@16@01))
  :qid |p-invOfFct|)))
(assert (forall ((a $Ref)) (!
  (=> (and (img@18@01 a) (Set_in (inv@17@01 a) set@1@01)) (= (inv@17@01 a) a))
  :pattern ((inv@17@01 a))
  :qid |p-fctOfInv|)))
(assert (forall ((s@23@01 $Snap)) (!
  (and
    (=>
      (Set_in s@23@01 ($PSF.domain_p (as sm@22@01  $PSF<p>)))
      (and
        (Set_in (inv@17@01 ($SortWrappers.$SnapTo$Ref s@23@01)) set@1@01)
        (img@18@01 ($SortWrappers.$SnapTo$Ref s@23@01))))
    (=>
      (and
        (Set_in (inv@17@01 ($SortWrappers.$SnapTo$Ref s@23@01)) set@1@01)
        (img@18@01 ($SortWrappers.$SnapTo$Ref s@23@01)))
      (Set_in s@23@01 ($PSF.domain_p (as sm@22@01  $PSF<p>)))))
  :pattern ((Set_in s@23@01 ($PSF.domain_p (as sm@22@01  $PSF<p>))))
  :qid |qp.psmDomDef10|)))
(assert (forall ((s@23@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@17@01 ($SortWrappers.$SnapTo$Ref s@23@01)) set@1@01)
        (img@18@01 ($SortWrappers.$SnapTo$Ref s@23@01)))
      (and
        (img@7@01 ($SortWrappers.$SnapTo$Ref s@23@01))
        (Set_in (inv@6@01 ($SortWrappers.$SnapTo$Ref s@23@01)) set@1@01)))
    (and
      (not (= s@23@01 $Snap.unit))
      (=
        ($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01)
        ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@23@01))))
  :pattern (($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01))
  :pattern (($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@23@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@23@01 $Snap)) (!
  ($PSF.loc_p ($PSF.lookup_p ($SortWrappers.$SnapTo$PSF<p> ($Snap.first $t@2@01)) s@23@01) s@23@01)
  :pattern (($PSF.lookup_p (as sm@22@01  $PSF<p>) s@23@01))
  :qid |qp.psmResTrgDef9|)))
(assert (and
  (forall ((a $Ref)) (!
    (=>
      (Set_in (inv@17@01 a) set@1@01)
      ($PSF.loc_p ($PSF.lookup_p (as sm@19@01  $PSF<p>) ($SortWrappers.$RefTo$Snap a)) ($SortWrappers.$RefTo$Snap a)))
    :pattern ((inv@17@01 a))
    :qid |quant-u-14|))
  (foo%precondition ($SortWrappers.$PSF<p>To$Snap (as sm@22@01  $PSF<p>)) set@1@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (foo ($SortWrappers.$PSF<p>To$Snap (as sm@22@01  $PSF<p>)) set@1@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (foo ($SortWrappers.$PSF<p>To$Snap (as sm@22@01  $PSF<p>)) set@1@01) 0))
(pop) ; 2
(pop) ; 1
