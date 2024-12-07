(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:34:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/wands/new_syntax/QPPredicates.vpr
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
(declare-sort $PSF<Cell> 0)
(declare-sort $PSF<Pair> 0)
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
(declare-fun $SortWrappers.$PSF<Cell>To$Snap ($PSF<Cell>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<Cell> ($Snap) $PSF<Cell>)
(assert (forall ((x $PSF<Cell>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<Cell>($SortWrappers.$PSF<Cell>To$Snap x)))
    :pattern (($SortWrappers.$PSF<Cell>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<Cell>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<Cell>To$Snap($SortWrappers.$SnapTo$PSF<Cell> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<Cell> x))
    :qid |$Snap.$PSF<Cell>To$SnapTo$PSF<Cell>|
    )))
(declare-fun $SortWrappers.$PSF<Pair>To$Snap ($PSF<Pair>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<Pair> ($Snap) $PSF<Pair>)
(assert (forall ((x $PSF<Pair>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<Pair>($SortWrappers.$PSF<Pair>To$Snap x)))
    :pattern (($SortWrappers.$PSF<Pair>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<Pair>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<Pair>To$Snap($SortWrappers.$SnapTo$PSF<Pair> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<Pair> x))
    :qid |$Snap.$PSF<Pair>To$SnapTo$PSF<Pair>|
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
; /predicate_snap_functions_declarations.smt2 [Cell: Int]
(declare-fun $PSF.domain_Cell ($PSF<Cell>) Set<$Snap>)
(declare-fun $PSF.lookup_Cell ($PSF<Cell> $Snap) Int)
(declare-fun $PSF.after_Cell ($PSF<Cell> $PSF<Cell>) Bool)
(declare-fun $PSF.loc_Cell (Int $Snap) Bool)
(declare-fun $PSF.perm_Cell ($PPM $Snap) $Perm)
(declare-const $psfTOP_Cell $PSF<Cell>)
; /predicate_snap_functions_declarations.smt2 [Pair: Snap]
(declare-fun $PSF.domain_Pair ($PSF<Pair>) Set<$Snap>)
(declare-fun $PSF.lookup_Pair ($PSF<Pair> $Snap) $Snap)
(declare-fun $PSF.after_Pair ($PSF<Pair> $PSF<Pair>) Bool)
(declare-fun $PSF.loc_Pair ($Snap $Snap) Bool)
(declare-fun $PSF.perm_Pair ($PPM $Snap) $Perm)
(declare-const $psfTOP_Pair $PSF<Pair>)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
(declare-fun get ($Snap $Ref) Int)
(declare-fun get%limited ($Snap $Ref) Int)
(declare-fun get%stateless ($Ref) Bool)
(declare-fun get%precondition ($Snap $Ref) Bool)
(declare-fun sum ($Snap $Ref $Ref) Int)
(declare-fun sum%limited ($Snap $Ref $Ref) Int)
(declare-fun sum%stateless ($Ref $Ref) Bool)
(declare-fun sum%precondition ($Snap $Ref $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Cell%trigger ($Snap $Ref) Bool)
(declare-fun Pair%trigger ($Snap $Ref $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [Cell: Int]
(assert (forall ((vs $PSF<Cell>) (ws $PSF<Cell>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_Cell vs) ($PSF.domain_Cell ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_Cell vs))
            (= ($PSF.lookup_Cell vs x) ($PSF.lookup_Cell ws x)))
          :pattern (($PSF.lookup_Cell vs x) ($PSF.lookup_Cell ws x))
          :qid |qp.$PSF<Cell>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<Cell>To$Snap vs)
              ($SortWrappers.$PSF<Cell>To$Snap ws)
              )
    :qid |qp.$PSF<Cell>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_Cell pm s))
    :pattern (($PSF.perm_Cell pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_Cell f s) true)
    :pattern (($PSF.loc_Cell f s)))))
; /predicate_snap_functions_axioms.smt2 [Pair: Snap]
(assert (forall ((vs $PSF<Pair>) (ws $PSF<Pair>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_Pair vs) ($PSF.domain_Pair ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_Pair vs))
            (= ($PSF.lookup_Pair vs x) ($PSF.lookup_Pair ws x)))
          :pattern (($PSF.lookup_Pair vs x) ($PSF.lookup_Pair ws x))
          :qid |qp.$PSF<Pair>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<Pair>To$Snap vs)
              ($SortWrappers.$PSF<Pair>To$Snap ws)
              )
    :qid |qp.$PSF<Pair>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_Pair pm s))
    :pattern (($PSF.perm_Pair pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_Pair f s) true)
    :pattern (($PSF.loc_Pair f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (= (get%limited s@$ x@0@00) (get s@$ x@0@00))
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (get%stateless x@0@00)
  :pattern ((get%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  (=>
    (get%precondition s@$ x@0@00)
    (= (get s@$ x@0@00) ($SortWrappers.$SnapToInt s@$)))
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@0@00 $Ref)) (!
  true
  :pattern ((get s@$ x@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (y@3@00 $Ref)) (!
  (= (sum%limited s@$ x@2@00 y@3@00) (sum s@$ x@2@00 y@3@00))
  :pattern ((sum s@$ x@2@00 y@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (y@3@00 $Ref)) (!
  (sum%stateless x@2@00 y@3@00)
  :pattern ((sum%limited s@$ x@2@00 y@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (y@3@00 $Ref)) (!
  (=>
    (sum%precondition s@$ x@2@00 y@3@00)
    (=
      (sum s@$ x@2@00 y@3@00)
      (+
        ($SortWrappers.$SnapToInt ($Snap.first s@$))
        ($SortWrappers.$SnapToInt ($Snap.second s@$)))))
  :pattern ((sum s@$ x@2@00 y@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@2@00 $Ref) (y@3@00 $Ref)) (!
  true
  :pattern ((sum s@$ x@2@00 y@3@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test0 ----------
(declare-const x@0@01 $Ref)
(declare-const x@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(declare-const y@3@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@3@01 $Ref)) (!
  (and (= (inv@4@01 y@3@01) y@3@01) (img@5@01 y@3@01))
  :pattern ((inv@4@01 y@3@01))
  :pattern ((img@5@01 y@3@01))
  :qid |quant-u-9|)))
(assert (forall ((x $Ref)) (!
  (=> (img@5@01 x) (= (inv@4@01 x) x))
  :pattern ((inv@4@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@6@01 ((x $Ref)) $Perm
  (ite
    (= x x@1@01)
    ($Perm.min
      (ite (img@5@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
  (= (- (ite (img@5@01 x) $Perm.Write $Perm.No) (pTaken@6@01 x)) $Perm.No)
  
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
  (= (pTaken@6@01 x) $Perm.No)
  
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
  (=> (= x x@1@01) (= (- (/ (to_real 1) (to_real 2)) (pTaken@6@01 x)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@7@01 $PSF<Cell>)
(declare-const s@8@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@5@01 x@1@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@1@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@7@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@2@01)) ($SortWrappers.$RefTo$Snap x@1@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@7@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))) x@1@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@5@01 x@1@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@1@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@7@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@2@01)) ($SortWrappers.$RefTo$Snap x@1@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@7@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))) x@1@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@7@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))) x@1@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* true {
;   assert acc(Cell(x), write) && get(x) == 0
; }
(push) ; 3
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [exec]
; assert acc(Cell(x), write) && get(x) == 0
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@1@01) false)
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@10@01 $PSF<Cell>)
(declare-const s@11@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@1@01) false)
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@12@01 $PSF<Cell>)
(declare-const s@13@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (= (as sm@10@01  $PSF<Cell>) (as sm@12@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@14@01 ((x $Ref)) $Perm
  (ite
    (= x x@1@01)
    ($Perm.min (ite (img@5@01 x) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@5@01 x) $Perm.Write $Perm.No) (pTaken@14@01 x)) $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@14@01 x) $Perm.No)
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@1@01) (= (- $Perm.Write (pTaken@14@01 x)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@15@01 $PSF<Cell>)
(declare-const s@16@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@5@01 x@1@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@1@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@15@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@2@01)) ($SortWrappers.$RefTo$Snap x@1@01))))))
(assert (= (as sm@10@01  $PSF<Cell>) (as sm@15@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@17@01 $PSF<Cell>)
(declare-const $t@18@01 $PSF<Cell>)
(assert (forall ((x $Ref)) (!
  (=>
    (= x x@1@01)
    (=
      ($PSF.lookup_Cell $t@18@01 ($SortWrappers.$RefTo$Snap x))
      ($PSF.lookup_Cell (as sm@15@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x))))
  :pattern (($PSF.lookup_Cell $t@17@01 ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@15@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@18@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-21|)))
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((x $Ref)) $Perm
  (ite
    (= x x@1@01)
    ($Perm.min
      (ite (= x x@1@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@19@01 x@1@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@19@01 x) $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@1@01) (= (- (/ (to_real 1) (to_real 2)) (pTaken@19@01 x)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $PSF<Cell>)
(declare-const s@21@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@1@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@20@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))
    ($PSF.lookup_Cell $t@18@01 ($SortWrappers.$RefTo$Snap x@1@01)))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@20@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))) x@1@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@1@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@20@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))
    ($PSF.lookup_Cell $t@18@01 ($SortWrappers.$RefTo$Snap x@1@01)))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@20@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))) x@1@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@20@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))) x@1@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@20@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))) x@1@01)
  0))
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@22@01 $MWSF)
(assert (forall (($t@9@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@9@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@22@01 $t@9@01))
  :qid |quant-u-26|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@9@01 $Snap)) (!
  (= (MWSF_apply mwsf@22@01 $t@9@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@22@01 $t@9@01))
  :qid |quant-u-27|)))
(assert (and
  (= (as sm@10@01  $PSF<Cell>) (as sm@12@01  $PSF<Cell>))
  (=>
    (img@5@01 x@1@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@1@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@15@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@1@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@2@01)) ($SortWrappers.$RefTo$Snap x@1@01)))))
  (= (as sm@10@01  $PSF<Cell>) (as sm@15@01  $PSF<Cell>))))
; [exec]
; assert (forall y: Ref ::y != x ==> acc(Cell(y), write))
(declare-const y@23@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@23@01 x@1@01)))
(pop) ; 4
(declare-fun inv@24@01 ($Ref) $Ref)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@23@01 $Ref) (y2@23@01 $Ref)) (!
  (=>
    (and
      (not (= y1@23@01 x@1@01))
      (not (= y2@23@01 x@1@01))
      (= y1@23@01 y2@23@01))
    (= y1@23@01 y2@23@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@23@01 $Ref)) (!
  (=>
    (not (= y@23@01 x@1@01))
    (and (= (inv@24@01 y@23@01) y@23@01) (img@25@01 y@23@01)))
  :pattern ((inv@24@01 y@23@01))
  :pattern ((img@25@01 y@23@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@25@01 x) (not (= (inv@24@01 x) x@1@01))) (= (inv@24@01 x) x))
  :pattern ((inv@24@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((x $Ref)) $Perm
  (ite
    (and (not (= (inv@24@01 x) x@1@01)) (img@25@01 x) (= x (inv@24@01 x)))
    ($Perm.min
      (ite (img@5@01 x) (- $Perm.Write (pTaken@14@01 x)) $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@5@01 x) (- $Perm.Write (pTaken@14@01 x)) $Perm.No)
      (pTaken@26@01 x))
    $Perm.No)
  
  :qid |quant-u-30|))))
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
    (and (not (= (inv@24@01 x) x@1@01)) (img@25@01 x) (= x (inv@24@01 x)))
    (= (- $Perm.Write (pTaken@26@01 x)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@27@01 $PSF<Cell>)
(declare-const s@28@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@28@01 $Snap)) (!
  (=>
    (ite
      (img@5@01 ($SortWrappers.$SnapTo$Ref s@28@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@14@01 ($SortWrappers.$SnapTo$Ref s@28@01))))
      false)
    (and
      (not (= s@28@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@27@01  $PSF<Cell>) s@28@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@2@01)) s@28@01))))
  :pattern (($PSF.lookup_Cell (as sm@27@01  $PSF<Cell>) s@28@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@2@01)) s@28@01))
  :qid |qp.psmValDef3|)))
; [exec]
; assert (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const y@29@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@30@01 ($Ref) $Ref)
(declare-fun img@31@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@29@01 $Ref)) (!
  (and (= (inv@30@01 y@29@01) y@29@01) (img@31@01 y@29@01))
  :pattern ((inv@30@01 y@29@01))
  :pattern ((img@31@01 y@29@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@31@01 x) (= (inv@30@01 x) x))
  :pattern ((inv@30@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@32@01 ((x $Ref)) $Perm
  (ite
    (and (img@31@01 x) (= x (inv@30@01 x)))
    ($Perm.min
      (ite (img@5@01 x) (- $Perm.Write (pTaken@14@01 x)) $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@5@01 x) (- $Perm.Write (pTaken@14@01 x)) $Perm.No)
      (pTaken@32@01 x))
    $Perm.No)
  
  :qid |quant-u-34|))))
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
    (and (img@31@01 x) (= x (inv@30@01 x)))
    (= (- $Perm.Write (pTaken@32@01 x)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@31@01 x) (= x (inv@30@01 x)))
    (= (- $Perm.Write (pTaken@32@01 x)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const y@33@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@33@01 $Ref)) (!
  (and (= (inv@34@01 y@33@01) y@33@01) (img@35@01 y@33@01))
  :pattern ((inv@34@01 y@33@01))
  :pattern ((img@35@01 y@33@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@35@01 x) (= (inv@34@01 x) x))
  :pattern ((inv@34@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((x $Ref)) $Perm
  (ite
    (and (img@35@01 x) (= x (inv@34@01 x)))
    ($Perm.min
      (ite (img@5@01 x) (- $Perm.Write (pTaken@14@01 x)) $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@5@01 x) (- $Perm.Write (pTaken@14@01 x)) $Perm.No)
      (pTaken@36@01 x))
    $Perm.No)
  
  :qid |quant-u-38|))))
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
    (and (img@35@01 x) (= x (inv@34@01 x)))
    (= (- $Perm.Write (pTaken@36@01 x)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@35@01 x) (= x (inv@34@01 x)))
    (= (- $Perm.Write (pTaken@36@01 x)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test1 ----------
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
(declare-const y@37@01 $Ref)
; [exec]
; y := new()
(declare-const y@38@01 $Ref)
(assert (not (= y@38@01 $Ref.null)))
(assert (not (= y@38@01 y@37@01)))
; [exec]
; package true --* true {
;   inhale (forall x: Ref ::true ==> acc(Cell(x), write))
;   assert (forall x: Ref ::true ==> acc(Cell(x), write))
;   exhale acc(Cell(y), write)
;   assert (forall x: Ref ::x != y ==> acc(Cell(x), write))
;   assert (forall x: Ref ::x != y ==> acc(Cell(x), write))
;   assert (forall x: Ref ::true ==> acc(Cell(x), write))
; }
(push) ; 3
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 $Snap.unit))
; [exec]
; inhale (forall x: Ref ::true ==> acc(Cell(x), write))
(declare-const x@40@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-const $t@41@01 $PSF<Cell>)
(declare-fun inv@42@01 ($Ref) $Ref)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@40@01 $Ref)) (!
  (and (= (inv@42@01 x@40@01) x@40@01) (img@43@01 x@40@01))
  :pattern ((inv@42@01 x@40@01))
  :pattern ((img@43@01 x@40@01))
  :qid |quant-u-41|)))
(assert (forall ((x $Ref)) (!
  (=> (img@43@01 x) (= (inv@42@01 x) x))
  :pattern ((inv@42@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall x: Ref ::true ==> acc(Cell(x), write))
(declare-const x@44@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@45@01 ($Ref) $Ref)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@44@01 $Ref)) (!
  (and (= (inv@45@01 x@44@01) x@44@01) (img@46@01 x@44@01))
  :pattern ((inv@45@01 x@44@01))
  :pattern ((img@46@01 x@44@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@46@01 x) (= (inv@45@01 x) x))
  :pattern ((inv@45@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@47@01 ((x $Ref)) $Perm
  (ite
    (and (img@46@01 x) (= x (inv@45@01 x)))
    ($Perm.min (ite (img@43@01 x) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@43@01 x) $Perm.Write $Perm.No) (pTaken@47@01 x)) $Perm.No)
  
  :qid |quant-u-45|))))
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
    (and (img@46@01 x) (= x (inv@45@01 x)))
    (= (- $Perm.Write (pTaken@47@01 x)) $Perm.No))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@48@01 $PSF<Cell>)
(declare-const s@49@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@49@01 $Snap)) (!
  (=>
    (img@43@01 ($SortWrappers.$SnapTo$Ref s@49@01))
    (and
      (not (= s@49@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@48@01  $PSF<Cell>) s@49@01)
        ($PSF.lookup_Cell $t@41@01 s@49@01))))
  :pattern (($PSF.lookup_Cell (as sm@48@01  $PSF<Cell>) s@49@01))
  :pattern (($PSF.lookup_Cell $t@41@01 s@49@01))
  :qid |qp.psmValDef4|)))
(declare-fun inv@50@01 ($Ref) $Ref)
(declare-fun img@51@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (img@51@01 x) (= (inv@50@01 x) x))
  :pattern ((inv@50@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((x@44@01 $Ref)) (!
  (and (= (inv@50@01 x@44@01) x@44@01) (img@51@01 x@44@01))
  :pattern ((inv@50@01 x@44@01))
  :pattern ((img@51@01 x@44@01))
  :qid |Cell-invOfFct|)))
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; exhale acc(Cell(y), write)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@52@01 ((x $Ref)) $Perm
  (ite
    (= x y@38@01)
    ($Perm.min (ite (img@51@01 x) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@51@01 x) $Perm.Write $Perm.No) (pTaken@52@01 x)) $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@52@01 x) $Perm.No)
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x y@38@01) (= (- $Perm.Write (pTaken@52@01 x)) $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@53@01 $PSF<Cell>)
(declare-const s@54@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@51@01 y@38@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap y@38@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@53@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap y@38@01))
      ($PSF.lookup_Cell (as sm@48@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap y@38@01))))))
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert (forall x: Ref ::x != y ==> acc(Cell(x), write))
(declare-const x@55@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] x != y
(assert (not (= x@55@01 y@38@01)))
(pop) ; 4
(declare-fun inv@56@01 ($Ref) $Ref)
(declare-fun img@57@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@55@01 $Ref) (x2@55@01 $Ref)) (!
  (=>
    (and
      (not (= x1@55@01 y@38@01))
      (not (= x2@55@01 y@38@01))
      (= x1@55@01 x2@55@01))
    (= x1@55@01 x2@55@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@55@01 $Ref)) (!
  (=>
    (not (= x@55@01 y@38@01))
    (and (= (inv@56@01 x@55@01) x@55@01) (img@57@01 x@55@01)))
  :pattern ((inv@56@01 x@55@01))
  :pattern ((img@57@01 x@55@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@57@01 x) (not (= (inv@56@01 x) y@38@01))) (= (inv@56@01 x) x))
  :pattern ((inv@56@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((x $Ref)) $Perm
  (ite
    (and (not (= (inv@56@01 x) y@38@01)) (img@57@01 x) (= x (inv@56@01 x)))
    ($Perm.min
      (ite (img@51@01 x) (- $Perm.Write (pTaken@52@01 x)) $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@51@01 x) (- $Perm.Write (pTaken@52@01 x)) $Perm.No)
      (pTaken@58@01 x))
    $Perm.No)
  
  :qid |quant-u-54|))))
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
    (and (not (= (inv@56@01 x) y@38@01)) (img@57@01 x) (= x (inv@56@01 x)))
    (= (- $Perm.Write (pTaken@58@01 x)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@59@01 $PSF<Cell>)
(declare-const s@60@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@60@01 $Snap)) (!
  (=>
    (ite
      (img@51@01 ($SortWrappers.$SnapTo$Ref s@60@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@52@01 ($SortWrappers.$SnapTo$Ref s@60@01))))
      false)
    (and
      (not (= s@60@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@60@01)
        ($PSF.lookup_Cell (as sm@48@01  $PSF<Cell>) s@60@01))))
  :pattern (($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@60@01))
  :pattern (($PSF.lookup_Cell (as sm@48@01  $PSF<Cell>) s@60@01))
  :qid |qp.psmValDef6|)))
(declare-fun inv@61@01 ($Ref) $Ref)
(declare-fun img@62@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01))) (= (inv@61@01 x) x))
  :pattern ((inv@61@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((x@55@01 $Ref)) (!
  (=>
    (not (= (inv@56@01 x@55@01) y@38@01))
    (and (= (inv@61@01 x@55@01) x@55@01) (img@62@01 x@55@01)))
  :pattern ((inv@61@01 x@55@01))
  :pattern ((img@62@01 x@55@01))
  :qid |Cell-invOfFct|)))
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert (forall x: Ref ::x != y ==> acc(Cell(x), write))
(declare-const x@63@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] x != y
(assert (not (= x@63@01 y@38@01)))
(pop) ; 4
(declare-fun inv@64@01 ($Ref) $Ref)
(declare-fun img@65@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@63@01 $Ref) (x2@63@01 $Ref)) (!
  (=>
    (and
      (not (= x1@63@01 y@38@01))
      (not (= x2@63@01 y@38@01))
      (= x1@63@01 x2@63@01))
    (= x1@63@01 x2@63@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (not (= x@63@01 y@38@01))
    (and (= (inv@64@01 x@63@01) x@63@01) (img@65@01 x@63@01)))
  :pattern ((inv@64@01 x@63@01))
  :pattern ((img@65@01 x@63@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@65@01 x) (not (= (inv@64@01 x) y@38@01))) (= (inv@64@01 x) x))
  :pattern ((inv@64@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@66@01 ((x $Ref)) $Perm
  (ite
    (and (not (= (inv@64@01 x) y@38@01)) (img@65@01 x) (= x (inv@64@01 x)))
    ($Perm.min
      (ite
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@66@01 x))
    $Perm.No)
  
  :qid |quant-u-59|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@66@01 x) $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (not (= (inv@64@01 x) y@38@01)) (img@65@01 x) (= x (inv@64@01 x)))
    (= (- $Perm.Write (pTaken@66@01 x)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@67@01 $PSF<Cell>)
(declare-const s@68@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@68@01 $Snap)) (!
  (=>
    (and
      (img@62@01 ($SortWrappers.$SnapTo$Ref s@68@01))
      (not (= (inv@56@01 ($SortWrappers.$SnapTo$Ref s@68@01)) y@38@01)))
    (and
      (not (= s@68@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@68@01)
        ($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@68@01))))
  :pattern (($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@68@01))
  :pattern (($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@68@01))
  :qid |qp.psmValDef7|)))
(declare-fun inv@69@01 ($Ref) $Ref)
(declare-fun img@70@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01))) (= (inv@69@01 x) x))
  :pattern ((inv@69@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((x@63@01 $Ref)) (!
  (=>
    (not (= (inv@64@01 x@63@01) y@38@01))
    (and (= (inv@69@01 x@63@01) x@63@01) (img@70@01 x@63@01)))
  :pattern ((inv@69@01 x@63@01))
  :pattern ((img@70@01 x@63@01))
  :qid |Cell-invOfFct|)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (and
    (= x@63@01 x@55@01)
    (=
      (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
      (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))))
  
  :qid |quant-u-62|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert (forall x: Ref ::true ==> acc(Cell(x), write))
(declare-const x@71@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@72@01 ($Ref) $Ref)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@71@01 $Ref)) (!
  (and (= (inv@72@01 x@71@01) x@71@01) (img@73@01 x@71@01))
  :pattern ((inv@72@01 x@71@01))
  :pattern ((img@73@01 x@71@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@73@01 x) (= (inv@72@01 x) x))
  :pattern ((inv@72@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-64|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@74@01 ((x $Ref)) $Perm
  (ite
    (and (img@73@01 x) (= x (inv@72@01 x)))
    ($Perm.min
      (ite
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        (- $Perm.Write (pTaken@66@01 x))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@75@01 ((x $Ref)) $Perm
  (ite
    (and (img@73@01 x) (= x (inv@72@01 x)))
    ($Perm.min
      (ite
        (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@74@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        (- $Perm.Write (pTaken@66@01 x))
        $Perm.No)
      (pTaken@74@01 x))
    $Perm.No)
  
  :qid |quant-u-66|))))
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
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- $Perm.Write (pTaken@74@01 x)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@75@01 x))
    $Perm.No)
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@75@01 x) $Perm.No)
  
  :qid |quant-u-69|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- (- $Perm.Write (pTaken@74@01 x)) (pTaken@75@01 x)) $Perm.No))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- (- $Perm.Write (pTaken@74@01 x)) (pTaken@75@01 x)) $Perm.No))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@76@01 $PSF<Cell>)
