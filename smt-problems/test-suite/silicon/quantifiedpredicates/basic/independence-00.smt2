(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:24:42
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpredicates/basic/independence.vpr
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
(declare-sort $PSF<p2> 0)
(declare-sort $MWSF 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$MWSFTo$Snap ($MWSF) $Snap)
(declare-fun $SortWrappers.$SnapTo$MWSF ($Snap) $MWSF)
(assert (forall ((x $MWSF)) (!
    (= x ($SortWrappers.$SnapTo$MWSF($SortWrappers.$MWSFTo$Snap x)))
    :pattern (($SortWrappers.$MWSFTo$Snap x))
    :qid |$Snap.$SnapTo$MWSFTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$MWSFTo$Snap($SortWrappers.$SnapTo$MWSF x)))
    :pattern (($SortWrappers.$SnapTo$MWSF x))
    :qid |$Snap.$MWSFTo$SnapTo$MWSF|
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
; /predicate_snap_functions_declarations.smt2 [p2: Int]
(declare-fun $PSF.domain_p2 ($PSF<p2>) Set<$Snap>)
(declare-fun $PSF.lookup_p2 ($PSF<p2> $Snap) Int)
(declare-fun $PSF.after_p2 ($PSF<p2> $PSF<p2>) Bool)
(declare-fun $PSF.loc_p2 (Int $Snap) Bool)
(declare-fun $PSF.perm_p2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_p2 $PSF<p2>)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun p1%trigger ($Snap $Ref) Bool)
(declare-fun p2%trigger ($Snap $Ref Int) Bool)
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
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
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
; var c: Int
(declare-const c@2@01 Int)
; [exec]
; c := 2
; [exec]
; inhale (forall x: Int ::x > 0 ==> acc(p2(r, x), write))
(declare-const x@3@01 Int)
(push) ; 3
; [eval] x > 0
(assert (> x@3@01 0))
(pop) ; 3
(declare-const $t@4@01 $PSF<p2>)
(declare-fun inv@5@01 ($Ref Int) Int)
(declare-fun img@6@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@3@01 Int) (x2@3@01 Int)) (!
  (=> (and (> x1@3@01 0) (> x2@3@01 0) (= x1@3@01 x2@3@01)) (= x1@3@01 x2@3@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@3@01 Int)) (!
  (=>
    (> x@3@01 0)
    (and (= (inv@5@01 r@1@01 x@3@01) x@3@01) (img@6@01 r@1@01 x@3@01)))
  :pattern ((inv@5@01 r@1@01 x@3@01))
  :pattern ((img@6@01 r@1@01 x@3@01))
  :qid |quant-u-1|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@6@01 a b) (> (inv@5@01 a b) 0))
    (and (= r@1@01 a) (= (inv@5@01 a b) b)))
  :pattern ((inv@5@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert c == 2
; [eval] c == 2
; [exec]
; exhale (forall x: Int ::x > 0 ==> acc(p2(r, x), write))
(declare-const x@7@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] x > 0
(assert (> x@7@01 0))
(pop) ; 3
(declare-fun inv@8@01 ($Ref Int) Int)
(declare-fun img@9@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@7@01 Int) (x2@7@01 Int)) (!
  (=> (and (> x1@7@01 0) (> x2@7@01 0) (= x1@7@01 x2@7@01)) (= x1@7@01 x2@7@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@7@01 Int)) (!
  (=>
    (> x@7@01 0)
    (and (= (inv@8@01 r@1@01 x@7@01) x@7@01) (img@9@01 r@1@01 x@7@01)))
  :pattern ((inv@8@01 r@1@01 x@7@01))
  :pattern ((img@9@01 r@1@01 x@7@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@9@01 a b) (> (inv@8@01 a b) 0))
    (and (= r@1@01 a) (= (inv@8@01 a b) b)))
  :pattern ((inv@8@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@10@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (> (inv@8@01 a b) 0)
      (img@9@01 a b)
      (and (= a r@1@01) (= b (inv@8@01 a b))))
    ($Perm.min
      (ite (and (img@6@01 a b) (> (inv@5@01 a b) 0)) $Perm.Write $Perm.No)
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite (and (img@6@01 a b) (> (inv@5@01 a b) 0)) $Perm.Write $Perm.No)
      (pTaken@10@01 a b))
    $Perm.No)
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (> (inv@8@01 a b) 0)
      (img@9@01 a b)
      (and (= a r@1@01) (= b (inv@8@01 a b))))
    (= (- $Perm.Write (pTaken@10@01 a b)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@11@01 $PSF<p2>)
(declare-const s@12@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@12@01 $Snap)) (!
  (=>
    (and
      (img@6@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@12@01)) ($SortWrappers.$SnapToInt ($Snap.second s@12@01)))
      (>
        (inv@5@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@12@01)) ($SortWrappers.$SnapToInt ($Snap.second s@12@01)))
        0))
    (and
      (not (= s@12@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@11@01  $PSF<p2>) s@12@01)
        ($PSF.lookup_p2 $t@4@01 s@12@01))))
  :pattern (($PSF.lookup_p2 (as sm@11@01  $PSF<p2>) s@12@01))
  :pattern (($PSF.lookup_p2 $t@4@01 s@12@01))
  :qid |qp.psmValDef0|)))
