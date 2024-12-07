(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:26:44
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr
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
(declare-sort $PSF<R> 0)
(declare-sort $PSF<wand@0> 0)
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
(declare-fun $SortWrappers.$PSF<R>To$Snap ($PSF<R>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<R> ($Snap) $PSF<R>)
(assert (forall ((x $PSF<R>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<R>($SortWrappers.$PSF<R>To$Snap x)))
    :pattern (($SortWrappers.$PSF<R>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<R>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<R>To$Snap($SortWrappers.$SnapTo$PSF<R> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<R> x))
    :qid |$Snap.$PSF<R>To$SnapTo$PSF<R>|
    )))
(declare-fun $SortWrappers.$PSF<wand@0>To$Snap ($PSF<wand@0>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<wand@0> ($Snap) $PSF<wand@0>)
(assert (forall ((x $PSF<wand@0>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<wand@0>($SortWrappers.$PSF<wand@0>To$Snap x)))
    :pattern (($SortWrappers.$PSF<wand@0>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<wand@0>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<wand@0>To$Snap($SortWrappers.$SnapTo$PSF<wand@0> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<wand@0> x))
    :qid |$Snap.$PSF<wand@0>To$SnapTo$PSF<wand@0>|
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
; /predicate_snap_functions_declarations.smt2 [R: Int]
(declare-fun $PSF.domain_R ($PSF<R>) Set<$Snap>)
(declare-fun $PSF.lookup_R ($PSF<R> $Snap) Int)
(declare-fun $PSF.after_R ($PSF<R> $PSF<R>) Bool)
(declare-fun $PSF.loc_R (Int $Snap) Bool)
(declare-fun $PSF.perm_R ($PPM $Snap) $Perm)
(declare-const $psfTOP_R $PSF<R>)
; /predicate_snap_functions_declarations.smt2 [acc(R(Ref), Perm) --* acc(Ref.f, Perm): Snap]
(declare-fun $PSF.domain_wand@0 ($PSF<wand@0>) Set<$Snap>)
(declare-fun $PSF.lookup_wand@0 ($PSF<wand@0> $Snap) $Snap)
(declare-fun $PSF.after_wand@0 ($PSF<wand@0> $PSF<wand@0>) Bool)
(declare-fun $PSF.loc_wand@0 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_wand@0 ($PPM $Snap) $Perm)
(declare-const $psfTOP_wand@0 $PSF<wand@0>)
(declare-fun MWSF_apply ($MWSF $Snap) $Snap)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun R%trigger ($Snap $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [R: Int]
(assert (forall ((vs $PSF<R>) (ws $PSF<R>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_R vs) ($PSF.domain_R ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_R vs))
            (= ($PSF.lookup_R vs x) ($PSF.lookup_R ws x)))
          :pattern (($PSF.lookup_R vs x) ($PSF.lookup_R ws x))
          :qid |qp.$PSF<R>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<R>To$Snap vs)
              ($SortWrappers.$PSF<R>To$Snap ws)
              )
    :qid |qp.$PSF<R>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_R pm s))
    :pattern (($PSF.perm_R pm s)))))
(assert (forall ((s $Snap) (f Int)) (!
    (= ($PSF.loc_R f s) true)
    :pattern (($PSF.loc_R f s)))))
; /predicate_snap_functions_axioms.smt2 [wand@0: Snap]
(assert (forall ((vs $PSF<wand@0>) (ws $PSF<wand@0>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_wand@0 vs) ($PSF.domain_wand@0 ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_wand@0 vs))
            (= ($PSF.lookup_wand@0 vs x) ($PSF.lookup_wand@0 ws x)))
          :pattern (($PSF.lookup_wand@0 vs x) ($PSF.lookup_wand@0 ws x))
          :qid |qp.$PSF<wand@0>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<wand@0>To$Snap vs)
              ($SortWrappers.$PSF<wand@0>To$Snap ws)
              )
    :qid |qp.$PSF<wand@0>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_wand@0 pm s))
    :pattern (($PSF.perm_wand@0 pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_wand@0 f s) true)
    :pattern (($PSF.loc_wand@0 f s)))))
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
; ---------- foo ----------
(declare-const s@0@01 Set<$Ref>)
(declare-const s@1@01 Set<$Ref>)
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
; inhale (forall z: Ref ::(z in s) ==> acc(R(z), write) --* acc(z.f, write))
(declare-const z@2@01 $Ref)
(push) ; 3
; [eval] (z in s)
(assert (Set_in z@2@01 s@1@01))
(pop) ; 3
(declare-const $t@3@01 $PSF<wand@0>)
(declare-fun inv@4@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@5@01 ($Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@2@01 $Ref) (z2@2@01 $Ref)) (!
  (=>
    (and (Set_in z1@2@01 s@1@01) (Set_in z2@2@01 s@1@01) (= z1@2@01 z2@2@01))
    (= z1@2@01 z2@2@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@2@01 $Ref)) (!
  (=>
    (Set_in z@2@01 s@1@01)
    (and
      (= (inv@4@01 z@2@01 $Perm.Write z@2@01 $Perm.Write) z@2@01)
      (img@5@01 z@2@01 $Perm.Write z@2@01 $Perm.Write)))
  :pattern ((Set_in z@2@01 s@1@01))
  :pattern ((inv@4@01 z@2@01 $Perm.Write z@2@01 $Perm.Write))
  :pattern ((img@5@01 z@2@01 $Perm.Write z@2@01 $Perm.Write))
  :qid |quant-u-1|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
    (and
      (= (inv@4@01 x0 x1 x2 x3) x0)
      (= $Perm.Write x1)
      (= (inv@4@01 x0 x1 x2 x3) x2)
      (= $Perm.Write x3)))
  :pattern ((inv@4@01 x0 x1 x2 x3))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::(z in s) ==> acc(R(z), write))