(declare-const s@77@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@77@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@62@01 ($SortWrappers.$SnapTo$Ref s@77@01))
        (not (= (inv@56@01 ($SortWrappers.$SnapTo$Ref s@77@01)) y@38@01)))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@66@01 ($SortWrappers.$SnapTo$Ref s@77@01))))
      false)
    (and
      (not (= s@77@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@76@01  $PSF<Cell>) s@77@01)
        ($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@77@01))))
  :pattern (($PSF.lookup_Cell (as sm@76@01  $PSF<Cell>) s@77@01))
  :pattern (($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@77@01))
  :qid |qp.psmValDef8|)))
(assert (forall ((s@77@01 $Snap)) (!
  (=>
    (and
      (img@70@01 ($SortWrappers.$SnapTo$Ref s@77@01))
      (not (= (inv@64@01 ($SortWrappers.$SnapTo$Ref s@77@01)) y@38@01)))
    (and
      (not (= s@77@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@76@01  $PSF<Cell>) s@77@01)
        ($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@77@01))))
  :pattern (($PSF.lookup_Cell (as sm@76@01  $PSF<Cell>) s@77@01))
  :pattern (($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@77@01))
  :qid |qp.psmValDef9|)))
(declare-fun inv@78@01 ($Ref) $Ref)
(declare-fun img@79@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@79@01 x)
      (<
        $Perm.No
        (- $Perm.Write (- (- $Perm.Write (pTaken@74@01 x)) (pTaken@75@01 x)))))
    (= (inv@78@01 x) x))
  :pattern ((inv@78@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((x@71@01 $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        $Perm.Write
        (- (- $Perm.Write (pTaken@74@01 x@71@01)) (pTaken@75@01 x@71@01))))
    (and (= (inv@78@01 x@71@01) x@71@01) (img@79@01 x@71@01)))
  :pattern ((inv@78@01 x@71@01))
  :pattern ((img@79@01 x@71@01))
  :qid |Cell-invOfFct|)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- (- $Perm.Write (pTaken@74@01 x)) (pTaken@75@01 x)) $Perm.No))
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@80@01 $PSF<Cell>)
(declare-const s@81@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@82@01 ($Ref) $Ref)
(declare-fun img@83@01 ($Ref) Bool)
(assert (= (as sm@76@01  $PSF<Cell>) (as sm@80@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- (- $Perm.Write (pTaken@74@01 x)) (pTaken@75@01 x)) $Perm.No))
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@84@01 $PSF<Cell>)
(declare-const s@85@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@86@01 ($Ref) $Ref)
(declare-fun img@87@01 ($Ref) Bool)
(assert (= (as sm@76@01  $PSF<Cell>) (as sm@84@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (and
    (= x@55@01 x@63@01)
    (=
      (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
      (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))))
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-74|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@88@01 ((x $Ref)) $Perm
  (ite
    (and (img@73@01 x) (= x (inv@72@01 x)))
    ($Perm.min
      (ite
        (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@89@01 ((x $Ref)) $Perm
  (ite
    (and (img@73@01 x) (= x (inv@72@01 x)))
    ($Perm.min
      (ite
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        (- $Perm.Write (pTaken@66@01 x))
        $Perm.No)
      (- $Perm.Write (pTaken@88@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@88@01 x))
    $Perm.No)
  
  :qid |quant-u-76|))))
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
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- $Perm.Write (pTaken@88@01 x)) $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        (- $Perm.Write (pTaken@66@01 x))
        $Perm.No)
      (pTaken@89@01 x))
    $Perm.No)
  
  :qid |quant-u-78|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@89@01 x) $Perm.No)
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- (- $Perm.Write (pTaken@88@01 x)) (pTaken@89@01 x)) $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- (- $Perm.Write (pTaken@88@01 x)) (pTaken@89@01 x)) $Perm.No))
  
  :qid |quant-u-80|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@90@01 $PSF<Cell>)
(declare-const s@91@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@91@01 $Snap)) (!
  (=>
    (and
      (img@70@01 ($SortWrappers.$SnapTo$Ref s@91@01))
      (not (= (inv@64@01 ($SortWrappers.$SnapTo$Ref s@91@01)) y@38@01)))
    (and
      (not (= s@91@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@90@01  $PSF<Cell>) s@91@01)
        ($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@91@01))))
  :pattern (($PSF.lookup_Cell (as sm@90@01  $PSF<Cell>) s@91@01))
  :pattern (($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@91@01))
  :qid |qp.psmValDef10|)))
(assert (forall ((s@91@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@62@01 ($SortWrappers.$SnapTo$Ref s@91@01))
        (not (= (inv@56@01 ($SortWrappers.$SnapTo$Ref s@91@01)) y@38@01)))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@66@01 ($SortWrappers.$SnapTo$Ref s@91@01))))
      false)
    (and
      (not (= s@91@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@90@01  $PSF<Cell>) s@91@01)
        ($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@91@01))))
  :pattern (($PSF.lookup_Cell (as sm@90@01  $PSF<Cell>) s@91@01))
  :pattern (($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@91@01))
  :qid |qp.psmValDef11|)))
(declare-fun inv@92@01 ($Ref) $Ref)
(declare-fun img@93@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@93@01 x)
      (<
        $Perm.No
        (- $Perm.Write (- (- $Perm.Write (pTaken@88@01 x)) (pTaken@89@01 x)))))
    (= (inv@92@01 x) x))
  :pattern ((inv@92@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((x@71@01 $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        $Perm.Write
        (- (- $Perm.Write (pTaken@88@01 x@71@01)) (pTaken@89@01 x@71@01))))
    (and (= (inv@92@01 x@71@01) x@71@01) (img@93@01 x@71@01)))
  :pattern ((inv@92@01 x@71@01))
  :pattern ((img@93@01 x@71@01))
  :qid |Cell-invOfFct|)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- (- $Perm.Write (pTaken@88@01 x)) (pTaken@89@01 x)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@94@01 $PSF<Cell>)
(declare-const s@95@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@96@01 ($Ref) $Ref)
(declare-fun img@97@01 ($Ref) Bool)
(assert (= (as sm@90@01  $PSF<Cell>) (as sm@94@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@73@01 x) (= x (inv@72@01 x)))
    (= (- (- $Perm.Write (pTaken@88@01 x)) (pTaken@89@01 x)) $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@98@01 $PSF<Cell>)
(declare-const s@99@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@100@01 ($Ref) $Ref)
(declare-fun img@101@01 ($Ref) Bool)
(assert (= (as sm@90@01  $PSF<Cell>) (as sm@98@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (and
    (= x@55@01 x@63@01)
    (=
      (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
      (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))))
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const x@102@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@103@01 ($Ref) $Ref)
(declare-fun img@104@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((x@102@01 $Ref)) (!
  (and (= (inv@103@01 x@102@01) x@102@01) (img@104@01 x@102@01))
  :pattern ((inv@103@01 x@102@01))
  :pattern ((img@104@01 x@102@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@104@01 x) (= (inv@103@01 x) x))
  :pattern ((inv@103@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@105@01 ((x $Ref)) $Perm
  (ite
    (and (img@104@01 x) (= x (inv@103@01 x)))
    ($Perm.min
      (ite
        (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@106@01 ((x $Ref)) $Perm
  (ite
    (and (img@104@01 x) (= x (inv@103@01 x)))
    ($Perm.min
      (ite
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        (- $Perm.Write (pTaken@66@01 x))
        $Perm.No)
      (- $Perm.Write (pTaken@105@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@105@01 x))
    $Perm.No)
  
  :qid |quant-u-87|))))
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
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- $Perm.Write (pTaken@105@01 x)) $Perm.No))
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        (- $Perm.Write (pTaken@66@01 x))
        $Perm.No)
      (pTaken@106@01 x))
    $Perm.No)
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@106@01 x) $Perm.No)
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- (- $Perm.Write (pTaken@105@01 x)) (pTaken@106@01 x)) $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- (- $Perm.Write (pTaken@105@01 x)) (pTaken@106@01 x)) $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@107@01 $PSF<Cell>)
(declare-const s@108@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@108@01 $Snap)) (!
  (=>
    (and
      (img@70@01 ($SortWrappers.$SnapTo$Ref s@108@01))
      (not (= (inv@64@01 ($SortWrappers.$SnapTo$Ref s@108@01)) y@38@01)))
    (and
      (not (= s@108@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@107@01  $PSF<Cell>) s@108@01)
        ($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@108@01))))
  :pattern (($PSF.lookup_Cell (as sm@107@01  $PSF<Cell>) s@108@01))
  :pattern (($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@108@01))
  :qid |qp.psmValDef12|)))
(assert (forall ((s@108@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@62@01 ($SortWrappers.$SnapTo$Ref s@108@01))
        (not (= (inv@56@01 ($SortWrappers.$SnapTo$Ref s@108@01)) y@38@01)))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@66@01 ($SortWrappers.$SnapTo$Ref s@108@01))))
      false)
    (and
      (not (= s@108@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@107@01  $PSF<Cell>) s@108@01)
        ($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@108@01))))
  :pattern (($PSF.lookup_Cell (as sm@107@01  $PSF<Cell>) s@108@01))
  :pattern (($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@108@01))
  :qid |qp.psmValDef13|)))
(declare-fun inv@109@01 ($Ref) $Ref)
(declare-fun img@110@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@110@01 x)
      (<
        $Perm.No
        (- $Perm.Write (- (- $Perm.Write (pTaken@105@01 x)) (pTaken@106@01 x)))))
    (= (inv@109@01 x) x))
  :pattern ((inv@109@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((x@102@01 $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        $Perm.Write
        (- (- $Perm.Write (pTaken@105@01 x@102@01)) (pTaken@106@01 x@102@01))))
    (and (= (inv@109@01 x@102@01) x@102@01) (img@110@01 x@102@01)))
  :pattern ((inv@109@01 x@102@01))
  :pattern ((img@110@01 x@102@01))
  :qid |Cell-invOfFct|)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- (- $Perm.Write (pTaken@105@01 x)) (pTaken@106@01 x)) $Perm.No))
  
  :qid |quant-u-92|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@111@01 $PSF<Cell>)
(declare-const s@112@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@113@01 ($Ref) $Ref)
(declare-fun img@114@01 ($Ref) Bool)
(assert (= (as sm@107@01  $PSF<Cell>) (as sm@111@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- (- $Perm.Write (pTaken@105@01 x)) (pTaken@106@01 x)) $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@115@01 $PSF<Cell>)
(declare-const s@116@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@117@01 ($Ref) $Ref)
(declare-fun img@118@01 ($Ref) Bool)
(assert (= (as sm@107@01  $PSF<Cell>) (as sm@115@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (and
    (= x@63@01 x@55@01)
    (=
      (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
      (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))))
  
  :qid |quant-u-94|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-95|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@119@01 ((x $Ref)) $Perm
  (ite
    (and (img@104@01 x) (= x (inv@103@01 x)))
    ($Perm.min
      (ite
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        (- $Perm.Write (pTaken@66@01 x))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@120@01 ((x $Ref)) $Perm
  (ite
    (and (img@104@01 x) (= x (inv@103@01 x)))
    ($Perm.min
      (ite
        (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@119@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@62@01 x) (not (= (inv@56@01 x) y@38@01)))
        (- $Perm.Write (pTaken@66@01 x))
        $Perm.No)
      (pTaken@119@01 x))
    $Perm.No)
  
  :qid |quant-u-97|))))
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
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- $Perm.Write (pTaken@119@01 x)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@70@01 x) (not (= (inv@64@01 x) y@38@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@120@01 x))
    $Perm.No)
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@120@01 x) $Perm.No)
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- (- $Perm.Write (pTaken@119@01 x)) (pTaken@120@01 x)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- (- $Perm.Write (pTaken@119@01 x)) (pTaken@120@01 x)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@121@01 $PSF<Cell>)
(declare-const s@122@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@122@01 $Snap)) (!
  (=>
    (ite
      (and
        (img@62@01 ($SortWrappers.$SnapTo$Ref s@122@01))
        (not (= (inv@56@01 ($SortWrappers.$SnapTo$Ref s@122@01)) y@38@01)))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@66@01 ($SortWrappers.$SnapTo$Ref s@122@01))))
      false)
    (and
      (not (= s@122@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@121@01  $PSF<Cell>) s@122@01)
        ($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@122@01))))
  :pattern (($PSF.lookup_Cell (as sm@121@01  $PSF<Cell>) s@122@01))
  :pattern (($PSF.lookup_Cell (as sm@59@01  $PSF<Cell>) s@122@01))
  :qid |qp.psmValDef14|)))
(assert (forall ((s@122@01 $Snap)) (!
  (=>
    (and
      (img@70@01 ($SortWrappers.$SnapTo$Ref s@122@01))
      (not (= (inv@64@01 ($SortWrappers.$SnapTo$Ref s@122@01)) y@38@01)))
    (and
      (not (= s@122@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@121@01  $PSF<Cell>) s@122@01)
        ($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@122@01))))
  :pattern (($PSF.lookup_Cell (as sm@121@01  $PSF<Cell>) s@122@01))
  :pattern (($PSF.lookup_Cell (as sm@67@01  $PSF<Cell>) s@122@01))
  :qid |qp.psmValDef15|)))
(declare-fun inv@123@01 ($Ref) $Ref)
(declare-fun img@124@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=>
    (and
      (img@124@01 x)
      (<
        $Perm.No
        (- $Perm.Write (- (- $Perm.Write (pTaken@119@01 x)) (pTaken@120@01 x)))))
    (= (inv@123@01 x) x))
  :pattern ((inv@123@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((x@102@01 $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        $Perm.Write
        (- (- $Perm.Write (pTaken@119@01 x@102@01)) (pTaken@120@01 x@102@01))))
    (and (= (inv@123@01 x@102@01) x@102@01) (img@124@01 x@102@01)))
  :pattern ((inv@123@01 x@102@01))
  :pattern ((img@124@01 x@102@01))
  :qid |Cell-invOfFct|)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- (- $Perm.Write (pTaken@119@01 x)) (pTaken@120@01 x)) $Perm.No))
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@125@01 $PSF<Cell>)
(declare-const s@126@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@127@01 ($Ref) $Ref)
(declare-fun img@128@01 ($Ref) Bool)
(assert (= (as sm@121@01  $PSF<Cell>) (as sm@125@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@104@01 x) (= x (inv@103@01 x)))
    (= (- (- $Perm.Write (pTaken@119@01 x)) (pTaken@120@01 x)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@129@01 $PSF<Cell>)
(declare-const s@130@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@131@01 ($Ref) $Ref)
(declare-fun img@132@01 ($Ref) Bool)
(assert (= (as sm@121@01  $PSF<Cell>) (as sm@129@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 3
(declare-const $t@133@01 $Snap)
(declare-const $t@134@01 $Snap)
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@135@01 $MWSF)
(assert (forall (($t@133@01 $Snap)) (!
  (= (MWSF_apply mwsf@135@01 $t@133@01) $t@134@01)
  :pattern ((MWSF_apply mwsf@135@01 $t@133@01))
  :qid |quant-u-104|)))
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@136@01 $Ref)
(declare-const x@137@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@138@01 $Snap)
(assert (= $t@138@01 ($Snap.combine ($Snap.first $t@138@01) ($Snap.second $t@138@01))))
(declare-const y@139@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@140@01 ($Ref) $Ref)
(declare-fun img@141@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@139@01 $Ref)) (!
  (and (= (inv@140@01 y@139@01) y@139@01) (img@141@01 y@139@01))
  :pattern ((inv@140@01 y@139@01))
  :pattern ((img@141@01 y@139@01))
  :qid |quant-u-107|)))
(assert (forall ((x $Ref)) (!
  (=> (img@141@01 x) (= (inv@140@01 x) x))
  :pattern ((inv@140@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@138@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@142@01 ((x $Ref)) $Perm
  (ite
    (= x x@137@01)
    ($Perm.min
      (ite (img@141@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
      (ite (img@141@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@142@01 x))
    $Perm.No)
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@142@01 x) $Perm.No)
  
  :qid |quant-u-110|))))
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
  (=>
    (= x x@137@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@142@01 x)) $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@143@01 $PSF<Cell>)
(declare-const s@144@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@141@01 x@137@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@143@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@138@01)) ($SortWrappers.$RefTo$Snap x@137@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@143@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))) x@137@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@141@01 x@137@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@143@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@138@01)) ($SortWrappers.$RefTo$Snap x@137@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@143@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))) x@137@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@143@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))) x@137@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package (forall y: Ref ::true ==> acc(Cell(y), 1 / 2)) --*
; acc(Cell(x), write) && get(x) == 0 {
; }
(push) ; 3
(declare-const $t@145@01 $Snap)
(declare-const y@146@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@147@01 ($Ref) $Ref)
(declare-fun img@148@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@146@01 $Ref)) (!
  (and (= (inv@147@01 y@146@01) y@146@01) (img@148@01 y@146@01))
  :pattern ((inv@147@01 y@146@01))
  :pattern ((img@148@01 y@146@01))
  :qid |quant-u-113|)))
(assert (forall ((x $Ref)) (!
  (=> (img@148@01 x) (= (inv@147@01 x) x))
  :pattern ((inv@147@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@137@01) false)
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@149@01 $PSF<Cell>)
(declare-const s@150@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@151@01 ((x $Ref)) $Perm
  (ite
    (= x x@137@01)
    ($Perm.min
      (ite (img@148@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@148@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@151@01 x))
    $Perm.No)
  
  :qid |quant-u-116|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@151@01 x) $Perm.No)
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@137@01) (= (- $Perm.Write (pTaken@151@01 x)) $Perm.No))
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@137@01) (= (- $Perm.Write (pTaken@151@01 x)) $Perm.No))
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@152@01 $PSF<Cell>)
(declare-const s@153@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@148@01 x@137@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@152@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@145@01) ($SortWrappers.$RefTo$Snap x@137@01))))))
(assert (= (as sm@149@01  $PSF<Cell>) (as sm@152@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@154@01 ((x $Ref)) $Perm
  (ite
    (= x x@137@01)
    ($Perm.min
      (ite (img@141@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (- $Perm.Write (pTaken@151@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@141@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@154@01 x))
    $Perm.No)
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@154@01 x) $Perm.No)
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@137@01)
    (= (- (- $Perm.Write (pTaken@151@01 x)) (pTaken@154@01 x)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@155@01 $PSF<Cell>)
(declare-const s@156@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@141@01 x@137@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@155@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@138@01)) ($SortWrappers.$RefTo$Snap x@137@01))))))
(assert (= (as sm@149@01  $PSF<Cell>) (as sm@155@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@157@01 $PSF<Cell>)
(declare-const $t@158@01 $PSF<Cell>)
(assert (forall ((x $Ref)) (!
  (=>
    (ite (= x x@137@01) (< $Perm.No (pTaken@151@01 x)) false)
    (=
      ($PSF.lookup_Cell $t@157@01 ($SortWrappers.$RefTo$Snap x))
      ($PSF.lookup_Cell (as sm@152@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x))))
  :pattern (($PSF.lookup_Cell (as sm@149@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@152@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@157@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-123|)))
(assert (forall ((x $Ref)) (!
  (and
    (=>
      (ite (= x x@137@01) (< $Perm.No (pTaken@151@01 x)) false)
      (=
        ($PSF.lookup_Cell $t@158@01 ($SortWrappers.$RefTo$Snap x))
        ($PSF.lookup_Cell $t@157@01 ($SortWrappers.$RefTo$Snap x))))
    (=>
      (ite (= x x@137@01) (< $Perm.No (- $Perm.Write (pTaken@151@01 x))) false)
      (=
        ($PSF.lookup_Cell $t@158@01 ($SortWrappers.$RefTo$Snap x))
        ($PSF.lookup_Cell (as sm@155@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))))
  :pattern (($PSF.lookup_Cell $t@157@01 ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@155@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@158@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-124|)))
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@159@01 ((x $Ref)) $Perm
  (ite
    (= x x@137@01)
    ($Perm.min
      (ite (= x x@137@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@160@01 ((x $Ref)) $Perm
  (ite
    (= x x@137@01)
    ($Perm.min
      (ite
        (img@148@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 x))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@159@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@159@01 x@137@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@159@01 x) $Perm.No)
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@137@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@159@01 x)) $Perm.No))
  
  :qid |quant-u-128|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@161@01 $PSF<Cell>)
(declare-const s@162@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (img@148@01 x@137@01)
    (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 x@137@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@161@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@145@01) ($SortWrappers.$RefTo$Snap x@137@01))))))
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@161@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
    ($PSF.lookup_Cell $t@158@01 ($SortWrappers.$RefTo$Snap x@137@01)))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@161@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))) x@137@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (ite
      (img@148@01 x@137@01)
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 x@137@01)))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@161@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@145@01) ($SortWrappers.$RefTo$Snap x@137@01)))))
  (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@161@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
    ($PSF.lookup_Cell $t@158@01 ($SortWrappers.$RefTo$Snap x@137@01)))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@161@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))) x@137@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@161@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))) x@137@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@161@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))) x@137@01)
  0))
; Create MagicWandSnapFunction for wand (forall y: Ref ::true ==> acc(Cell(y), 1 / 2)) --* acc(Cell(x), write) && get(x) == 0
(declare-const mwsf@163@01 $MWSF)
(assert (forall (($t@145@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@163@01 $t@145@01)
    ($Snap.combine
      ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@155@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01)))
      $Snap.unit))
  :pattern ((MWSF_apply mwsf@163@01 $t@145@01))
  :qid |quant-u-129|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@145@01 $Snap)) (!
  (and
    (and
      (=>
        (img@148@01 x@137@01)
        (and
          (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@152@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@145@01) ($SortWrappers.$RefTo$Snap x@137@01)))))
      (= (as sm@149@01  $PSF<Cell>) (as sm@152@01  $PSF<Cell>))
      (=>
        (img@141@01 x@137@01)
        (and
          (not (= ($SortWrappers.$RefTo$Snap x@137@01) $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@155@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01))
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@138@01)) ($SortWrappers.$RefTo$Snap x@137@01)))))
      (= (as sm@149@01  $PSF<Cell>) (as sm@155@01  $PSF<Cell>)))
    (=
      (MWSF_apply mwsf@163@01 $t@145@01)
      ($Snap.combine
        ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@155@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@137@01)))
        $Snap.unit)))
  :pattern ((MWSF_apply mwsf@163@01 $t@145@01))
  :qid |quant-u-130|)))
(assert (forall ((x $Ref)) (!
  (=> (img@148@01 x) (= (inv@147@01 x) x))
  :pattern ((inv@147@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@146@01 $Ref)) (!
  (and (= (inv@147@01 y@146@01) y@146@01) (img@148@01 y@146@01))
  :pattern ((inv@147@01 y@146@01))
  :pattern ((img@148@01 y@146@01))
  :qid |quant-u-113|)))
; [exec]
; assert (forall y: Ref ::y != x ==> acc(Cell(y), 1 / 2))
(declare-const y@164@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@164@01 x@137@01)))
(pop) ; 4
(declare-fun inv@165@01 ($Ref) $Ref)
(declare-fun img@166@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@164@01 $Ref) (y2@164@01 $Ref)) (!
  (=>
    (and
      (not (= y1@164@01 x@137@01))
      (not (= y2@164@01 x@137@01))
      (= y1@164@01 y2@164@01))
    (= y1@164@01 y2@164@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@164@01 $Ref)) (!
  (=>
    (not (= y@164@01 x@137@01))
    (and (= (inv@165@01 y@164@01) y@164@01) (img@166@01 y@164@01)))
  :pattern ((inv@165@01 y@164@01))
  :pattern ((img@166@01 y@164@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@166@01 x) (not (= (inv@165@01 x) x@137@01)))
    (= (inv@165@01 x) x))
  :pattern ((inv@165@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@167@01 ((x $Ref)) $Perm
  (ite
    (and (not (= (inv@165@01 x) x@137@01)) (img@166@01 x) (= x (inv@165@01 x)))
    ($Perm.min
      (ite
        (img@141@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@154@01 x))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (img@141@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@154@01 x))
        $Perm.No)
      (pTaken@167@01 x))
    $Perm.No)
  
  :qid |quant-u-133|))))
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
    (and (not (= (inv@165@01 x) x@137@01)) (img@166@01 x) (= x (inv@165@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@167@01 x)) $Perm.No))
  
  :qid |quant-u-134|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@168@01 $PSF<Cell>)
