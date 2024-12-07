(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:01
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0223.vpr
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
(declare-sort $PSF<bar> 0)
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
(declare-fun $SortWrappers.$PSF<bar>To$Snap ($PSF<bar>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<bar> ($Snap) $PSF<bar>)
(assert (forall ((x $PSF<bar>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<bar>($SortWrappers.$PSF<bar>To$Snap x)))
    :pattern (($SortWrappers.$PSF<bar>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<bar>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<bar>To$Snap($SortWrappers.$SnapTo$PSF<bar> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<bar> x))
    :qid |$Snap.$PSF<bar>To$SnapTo$PSF<bar>|
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
; /predicate_snap_functions_declarations.smt2 [bar: Int]
(declare-fun $PSF.domain_bar ($PSF<bar>) Set<$Snap>)
(declare-fun $PSF.lookup_bar ($PSF<bar> $Snap) Int)
(declare-fun $PSF.after_bar ($PSF<bar> $PSF<bar>) Bool)
(declare-fun $PSF.loc_bar (Int $Snap) Bool)
(declare-fun $PSF.perm_bar ($PPM $Snap) $Perm)
(declare-const $psfTOP_bar $PSF<bar>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun get ($Snap $Ref) Int)
(declare-fun get%limited ($Snap $Ref) Int)
(declare-fun get%stateless ($Ref) Bool)
(declare-fun get%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun bar%trigger ($Snap $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [bar: Int]
(assert (forall ((vs $PSF<bar>) (ws $PSF<bar>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_bar vs) ($PSF.domain_bar ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_bar vs))
            (= ($PSF.lookup_bar vs x) ($PSF.lookup_bar ws x)))
          :pattern (($PSF.lookup_bar vs x) ($PSF.lookup_bar ws x))
          :qid |qp.$PSF<bar>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<bar>To$Snap vs)
              ($SortWrappers.$PSF<bar>To$Snap ws)
              )
    :qid |qp.$PSF<bar>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_bar pm s))
    :pattern (($PSF.perm_bar pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_bar f s) true)
    :pattern (($PSF.loc_bar f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@3@00 ($Snap $Ref $Ref) $Ref)
(declare-fun img@4@00 ($Snap $Ref $Ref) Bool)
(declare-fun sm@5@00 ($Snap $Ref) $PSF<bar>)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (get%limited s@$ x@0@00) (get s@$ x@0@00))
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (get%stateless x@0@00)
  :pattern ((get%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (and
    (forall ((w@2@00 $Ref)) (!
      (=>
        (Set_in w@2@00 (Set_singleton x@0@00))
        (and
          (= (inv@3@00 s@$ x@0@00 w@2@00) w@2@00)
          (img@4@00 s@$ x@0@00 w@2@00)))
      :pattern ((Set_in w@2@00 (Set_singleton x@0@00)))
      :qid |quant-u-3|))
    (forall ((x $Ref)) (!
      (=>
        (and
          (img@4@00 s@$ x@0@00 x)
          (Set_in (inv@3@00 s@$ x@0@00 x) (Set_singleton x@0@00)))
        (= (inv@3@00 s@$ x@0@00 x) x))
      :pattern ((inv@3@00 s@$ x@0@00 x))
      :qid |bar-fctOfInv|))
    (forall ((s@6@00 $Snap)) (!
      (=>
        (and
          (img@4@00 s@$ x@0@00 ($SortWrappers.$SnapTo$Ref s@6@00))
          (Set_in (inv@3@00 s@$ x@0@00 ($SortWrappers.$SnapTo$Ref s@6@00)) (Set_singleton x@0@00)))
        (and
          (not (= s@6@00 $Snap.unit))
          (=
            ($PSF.lookup_bar (sm@5@00 s@$ x@0@00) s@6@00)
            ($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> s@$) s@6@00))))
      :pattern (($PSF.lookup_bar (sm@5@00 s@$ x@0@00) s@6@00))
      :pattern (($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> s@$) s@6@00))
      :qid |qp.psmValDef0|))
    (=>
      (get%precondition s@$ x@0@00)
      (=
        (get s@$ x@0@00)
        ($PSF.lookup_bar (sm@5@00 s@$ x@0@00) ($SortWrappers.$RefTo$Snap x@0@00)))))
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-8|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- set ----------
(declare-const x@0@01 $Ref)
(declare-const i@1@01 Int)
(declare-const x@2@01 $Ref)
(declare-const i@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 Int)
(declare-const sm@5@01 $PSF<bar>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_bar (as sm@5@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@2@01))
  $t@4@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(declare-const sm@7@01 $PSF<bar>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_bar (as sm@7@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@2@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] get(x) == i
; [eval] get(x)
(push) ; 3
(declare-const w@8@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@8@01 (Set_singleton x@2@01)))
(pop) ; 4
(declare-fun inv@9@01 ($Ref) $Ref)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@8@01 $Ref) (w2@8@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@8@01 (Set_singleton x@2@01))
      (Set_in w2@8@01 (Set_singleton x@2@01))
      (= w1@8@01 w2@8@01))
    (= w1@8@01 w2@8@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@8@01 $Ref)) (!
  (=>
    (Set_in w@8@01 (Set_singleton x@2@01))
    (and (= (inv@9@01 w@8@01) w@8@01) (img@10@01 w@8@01)))
  :pattern ((Set_in w@8@01 (Set_singleton x@2@01)))
  :pattern ((inv@9@01 w@8@01))
  :pattern ((img@10@01 w@8@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@10@01 x) (Set_in (inv@9@01 x) (Set_singleton x@2@01)))
    (= (inv@9@01 x) x))
  :pattern ((inv@9@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@11@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@9@01 x) (Set_singleton x@2@01))
      (img@10@01 x)
      (= x (inv@9@01 x)))
    ($Perm.min (ite (= x x@2@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@11@01 x@2@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@9@01 x) (Set_singleton x@2@01))
      (img@10@01 x)
      (= x (inv@9@01 x)))
    (= (- $Perm.Write (pTaken@11@01 x)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@12@01 $PSF<bar>)
(declare-const s@13@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@13@01 $Snap)) (!
  (and
    (=>
      (Set_in s@13@01 ($PSF.domain_bar (as sm@12@01  $PSF<bar>)))
      (and
        (Set_in (inv@9@01 ($SortWrappers.$SnapTo$Ref s@13@01)) (Set_singleton x@2@01))
        (img@10@01 ($SortWrappers.$SnapTo$Ref s@13@01))))
    (=>
      (and
        (Set_in (inv@9@01 ($SortWrappers.$SnapTo$Ref s@13@01)) (Set_singleton x@2@01))
        (img@10@01 ($SortWrappers.$SnapTo$Ref s@13@01)))
      (Set_in s@13@01 ($PSF.domain_bar (as sm@12@01  $PSF<bar>)))))
  :pattern ((Set_in s@13@01 ($PSF.domain_bar (as sm@12@01  $PSF<bar>))))
  :qid |qp.psmDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@13@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@9@01 ($SortWrappers.$SnapTo$Ref s@13@01)) (Set_singleton x@2@01))
        (img@10@01 ($SortWrappers.$SnapTo$Ref s@13@01)))
      (= ($SortWrappers.$SnapTo$Ref s@13@01) x@2@01))
    (and
      (not (= s@13@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@12@01  $PSF<bar>) s@13@01)
        ($PSF.lookup_bar (as sm@7@01  $PSF<bar>) s@13@01))))
  :pattern (($PSF.lookup_bar (as sm@12@01  $PSF<bar>) s@13@01))
  :pattern (($PSF.lookup_bar (as sm@7@01  $PSF<bar>) s@13@01))
  :qid |qp.psmValDef0|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@12@01  $PSF<bar>)) x@2@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@8@01 $Ref)) (!
  (=>
    (Set_in w@8@01 (Set_singleton x@2@01))
    (and (= (inv@9@01 w@8@01) w@8@01) (img@10@01 w@8@01)))
  :pattern ((Set_in w@8@01 (Set_singleton x@2@01)))
  :pattern ((inv@9@01 w@8@01))
  :pattern ((img@10@01 w@8@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@10@01 x) (Set_in (inv@9@01 x) (Set_singleton x@2@01)))
    (= (inv@9@01 x) x))
  :pattern ((inv@9@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@13@01 $Snap)) (!
  (and
    (=>
      (Set_in s@13@01 ($PSF.domain_bar (as sm@12@01  $PSF<bar>)))
      (and
        (Set_in (inv@9@01 ($SortWrappers.$SnapTo$Ref s@13@01)) (Set_singleton x@2@01))
        (img@10@01 ($SortWrappers.$SnapTo$Ref s@13@01))))
    (=>
      (and
        (Set_in (inv@9@01 ($SortWrappers.$SnapTo$Ref s@13@01)) (Set_singleton x@2@01))
        (img@10@01 ($SortWrappers.$SnapTo$Ref s@13@01)))
      (Set_in s@13@01 ($PSF.domain_bar (as sm@12@01  $PSF<bar>)))))
  :pattern ((Set_in s@13@01 ($PSF.domain_bar (as sm@12@01  $PSF<bar>))))
  :qid |qp.psmDomDef1|)))
