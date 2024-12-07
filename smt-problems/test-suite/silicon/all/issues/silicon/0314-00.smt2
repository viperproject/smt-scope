(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0314.vpr
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
(declare-sort $PSF<TK> 0)
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
(declare-fun $SortWrappers.$PSF<TK>To$Snap ($PSF<TK>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<TK> ($Snap) $PSF<TK>)
(assert (forall ((x $PSF<TK>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<TK>($SortWrappers.$PSF<TK>To$Snap x)))
    :pattern (($SortWrappers.$PSF<TK>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<TK>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<TK>To$Snap($SortWrappers.$SnapTo$PSF<TK> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<TK> x))
    :qid |$Snap.$PSF<TK>To$SnapTo$PSF<TK>|
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
; /predicate_snap_functions_declarations.smt2 [TK: Snap]
(declare-fun $PSF.domain_TK ($PSF<TK>) Set<$Snap>)
(declare-fun $PSF.lookup_TK ($PSF<TK> $Snap) $Snap)
(declare-fun $PSF.after_TK ($PSF<TK> $PSF<TK>) Bool)
(declare-fun $PSF.loc_TK ($Snap $Snap) Bool)
(declare-fun $PSF.perm_TK ($PPM $Snap) $Perm)
(declare-const $psfTOP_TK $PSF<TK>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun TK%trigger ($Snap Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [TK: Snap]
(assert (forall ((vs $PSF<TK>) (ws $PSF<TK>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_TK vs) ($PSF.domain_TK ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_TK vs))
            (= ($PSF.lookup_TK vs x) ($PSF.lookup_TK ws x)))
          :pattern (($PSF.lookup_TK vs x) ($PSF.lookup_TK ws x))
          :qid |qp.$PSF<TK>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<TK>To$Snap vs)
              ($SortWrappers.$PSF<TK>To$Snap ws)
              )
    :qid |qp.$PSF<TK>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_TK pm s))
    :pattern (($PSF.perm_TK pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_TK f s) true)
    :pattern (($PSF.loc_TK f s)))))
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
; ---------- test ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
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
; var n0: Int
(declare-const n0@2@01 Int)
; [exec]
; var S1: Set[Int]
(declare-const S1@3@01 Set<Int>)
; [exec]
; var rnd: Int
(declare-const rnd@4@01 Int)
; [exec]
; inhale acc(x.f, write) && x.f == n0
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (not (= x@1@01 $Ref.null)))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] x.f == n0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first $t@5@01)) n0@2@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(TK(n0), write)
(declare-const $t@6@01 $Snap)
(declare-const sm@7@01 $PSF<TK>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n0@2@01))
  $t@6@01))
(declare-const sm@8@01 $PSF<TK>)
(declare-const s@9@01 $Snap)
; Definitional axioms for snapshot map values
(assert ($PSF.loc_TK ($PSF.lookup_TK (as sm@8@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n0@2@01)) ($SortWrappers.IntTo$Snap n0@2@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; exhale acc(x.f, write)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@10@01 Int)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall m: Int ::
;     { (m in S1) }
;     (m in S1) ==
;     (n0 <= m &&
;     (m == n0 ||
;     (forall k: Int :: { TK(k) } n0 <= k && k < m ==> perm(TK(k)) == none))))
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] (forall m: Int :: { (m in S1) } (m in S1) == (n0 <= m && (m == n0 || (forall k: Int :: { TK(k) } n0 <= k && k < m ==> perm(TK(k)) == none))))
(declare-const m@12@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (m in S1) == (n0 <= m && (m == n0 || (forall k: Int :: { TK(k) } n0 <= k && k < m ==> perm(TK(k)) == none)))
; [eval] (m in S1)
; [eval] n0 <= m && (m == n0 || (forall k: Int :: { TK(k) } n0 <= k && k < m ==> perm(TK(k)) == none))
; [eval] n0 <= m
(push) ; 4
; [then-branch: 0 | !(n0@2@01 <= m@12@01) | live]
; [else-branch: 0 | n0@2@01 <= m@12@01 | live]
(push) ; 5
; [then-branch: 0 | !(n0@2@01 <= m@12@01)]
(assert (not (<= n0@2@01 m@12@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | n0@2@01 <= m@12@01]
(assert (<= n0@2@01 m@12@01))
; [eval] m == n0 || (forall k: Int :: { TK(k) } n0 <= k && k < m ==> perm(TK(k)) == none)
; [eval] m == n0
(push) ; 6
; [then-branch: 1 | m@12@01 == n0@2@01 | live]
; [else-branch: 1 | m@12@01 != n0@2@01 | live]
(push) ; 7
; [then-branch: 1 | m@12@01 == n0@2@01]
(assert (= m@12@01 n0@2@01))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | m@12@01 != n0@2@01]
(assert (not (= m@12@01 n0@2@01)))
; [eval] (forall k: Int :: { TK(k) } n0 <= k && k < m ==> perm(TK(k)) == none)
(declare-const k@13@01 Int)
(push) ; 8
; [eval] n0 <= k && k < m ==> perm(TK(k)) == none
; [eval] n0 <= k && k < m
; [eval] n0 <= k
(push) ; 9
; [then-branch: 2 | !(n0@2@01 <= k@13@01) | live]
; [else-branch: 2 | n0@2@01 <= k@13@01 | live]
(push) ; 10
; [then-branch: 2 | !(n0@2@01 <= k@13@01)]
(assert (not (<= n0@2@01 k@13@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 2 | n0@2@01 <= k@13@01]
(assert (<= n0@2@01 k@13@01))
; [eval] k < m
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= n0@2@01 k@13@01) (not (<= n0@2@01 k@13@01))))
(push) ; 9
; [then-branch: 3 | n0@2@01 <= k@13@01 && k@13@01 < m@12@01 | live]
; [else-branch: 3 | !(n0@2@01 <= k@13@01 && k@13@01 < m@12@01) | live]
(push) ; 10
; [then-branch: 3 | n0@2@01 <= k@13@01 && k@13@01 < m@12@01]
(assert (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01)))
; [eval] perm(TK(k)) == none
; [eval] perm(TK(k))
(declare-const sm@14@01 $PSF<TK>)
(declare-const s@15@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapToInt s@15@01) n0@2@01)
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01)
        ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))))
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :pattern (($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01) s@15@01)
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :qid |qp.psmResTrgDef2|)))
(declare-const pm@16@01 $PPM)
(assert (forall ((n Int)) (!
  (=
    ($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n))
    (ite (= n n0@2@01) $Perm.Write $Perm.No))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((n Int)) (!
  (and
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n))
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n)))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resTrgDef4|)))
(assert ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | !(n0@2@01 <= k@13@01 && k@13@01 < m@12@01)]
(assert (not (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapToInt s@15@01) n0@2@01)
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01)
        ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))))
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :pattern (($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01) s@15@01)
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((n Int)) (!
  (=
    ($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n))
    (ite (= n n0@2@01) $Perm.Write $Perm.No))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((n Int)) (!
  (and
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n))
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n)))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resTrgDef4|)))
(assert (=>
  (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))
  (and
    (<= n0@2@01 k@13@01)
    (< k@13@01 m@12@01)
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01)))))
; Joined path conditions
(assert (or
  (not (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01)))
  (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))))