(declare-const s@169@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@169@01 $Snap)) (!
  (=>
    (ite
      (img@141@01 ($SortWrappers.$SnapTo$Ref s@169@01))
      (<
        $Perm.No
        (-
          (/ (to_real 1) (to_real 2))
          (pTaken@154@01 ($SortWrappers.$SnapTo$Ref s@169@01))))
      false)
    (and
      (not (= s@169@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@168@01  $PSF<Cell>) s@169@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@138@01)) s@169@01))))
  :pattern (($PSF.lookup_Cell (as sm@168@01  $PSF<Cell>) s@169@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@138@01)) s@169@01))
  :qid |qp.psmValDef21|)))
; [exec]
; assert (forall y: Ref ::true ==> acc(Cell(y), 1 / 2))
(declare-const y@170@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@171@01 ($Ref) $Ref)
(declare-fun img@172@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@170@01 $Ref)) (!
  (and (= (inv@171@01 y@170@01) y@170@01) (img@172@01 y@170@01))
  :pattern ((inv@171@01 y@170@01))
  :pattern ((img@172@01 y@170@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@172@01 x) (= (inv@171@01 x) x))
  :pattern ((inv@171@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@173@01 ((x $Ref)) $Perm
  (ite
    (and (img@172@01 x) (= x (inv@171@01 x)))
    ($Perm.min
      (ite
        (img@141@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@154@01 x))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (img@141@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@154@01 x))
        $Perm.No)
      (pTaken@173@01 x))
    $Perm.No)
  
  :qid |quant-u-137|))))
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
    (and (img@172@01 x) (= x (inv@171@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@173@01 x)) $Perm.No))
  
  :qid |quant-u-138|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@172@01 x) (= x (inv@171@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@173@01 x)) $Perm.No))
  
  :qid |quant-u-138|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const y@174@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@175@01 ($Ref) $Ref)
(declare-fun img@176@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@174@01 $Ref)) (!
  (and (= (inv@175@01 y@174@01) y@174@01) (img@176@01 y@174@01))
  :pattern ((inv@175@01 y@174@01))
  :pattern ((img@176@01 y@174@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@176@01 x) (= (inv@175@01 x) x))
  :pattern ((inv@175@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@177@01 ((x $Ref)) $Perm
  (ite
    (and (img@176@01 x) (= x (inv@175@01 x)))
    ($Perm.min
      (ite
        (img@141@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@154@01 x))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (img@141@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@154@01 x))
        $Perm.No)
      (pTaken@177@01 x))
    $Perm.No)
  
  :qid |quant-u-141|))))
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
    (and (img@176@01 x) (= x (inv@175@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@177@01 x)) $Perm.No))
  
  :qid |quant-u-142|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@176@01 x) (= x (inv@175@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@177@01 x)) $Perm.No))
  
  :qid |quant-u-142|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const x@178@01 $Ref)
(declare-const x@179@01 $Ref)
(push) ; 1
(declare-const $t@180@01 $Snap)
(assert (= $t@180@01 ($Snap.combine ($Snap.first $t@180@01) ($Snap.second $t@180@01))))
(declare-const y@181@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@182@01 ($Ref) $Ref)
(declare-fun img@183@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@181@01 $Ref)) (!
  (and (= (inv@182@01 y@181@01) y@181@01) (img@183@01 y@181@01))
  :pattern ((inv@182@01 y@181@01))
  :pattern ((img@183@01 y@181@01))
  :qid |quant-u-144|)))
(assert (forall ((x $Ref)) (!
  (=> (img@183@01 x) (= (inv@182@01 x) x))
  :pattern ((inv@182@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@180@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@184@01 ((x $Ref)) $Perm
  (ite
    (= x x@179@01)
    ($Perm.min
      (ite (img@183@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
      (ite (img@183@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@184@01 x))
    $Perm.No)
  
  :qid |quant-u-146|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@184@01 x) $Perm.No)
  
  :qid |quant-u-147|))))
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
  (=>
    (= x x@179@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@184@01 x)) $Perm.No))
  
  :qid |quant-u-148|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@185@01 $PSF<Cell>)
(declare-const s@186@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@183@01 x@179@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@179@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@185@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@180@01)) ($SortWrappers.$RefTo$Snap x@179@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@185@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))) x@179@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@183@01 x@179@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@179@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@185@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@180@01)) ($SortWrappers.$RefTo$Snap x@179@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@185@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))) x@179@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@185@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))) x@179@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package (forall y: Ref ::true ==> acc(Cell(y), 1 / 2)) --* true {
;   assert (forall y: Ref ::true ==> acc(Cell(y), write))
;   assert get(x) == 0
; }
(push) ; 3
(declare-const $t@187@01 $Snap)
(declare-const y@188@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@189@01 ($Ref) $Ref)
(declare-fun img@190@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@188@01 $Ref)) (!
  (and (= (inv@189@01 y@188@01) y@188@01) (img@190@01 y@188@01))
  :pattern ((inv@189@01 y@188@01))
  :pattern ((img@190@01 y@188@01))
  :qid |quant-u-150|)))
(assert (forall ((x $Ref)) (!
  (=> (img@190@01 x) (= (inv@189@01 x) x))
  :pattern ((inv@189@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
; [exec]
; assert (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const y@191@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@192@01 ($Ref) $Ref)
(declare-fun img@193@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@191@01 $Ref)) (!
  (and (= (inv@192@01 y@191@01) y@191@01) (img@193@01 y@191@01))
  :pattern ((inv@192@01 y@191@01))
  :pattern ((img@193@01 y@191@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@193@01 x) (= (inv@192@01 x) x))
  :pattern ((inv@192@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-152|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (and (img@193@01 x) (= x (inv@192@01 x))) false)
  
  :qid |quant-u-153|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@194@01 $PSF<Cell>)
(declare-const s@195@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@196@01 ($Ref) $Ref)
(declare-fun img@197@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@198@01 ((x $Ref)) $Perm
  (ite
    (and (img@193@01 x) (= x (inv@192@01 x)))
    ($Perm.min
      (ite (img@190@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@190@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@198@01 x))
    $Perm.No)
  
  :qid |quant-u-155|))))
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
    (and (img@193@01 x) (= x (inv@192@01 x)))
    (= (- $Perm.Write (pTaken@198@01 x)) $Perm.No))
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@193@01 x) (= x (inv@192@01 x)))
    (= (- $Perm.Write (pTaken@198@01 x)) $Perm.No))
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@199@01 $PSF<Cell>)
(declare-const s@200@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@200@01 $Snap)) (!
  (=>
    (img@190@01 ($SortWrappers.$SnapTo$Ref s@200@01))
    (and
      (not (= s@200@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@199@01  $PSF<Cell>) s@200@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@187@01) s@200@01))))
  :pattern (($PSF.lookup_Cell (as sm@199@01  $PSF<Cell>) s@200@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@187@01) s@200@01))
  :qid |qp.psmValDef23|)))
(declare-fun inv@201@01 ($Ref) $Ref)
(declare-fun img@202@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (and (img@202@01 x) (< $Perm.No (pTaken@198@01 x))) (= (inv@201@01 x) x))
  :pattern ((inv@201@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@191@01 $Ref)) (!
  (=>
    (< $Perm.No (pTaken@198@01 y@191@01))
    (and (= (inv@201@01 y@191@01) y@191@01) (img@202@01 y@191@01)))
  :pattern ((inv@201@01 y@191@01))
  :pattern ((img@202@01 y@191@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@194@01  $PSF<Cell>) (as sm@199@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@203@01 ((x $Ref)) $Perm
  (ite
    (and (img@193@01 x) (= x (inv@192@01 x)))
    ($Perm.min
      (ite (img@183@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (- $Perm.Write (pTaken@198@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@183@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@203@01 x))
    $Perm.No)
  
  :qid |quant-u-158|))))
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
    (and (img@193@01 x) (= x (inv@192@01 x)))
    (= (- (- $Perm.Write (pTaken@198@01 x)) (pTaken@203@01 x)) $Perm.No))
  
  :qid |quant-u-159|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@204@01 $PSF<Cell>)
(declare-const s@205@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@205@01 $Snap)) (!
  (=>
    (img@183@01 ($SortWrappers.$SnapTo$Ref s@205@01))
    (and
      (not (= s@205@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@204@01  $PSF<Cell>) s@205@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@180@01)) s@205@01))))
  :pattern (($PSF.lookup_Cell (as sm@204@01  $PSF<Cell>) s@205@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@180@01)) s@205@01))
  :qid |qp.psmValDef24|)))
(declare-fun inv@206@01 ($Ref) $Ref)
(declare-fun img@207@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@207@01 x) (< $Perm.No (- $Perm.Write (pTaken@198@01 x))))
    (= (inv@206@01 x) x))
  :pattern ((inv@206@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@191@01 $Ref)) (!
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@198@01 y@191@01)))
    (and (= (inv@206@01 y@191@01) y@191@01) (img@207@01 y@191@01)))
  :pattern ((inv@206@01 y@191@01))
  :pattern ((img@207@01 y@191@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@194@01  $PSF<Cell>) (as sm@204@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@202@01 x) (img@197@01 x))
  
  :qid |quant-u-160|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@207@01 x) (img@202@01 x))
  
  :qid |quant-u-161|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x $Ref)) (!
  (= (img@207@01 x) (img@202@01 x))
  
  :qid |quant-u-161|)))
(declare-const $t@208@01 $PSF<Cell>)
(assert (forall ((x $Ref)) (!
  (and
    (=>
      (ite (img@202@01 x) (< $Perm.No (pTaken@198@01 x)) false)
      (=
        ($PSF.lookup_Cell $t@208@01 ($SortWrappers.$RefTo$Snap x))
        ($PSF.lookup_Cell (as sm@199@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x))))
    (=>
      (ite (img@207@01 x) (< $Perm.No (- $Perm.Write (pTaken@198@01 x))) false)
      (=
        ($PSF.lookup_Cell $t@208@01 ($SortWrappers.$RefTo$Snap x))
        ($PSF.lookup_Cell (as sm@204@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))))
  :pattern (($PSF.lookup_Cell (as sm@199@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@204@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@208@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-162|)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@197@01 x) (img@207@01 x))
  
  :qid |quant-u-163|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert get(x) == 0
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@209@01 ((x $Ref)) $Perm
  (ite
    (= x x@179@01)
    ($Perm.min
      (ite (img@207@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@210@01 ((x $Ref)) $Perm
  (ite
    (= x x@179@01)
    ($Perm.min $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@209@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@207@01 x) $Perm.Write $Perm.No) (pTaken@209@01 x)) $Perm.No)
  
  :qid |quant-u-165|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@209@01 x) $Perm.No)
  
  :qid |quant-u-166|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@179@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@209@01 x)) $Perm.No))
  
  :qid |quant-u-167|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@211@01 $PSF<Cell>)
(declare-const s@212@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@207@01 x@179@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@179@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@211@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))
      ($PSF.lookup_Cell $t@208@01 ($SortWrappers.$RefTo$Snap x@179@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@211@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))) x@179@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (img@207@01 x@179@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@179@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@211@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))
        ($PSF.lookup_Cell $t@208@01 ($SortWrappers.$RefTo$Snap x@179@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@211@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))) x@179@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@211@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))) x@179@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@211@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@179@01))) x@179@01)
  0))
; Create MagicWandSnapFunction for wand (forall y: Ref ::true ==> acc(Cell(y), 1 / 2)) --* true
(declare-const mwsf@213@01 $MWSF)
(assert (forall (($t@187@01 $Snap)) (!
  (= (MWSF_apply mwsf@213@01 $t@187@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@213@01 $t@187@01))
  :qid |quant-u-168|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@187@01 $Snap)) (!
  (and
    (forall ((s@200@01 $Snap)) (!
      (=>
        (img@190@01 ($SortWrappers.$SnapTo$Ref s@200@01))
        (and
          (not (= s@200@01 $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@199@01  $PSF<Cell>) s@200@01)
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@187@01) s@200@01))))
      :pattern (($PSF.lookup_Cell (as sm@199@01  $PSF<Cell>) s@200@01))
      :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@187@01) s@200@01))
      :qid |qp.psmValDef23|))
    (= (MWSF_apply mwsf@213@01 $t@187@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@213@01 $t@187@01))
  :qid |quant-u-169|)))
(assert (forall ((x $Ref)) (!
  (=> (img@190@01 x) (= (inv@189@01 x) x))
  :pattern ((inv@189@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@188@01 $Ref)) (!
  (and (= (inv@189@01 y@188@01) y@188@01) (img@190@01 y@188@01))
  :pattern ((inv@189@01 y@188@01))
  :pattern ((img@190@01 y@188@01))
  :qid |quant-u-150|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@202@01 x) (< $Perm.No (pTaken@198@01 x))) (= (inv@201@01 x) x))
  :pattern ((inv@201@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@191@01 $Ref)) (!
  (=>
    (< $Perm.No (pTaken@198@01 y@191@01))
    (and (= (inv@201@01 y@191@01) y@191@01) (img@202@01 y@191@01)))
  :pattern ((inv@201@01 y@191@01))
  :pattern ((img@202@01 y@191@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((s@205@01 $Snap)) (!
  (=>
    (img@183@01 ($SortWrappers.$SnapTo$Ref s@205@01))
    (and
      (not (= s@205@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@204@01  $PSF<Cell>) s@205@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@180@01)) s@205@01))))
  :pattern (($PSF.lookup_Cell (as sm@204@01  $PSF<Cell>) s@205@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@180@01)) s@205@01))
  :qid |qp.psmValDef24|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@207@01 x) (< $Perm.No (- $Perm.Write (pTaken@198@01 x))))
    (= (inv@206@01 x) x))
  :pattern ((inv@206@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@191@01 $Ref)) (!
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@198@01 y@191@01)))
    (and (= (inv@206@01 y@191@01) y@191@01) (img@207@01 y@191@01)))
  :pattern ((inv@206@01 y@191@01))
  :pattern ((img@207@01 y@191@01))
  :qid |Cell-invOfFct|)))
(assert (and
  (= (as sm@194@01  $PSF<Cell>) (as sm@199@01  $PSF<Cell>))
  (= (as sm@194@01  $PSF<Cell>) (as sm@204@01  $PSF<Cell>))))
; [exec]
; assert (forall y: Ref ::y != x ==> acc(Cell(y), 1 / 2))
(declare-const y@214@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@214@01 x@179@01)))
(pop) ; 4
(declare-fun inv@215@01 ($Ref) $Ref)
(declare-fun img@216@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@214@01 $Ref) (y2@214@01 $Ref)) (!
  (=>
    (and
      (not (= y1@214@01 x@179@01))
      (not (= y2@214@01 x@179@01))
      (= y1@214@01 y2@214@01))
    (= y1@214@01 y2@214@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@214@01 $Ref)) (!
  (=>
    (not (= y@214@01 x@179@01))
    (and (= (inv@215@01 y@214@01) y@214@01) (img@216@01 y@214@01)))
  :pattern ((inv@215@01 y@214@01))
  :pattern ((img@216@01 y@214@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@216@01 x) (not (= (inv@215@01 x) x@179@01)))
    (= (inv@215@01 x) x))
  :pattern ((inv@215@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (not (= (inv@215@01 x) x@179@01)) (img@216@01 x) (= x (inv@215@01 x)))
    false)
  
  :qid |quant-u-171|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const y@217@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] y != x
(assert (not (= y@217@01 x@179@01)))
(pop) ; 4
(declare-fun inv@218@01 ($Ref) $Ref)
(declare-fun img@219@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@217@01 $Ref) (y2@217@01 $Ref)) (!
  (=>
    (and
      (not (= y1@217@01 x@179@01))
      (not (= y2@217@01 x@179@01))
      (= y1@217@01 y2@217@01))
    (= y1@217@01 y2@217@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@217@01 $Ref)) (!
  (=>
    (not (= y@217@01 x@179@01))
    (and (= (inv@218@01 y@217@01) y@217@01) (img@219@01 y@217@01)))
  :pattern ((inv@218@01 y@217@01))
  :pattern ((img@219@01 y@217@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@219@01 x) (not (= (inv@218@01 x) x@179@01)))
    (= (inv@218@01 x) x))
  :pattern ((inv@218@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (not (= (inv@218@01 x) x@179@01)) (img@219@01 x) (= x (inv@218@01 x)))
    false)
  
  :qid |quant-u-173|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const x@220@01 $Ref)
(declare-const x@221@01 $Ref)
(push) ; 1
(declare-const $t@222@01 $Snap)
(assert (= $t@222@01 ($Snap.combine ($Snap.first $t@222@01) ($Snap.second $t@222@01))))
(declare-const y@223@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@224@01 ($Ref) $Ref)
(declare-fun img@225@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@223@01 $Ref)) (!
  (and (= (inv@224@01 y@223@01) y@223@01) (img@225@01 y@223@01))
  :pattern ((inv@224@01 y@223@01))
  :pattern ((img@225@01 y@223@01))
  :qid |quant-u-175|)))
(assert (forall ((x $Ref)) (!
  (=> (img@225@01 x) (= (inv@224@01 x) x))
  :pattern ((inv@224@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@222@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@226@01 ((x $Ref)) $Perm
  (ite
    (= x x@221@01)
    ($Perm.min
      (ite (img@225@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
  (= (- (ite (img@225@01 x) $Perm.Write $Perm.No) (pTaken@226@01 x)) $Perm.No)
  
  :qid |quant-u-177|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@226@01 x) $Perm.No)
  
  :qid |quant-u-178|))))
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
  (=>
    (= x x@221@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@226@01 x)) $Perm.No))
  
  :qid |quant-u-179|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@227@01 $PSF<Cell>)
(declare-const s@228@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@225@01 x@221@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@221@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@227@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@222@01)) ($SortWrappers.$RefTo$Snap x@221@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@227@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))) x@221@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@225@01 x@221@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@221@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@227@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@222@01)) ($SortWrappers.$RefTo$Snap x@221@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@227@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))) x@221@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@227@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))) x@221@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package (forall y: Ref ::y != x ==> acc(Cell(y), write)) --* true {
;   assert (forall y: Ref ::true ==> acc(Cell(y), write))
;   assert get(x) == 0
; }
(push) ; 3
(declare-const $t@229@01 $Snap)
(declare-const y@230@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@230@01 x@221@01)))
(pop) ; 4
(declare-fun inv@231@01 ($Ref) $Ref)
(declare-fun img@232@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@230@01 $Ref) (y2@230@01 $Ref)) (!
  (=>
    (and
      (not (= y1@230@01 x@221@01))
      (not (= y2@230@01 x@221@01))
      (= y1@230@01 y2@230@01))
    (= y1@230@01 y2@230@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@230@01 $Ref)) (!
  (=>
    (not (= y@230@01 x@221@01))
    (and (= (inv@231@01 y@230@01) y@230@01) (img@232@01 y@230@01)))
  :pattern ((inv@231@01 y@230@01))
  :pattern ((img@232@01 y@230@01))
  :qid |quant-u-181|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@232@01 x) (not (= (inv@231@01 x) x@221@01)))
    (= (inv@231@01 x) x))
  :pattern ((inv@231@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
; [exec]
; assert (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const y@233@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@234@01 ($Ref) $Ref)
(declare-fun img@235@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@233@01 $Ref)) (!
  (and (= (inv@234@01 y@233@01) y@233@01) (img@235@01 y@233@01))
  :pattern ((inv@234@01 y@233@01))
  :pattern ((img@235@01 y@233@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@235@01 x) (= (inv@234@01 x) x))
  :pattern ((inv@234@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-183|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (and (img@235@01 x) (= x (inv@234@01 x))) false)
  
  :qid |quant-u-184|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@236@01 $PSF<Cell>)
(declare-const s@237@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@238@01 ($Ref) $Ref)
(declare-fun img@239@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@240@01 ((x $Ref)) $Perm
  (ite
    (and (img@235@01 x) (= x (inv@234@01 x)))
    ($Perm.min
      (ite
        (and (img@232@01 x) (not (= (inv@231@01 x) x@221@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@232@01 x) (not (= (inv@231@01 x) x@221@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@240@01 x))
    $Perm.No)
  
  :qid |quant-u-186|))))
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
    (and (img@235@01 x) (= x (inv@234@01 x)))
    (= (- $Perm.Write (pTaken@240@01 x)) $Perm.No))
  
  :qid |quant-u-187|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@235@01 x) (= x (inv@234@01 x)))
    (= (- $Perm.Write (pTaken@240@01 x)) $Perm.No))
  
  :qid |quant-u-187|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@241@01 $PSF<Cell>)
(declare-const s@242@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@242@01 $Snap)) (!
  (=>
    (and
      (img@232@01 ($SortWrappers.$SnapTo$Ref s@242@01))
      (not (= (inv@231@01 ($SortWrappers.$SnapTo$Ref s@242@01)) x@221@01)))
    (and
      (not (= s@242@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@241@01  $PSF<Cell>) s@242@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@229@01) s@242@01))))
  :pattern (($PSF.lookup_Cell (as sm@241@01  $PSF<Cell>) s@242@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@229@01) s@242@01))
  :qid |qp.psmValDef28|)))
(declare-fun inv@243@01 ($Ref) $Ref)
(declare-fun img@244@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (and (img@244@01 x) (< $Perm.No (pTaken@240@01 x))) (= (inv@243@01 x) x))
  :pattern ((inv@243@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@233@01 $Ref)) (!
  (=>
    (< $Perm.No (pTaken@240@01 y@233@01))
    (and (= (inv@243@01 y@233@01) y@233@01) (img@244@01 y@233@01)))
  :pattern ((inv@243@01 y@233@01))
  :pattern ((img@244@01 y@233@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@236@01  $PSF<Cell>) (as sm@241@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@245@01 ((x $Ref)) $Perm
  (ite
    (and (img@235@01 x) (= x (inv@234@01 x)))
    ($Perm.min
      (ite (img@225@01 x) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@240@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@225@01 x) $Perm.Write $Perm.No) (pTaken@245@01 x)) $Perm.No)
  
  :qid |quant-u-189|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@245@01 x) $Perm.No)
  
  :qid |quant-u-190|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@235@01 x) (= x (inv@234@01 x)))
    (= (- (- $Perm.Write (pTaken@240@01 x)) (pTaken@245@01 x)) $Perm.No))
  
  :qid |quant-u-191|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@246@01 $PSF<Cell>)
(declare-const s@247@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@247@01 $Snap)) (!
  (=>
    (img@225@01 ($SortWrappers.$SnapTo$Ref s@247@01))
    (and
      (not (= s@247@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@246@01  $PSF<Cell>) s@247@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@222@01)) s@247@01))))
  :pattern (($PSF.lookup_Cell (as sm@246@01  $PSF<Cell>) s@247@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@222@01)) s@247@01))
  :qid |qp.psmValDef29|)))