(declare-const z@6@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in s)
(assert (Set_in z@6@01 s@1@01))
(pop) ; 3
(declare-const $t@7@01 $PSF<R>)
(declare-fun inv@8@01 ($Ref) $Ref)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@6@01 $Ref) (z2@6@01 $Ref)) (!
  (=>
    (and (Set_in z1@6@01 s@1@01) (Set_in z2@6@01 s@1@01) (= z1@6@01 z2@6@01))
    (= z1@6@01 z2@6@01))
  
  :qid |R-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@6@01 $Ref)) (!
  (=>
    (Set_in z@6@01 s@1@01)
    (and (= (inv@8@01 z@6@01) z@6@01) (img@9@01 z@6@01)))
  :pattern ((Set_in z@6@01 s@1@01))
  :pattern ((inv@8@01 z@6@01))
  :pattern ((img@9@01 z@6@01))
  :qid |quant-u-3|)))
(assert (forall ((x $Ref)) (!
  (=> (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) (= (inv@8@01 x) x))
  :pattern ((inv@8@01 x))
  :qid |R-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::
;     { (z in s) }
;     (z in s) ==>
;     (applying acc(R(z), write) --* acc(z.f, write) in
;       z.f == 3))
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] (forall z: Ref :: { (z in s) } (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f == 3))
(declare-const z@11@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f == 3)
; [eval] (z in s)
(push) ; 4
; [then-branch: 0 | z@11@01 in s@1@01 | live]
; [else-branch: 0 | !(z@11@01 in s@1@01) | live]
(push) ; 5
; [then-branch: 0 | z@11@01 in s@1@01]
(assert (Set_in z@11@01 s@1@01))
; [eval] (applying acc(R(z), write) --* acc(z.f, write) in z.f == 3)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@12@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (z@11@01 $Ref)) $Perm
  (ite
    (and (= x0 z@11@01) (= x1 $Perm.Write) (= x2 z@11@01) (= x3 $Perm.Write))
    ($Perm.min
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    (-
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@12@01 x0 x1 x2 x3 z@11@01))
    $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (= (pTaken@12@01 x0 x1 x2 x3 z@11@01) $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (= x0 z@11@01) (= x1 $Perm.Write) (= x2 z@11@01) (= x3 $Perm.Write))
    (= (- $Perm.Write (pTaken@12@01 x0 x1 x2 x3 z@11@01)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@13@01 $PSF<wand@0>)
(declare-const s@14@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@5@01 z@11@01 $Perm.Write z@11@01 $Perm.Write)
    (Set_in (inv@4@01 z@11@01 $Perm.Write z@11@01 $Perm.Write) s@1@01))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@11@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@11@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@11@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@11@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@0 $t@3@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@11@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@11@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@15@01 ((x $Ref) (z@11@01 $Ref)) $Perm
  (ite
    (= x z@11@01)
    ($Perm.min
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
      (pTaken@15@01 x z@11@01))
    $Perm.No)
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@15@01 x z@11@01) $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x z@11@01) (= (- $Perm.Write (pTaken@15@01 x z@11@01)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@16@01 $PSF<R>)
(declare-const s@17@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@9@01 z@11@01) (Set_in (inv@8@01 z@11@01) s@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@11@01) $Snap.unit))
    (=
      ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@11@01))
      ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@11@01))))))