(assert (forall ((s@13@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@9@01 ($SortWrappers.$SnapTo$Ref s@13@01)) (Set_singleton x@2@01))
        (img@10@01 ($SortWrappers.$SnapTo$Ref s@13@01)))
      (= ($SortWrappers.$SnapTo$Ref s@13@01) x@2@01))
    (and
      (not (= s@13@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@12@01  $PSF<bar>) s@13@01)
        ($PSF.lookup_bar (as sm@7@01  $PSF<bar>) s@13@01))))
  :pattern (($PSF.lookup_bar (as sm@12@01  $PSF<bar>) s@13@01))
  :pattern (($PSF.lookup_bar (as sm@7@01  $PSF<bar>) s@13@01))
  :qid |qp.psmValDef0|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@12@01  $PSF<bar>)) x@2@01))
(assert (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@12@01  $PSF<bar>)) x@2@01) i@3@01))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- test ----------
(declare-const x@14@01 $Ref)
(declare-const z@15@01 $Ref)
(declare-const x@16@01 $Ref)
(declare-const z@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(declare-const r@19@01 $Ref)
(push) ; 2
; [eval] (r in Set(x, z))
; [eval] Set(x, z)
(assert (Set_in r@19@01 (Set_unionone (Set_singleton x@16@01) z@17@01)))
(pop) ; 2
(declare-fun inv@20@01 ($Ref) $Ref)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@19@01 $Ref) (r2@19@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@19@01 (Set_unionone (Set_singleton x@16@01) z@17@01))
      (Set_in r2@19@01 (Set_unionone (Set_singleton x@16@01) z@17@01))
      (= r1@19@01 r2@19@01))
    (= r1@19@01 r2@19@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@19@01 $Ref)) (!
  (=>
    (Set_in r@19@01 (Set_unionone (Set_singleton x@16@01) z@17@01))
    (and (= (inv@20@01 r@19@01) r@19@01) (img@21@01 r@19@01)))
  :pattern ((Set_in r@19@01 (Set_unionone (Set_singleton x@16@01) z@17@01)))
  :pattern ((inv@20@01 r@19@01))
  :pattern ((img@21@01 r@19@01))
  :qid |quant-u-14|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@21@01 x)
      (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
    (= (inv@20@01 x) x))
  :pattern ((inv@20@01 x))
  :qid |bar-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@18@01) $Snap.unit))
; [eval] x != z
(assert (not (= x@16@01 z@17@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; set(x, 4)
; Precomputing data for removing quantified permissions
(define-fun pTaken@22@01 ((x $Ref)) $Perm
  (ite
    (= x x@16@01)
    ($Perm.min
      (ite
        (and
          (img@21@01 x)
          (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
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
        (and
          (img@21@01 x)
          (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@22@01 x))
    $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@22@01 x) $Perm.No)
  
  :qid |quant-u-17|))))
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
  (=> (= x x@16@01) (= (- $Perm.Write (pTaken@22@01 x)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@23@01 $PSF<bar>)
(declare-const s@24@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@21@01 x@16@01)
    (Set_in (inv@20@01 x@16@01) (Set_unionone (Set_singleton x@16@01) z@17@01)))
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@16@01) $Snap.unit))
    (=
      ($PSF.lookup_bar (as sm@23@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))
      ($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) ($SortWrappers.$RefTo$Snap x@16@01))))))
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(declare-const sm@26@01 $PSF<bar>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@25@01))))
(assert (= ($Snap.second $t@25@01) $Snap.unit))
; [eval] get(x) == i
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@27@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@27@01 (Set_singleton x@16@01)))
(pop) ; 4
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@27@01 $Ref) (w2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@27@01 (Set_singleton x@16@01))
      (Set_in w2@27@01 (Set_singleton x@16@01))
      (= w1@27@01 w2@27@01))
    (= w1@27@01 w2@27@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@27@01 $Ref)) (!
  (=>
    (Set_in w@27@01 (Set_singleton x@16@01))
    (and (= (inv@28@01 w@27@01) w@27@01) (img@29@01 w@27@01)))
  :pattern ((Set_in w@27@01 (Set_singleton x@16@01)))
  :pattern ((inv@28@01 w@27@01))
  :pattern ((img@29@01 w@27@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@29@01 x) (Set_in (inv@28@01 x) (Set_singleton x@16@01)))
    (= (inv@28@01 x) x))
  :pattern ((inv@28@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@30@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@28@01 x) (Set_singleton x@16@01))
      (img@29@01 x)
      (= x (inv@28@01 x)))
    ($Perm.min
      (ite
        (and
          (img@21@01 x)
          (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (- $Perm.Write (pTaken@22@01 x))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@31@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@28@01 x) (Set_singleton x@16@01))
      (img@29@01 x)
      (= x (inv@28@01 x)))
    ($Perm.min
      (ite (= x x@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@30@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@21@01 x)
          (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (- $Perm.Write (pTaken@22@01 x))
        $Perm.No)
      (pTaken@30@01 x))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@30@01 x) $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@28@01 x) (Set_singleton x@16@01))
      (img@29@01 x)
      (= x (inv@28@01 x)))
    (= (- $Perm.Write (pTaken@30@01 x)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@31@01 x@16@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@28@01 x) (Set_singleton x@16@01))
      (img@29@01 x)
      (= x (inv@28@01 x)))
    (= (- (- $Perm.Write (pTaken@30@01 x)) (pTaken@31@01 x)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $PSF<bar>)
(declare-const s@33@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@33@01 $Snap)) (!
  (and
    (=>
      (Set_in s@33@01 ($PSF.domain_bar (as sm@32@01  $PSF<bar>)))
      (and
        (Set_in (inv@28@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_singleton x@16@01))
        (img@29@01 ($SortWrappers.$SnapTo$Ref s@33@01))))
    (=>
      (and
        (Set_in (inv@28@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_singleton x@16@01))
        (img@29@01 ($SortWrappers.$SnapTo$Ref s@33@01)))
      (Set_in s@33@01 ($PSF.domain_bar (as sm@32@01  $PSF<bar>)))))
  :pattern ((Set_in s@33@01 ($PSF.domain_bar (as sm@32@01  $PSF<bar>))))
  :qid |qp.psmDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@33@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@28@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_singleton x@16@01))
        (img@29@01 ($SortWrappers.$SnapTo$Ref s@33@01)))
      (ite
        (and
          (img@21@01 ($SortWrappers.$SnapTo$Ref s@33@01))
          (Set_in (inv@20@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (<
          $Perm.No
          (- $Perm.Write (pTaken@22@01 ($SortWrappers.$SnapTo$Ref s@33@01))))
        false))
    (and
      (not (= s@33@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@32@01  $PSF<bar>) s@33@01)
        ($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) s@33@01))))
  :pattern (($PSF.lookup_bar (as sm@32@01  $PSF<bar>) s@33@01))
  :pattern (($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) s@33@01))
  :qid |qp.psmValDef3|)))
(assert (forall ((s@33@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@28@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_singleton x@16@01))
        (img@29@01 ($SortWrappers.$SnapTo$Ref s@33@01)))
      (= ($SortWrappers.$SnapTo$Ref s@33@01) x@16@01))
    (and
      (not (= s@33@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@32@01  $PSF<bar>) s@33@01)
        ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@33@01))))
  :pattern (($PSF.lookup_bar (as sm@32@01  $PSF<bar>) s@33@01))
  :pattern (($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@33@01))
  :qid |qp.psmValDef4|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@32@01  $PSF<bar>)) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@27@01 $Ref)) (!
  (=>
    (Set_in w@27@01 (Set_singleton x@16@01))
    (and (= (inv@28@01 w@27@01) w@27@01) (img@29@01 w@27@01)))
  :pattern ((Set_in w@27@01 (Set_singleton x@16@01)))
  :pattern ((inv@28@01 w@27@01))
  :pattern ((img@29@01 w@27@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@29@01 x) (Set_in (inv@28@01 x) (Set_singleton x@16@01)))
    (= (inv@28@01 x) x))
  :pattern ((inv@28@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@33@01 $Snap)) (!
  (and
    (=>
      (Set_in s@33@01 ($PSF.domain_bar (as sm@32@01  $PSF<bar>)))
      (and
        (Set_in (inv@28@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_singleton x@16@01))
        (img@29@01 ($SortWrappers.$SnapTo$Ref s@33@01))))
    (=>
      (and
        (Set_in (inv@28@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_singleton x@16@01))
        (img@29@01 ($SortWrappers.$SnapTo$Ref s@33@01)))
      (Set_in s@33@01 ($PSF.domain_bar (as sm@32@01  $PSF<bar>)))))
  :pattern ((Set_in s@33@01 ($PSF.domain_bar (as sm@32@01  $PSF<bar>))))
  :qid |qp.psmDomDef5|)))
(assert (forall ((s@33@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@28@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_singleton x@16@01))
        (img@29@01 ($SortWrappers.$SnapTo$Ref s@33@01)))
      (ite
        (and
          (img@21@01 ($SortWrappers.$SnapTo$Ref s@33@01))
          (Set_in (inv@20@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (<
          $Perm.No
          (- $Perm.Write (pTaken@22@01 ($SortWrappers.$SnapTo$Ref s@33@01))))
        false))
    (and
      (not (= s@33@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@32@01  $PSF<bar>) s@33@01)
        ($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) s@33@01))))
  :pattern (($PSF.lookup_bar (as sm@32@01  $PSF<bar>) s@33@01))
  :pattern (($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) s@33@01))
  :qid |qp.psmValDef3|)))