(declare-fun inv@248@01 ($Ref) $Ref)
(declare-fun img@249@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@249@01 x) (< $Perm.No (- $Perm.Write (pTaken@240@01 x))))
    (= (inv@248@01 x) x))
  :pattern ((inv@248@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@233@01 $Ref)) (!
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@240@01 y@233@01)))
    (and (= (inv@248@01 y@233@01) y@233@01) (img@249@01 y@233@01)))
  :pattern ((inv@248@01 y@233@01))
  :pattern ((img@249@01 y@233@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@236@01  $PSF<Cell>) (as sm@246@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@244@01 x) (img@239@01 x))
  
  :qid |quant-u-192|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@249@01 x) (img@244@01 x))
  
  :qid |quant-u-193|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@249@01 x) (img@239@01 x))
  
  :qid |quant-u-194|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@244@01 x) (img@249@01 x))
  
  :qid |quant-u-195|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@239@01 x) (img@244@01 x))
  
  :qid |quant-u-196|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@239@01 x) (img@249@01 x))
  
  :qid |quant-u-197|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; assert get(x) == 0
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@250@01 ((x $Ref)) $Perm
  (ite
    (= x x@221@01)
    ($Perm.min
      (ite (img@249@01 x) (- $Perm.Write (pTaken@240@01 x)) $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@251@01 ((x $Ref)) $Perm
  (ite
    (= x x@221@01)
    ($Perm.min
      (ite (img@244@01 x) (pTaken@240@01 x) $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@250@01 x)))
    $Perm.No))
(define-fun pTaken@252@01 ((x $Ref)) $Perm
  (ite
    (= x x@221@01)
    ($Perm.min
      $Perm.No
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@250@01 x)) (pTaken@251@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@249@01 x) (- $Perm.Write (pTaken@240@01 x)) $Perm.No)
      (pTaken@250@01 x))
    $Perm.No)
  
  :qid |quant-u-199|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@250@01 x) $Perm.No)
  
  :qid |quant-u-200|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@221@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@250@01 x)) $Perm.No))
  
  :qid |quant-u-201|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@253@01 $PSF<Cell>)
(declare-const s@254@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (img@249@01 x@221@01)
    (< $Perm.No (- $Perm.Write (pTaken@240@01 x@221@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@221@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@253@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))
      ($PSF.lookup_Cell (as sm@246@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))))))
(assert (=>
  (ite (img@244@01 x@221@01) (< $Perm.No (pTaken@240@01 x@221@01)) false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@221@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@253@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))
      ($PSF.lookup_Cell (as sm@241@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@253@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))) x@221@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (ite
      (img@249@01 x@221@01)
      (< $Perm.No (- $Perm.Write (pTaken@240@01 x@221@01)))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@221@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@253@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))
        ($PSF.lookup_Cell (as sm@246@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01)))))
  (=>
    (ite (img@244@01 x@221@01) (< $Perm.No (pTaken@240@01 x@221@01)) false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@221@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@253@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))
        ($PSF.lookup_Cell (as sm@241@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@253@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))) x@221@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@253@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))) x@221@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@253@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@221@01))) x@221@01)
  0))
; Create MagicWandSnapFunction for wand (forall y: Ref ::y != x ==> acc(Cell(y), write)) --* true
(declare-const mwsf@255@01 $MWSF)
(assert (forall (($t@229@01 $Snap)) (!
  (= (MWSF_apply mwsf@255@01 $t@229@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@255@01 $t@229@01))
  :qid |quant-u-202|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@229@01 $Snap)) (!
  (and
    (forall ((s@242@01 $Snap)) (!
      (=>
        (and
          (img@232@01 ($SortWrappers.$SnapTo$Ref s@242@01))
          (not (= (inv@231@01 ($SortWrappers.$SnapTo$Ref s@242@01)) x@221@01)))
        (and
          (not (= s@242@01 $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@241@01  $PSF<Cell>) s@242@01)
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@229@01) s@242@01))))
      :pattern (($PSF.lookup_Cell (as sm@241@01  $PSF<Cell>) s@242@01))
      :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@229@01) s@242@01))
      :qid |qp.psmValDef28|))
    (= (MWSF_apply mwsf@255@01 $t@229@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@255@01 $t@229@01))
  :qid |quant-u-203|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@232@01 x) (not (= (inv@231@01 x) x@221@01)))
    (= (inv@231@01 x) x))
  :pattern ((inv@231@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@230@01 $Ref)) (!
  (=>
    (not (= y@230@01 x@221@01))
    (and (= (inv@231@01 y@230@01) y@230@01) (img@232@01 y@230@01)))
  :pattern ((inv@231@01 y@230@01))
  :pattern ((img@232@01 y@230@01))
  :qid |quant-u-181|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@244@01 x) (< $Perm.No (pTaken@240@01 x))) (= (inv@243@01 x) x))
  :pattern ((inv@243@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@233@01 $Ref)) (!
  (=>
    (< $Perm.No (pTaken@240@01 y@233@01))
    (and (= (inv@243@01 y@233@01) y@233@01) (img@244@01 y@233@01)))
  :pattern ((inv@243@01 y@233@01))
  :pattern ((img@244@01 y@233@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((s@247@01 $Snap)) (!
  (=>
    (img@225@01 ($SortWrappers.$SnapTo$Ref s@247@01))
    (and
      (not (= s@247@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@246@01  $PSF<Cell>) s@247@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@222@01)) s@247@01))))
  :pattern (($PSF.lookup_Cell (as sm@246@01  $PSF<Cell>) s@247@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@222@01)) s@247@01))
  :qid |qp.psmValDef29|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@249@01 x) (< $Perm.No (- $Perm.Write (pTaken@240@01 x))))
    (= (inv@248@01 x) x))
  :pattern ((inv@248@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@233@01 $Ref)) (!
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@240@01 y@233@01)))
    (and (= (inv@248@01 y@233@01) y@233@01) (img@249@01 y@233@01)))
  :pattern ((inv@248@01 y@233@01))
  :pattern ((img@249@01 y@233@01))
  :qid |Cell-invOfFct|)))
(assert (and
  (= (as sm@236@01  $PSF<Cell>) (as sm@241@01  $PSF<Cell>))
  (= (as sm@236@01  $PSF<Cell>) (as sm@246@01  $PSF<Cell>))))
; [exec]
; assert (forall y: Ref ::y != x ==> acc(Cell(y), write))
(declare-const y@256@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@256@01 x@221@01)))
(pop) ; 4
(declare-fun inv@257@01 ($Ref) $Ref)
(declare-fun img@258@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@256@01 $Ref) (y2@256@01 $Ref)) (!
  (=>
    (and
      (not (= y1@256@01 x@221@01))
      (not (= y2@256@01 x@221@01))
      (= y1@256@01 y2@256@01))
    (= y1@256@01 y2@256@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@256@01 $Ref)) (!
  (=>
    (not (= y@256@01 x@221@01))
    (and (= (inv@257@01 y@256@01) y@256@01) (img@258@01 y@256@01)))
  :pattern ((inv@257@01 y@256@01))
  :pattern ((img@258@01 y@256@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@258@01 x) (not (= (inv@257@01 x) x@221@01)))
    (= (inv@257@01 x) x))
  :pattern ((inv@257@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@259@01 ((x $Ref)) $Perm
  (ite
    (and (not (= (inv@257@01 x) x@221@01)) (img@258@01 x) (= x (inv@257@01 x)))
    ($Perm.min
      (ite (img@225@01 x) (- $Perm.Write (pTaken@245@01 x)) $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@225@01 x) (- $Perm.Write (pTaken@245@01 x)) $Perm.No)
      (pTaken@259@01 x))
    $Perm.No)
  
  :qid |quant-u-206|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@259@01 x) $Perm.No)
  
  :qid |quant-u-207|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (not (= (inv@257@01 x) x@221@01)) (img@258@01 x) (= x (inv@257@01 x)))
    (= (- $Perm.Write (pTaken@259@01 x)) $Perm.No))
  
  :qid |quant-u-208|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@260@01 $PSF<Cell>)
(declare-const s@261@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@261@01 $Snap)) (!
  (=>
    (ite
      (img@225@01 ($SortWrappers.$SnapTo$Ref s@261@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@245@01 ($SortWrappers.$SnapTo$Ref s@261@01))))
      false)
    (and
      (not (= s@261@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@260@01  $PSF<Cell>) s@261@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@222@01)) s@261@01))))
  :pattern (($PSF.lookup_Cell (as sm@260@01  $PSF<Cell>) s@261@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@222@01)) s@261@01))
  :qid |qp.psmValDef33|)))
; [exec]
; assert (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const y@262@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@263@01 ($Ref) $Ref)
(declare-fun img@264@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@262@01 $Ref)) (!
  (and (= (inv@263@01 y@262@01) y@262@01) (img@264@01 y@262@01))
  :pattern ((inv@263@01 y@262@01))
  :pattern ((img@264@01 y@262@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@264@01 x) (= (inv@263@01 x) x))
  :pattern ((inv@263@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@265@01 ((x $Ref)) $Perm
  (ite
    (and (img@264@01 x) (= x (inv@263@01 x)))
    ($Perm.min
      (ite (img@225@01 x) (- $Perm.Write (pTaken@245@01 x)) $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@225@01 x) (- $Perm.Write (pTaken@245@01 x)) $Perm.No)
      (pTaken@265@01 x))
    $Perm.No)
  
  :qid |quant-u-211|))))
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
    (and (img@264@01 x) (= x (inv@263@01 x)))
    (= (- $Perm.Write (pTaken@265@01 x)) $Perm.No))
  
  :qid |quant-u-212|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@264@01 x) (= x (inv@263@01 x)))
    (= (- $Perm.Write (pTaken@265@01 x)) $Perm.No))
  
  :qid |quant-u-212|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const y@266@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@267@01 ($Ref) $Ref)
(declare-fun img@268@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@266@01 $Ref)) (!
  (and (= (inv@267@01 y@266@01) y@266@01) (img@268@01 y@266@01))
  :pattern ((inv@267@01 y@266@01))
  :pattern ((img@268@01 y@266@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@268@01 x) (= (inv@267@01 x) x))
  :pattern ((inv@267@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@269@01 ((x $Ref)) $Perm
  (ite
    (and (img@268@01 x) (= x (inv@267@01 x)))
    ($Perm.min
      (ite (img@225@01 x) (- $Perm.Write (pTaken@245@01 x)) $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@225@01 x) (- $Perm.Write (pTaken@245@01 x)) $Perm.No)
      (pTaken@269@01 x))
    $Perm.No)
  
  :qid |quant-u-215|))))
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
    (and (img@268@01 x) (= x (inv@267@01 x)))
    (= (- $Perm.Write (pTaken@269@01 x)) $Perm.No))
  
  :qid |quant-u-216|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@268@01 x) (= x (inv@267@01 x)))
    (= (- $Perm.Write (pTaken@269@01 x)) $Perm.No))
  
  :qid |quant-u-216|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const x@270@01 $Ref)
(declare-const x@271@01 $Ref)
(push) ; 1
(declare-const y@272@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-const $t@273@01 $PSF<Cell>)
(declare-fun inv@274@01 ($Ref) $Ref)
(declare-fun img@275@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@272@01 $Ref)) (!
  (and (= (inv@274@01 y@272@01) y@272@01) (img@275@01 y@272@01))
  :pattern ((inv@274@01 y@272@01))
  :pattern ((img@275@01 y@272@01))
  :qid |quant-u-218|)))
(assert (forall ((x $Ref)) (!
  (=> (img@275@01 x) (= (inv@274@01 x) x))
  :pattern ((inv@274@01 x))
  :qid |Cell-fctOfInv|)))
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
; package (forall y: Ref ::y != x ==> acc(Cell(y), 1 / 2)) --*
; (forall y: Ref ::true ==> acc(Cell(y), write)) {
; }
(push) ; 3
(declare-const $t@276@01 $Snap)
(declare-const y@277@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@277@01 x@271@01)))
(pop) ; 4
(declare-fun inv@278@01 ($Ref) $Ref)
(declare-fun img@279@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@277@01 $Ref) (y2@277@01 $Ref)) (!
  (=>
    (and
      (not (= y1@277@01 x@271@01))
      (not (= y2@277@01 x@271@01))
      (= y1@277@01 y2@277@01))
    (= y1@277@01 y2@277@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@277@01 $Ref)) (!
  (=>
    (not (= y@277@01 x@271@01))
    (and (= (inv@278@01 y@277@01) y@277@01) (img@279@01 y@277@01)))
  :pattern ((inv@278@01 y@277@01))
  :pattern ((img@279@01 y@277@01))
  :qid |quant-u-220|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@279@01 x) (not (= (inv@278@01 x) x@271@01)))
    (= (inv@278@01 x) x))
  :pattern ((inv@278@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(declare-const y@280@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@281@01 ($Ref) $Ref)
(declare-fun img@282@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@280@01 $Ref)) (!
  (and (= (inv@281@01 y@280@01) y@280@01) (img@282@01 y@280@01))
  :pattern ((inv@281@01 y@280@01))
  :pattern ((img@282@01 y@280@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@282@01 x) (= (inv@281@01 x) x))
  :pattern ((inv@281@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-222|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (and (img@282@01 x) (= x (inv@281@01 x))) false)
  
  :qid |quant-u-223|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@283@01 $PSF<Cell>)
(declare-const s@284@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@285@01 ($Ref) $Ref)
(declare-fun img@286@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@287@01 ((x $Ref)) $Perm
  (ite
    (and (img@282@01 x) (= x (inv@281@01 x)))
    ($Perm.min
      (ite
        (and (img@279@01 x) (not (= (inv@278@01 x) x@271@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@279@01 x) (not (= (inv@278@01 x) x@271@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@287@01 x))
    $Perm.No)
  
  :qid |quant-u-225|))))
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
    (and (img@282@01 x) (= x (inv@281@01 x)))
    (= (- $Perm.Write (pTaken@287@01 x)) $Perm.No))
  
  :qid |quant-u-226|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@282@01 x) (= x (inv@281@01 x)))
    (= (- $Perm.Write (pTaken@287@01 x)) $Perm.No))
  
  :qid |quant-u-226|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@288@01 $PSF<Cell>)
(declare-const s@289@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@289@01 $Snap)) (!
  (=>
    (and
      (img@279@01 ($SortWrappers.$SnapTo$Ref s@289@01))
      (not (= (inv@278@01 ($SortWrappers.$SnapTo$Ref s@289@01)) x@271@01)))
    (and
      (not (= s@289@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@288@01  $PSF<Cell>) s@289@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@276@01) s@289@01))))
  :pattern (($PSF.lookup_Cell (as sm@288@01  $PSF<Cell>) s@289@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@276@01) s@289@01))
  :qid |qp.psmValDef34|)))
(declare-fun inv@290@01 ($Ref) $Ref)
(declare-fun img@291@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (and (img@291@01 x) (< $Perm.No (pTaken@287@01 x))) (= (inv@290@01 x) x))
  :pattern ((inv@290@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@280@01 $Ref)) (!
  (=>
    (< $Perm.No (pTaken@287@01 y@280@01))
    (and (= (inv@290@01 y@280@01) y@280@01) (img@291@01 y@280@01)))
  :pattern ((inv@290@01 y@280@01))
  :pattern ((img@291@01 y@280@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@283@01  $PSF<Cell>) (as sm@288@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@292@01 ((x $Ref)) $Perm
  (ite
    (and (img@282@01 x) (= x (inv@281@01 x)))
    ($Perm.min
      (ite (img@275@01 x) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@287@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@275@01 x) $Perm.Write $Perm.No) (pTaken@292@01 x)) $Perm.No)
  
  :qid |quant-u-228|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@292@01 x) $Perm.No)
  
  :qid |quant-u-229|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@282@01 x) (= x (inv@281@01 x)))
    (= (- (- $Perm.Write (pTaken@287@01 x)) (pTaken@292@01 x)) $Perm.No))
  
  :qid |quant-u-230|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@293@01 $PSF<Cell>)
(declare-const s@294@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@294@01 $Snap)) (!
  (=>
    (img@275@01 ($SortWrappers.$SnapTo$Ref s@294@01))
    (and
      (not (= s@294@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@293@01  $PSF<Cell>) s@294@01)
        ($PSF.lookup_Cell $t@273@01 s@294@01))))
  :pattern (($PSF.lookup_Cell (as sm@293@01  $PSF<Cell>) s@294@01))
  :pattern (($PSF.lookup_Cell $t@273@01 s@294@01))
  :qid |qp.psmValDef35|)))
(declare-fun inv@295@01 ($Ref) $Ref)
(declare-fun img@296@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@296@01 x) (< $Perm.No (- $Perm.Write (pTaken@287@01 x))))
    (= (inv@295@01 x) x))
  :pattern ((inv@295@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@280@01 $Ref)) (!
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@287@01 y@280@01)))
    (and (= (inv@295@01 y@280@01) y@280@01) (img@296@01 y@280@01)))
  :pattern ((inv@295@01 y@280@01))
  :pattern ((img@296@01 y@280@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@283@01  $PSF<Cell>) (as sm@293@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@291@01 x) (img@286@01 x))
  
  :qid |quant-u-231|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@296@01 x) (img@291@01 x))
  
  :qid |quant-u-232|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@296@01 x) (img@286@01 x))
  
  :qid |quant-u-233|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand (forall y: Ref ::y != x ==> acc(Cell(y), 1 / 2)) --* (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const mwsf@297@01 $MWSF)
(assert (forall (($t@276@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@297@01 $t@276@01)
    ($SortWrappers.$PSF<Cell>To$Snap (as sm@293@01  $PSF<Cell>)))
  :pattern ((MWSF_apply mwsf@297@01 $t@276@01))
  :qid |quant-u-234|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@276@01 $Snap)) (!
  (and
    (forall ((s@289@01 $Snap)) (!
      (=>
        (and
          (img@279@01 ($SortWrappers.$SnapTo$Ref s@289@01))
          (not (= (inv@278@01 ($SortWrappers.$SnapTo$Ref s@289@01)) x@271@01)))
        (and
          (not (= s@289@01 $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@288@01  $PSF<Cell>) s@289@01)
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@276@01) s@289@01))))
      :pattern (($PSF.lookup_Cell (as sm@288@01  $PSF<Cell>) s@289@01))
      :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@276@01) s@289@01))
      :qid |qp.psmValDef34|))
    (=
      (MWSF_apply mwsf@297@01 $t@276@01)
      ($SortWrappers.$PSF<Cell>To$Snap (as sm@293@01  $PSF<Cell>))))
  :pattern ((MWSF_apply mwsf@297@01 $t@276@01))
  :qid |quant-u-235|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@279@01 x) (not (= (inv@278@01 x) x@271@01)))
    (= (inv@278@01 x) x))
  :pattern ((inv@278@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@277@01 $Ref)) (!
  (=>
    (not (= y@277@01 x@271@01))
    (and (= (inv@278@01 y@277@01) y@277@01) (img@279@01 y@277@01)))
  :pattern ((inv@278@01 y@277@01))
  :pattern ((img@279@01 y@277@01))
  :qid |quant-u-220|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@291@01 x) (< $Perm.No (pTaken@287@01 x))) (= (inv@290@01 x) x))
  :pattern ((inv@290@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@280@01 $Ref)) (!
  (=>
    (< $Perm.No (pTaken@287@01 y@280@01))
    (and (= (inv@290@01 y@280@01) y@280@01) (img@291@01 y@280@01)))
  :pattern ((inv@290@01 y@280@01))
  :pattern ((img@291@01 y@280@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((s@294@01 $Snap)) (!
  (=>
    (img@275@01 ($SortWrappers.$SnapTo$Ref s@294@01))
    (and
      (not (= s@294@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@293@01  $PSF<Cell>) s@294@01)
        ($PSF.lookup_Cell $t@273@01 s@294@01))))
  :pattern (($PSF.lookup_Cell (as sm@293@01  $PSF<Cell>) s@294@01))
  :pattern (($PSF.lookup_Cell $t@273@01 s@294@01))
  :qid |qp.psmValDef35|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@296@01 x) (< $Perm.No (- $Perm.Write (pTaken@287@01 x))))
    (= (inv@295@01 x) x))
  :pattern ((inv@295@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@280@01 $Ref)) (!
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@287@01 y@280@01)))
    (and (= (inv@295@01 y@280@01) y@280@01) (img@296@01 y@280@01)))
  :pattern ((inv@295@01 y@280@01))
  :pattern ((img@296@01 y@280@01))
  :qid |Cell-invOfFct|)))
(assert (and
  (= (as sm@283@01  $PSF<Cell>) (as sm@288@01  $PSF<Cell>))
  (= (as sm@283@01  $PSF<Cell>) (as sm@293@01  $PSF<Cell>))))
; [exec]
; assert (forall y: Ref ::y != x ==> acc(Cell(y), 1 / 2))
(declare-const y@298@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@298@01 x@271@01)))
(pop) ; 4
(declare-fun inv@299@01 ($Ref) $Ref)
(declare-fun img@300@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@298@01 $Ref) (y2@298@01 $Ref)) (!
  (=>
    (and
      (not (= y1@298@01 x@271@01))
      (not (= y2@298@01 x@271@01))
      (= y1@298@01 y2@298@01))
    (= y1@298@01 y2@298@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@298@01 $Ref)) (!
  (=>
    (not (= y@298@01 x@271@01))
    (and (= (inv@299@01 y@298@01) y@298@01) (img@300@01 y@298@01)))
  :pattern ((inv@299@01 y@298@01))
  :pattern ((img@300@01 y@298@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@300@01 x) (not (= (inv@299@01 x) x@271@01)))
    (= (inv@299@01 x) x))
  :pattern ((inv@299@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@301@01 ((x $Ref)) $Perm
  (ite
    (and (not (= (inv@299@01 x) x@271@01)) (img@300@01 x) (= x (inv@299@01 x)))
    ($Perm.min
      (ite (img@275@01 x) (- $Perm.Write (pTaken@292@01 x)) $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
      (ite (img@275@01 x) (- $Perm.Write (pTaken@292@01 x)) $Perm.No)
      (pTaken@301@01 x))
    $Perm.No)
  
  :qid |quant-u-238|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@301@01 x) $Perm.No)
  
  :qid |quant-u-239|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (not (= (inv@299@01 x) x@271@01)) (img@300@01 x) (= x (inv@299@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@301@01 x)) $Perm.No))
  
  :qid |quant-u-240|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@302@01 $PSF<Cell>)
(declare-const s@303@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@303@01 $Snap)) (!
  (=>
    (ite
      (img@275@01 ($SortWrappers.$SnapTo$Ref s@303@01))
      (<
        $Perm.No
        (- $Perm.Write (pTaken@292@01 ($SortWrappers.$SnapTo$Ref s@303@01))))
      false)
    (and
      (not (= s@303@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@302@01  $PSF<Cell>) s@303@01)
        ($PSF.lookup_Cell $t@273@01 s@303@01))))
  :pattern (($PSF.lookup_Cell (as sm@302@01  $PSF<Cell>) s@303@01))
  :pattern (($PSF.lookup_Cell $t@273@01 s@303@01))
  :qid |qp.psmValDef36|)))
; [exec]
; assert (forall y: Ref ::true ==> acc(Cell(y), 1 / 2))
(declare-const y@304@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@305@01 ($Ref) $Ref)
(declare-fun img@306@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@304@01 $Ref)) (!
  (and (= (inv@305@01 y@304@01) y@304@01) (img@306@01 y@304@01))
  :pattern ((inv@305@01 y@304@01))
  :pattern ((img@306@01 y@304@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@306@01 x) (= (inv@305@01 x) x))
  :pattern ((inv@305@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@307@01 ((x $Ref)) $Perm
  (ite
    (and (img@306@01 x) (= x (inv@305@01 x)))
    ($Perm.min
      (ite (img@275@01 x) (- $Perm.Write (pTaken@292@01 x)) $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
      (ite (img@275@01 x) (- $Perm.Write (pTaken@292@01 x)) $Perm.No)
      (pTaken@307@01 x))
    $Perm.No)
  
  :qid |quant-u-243|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@307@01 x) $Perm.No)
  
  :qid |quant-u-244|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@306@01 x) (= x (inv@305@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@307@01 x)) $Perm.No))
  
  :qid |quant-u-245|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@306@01 x) (= x (inv@305@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@307@01 x)) $Perm.No))
  
  :qid |quant-u-245|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const y@308@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@309@01 ($Ref) $Ref)