; [exec]
; assert c == 2
; [eval] c == 2
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const r@13@01 $Ref)
(declare-const r2@14@01 $Ref)
(declare-const i@15@01 Int)
(declare-const r@16@01 $Ref)
(declare-const r2@17@01 $Ref)
(declare-const i@18@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
; [eval] r != r2
(assert (not (= r@16@01 r2@17@01)))
(declare-const sm@20@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@20@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r2@17@01)
    ($SortWrappers.IntTo$Snap i@18@01)))
  ($SortWrappers.$SnapToInt ($Snap.second $t@19@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@21@01 Int)
(declare-const sm@22@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@22@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r2@17@01)
    ($SortWrappers.IntTo$Snap i@18@01)))
  $t@21@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Int ::x > 0 ==> acc(p2(r, x), write))
(declare-const x@23@01 Int)
(push) ; 3
; [eval] x > 0
(assert (> x@23@01 0))
(pop) ; 3
(declare-const $t@24@01 $PSF<p2>)
(declare-fun inv@25@01 ($Ref Int) Int)
(declare-fun img@26@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@23@01 Int) (x2@23@01 Int)) (!
  (=>
    (and (> x1@23@01 0) (> x2@23@01 0) (= x1@23@01 x2@23@01))
    (= x1@23@01 x2@23@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@23@01 Int)) (!
  (=>
    (> x@23@01 0)
    (and (= (inv@25@01 r@16@01 x@23@01) x@23@01) (img@26@01 r@16@01 x@23@01)))
  :pattern ((inv@25@01 r@16@01 x@23@01))
  :pattern ((img@26@01 r@16@01 x@23@01))
  :qid |quant-u-7|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@26@01 a b) (> (inv@25@01 a b) 0))
    (and (= r@16@01 a) (= (inv@25@01 a b) b)))
  :pattern ((inv@25@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(p2(r2, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@27@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r2@17@01) (= b i@18@01))
    ($Perm.min
      (ite (and (= a r2@17@01) (= b i@18@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@28@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r2@17@01) (= b i@18@01))
    ($Perm.min
      (ite (and (img@26@01 a b) (> (inv@25@01 a b) 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@27@01 a b)))
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
(assert (not (= (- $Perm.Write (pTaken@27@01 r2@17@01 i@18@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r2@17@01) (= b i@18@01))
    (= (- $Perm.Write (pTaken@27@01 a b)) $Perm.No))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@29@01 $PSF<p2>)
(declare-const s@30@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r2@17@01)
        ($SortWrappers.IntTo$Snap i@18@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@29@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r2@17@01)
      ($SortWrappers.IntTo$Snap i@18@01)))
    ($PSF.lookup_p2 (as sm@20@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r2@17@01)
      ($SortWrappers.IntTo$Snap i@18@01))))))
(assert (=>
  (and (img@26@01 r2@17@01 i@18@01) (> (inv@25@01 r2@17@01 i@18@01) 0))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r2@17@01)
          ($SortWrappers.IntTo$Snap i@18@01))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@29@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r2@17@01)
        ($SortWrappers.IntTo$Snap i@18@01)))
      ($PSF.lookup_p2 $t@24@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r2@17@01)
        ($SortWrappers.IntTo$Snap i@18@01)))))))
(assert (not (= r2@17@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p2 (as sm@29@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r2@17@01)
  ($SortWrappers.IntTo$Snap i@18@01)))) r2@17@01 i@18@01))
; [exec]
; fold acc(p2(r2, i), write)
(declare-const sm@31@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@31@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r2@17@01)
    ($SortWrappers.IntTo$Snap i@18@01)))
  ($PSF.lookup_p2 (as sm@29@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r2@17@01)
    ($SortWrappers.IntTo$Snap i@18@01)))))