(assert (=
  ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@11@01)))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap z@11@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap z@11@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (not (= z@11@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z.f == 3
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@5@01 z@11@01 $Perm.Write z@11@01 $Perm.Write)
      (Set_in (inv@4@01 z@11@01 $Perm.Write z@11@01 $Perm.Write) s@1@01))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@11@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@11@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@11@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@11@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write)))
        ($PSF.lookup_wand@0 $t@3@01 ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@11@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@11@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))))))
  (=>
    (and (img@9@01 z@11@01) (Set_in (inv@8@01 z@11@01) s@1@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap z@11@01) $Snap.unit))
      (=
        ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@11@01))
        ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@11@01)))))
  (=
    ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@11@01)))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap z@11@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap z@11@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  (not (= z@11@01 $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 0 | !(z@11@01 in s@1@01)]
(assert (not (Set_in z@11@01 s@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in z@11@01 s@1@01)
  (and
    (Set_in z@11@01 s@1@01)
    (=>
      (and
        (img@5@01 z@11@01 $Perm.Write z@11@01 $Perm.Write)
        (Set_in (inv@4@01 z@11@01 $Perm.Write z@11@01 $Perm.Write) s@1@01))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap z@11@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap z@11@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@11@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@11@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))
          ($PSF.lookup_wand@0 $t@3@01 ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@11@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@11@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    (=>
      (and (img@9@01 z@11@01) (Set_in (inv@8@01 z@11@01) s@1@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap z@11@01) $Snap.unit))
        (=
          ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@11@01))
          ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@11@01)))))
    (=
      ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@11@01)))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@11@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@11@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
    (not (= z@11@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in z@11@01 s@1@01)) (Set_in z@11@01 s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@11@01 $Ref)) (!
  (and
    (=>
      (Set_in z@11@01 s@1@01)
      (and
        (Set_in z@11@01 s@1@01)
        (=>
          (and
            (img@5@01 z@11@01 $Perm.Write z@11@01 $Perm.Write)
            (Set_in (inv@4@01 z@11@01 $Perm.Write z@11@01 $Perm.Write) s@1@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap z@11@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap z@11@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@11@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@11@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write)))
              ($PSF.lookup_wand@0 $t@3@01 ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@11@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@11@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))))))
        (=>
          (and (img@9@01 z@11@01) (Set_in (inv@8@01 z@11@01) s@1@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap z@11@01) $Snap.unit))
            (=
              ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@11@01))
              ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@11@01)))))
        (=
          ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@11@01)))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@11@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@11@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))))
        (not (= z@11@01 $Ref.null))))
    (or (not (Set_in z@11@01 s@1@01)) (Set_in z@11@01 s@1@01)))
  :pattern ((Set_in z@11@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@17@12@17@80-aux|)))
(assert (forall ((z@11@01 $Ref)) (!
  (=>
    (Set_in z@11@01 s@1@01)
    (=
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@11@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@11@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      3))
  :pattern ((Set_in z@11@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@17@12@17@80|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall z: Ref ::
;     { (z in s) }
;     (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2))
; [eval] (forall z: Ref :: { (z in s) } (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2))
(declare-const z@18@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
; [eval] (z in s)
(push) ; 4
; [then-branch: 1 | z@18@01 in s@1@01 | live]
; [else-branch: 1 | !(z@18@01 in s@1@01) | live]
(push) ; 5
; [then-branch: 1 | z@18@01 in s@1@01]
(assert (Set_in z@18@01 s@1@01))
; [eval] (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (z@18@01 $Ref)) $Perm
  (ite
    (and (= x0 z@18@01) (= x1 $Perm.Write) (= x2 z@18@01) (= x3 $Perm.Write))
    ($Perm.min
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    (-
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@19@01 x0 x1 x2 x3 z@18@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (= (pTaken@19@01 x0 x1 x2 x3 z@18@01) $Perm.No)
  
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (= x0 z@18@01) (= x1 $Perm.Write) (= x2 z@18@01) (= x3 $Perm.Write))
    (= (- $Perm.Write (pTaken@19@01 x0 x1 x2 x3 z@18@01)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@5@01 z@18@01 $Perm.Write z@18@01 $Perm.Write)
    (Set_in (inv@4@01 z@18@01 $Perm.Write z@18@01 $Perm.Write) s@1@01))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@18@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@18@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@18@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@18@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@0 $t@3@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@18@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@18@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((x $Ref) (z@18@01 $Ref)) $Perm
  (ite
    (= x z@18@01)
    ($Perm.min
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
      (pTaken@20@01 x z@18@01))
    $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@20@01 x z@18@01) $Perm.No)
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x z@18@01) (= (- $Perm.Write (pTaken@20@01 x z@18@01)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@9@01 z@18@01) (Set_in (inv@8@01 z@18@01) s@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@18@01) $Snap.unit))
    (=
      ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@18@01))
      ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@18@01))))))
(assert (=
  ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@18@01)))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap z@18@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap z@18@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (not (= z@18@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z.f > 2
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@5@01 z@18@01 $Perm.Write z@18@01 $Perm.Write)
      (Set_in (inv@4@01 z@18@01 $Perm.Write z@18@01 $Perm.Write) s@1@01))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@18@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@18@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@18@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@18@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write)))
        ($PSF.lookup_wand@0 $t@3@01 ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@18@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@18@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))))))
  (=>
    (and (img@9@01 z@18@01) (Set_in (inv@8@01 z@18@01) s@1@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap z@18@01) $Snap.unit))
      (=
        ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@18@01))
        ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@18@01)))))
  (=
    ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@18@01)))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap z@18@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap z@18@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  (not (= z@18@01 $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | !(z@18@01 in s@1@01)]
(assert (not (Set_in z@18@01 s@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in z@18@01 s@1@01)
  (and
    (Set_in z@18@01 s@1@01)
    (=>
      (and
        (img@5@01 z@18@01 $Perm.Write z@18@01 $Perm.Write)
        (Set_in (inv@4@01 z@18@01 $Perm.Write z@18@01 $Perm.Write) s@1@01))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap z@18@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap z@18@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@18@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@18@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))
          ($PSF.lookup_wand@0 $t@3@01 ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@18@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@18@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    (=>
      (and (img@9@01 z@18@01) (Set_in (inv@8@01 z@18@01) s@1@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap z@18@01) $Snap.unit))
        (=
          ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@18@01))
          ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@18@01)))))
    (=
      ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@18@01)))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@18@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@18@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
    (not (= z@18@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in z@18@01 s@1@01)) (Set_in z@18@01 s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@18@01 $Ref)) (!
  (and
    (=>
      (Set_in z@18@01 s@1@01)
      (and
        (Set_in z@18@01 s@1@01)
        (=>
          (and
            (img@5@01 z@18@01 $Perm.Write z@18@01 $Perm.Write)
            (Set_in (inv@4@01 z@18@01 $Perm.Write z@18@01 $Perm.Write) s@1@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap z@18@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap z@18@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@18@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@18@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write)))
              ($PSF.lookup_wand@0 $t@3@01 ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@18@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@18@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))))))
        (=>
          (and (img@9@01 z@18@01) (Set_in (inv@8@01 z@18@01) s@1@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap z@18@01) $Snap.unit))
            (=
              ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@18@01))
              ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@18@01)))))
        (=
          ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@18@01)))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@18@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@18@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))))
        (not (= z@18@01 $Ref.null))))
    (or (not (Set_in z@18@01 s@1@01)) (Set_in z@18@01 s@1@01)))
  :pattern ((Set_in z@18@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@20@12@20@79-aux|)))