(declare-fun img@310@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@308@01 $Ref)) (!
  (and (= (inv@309@01 y@308@01) y@308@01) (img@310@01 y@308@01))
  :pattern ((inv@309@01 y@308@01))
  :pattern ((img@310@01 y@308@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@310@01 x) (= (inv@309@01 x) x))
  :pattern ((inv@309@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@311@01 ((x $Ref)) $Perm
  (ite
    (and (img@310@01 x) (= x (inv@309@01 x)))
    ($Perm.min
      (ite (img@275@01 x) (- $Perm.Write (pTaken@292@01 x)) $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
      (ite (img@275@01 x) (- $Perm.Write (pTaken@292@01 x)) $Perm.No)
      (pTaken@311@01 x))
    $Perm.No)
  
  :qid |quant-u-248|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@311@01 x) $Perm.No)
  
  :qid |quant-u-249|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@310@01 x) (= x (inv@309@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@311@01 x)) $Perm.No))
  
  :qid |quant-u-250|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@310@01 x) (= x (inv@309@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@311@01 x)) $Perm.No))
  
  :qid |quant-u-250|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test6 ----------
(declare-const x@312@01 $Ref)
(declare-const x@313@01 $Ref)
(push) ; 1
(declare-const $t@314@01 $Snap)
(assert (= $t@314@01 ($Snap.combine ($Snap.first $t@314@01) ($Snap.second $t@314@01))))
(declare-const y@315@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@316@01 ($Ref) $Ref)
(declare-fun img@317@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@315@01 $Ref)) (!
  (and (= (inv@316@01 y@315@01) y@315@01) (img@317@01 y@315@01))
  :pattern ((inv@316@01 y@315@01))
  :pattern ((img@317@01 y@315@01))
  :qid |quant-u-252|)))
(assert (forall ((x $Ref)) (!
  (=> (img@317@01 x) (= (inv@316@01 x) x))
  :pattern ((inv@316@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@314@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@318@01 ((x $Ref)) $Perm
  (ite
    (= x x@313@01)
    ($Perm.min
      (ite (img@317@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
      (ite (img@317@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@318@01 x))
    $Perm.No)
  
  :qid |quant-u-254|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@318@01 x) $Perm.No)
  
  :qid |quant-u-255|))))
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
  (=>
    (= x x@313@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@318@01 x)) $Perm.No))
  
  :qid |quant-u-256|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@319@01 $PSF<Cell>)
(declare-const s@320@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@317@01 x@313@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@319@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@314@01)) ($SortWrappers.$RefTo$Snap x@313@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@319@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))) x@313@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@317@01 x@313@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@319@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@314@01)) ($SortWrappers.$RefTo$Snap x@313@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@319@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))) x@313@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@319@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))) x@313@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package (forall y: Ref ::true ==> acc(Cell(y), 1 / 2)) --* true {
;   assert acc(Cell(x), write) && get(x) == 0
; }
(push) ; 3
(declare-const $t@321@01 $Snap)
(declare-const y@322@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@323@01 ($Ref) $Ref)
(declare-fun img@324@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@322@01 $Ref)) (!
  (and (= (inv@323@01 y@322@01) y@322@01) (img@324@01 y@322@01))
  :pattern ((inv@323@01 y@322@01))
  :pattern ((img@324@01 y@322@01))
  :qid |quant-u-258|)))
(assert (forall ((x $Ref)) (!
  (=> (img@324@01 x) (= (inv@323@01 x) x))
  :pattern ((inv@323@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
; [exec]
; assert acc(Cell(x), write) && get(x) == 0
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@313@01) false)
  
  :qid |quant-u-259|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@325@01 $PSF<Cell>)
(declare-const s@326@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@327@01 ((x $Ref)) $Perm
  (ite
    (= x x@313@01)
    ($Perm.min
      (ite (img@324@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@324@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@327@01 x))
    $Perm.No)
  
  :qid |quant-u-261|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@327@01 x) $Perm.No)
  
  :qid |quant-u-262|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@313@01) (= (- $Perm.Write (pTaken@327@01 x)) $Perm.No))
  
  :qid |quant-u-263|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@313@01) (= (- $Perm.Write (pTaken@327@01 x)) $Perm.No))
  
  :qid |quant-u-263|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@328@01 $PSF<Cell>)
(declare-const s@329@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@324@01 x@313@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@328@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@321@01) ($SortWrappers.$RefTo$Snap x@313@01))))))
(assert (= (as sm@325@01  $PSF<Cell>) (as sm@328@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@330@01 ((x $Ref)) $Perm
  (ite
    (= x x@313@01)
    ($Perm.min
      (ite (img@317@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (- $Perm.Write (pTaken@327@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@317@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@330@01 x))
    $Perm.No)
  
  :qid |quant-u-265|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@330@01 x) $Perm.No)
  
  :qid |quant-u-266|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@313@01)
    (= (- (- $Perm.Write (pTaken@327@01 x)) (pTaken@330@01 x)) $Perm.No))
  
  :qid |quant-u-267|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@331@01 $PSF<Cell>)
(declare-const s@332@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@317@01 x@313@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@331@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@314@01)) ($SortWrappers.$RefTo$Snap x@313@01))))))
(assert (= (as sm@325@01  $PSF<Cell>) (as sm@331@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@333@01 $PSF<Cell>)
(declare-const $t@334@01 $PSF<Cell>)
(assert (forall ((x $Ref)) (!
  (=>
    (ite (= x x@313@01) (< $Perm.No (pTaken@327@01 x)) false)
    (=
      ($PSF.lookup_Cell $t@333@01 ($SortWrappers.$RefTo$Snap x))
      ($PSF.lookup_Cell (as sm@328@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x))))
  :pattern (($PSF.lookup_Cell (as sm@325@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@328@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@333@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-268|)))
(assert (forall ((x $Ref)) (!
  (and
    (=>
      (ite (= x x@313@01) (< $Perm.No (pTaken@327@01 x)) false)
      (=
        ($PSF.lookup_Cell $t@334@01 ($SortWrappers.$RefTo$Snap x))
        ($PSF.lookup_Cell $t@333@01 ($SortWrappers.$RefTo$Snap x))))
    (=>
      (ite (= x x@313@01) (< $Perm.No (- $Perm.Write (pTaken@327@01 x))) false)
      (=
        ($PSF.lookup_Cell $t@334@01 ($SortWrappers.$RefTo$Snap x))
        ($PSF.lookup_Cell (as sm@331@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))))
  :pattern (($PSF.lookup_Cell $t@333@01 ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@331@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@334@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-269|)))
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@335@01 ((x $Ref)) $Perm
  (ite
    (= x x@313@01)
    ($Perm.min
      (ite (= x x@313@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@336@01 ((x $Ref)) $Perm
  (ite
    (= x x@313@01)
    ($Perm.min
      (ite
        (img@324@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@327@01 x))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@335@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@335@01 x@313@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@335@01 x) $Perm.No)
  
  :qid |quant-u-272|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@313@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@335@01 x)) $Perm.No))
  
  :qid |quant-u-273|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@337@01 $PSF<Cell>)
(declare-const s@338@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (img@324@01 x@313@01)
    (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@327@01 x@313@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@337@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@321@01) ($SortWrappers.$RefTo$Snap x@313@01))))))
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@337@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
    ($PSF.lookup_Cell $t@334@01 ($SortWrappers.$RefTo$Snap x@313@01)))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@337@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))) x@313@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (ite
      (img@324@01 x@313@01)
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@327@01 x@313@01)))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@337@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@321@01) ($SortWrappers.$RefTo$Snap x@313@01)))))
  (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@337@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
    ($PSF.lookup_Cell $t@334@01 ($SortWrappers.$RefTo$Snap x@313@01)))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@337@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))) x@313@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@337@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))) x@313@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@337@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))) x@313@01)
  0))
; Create MagicWandSnapFunction for wand (forall y: Ref ::true ==> acc(Cell(y), 1 / 2)) --* true
(declare-const mwsf@339@01 $MWSF)
(assert (forall (($t@321@01 $Snap)) (!
  (= (MWSF_apply mwsf@339@01 $t@321@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@339@01 $t@321@01))
  :qid |quant-u-274|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@321@01 $Snap)) (!
  (and
    (and
      (=>
        (img@324@01 x@313@01)
        (and
          (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@328@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@321@01) ($SortWrappers.$RefTo$Snap x@313@01)))))
      (= (as sm@325@01  $PSF<Cell>) (as sm@328@01  $PSF<Cell>))
      (=>
        (img@317@01 x@313@01)
        (and
          (not (= ($SortWrappers.$RefTo$Snap x@313@01) $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@331@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@313@01))
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@314@01)) ($SortWrappers.$RefTo$Snap x@313@01)))))
      (= (as sm@325@01  $PSF<Cell>) (as sm@331@01  $PSF<Cell>)))
    (= (MWSF_apply mwsf@339@01 $t@321@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@339@01 $t@321@01))
  :qid |quant-u-275|)))
(assert (forall ((x $Ref)) (!
  (=> (img@324@01 x) (= (inv@323@01 x) x))
  :pattern ((inv@323@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@322@01 $Ref)) (!
  (and (= (inv@323@01 y@322@01) y@322@01) (img@324@01 y@322@01))
  :pattern ((inv@323@01 y@322@01))
  :pattern ((img@324@01 y@322@01))
  :qid |quant-u-258|)))
; [exec]
; assert (forall y: Ref ::y != x ==> acc(Cell(y), 1 / 2))
(declare-const y@340@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@340@01 x@313@01)))
(pop) ; 4
(declare-fun inv@341@01 ($Ref) $Ref)
(declare-fun img@342@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@340@01 $Ref) (y2@340@01 $Ref)) (!
  (=>
    (and
      (not (= y1@340@01 x@313@01))
      (not (= y2@340@01 x@313@01))
      (= y1@340@01 y2@340@01))
    (= y1@340@01 y2@340@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@340@01 $Ref)) (!
  (=>
    (not (= y@340@01 x@313@01))
    (and (= (inv@341@01 y@340@01) y@340@01) (img@342@01 y@340@01)))
  :pattern ((inv@341@01 y@340@01))
  :pattern ((img@342@01 y@340@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@342@01 x) (not (= (inv@341@01 x) x@313@01)))
    (= (inv@341@01 x) x))
  :pattern ((inv@341@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@343@01 ((x $Ref)) $Perm
  (ite
    (and (not (= (inv@341@01 x) x@313@01)) (img@342@01 x) (= x (inv@341@01 x)))
    ($Perm.min
      (ite
        (img@317@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@330@01 x))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (img@317@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@330@01 x))
        $Perm.No)
      (pTaken@343@01 x))
    $Perm.No)
  
  :qid |quant-u-278|))))
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
    (and (not (= (inv@341@01 x) x@313@01)) (img@342@01 x) (= x (inv@341@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@343@01 x)) $Perm.No))
  
  :qid |quant-u-279|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@344@01 $PSF<Cell>)
(declare-const s@345@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@345@01 $Snap)) (!
  (=>
    (ite
      (img@317@01 ($SortWrappers.$SnapTo$Ref s@345@01))
      (<
        $Perm.No
        (-
          (/ (to_real 1) (to_real 2))
          (pTaken@330@01 ($SortWrappers.$SnapTo$Ref s@345@01))))
      false)
    (and
      (not (= s@345@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@344@01  $PSF<Cell>) s@345@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@314@01)) s@345@01))))
  :pattern (($PSF.lookup_Cell (as sm@344@01  $PSF<Cell>) s@345@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@314@01)) s@345@01))
  :qid |qp.psmValDef42|)))
; [exec]
; assert (forall y: Ref ::true ==> acc(Cell(y), 1 / 2))
(declare-const y@346@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@347@01 ($Ref) $Ref)
(declare-fun img@348@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@346@01 $Ref)) (!
  (and (= (inv@347@01 y@346@01) y@346@01) (img@348@01 y@346@01))
  :pattern ((inv@347@01 y@346@01))
  :pattern ((img@348@01 y@346@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@348@01 x) (= (inv@347@01 x) x))
  :pattern ((inv@347@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@349@01 ((x $Ref)) $Perm
  (ite
    (and (img@348@01 x) (= x (inv@347@01 x)))
    ($Perm.min
      (ite
        (img@317@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@330@01 x))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (img@317@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@330@01 x))
        $Perm.No)
      (pTaken@349@01 x))
    $Perm.No)
  
  :qid |quant-u-282|))))
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
    (and (img@348@01 x) (= x (inv@347@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@349@01 x)) $Perm.No))
  
  :qid |quant-u-283|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@348@01 x) (= x (inv@347@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@349@01 x)) $Perm.No))
  
  :qid |quant-u-283|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const y@350@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@351@01 ($Ref) $Ref)
(declare-fun img@352@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@350@01 $Ref)) (!
  (and (= (inv@351@01 y@350@01) y@350@01) (img@352@01 y@350@01))
  :pattern ((inv@351@01 y@350@01))
  :pattern ((img@352@01 y@350@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@352@01 x) (= (inv@351@01 x) x))
  :pattern ((inv@351@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@353@01 ((x $Ref)) $Perm
  (ite
    (and (img@352@01 x) (= x (inv@351@01 x)))
    ($Perm.min
      (ite
        (img@317@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@330@01 x))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (img@317@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@330@01 x))
        $Perm.No)
      (pTaken@353@01 x))
    $Perm.No)
  
  :qid |quant-u-286|))))
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
    (and (img@352@01 x) (= x (inv@351@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@353@01 x)) $Perm.No))
  
  :qid |quant-u-287|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@352@01 x) (= x (inv@351@01 x)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@353@01 x)) $Perm.No))
  
  :qid |quant-u-287|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test7 ----------
(declare-const x@354@01 $Ref)
(declare-const x@355@01 $Ref)
(push) ; 1
(declare-const $t@356@01 $Snap)
(assert (= $t@356@01 ($Snap.combine ($Snap.first $t@356@01) ($Snap.second $t@356@01))))
(declare-const y@357@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@358@01 ($Ref) $Ref)
(declare-fun img@359@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@357@01 $Ref)) (!
  (and (= (inv@358@01 y@357@01) y@357@01) (img@359@01 y@357@01))
  :pattern ((inv@358@01 y@357@01))
  :pattern ((img@359@01 y@357@01))
  :qid |quant-u-289|)))
(assert (forall ((x $Ref)) (!
  (=> (img@359@01 x) (= (inv@358@01 x) x))
  :pattern ((inv@358@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@356@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@360@01 ((x $Ref)) $Perm
  (ite
    (= x x@355@01)
    ($Perm.min
      (ite (img@359@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
  (= (- (ite (img@359@01 x) $Perm.Write $Perm.No) (pTaken@360@01 x)) $Perm.No)
  
  :qid |quant-u-291|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@360@01 x) $Perm.No)
  
  :qid |quant-u-292|))))
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
  (=>
    (= x x@355@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@360@01 x)) $Perm.No))
  
  :qid |quant-u-293|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@361@01 $PSF<Cell>)
(declare-const s@362@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@359@01 x@355@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@355@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@361@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@356@01)) ($SortWrappers.$RefTo$Snap x@355@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@361@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))) x@355@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@359@01 x@355@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@355@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@361@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@356@01)) ($SortWrappers.$RefTo$Snap x@355@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@361@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))) x@355@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@361@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))) x@355@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package (forall y: Ref ::true ==> acc(Cell(y), write)) --*
; (forall y: Ref ::true ==> acc(Cell(y), write)) {
; }
(push) ; 3
(declare-const $t@363@01 $Snap)
(declare-const y@364@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@365@01 ($Ref) $Ref)
(declare-fun img@366@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@364@01 $Ref)) (!
  (and (= (inv@365@01 y@364@01) y@364@01) (img@366@01 y@364@01))
  :pattern ((inv@365@01 y@364@01))
  :pattern ((img@366@01 y@364@01))
  :qid |quant-u-295|)))
(assert (forall ((x $Ref)) (!
  (=> (img@366@01 x) (= (inv@365@01 x) x))
  :pattern ((inv@365@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(declare-const y@367@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@368@01 ($Ref) $Ref)
(declare-fun img@369@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@367@01 $Ref)) (!
  (and (= (inv@368@01 y@367@01) y@367@01) (img@369@01 y@367@01))
  :pattern ((inv@368@01 y@367@01))
  :pattern ((img@369@01 y@367@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@369@01 x) (= (inv@368@01 x) x))
  :pattern ((inv@368@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-297|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (and (img@369@01 x) (= x (inv@368@01 x))) false)
  
  :qid |quant-u-298|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@370@01 $PSF<Cell>)
(declare-const s@371@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@372@01 ($Ref) $Ref)
(declare-fun img@373@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@374@01 ((x $Ref)) $Perm
  (ite
    (and (img@369@01 x) (= x (inv@368@01 x)))
    ($Perm.min (ite (img@366@01 x) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@366@01 x) $Perm.Write $Perm.No) (pTaken@374@01 x)) $Perm.No)
  
  :qid |quant-u-300|))))
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
    (and (img@369@01 x) (= x (inv@368@01 x)))
    (= (- $Perm.Write (pTaken@374@01 x)) $Perm.No))
  
  :qid |quant-u-301|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@375@01 $PSF<Cell>)
(declare-const s@376@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@376@01 $Snap)) (!
  (=>
    (img@366@01 ($SortWrappers.$SnapTo$Ref s@376@01))
    (and
      (not (= s@376@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@375@01  $PSF<Cell>) s@376@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@363@01) s@376@01))))
  :pattern (($PSF.lookup_Cell (as sm@375@01  $PSF<Cell>) s@376@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@363@01) s@376@01))
  :qid |qp.psmValDef44|)))
(declare-fun inv@377@01 ($Ref) $Ref)
(declare-fun img@378@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (img@378@01 x) (= (inv@377@01 x) x))
  :pattern ((inv@377@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@367@01 $Ref)) (!
  (and (= (inv@377@01 y@367@01) y@367@01) (img@378@01 y@367@01))
  :pattern ((inv@377@01 y@367@01))
  :pattern ((img@378@01 y@367@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@370@01  $PSF<Cell>) (as sm@375@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@378@01 x) (img@373@01 x))
  
  :qid |quant-u-302|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand (forall y: Ref ::true ==> acc(Cell(y), write)) --* (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const mwsf@379@01 $MWSF)
(assert (forall (($t@363@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@379@01 $t@363@01)
    ($SortWrappers.$PSF<Cell>To$Snap (as sm@375@01  $PSF<Cell>)))
  :pattern ((MWSF_apply mwsf@379@01 $t@363@01))
  :qid |quant-u-303|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@363@01 $Snap)) (!
  (and
    (forall ((s@376@01 $Snap)) (!
      (=>
        (img@366@01 ($SortWrappers.$SnapTo$Ref s@376@01))
        (and
          (not (= s@376@01 $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@375@01  $PSF<Cell>) s@376@01)
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@363@01) s@376@01))))
      :pattern (($PSF.lookup_Cell (as sm@375@01  $PSF<Cell>) s@376@01))
      :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@363@01) s@376@01))
      :qid |qp.psmValDef44|))
    (=
      (MWSF_apply mwsf@379@01 $t@363@01)
      ($SortWrappers.$PSF<Cell>To$Snap (as sm@375@01  $PSF<Cell>))))
  :pattern ((MWSF_apply mwsf@379@01 $t@363@01))
  :qid |quant-u-304|)))
(assert (forall ((x $Ref)) (!
  (=> (img@366@01 x) (= (inv@365@01 x) x))
  :pattern ((inv@365@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@364@01 $Ref)) (!
  (and (= (inv@365@01 y@364@01) y@364@01) (img@366@01 y@364@01))
  :pattern ((inv@365@01 y@364@01))
  :pattern ((img@366@01 y@364@01))
  :qid |quant-u-295|)))
(assert (forall ((x $Ref)) (!
  (=> (img@378@01 x) (= (inv@377@01 x) x))
  :pattern ((inv@377@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@367@01 $Ref)) (!
  (and (= (inv@377@01 y@367@01) y@367@01) (img@378@01 y@367@01))
  :pattern ((inv@377@01 y@367@01))
  :pattern ((img@378@01 y@367@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@370@01  $PSF<Cell>) (as sm@375@01  $PSF<Cell>)))
; [exec]
; apply (forall y: Ref ::true ==> acc(Cell(y), write)) --*
;   (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const y@380@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@381@01 ($Ref) $Ref)
(declare-fun img@382@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@380@01 $Ref)) (!
  (and (= (inv@381@01 y@380@01) y@380@01) (img@382@01 y@380@01))
  :pattern ((inv@381@01 y@380@01))
  :pattern ((img@382@01 y@380@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@382@01 x) (= (inv@381@01 x) x))
  :pattern ((inv@381@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@383@01 ((x $Ref)) $Perm
  (ite
    (and (img@382@01 x) (= x (inv@381@01 x)))
    ($Perm.min (ite (img@359@01 x) $Perm.Write $Perm.No) $Perm.Write)
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
  (= (- (ite (img@359@01 x) $Perm.Write $Perm.No) (pTaken@383@01 x)) $Perm.No)
  
  :qid |quant-u-307|))))
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
    (and (img@382@01 x) (= x (inv@381@01 x)))
    (= (- $Perm.Write (pTaken@383@01 x)) $Perm.No))
  
  :qid |quant-u-308|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(assert (forall ((s@362@01 $Snap)) (!
  (=>
    (img@359@01 ($SortWrappers.$SnapTo$Ref s@362@01))
    (and
      (not (= s@362@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@361@01  $PSF<Cell>) s@362@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@356@01)) s@362@01))))
  :pattern (($PSF.lookup_Cell (as sm@361@01  $PSF<Cell>) s@362@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@356@01)) s@362@01))
  :qid |qp.psmValDef43|)))
(declare-const y@384@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@385@01 ($Ref) $Ref)
(declare-fun img@386@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@384@01 $Ref)) (!
  (and (= (inv@385@01 y@384@01) y@384@01) (img@386@01 y@384@01))
  :pattern ((inv@385@01 y@384@01))
  :pattern ((img@386@01 y@384@01))
  :qid |quant-u-310|)))
(assert (forall ((x $Ref)) (!
  (=> (img@386@01 x) (= (inv@385@01 x) x))
  :pattern ((inv@385@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert get(x) == 0
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@387@01 ((x $Ref)) $Perm
  (ite
    (= x x@355@01)
    ($Perm.min
      (ite (img@386@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@386@01 x) $Perm.Write $Perm.No) (pTaken@387@01 x)) $Perm.No)
  
  :qid |quant-u-312|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@387@01 x) $Perm.No)
  
  :qid |quant-u-313|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@355@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@387@01 x)) $Perm.No))
  
  :qid |quant-u-314|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@388@01 $PSF<Cell>)
(declare-const s@389@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@386@01 x@355@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@355@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@388@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> (MWSF_apply mwsf@379@01 ($SortWrappers.$PSF<Cell>To$Snap (as sm@361@01  $PSF<Cell>)))) ($SortWrappers.$RefTo$Snap x@355@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@388@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))) x@355@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (img@386@01 x@355@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@355@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@388@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> (MWSF_apply mwsf@379@01 ($SortWrappers.$PSF<Cell>To$Snap (as sm@361@01  $PSF<Cell>)))) ($SortWrappers.$RefTo$Snap x@355@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@388@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))) x@355@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@388@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))) x@355@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@388@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@355@01))) x@355@01)
  0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test8 ----------
(declare-const x@390@01 $Ref)
(declare-const x@391@01 $Ref)
(push) ; 1
(declare-const $t@392@01 $Snap)
(assert (= $t@392@01 ($Snap.combine ($Snap.first $t@392@01) ($Snap.second $t@392@01))))
(declare-const y@393@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@394@01 ($Ref) $Ref)
(declare-fun img@395@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@393@01 $Ref)) (!
  (and (= (inv@394@01 y@393@01) y@393@01) (img@395@01 y@393@01))
  :pattern ((inv@394@01 y@393@01))
  :pattern ((img@395@01 y@393@01))
  :qid |quant-u-316|)))
(assert (forall ((x $Ref)) (!
  (=> (img@395@01 x) (= (inv@394@01 x) x))
  :pattern ((inv@394@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@392@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@396@01 ((x $Ref)) $Perm
  (ite
    (= x x@391@01)
    ($Perm.min
      (ite (img@395@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
  (= (- (ite (img@395@01 x) $Perm.Write $Perm.No) (pTaken@396@01 x)) $Perm.No)
  
  :qid |quant-u-318|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@396@01 x) $Perm.No)
  
  :qid |quant-u-319|))))
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
  (=>
    (= x x@391@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@396@01 x)) $Perm.No))
  
  :qid |quant-u-320|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@397@01 $PSF<Cell>)