; [exec]
; exhale (forall x: Int ::x > 0 ==> acc(p2(r, x), write))
(declare-const x@32@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] x > 0
(assert (> x@32@01 0))
(pop) ; 3
(declare-fun inv@33@01 ($Ref Int) Int)
(declare-fun img@34@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@32@01 Int) (x2@32@01 Int)) (!
  (=>
    (and (> x1@32@01 0) (> x2@32@01 0) (= x1@32@01 x2@32@01))
    (= x1@32@01 x2@32@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@32@01 Int)) (!
  (=>
    (> x@32@01 0)
    (and (= (inv@33@01 r@16@01 x@32@01) x@32@01) (img@34@01 r@16@01 x@32@01)))
  :pattern ((inv@33@01 r@16@01 x@32@01))
  :pattern ((img@34@01 r@16@01 x@32@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@34@01 a b) (> (inv@33@01 a b) 0))
    (and (= r@16@01 a) (= (inv@33@01 a b) b)))
  :pattern ((inv@33@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@35@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (> (inv@33@01 a b) 0)
      (img@34@01 a b)
      (and (= a r@16@01) (= b (inv@33@01 a b))))
    ($Perm.min
      (ite (and (img@26@01 a b) (> (inv@25@01 a b) 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@36@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (> (inv@33@01 a b) 0)
      (img@34@01 a b)
      (and (= a r@16@01) (= b (inv@33@01 a b))))
    ($Perm.min
      (ite (and (= a r2@17@01) (= b i@18@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@35@01 a b)))
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite (and (img@26@01 a b) (> (inv@25@01 a b) 0)) $Perm.Write $Perm.No)
      (pTaken@35@01 a b))
    $Perm.No)
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (> (inv@33@01 a b) 0)
      (img@34@01 a b)
      (and (= a r@16@01) (= b (inv@33@01 a b))))
    (= (- $Perm.Write (pTaken@35@01 a b)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@37@01 $PSF<p2>)
(declare-const s@38@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@38@01 $Snap)) (!
  (and
    (=>
      (Set_in s@38@01 ($PSF.domain_p2 (as sm@37@01  $PSF<p2>)))
      (and
        (>
          (inv@33@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01)))
          0)
        (img@34@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01)))))
    (=>
      (and
        (>
          (inv@33@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01)))
          0)
        (img@34@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01))))
      (Set_in s@38@01 ($PSF.domain_p2 (as sm@37@01  $PSF<p2>)))))
  :pattern ((Set_in s@38@01 ($PSF.domain_p2 (as sm@37@01  $PSF<p2>))))
  :qid |qp.psmDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@38@01 $Snap)) (!
  (=>
    (and
      (and
        (>
          (inv@33@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01)))
          0)
        (img@34@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) r2@17@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@38@01)) i@18@01)))
    (and
      (not (= s@38@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@37@01  $PSF<p2>) s@38@01)
        ($PSF.lookup_p2 (as sm@31@01  $PSF<p2>) s@38@01))))
  :pattern (($PSF.lookup_p2 (as sm@37@01  $PSF<p2>) s@38@01))
  :pattern (($PSF.lookup_p2 (as sm@31@01  $PSF<p2>) s@38@01))
  :qid |qp.psmValDef3|)))
(assert (forall ((s@38@01 $Snap)) (!
  (=>
    (and
      (and
        (>
          (inv@33@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01)))
          0)
        (img@34@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01))))
      (and
        (img@26@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01)))
        (>
          (inv@25@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@38@01)) ($SortWrappers.$SnapToInt ($Snap.second s@38@01)))
          0)))
    (and
      (not (= s@38@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@37@01  $PSF<p2>) s@38@01)
        ($PSF.lookup_p2 $t@24@01 s@38@01))))
  :pattern (($PSF.lookup_p2 (as sm@37@01  $PSF<p2>) s@38@01))
  :pattern (($PSF.lookup_p2 $t@24@01 s@38@01))
  :qid |qp.psmValDef4|)))
; [exec]
; unfold acc(p2(r2, i), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@39@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r2@17@01) (= b i@18@01))
    ($Perm.min
      (ite (and (= a r2@17@01) (= b i@18@01)) $Perm.Write $Perm.No)
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
(assert (not (= (- $Perm.Write (pTaken@39@01 r2@17@01 i@18@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r2@17@01) (= b i@18@01))
    (= (- $Perm.Write (pTaken@39@01 a b)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@40@01 $PSF<p2>)
(declare-const s@41@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r2@17@01)
        ($SortWrappers.IntTo$Snap i@18@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@40@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r2@17@01)
      ($SortWrappers.IntTo$Snap i@18@01)))
    ($PSF.lookup_p2 (as sm@31@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r2@17@01)
      ($SortWrappers.IntTo$Snap i@18@01))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p2 (as sm@40@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r2@17@01)
  ($SortWrappers.IntTo$Snap i@18@01)))) r2@17@01 i@18@01))