(assert (forall ((s@33@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@28@01 ($SortWrappers.$SnapTo$Ref s@33@01)) (Set_singleton x@16@01))
        (img@29@01 ($SortWrappers.$SnapTo$Ref s@33@01)))
      (= ($SortWrappers.$SnapTo$Ref s@33@01) x@16@01))
    (and
      (not (= s@33@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@32@01  $PSF<bar>) s@33@01)
        ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@33@01))))
  :pattern (($PSF.lookup_bar (as sm@32@01  $PSF<bar>) s@33@01))
  :pattern (($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@33@01))
  :qid |qp.psmValDef4|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@32@01  $PSF<bar>)) x@16@01))
(assert (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@32@01  $PSF<bar>)) x@16@01) 4))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert get(x) == 4
; [eval] get(x) == 4
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@34@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@34@01 (Set_singleton x@16@01)))
(pop) ; 4
(declare-fun inv@35@01 ($Ref) $Ref)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@34@01 $Ref) (w2@34@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@34@01 (Set_singleton x@16@01))
      (Set_in w2@34@01 (Set_singleton x@16@01))
      (= w1@34@01 w2@34@01))
    (= w1@34@01 w2@34@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@34@01 $Ref)) (!
  (=>
    (Set_in w@34@01 (Set_singleton x@16@01))
    (and (= (inv@35@01 w@34@01) w@34@01) (img@36@01 w@34@01)))
  :pattern ((Set_in w@34@01 (Set_singleton x@16@01)))
  :pattern ((inv@35@01 w@34@01))
  :pattern ((img@36@01 w@34@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@36@01 x) (Set_in (inv@35@01 x) (Set_singleton x@16@01)))
    (= (inv@35@01 x) x))
  :pattern ((inv@35@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@37@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@35@01 x) (Set_singleton x@16@01))
      (img@36@01 x)
      (= x (inv@35@01 x)))
    ($Perm.min
      (ite
        (and
          (img@21@01 x)
          (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (- $Perm.Write (pTaken@22@01 x))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@38@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@35@01 x) (Set_singleton x@16@01))
      (img@36@01 x)
      (= x (inv@35@01 x)))
    ($Perm.min
      (ite (= x x@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@37@01 x)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@21@01 x)
          (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (- $Perm.Write (pTaken@22@01 x))
        $Perm.No)
      (pTaken@37@01 x))
    $Perm.No)
  
  :qid |quant-u-28|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@37@01 x) $Perm.No)
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@35@01 x) (Set_singleton x@16@01))
      (img@36@01 x)
      (= x (inv@35@01 x)))
    (= (- $Perm.Write (pTaken@37@01 x)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@38@01 x@16@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@35@01 x) (Set_singleton x@16@01))
      (img@36@01 x)
      (= x (inv@35@01 x)))
    (= (- (- $Perm.Write (pTaken@37@01 x)) (pTaken@38@01 x)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@39@01 $PSF<bar>)
(declare-const s@40@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@40@01 $Snap)) (!
  (and
    (=>
      (Set_in s@40@01 ($PSF.domain_bar (as sm@39@01  $PSF<bar>)))
      (and
        (Set_in (inv@35@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_singleton x@16@01))
        (img@36@01 ($SortWrappers.$SnapTo$Ref s@40@01))))
    (=>
      (and
        (Set_in (inv@35@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_singleton x@16@01))
        (img@36@01 ($SortWrappers.$SnapTo$Ref s@40@01)))
      (Set_in s@40@01 ($PSF.domain_bar (as sm@39@01  $PSF<bar>)))))
  :pattern ((Set_in s@40@01 ($PSF.domain_bar (as sm@39@01  $PSF<bar>))))
  :qid |qp.psmDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@40@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_singleton x@16@01))
        (img@36@01 ($SortWrappers.$SnapTo$Ref s@40@01)))
      (ite
        (and
          (img@21@01 ($SortWrappers.$SnapTo$Ref s@40@01))
          (Set_in (inv@20@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (<
          $Perm.No
          (- $Perm.Write (pTaken@22@01 ($SortWrappers.$SnapTo$Ref s@40@01))))
        false))
    (and
      (not (= s@40@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@39@01  $PSF<bar>) s@40@01)
        ($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) s@40@01))))
  :pattern (($PSF.lookup_bar (as sm@39@01  $PSF<bar>) s@40@01))
  :pattern (($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) s@40@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@40@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_singleton x@16@01))
        (img@36@01 ($SortWrappers.$SnapTo$Ref s@40@01)))
      (= ($SortWrappers.$SnapTo$Ref s@40@01) x@16@01))
    (and
      (not (= s@40@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@39@01  $PSF<bar>) s@40@01)
        ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@40@01))))
  :pattern (($PSF.lookup_bar (as sm@39@01  $PSF<bar>) s@40@01))
  :pattern (($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@40@01))
  :qid |qp.psmValDef7|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@39@01  $PSF<bar>)) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@34@01 $Ref)) (!
  (=>
    (Set_in w@34@01 (Set_singleton x@16@01))
    (and (= (inv@35@01 w@34@01) w@34@01) (img@36@01 w@34@01)))
  :pattern ((Set_in w@34@01 (Set_singleton x@16@01)))
  :pattern ((inv@35@01 w@34@01))
  :pattern ((img@36@01 w@34@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@36@01 x) (Set_in (inv@35@01 x) (Set_singleton x@16@01)))
    (= (inv@35@01 x) x))
  :pattern ((inv@35@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@40@01 $Snap)) (!
  (and
    (=>
      (Set_in s@40@01 ($PSF.domain_bar (as sm@39@01  $PSF<bar>)))
      (and
        (Set_in (inv@35@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_singleton x@16@01))
        (img@36@01 ($SortWrappers.$SnapTo$Ref s@40@01))))
    (=>
      (and
        (Set_in (inv@35@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_singleton x@16@01))
        (img@36@01 ($SortWrappers.$SnapTo$Ref s@40@01)))
      (Set_in s@40@01 ($PSF.domain_bar (as sm@39@01  $PSF<bar>)))))
  :pattern ((Set_in s@40@01 ($PSF.domain_bar (as sm@39@01  $PSF<bar>))))
  :qid |qp.psmDomDef8|)))
(assert (forall ((s@40@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_singleton x@16@01))
        (img@36@01 ($SortWrappers.$SnapTo$Ref s@40@01)))
      (ite
        (and
          (img@21@01 ($SortWrappers.$SnapTo$Ref s@40@01))
          (Set_in (inv@20@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (<
          $Perm.No
          (- $Perm.Write (pTaken@22@01 ($SortWrappers.$SnapTo$Ref s@40@01))))
        false))
    (and
      (not (= s@40@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@39@01  $PSF<bar>) s@40@01)
        ($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) s@40@01))))
  :pattern (($PSF.lookup_bar (as sm@39@01  $PSF<bar>) s@40@01))
  :pattern (($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) s@40@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@40@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@01 ($SortWrappers.$SnapTo$Ref s@40@01)) (Set_singleton x@16@01))
        (img@36@01 ($SortWrappers.$SnapTo$Ref s@40@01)))
      (= ($SortWrappers.$SnapTo$Ref s@40@01) x@16@01))
    (and
      (not (= s@40@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@39@01  $PSF<bar>) s@40@01)
        ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@40@01))))
  :pattern (($PSF.lookup_bar (as sm@39@01  $PSF<bar>) s@40@01))
  :pattern (($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@40@01))
  :qid |qp.psmValDef7|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@39@01  $PSF<bar>)) x@16@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@39@01  $PSF<bar>)) x@16@01) 4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@39@01  $PSF<bar>)) x@16@01) 4))
; [exec]
; set(z, 3)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@16@01 z@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((x $Ref)) $Perm
  (ite
    (= x z@17@01)
    ($Perm.min
      (ite
        (and
          (img@21@01 x)
          (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (- $Perm.Write (pTaken@22@01 x))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@42@01 ((x $Ref)) $Perm
  (ite
    (= x z@17@01)
    ($Perm.min
      (ite (= x x@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@41@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and
          (img@21@01 x)
          (Set_in (inv@20@01 x) (Set_unionone (Set_singleton x@16@01) z@17@01)))
        (- $Perm.Write (pTaken@22@01 x))
        $Perm.No)
      (pTaken@41@01 x))
    $Perm.No)
  
  :qid |quant-u-34|))))
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
  (=> (= x z@17@01) (= (- $Perm.Write (pTaken@41@01 x)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $PSF<bar>)
(declare-const s@44@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@21@01 z@17@01)
      (Set_in (inv@20@01 z@17@01) (Set_unionone (Set_singleton x@16@01) z@17@01)))
    (< $Perm.No (- $Perm.Write (pTaken@22@01 z@17@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@17@01) $Snap.unit))
    (=
      ($PSF.lookup_bar (as sm@43@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))
      ($PSF.lookup_bar ($SortWrappers.$SnapTo$PSF<bar> ($Snap.first $t@18@01)) ($SortWrappers.$RefTo$Snap z@17@01))))))