(declare-const s@398@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@395@01 x@391@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@391@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@397@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@392@01)) ($SortWrappers.$RefTo$Snap x@391@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@397@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))) x@391@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@395@01 x@391@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@391@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@397@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@392@01)) ($SortWrappers.$RefTo$Snap x@391@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@397@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))) x@391@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@397@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))) x@391@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* (forall y: Ref ::true ==> acc(Cell(y), write)) {
; }
(push) ; 3
(declare-const $t@399@01 $Snap)
(assert (= $t@399@01 $Snap.unit))
(declare-const y@400@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@401@01 ($Ref) $Ref)
(declare-fun img@402@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@400@01 $Ref)) (!
  (and (= (inv@401@01 y@400@01) y@400@01) (img@402@01 y@400@01))
  :pattern ((inv@401@01 y@400@01))
  :pattern ((img@402@01 y@400@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@402@01 x) (= (inv@401@01 x) x))
  :pattern ((inv@401@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-322|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (and (img@402@01 x) (= x (inv@401@01 x))) false)
  
  :qid |quant-u-323|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@403@01 $PSF<Cell>)
(declare-const s@404@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@405@01 ($Ref) $Ref)
(declare-fun img@406@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (and (img@402@01 x) (= x (inv@401@01 x))) false)
  
  :qid |quant-u-324|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@407@01 $PSF<Cell>)
(declare-const s@408@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@409@01 ($Ref) $Ref)
(declare-fun img@410@01 ($Ref) Bool)
(assert (= (as sm@403@01  $PSF<Cell>) (as sm@407@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@411@01 ((x $Ref)) $Perm
  (ite
    (and (img@402@01 x) (= x (inv@401@01 x)))
    ($Perm.min (ite (img@395@01 x) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@395@01 x) $Perm.Write $Perm.No) (pTaken@411@01 x)) $Perm.No)
  
  :qid |quant-u-326|))))
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
    (and (img@402@01 x) (= x (inv@401@01 x)))
    (= (- $Perm.Write (pTaken@411@01 x)) $Perm.No))
  
  :qid |quant-u-327|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@412@01 $PSF<Cell>)
(declare-const s@413@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@413@01 $Snap)) (!
  (=>
    (img@395@01 ($SortWrappers.$SnapTo$Ref s@413@01))
    (and
      (not (= s@413@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@412@01  $PSF<Cell>) s@413@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@392@01)) s@413@01))))
  :pattern (($PSF.lookup_Cell (as sm@412@01  $PSF<Cell>) s@413@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@392@01)) s@413@01))
  :qid |qp.psmValDef47|)))
(declare-fun inv@414@01 ($Ref) $Ref)
(declare-fun img@415@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (img@415@01 x) (= (inv@414@01 x) x))
  :pattern ((inv@414@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@400@01 $Ref)) (!
  (and (= (inv@414@01 y@400@01) y@400@01) (img@415@01 y@400@01))
  :pattern ((inv@414@01 y@400@01))
  :pattern ((img@415@01 y@400@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@403@01  $PSF<Cell>) (as sm@412@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@410@01 x) (img@406@01 x))
  
  :qid |quant-u-328|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@415@01 x) (img@410@01 x))
  
  :qid |quant-u-329|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@415@01 x) (img@406@01 x))
  
  :qid |quant-u-330|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand true --* (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const mwsf@416@01 $MWSF)
(assert (forall (($t@399@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@416@01 $t@399@01)
    ($SortWrappers.$PSF<Cell>To$Snap (as sm@412@01  $PSF<Cell>)))
  :pattern ((MWSF_apply mwsf@416@01 $t@399@01))
  :qid |quant-u-331|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@399@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@416@01 $t@399@01)
    ($SortWrappers.$PSF<Cell>To$Snap (as sm@412@01  $PSF<Cell>)))
  :pattern ((MWSF_apply mwsf@416@01 $t@399@01))
  :qid |quant-u-332|)))
(assert (forall ((s@413@01 $Snap)) (!
  (=>
    (img@395@01 ($SortWrappers.$SnapTo$Ref s@413@01))
    (and
      (not (= s@413@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@412@01  $PSF<Cell>) s@413@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@392@01)) s@413@01))))
  :pattern (($PSF.lookup_Cell (as sm@412@01  $PSF<Cell>) s@413@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@392@01)) s@413@01))
  :qid |qp.psmValDef47|)))
(assert (forall ((x $Ref)) (!
  (=> (img@415@01 x) (= (inv@414@01 x) x))
  :pattern ((inv@414@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@400@01 $Ref)) (!
  (and (= (inv@414@01 y@400@01) y@400@01) (img@415@01 y@400@01))
  :pattern ((inv@414@01 y@400@01))
  :pattern ((img@415@01 y@400@01))
  :qid |Cell-invOfFct|)))
(assert (and
  (= (as sm@403@01  $PSF<Cell>) (as sm@407@01  $PSF<Cell>))
  (= (as sm@403@01  $PSF<Cell>) (as sm@412@01  $PSF<Cell>))))
; [exec]
; apply true --* (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const y@417@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@418@01 ($Ref) $Ref)
(declare-fun img@419@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@417@01 $Ref)) (!
  (and (= (inv@418@01 y@417@01) y@417@01) (img@419@01 y@417@01))
  :pattern ((inv@418@01 y@417@01))
  :pattern ((img@419@01 y@417@01))
  :qid |quant-u-334|)))
(assert (forall ((x $Ref)) (!
  (=> (img@419@01 x) (= (inv@418@01 x) x))
  :pattern ((inv@418@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert get(x) == 0
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@420@01 ((x $Ref)) $Perm
  (ite
    (= x x@391@01)
    ($Perm.min
      (ite (img@419@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@419@01 x) $Perm.Write $Perm.No) (pTaken@420@01 x)) $Perm.No)
  
  :qid |quant-u-336|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@420@01 x) $Perm.No)
  
  :qid |quant-u-337|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@391@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@420@01 x)) $Perm.No))
  
  :qid |quant-u-338|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@421@01 $PSF<Cell>)
(declare-const s@422@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@419@01 x@391@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@391@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@421@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> (MWSF_apply mwsf@416@01 $Snap.unit)) ($SortWrappers.$RefTo$Snap x@391@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@421@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))) x@391@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (img@419@01 x@391@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@391@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@421@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> (MWSF_apply mwsf@416@01 $Snap.unit)) ($SortWrappers.$RefTo$Snap x@391@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@421@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))) x@391@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@421@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))) x@391@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@421@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@391@01))) x@391@01)
  0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test9 ----------
(declare-const x@423@01 $Ref)
(declare-const x@424@01 $Ref)
(push) ; 1
(declare-const $t@425@01 $Snap)
(assert (= $t@425@01 ($Snap.combine ($Snap.first $t@425@01) ($Snap.second $t@425@01))))
(declare-const y@426@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@427@01 ($Ref) $Ref)
(declare-fun img@428@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@426@01 $Ref)) (!
  (and (= (inv@427@01 y@426@01) y@426@01) (img@428@01 y@426@01))
  :pattern ((inv@427@01 y@426@01))
  :pattern ((img@428@01 y@426@01))
  :qid |quant-u-340|)))
(assert (forall ((x $Ref)) (!
  (=> (img@428@01 x) (= (inv@427@01 x) x))
  :pattern ((inv@427@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@425@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@429@01 ((x $Ref)) $Perm
  (ite
    (= x x@424@01)
    ($Perm.min
      (ite (img@428@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
  (= (- (ite (img@428@01 x) $Perm.Write $Perm.No) (pTaken@429@01 x)) $Perm.No)
  
  :qid |quant-u-342|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@429@01 x) $Perm.No)
  
  :qid |quant-u-343|))))
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
  (=>
    (= x x@424@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@429@01 x)) $Perm.No))
  
  :qid |quant-u-344|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@430@01 $PSF<Cell>)
(declare-const s@431@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@428@01 x@424@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@424@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@430@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@425@01)) ($SortWrappers.$RefTo$Snap x@424@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@430@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))) x@424@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@428@01 x@424@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@424@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@430@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@425@01)) ($SortWrappers.$RefTo$Snap x@424@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@430@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))) x@424@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@430@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))) x@424@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package (forall y: Ref ::true ==> acc(Cell(y), write)) --*
; acc(Cell(x), write) {
; }
(push) ; 3
(declare-const $t@432@01 $Snap)
(declare-const y@433@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@434@01 ($Ref) $Ref)
(declare-fun img@435@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@433@01 $Ref)) (!
  (and (= (inv@434@01 y@433@01) y@433@01) (img@435@01 y@433@01))
  :pattern ((inv@434@01 y@433@01))
  :pattern ((img@435@01 y@433@01))
  :qid |quant-u-346|)))
(assert (forall ((x $Ref)) (!
  (=> (img@435@01 x) (= (inv@434@01 x) x))
  :pattern ((inv@434@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@424@01) false)
  
  :qid |quant-u-347|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@436@01 $PSF<Cell>)
(declare-const s@437@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@438@01 ((x $Ref)) $Perm
  (ite
    (= x x@424@01)
    ($Perm.min (ite (img@435@01 x) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@435@01 x) $Perm.Write $Perm.No) (pTaken@438@01 x)) $Perm.No)
  
  :qid |quant-u-349|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@438@01 x) $Perm.No)
  
  :qid |quant-u-350|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@424@01) (= (- $Perm.Write (pTaken@438@01 x)) $Perm.No))
  
  :qid |quant-u-351|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@439@01 $PSF<Cell>)
(declare-const s@440@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@435@01 x@424@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@424@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@439@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@432@01) ($SortWrappers.$RefTo$Snap x@424@01))))))
(assert (= (as sm@436@01  $PSF<Cell>) (as sm@439@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@441@01 $PSF<Cell>)
(assert (forall ((x $Ref)) (!
  (=>
    (= x x@424@01)
    (=
      ($PSF.lookup_Cell $t@441@01 ($SortWrappers.$RefTo$Snap x))
      ($PSF.lookup_Cell (as sm@439@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x))))
  :pattern (($PSF.lookup_Cell (as sm@436@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@439@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@441@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-352|)))
; Create MagicWandSnapFunction for wand (forall y: Ref ::true ==> acc(Cell(y), write)) --* acc(Cell(x), write)
(declare-const mwsf@442@01 $MWSF)
(assert (forall (($t@432@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@442@01 $t@432@01)
    ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@439@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))))
  :pattern ((MWSF_apply mwsf@442@01 $t@432@01))
  :qid |quant-u-353|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@432@01 $Snap)) (!
  (and
    (and
      (=>
        (img@435@01 x@424@01)
        (and
          (not (= ($SortWrappers.$RefTo$Snap x@424@01) $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@439@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@432@01) ($SortWrappers.$RefTo$Snap x@424@01)))))
      (= (as sm@436@01  $PSF<Cell>) (as sm@439@01  $PSF<Cell>)))
    (=
      (MWSF_apply mwsf@442@01 $t@432@01)
      ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@439@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01)))))
  :pattern ((MWSF_apply mwsf@442@01 $t@432@01))
  :qid |quant-u-354|)))
(assert (forall ((x $Ref)) (!
  (=> (img@435@01 x) (= (inv@434@01 x) x))
  :pattern ((inv@434@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@433@01 $Ref)) (!
  (and (= (inv@434@01 y@433@01) y@433@01) (img@435@01 y@433@01))
  :pattern ((inv@434@01 y@433@01))
  :pattern ((img@435@01 y@433@01))
  :qid |quant-u-346|)))
; [exec]
; apply (forall y: Ref ::true ==> acc(Cell(y), write)) --*
;   acc(Cell(x), write)
(declare-const y@443@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@444@01 ($Ref) $Ref)
(declare-fun img@445@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@443@01 $Ref)) (!
  (and (= (inv@444@01 y@443@01) y@443@01) (img@445@01 y@443@01))
  :pattern ((inv@444@01 y@443@01))
  :pattern ((img@445@01 y@443@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@445@01 x) (= (inv@444@01 x) x))
  :pattern ((inv@444@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@446@01 ((x $Ref)) $Perm
  (ite
    (and (img@445@01 x) (= x (inv@444@01 x)))
    ($Perm.min (ite (img@428@01 x) $Perm.Write $Perm.No) $Perm.Write)
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
  (= (- (ite (img@428@01 x) $Perm.Write $Perm.No) (pTaken@446@01 x)) $Perm.No)
  
  :qid |quant-u-357|))))
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
    (and (img@445@01 x) (= x (inv@444@01 x)))
    (= (- $Perm.Write (pTaken@446@01 x)) $Perm.No))
  
  :qid |quant-u-358|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(assert (forall ((s@431@01 $Snap)) (!
  (=>
    (img@428@01 ($SortWrappers.$SnapTo$Ref s@431@01))
    (and
      (not (= s@431@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@430@01  $PSF<Cell>) s@431@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@425@01)) s@431@01))))
  :pattern (($PSF.lookup_Cell (as sm@430@01  $PSF<Cell>) s@431@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@425@01)) s@431@01))
  :qid |qp.psmValDef49|)))
(declare-const sm@447@01 $PSF<Cell>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_Cell (as sm@447@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))
  ($SortWrappers.$SnapToInt (MWSF_apply mwsf@442@01 ($SortWrappers.$PSF<Cell>To$Snap (as sm@430@01  $PSF<Cell>))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert get(x) == 0
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@448@01 ((x $Ref)) $Perm
  (ite
    (= x x@424@01)
    ($Perm.min
      (ite (= x x@424@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@448@01 x@424@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@448@01 x) $Perm.No)
  
  :qid |quant-u-361|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@424@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@448@01 x)) $Perm.No))
  
  :qid |quant-u-362|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@449@01 $PSF<Cell>)
(declare-const s@450@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@424@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@449@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))
    ($PSF.lookup_Cell (as sm@447@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01)))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@449@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))) x@424@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@424@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@449@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))
    ($PSF.lookup_Cell (as sm@447@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01)))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@449@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))) x@424@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@449@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))) x@424@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@449@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@424@01))) x@424@01)
  0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
(declare-const x@451@01 $Ref)
(declare-const x@452@01 $Ref)
(push) ; 1
(declare-const $t@453@01 $Snap)
(assert (= $t@453@01 ($Snap.combine ($Snap.first $t@453@01) ($Snap.second $t@453@01))))
(declare-const y@454@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-fun inv@455@01 ($Ref) $Ref)
(declare-fun img@456@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@454@01 $Ref)) (!
  (and (= (inv@455@01 y@454@01) y@454@01) (img@456@01 y@454@01))
  :pattern ((inv@455@01 y@454@01))
  :pattern ((img@456@01 y@454@01))
  :qid |quant-u-364|)))
(assert (forall ((x $Ref)) (!
  (=> (img@456@01 x) (= (inv@455@01 x) x))
  :pattern ((inv@455@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@453@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@457@01 ((x $Ref)) $Perm
  (ite
    (= x x@452@01)
    ($Perm.min
      (ite (img@456@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
  (= (- (ite (img@456@01 x) $Perm.Write $Perm.No) (pTaken@457@01 x)) $Perm.No)
  
  :qid |quant-u-366|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@457@01 x) $Perm.No)
  
  :qid |quant-u-367|))))
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
  (=>
    (= x x@452@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@457@01 x)) $Perm.No))
  
  :qid |quant-u-368|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@458@01 $PSF<Cell>)
(declare-const s@459@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@456@01 x@452@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@452@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@458@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@453@01)) ($SortWrappers.$RefTo$Snap x@452@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@458@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))) x@452@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (img@456@01 x@452@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@452@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@458@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@453@01)) ($SortWrappers.$RefTo$Snap x@452@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@458@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))) x@452@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@458@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))) x@452@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* acc(Cell(x), write) {
; }
(push) ; 3
(declare-const $t@460@01 $Snap)
(assert (= $t@460@01 $Snap.unit))
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@452@01) false)
  
  :qid |quant-u-369|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@461@01 $PSF<Cell>)
(declare-const s@462@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@452@01) false)
  
  :qid |quant-u-370|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@463@01 $PSF<Cell>)
(declare-const s@464@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (= (as sm@461@01  $PSF<Cell>) (as sm@463@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@465@01 ((x $Ref)) $Perm
  (ite
    (= x x@452@01)
    ($Perm.min (ite (img@456@01 x) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@456@01 x) $Perm.Write $Perm.No) (pTaken@465@01 x)) $Perm.No)
  
  :qid |quant-u-372|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@465@01 x) $Perm.No)
  
  :qid |quant-u-373|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@452@01) (= (- $Perm.Write (pTaken@465@01 x)) $Perm.No))
  
  :qid |quant-u-374|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@466@01 $PSF<Cell>)
(declare-const s@467@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@456@01 x@452@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@452@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@466@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@453@01)) ($SortWrappers.$RefTo$Snap x@452@01))))))
(assert (= (as sm@461@01  $PSF<Cell>) (as sm@466@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@468@01 $PSF<Cell>)
(declare-const $t@469@01 $PSF<Cell>)
(assert (forall ((x $Ref)) (!
  (=>
    (= x x@452@01)
    (=
      ($PSF.lookup_Cell $t@469@01 ($SortWrappers.$RefTo$Snap x))
      ($PSF.lookup_Cell (as sm@466@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x))))
  :pattern (($PSF.lookup_Cell $t@468@01 ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@466@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@469@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-376|)))
; Create MagicWandSnapFunction for wand true --* acc(Cell(x), write)
(declare-const mwsf@470@01 $MWSF)
(assert (forall (($t@460@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@470@01 $t@460@01)
    ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@466@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))))
  :pattern ((MWSF_apply mwsf@470@01 $t@460@01))
  :qid |quant-u-377|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@460@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@470@01 $t@460@01)
    ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@466@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))))
  :pattern ((MWSF_apply mwsf@470@01 $t@460@01))
  :qid |quant-u-378|)))
(assert (and
  (= (as sm@461@01  $PSF<Cell>) (as sm@463@01  $PSF<Cell>))
  (=>
    (img@456@01 x@452@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@452@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@466@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@453@01)) ($SortWrappers.$RefTo$Snap x@452@01)))))
  (= (as sm@461@01  $PSF<Cell>) (as sm@466@01  $PSF<Cell>))))
; [exec]
; apply true --* acc(Cell(x), write)
(declare-const sm@471@01 $PSF<Cell>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_Cell (as sm@471@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
  ($SortWrappers.$SnapToInt (MWSF_apply mwsf@470@01 $Snap.unit))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert get(x) == 0
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@472@01 ((x $Ref)) $Perm
  (ite
    (= x x@452@01)
    ($Perm.min
      (ite (= x x@452@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@473@01 ((x $Ref)) $Perm
  (ite
    (= x x@452@01)
    ($Perm.min
      (ite (img@456@01 x) (- $Perm.Write (pTaken@465@01 x)) $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@472@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@472@01 x@452@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@472@01 x) $Perm.No)
  
  :qid |quant-u-381|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@452@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@472@01 x)) $Perm.No))
  
  :qid |quant-u-382|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@474@01 $PSF<Cell>)
(declare-const s@475@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@452@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@474@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
    ($PSF.lookup_Cell (as sm@471@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01)))))
(assert (=>
  (ite
    (img@456@01 x@452@01)
    (< $Perm.No (- $Perm.Write (pTaken@465@01 x@452@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@452@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@474@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@453@01)) ($SortWrappers.$RefTo$Snap x@452@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@474@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))) x@452@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@452@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@474@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
    ($PSF.lookup_Cell (as sm@471@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01)))
  (=>
    (ite
      (img@456@01 x@452@01)
      (< $Perm.No (- $Perm.Write (pTaken@465@01 x@452@01)))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@452@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@474@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@453@01)) ($SortWrappers.$RefTo$Snap x@452@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@474@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))) x@452@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@474@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))) x@452@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@474@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@452@01))) x@452@01)
  0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test11 ----------
(declare-const x@476@01 $Ref)
(declare-const x@477@01 $Ref)
(push) ; 1
(declare-const $t@478@01 $Snap)
(assert (= $t@478@01 ($Snap.combine ($Snap.first $t@478@01) ($Snap.second $t@478@01))))
(declare-const sm@479@01 $PSF<Cell>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_Cell (as sm@479@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))
  ($SortWrappers.$SnapToInt ($Snap.first $t@478@01))))
(assert (= ($Snap.second $t@478@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@480@01 ((x $Ref)) $Perm
  (ite
    (= x x@477@01)
    ($Perm.min
      (ite (= x x@477@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
(assert (not (= (- $Perm.Write (pTaken@480@01 x@477@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@480@01 x) $Perm.No)
  
  :qid |quant-u-385|))))
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
  (=>
    (= x x@477@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@480@01 x)) $Perm.No))
  
  :qid |quant-u-386|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@481@01 $PSF<Cell>)
(declare-const s@482@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@477@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@481@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))
    ($PSF.lookup_Cell (as sm@479@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01)))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@481@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))) x@477@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@477@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@481@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))
    ($PSF.lookup_Cell (as sm@479@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01)))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@481@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))) x@477@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@481@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))) x@477@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package (forall y: Ref ::y != x ==> acc(Cell(y), write)) --*
; (forall y: Ref ::true ==> acc(Cell(y), write)) {
; }
(push) ; 3
(declare-const $t@483@01 $Snap)
(declare-const y@484@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@484@01 x@477@01)))
(pop) ; 4
(declare-fun inv@485@01 ($Ref) $Ref)
(declare-fun img@486@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@484@01 $Ref) (y2@484@01 $Ref)) (!
  (=>
    (and
      (not (= y1@484@01 x@477@01))
      (not (= y2@484@01 x@477@01))
      (= y1@484@01 y2@484@01))
    (= y1@484@01 y2@484@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@484@01 $Ref)) (!
  (=>
    (not (= y@484@01 x@477@01))
    (and (= (inv@485@01 y@484@01) y@484@01) (img@486@01 y@484@01)))
  :pattern ((inv@485@01 y@484@01))
  :pattern ((img@486@01 y@484@01))
  :qid |quant-u-388|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@486@01 x) (not (= (inv@485@01 x) x@477@01)))
    (= (inv@485@01 x) x))
  :pattern ((inv@485@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(declare-const y@487@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@488@01 ($Ref) $Ref)
(declare-fun img@489@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@487@01 $Ref)) (!
  (and (= (inv@488@01 y@487@01) y@487@01) (img@489@01 y@487@01))
  :pattern ((inv@488@01 y@487@01))
  :pattern ((img@489@01 y@487@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=> (img@489@01 x) (= (inv@488@01 x) x))
  :pattern ((inv@488@01 x))
  :qid |Cell-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  false
  
  :qid |quant-u-390|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (and (img@489@01 x) (= x (inv@488@01 x))) false)
  
  :qid |quant-u-391|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@490@01 $PSF<Cell>)
(declare-const s@491@01 $Snap)
; Definitional axioms for snapshot map values
(declare-fun inv@492@01 ($Ref) $Ref)
(declare-fun img@493@01 ($Ref) Bool)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@494@01 ((x $Ref)) $Perm
  (ite
    (and (img@489@01 x) (= x (inv@488@01 x)))
    ($Perm.min
      (ite
        (and (img@486@01 x) (not (= (inv@485@01 x) x@477@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@486@01 x) (not (= (inv@485@01 x) x@477@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@494@01 x))
    $Perm.No)
  
  :qid |quant-u-393|))))
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
    (and (img@489@01 x) (= x (inv@488@01 x)))
    (= (- $Perm.Write (pTaken@494@01 x)) $Perm.No))
  
  :qid |quant-u-394|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=>
    (and (img@489@01 x) (= x (inv@488@01 x)))
    (= (- $Perm.Write (pTaken@494@01 x)) $Perm.No))
  
  :qid |quant-u-394|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@495@01 $PSF<Cell>)
(declare-const s@496@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@496@01 $Snap)) (!
  (=>
    (and
      (img@486@01 ($SortWrappers.$SnapTo$Ref s@496@01))
      (not (= (inv@485@01 ($SortWrappers.$SnapTo$Ref s@496@01)) x@477@01)))
    (and
      (not (= s@496@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@495@01  $PSF<Cell>) s@496@01)
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@483@01) s@496@01))))
  :pattern (($PSF.lookup_Cell (as sm@495@01  $PSF<Cell>) s@496@01))
  :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@483@01) s@496@01))
  :qid |qp.psmValDef57|)))