; [exec]
; fold acc(p2(r2, i), write)
(declare-const sm@42@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@42@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r2@17@01)
    ($SortWrappers.IntTo$Snap i@18@01)))
  ($PSF.lookup_p2 (as sm@40@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r2@17@01)
    ($SortWrappers.IntTo$Snap i@18@01)))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r2@17@01) (= b i@18@01))
    ($Perm.min
      (ite (and (= a r2@17@01) (= b i@18@01)) $Perm.Write $Perm.No)
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
(assert (not (= (- $Perm.Write (pTaken@43@01 r2@17@01 i@18@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r2@17@01) (= b i@18@01))
    (= (- $Perm.Write (pTaken@43@01 a b)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@44@01 $PSF<p2>)
(declare-const s@45@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap r2@17@01)
        ($SortWrappers.IntTo$Snap i@18@01))
      $Snap.unit))
  (=
    ($PSF.lookup_p2 (as sm@44@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r2@17@01)
      ($SortWrappers.IntTo$Snap i@18@01)))
    ($PSF.lookup_p2 (as sm@42@01  $PSF<p2>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap r2@17@01)
      ($SortWrappers.IntTo$Snap i@18@01))))))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const r@46@01 $Ref)
(declare-const r2@47@01 $Ref)
(declare-const i@48@01 Int)
(declare-const r@49@01 $Ref)
(declare-const r2@50@01 $Ref)
(declare-const i@51@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 ($Snap.combine ($Snap.first $t@52@01) ($Snap.second $t@52@01))))
(assert (= ($Snap.first $t@52@01) $Snap.unit))
; [eval] r != r2
(assert (not (= r@49@01 r2@50@01)))
; [eval] -1
(declare-const sm@53@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@53@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@49@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))
  ($SortWrappers.$SnapToInt ($Snap.second $t@52@01))))
(assert (<= $Perm.No (ite (= (- 0 1) (- 0 1)) $Perm.Write $Perm.No)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] -1
(declare-const $t@54@01 Int)
(declare-const sm@55@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@55@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@49@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))
  $t@54@01))
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Int ::x > 0 ==> acc(p2(r, x), write))
(declare-const x@56@01 Int)
(push) ; 3
; [eval] x > 0
(assert (> x@56@01 0))
(pop) ; 3
(declare-const $t@57@01 $PSF<p2>)
(declare-fun inv@58@01 ($Ref Int) Int)
(declare-fun img@59@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@56@01 Int) (x2@56@01 Int)) (!
  (=>
    (and (> x1@56@01 0) (> x2@56@01 0) (= x1@56@01 x2@56@01))
    (= x1@56@01 x2@56@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@56@01 Int)) (!
  (=>
    (> x@56@01 0)
    (and (= (inv@58@01 r@49@01 x@56@01) x@56@01) (img@59@01 r@49@01 x@56@01)))
  :pattern ((inv@58@01 r@49@01 x@56@01))
  :pattern ((img@59@01 r@49@01 x@56@01))
  :qid |quant-u-22|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@59@01 a b) (> (inv@58@01 a b) 0))
    (and (= r@49@01 a) (= (inv@58@01 a b) b)))
  :pattern ((inv@58@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(p2(r, -1), write)
; [eval] -1
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@49@01) (= b (- 0 1)))
    ($Perm.min
      (ite (and (= a r@49@01) (= b (- 0 1))) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@61@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@49@01) (= b (- 0 1)))
    ($Perm.min
      (ite (and (img@59@01 a b) (> (inv@58@01 a b) 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@60@01 a b)))
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
(assert (not (=
  (-
    (ite (= (- 0 1) (- 0 1)) $Perm.Write $Perm.No)
    (pTaken@60@01 r@49@01 (- 0 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@49@01) (= b (- 0 1)))
    (= (- $Perm.Write (pTaken@60@01 a b)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@62@01 $PSF<p2>)
(declare-const s@63@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (- 0 1) (- 0 1))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@49@01)
          ($SortWrappers.IntTo$Snap (- 0 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@62@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@49@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))
      ($PSF.lookup_p2 (as sm@53@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@49@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))))))
(assert (=>
  (and (img@59@01 r@49@01 (- 0 1)) (> (inv@58@01 r@49@01 (- 0 1)) 0))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@49@01)
          ($SortWrappers.IntTo$Snap (- 0 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@62@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@49@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))
      ($PSF.lookup_p2 $t@57@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@49@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))))))