(push) ; 3
(assert (not (forall ((z@18@01 $Ref)) (!
  (=>
    (Set_in z@18@01 s@1@01)
    (>
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@18@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@18@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      2))
  :pattern ((Set_in z@18@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@20@12@20@79|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((z@18@01 $Ref)) (!
  (=>
    (Set_in z@18@01 s@1@01)
    (>
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@0 (as sm@13@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@18@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@18@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      2))
  :pattern ((Set_in z@18@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@20@12@20@79|)))
; [exec]
; quasihavocall z: Ref :: (z in s) ==> acc(R(z), write) --* acc(z.f, write)
(declare-const z@21@01 $Ref)
(push) ; 3
; [eval] (z in s)
(assert (Set_in z@21@01 s@1@01))
(pop) ; 3
; Check havocall receiver injectivity
(push) ; 3
(assert (not (forall ((z1@21@01 $Ref) (z2@21@01 $Ref)) (!
  (=>
    (and (Set_in z1@21@01 s@1@01) (Set_in z2@21@01 s@1@01) (= z1@21@01 z2@21@01))
    (= z1@21@01 z2@21@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-fun inv@22@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@23@01 ($Ref $Perm $Ref $Perm) Bool)
; Definitional axioms for havocall inverse functions
(assert (forall ((z@21@01 $Ref)) (!
  (=>
    (Set_in z@21@01 s@1@01)
    (and
      (= (inv@22@01 z@21@01 $Perm.Write z@21@01 $Perm.Write) z@21@01)
      (img@23@01 z@21@01 $Perm.Write z@21@01 $Perm.Write)))
  :pattern ((Set_in z@21@01 s@1@01))
  :pattern ((inv@22@01 z@21@01 $Perm.Write z@21@01 $Perm.Write))
  :pattern ((img@23@01 z@21@01 $Perm.Write z@21@01 $Perm.Write))
  :qid |wand@0-invOfFct|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (img@23@01 x0 x1 x2 x3) (Set_in (inv@22@01 x0 x1 x2 x3) s@1@01))
    (and
      (= (inv@22@01 x0 x1 x2 x3) x0)
      (= $Perm.Write x1)
      (= (inv@22@01 x0 x1 x2 x3) x2)
      (= $Perm.Write x3)))
  :pattern ((inv@22@01 x0 x1 x2 x3))
  :qid |wand@0-fctOfInv|)))
(declare-const sm@24@01 $PSF<wand@0>)
; axiomatized snapshot map after havoc
(assert (forall ((s@$ $Snap)) (!
  (=>
    (not
      (and
        (Set_in (inv@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@$))) s@1@01)
        (img@23@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@$))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@$)))))
    (=
      ($PSF.lookup_wand@0 $t@3@01 s@$)
      ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) s@$)))
  :pattern (($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) s@$))
  :pattern (($PSF.lookup_wand@0 $t@3@01 s@$))
  :qid |qp.smValDef0|)))
; [exec]
; assert (forall z: Ref ::
;     { (z in s) }
;     (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2))
; [eval] (forall z: Ref :: { (z in s) } (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2))
(declare-const z@25@01 $Ref)
(push) ; 3
; [eval] (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
; [eval] (z in s)
(push) ; 4
; [then-branch: 2 | z@25@01 in s@1@01 | live]
; [else-branch: 2 | !(z@25@01 in s@1@01) | live]
(push) ; 5
; [then-branch: 2 | z@25@01 in s@1@01]
(assert (Set_in z@25@01 s@1@01))
; [eval] (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (z@25@01 $Ref)) $Perm
  (ite
    (and (= x0 z@25@01) (= x1 $Perm.Write) (= x2 z@25@01) (= x3 $Perm.Write))
    ($Perm.min
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    (-
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@26@01 x0 x1 x2 x3 z@25@01))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (= (pTaken@26@01 x0 x1 x2 x3 z@25@01) $Perm.No)
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (= x0 z@25@01) (= x1 $Perm.Write) (= x2 z@25@01) (= x3 $Perm.Write))
    (= (- $Perm.Write (pTaken@26@01 x0 x1 x2 x3 z@25@01)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@27@01 $PSF<wand@0>)
(declare-const s@28@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@5@01 z@25@01 $Perm.Write z@25@01 $Perm.Write)
    (Set_in (inv@4@01 z@25@01 $Perm.Write z@25@01 $Perm.Write) s@1@01))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@25@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@25@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@25@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@25@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@25@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@25@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@29@01 ((x $Ref) (z@25@01 $Ref)) $Perm
  (ite
    (= x z@25@01)
    ($Perm.min
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
      (pTaken@29@01 x z@25@01))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@29@01 x z@25@01) $Perm.No)
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x z@25@01) (= (- $Perm.Write (pTaken@29@01 x z@25@01)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@9@01 z@25@01) (Set_in (inv@8@01 z@25@01) s@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@25@01) $Snap.unit))
    (=
      ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@25@01))
      ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@25@01))))))