(assert (=>
  (= z@17@01 x@16@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@17@01) $Snap.unit))
    (=
      ($PSF.lookup_bar (as sm@43@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))
      ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))))))
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 ($Snap.combine ($Snap.first $t@45@01) ($Snap.second $t@45@01))))
(declare-const sm@46@01 $PSF<bar>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@45@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@45@01) $Snap.unit))
; [eval] get(x) == i
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@47@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@47@01 (Set_singleton z@17@01)))
(pop) ; 4
(declare-fun inv@48@01 ($Ref) $Ref)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@47@01 $Ref) (w2@47@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@47@01 (Set_singleton z@17@01))
      (Set_in w2@47@01 (Set_singleton z@17@01))
      (= w1@47@01 w2@47@01))
    (= w1@47@01 w2@47@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@47@01 $Ref)) (!
  (=>
    (Set_in w@47@01 (Set_singleton z@17@01))
    (and (= (inv@48@01 w@47@01) w@47@01) (img@49@01 w@47@01)))
  :pattern ((Set_in w@47@01 (Set_singleton z@17@01)))
  :pattern ((inv@48@01 w@47@01))
  :pattern ((img@49@01 w@47@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@49@01 x) (Set_in (inv@48@01 x) (Set_singleton z@17@01)))
    (= (inv@48@01 x) x))
  :pattern ((inv@48@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@48@01 x) (Set_singleton z@17@01))
      (img@49@01 x)
      (= x (inv@48@01 x)))
    ($Perm.min (ite (= x x@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@51@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@48@01 x) (Set_singleton z@17@01))
      (img@49@01 x)
      (= x (inv@48@01 x)))
    ($Perm.min
      (ite (= x z@17@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@50@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@50@01 x@16@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@50@01 x) $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@48@01 x) (Set_singleton z@17@01))
      (img@49@01 x)
      (= x (inv@48@01 x)))
    (= (- $Perm.Write (pTaken@50@01 x)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@51@01 z@17@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@48@01 x) (Set_singleton z@17@01))
      (img@49@01 x)
      (= x (inv@48@01 x)))
    (= (- (- $Perm.Write (pTaken@50@01 x)) (pTaken@51@01 x)) $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@52@01 $PSF<bar>)
(declare-const s@53@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@53@01 $Snap)) (!
  (and
    (=>
      (Set_in s@53@01 ($PSF.domain_bar (as sm@52@01  $PSF<bar>)))
      (and
        (Set_in (inv@48@01 ($SortWrappers.$SnapTo$Ref s@53@01)) (Set_singleton z@17@01))
        (img@49@01 ($SortWrappers.$SnapTo$Ref s@53@01))))
    (=>
      (and
        (Set_in (inv@48@01 ($SortWrappers.$SnapTo$Ref s@53@01)) (Set_singleton z@17@01))
        (img@49@01 ($SortWrappers.$SnapTo$Ref s@53@01)))
      (Set_in s@53@01 ($PSF.domain_bar (as sm@52@01  $PSF<bar>)))))
  :pattern ((Set_in s@53@01 ($PSF.domain_bar (as sm@52@01  $PSF<bar>))))
  :qid |qp.psmDomDef13|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@53@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@48@01 ($SortWrappers.$SnapTo$Ref s@53@01)) (Set_singleton z@17@01))
        (img@49@01 ($SortWrappers.$SnapTo$Ref s@53@01)))
      (= ($SortWrappers.$SnapTo$Ref s@53@01) x@16@01))
    (and
      (not (= s@53@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@52@01  $PSF<bar>) s@53@01)
        ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@53@01))))
  :pattern (($PSF.lookup_bar (as sm@52@01  $PSF<bar>) s@53@01))
  :pattern (($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@53@01))
  :qid |qp.psmValDef11|)))
(assert (forall ((s@53@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@48@01 ($SortWrappers.$SnapTo$Ref s@53@01)) (Set_singleton z@17@01))
        (img@49@01 ($SortWrappers.$SnapTo$Ref s@53@01)))
      (= ($SortWrappers.$SnapTo$Ref s@53@01) z@17@01))
    (and
      (not (= s@53@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@52@01  $PSF<bar>) s@53@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@53@01))))
  :pattern (($PSF.lookup_bar (as sm@52@01  $PSF<bar>) s@53@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@53@01))
  :qid |qp.psmValDef12|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@52@01  $PSF<bar>)) z@17@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@47@01 $Ref)) (!
  (=>
    (Set_in w@47@01 (Set_singleton z@17@01))
    (and (= (inv@48@01 w@47@01) w@47@01) (img@49@01 w@47@01)))
  :pattern ((Set_in w@47@01 (Set_singleton z@17@01)))
  :pattern ((inv@48@01 w@47@01))
  :pattern ((img@49@01 w@47@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@49@01 x) (Set_in (inv@48@01 x) (Set_singleton z@17@01)))
    (= (inv@48@01 x) x))
  :pattern ((inv@48@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@53@01 $Snap)) (!
  (and
    (=>
      (Set_in s@53@01 ($PSF.domain_bar (as sm@52@01  $PSF<bar>)))
      (and
        (Set_in (inv@48@01 ($SortWrappers.$SnapTo$Ref s@53@01)) (Set_singleton z@17@01))
        (img@49@01 ($SortWrappers.$SnapTo$Ref s@53@01))))
    (=>
      (and
        (Set_in (inv@48@01 ($SortWrappers.$SnapTo$Ref s@53@01)) (Set_singleton z@17@01))
        (img@49@01 ($SortWrappers.$SnapTo$Ref s@53@01)))
      (Set_in s@53@01 ($PSF.domain_bar (as sm@52@01  $PSF<bar>)))))
  :pattern ((Set_in s@53@01 ($PSF.domain_bar (as sm@52@01  $PSF<bar>))))
  :qid |qp.psmDomDef13|)))
(assert (forall ((s@53@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@48@01 ($SortWrappers.$SnapTo$Ref s@53@01)) (Set_singleton z@17@01))
        (img@49@01 ($SortWrappers.$SnapTo$Ref s@53@01)))
      (= ($SortWrappers.$SnapTo$Ref s@53@01) x@16@01))
    (and
      (not (= s@53@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@52@01  $PSF<bar>) s@53@01)
        ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@53@01))))
  :pattern (($PSF.lookup_bar (as sm@52@01  $PSF<bar>) s@53@01))
  :pattern (($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@53@01))
  :qid |qp.psmValDef11|)))
(assert (forall ((s@53@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@48@01 ($SortWrappers.$SnapTo$Ref s@53@01)) (Set_singleton z@17@01))
        (img@49@01 ($SortWrappers.$SnapTo$Ref s@53@01)))
      (= ($SortWrappers.$SnapTo$Ref s@53@01) z@17@01))
    (and
      (not (= s@53@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@52@01  $PSF<bar>) s@53@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@53@01))))
  :pattern (($PSF.lookup_bar (as sm@52@01  $PSF<bar>) s@53@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@53@01))
  :qid |qp.psmValDef12|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@52@01  $PSF<bar>)) z@17@01))
(assert (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@52@01  $PSF<bar>)) z@17@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert get(x) == 4
; [eval] get(x) == 4
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@54@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@54@01 (Set_singleton x@16@01)))
(pop) ; 4
(declare-fun inv@55@01 ($Ref) $Ref)
(declare-fun img@56@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@54@01 $Ref) (w2@54@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@54@01 (Set_singleton x@16@01))
      (Set_in w2@54@01 (Set_singleton x@16@01))
      (= w1@54@01 w2@54@01))
    (= w1@54@01 w2@54@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@54@01 $Ref)) (!
  (=>
    (Set_in w@54@01 (Set_singleton x@16@01))
    (and (= (inv@55@01 w@54@01) w@54@01) (img@56@01 w@54@01)))
  :pattern ((Set_in w@54@01 (Set_singleton x@16@01)))
  :pattern ((inv@55@01 w@54@01))
  :pattern ((img@56@01 w@54@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@56@01 x) (Set_in (inv@55@01 x) (Set_singleton x@16@01)))
    (= (inv@55@01 x) x))
  :pattern ((inv@55@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@57@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@55@01 x) (Set_singleton x@16@01))
      (img@56@01 x)
      (= x (inv@55@01 x)))
    ($Perm.min (ite (= x x@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@58@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@55@01 x) (Set_singleton x@16@01))
      (img@56@01 x)
      (= x (inv@55@01 x)))
    ($Perm.min
      (ite (= x z@17@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@57@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@57@01 x@16@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@55@01 x) (Set_singleton x@16@01))
      (img@56@01 x)
      (= x (inv@55@01 x)))
    (= (- $Perm.Write (pTaken@57@01 x)) $Perm.No))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@59@01 $PSF<bar>)
(declare-const s@60@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@60@01 $Snap)) (!
  (and
    (=>
      (Set_in s@60@01 ($PSF.domain_bar (as sm@59@01  $PSF<bar>)))
      (and
        (Set_in (inv@55@01 ($SortWrappers.$SnapTo$Ref s@60@01)) (Set_singleton x@16@01))
        (img@56@01 ($SortWrappers.$SnapTo$Ref s@60@01))))
    (=>
      (and
        (Set_in (inv@55@01 ($SortWrappers.$SnapTo$Ref s@60@01)) (Set_singleton x@16@01))
        (img@56@01 ($SortWrappers.$SnapTo$Ref s@60@01)))
      (Set_in s@60@01 ($PSF.domain_bar (as sm@59@01  $PSF<bar>)))))
  :pattern ((Set_in s@60@01 ($PSF.domain_bar (as sm@59@01  $PSF<bar>))))
  :qid |qp.psmDomDef16|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@60@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@01 ($SortWrappers.$SnapTo$Ref s@60@01)) (Set_singleton x@16@01))
        (img@56@01 ($SortWrappers.$SnapTo$Ref s@60@01)))
      (= ($SortWrappers.$SnapTo$Ref s@60@01) x@16@01))
    (and
      (not (= s@60@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@59@01  $PSF<bar>) s@60@01)
        ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@60@01))))
  :pattern (($PSF.lookup_bar (as sm@59@01  $PSF<bar>) s@60@01))
  :pattern (($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@60@01))
  :qid |qp.psmValDef14|)))