(assert (not (= r@49@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p2 (as sm@62@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@49@01)
  ($SortWrappers.IntTo$Snap (- 0 1))))) r@49@01 (- 0 1)))
; [exec]
; fold acc(p2(r, -1), write)
; [eval] -1
(declare-const sm@64@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@64@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@49@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))
  ($PSF.lookup_p2 (as sm@62@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@49@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))))
; [exec]
; exhale (forall x: Int ::x > 0 ==> acc(p2(r, x), write))
(declare-const x@65@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] x > 0
(assert (> x@65@01 0))
(pop) ; 3
(declare-fun inv@66@01 ($Ref Int) Int)
(declare-fun img@67@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@65@01 Int) (x2@65@01 Int)) (!
  (=>
    (and (> x1@65@01 0) (> x2@65@01 0) (= x1@65@01 x2@65@01))
    (= x1@65@01 x2@65@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@65@01 Int)) (!
  (=>
    (> x@65@01 0)
    (and (= (inv@66@01 r@49@01 x@65@01) x@65@01) (img@67@01 r@49@01 x@65@01)))
  :pattern ((inv@66@01 r@49@01 x@65@01))
  :pattern ((img@67@01 r@49@01 x@65@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@67@01 a b) (> (inv@66@01 a b) 0))
    (and (= r@49@01 a) (= (inv@66@01 a b) b)))
  :pattern ((inv@66@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (> (inv@66@01 a b) 0)
      (img@67@01 a b)
      (and (= a r@49@01) (= b (inv@66@01 a b))))
    ($Perm.min
      (ite (and (img@59@01 a b) (> (inv@58@01 a b) 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@69@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (> (inv@66@01 a b) 0)
      (img@67@01 a b)
      (and (= a r@49@01) (= b (inv@66@01 a b))))
    ($Perm.min
      (ite (and (= a r@49@01) (= b (- 0 1))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@68@01 a b)))
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite (and (img@59@01 a b) (> (inv@58@01 a b) 0)) $Perm.Write $Perm.No)
      (pTaken@68@01 a b))
    $Perm.No)
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (> (inv@66@01 a b) 0)
      (img@67@01 a b)
      (and (= a r@49@01) (= b (inv@66@01 a b))))
    (= (- $Perm.Write (pTaken@68@01 a b)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@70@01 $PSF<p2>)
(declare-const s@71@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@71@01 $Snap)) (!
  (and
    (=>
      (Set_in s@71@01 ($PSF.domain_p2 (as sm@70@01  $PSF<p2>)))
      (and
        (>
          (inv@66@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01)))
          0)
        (img@67@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01)))))
    (=>
      (and
        (>
          (inv@66@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01)))
          0)
        (img@67@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01))))
      (Set_in s@71@01 ($PSF.domain_p2 (as sm@70@01  $PSF<p2>)))))
  :pattern ((Set_in s@71@01 ($PSF.domain_p2 (as sm@70@01  $PSF<p2>))))
  :qid |qp.psmDomDef12|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@71@01 $Snap)) (!
  (=>
    (and
      (and
        (>
          (inv@66@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01)))
          0)
        (img@67@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01))))
      (and
        (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) r@49@01)
        (= ($SortWrappers.$SnapToInt ($Snap.second s@71@01)) (- 0 1))))
    (and
      (not (= s@71@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01)
        ($PSF.lookup_p2 (as sm@64@01  $PSF<p2>) s@71@01))))
  :pattern (($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01))
  :pattern (($PSF.lookup_p2 (as sm@64@01  $PSF<p2>) s@71@01))
  :qid |qp.psmValDef10|)))
(assert (forall ((s@71@01 $Snap)) (!
  (=>
    (and
      (and
        (>
          (inv@66@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01)))
          0)
        (img@67@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01))))
      (and
        (img@59@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01)))
        (>
          (inv@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@71@01)) ($SortWrappers.$SnapToInt ($Snap.second s@71@01)))
          0)))
    (and
      (not (= s@71@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01)
        ($PSF.lookup_p2 $t@57@01 s@71@01))))
  :pattern (($PSF.lookup_p2 (as sm@70@01  $PSF<p2>) s@71@01))
  :pattern (($PSF.lookup_p2 $t@57@01 s@71@01))
  :qid |qp.psmValDef11|)))