(assert (=
  ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@25@01)))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap z@25@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap z@25@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (not (= z@25@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z.f > 2
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@5@01 z@25@01 $Perm.Write z@25@01 $Perm.Write)
      (Set_in (inv@4@01 z@25@01 $Perm.Write z@25@01 $Perm.Write) s@1@01))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@25@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@25@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@25@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@25@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write)))
        ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@25@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@25@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))))))
  (=>
    (and (img@9@01 z@25@01) (Set_in (inv@8@01 z@25@01) s@1@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap z@25@01) $Snap.unit))
      (=
        ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@25@01))
        ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@25@01)))))
  (=
    ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@25@01)))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap z@25@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap z@25@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  (not (= z@25@01 $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 2 | !(z@25@01 in s@1@01)]
(assert (not (Set_in z@25@01 s@1@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in z@25@01 s@1@01)
  (and
    (Set_in z@25@01 s@1@01)
    (=>
      (and
        (img@5@01 z@25@01 $Perm.Write z@25@01 $Perm.Write)
        (Set_in (inv@4@01 z@25@01 $Perm.Write z@25@01 $Perm.Write) s@1@01))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap z@25@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap z@25@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@25@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@25@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))
          ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@25@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@25@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    (=>
      (and (img@9@01 z@25@01) (Set_in (inv@8@01 z@25@01) s@1@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap z@25@01) $Snap.unit))
        (=
          ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@25@01))
          ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@25@01)))))
    (=
      ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@25@01)))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@25@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@25@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
    (not (= z@25@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in z@25@01 s@1@01)) (Set_in z@25@01 s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@25@01 $Ref)) (!
  (and
    (=>
      (Set_in z@25@01 s@1@01)
      (and
        (Set_in z@25@01 s@1@01)
        (=>
          (and
            (img@5@01 z@25@01 $Perm.Write z@25@01 $Perm.Write)
            (Set_in (inv@4@01 z@25@01 $Perm.Write z@25@01 $Perm.Write) s@1@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap z@25@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap z@25@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@25@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@25@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write)))
              ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@25@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@25@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))))))
        (=>
          (and (img@9@01 z@25@01) (Set_in (inv@8@01 z@25@01) s@1@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap z@25@01) $Snap.unit))
            (=
              ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@25@01))
              ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@25@01)))))
        (=
          ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@25@01)))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@25@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@25@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))))
        (not (= z@25@01 $Ref.null))))
    (or (not (Set_in z@25@01 s@1@01)) (Set_in z@25@01 s@1@01)))
  :pattern ((Set_in z@25@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@26@12@26@79-aux|)))