(assert (forall ((s@60@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@01 ($SortWrappers.$SnapTo$Ref s@60@01)) (Set_singleton x@16@01))
        (img@56@01 ($SortWrappers.$SnapTo$Ref s@60@01)))
      (= ($SortWrappers.$SnapTo$Ref s@60@01) z@17@01))
    (and
      (not (= s@60@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@59@01  $PSF<bar>) s@60@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@60@01))))
  :pattern (($PSF.lookup_bar (as sm@59@01  $PSF<bar>) s@60@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@60@01))
  :qid |qp.psmValDef15|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@59@01  $PSF<bar>)) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@54@01 $Ref)) (!
  (=>
    (Set_in w@54@01 (Set_singleton x@16@01))
    (and (= (inv@55@01 w@54@01) w@54@01) (img@56@01 w@54@01)))
  :pattern ((Set_in w@54@01 (Set_singleton x@16@01)))
  :pattern ((inv@55@01 w@54@01))
  :pattern ((img@56@01 w@54@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@56@01 x) (Set_in (inv@55@01 x) (Set_singleton x@16@01)))
    (= (inv@55@01 x) x))
  :pattern ((inv@55@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@60@01 $Snap)) (!
  (and
    (=>
      (Set_in s@60@01 ($PSF.domain_bar (as sm@59@01  $PSF<bar>)))
      (and
        (Set_in (inv@55@01 ($SortWrappers.$SnapTo$Ref s@60@01)) (Set_singleton x@16@01))
        (img@56@01 ($SortWrappers.$SnapTo$Ref s@60@01))))
    (=>
      (and
        (Set_in (inv@55@01 ($SortWrappers.$SnapTo$Ref s@60@01)) (Set_singleton x@16@01))
        (img@56@01 ($SortWrappers.$SnapTo$Ref s@60@01)))
      (Set_in s@60@01 ($PSF.domain_bar (as sm@59@01  $PSF<bar>)))))
  :pattern ((Set_in s@60@01 ($PSF.domain_bar (as sm@59@01  $PSF<bar>))))
  :qid |qp.psmDomDef16|)))
(assert (forall ((s@60@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@01 ($SortWrappers.$SnapTo$Ref s@60@01)) (Set_singleton x@16@01))
        (img@56@01 ($SortWrappers.$SnapTo$Ref s@60@01)))
      (= ($SortWrappers.$SnapTo$Ref s@60@01) x@16@01))
    (and
      (not (= s@60@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@59@01  $PSF<bar>) s@60@01)
        ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@60@01))))
  :pattern (($PSF.lookup_bar (as sm@59@01  $PSF<bar>) s@60@01))
  :pattern (($PSF.lookup_bar (as sm@26@01  $PSF<bar>) s@60@01))
  :qid |qp.psmValDef14|)))
(assert (forall ((s@60@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@55@01 ($SortWrappers.$SnapTo$Ref s@60@01)) (Set_singleton x@16@01))
        (img@56@01 ($SortWrappers.$SnapTo$Ref s@60@01)))
      (= ($SortWrappers.$SnapTo$Ref s@60@01) z@17@01))
    (and
      (not (= s@60@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@59@01  $PSF<bar>) s@60@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@60@01))))
  :pattern (($PSF.lookup_bar (as sm@59@01  $PSF<bar>) s@60@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@60@01))
  :qid |qp.psmValDef15|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@59@01  $PSF<bar>)) x@16@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@59@01  $PSF<bar>)) x@16@01) 4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@59@01  $PSF<bar>)) x@16@01) 4))
; [exec]
; set(x, 3)
; Precomputing data for removing quantified permissions
(define-fun pTaken@61@01 ((x $Ref)) $Perm
  (ite
    (= x x@16@01)
    ($Perm.min (ite (= x x@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@62@01 ((x $Ref)) $Perm
  (ite
    (= x x@16@01)
    ($Perm.min
      (ite (= x z@17@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@61@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@61@01 x@16@01)) $Perm.No)))
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
  (=> (= x x@16@01) (= (- $Perm.Write (pTaken@61@01 x)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $PSF<bar>)
(declare-const s@64@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@16@01) $Snap.unit))
  (=
    ($PSF.lookup_bar (as sm@63@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))
    ($PSF.lookup_bar (as sm@26@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01)))))
(assert (=>
  (= x@16@01 z@17@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@16@01) $Snap.unit))
    (=
      ($PSF.lookup_bar (as sm@63@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))
      ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))))))
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(declare-const sm@66@01 $PSF<bar>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@65@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@16@01 z@17@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@65@01) $Snap.unit))
; [eval] get(x) == i
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@67@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@67@01 (Set_singleton x@16@01)))
(pop) ; 4
(declare-fun inv@68@01 ($Ref) $Ref)
(declare-fun img@69@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@67@01 $Ref) (w2@67@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@67@01 (Set_singleton x@16@01))
      (Set_in w2@67@01 (Set_singleton x@16@01))
      (= w1@67@01 w2@67@01))
    (= w1@67@01 w2@67@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@67@01 $Ref)) (!
  (=>
    (Set_in w@67@01 (Set_singleton x@16@01))
    (and (= (inv@68@01 w@67@01) w@67@01) (img@69@01 w@67@01)))
  :pattern ((Set_in w@67@01 (Set_singleton x@16@01)))
  :pattern ((inv@68@01 w@67@01))
  :pattern ((img@69@01 w@67@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@69@01 x) (Set_in (inv@68@01 x) (Set_singleton x@16@01)))
    (= (inv@68@01 x) x))
  :pattern ((inv@68@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@70@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@68@01 x) (Set_singleton x@16@01))
      (img@69@01 x)
      (= x (inv@68@01 x)))
    ($Perm.min (ite (= x z@17@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@71@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@68@01 x) (Set_singleton x@16@01))
      (img@69@01 x)
      (= x (inv@68@01 x)))
    ($Perm.min
      (ite (= x x@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@70@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@70@01 z@17@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@70@01 x) $Perm.No)
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@68@01 x) (Set_singleton x@16@01))
      (img@69@01 x)
      (= x (inv@68@01 x)))
    (= (- $Perm.Write (pTaken@70@01 x)) $Perm.No))
  
  :qid |quant-u-54|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@71@01 x@16@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@68@01 x) (Set_singleton x@16@01))
      (img@69@01 x)
      (= x (inv@68@01 x)))
    (= (- (- $Perm.Write (pTaken@70@01 x)) (pTaken@71@01 x)) $Perm.No))
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@72@01 $PSF<bar>)
(declare-const s@73@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@73@01 $Snap)) (!
  (and
    (=>
      (Set_in s@73@01 ($PSF.domain_bar (as sm@72@01  $PSF<bar>)))
      (and
        (Set_in (inv@68@01 ($SortWrappers.$SnapTo$Ref s@73@01)) (Set_singleton x@16@01))
        (img@69@01 ($SortWrappers.$SnapTo$Ref s@73@01))))
    (=>
      (and
        (Set_in (inv@68@01 ($SortWrappers.$SnapTo$Ref s@73@01)) (Set_singleton x@16@01))
        (img@69@01 ($SortWrappers.$SnapTo$Ref s@73@01)))
      (Set_in s@73@01 ($PSF.domain_bar (as sm@72@01  $PSF<bar>)))))
  :pattern ((Set_in s@73@01 ($PSF.domain_bar (as sm@72@01  $PSF<bar>))))
  :qid |qp.psmDomDef21|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@73@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@68@01 ($SortWrappers.$SnapTo$Ref s@73@01)) (Set_singleton x@16@01))
        (img@69@01 ($SortWrappers.$SnapTo$Ref s@73@01)))
      (= ($SortWrappers.$SnapTo$Ref s@73@01) z@17@01))
    (and
      (not (= s@73@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@72@01  $PSF<bar>) s@73@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@73@01))))
  :pattern (($PSF.lookup_bar (as sm@72@01  $PSF<bar>) s@73@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@73@01))
  :qid |qp.psmValDef19|)))
(assert (forall ((s@73@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@68@01 ($SortWrappers.$SnapTo$Ref s@73@01)) (Set_singleton x@16@01))
        (img@69@01 ($SortWrappers.$SnapTo$Ref s@73@01)))
      (= ($SortWrappers.$SnapTo$Ref s@73@01) x@16@01))
    (and
      (not (= s@73@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@72@01  $PSF<bar>) s@73@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@73@01))))
  :pattern (($PSF.lookup_bar (as sm@72@01  $PSF<bar>) s@73@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@73@01))
  :qid |qp.psmValDef20|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@72@01  $PSF<bar>)) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@67@01 $Ref)) (!
  (=>
    (Set_in w@67@01 (Set_singleton x@16@01))
    (and (= (inv@68@01 w@67@01) w@67@01) (img@69@01 w@67@01)))
  :pattern ((Set_in w@67@01 (Set_singleton x@16@01)))
  :pattern ((inv@68@01 w@67@01))
  :pattern ((img@69@01 w@67@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@69@01 x) (Set_in (inv@68@01 x) (Set_singleton x@16@01)))
    (= (inv@68@01 x) x))
  :pattern ((inv@68@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@73@01 $Snap)) (!
  (and
    (=>
      (Set_in s@73@01 ($PSF.domain_bar (as sm@72@01  $PSF<bar>)))
      (and
        (Set_in (inv@68@01 ($SortWrappers.$SnapTo$Ref s@73@01)) (Set_singleton x@16@01))
        (img@69@01 ($SortWrappers.$SnapTo$Ref s@73@01))))
    (=>
      (and
        (Set_in (inv@68@01 ($SortWrappers.$SnapTo$Ref s@73@01)) (Set_singleton x@16@01))
        (img@69@01 ($SortWrappers.$SnapTo$Ref s@73@01)))
      (Set_in s@73@01 ($PSF.domain_bar (as sm@72@01  $PSF<bar>)))))
  :pattern ((Set_in s@73@01 ($PSF.domain_bar (as sm@72@01  $PSF<bar>))))
  :qid |qp.psmDomDef21|)))