; [exec]
; unfold acc(p2(r, -1), write)
; [eval] -1
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@49@01) (= b (- 0 1)))
    ($Perm.min
      (ite (and (= a r@49@01) (= b (- 0 1))) $Perm.Write $Perm.No)
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
(assert (not (=
  (-
    (ite (= (- 0 1) (- 0 1)) $Perm.Write $Perm.No)
    (pTaken@72@01 r@49@01 (- 0 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@49@01) (= b (- 0 1)))
    (= (- $Perm.Write (pTaken@72@01 a b)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@73@01 $PSF<p2>)
(declare-const s@74@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (- 0 1) (- 0 1))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@49@01)
          ($SortWrappers.IntTo$Snap (- 0 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@73@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@49@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))
      ($PSF.lookup_p2 (as sm@64@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@49@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p2%trigger ($SortWrappers.IntTo$Snap ($PSF.lookup_p2 (as sm@73@01  $PSF<p2>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap r@49@01)
  ($SortWrappers.IntTo$Snap (- 0 1))))) r@49@01 (- 0 1)))
; [exec]
; fold acc(p2(r, -1), write)
; [eval] -1
(declare-const sm@75@01 $PSF<p2>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_p2 (as sm@75@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@49@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))
  ($PSF.lookup_p2 (as sm@73@01  $PSF<p2>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap r@49@01)
    ($SortWrappers.IntTo$Snap (- 0 1))))))
; [eval] -1
; Precomputing data for removing quantified permissions
(define-fun pTaken@76@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and (= a r@49@01) (= b (- 0 1)))
    ($Perm.min
      (ite (and (= a r@49@01) (= b (- 0 1))) $Perm.Write $Perm.No)
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
(assert (not (=
  (-
    (ite (= (- 0 1) (- 0 1)) $Perm.Write $Perm.No)
    (pTaken@76@01 r@49@01 (- 0 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and (= a r@49@01) (= b (- 0 1)))
    (= (- $Perm.Write (pTaken@76@01 a b)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@77@01 $PSF<p2>)
(declare-const s@78@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (- 0 1) (- 0 1))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap r@49@01)
          ($SortWrappers.IntTo$Snap (- 0 1)))
        $Snap.unit))
    (=
      ($PSF.lookup_p2 (as sm@77@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@49@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))
      ($PSF.lookup_p2 (as sm@75@01  $PSF<p2>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap r@49@01)
        ($SortWrappers.IntTo$Snap (- 0 1))))))))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const r@79@01 $Ref)
(declare-const i@80@01 Int)
(declare-const r@81@01 $Ref)
(declare-const i@82@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@83@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@84@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Int ::x > 0 ==> acc(p2(r, x), write))
(declare-const x@85@01 Int)
(push) ; 3
; [eval] x > 0
(assert (> x@85@01 0))
(pop) ; 3
(declare-const $t@86@01 $PSF<p2>)
(declare-fun inv@87@01 ($Ref Int) Int)
(declare-fun img@88@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@85@01 Int) (x2@85@01 Int)) (!
  (=>
    (and (> x1@85@01 0) (> x2@85@01 0) (= x1@85@01 x2@85@01))
    (= x1@85@01 x2@85@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@85@01 Int)) (!
  (=>
    (> x@85@01 0)
    (and (= (inv@87@01 r@81@01 x@85@01) x@85@01) (img@88@01 r@81@01 x@85@01)))
  :pattern ((inv@87@01 r@81@01 x@85@01))
  :pattern ((img@88@01 r@81@01 x@85@01))
  :qid |quant-u-37|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@88@01 a b) (> (inv@87@01 a b) 0))
    (and (= r@81@01 a) (= (inv@87@01 a b) b)))
  :pattern ((inv@87@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(p1(r), write)
(assert (not (= r@81@01 $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (p1%trigger ($SortWrappers.IntTo$Snap $t@83@01) r@81@01))
; [exec]
; fold acc(p1(r), write)
; [exec]
; exhale (forall x: Int ::x > 0 ==> acc(p2(r, x), write))
(declare-const x@89@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] x > 0
(assert (> x@89@01 0))
(pop) ; 3
(declare-fun inv@90@01 ($Ref Int) Int)
(declare-fun img@91@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@89@01 Int) (x2@89@01 Int)) (!
  (=>
    (and (> x1@89@01 0) (> x2@89@01 0) (= x1@89@01 x2@89@01))
    (= x1@89@01 x2@89@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@89@01 Int)) (!
  (=>
    (> x@89@01 0)
    (and (= (inv@90@01 r@81@01 x@89@01) x@89@01) (img@91@01 r@81@01 x@89@01)))
  :pattern ((inv@90@01 r@81@01 x@89@01))
  :pattern ((img@91@01 r@81@01 x@89@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@91@01 a b) (> (inv@90@01 a b) 0))
    (and (= r@81@01 a) (= (inv@90@01 a b) b)))
  :pattern ((inv@90@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@92@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (> (inv@90@01 a b) 0)
      (img@91@01 a b)
      (and (= a r@81@01) (= b (inv@90@01 a b))))
    ($Perm.min
      (ite (and (img@88@01 a b) (> (inv@87@01 a b) 0)) $Perm.Write $Perm.No)
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite (and (img@88@01 a b) (> (inv@87@01 a b) 0)) $Perm.Write $Perm.No)
      (pTaken@92@01 a b))
    $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (> (inv@90@01 a b) 0)
      (img@91@01 a b)
      (and (= a r@81@01) (= b (inv@90@01 a b))))
    (= (- $Perm.Write (pTaken@92@01 a b)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@93@01 $PSF<p2>)
(declare-const s@94@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@94@01 $Snap)) (!
  (=>
    (and
      (img@88@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@94@01)) ($SortWrappers.$SnapToInt ($Snap.second s@94@01)))
      (>
        (inv@87@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@94@01)) ($SortWrappers.$SnapToInt ($Snap.second s@94@01)))
        0))
    (and
      (not (= s@94@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@93@01  $PSF<p2>) s@94@01)
        ($PSF.lookup_p2 $t@86@01 s@94@01))))
  :pattern (($PSF.lookup_p2 (as sm@93@01  $PSF<p2>) s@94@01))
  :pattern (($PSF.lookup_p2 $t@86@01 s@94@01))
  :qid |qp.psmValDef15|)))