(declare-fun inv@497@01 ($Ref) $Ref)
(declare-fun img@498@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=> (and (img@498@01 x) (< $Perm.No (pTaken@494@01 x))) (= (inv@497@01 x) x))
  :pattern ((inv@497@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@487@01 $Ref)) (!
  (=>
    (< $Perm.No (pTaken@494@01 y@487@01))
    (and (= (inv@497@01 y@487@01) y@487@01) (img@498@01 y@487@01)))
  :pattern ((inv@497@01 y@487@01))
  :pattern ((img@498@01 y@487@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@490@01  $PSF<Cell>) (as sm@495@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@499@01 ((x $Ref)) $Perm
  (ite
    (and (img@489@01 x) (= x (inv@488@01 x)))
    ($Perm.min
      (ite (= x x@477@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@494@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@499@01 x@477@01)) $Perm.No)))
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
    (and (img@489@01 x) (= x (inv@488@01 x)))
    (= (- (- $Perm.Write (pTaken@494@01 x)) (pTaken@499@01 x)) $Perm.No))
  
  :qid |quant-u-397|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@500@01 $PSF<Cell>)
(declare-const s@501@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@501@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@501@01) x@477@01)
    (and
      (not (= s@501@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@500@01  $PSF<Cell>) s@501@01)
        ($PSF.lookup_Cell (as sm@479@01  $PSF<Cell>) s@501@01))))
  :pattern (($PSF.lookup_Cell (as sm@500@01  $PSF<Cell>) s@501@01))
  :pattern (($PSF.lookup_Cell (as sm@479@01  $PSF<Cell>) s@501@01))
  :qid |qp.psmValDef58|)))
(declare-fun inv@502@01 ($Ref) $Ref)
(declare-fun img@503@01 ($Ref) Bool)
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@503@01 x) (< $Perm.No (- $Perm.Write (pTaken@494@01 x))))
    (= (inv@502@01 x) x))
  :pattern ((inv@502@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@487@01 $Ref)) (!
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@494@01 y@487@01)))
    (and (= (inv@502@01 y@487@01) y@487@01) (img@503@01 y@487@01)))
  :pattern ((inv@502@01 y@487@01))
  :pattern ((img@503@01 y@487@01))
  :qid |Cell-invOfFct|)))
(assert (= (as sm@490@01  $PSF<Cell>) (as sm@500@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@498@01 x) (img@493@01 x))
  
  :qid |quant-u-398|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@503@01 x) (img@498@01 x))
  
  :qid |quant-u-399|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (img@503@01 x) (img@493@01 x))
  
  :qid |quant-u-400|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Create MagicWandSnapFunction for wand (forall y: Ref ::y != x ==> acc(Cell(y), write)) --* (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const mwsf@504@01 $MWSF)
(assert (forall (($t@483@01 $Snap)) (!
  (=
    (MWSF_apply mwsf@504@01 $t@483@01)
    ($SortWrappers.$PSF<Cell>To$Snap (as sm@500@01  $PSF<Cell>)))
  :pattern ((MWSF_apply mwsf@504@01 $t@483@01))
  :qid |quant-u-401|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
(assert (forall (($t@483@01 $Snap)) (!
  (and
    (forall ((s@496@01 $Snap)) (!
      (=>
        (and
          (img@486@01 ($SortWrappers.$SnapTo$Ref s@496@01))
          (not (= (inv@485@01 ($SortWrappers.$SnapTo$Ref s@496@01)) x@477@01)))
        (and
          (not (= s@496@01 $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@495@01  $PSF<Cell>) s@496@01)
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@483@01) s@496@01))))
      :pattern (($PSF.lookup_Cell (as sm@495@01  $PSF<Cell>) s@496@01))
      :pattern (($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> $t@483@01) s@496@01))
      :qid |qp.psmValDef57|))
    (=
      (MWSF_apply mwsf@504@01 $t@483@01)
      ($SortWrappers.$PSF<Cell>To$Snap (as sm@500@01  $PSF<Cell>))))
  :pattern ((MWSF_apply mwsf@504@01 $t@483@01))
  :qid |quant-u-402|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@486@01 x) (not (= (inv@485@01 x) x@477@01)))
    (= (inv@485@01 x) x))
  :pattern ((inv@485@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@484@01 $Ref)) (!
  (=>
    (not (= y@484@01 x@477@01))
    (and (= (inv@485@01 y@484@01) y@484@01) (img@486@01 y@484@01)))
  :pattern ((inv@485@01 y@484@01))
  :pattern ((img@486@01 y@484@01))
  :qid |quant-u-388|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@498@01 x) (< $Perm.No (pTaken@494@01 x))) (= (inv@497@01 x) x))
  :pattern ((inv@497@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@487@01 $Ref)) (!
  (=>
    (< $Perm.No (pTaken@494@01 y@487@01))
    (and (= (inv@497@01 y@487@01) y@487@01) (img@498@01 y@487@01)))
  :pattern ((inv@497@01 y@487@01))
  :pattern ((img@498@01 y@487@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((s@501@01 $Snap)) (!
  (=>
    (= ($SortWrappers.$SnapTo$Ref s@501@01) x@477@01)
    (and
      (not (= s@501@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@500@01  $PSF<Cell>) s@501@01)
        ($PSF.lookup_Cell (as sm@479@01  $PSF<Cell>) s@501@01))))
  :pattern (($PSF.lookup_Cell (as sm@500@01  $PSF<Cell>) s@501@01))
  :pattern (($PSF.lookup_Cell (as sm@479@01  $PSF<Cell>) s@501@01))
  :qid |qp.psmValDef58|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@503@01 x) (< $Perm.No (- $Perm.Write (pTaken@494@01 x))))
    (= (inv@502@01 x) x))
  :pattern ((inv@502@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@487@01 $Ref)) (!
  (=>
    (< $Perm.No (- $Perm.Write (pTaken@494@01 y@487@01)))
    (and (= (inv@502@01 y@487@01) y@487@01) (img@503@01 y@487@01)))
  :pattern ((inv@502@01 y@487@01))
  :pattern ((img@503@01 y@487@01))
  :qid |Cell-invOfFct|)))
(assert (and
  (= (as sm@490@01  $PSF<Cell>) (as sm@495@01  $PSF<Cell>))
  (= (as sm@490@01  $PSF<Cell>) (as sm@500@01  $PSF<Cell>))))
; [exec]
; inhale (forall y: Ref ::y != x ==> acc(Cell(y), write))
(declare-const y@505@01 $Ref)
(push) ; 4
; [eval] y != x
(assert (not (= y@505@01 x@477@01)))
(pop) ; 4
(declare-const $t@506@01 $PSF<Cell>)
(declare-fun inv@507@01 ($Ref) $Ref)
(declare-fun img@508@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@505@01 $Ref) (y2@505@01 $Ref)) (!
  (=>
    (and
      (not (= y1@505@01 x@477@01))
      (not (= y2@505@01 x@477@01))
      (= y1@505@01 y2@505@01))
    (= y1@505@01 y2@505@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@505@01 $Ref)) (!
  (=>
    (not (= y@505@01 x@477@01))
    (and (= (inv@507@01 y@505@01) y@505@01) (img@508@01 y@505@01)))
  :pattern ((inv@507@01 y@505@01))
  :pattern ((img@508@01 y@505@01))
  :qid |quant-u-404|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@508@01 x) (not (= (inv@507@01 x) x@477@01)))
    (= (inv@507@01 x) x))
  :pattern ((inv@507@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; apply (forall y: Ref ::y != x ==> acc(Cell(y), write)) --*
;   (forall y: Ref ::true ==> acc(Cell(y), write))
(declare-const y@509@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] y != x
(assert (not (= y@509@01 x@477@01)))
(pop) ; 4
(declare-fun inv@510@01 ($Ref) $Ref)
(declare-fun img@511@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y1@509@01 $Ref) (y2@509@01 $Ref)) (!
  (=>
    (and
      (not (= y1@509@01 x@477@01))
      (not (= y2@509@01 x@477@01))
      (= y1@509@01 y2@509@01))
    (= y1@509@01 y2@509@01))
  
  :qid |Cell-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@509@01 $Ref)) (!
  (=>
    (not (= y@509@01 x@477@01))
    (and (= (inv@510@01 y@509@01) y@509@01) (img@511@01 y@509@01)))
  :pattern ((inv@510@01 y@509@01))
  :pattern ((img@511@01 y@509@01))
  :qid |Cell-invOfFct|)))
(assert (forall ((x $Ref)) (!
  (=>
    (and (img@511@01 x) (not (= (inv@510@01 x) x@477@01)))
    (= (inv@510@01 x) x))
  :pattern ((inv@510@01 x))
  :qid |Cell-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@512@01 ((x $Ref)) $Perm
  (ite
    (and (not (= (inv@510@01 x) x@477@01)) (img@511@01 x) (= x (inv@510@01 x)))
    ($Perm.min
      (ite
        (and (img@508@01 x) (not (= (inv@507@01 x) x@477@01)))
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite
        (and (img@508@01 x) (not (= (inv@507@01 x) x@477@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@512@01 x))
    $Perm.No)
  
  :qid |quant-u-407|))))
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
    (and (not (= (inv@510@01 x) x@477@01)) (img@511@01 x) (= x (inv@510@01 x)))
    (= (- $Perm.Write (pTaken@512@01 x)) $Perm.No))
  
  :qid |quant-u-408|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@513@01 $PSF<Cell>)
(declare-const s@514@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@514@01 $Snap)) (!
  (=>
    (and
      (img@508@01 ($SortWrappers.$SnapTo$Ref s@514@01))
      (not (= (inv@507@01 ($SortWrappers.$SnapTo$Ref s@514@01)) x@477@01)))
    (and
      (not (= s@514@01 $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@513@01  $PSF<Cell>) s@514@01)
        ($PSF.lookup_Cell $t@506@01 s@514@01))))
  :pattern (($PSF.lookup_Cell (as sm@513@01  $PSF<Cell>) s@514@01))
  :pattern (($PSF.lookup_Cell $t@506@01 s@514@01))
  :qid |qp.psmValDef59|)))
(declare-const y@515@01 $Ref)
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
(declare-fun inv@516@01 ($Ref) $Ref)
(declare-fun img@517@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@515@01 $Ref)) (!
  (and (= (inv@516@01 y@515@01) y@515@01) (img@517@01 y@515@01))
  :pattern ((inv@516@01 y@515@01))
  :pattern ((img@517@01 y@515@01))
  :qid |quant-u-410|)))
(assert (forall ((x $Ref)) (!
  (=> (img@517@01 x) (= (inv@516@01 x) x))
  :pattern ((inv@516@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; assert get(x) == 0
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@518@01 ((x $Ref)) $Perm
  (ite
    (= x x@477@01)
    ($Perm.min
      (ite (img@517@01 x) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (= (- (ite (img@517@01 x) $Perm.Write $Perm.No) (pTaken@518@01 x)) $Perm.No)
  
  :qid |quant-u-412|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@518@01 x) $Perm.No)
  
  :qid |quant-u-413|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@477@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@518@01 x)) $Perm.No))
  
  :qid |quant-u-414|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@519@01 $PSF<Cell>)
(declare-const s@520@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@517@01 x@477@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@477@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@519@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> (MWSF_apply mwsf@504@01 ($SortWrappers.$PSF<Cell>To$Snap (as sm@513@01  $PSF<Cell>)))) ($SortWrappers.$RefTo$Snap x@477@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@519@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))) x@477@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (img@517@01 x@477@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@477@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@519@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> (MWSF_apply mwsf@504@01 ($SortWrappers.$PSF<Cell>To$Snap (as sm@513@01  $PSF<Cell>)))) ($SortWrappers.$RefTo$Snap x@477@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@519@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))) x@477@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@519@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))) x@477@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@519@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@477@01))) x@477@01)
  0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test12 ----------
(declare-const x@521@01 $Ref)
(declare-const x@522@01 $Ref)
(push) ; 1
(declare-const y@523@01 $Ref)
(push) ; 2
(pop) ; 2
(declare-const $t@524@01 $PSF<Cell>)
(declare-fun inv@525@01 ($Ref) $Ref)
(declare-fun img@526@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@523@01 $Ref)) (!
  (and (= (inv@525@01 y@523@01) y@523@01) (img@526@01 y@523@01))
  :pattern ((inv@525@01 y@523@01))
  :pattern ((img@526@01 y@523@01))
  :qid |quant-u-416|)))
(assert (forall ((x $Ref)) (!
  (=> (img@526@01 x) (= (inv@525@01 x) x))
  :pattern ((inv@525@01 x))
  :qid |Cell-fctOfInv|)))
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
; package (forall y: Ref ::true ==> acc(Cell(y), 1 / 2)) && get(x) == 0 --*
; true {
;   assert acc(Cell(x), write) && get(x) == 0
; }
(push) ; 3
(declare-const $t@527@01 $Snap)
(assert (= $t@527@01 ($Snap.combine ($Snap.first $t@527@01) ($Snap.second $t@527@01))))
(declare-const y@528@01 $Ref)
(push) ; 4
(pop) ; 4
(declare-fun inv@529@01 ($Ref) $Ref)
(declare-fun img@530@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((y@528@01 $Ref)) (!
  (and (= (inv@529@01 y@528@01) y@528@01) (img@530@01 y@528@01))
  :pattern ((inv@529@01 y@528@01))
  :pattern ((img@530@01 y@528@01))
  :qid |quant-u-418|)))
(assert (forall ((x $Ref)) (!
  (=> (img@530@01 x) (= (inv@529@01 x) x))
  :pattern ((inv@529@01 x))
  :qid |Cell-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second $t@527@01) $Snap.unit))
; [eval] get(x) == 0
; [eval] get(x)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@531@01 ((x $Ref)) $Perm
  (ite
    (= x x@522@01)
    ($Perm.min
      (ite (img@530@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@530@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@531@01 x))
    $Perm.No)
  
  :qid |quant-u-420|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@531@01 x) $Perm.No)
  
  :qid |quant-u-421|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@522@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@531@01 x)) $Perm.No))
  
  :qid |quant-u-422|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@532@01 $PSF<Cell>)
(declare-const s@533@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@530@01 x@522@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@532@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@527@01)) ($SortWrappers.$RefTo$Snap x@522@01))))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@532@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))) x@522@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (img@530@01 x@522@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@532@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@527@01)) ($SortWrappers.$RefTo$Snap x@522@01)))))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@532@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))) x@522@01)))
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@532@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))) x@522@01)
  0))
; [exec]
; assert acc(Cell(x), write) && get(x) == 0
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@522@01) false)
  
  :qid |quant-u-423|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@534@01 $PSF<Cell>)
(declare-const s@535@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@536@01 ((x $Ref)) $Perm
  (ite
    (= x x@522@01)
    ($Perm.min
      (ite (img@530@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@530@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@536@01 x))
    $Perm.No)
  
  :qid |quant-u-425|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@536@01 x) $Perm.No)
  
  :qid |quant-u-426|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@522@01) (= (- $Perm.Write (pTaken@536@01 x)) $Perm.No))
  
  :qid |quant-u-427|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref)) (!
  (=> (= x x@522@01) (= (- $Perm.Write (pTaken@536@01 x)) $Perm.No))
  
  :qid |quant-u-427|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@537@01 $PSF<Cell>)
(declare-const s@538@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@530@01 x@522@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@537@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@527@01)) ($SortWrappers.$RefTo$Snap x@522@01))))))
(assert (= (as sm@534@01  $PSF<Cell>) (as sm@537@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@539@01 ((x $Ref)) $Perm
  (ite
    (= x x@522@01)
    ($Perm.min
      (ite (img@526@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (- $Perm.Write (pTaken@536@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (img@526@01 x) (/ (to_real 1) (to_real 2)) $Perm.No)
      (pTaken@539@01 x))
    $Perm.No)
  
  :qid |quant-u-429|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@539@01 x) $Perm.No)
  
  :qid |quant-u-430|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@522@01)
    (= (- (- $Perm.Write (pTaken@536@01 x)) (pTaken@539@01 x)) $Perm.No))
  
  :qid |quant-u-431|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@540@01 $PSF<Cell>)
(declare-const s@541@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (img@526@01 x@522@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@540@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
      ($PSF.lookup_Cell $t@524@01 ($SortWrappers.$RefTo$Snap x@522@01))))))
(assert (= (as sm@534@01  $PSF<Cell>) (as sm@540@01  $PSF<Cell>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@542@01 $PSF<Cell>)
(declare-const $t@543@01 $PSF<Cell>)
(assert (forall ((x $Ref)) (!
  (=>
    (ite (= x x@522@01) (< $Perm.No (pTaken@536@01 x)) false)
    (=
      ($PSF.lookup_Cell $t@542@01 ($SortWrappers.$RefTo$Snap x))
      ($PSF.lookup_Cell (as sm@537@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x))))
  :pattern (($PSF.lookup_Cell (as sm@534@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@537@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@542@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-432|)))
(assert (forall ((x $Ref)) (!
  (and
    (=>
      (ite (= x x@522@01) (< $Perm.No (pTaken@536@01 x)) false)
      (=
        ($PSF.lookup_Cell $t@543@01 ($SortWrappers.$RefTo$Snap x))
        ($PSF.lookup_Cell $t@542@01 ($SortWrappers.$RefTo$Snap x))))
    (=>
      (ite (= x x@522@01) (< $Perm.No (- $Perm.Write (pTaken@536@01 x))) false)
      (=
        ($PSF.lookup_Cell $t@543@01 ($SortWrappers.$RefTo$Snap x))
        ($PSF.lookup_Cell (as sm@540@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))))
  :pattern (($PSF.lookup_Cell $t@542@01 ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell (as sm@540@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x)))
  :pattern (($PSF.lookup_Cell $t@543@01 ($SortWrappers.$RefTo$Snap x)))
  :qid |quant-u-433|)))
; [eval] get(x) == 0
; [eval] get(x)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@544@01 ((x $Ref)) $Perm
  (ite
    (= x x@522@01)
    ($Perm.min
      (ite (= x x@522@01) $Perm.Write $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@545@01 ((x $Ref)) $Perm
  (ite
    (= x x@522@01)
    ($Perm.min
      (ite
        (img@530@01 x)
        (- (/ (to_real 1) (to_real 2)) (pTaken@536@01 x))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@544@01 x)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@544@01 x@522@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@544@01 x) $Perm.No)
  
  :qid |quant-u-436|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=>
    (= x x@522@01)
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@544@01 x)) $Perm.No))
  
  :qid |quant-u-437|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@546@01 $PSF<Cell>)
(declare-const s@547@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (img@530@01 x@522@01)
    (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@536@01 x@522@01)))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
    (=
      ($PSF.lookup_Cell (as sm@546@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
      ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@527@01)) ($SortWrappers.$RefTo$Snap x@522@01))))))
(assert (and
  (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@546@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
    ($PSF.lookup_Cell $t@543@01 ($SortWrappers.$RefTo$Snap x@522@01)))))
(assert (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@546@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))) x@522@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (ite
      (img@530@01 x@522@01)
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@536@01 x@522@01)))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
      (=
        ($PSF.lookup_Cell (as sm@546@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
        ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@527@01)) ($SortWrappers.$RefTo$Snap x@522@01)))))
  (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
  (=
    ($PSF.lookup_Cell (as sm@546@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
    ($PSF.lookup_Cell $t@543@01 ($SortWrappers.$RefTo$Snap x@522@01)))
  (get%precondition ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@546@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))) x@522@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@546@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))) x@522@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (get ($SortWrappers.IntTo$Snap ($PSF.lookup_Cell (as sm@546@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))) x@522@01)
  0))
; Create MagicWandSnapFunction for wand (forall y: Ref ::true ==> acc(Cell(y), 1 / 2)) && get(x) == 0 --* true
(declare-const mwsf@548@01 $MWSF)
(assert (forall (($t@527@01 $Snap)) (!
  (= (MWSF_apply mwsf@548@01 $t@527@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@548@01 $t@527@01))
  :qid |quant-u-438|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@527@01 $Snap)) (!
  (and
    (and
      (=>
        (img@530@01 x@522@01)
        (and
          (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@537@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
            ($PSF.lookup_Cell ($SortWrappers.$SnapTo$PSF<Cell> ($Snap.first $t@527@01)) ($SortWrappers.$RefTo$Snap x@522@01)))))
      (= (as sm@534@01  $PSF<Cell>) (as sm@537@01  $PSF<Cell>))
      (=>
        (img@526@01 x@522@01)
        (and
          (not (= ($SortWrappers.$RefTo$Snap x@522@01) $Snap.unit))
          (=
            ($PSF.lookup_Cell (as sm@540@01  $PSF<Cell>) ($SortWrappers.$RefTo$Snap x@522@01))
            ($PSF.lookup_Cell $t@524@01 ($SortWrappers.$RefTo$Snap x@522@01)))))
      (= (as sm@534@01  $PSF<Cell>) (as sm@540@01  $PSF<Cell>)))
    (= (MWSF_apply mwsf@548@01 $t@527@01) $Snap.unit))
  :pattern ((MWSF_apply mwsf@548@01 $t@527@01))
  :qid |quant-u-439|)))
(assert (forall ((x $Ref)) (!
  (=> (img@530@01 x) (= (inv@529@01 x) x))
  :pattern ((inv@529@01 x))
  :qid |Cell-fctOfInv|)))
(assert (forall ((y@528@01 $Ref)) (!
  (and (= (inv@529@01 y@528@01) y@528@01) (img@530@01 y@528@01))
  :pattern ((inv@529@01 y@528@01))
  :pattern ((img@530@01 y@528@01))
  :qid |quant-u-418|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test13 ----------
(declare-const x0@549@01 $Ref)
(declare-const x1@550@01 $Ref)
(declare-const x0@551@01 $Ref)
(declare-const x1@552@01 $Ref)
(push) ; 1
(declare-const $t@553@01 $Snap)
(assert (= $t@553@01 ($Snap.combine ($Snap.first $t@553@01) ($Snap.second $t@553@01))))
(assert (= ($Snap.first $t@553@01) $Snap.unit))
; [eval] x0 != x1
(assert (not (= x0@551@01 x1@552@01)))
(assert (=
  ($Snap.second $t@553@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@553@01))
    ($Snap.second ($Snap.second $t@553@01)))))
(declare-const y0@554@01 $Ref)
(declare-const y1@555@01 $Ref)
(push) ; 2
; [eval] y0 != y1
(assert (not (= y0@554@01 y1@555@01)))
(pop) ; 2
(declare-fun inv@556@01 ($Ref $Ref) $Ref)
(declare-fun img@557@01 ($Ref $Ref) Bool)
(declare-fun inv@558@01 ($Ref $Ref) $Ref)
(declare-fun img@559@01 ($Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y01@554@01 $Ref) (y11@555@01 $Ref) (y02@554@01 $Ref) (y12@555@01 $Ref)) (!
  (=>
    (and
      (not (= y01@554@01 y11@555@01))
      (not (= y02@554@01 y12@555@01))
      (and (= y01@554@01 y02@554@01) (= y11@555@01 y12@555@01)))
    (and (= y01@554@01 y02@554@01) (= y11@555@01 y12@555@01)))
  
  :qid |Pair-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y0@554@01 $Ref) (y1@555@01 $Ref)) (!
  (=>
    (not (= y0@554@01 y1@555@01))
    (and
      (and
        (= (inv@556@01 y0@554@01 y1@555@01) y0@554@01)
        (= (inv@558@01 y0@554@01 y1@555@01) y1@555@01))
      (and (img@557@01 y0@554@01 y1@555@01) (img@559@01 y0@554@01 y1@555@01))))
  :pattern ((inv@556@01 y0@554@01 y1@555@01))
  :pattern ((inv@558@01 y0@554@01 y1@555@01))
  :pattern ((img@557@01 y0@554@01 y1@555@01))
  :pattern ((img@559@01 y0@554@01 y1@555@01))
  :qid |quant-u-441|)))
(assert (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (and (img@557@01 x y) (img@559@01 x y))
      (not (= (inv@556@01 x y) (inv@558@01 x y))))
    (and (= (inv@556@01 x y) x) (= (inv@558@01 x y) y)))
  :pattern ((inv@556@01 x y))
  :pattern ((inv@558@01 x y))
  :qid |Pair-fctOfInv|)))