(assert (forall ((s@73@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@68@01 ($SortWrappers.$SnapTo$Ref s@73@01)) (Set_singleton x@16@01))
        (img@69@01 ($SortWrappers.$SnapTo$Ref s@73@01)))
      (= ($SortWrappers.$SnapTo$Ref s@73@01) z@17@01))
    (and
      (not (= s@73@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@72@01  $PSF<bar>) s@73@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@73@01))))
  :pattern (($PSF.lookup_bar (as sm@72@01  $PSF<bar>) s@73@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@73@01))
  :qid |qp.psmValDef19|)))
(assert (forall ((s@73@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@68@01 ($SortWrappers.$SnapTo$Ref s@73@01)) (Set_singleton x@16@01))
        (img@69@01 ($SortWrappers.$SnapTo$Ref s@73@01)))
      (= ($SortWrappers.$SnapTo$Ref s@73@01) x@16@01))
    (and
      (not (= s@73@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@72@01  $PSF<bar>) s@73@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@73@01))))
  :pattern (($PSF.lookup_bar (as sm@72@01  $PSF<bar>) s@73@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@73@01))
  :qid |qp.psmValDef20|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@72@01  $PSF<bar>)) x@16@01))
(assert (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@72@01  $PSF<bar>)) x@16@01) 3))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert get(x) == 4
; [eval] get(x) == 4
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@74@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@74@01 (Set_singleton x@16@01)))
(pop) ; 4
(declare-fun inv@75@01 ($Ref) $Ref)
(declare-fun img@76@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@74@01 $Ref) (w2@74@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@74@01 (Set_singleton x@16@01))
      (Set_in w2@74@01 (Set_singleton x@16@01))
      (= w1@74@01 w2@74@01))
    (= w1@74@01 w2@74@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@74@01 $Ref)) (!
  (=>
    (Set_in w@74@01 (Set_singleton x@16@01))
    (and (= (inv@75@01 w@74@01) w@74@01) (img@76@01 w@74@01)))
  :pattern ((Set_in w@74@01 (Set_singleton x@16@01)))
  :pattern ((inv@75@01 w@74@01))
  :pattern ((img@76@01 w@74@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@76@01 x) (Set_in (inv@75@01 x) (Set_singleton x@16@01)))
    (= (inv@75@01 x) x))
  :pattern ((inv@75@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@77@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@75@01 x) (Set_singleton x@16@01))
      (img@76@01 x)
      (= x (inv@75@01 x)))
    ($Perm.min (ite (= x z@17@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@78@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@75@01 x) (Set_singleton x@16@01))
      (img@76@01 x)
      (= x (inv@75@01 x)))
    ($Perm.min
      (ite (= x x@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@77@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@77@01 z@17@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@77@01 x) $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@75@01 x) (Set_singleton x@16@01))
      (img@76@01 x)
      (= x (inv@75@01 x)))
    (= (- $Perm.Write (pTaken@77@01 x)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@78@01 x@16@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@75@01 x) (Set_singleton x@16@01))
      (img@76@01 x)
      (= x (inv@75@01 x)))
    (= (- (- $Perm.Write (pTaken@77@01 x)) (pTaken@78@01 x)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@79@01 $PSF<bar>)
(declare-const s@80@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@80@01 $Snap)) (!
  (and
    (=>
      (Set_in s@80@01 ($PSF.domain_bar (as sm@79@01  $PSF<bar>)))
      (and
        (Set_in (inv@75@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (Set_singleton x@16@01))
        (img@76@01 ($SortWrappers.$SnapTo$Ref s@80@01))))
    (=>
      (and
        (Set_in (inv@75@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (Set_singleton x@16@01))
        (img@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)))
      (Set_in s@80@01 ($PSF.domain_bar (as sm@79@01  $PSF<bar>)))))
  :pattern ((Set_in s@80@01 ($PSF.domain_bar (as sm@79@01  $PSF<bar>))))
  :qid |qp.psmDomDef24|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@80@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (Set_singleton x@16@01))
        (img@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)))
      (= ($SortWrappers.$SnapTo$Ref s@80@01) z@17@01))
    (and
      (not (= s@80@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@79@01  $PSF<bar>) s@80@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@80@01))))
  :pattern (($PSF.lookup_bar (as sm@79@01  $PSF<bar>) s@80@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@80@01))
  :qid |qp.psmValDef22|)))
(assert (forall ((s@80@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (Set_singleton x@16@01))
        (img@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)))
      (= ($SortWrappers.$SnapTo$Ref s@80@01) x@16@01))
    (and
      (not (= s@80@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@79@01  $PSF<bar>) s@80@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@80@01))))
  :pattern (($PSF.lookup_bar (as sm@79@01  $PSF<bar>) s@80@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@80@01))
  :qid |qp.psmValDef23|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@79@01  $PSF<bar>)) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@74@01 $Ref)) (!
  (=>
    (Set_in w@74@01 (Set_singleton x@16@01))
    (and (= (inv@75@01 w@74@01) w@74@01) (img@76@01 w@74@01)))
  :pattern ((Set_in w@74@01 (Set_singleton x@16@01)))
  :pattern ((inv@75@01 w@74@01))
  :pattern ((img@76@01 w@74@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@76@01 x) (Set_in (inv@75@01 x) (Set_singleton x@16@01)))
    (= (inv@75@01 x) x))
  :pattern ((inv@75@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@80@01 $Snap)) (!
  (and
    (=>
      (Set_in s@80@01 ($PSF.domain_bar (as sm@79@01  $PSF<bar>)))
      (and
        (Set_in (inv@75@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (Set_singleton x@16@01))
        (img@76@01 ($SortWrappers.$SnapTo$Ref s@80@01))))
    (=>
      (and
        (Set_in (inv@75@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (Set_singleton x@16@01))
        (img@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)))
      (Set_in s@80@01 ($PSF.domain_bar (as sm@79@01  $PSF<bar>)))))
  :pattern ((Set_in s@80@01 ($PSF.domain_bar (as sm@79@01  $PSF<bar>))))
  :qid |qp.psmDomDef24|)))
(assert (forall ((s@80@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (Set_singleton x@16@01))
        (img@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)))
      (= ($SortWrappers.$SnapTo$Ref s@80@01) z@17@01))
    (and
      (not (= s@80@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@79@01  $PSF<bar>) s@80@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@80@01))))
  :pattern (($PSF.lookup_bar (as sm@79@01  $PSF<bar>) s@80@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@80@01))
  :qid |qp.psmValDef22|)))