; [exec]
; unfold acc(p1(r), write)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; fold acc(p1(r), write)
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const r@95@01 $Ref)
(declare-const r2@96@01 $Ref)
(declare-const i@97@01 Int)
(declare-const r@98@01 $Ref)
(declare-const r2@99@01 $Ref)
(declare-const i@100@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@101@01 $Snap)
(assert (= $t@101@01 ($Snap.combine ($Snap.first $t@101@01) ($Snap.second $t@101@01))))
(assert (not (= r@98@01 $Ref.null)))
(assert (=
  ($Snap.second $t@101@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@101@01))
    ($Snap.second ($Snap.second $t@101@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r@98@01 r2@99@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@99@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second $t@101@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@101@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@101@01))))))
; [eval] r2 != null
; [eval] r != null
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall x: Int ::x != i ==> acc(p2(r, x), write))
(declare-const x@102@01 Int)
(push) ; 3
; [eval] x != i
(assert (not (= x@102@01 i@100@01)))
(pop) ; 3
(declare-const $t@103@01 $PSF<p2>)
(declare-fun inv@104@01 ($Ref Int) Int)
(declare-fun img@105@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@102@01 Int) (x2@102@01 Int)) (!
  (=>
    (and
      (not (= x1@102@01 i@100@01))
      (not (= x2@102@01 i@100@01))
      (= x1@102@01 x2@102@01))
    (= x1@102@01 x2@102@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@102@01 Int)) (!
  (=>
    (not (= x@102@01 i@100@01))
    (and
      (= (inv@104@01 r@98@01 x@102@01) x@102@01)
      (img@105@01 r@98@01 x@102@01)))
  :pattern ((inv@104@01 r@98@01 x@102@01))
  :pattern ((img@105@01 r@98@01 x@102@01))
  :qid |quant-u-43|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@105@01 a b) (not (= (inv@104@01 a b) i@100@01)))
    (and (= r@98@01 a) (= (inv@104@01 a b) b)))
  :pattern ((inv@104@01 a b))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply acc(r.f, write) --* r != null && (acc(r.g, write) && r.g == i)
; [eval] r != null
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01)))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01))))))
(assert (=
  ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01)))
  $Snap.unit))
; [eval] r != null
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01))))
    ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01)))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01))))
  $Snap.unit))
; [eval] r.g == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01)))))
  i@100@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert r.g == i
; [eval] r.g == i
; [exec]
; package acc(r.f, write) --* r != null && (acc(r.g, write) && r.g == i) {
; }
(set-option :timeout 0)
(push) ; 3
(declare-const $t@106@01 $Snap)
; [eval] r != null
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] r.g == i
; Create MagicWandSnapFunction for wand acc(r.f, write) --* r != null && (acc(r.g, write) && r.g == i)
(declare-const mwsf@107@01 $MWSF)
(assert (forall (($t@106@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@107@01 $t@106@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01))))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@107@01 $t@106@01))
  :qid |quant-u-44|)))
; [eval] r != null
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@106@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@107@01 $t@106@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.second ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first $t@101@01))))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@107@01 $t@106@01))
  :qid |quant-u-45|)))