; Definitional axioms for snapshot map values
(pop) ; 8
; Nested auxiliary terms: globals (aux)
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapToInt s@15@01) n0@2@01)
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01)
        ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))))
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :pattern (($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01) s@15@01)
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((n Int)) (!
  (=
    ($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n))
    (ite (= n n0@2@01) $Perm.Write $Perm.No))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((n Int)) (!
  (and
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n))
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n)))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resTrgDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@13@01 Int)) (!
  (and
    (or (<= n0@2@01 k@13@01) (not (<= n0@2@01 k@13@01)))
    (=>
      (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))
      (and
        (<= n0@2@01 k@13@01)
        (< k@13@01 m@12@01)
        ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01))))
    (or
      (not (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01)))
      (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))))
  :pattern (($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314.vpr@21@22@21@87-aux|)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapToInt s@15@01) n0@2@01)
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01)
        ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))))
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :pattern (($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01) s@15@01)
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((n Int)) (!
  (=
    ($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n))
    (ite (= n n0@2@01) $Perm.Write $Perm.No))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((n Int)) (!
  (and
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n))
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n)))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resTrgDef4|)))
(assert (=>
  (not (= m@12@01 n0@2@01))
  (and
    (not (= m@12@01 n0@2@01))
    (forall ((k@13@01 Int)) (!
      (and
        (or (<= n0@2@01 k@13@01) (not (<= n0@2@01 k@13@01)))
        (=>
          (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))
          (and
            (<= n0@2@01 k@13@01)
            (< k@13@01 m@12@01)
            ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01))))
        (or
          (not (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01)))
          (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))))
      :pattern (($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01)))
      :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314.vpr@21@22@21@87-aux|)))))
(assert (or (not (= m@12@01 n0@2@01)) (= m@12@01 n0@2@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapToInt s@15@01) n0@2@01)
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01)
        ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))))
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :pattern (($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01) s@15@01)
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((n Int)) (!
  (=
    ($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n))
    (ite (= n n0@2@01) $Perm.Write $Perm.No))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((n Int)) (!
  (and
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n))
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n)))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resTrgDef4|)))
(assert (=>
  (<= n0@2@01 m@12@01)
  (and
    (<= n0@2@01 m@12@01)
    (=>
      (not (= m@12@01 n0@2@01))
      (and
        (not (= m@12@01 n0@2@01))
        (forall ((k@13@01 Int)) (!
          (and
            (or (<= n0@2@01 k@13@01) (not (<= n0@2@01 k@13@01)))
            (=>
              (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))
              (and
                (<= n0@2@01 k@13@01)
                (< k@13@01 m@12@01)
                ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01))))
            (or
              (not (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01)))
              (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))))
          :pattern (($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314.vpr@21@22@21@87-aux|))))
    (or (not (= m@12@01 n0@2@01)) (= m@12@01 n0@2@01)))))