(assert (forall ((s@80@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@75@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (Set_singleton x@16@01))
        (img@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)))
      (= ($SortWrappers.$SnapTo$Ref s@80@01) x@16@01))
    (and
      (not (= s@80@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@79@01  $PSF<bar>) s@80@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@80@01))))
  :pattern (($PSF.lookup_bar (as sm@79@01  $PSF<bar>) s@80@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@80@01))
  :qid |qp.psmValDef23|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@79@01  $PSF<bar>)) x@16@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@79@01  $PSF<bar>)) x@16@01) 4)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@17@01 x@16@01)))
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
    ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))
    ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))))))
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
    ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))
    ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] get(x) == 4
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@81@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@81@01 (Set_singleton x@16@01)))
(pop) ; 4
(declare-fun inv@82@01 ($Ref) $Ref)
(declare-fun img@83@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@81@01 $Ref) (w2@81@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@81@01 (Set_singleton x@16@01))
      (Set_in w2@81@01 (Set_singleton x@16@01))
      (= w1@81@01 w2@81@01))
    (= w1@81@01 w2@81@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@81@01 $Ref)) (!
  (=>
    (Set_in w@81@01 (Set_singleton x@16@01))
    (and (= (inv@82@01 w@81@01) w@81@01) (img@83@01 w@81@01)))
  :pattern ((Set_in w@81@01 (Set_singleton x@16@01)))
  :pattern ((inv@82@01 w@81@01))
  :pattern ((img@83@01 w@81@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@83@01 x) (Set_in (inv@82@01 x) (Set_singleton x@16@01)))
    (= (inv@82@01 x) x))
  :pattern ((inv@82@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@84@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@82@01 x) (Set_singleton x@16@01))
      (img@83@01 x)
      (= x (inv@82@01 x)))
    ($Perm.min (ite (= x x@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@85@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@82@01 x) (Set_singleton x@16@01))
      (img@83@01 x)
      (= x (inv@82@01 x)))
    ($Perm.min
      (ite (= x z@17@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@84@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@84@01 x@16@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@82@01 x) (Set_singleton x@16@01))
      (img@83@01 x)
      (= x (inv@82@01 x)))
    (= (- $Perm.Write (pTaken@84@01 x)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@86@01 $PSF<bar>)
(declare-const s@87@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@87@01 $Snap)) (!
  (and
    (=>
      (Set_in s@87@01 ($PSF.domain_bar (as sm@86@01  $PSF<bar>)))
      (and
        (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref s@87@01)) (Set_singleton x@16@01))
        (img@83@01 ($SortWrappers.$SnapTo$Ref s@87@01))))
    (=>
      (and
        (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref s@87@01)) (Set_singleton x@16@01))
        (img@83@01 ($SortWrappers.$SnapTo$Ref s@87@01)))
      (Set_in s@87@01 ($PSF.domain_bar (as sm@86@01  $PSF<bar>)))))
  :pattern ((Set_in s@87@01 ($PSF.domain_bar (as sm@86@01  $PSF<bar>))))
  :qid |qp.psmDomDef27|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref s@87@01)) (Set_singleton x@16@01))
        (img@83@01 ($SortWrappers.$SnapTo$Ref s@87@01)))
      (= ($SortWrappers.$SnapTo$Ref s@87@01) x@16@01))
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@86@01  $PSF<bar>) s@87@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@87@01))))
  :pattern (($PSF.lookup_bar (as sm@86@01  $PSF<bar>) s@87@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@87@01))
  :qid |qp.psmValDef25|)))
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref s@87@01)) (Set_singleton x@16@01))
        (img@83@01 ($SortWrappers.$SnapTo$Ref s@87@01)))
      (= ($SortWrappers.$SnapTo$Ref s@87@01) z@17@01))
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@86@01  $PSF<bar>) s@87@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@87@01))))
  :pattern (($PSF.lookup_bar (as sm@86@01  $PSF<bar>) s@87@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@87@01))
  :qid |qp.psmValDef26|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@86@01  $PSF<bar>)) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@81@01 $Ref)) (!
  (=>
    (Set_in w@81@01 (Set_singleton x@16@01))
    (and (= (inv@82@01 w@81@01) w@81@01) (img@83@01 w@81@01)))
  :pattern ((Set_in w@81@01 (Set_singleton x@16@01)))
  :pattern ((inv@82@01 w@81@01))
  :pattern ((img@83@01 w@81@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@83@01 x) (Set_in (inv@82@01 x) (Set_singleton x@16@01)))
    (= (inv@82@01 x) x))
  :pattern ((inv@82@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@87@01 $Snap)) (!
  (and
    (=>
      (Set_in s@87@01 ($PSF.domain_bar (as sm@86@01  $PSF<bar>)))
      (and
        (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref s@87@01)) (Set_singleton x@16@01))
        (img@83@01 ($SortWrappers.$SnapTo$Ref s@87@01))))
    (=>
      (and
        (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref s@87@01)) (Set_singleton x@16@01))
        (img@83@01 ($SortWrappers.$SnapTo$Ref s@87@01)))
      (Set_in s@87@01 ($PSF.domain_bar (as sm@86@01  $PSF<bar>)))))
  :pattern ((Set_in s@87@01 ($PSF.domain_bar (as sm@86@01  $PSF<bar>))))
  :qid |qp.psmDomDef27|)))
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref s@87@01)) (Set_singleton x@16@01))
        (img@83@01 ($SortWrappers.$SnapTo$Ref s@87@01)))
      (= ($SortWrappers.$SnapTo$Ref s@87@01) x@16@01))
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@86@01  $PSF<bar>) s@87@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@87@01))))
  :pattern (($PSF.lookup_bar (as sm@86@01  $PSF<bar>) s@87@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@87@01))
  :qid |qp.psmValDef25|)))
(assert (forall ((s@87@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@82@01 ($SortWrappers.$SnapTo$Ref s@87@01)) (Set_singleton x@16@01))
        (img@83@01 ($SortWrappers.$SnapTo$Ref s@87@01)))
      (= ($SortWrappers.$SnapTo$Ref s@87@01) z@17@01))
    (and
      (not (= s@87@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@86@01  $PSF<bar>) s@87@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@87@01))))
  :pattern (($PSF.lookup_bar (as sm@86@01  $PSF<bar>) s@87@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@87@01))
  :qid |qp.psmValDef26|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@86@01  $PSF<bar>)) x@16@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@86@01  $PSF<bar>)) x@16@01) 4)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@17@01 x@16@01)))
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
    ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))
    ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))))))
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
    ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))
    ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] get(x) == 4
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@88@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@88@01 (Set_singleton x@16@01)))
(pop) ; 4
(declare-fun inv@89@01 ($Ref) $Ref)
(declare-fun img@90@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@88@01 $Ref) (w2@88@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@88@01 (Set_singleton x@16@01))
      (Set_in w2@88@01 (Set_singleton x@16@01))
      (= w1@88@01 w2@88@01))
    (= w1@88@01 w2@88@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@88@01 $Ref)) (!
  (=>
    (Set_in w@88@01 (Set_singleton x@16@01))
    (and (= (inv@89@01 w@88@01) w@88@01) (img@90@01 w@88@01)))
  :pattern ((Set_in w@88@01 (Set_singleton x@16@01)))
  :pattern ((inv@89@01 w@88@01))
  :pattern ((img@90@01 w@88@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@90@01 x) (Set_in (inv@89@01 x) (Set_singleton x@16@01)))
    (= (inv@89@01 x) x))
  :pattern ((inv@89@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@91@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@89@01 x) (Set_singleton x@16@01))
      (img@90@01 x)
      (= x (inv@89@01 x)))
    ($Perm.min (ite (= x z@17@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@92@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@89@01 x) (Set_singleton x@16@01))
      (img@90@01 x)
      (= x (inv@89@01 x)))
    ($Perm.min
      (ite (= x x@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@91@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@91@01 z@17@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@91@01 x) $Perm.No)
  
  :qid |quant-u-71|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@89@01 x) (Set_singleton x@16@01))
      (img@90@01 x)
      (= x (inv@89@01 x)))
    (= (- $Perm.Write (pTaken@91@01 x)) $Perm.No))
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@92@01 x@16@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@89@01 x) (Set_singleton x@16@01))
      (img@90@01 x)
      (= x (inv@89@01 x)))
    (= (- (- $Perm.Write (pTaken@91@01 x)) (pTaken@92@01 x)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@93@01 $PSF<bar>)
(declare-const s@94@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@94@01 $Snap)) (!
  (and
    (=>
      (Set_in s@94@01 ($PSF.domain_bar (as sm@93@01  $PSF<bar>)))
      (and
        (Set_in (inv@89@01 ($SortWrappers.$SnapTo$Ref s@94@01)) (Set_singleton x@16@01))
        (img@90@01 ($SortWrappers.$SnapTo$Ref s@94@01))))
    (=>
      (and
        (Set_in (inv@89@01 ($SortWrappers.$SnapTo$Ref s@94@01)) (Set_singleton x@16@01))
        (img@90@01 ($SortWrappers.$SnapTo$Ref s@94@01)))
      (Set_in s@94@01 ($PSF.domain_bar (as sm@93@01  $PSF<bar>)))))
  :pattern ((Set_in s@94@01 ($PSF.domain_bar (as sm@93@01  $PSF<bar>))))
  :qid |qp.psmDomDef30|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@94@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@01 ($SortWrappers.$SnapTo$Ref s@94@01)) (Set_singleton x@16@01))
        (img@90@01 ($SortWrappers.$SnapTo$Ref s@94@01)))
      (= ($SortWrappers.$SnapTo$Ref s@94@01) z@17@01))
    (and
      (not (= s@94@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@93@01  $PSF<bar>) s@94@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@94@01))))
  :pattern (($PSF.lookup_bar (as sm@93@01  $PSF<bar>) s@94@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@94@01))
  :qid |qp.psmValDef28|)))
(assert (forall ((s@94@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@01 ($SortWrappers.$SnapTo$Ref s@94@01)) (Set_singleton x@16@01))
        (img@90@01 ($SortWrappers.$SnapTo$Ref s@94@01)))
      (= ($SortWrappers.$SnapTo$Ref s@94@01) x@16@01))
    (and
      (not (= s@94@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@93@01  $PSF<bar>) s@94@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@94@01))))
  :pattern (($PSF.lookup_bar (as sm@93@01  $PSF<bar>) s@94@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@94@01))
  :qid |qp.psmValDef29|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@93@01  $PSF<bar>)) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@88@01 $Ref)) (!
  (=>
    (Set_in w@88@01 (Set_singleton x@16@01))
    (and (= (inv@89@01 w@88@01) w@88@01) (img@90@01 w@88@01)))
  :pattern ((Set_in w@88@01 (Set_singleton x@16@01)))
  :pattern ((inv@89@01 w@88@01))
  :pattern ((img@90@01 w@88@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@90@01 x) (Set_in (inv@89@01 x) (Set_singleton x@16@01)))
    (= (inv@89@01 x) x))
  :pattern ((inv@89@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@94@01 $Snap)) (!
  (and
    (=>
      (Set_in s@94@01 ($PSF.domain_bar (as sm@93@01  $PSF<bar>)))
      (and
        (Set_in (inv@89@01 ($SortWrappers.$SnapTo$Ref s@94@01)) (Set_singleton x@16@01))
        (img@90@01 ($SortWrappers.$SnapTo$Ref s@94@01))))
    (=>
      (and
        (Set_in (inv@89@01 ($SortWrappers.$SnapTo$Ref s@94@01)) (Set_singleton x@16@01))
        (img@90@01 ($SortWrappers.$SnapTo$Ref s@94@01)))
      (Set_in s@94@01 ($PSF.domain_bar (as sm@93@01  $PSF<bar>)))))
  :pattern ((Set_in s@94@01 ($PSF.domain_bar (as sm@93@01  $PSF<bar>))))
  :qid |qp.psmDomDef30|)))