(push) ; 3
(assert (not (forall ((z@25@01 $Ref)) (!
  (=>
    (Set_in z@25@01 s@1@01)
    (>
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@0 (as sm@27@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@25@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@25@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      2))
  :pattern ((Set_in z@25@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@26@12@26@79|))))
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
; [eval] (forall z: Ref :: { (z in s) } (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2))
(declare-const z@30@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
; [eval] (z in s)
(push) ; 4
; [then-branch: 3 | z@30@01 in s@1@01 | live]
; [else-branch: 3 | !(z@30@01 in s@1@01) | live]
(push) ; 5
; [then-branch: 3 | z@30@01 in s@1@01]
(assert (Set_in z@30@01 s@1@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@31@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (z@30@01 $Ref)) $Perm
  (ite
    (and (= x0 z@30@01) (= x1 $Perm.Write) (= x2 z@30@01) (= x3 $Perm.Write))
    ($Perm.min
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    (-
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@31@01 x0 x1 x2 x3 z@30@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (= (pTaken@31@01 x0 x1 x2 x3 z@30@01) $Perm.No)
  
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (= x0 z@30@01) (= x1 $Perm.Write) (= x2 z@30@01) (= x3 $Perm.Write))
    (= (- $Perm.Write (pTaken@31@01 x0 x1 x2 x3 z@30@01)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $PSF<wand@0>)
(declare-const s@33@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@5@01 z@30@01 $Perm.Write z@30@01 $Perm.Write)
    (Set_in (inv@4@01 z@30@01 $Perm.Write z@30@01 $Perm.Write) s@1@01))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@30@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@30@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@30@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@30@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@30@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@30@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@34@01 ((x $Ref) (z@30@01 $Ref)) $Perm
  (ite
    (= x z@30@01)
    ($Perm.min
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
      (pTaken@34@01 x z@30@01))
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
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@34@01 x z@30@01) $Perm.No)
  
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
(assert (not (forall ((x $Ref)) (!
  (=> (= x z@30@01) (= (- $Perm.Write (pTaken@34@01 x z@30@01)) $Perm.No))
  
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
  (and (img@9@01 z@30@01) (Set_in (inv@8@01 z@30@01) s@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@30@01) $Snap.unit))
    (=
      ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@30@01))
      ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@30@01))))))
(assert (=
  ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@30@01)))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap z@30@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap z@30@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (not (= z@30@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z.f > 2
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@5@01 z@30@01 $Perm.Write z@30@01 $Perm.Write)
      (Set_in (inv@4@01 z@30@01 $Perm.Write z@30@01 $Perm.Write) s@1@01))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@30@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@30@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@30@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@30@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write)))
        ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@30@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@30@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))))))
  (=>
    (and (img@9@01 z@30@01) (Set_in (inv@8@01 z@30@01) s@1@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap z@30@01) $Snap.unit))
      (=
        ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@30@01))
        ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@30@01)))))
  (=
    ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@30@01)))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap z@30@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap z@30@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  (not (= z@30@01 $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 3 | !(z@30@01 in s@1@01)]
(assert (not (Set_in z@30@01 s@1@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in z@30@01 s@1@01)
  (and
    (Set_in z@30@01 s@1@01)
    (=>
      (and
        (img@5@01 z@30@01 $Perm.Write z@30@01 $Perm.Write)
        (Set_in (inv@4@01 z@30@01 $Perm.Write z@30@01 $Perm.Write) s@1@01))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap z@30@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap z@30@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@30@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@30@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))
          ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@30@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@30@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    (=>
      (and (img@9@01 z@30@01) (Set_in (inv@8@01 z@30@01) s@1@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap z@30@01) $Snap.unit))
        (=
          ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@30@01))
          ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@30@01)))))
    (=
      ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@30@01)))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@30@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@30@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
    (not (= z@30@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in z@30@01 s@1@01)) (Set_in z@30@01 s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@30@01 $Ref)) (!
  (and
    (=>
      (Set_in z@30@01 s@1@01)
      (and
        (Set_in z@30@01 s@1@01)
        (=>
          (and
            (img@5@01 z@30@01 $Perm.Write z@30@01 $Perm.Write)
            (Set_in (inv@4@01 z@30@01 $Perm.Write z@30@01 $Perm.Write) s@1@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap z@30@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap z@30@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@30@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@30@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write)))
              ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@30@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@30@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))))))
        (=>
          (and (img@9@01 z@30@01) (Set_in (inv@8@01 z@30@01) s@1@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap z@30@01) $Snap.unit))
            (=
              ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@30@01))
              ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@30@01)))))
        (=
          ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@30@01)))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@30@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@30@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))))
        (not (= z@30@01 $Ref.null))))
    (or (not (Set_in z@30@01 s@1@01)) (Set_in z@30@01 s@1@01)))
  :pattern ((Set_in z@30@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@26@12@26@79-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((z@30@01 $Ref)) (!
  (=>
    (Set_in z@30@01 s@1@01)
    (>
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@0 (as sm@32@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@30@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@30@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      2))
  :pattern ((Set_in z@30@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@26@12@26@79|))))
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
; [eval] (forall z: Ref :: { (z in s) } (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2))
(declare-const z@35@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
; [eval] (z in s)
(push) ; 4
; [then-branch: 4 | z@35@01 in s@1@01 | live]
; [else-branch: 4 | !(z@35@01 in s@1@01) | live]
(push) ; 5
; [then-branch: 4 | z@35@01 in s@1@01]
(assert (Set_in z@35@01 s@1@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (z@35@01 $Ref)) $Perm
  (ite
    (and (= x0 z@35@01) (= x1 $Perm.Write) (= x2 z@35@01) (= x3 $Perm.Write))
    ($Perm.min
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    (-
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@36@01 x0 x1 x2 x3 z@35@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (= (pTaken@36@01 x0 x1 x2 x3 z@35@01) $Perm.No)
  
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (= x0 z@35@01) (= x1 $Perm.Write) (= x2 z@35@01) (= x3 $Perm.Write))
    (= (- $Perm.Write (pTaken@36@01 x0 x1 x2 x3 z@35@01)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@37@01 $PSF<wand@0>)
(declare-const s@38@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@5@01 z@35@01 $Perm.Write z@35@01 $Perm.Write)
    (Set_in (inv@4@01 z@35@01 $Perm.Write z@35@01 $Perm.Write) s@1@01))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@35@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@35@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@35@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@35@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@35@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@35@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@39@01 ((x $Ref) (z@35@01 $Ref)) $Perm
  (ite
    (= x z@35@01)
    ($Perm.min
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
      (pTaken@39@01 x z@35@01))
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
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@39@01 x z@35@01) $Perm.No)
  
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
(assert (not (forall ((x $Ref)) (!
  (=> (= x z@35@01) (= (- $Perm.Write (pTaken@39@01 x z@35@01)) $Perm.No))
  
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
  (and (img@9@01 z@35@01) (Set_in (inv@8@01 z@35@01) s@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@35@01) $Snap.unit))
    (=
      ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@35@01))
      ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@35@01))))))
(assert (=
  ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@35@01)))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap z@35@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap z@35@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (not (= z@35@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z.f > 2
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@5@01 z@35@01 $Perm.Write z@35@01 $Perm.Write)
      (Set_in (inv@4@01 z@35@01 $Perm.Write z@35@01 $Perm.Write) s@1@01))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@35@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@35@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@35@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@35@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write)))
        ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@35@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@35@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))))))
  (=>
    (and (img@9@01 z@35@01) (Set_in (inv@8@01 z@35@01) s@1@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap z@35@01) $Snap.unit))
      (=
        ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@35@01))
        ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@35@01)))))
  (=
    ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@35@01)))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap z@35@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap z@35@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  (not (= z@35@01 $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | !(z@35@01 in s@1@01)]
(assert (not (Set_in z@35@01 s@1@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in z@35@01 s@1@01)
  (and
    (Set_in z@35@01 s@1@01)
    (=>
      (and
        (img@5@01 z@35@01 $Perm.Write z@35@01 $Perm.Write)
        (Set_in (inv@4@01 z@35@01 $Perm.Write z@35@01 $Perm.Write) s@1@01))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap z@35@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap z@35@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@35@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@35@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))
          ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@35@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@35@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    (=>
      (and (img@9@01 z@35@01) (Set_in (inv@8@01 z@35@01) s@1@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap z@35@01) $Snap.unit))
        (=
          ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@35@01))
          ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@35@01)))))
    (=
      ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@35@01)))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@35@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@35@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
    (not (= z@35@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in z@35@01 s@1@01)) (Set_in z@35@01 s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@35@01 $Ref)) (!
  (and
    (=>
      (Set_in z@35@01 s@1@01)
      (and
        (Set_in z@35@01 s@1@01)
        (=>
          (and
            (img@5@01 z@35@01 $Perm.Write z@35@01 $Perm.Write)
            (Set_in (inv@4@01 z@35@01 $Perm.Write z@35@01 $Perm.Write) s@1@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap z@35@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap z@35@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@35@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@35@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write)))
              ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@35@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@35@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))))))
        (=>
          (and (img@9@01 z@35@01) (Set_in (inv@8@01 z@35@01) s@1@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap z@35@01) $Snap.unit))
            (=
              ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@35@01))
              ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@35@01)))))
        (=
          ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@35@01)))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@35@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@35@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))))
        (not (= z@35@01 $Ref.null))))
    (or (not (Set_in z@35@01 s@1@01)) (Set_in z@35@01 s@1@01)))
  :pattern ((Set_in z@35@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@26@12@26@79-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((z@35@01 $Ref)) (!
  (=>
    (Set_in z@35@01 s@1@01)
    (>
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@0 (as sm@37@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@35@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@35@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      2))
  :pattern ((Set_in z@35@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@26@12@26@79|))))
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
; [eval] (forall z: Ref :: { (z in s) } (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2))
(declare-const z@40@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in s) ==> (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
; [eval] (z in s)
(push) ; 4
; [then-branch: 5 | z@40@01 in s@1@01 | live]
; [else-branch: 5 | !(z@40@01 in s@1@01) | live]
(push) ; 5
; [then-branch: 5 | z@40@01 in s@1@01]
(assert (Set_in z@40@01 s@1@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (applying acc(R(z), write) --* acc(z.f, write) in z.f > 2)
(set-option :timeout 0)
(push) ; 6
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm) (z@40@01 $Ref)) $Perm
  (ite
    (and (= x0 z@40@01) (= x1 $Perm.Write) (= x2 z@40@01) (= x3 $Perm.Write))
    ($Perm.min
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    (-
      (ite
        (and (img@5@01 x0 x1 x2 x3) (Set_in (inv@4@01 x0 x1 x2 x3) s@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@41@01 x0 x1 x2 x3 z@40@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (= (pTaken@41@01 x0 x1 x2 x3 z@40@01) $Perm.No)
  
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (= x0 z@40@01) (= x1 $Perm.Write) (= x2 z@40@01) (= x3 $Perm.Write))
    (= (- $Perm.Write (pTaken@41@01 x0 x1 x2 x3 z@40@01)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $PSF<wand@0>)
(declare-const s@43@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@5@01 z@40@01 $Perm.Write z@40@01 $Perm.Write)
    (Set_in (inv@4@01 z@40@01 $Perm.Write z@40@01 $Perm.Write) s@1@01))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@40@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@40@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@40@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@40@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@40@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@40@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@44@01 ((x $Ref) (z@40@01 $Ref)) $Perm
  (ite
    (= x z@40@01)
    ($Perm.min
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
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
(assert (not (forall ((x $Ref)) (!
  (=
    (-
      (ite (and (img@9@01 x) (Set_in (inv@8@01 x) s@1@01)) $Perm.Write $Perm.No)
      (pTaken@44@01 x z@40@01))
    $Perm.No)
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((x $Ref)) (!
  (= (pTaken@44@01 x z@40@01) $Perm.No)
  
  :qid |quant-u-50|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((x $Ref)) (!
  (=> (= x z@40@01) (= (- $Perm.Write (pTaken@44@01 x z@40@01)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@9@01 z@40@01) (Set_in (inv@8@01 z@40@01) s@1@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap z@40@01) $Snap.unit))
    (=
      ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@40@01))
      ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@40@01))))))
(assert (=
  ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@40@01)))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap z@40@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap z@40@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(assert (not (= z@40@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] z.f > 2
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (and
      (img@5@01 z@40@01 $Perm.Write z@40@01 $Perm.Write)
      (Set_in (inv@4@01 z@40@01 $Perm.Write z@40@01 $Perm.Write) s@1@01))
    (and
      (not
        (=
          ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@40@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@40@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@40@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@40@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write)))
        ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@40@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap z@40@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))))))
  (=>
    (and (img@9@01 z@40@01) (Set_in (inv@8@01 z@40@01) s@1@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap z@40@01) $Snap.unit))
      (=
        ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@40@01))
        ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@40@01)))))
  (=
    ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@40@01)))
    ($Snap.first ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap z@40@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap z@40@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))))
  (not (= z@40@01 $Ref.null))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 5 | !(z@40@01 in s@1@01)]