(assert (or (<= n0@2@01 m@12@01) (not (<= n0@2@01 m@12@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapToInt s@15@01) n0@2@01)
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01)
        ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))))
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :pattern (($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) s@15@01) s@15@01)
  :pattern (($PSF.lookup_TK (as sm@14@01  $PSF<TK>) s@15@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((n Int)) (!
  (=
    ($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n))
    (ite (= n n0@2@01) $Perm.Write $Perm.No))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((n Int)) (!
  (and
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n))
    ($PSF.loc_TK ($PSF.lookup_TK (as sm@7@01  $PSF<TK>) ($SortWrappers.IntTo$Snap n)) ($SortWrappers.IntTo$Snap n)))
  :pattern (($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap n)))
  :qid |qp.resTrgDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((m@12@01 Int)) (!
  (and
    (=>
      (<= n0@2@01 m@12@01)
      (and
        (<= n0@2@01 m@12@01)
        (=>
          (not (= m@12@01 n0@2@01))
          (and
            (not (= m@12@01 n0@2@01))
            (forall ((k@13@01 Int)) (!
              (and
                (or (<= n0@2@01 k@13@01) (not (<= n0@2@01 k@13@01)))
                (=>
                  (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))
                  (and
                    (<= n0@2@01 k@13@01)
                    (< k@13@01 m@12@01)
                    ($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01))))
                (or
                  (not (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01)))
                  (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))))
              :pattern (($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01)))
              :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314.vpr@21@22@21@87-aux|))))
        (or (not (= m@12@01 n0@2@01)) (= m@12@01 n0@2@01))))
    (or (<= n0@2@01 m@12@01) (not (<= n0@2@01 m@12@01))))
  :pattern ((Set_in m@12@01 S1@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314.vpr@18@5@21@89-aux|)))
(assert (forall ((m@12@01 Int)) (!
  (=
    (Set_in m@12@01 S1@3@01)
    (and
      (<= n0@2@01 m@12@01)
      (or
        (= m@12@01 n0@2@01)
        (forall ((k@13@01 Int)) (!
          (=>
            (and (<= n0@2@01 k@13@01) (< k@13@01 m@12@01))
            (=
              ($PSF.perm_TK (as pm@16@01  $PPM) ($SortWrappers.IntTo$Snap k@13@01))
              $Perm.No))
          :pattern (($PSF.loc_TK ($PSF.lookup_TK (as sm@14@01  $PSF<TK>) ($SortWrappers.IntTo$Snap k@13@01)) ($SortWrappers.IntTo$Snap k@13@01)))
          :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314.vpr@21@22@21@87|)))))
  :pattern ((Set_in m@12@01 S1@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0314.vpr@18@5@21@89|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] rnd == 0
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= rnd@4@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= rnd@4@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | rnd@4@01 == 0 | live]
; [else-branch: 4 | rnd@4@01 != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | rnd@4@01 == 0]
(assert (= rnd@4@01 0))
; [exec]
; inhale (x.f in S1)
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] (x.f in S1)
(assert (Set_in $t@10@01 S1@3@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert x.f == n0
; [eval] x.f == n0
(set-option :timeout 0)
(push) ; 4
(assert (not (= $t@10@01 n0@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= $t@10@01 n0@2@01))
(pop) ; 3
(push) ; 3
; [else-branch: 4 | rnd@4@01 != 0]
(assert (not (= rnd@4@01 0)))
(pop) ; 3
; [eval] !(rnd == 0)
; [eval] rnd == 0
(push) ; 3
(set-option :timeout 10)
(assert (not (= rnd@4@01 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= rnd@4@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | rnd@4@01 != 0 | live]
; [else-branch: 5 | rnd@4@01 == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | rnd@4@01 != 0]
(assert (not (= rnd@4@01 0)))
; [eval] rnd == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= rnd@4@01 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= rnd@4@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | rnd@4@01 == 1 | live]
; [else-branch: 6 | rnd@4@01 != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | rnd@4@01 == 1]
(assert (= rnd@4@01 1))
; [exec]
; var n1: Int
(declare-const n1@18@01 Int)
; [exec]
; inhale (n1 in S1)
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 $Snap.unit))
; [eval] (n1 in S1)
(assert (Set_in n1@18@01 S1@3@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert n1 == n0
; [eval] n1 == n0
(set-option :timeout 0)
(push) ; 5
(assert (not (= n1@18@01 n0@2@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (= n1@18@01 n0@2@01))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | rnd@4@01 != 1]
(assert (not (= rnd@4@01 1)))
(pop) ; 4
; [eval] !(rnd == 1)
; [eval] rnd == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (= rnd@4@01 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= rnd@4@01 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | rnd@4@01 != 1 | live]
; [else-branch: 7 | rnd@4@01 == 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 7 | rnd@4@01 != 1]
(assert (not (= rnd@4@01 1)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | rnd@4@01 == 1]
(assert (= rnd@4@01 1))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 5 | rnd@4@01 == 0]
(assert (= rnd@4@01 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