(assert (forall ((s@94@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@01 ($SortWrappers.$SnapTo$Ref s@94@01)) (Set_singleton x@16@01))
        (img@90@01 ($SortWrappers.$SnapTo$Ref s@94@01)))
      (= ($SortWrappers.$SnapTo$Ref s@94@01) z@17@01))
    (and
      (not (= s@94@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@93@01  $PSF<bar>) s@94@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@94@01))))
  :pattern (($PSF.lookup_bar (as sm@93@01  $PSF<bar>) s@94@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@94@01))
  :qid |qp.psmValDef28|)))
(assert (forall ((s@94@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@89@01 ($SortWrappers.$SnapTo$Ref s@94@01)) (Set_singleton x@16@01))
        (img@90@01 ($SortWrappers.$SnapTo$Ref s@94@01)))
      (= ($SortWrappers.$SnapTo$Ref s@94@01) x@16@01))
    (and
      (not (= s@94@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@93@01  $PSF<bar>) s@94@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@94@01))))
  :pattern (($PSF.lookup_bar (as sm@93@01  $PSF<bar>) s@94@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@94@01))
  :qid |qp.psmValDef29|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@93@01  $PSF<bar>)) x@16@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@93@01  $PSF<bar>)) x@16@01) 4)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@17@01 x@16@01)))
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
    ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))
    ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))))))
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
    ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap x@16@01))
    ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) ($SortWrappers.$RefTo$Snap z@17@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] get(x) == 4
; [eval] get(x)
(set-option :timeout 0)
(push) ; 3
(declare-const w@95@01 $Ref)
(push) ; 4
; [eval] (w in Set(x))
; [eval] Set(x)
(assert (Set_in w@95@01 (Set_singleton x@16@01)))
(pop) ; 4
(declare-fun inv@96@01 ($Ref) $Ref)
(declare-fun img@97@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((w1@95@01 $Ref) (w2@95@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@95@01 (Set_singleton x@16@01))
      (Set_in w2@95@01 (Set_singleton x@16@01))
      (= w1@95@01 w2@95@01))
    (= w1@95@01 w2@95@01))
  
  :qid |bar-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@95@01 $Ref)) (!
  (=>
    (Set_in w@95@01 (Set_singleton x@16@01))
    (and (= (inv@96@01 w@95@01) w@95@01) (img@97@01 w@95@01)))
  :pattern ((Set_in w@95@01 (Set_singleton x@16@01)))
  :pattern ((inv@96@01 w@95@01))
  :pattern ((img@97@01 w@95@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@97@01 x) (Set_in (inv@96@01 x) (Set_singleton x@16@01)))
    (= (inv@96@01 x) x))
  :pattern ((inv@96@01 x))
  :qid |bar-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@98@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@96@01 x) (Set_singleton x@16@01))
      (img@97@01 x)
      (= x (inv@96@01 x)))
    ($Perm.min (ite (= x x@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@99@01 ((x $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@96@01 x) (Set_singleton x@16@01))
      (img@97@01 x)
      (= x (inv@96@01 x)))
    ($Perm.min
      (ite (= x z@17@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@98@01 x)))
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
(assert (not (= (- $Perm.Write (pTaken@98@01 x@16@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and
      (Set_in (inv@96@01 x) (Set_singleton x@16@01))
      (img@97@01 x)
      (= x (inv@96@01 x)))
    (= (- $Perm.Write (pTaken@98@01 x)) $Perm.No))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@100@01 $PSF<bar>)
(declare-const s@101@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@101@01 $Snap)) (!
  (and
    (=>
      (Set_in s@101@01 ($PSF.domain_bar (as sm@100@01  $PSF<bar>)))
      (and
        (Set_in (inv@96@01 ($SortWrappers.$SnapTo$Ref s@101@01)) (Set_singleton x@16@01))
        (img@97@01 ($SortWrappers.$SnapTo$Ref s@101@01))))
    (=>
      (and
        (Set_in (inv@96@01 ($SortWrappers.$SnapTo$Ref s@101@01)) (Set_singleton x@16@01))
        (img@97@01 ($SortWrappers.$SnapTo$Ref s@101@01)))
      (Set_in s@101@01 ($PSF.domain_bar (as sm@100@01  $PSF<bar>)))))
  :pattern ((Set_in s@101@01 ($PSF.domain_bar (as sm@100@01  $PSF<bar>))))
  :qid |qp.psmDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@101@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@96@01 ($SortWrappers.$SnapTo$Ref s@101@01)) (Set_singleton x@16@01))
        (img@97@01 ($SortWrappers.$SnapTo$Ref s@101@01)))
      (= ($SortWrappers.$SnapTo$Ref s@101@01) x@16@01))
    (and
      (not (= s@101@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@100@01  $PSF<bar>) s@101@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@101@01))))
  :pattern (($PSF.lookup_bar (as sm@100@01  $PSF<bar>) s@101@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@101@01))
  :qid |qp.psmValDef31|)))
(assert (forall ((s@101@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@96@01 ($SortWrappers.$SnapTo$Ref s@101@01)) (Set_singleton x@16@01))
        (img@97@01 ($SortWrappers.$SnapTo$Ref s@101@01)))
      (= ($SortWrappers.$SnapTo$Ref s@101@01) z@17@01))
    (and
      (not (= s@101@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@100@01  $PSF<bar>) s@101@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@101@01))))
  :pattern (($PSF.lookup_bar (as sm@100@01  $PSF<bar>) s@101@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@101@01))
  :qid |qp.psmValDef32|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@100@01  $PSF<bar>)) x@16@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((w@95@01 $Ref)) (!
  (=>
    (Set_in w@95@01 (Set_singleton x@16@01))
    (and (= (inv@96@01 w@95@01) w@95@01) (img@97@01 w@95@01)))
  :pattern ((Set_in w@95@01 (Set_singleton x@16@01)))
  :pattern ((inv@96@01 w@95@01))
  :pattern ((img@97@01 w@95@01))
  :qid |bar-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@97@01 x) (Set_in (inv@96@01 x) (Set_singleton x@16@01)))
    (= (inv@96@01 x) x))
  :pattern ((inv@96@01 x))
  :qid |bar-fctOfInv|)))
(assert (forall ((s@101@01 $Snap)) (!
  (and
    (=>
      (Set_in s@101@01 ($PSF.domain_bar (as sm@100@01  $PSF<bar>)))
      (and
        (Set_in (inv@96@01 ($SortWrappers.$SnapTo$Ref s@101@01)) (Set_singleton x@16@01))
        (img@97@01 ($SortWrappers.$SnapTo$Ref s@101@01))))
    (=>
      (and
        (Set_in (inv@96@01 ($SortWrappers.$SnapTo$Ref s@101@01)) (Set_singleton x@16@01))
        (img@97@01 ($SortWrappers.$SnapTo$Ref s@101@01)))
      (Set_in s@101@01 ($PSF.domain_bar (as sm@100@01  $PSF<bar>)))))
  :pattern ((Set_in s@101@01 ($PSF.domain_bar (as sm@100@01  $PSF<bar>))))
  :qid |qp.psmDomDef33|)))
(assert (forall ((s@101@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@96@01 ($SortWrappers.$SnapTo$Ref s@101@01)) (Set_singleton x@16@01))
        (img@97@01 ($SortWrappers.$SnapTo$Ref s@101@01)))
      (= ($SortWrappers.$SnapTo$Ref s@101@01) x@16@01))
    (and
      (not (= s@101@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@100@01  $PSF<bar>) s@101@01)
        ($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@101@01))))
  :pattern (($PSF.lookup_bar (as sm@100@01  $PSF<bar>) s@101@01))
  :pattern (($PSF.lookup_bar (as sm@66@01  $PSF<bar>) s@101@01))
  :qid |qp.psmValDef31|)))
(assert (forall ((s@101@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@96@01 ($SortWrappers.$SnapTo$Ref s@101@01)) (Set_singleton x@16@01))
        (img@97@01 ($SortWrappers.$SnapTo$Ref s@101@01)))
      (= ($SortWrappers.$SnapTo$Ref s@101@01) z@17@01))
    (and
      (not (= s@101@01 $Snap.unit))
      (=
        ($PSF.lookup_bar (as sm@100@01  $PSF<bar>) s@101@01)
        ($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@101@01))))
  :pattern (($PSF.lookup_bar (as sm@100@01  $PSF<bar>) s@101@01))
  :pattern (($PSF.lookup_bar (as sm@46@01  $PSF<bar>) s@101@01))
  :qid |qp.psmValDef32|)))
(assert (get%precondition ($SortWrappers.$PSF<bar>To$Snap (as sm@100@01  $PSF<bar>)) x@16@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (= (get ($SortWrappers.$PSF<bar>To$Snap (as sm@100@01  $PSF<bar>)) x@16@01) 4)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