; Permissions are non-negative
(assert (= ($Snap.second ($Snap.second $t@553@01)) $Snap.unit))
; [eval] sum(x0, x1) == 0
; [eval] sum(x0, x1)
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@560@01 ((x $Ref) (y $Ref)) $Perm
  (ite
    (and (= x x0@551@01) (= y x1@552@01))
    ($Perm.min
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
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
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=
    (-
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        $Perm.Write
        $Perm.No)
      (pTaken@560@01 x y))
    $Perm.No)
  
  :qid |quant-u-443|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (= (pTaken@560@01 x y) $Perm.No)
  
  :qid |quant-u-444|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and (= x x0@551@01) (= y x1@552@01))
    (= (- $Perm.Write (pTaken@560@01 x y)) $Perm.No))
  
  :qid |quant-u-445|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@561@01 $PSF<Pair>)
(declare-const s@562@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (and (img@557@01 x0@551@01 x1@552@01) (img@559@01 x0@551@01 x1@552@01))
    (not (= (inv@556@01 x0@551@01 x1@552@01) (inv@558@01 x0@551@01 x1@552@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0@551@01)
          ($SortWrappers.$RefTo$Snap x1@552@01))
        $Snap.unit))
    (=
      ($PSF.lookup_Pair (as sm@561@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0@551@01)
        ($SortWrappers.$RefTo$Snap x1@552@01)))
      ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second $t@553@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0@551@01)
        ($SortWrappers.$RefTo$Snap x1@552@01)))))))
(assert (sum%precondition ($PSF.lookup_Pair (as sm@561@01  $PSF<Pair>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap x0@551@01)
  ($SortWrappers.$RefTo$Snap x1@552@01))) x0@551@01 x1@552@01))
(pop) ; 2
; Joined path conditions
(assert (and
  (=>
    (and
      (and (img@557@01 x0@551@01 x1@552@01) (img@559@01 x0@551@01 x1@552@01))
      (not (= (inv@556@01 x0@551@01 x1@552@01) (inv@558@01 x0@551@01 x1@552@01))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x0@551@01)
            ($SortWrappers.$RefTo$Snap x1@552@01))
          $Snap.unit))
      (=
        ($PSF.lookup_Pair (as sm@561@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0@551@01)
          ($SortWrappers.$RefTo$Snap x1@552@01)))
        ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second $t@553@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0@551@01)
          ($SortWrappers.$RefTo$Snap x1@552@01))))))
  (sum%precondition ($PSF.lookup_Pair (as sm@561@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x0@551@01)
    ($SortWrappers.$RefTo$Snap x1@552@01))) x0@551@01 x1@552@01)))
(assert (=
  (sum ($PSF.lookup_Pair (as sm@561@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x0@551@01)
    ($SortWrappers.$RefTo$Snap x1@552@01))) x0@551@01 x1@552@01)
  0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; package true --* true {
;   assert acc(Pair(x0, x1), write) && sum(x0, x1) == 0
; }
(push) ; 3
(declare-const $t@563@01 $Snap)
(assert (= $t@563@01 $Snap.unit))
; [exec]
; assert acc(Pair(x0, x1), write) && sum(x0, x1) == 0
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=> (and (= x x0@551@01) (= y x1@552@01)) false)
  
  :qid |quant-u-446|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@564@01 $PSF<Pair>)
(declare-const s@565@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=> (and (= x x0@551@01) (= y x1@552@01)) false)
  
  :qid |quant-u-447|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(declare-const sm@566@01 $PSF<Pair>)
(declare-const s@567@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (= (as sm@564@01  $PSF<Pair>) (as sm@566@01  $PSF<Pair>)))
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
(define-fun pTaken@568@01 ((x $Ref) (y $Ref)) $Perm
  (ite
    (and (= x x0@551@01) (= y x1@552@01))
    ($Perm.min
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=
    (-
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        $Perm.Write
        $Perm.No)
      (pTaken@568@01 x y))
    $Perm.No)
  
  :qid |quant-u-449|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (= (pTaken@568@01 x y) $Perm.No)
  
  :qid |quant-u-450|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and (= x x0@551@01) (= y x1@552@01))
    (= (- $Perm.Write (pTaken@568@01 x y)) $Perm.No))
  
  :qid |quant-u-451|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@569@01 $PSF<Pair>)
(declare-const s@570@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (and (img@557@01 x0@551@01 x1@552@01) (img@559@01 x0@551@01 x1@552@01))
    (not (= (inv@556@01 x0@551@01 x1@552@01) (inv@558@01 x0@551@01 x1@552@01))))
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0@551@01)
          ($SortWrappers.$RefTo$Snap x1@552@01))
        $Snap.unit))
    (=
      ($PSF.lookup_Pair (as sm@569@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0@551@01)
        ($SortWrappers.$RefTo$Snap x1@552@01)))
      ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second $t@553@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0@551@01)
        ($SortWrappers.$RefTo$Snap x1@552@01)))))))
(assert (= (as sm@564@01  $PSF<Pair>) (as sm@569@01  $PSF<Pair>)))
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const $t@571@01 $PSF<Pair>)
(declare-const $t@572@01 $PSF<Pair>)
(assert (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and (= x x0@551@01) (= y x1@552@01))
    (=
      ($PSF.lookup_Pair $t@572@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap x)
        ($SortWrappers.$RefTo$Snap y)))
      ($PSF.lookup_Pair (as sm@569@01  $PSF<Pair>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x)
        ($SortWrappers.$RefTo$Snap y)))))
  :pattern (($PSF.lookup_Pair $t@571@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap x)
    ($SortWrappers.$RefTo$Snap y))))
  :pattern (($PSF.lookup_Pair (as sm@569@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x)
    ($SortWrappers.$RefTo$Snap y))))
  :pattern (($PSF.lookup_Pair $t@572@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap x)
    ($SortWrappers.$RefTo$Snap y))))
  :qid |quant-u-453|)))
; [eval] sum(x0, x1) == 0
; [eval] sum(x0, x1)
(set-option :timeout 0)
(push) ; 4
; Precomputing data for removing quantified permissions
(define-fun pTaken@573@01 ((x $Ref) (y $Ref)) $Perm
  (ite
    (and (= x x0@551@01) (= y x1@552@01))
    ($Perm.min
      (ite (and (= x x0@551@01) (= y x1@552@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@573@01 x0@551@01 x1@552@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and (= x x0@551@01) (= y x1@552@01))
    (= (- $Perm.Write (pTaken@573@01 x y)) $Perm.No))
  
  :qid |quant-u-456|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@574@01 $PSF<Pair>)
(declare-const s@575@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0@551@01)
        ($SortWrappers.$RefTo$Snap x1@552@01))
      $Snap.unit))
  (=
    ($PSF.lookup_Pair (as sm@574@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap x0@551@01)
      ($SortWrappers.$RefTo$Snap x1@552@01)))
    ($PSF.lookup_Pair $t@572@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap x0@551@01)
      ($SortWrappers.$RefTo$Snap x1@552@01))))))
(assert (sum%precondition ($PSF.lookup_Pair (as sm@574@01  $PSF<Pair>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap x0@551@01)
  ($SortWrappers.$RefTo$Snap x1@552@01))) x0@551@01 x1@552@01))
(pop) ; 4
; Joined path conditions
(assert (and
  (not
    (=
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0@551@01)
        ($SortWrappers.$RefTo$Snap x1@552@01))
      $Snap.unit))
  (=
    ($PSF.lookup_Pair (as sm@574@01  $PSF<Pair>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap x0@551@01)
      ($SortWrappers.$RefTo$Snap x1@552@01)))
    ($PSF.lookup_Pair $t@572@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap x0@551@01)
      ($SortWrappers.$RefTo$Snap x1@552@01))))
  (sum%precondition ($PSF.lookup_Pair (as sm@574@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x0@551@01)
    ($SortWrappers.$RefTo$Snap x1@552@01))) x0@551@01 x1@552@01)))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  (sum ($PSF.lookup_Pair (as sm@574@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x0@551@01)
    ($SortWrappers.$RefTo$Snap x1@552@01))) x0@551@01 x1@552@01)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  (sum ($PSF.lookup_Pair (as sm@574@01  $PSF<Pair>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x0@551@01)
    ($SortWrappers.$RefTo$Snap x1@552@01))) x0@551@01 x1@552@01)
  0))
; Create MagicWandSnapFunction for wand true --* true
(declare-const mwsf@576@01 $MWSF)
(assert (forall (($t@563@01 $Snap)) (!
  (= (MWSF_apply mwsf@576@01 $t@563@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@576@01 $t@563@01))
  :qid |quant-u-457|)))
(pop) ; 3
(push) ; 3
(assert (forall (($t@563@01 $Snap)) (!
  (= (MWSF_apply mwsf@576@01 $t@563@01) $Snap.unit)
  :pattern ((MWSF_apply mwsf@576@01 $t@563@01))
  :qid |quant-u-458|)))
(assert (and
  (= (as sm@564@01  $PSF<Pair>) (as sm@566@01  $PSF<Pair>))
  (=>
    (and
      (and (img@557@01 x0@551@01 x1@552@01) (img@559@01 x0@551@01 x1@552@01))
      (not (= (inv@556@01 x0@551@01 x1@552@01) (inv@558@01 x0@551@01 x1@552@01))))
    (and
      (not
        (=
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x0@551@01)
            ($SortWrappers.$RefTo$Snap x1@552@01))
          $Snap.unit))
      (=
        ($PSF.lookup_Pair (as sm@569@01  $PSF<Pair>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0@551@01)
          ($SortWrappers.$RefTo$Snap x1@552@01)))
        ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second $t@553@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0@551@01)
          ($SortWrappers.$RefTo$Snap x1@552@01))))))
  (= (as sm@564@01  $PSF<Pair>) (as sm@569@01  $PSF<Pair>))))
; [exec]
; assert (forall y0: Ref, y1: Ref ::!((y0 in Set(x0, x1))) &&
;     (!((y1 in Set(x0, x1))) && y0 != y1) ==>
;     acc(Pair(y0, y1), write))
(declare-const y0@577@01 $Ref)
(declare-const y1@578@01 $Ref)
(push) ; 4
; [eval] !((y0 in Set(x0, x1))) && (!((y1 in Set(x0, x1))) && y0 != y1)
; [eval] !((y0 in Set(x0, x1)))
; [eval] (y0 in Set(x0, x1))
; [eval] Set(x0, x1)
(push) ; 5
; [then-branch: 0 | y0@577@01 in {x0@551@01} + x1@552@01 | live]
; [else-branch: 0 | !(y0@577@01 in {x0@551@01} + x1@552@01) | live]
(push) ; 6
; [then-branch: 0 | y0@577@01 in {x0@551@01} + x1@552@01]
(assert (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 0 | !(y0@577@01 in {x0@551@01} + x1@552@01)]
(assert (not (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01))))
; [eval] !((y1 in Set(x0, x1)))
; [eval] (y1 in Set(x0, x1))
; [eval] Set(x0, x1)
(push) ; 7
; [then-branch: 1 | y1@578@01 in {x0@551@01} + x1@552@01 | live]
; [else-branch: 1 | !(y1@578@01 in {x0@551@01} + x1@552@01) | live]
(push) ; 8
; [then-branch: 1 | y1@578@01 in {x0@551@01} + x1@552@01]
(assert (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 1 | !(y1@578@01 in {x0@551@01} + x1@552@01)]
(assert (not (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01))))
; [eval] y0 != y1
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
  (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
  (and
    (not (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
    (or
      (not (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
      (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01))))))
(assert (or
  (not (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
  (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01))))
(assert (and
  (not (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
  (and
    (not (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
    (not (= y0@577@01 y1@578@01)))))
(pop) ; 4
(declare-fun inv@579@01 ($Ref $Ref) $Ref)
(declare-fun img@580@01 ($Ref $Ref) Bool)
(declare-fun inv@581@01 ($Ref $Ref) $Ref)
(declare-fun img@582@01 ($Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((y0@577@01 $Ref) (y1@578@01 $Ref)) (!
  (=>
    (and
      (not (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
      (and
        (not
          (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (not (= y0@577@01 y1@578@01))))
    (and
      (=>
        (not
          (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (and
          (not
            (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
          (or
            (not
              (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
            (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))))
      (or
        (not
          (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (inv@579@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (inv@581@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (img@580@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (img@582@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (inv@579@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (inv@581@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (img@580@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (img@582@01 y0@577@01 y1@578@01))
  :pattern ((inv@579@01 y0@577@01 y1@578@01))
  :pattern ((inv@581@01 y0@577@01 y1@578@01))
  :pattern ((img@580@01 y0@577@01 y1@578@01))
  :pattern ((img@582@01 y0@577@01 y1@578@01))
  :qid |Pair-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y01@577@01 $Ref) (y11@578@01 $Ref) (y02@577@01 $Ref) (y12@578@01 $Ref)) (!
  (=>
    (and
      (and
        (not
          (Set_in y01@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (and
          (not
            (Set_in y11@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
          (not (= y01@577@01 y11@578@01))))
      (and
        (not
          (Set_in y02@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (and
          (not
            (Set_in y12@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
          (not (= y02@577@01 y12@578@01))))
      (and (= y01@577@01 y02@577@01) (= y11@578@01 y12@578@01)))
    (and (= y01@577@01 y02@577@01) (= y11@578@01 y12@578@01)))
  
  :qid |Pair-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y0@577@01 $Ref) (y1@578@01 $Ref)) (!
  (=>
    (and
      (not (Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
      (and
        (not
          (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (not (= y0@577@01 y1@578@01))))
    (and
      (and
        (= (inv@579@01 y0@577@01 y1@578@01) y0@577@01)
        (= (inv@581@01 y0@577@01 y1@578@01) y1@578@01))
      (and (img@580@01 y0@577@01 y1@578@01) (img@582@01 y0@577@01 y1@578@01))))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (inv@579@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (inv@581@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (img@580@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y0@577@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (img@582@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (inv@579@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (inv@581@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (img@580@01 y0@577@01 y1@578@01))
  :pattern ((Set_in y1@578@01 (Set_unionone (Set_singleton x0@551@01) x1@552@01)) (img@582@01 y0@577@01 y1@578@01))
  :pattern ((inv@579@01 y0@577@01 y1@578@01))
  :pattern ((inv@581@01 y0@577@01 y1@578@01))
  :pattern ((img@580@01 y0@577@01 y1@578@01))
  :pattern ((img@582@01 y0@577@01 y1@578@01))
  :qid |Pair-invOfFct|)))
(assert (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (and (img@580@01 x y) (img@582@01 x y))
      (and
        (not
          (Set_in (inv@579@01 x y) (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (and
          (not
            (Set_in (inv@581@01 x y) (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
          (not (= (inv@579@01 x y) (inv@581@01 x y))))))
    (and (= (inv@579@01 x y) x) (= (inv@581@01 x y) y)))
  :pattern ((inv@579@01 x y))
  :pattern ((inv@581@01 x y))
  :qid |Pair-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@583@01 ((x $Ref) (y $Ref)) $Perm
  (ite
    (and
      (and
        (not
          (Set_in (inv@579@01 x y) (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (and
          (not
            (Set_in (inv@581@01 x y) (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
          (not (= (inv@579@01 x y) (inv@581@01 x y)))))
      (and (img@580@01 x y) (img@582@01 x y))
      (and (= x (inv@579@01 x y)) (= y (inv@581@01 x y))))
    ($Perm.min
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        (- $Perm.Write (pTaken@568@01 x y))
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
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=
    (-
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        (- $Perm.Write (pTaken@568@01 x y))
        $Perm.No)
      (pTaken@583@01 x y))
    $Perm.No)
  
  :qid |quant-u-461|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (= (pTaken@583@01 x y) $Perm.No)
  
  :qid |quant-u-462|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (and
        (not
          (Set_in (inv@579@01 x y) (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
        (and
          (not
            (Set_in (inv@581@01 x y) (Set_unionone (Set_singleton x0@551@01) x1@552@01)))
          (not (= (inv@579@01 x y) (inv@581@01 x y)))))
      (and (img@580@01 x y) (img@582@01 x y))
      (and (= x (inv@579@01 x y)) (= y (inv@581@01 x y))))
    (= (- $Perm.Write (pTaken@583@01 x y)) $Perm.No))
  
  :qid |quant-u-463|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@584@01 $PSF<Pair>)
(declare-const s@585@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@585@01 $Snap)) (!
  (=>
    (ite
      (and
        (and
          (img@557@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@585@01)) ($SortWrappers.$SnapTo$Ref ($Snap.second s@585@01)))
          (img@559@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@585@01)) ($SortWrappers.$SnapTo$Ref ($Snap.second s@585@01))))
        (not
          (=
            (inv@556@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@585@01)) ($SortWrappers.$SnapTo$Ref ($Snap.second s@585@01)))
            (inv@558@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@585@01)) ($SortWrappers.$SnapTo$Ref ($Snap.second s@585@01))))))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@568@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@585@01)) ($SortWrappers.$SnapTo$Ref ($Snap.second s@585@01)))))
      false)
    (and
      (not (= s@585@01 $Snap.unit))
      (=
        ($PSF.lookup_Pair (as sm@584@01  $PSF<Pair>) s@585@01)
        ($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second $t@553@01))) s@585@01))))
  :pattern (($PSF.lookup_Pair (as sm@584@01  $PSF<Pair>) s@585@01))
  :pattern (($PSF.lookup_Pair ($SortWrappers.$SnapTo$PSF<Pair> ($Snap.first ($Snap.second $t@553@01))) s@585@01))
  :qid |qp.psmValDef69|)))
; [exec]
; assert (forall y0: Ref, y1: Ref ::y0 != y1 ==> acc(Pair(y0, y1), write))
(declare-const y0@586@01 $Ref)
(declare-const y1@587@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] y0 != y1
(assert (not (= y0@586@01 y1@587@01)))
(pop) ; 4
(declare-fun inv@588@01 ($Ref $Ref) $Ref)
(declare-fun img@589@01 ($Ref $Ref) Bool)
(declare-fun inv@590@01 ($Ref $Ref) $Ref)
(declare-fun img@591@01 ($Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y01@586@01 $Ref) (y11@587@01 $Ref) (y02@586@01 $Ref) (y12@587@01 $Ref)) (!
  (=>
    (and
      (not (= y01@586@01 y11@587@01))
      (not (= y02@586@01 y12@587@01))
      (and (= y01@586@01 y02@586@01) (= y11@587@01 y12@587@01)))
    (and (= y01@586@01 y02@586@01) (= y11@587@01 y12@587@01)))
  
  :qid |Pair-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y0@586@01 $Ref) (y1@587@01 $Ref)) (!
  (=>
    (not (= y0@586@01 y1@587@01))
    (and
      (and
        (= (inv@588@01 y0@586@01 y1@587@01) y0@586@01)
        (= (inv@590@01 y0@586@01 y1@587@01) y1@587@01))
      (and (img@589@01 y0@586@01 y1@587@01) (img@591@01 y0@586@01 y1@587@01))))
  :pattern ((inv@588@01 y0@586@01 y1@587@01))
  :pattern ((inv@590@01 y0@586@01 y1@587@01))
  :pattern ((img@589@01 y0@586@01 y1@587@01))
  :pattern ((img@591@01 y0@586@01 y1@587@01))
  :qid |Pair-invOfFct|)))
(assert (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (and (img@589@01 x y) (img@591@01 x y))
      (not (= (inv@588@01 x y) (inv@590@01 x y))))
    (and (= (inv@588@01 x y) x) (= (inv@590@01 x y) y)))
  :pattern ((inv@588@01 x y))
  :pattern ((inv@590@01 x y))
  :qid |Pair-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@592@01 ((x $Ref) (y $Ref)) $Perm
  (ite
    (and
      (not (= (inv@588@01 x y) (inv@590@01 x y)))
      (and (img@589@01 x y) (img@591@01 x y))
      (and (= x (inv@588@01 x y)) (= y (inv@590@01 x y))))
    ($Perm.min
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        (- $Perm.Write (pTaken@568@01 x y))
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
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=
    (-
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        (- $Perm.Write (pTaken@568@01 x y))
        $Perm.No)
      (pTaken@592@01 x y))
    $Perm.No)
  
  :qid |quant-u-466|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (not (= (inv@588@01 x y) (inv@590@01 x y)))
      (and (img@589@01 x y) (img@591@01 x y))
      (and (= x (inv@588@01 x y)) (= y (inv@590@01 x y))))
    (= (- $Perm.Write (pTaken@592@01 x y)) $Perm.No))
  
  :qid |quant-u-467|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (not (= (inv@588@01 x y) (inv@590@01 x y)))
      (and (img@589@01 x y) (img@591@01 x y))
      (and (= x (inv@588@01 x y)) (= y (inv@590@01 x y))))
    (= (- $Perm.Write (pTaken@592@01 x y)) $Perm.No))
  
  :qid |quant-u-467|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const y0@593@01 $Ref)
(declare-const y1@594@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] y0 != y1
(assert (not (= y0@593@01 y1@594@01)))
(pop) ; 4
(declare-fun inv@595@01 ($Ref $Ref) $Ref)
(declare-fun img@596@01 ($Ref $Ref) Bool)
(declare-fun inv@597@01 ($Ref $Ref) $Ref)
(declare-fun img@598@01 ($Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((y01@593@01 $Ref) (y11@594@01 $Ref) (y02@593@01 $Ref) (y12@594@01 $Ref)) (!
  (=>
    (and
      (not (= y01@593@01 y11@594@01))
      (not (= y02@593@01 y12@594@01))
      (and (= y01@593@01 y02@593@01) (= y11@594@01 y12@594@01)))
    (and (= y01@593@01 y02@593@01) (= y11@594@01 y12@594@01)))
  
  :qid |Pair-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y0@593@01 $Ref) (y1@594@01 $Ref)) (!
  (=>
    (not (= y0@593@01 y1@594@01))
    (and
      (and
        (= (inv@595@01 y0@593@01 y1@594@01) y0@593@01)
        (= (inv@597@01 y0@593@01 y1@594@01) y1@594@01))
      (and (img@596@01 y0@593@01 y1@594@01) (img@598@01 y0@593@01 y1@594@01))))
  :pattern ((inv@595@01 y0@593@01 y1@594@01))
  :pattern ((inv@597@01 y0@593@01 y1@594@01))
  :pattern ((img@596@01 y0@593@01 y1@594@01))
  :pattern ((img@598@01 y0@593@01 y1@594@01))
  :qid |Pair-invOfFct|)))
(assert (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (and (img@596@01 x y) (img@598@01 x y))
      (not (= (inv@595@01 x y) (inv@597@01 x y))))
    (and (= (inv@595@01 x y) x) (= (inv@597@01 x y) y)))
  :pattern ((inv@595@01 x y))
  :pattern ((inv@597@01 x y))
  :qid |Pair-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@599@01 ((x $Ref) (y $Ref)) $Perm
  (ite
    (and
      (not (= (inv@595@01 x y) (inv@597@01 x y)))
      (and (img@596@01 x y) (img@598@01 x y))
      (and (= x (inv@595@01 x y)) (= y (inv@597@01 x y))))
    ($Perm.min
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        (- $Perm.Write (pTaken@568@01 x y))
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
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=
    (-
      (ite
        (and
          (and (img@557@01 x y) (img@559@01 x y))
          (not (= (inv@556@01 x y) (inv@558@01 x y))))
        (- $Perm.Write (pTaken@568@01 x y))
        $Perm.No)
      (pTaken@599@01 x y))
    $Perm.No)
  
  :qid |quant-u-470|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (not (= (inv@595@01 x y) (inv@597@01 x y)))
      (and (img@596@01 x y) (img@598@01 x y))
      (and (= x (inv@595@01 x y)) (= y (inv@597@01 x y))))
    (= (- $Perm.Write (pTaken@599@01 x y)) $Perm.No))
  
  :qid |quant-u-471|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (not (= (inv@595@01 x y) (inv@597@01 x y)))
      (and (img@596@01 x y) (img@598@01 x y))
      (and (= x (inv@595@01 x y)) (= y (inv@597@01 x y))))
    (= (- $Perm.Write (pTaken@599@01 x y)) $Perm.No))
  
  :qid |quant-u-471|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