(assert (not (Set_in z@40@01 s@1@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in z@40@01 s@1@01)
  (and
    (Set_in z@40@01 s@1@01)
    (=>
      (and
        (img@5@01 z@40@01 $Perm.Write z@40@01 $Perm.Write)
        (Set_in (inv@4@01 z@40@01 $Perm.Write z@40@01 $Perm.Write) s@1@01))
      (and
        (not
          (=
            ($Snap.combine
              ($Snap.combine
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap z@40@01)
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                ($SortWrappers.$RefTo$Snap z@40@01))
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            $Snap.unit))
        (=
          ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@40@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@40@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))
          ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@40@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@40@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write))))))
    (=>
      (and (img@9@01 z@40@01) (Set_in (inv@8@01 z@40@01) s@1@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap z@40@01) $Snap.unit))
        (=
          ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@40@01))
          ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@40@01)))))
    (=
      ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@40@01)))
      ($Snap.first ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@40@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@40@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
    (not (= z@40@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in z@40@01 s@1@01)) (Set_in z@40@01 s@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@40@01 $Ref)) (!
  (and
    (=>
      (Set_in z@40@01 s@1@01)
      (and
        (Set_in z@40@01 s@1@01)
        (=>
          (and
            (img@5@01 z@40@01 $Perm.Write z@40@01 $Perm.Write)
            (Set_in (inv@4@01 z@40@01 $Perm.Write z@40@01 $Perm.Write) s@1@01))
          (and
            (not
              (=
                ($Snap.combine
                  ($Snap.combine
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap z@40@01)
                      ($SortWrappers.$PermTo$Snap $Perm.Write))
                    ($SortWrappers.$RefTo$Snap z@40@01))
                  ($SortWrappers.$PermTo$Snap $Perm.Write))
                $Snap.unit))
            (=
              ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@40@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@40@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write)))
              ($PSF.lookup_wand@0 (as sm@24@01  $PSF<wand@0>) ($Snap.combine
                ($Snap.combine
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap z@40@01)
                    ($SortWrappers.$PermTo$Snap $Perm.Write))
                  ($SortWrappers.$RefTo$Snap z@40@01))
                ($SortWrappers.$PermTo$Snap $Perm.Write))))))
        (=>
          (and (img@9@01 z@40@01) (Set_in (inv@8@01 z@40@01) s@1@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap z@40@01) $Snap.unit))
            (=
              ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@40@01))
              ($PSF.lookup_R $t@7@01 ($SortWrappers.$RefTo$Snap z@40@01)))))
        (=
          ($SortWrappers.IntTo$Snap ($PSF.lookup_R (as sm@16@01  $PSF<R>) ($SortWrappers.$RefTo$Snap z@40@01)))
          ($Snap.first ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
            ($Snap.combine
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap z@40@01)
                ($SortWrappers.$PermTo$Snap $Perm.Write))
              ($SortWrappers.$RefTo$Snap z@40@01))
            ($SortWrappers.$PermTo$Snap $Perm.Write)))))
        (not (= z@40@01 $Ref.null))))
    (or (not (Set_in z@40@01 s@1@01)) (Set_in z@40@01 s@1@01)))
  :pattern ((Set_in z@40@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@26@12@26@79-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((z@40@01 $Ref)) (!
  (=>
    (Set_in z@40@01 s@1@01)
    (>
      ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@40@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap z@40@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))
      2))
  :pattern ((Set_in z@40@01 s@1@01))
  :qid |prog./silicon/silver/src/test/resources/quasihavoc/havoc_qp7.vpr@26@12@26@79|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