(assert true)
; [exec]
; exhale (forall x: Int ::x != i ==> acc(p2(r, x), write))
(declare-const x@108@01 Int)
(push) ; 4
; [eval] x != i
(assert (not (= x@108@01 i@100@01)))
(pop) ; 4
(declare-fun inv@109@01 ($Ref Int) Int)
(declare-fun img@110@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@108@01 Int) (x2@108@01 Int)) (!
  (=>
    (and
      (not (= x1@108@01 i@100@01))
      (not (= x2@108@01 i@100@01))
      (= x1@108@01 x2@108@01))
    (= x1@108@01 x2@108@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@108@01 Int)) (!
  (=>
    (not (= x@108@01 i@100@01))
    (and
      (= (inv@109@01 r@98@01 x@108@01) x@108@01)
      (img@110@01 r@98@01 x@108@01)))
  :pattern ((inv@109@01 r@98@01 x@108@01))
  :pattern ((img@110@01 r@98@01 x@108@01))
  :qid |p2-invOfFct|)))
(assert (forall ((a $Ref) (b Int)) (!
  (=>
    (and (img@110@01 a b) (not (= (inv@109@01 a b) i@100@01)))
    (and (= r@98@01 a) (= (inv@109@01 a b) b)))
  :pattern ((inv@109@01 a b))
  :qid |p2-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@111@01 ((a $Ref) (b Int)) $Perm
  (ite
    (and
      (not (= (inv@109@01 a b) i@100@01))
      (img@110@01 a b)
      (and (= a r@98@01) (= b (inv@109@01 a b))))
    ($Perm.min
      (ite
        (and (img@105@01 a b) (not (= (inv@104@01 a b) i@100@01)))
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
(assert (not (forall ((a $Ref) (b Int)) (!
  (=
    (-
      (ite
        (and (img@105@01 a b) (not (= (inv@104@01 a b) i@100@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@111@01 a b))
    $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((a $Ref) (b Int)) (!
  (=>
    (and
      (not (= (inv@109@01 a b) i@100@01))
      (img@110@01 a b)
      (and (= a r@98@01) (= b (inv@109@01 a b))))
    (= (- $Perm.Write (pTaken@111@01 a b)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@112@01 $PSF<p2>)
(declare-const s@113@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@113@01 $Snap)) (!
  (=>
    (and
      (img@105@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@113@01)) ($SortWrappers.$SnapToInt ($Snap.second s@113@01)))
      (not
        (=
          (inv@104@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@113@01)) ($SortWrappers.$SnapToInt ($Snap.second s@113@01)))
          i@100@01)))
    (and
      (not (= s@113@01 $Snap.unit))
      (=
        ($PSF.lookup_p2 (as sm@112@01  $PSF<p2>) s@113@01)
        ($PSF.lookup_p2 $t@103@01 s@113@01))))
  :pattern (($PSF.lookup_p2 (as sm@112@01  $PSF<p2>) s@113@01))
  :pattern (($PSF.lookup_p2 $t@103@01 s@113@01))
  :qid |qp.psmValDef16|)))
; [exec]
; apply acc(r2.f, write) --* r2 != null && (acc(r2.g, write) && r2.g == i)
; [eval] r2 != null
(assert (=
  (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01)))
  ($Snap.combine
    ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01))))
    ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01)))))))
(assert (=
  ($Snap.first (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01))))
  $Snap.unit))
; [eval] r2 != null
(assert (=
  ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01)))))
    ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01))))))))
(assert (=
  ($Snap.second ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01)))))
  $Snap.unit))
; [eval] r2.g == i
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01))))))
  i@100@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert r2.g == i
; [eval] r2.g == i
; [exec]
; package acc(r2.f, write) --* r2 != null && (acc(r2.g, write) && r2.g == i) {
; }
(set-option :timeout 0)
(push) ; 4
(declare-const $t@114@01 $Snap)
; [eval] r2 != null
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] r2.g == i
; Create MagicWandSnapFunction for wand acc(r2.f, write) --* r2 != null && (acc(r2.g, write) && r2.g == i)
(declare-const mwsf@115@01 $MWSF)
(assert (forall (($t@114@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@115@01 $t@114@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01)))))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@115@01 $t@114@01))
  :qid |quant-u-50|)))
; [eval] r2 != null
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
(assert (forall (($t@114@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@115@01 $t@114@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($Snap.first ($Snap.second (MWSF_apply ($SortWrappers.$SnapTo$MWSF ($Snap.first ($Snap.second ($Snap.second $t@101@01)))) ($Snap.first ($Snap.second $t@101@01)))))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@115@01 $t@114@01))
  :qid |quant-u-51|)))
(assert true)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
