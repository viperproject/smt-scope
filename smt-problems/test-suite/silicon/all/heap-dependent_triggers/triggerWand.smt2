(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/heap-dependent_triggers/triggerWand.vpr
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
(declare-sort $FVF<f> 0)
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
(declare-fun $SortWrappers.$FVF<f>To$Snap ($FVF<f>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<f> ($Snap) $FVF<f>)
(assert (forall ((x $FVF<f>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<f>($SortWrappers.$FVF<f>To$Snap x)))
    :pattern (($SortWrappers.$FVF<f>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<f>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<f>To$Snap($SortWrappers.$SnapTo$FVF<f> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<f> x))
    :qid |$Snap.$FVF<f>To$SnapTo$FVF<f>|
    )))
; Declaring additional sort wrappers
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /predicate_snap_functions_declarations.smt2 [acc(Ref.f, Perm) --* acc(Ref.f, Perm): Snap]
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
; /field_value_functions_axioms.smt2 [f: Int]
(assert (forall ((vs $FVF<f>) (ws $FVF<f>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_f vs) ($FVF.domain_f ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_f vs))
            (= ($FVF.lookup_f vs x) ($FVF.lookup_f ws x)))
          :pattern (($FVF.lookup_f vs x) ($FVF.lookup_f ws x))
          :qid |qp.$FVF<f>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<f>To$Snap vs)
              ($SortWrappers.$FVF<f>To$Snap ws)
              )
    :qid |qp.$FVF<f>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_f pm r))
    :pattern (($FVF.perm_f pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
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
; ---------- m1 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const y@1@01 $Ref)
(declare-const xs@2@01 Set<$Ref>)
(declare-const y@3@01 $Ref)
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
; var z: Ref
(declare-const z@4@01 $Ref)
; [exec]
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@5@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@5@01 xs@2@01))
(pop) ; 3
(declare-const $t@6@01 $FVF<f>)
(declare-fun inv@7@01 ($Ref) $Ref)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@5@01 $Ref) (x2@5@01 $Ref)) (!
  (=>
    (and (Set_in x1@5@01 xs@2@01) (Set_in x2@5@01 xs@2@01) (= x1@5@01 x2@5@01))
    (= x1@5@01 x2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@5@01 $Ref)) (!
  (=>
    (Set_in x@5@01 xs@2@01)
    (and (= (inv@7@01 x@5@01) x@5@01) (img@8@01 x@5@01)))
  :pattern ((Set_in x@5@01 xs@2@01))
  :pattern ((inv@7@01 x@5@01))
  :pattern ((img@8@01 x@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01)) (= (inv@7@01 r) r))
  :pattern ((inv@7@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@5@01 $Ref)) (!
  (=> (Set_in x@5@01 xs@2@01) (not (= x@5@01 $Ref.null)))
  :pattern ((Set_in x@5@01 xs@2@01))
  :pattern ((inv@7@01 x@5@01))
  :pattern ((img@8@01 x@5@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref ::
;     { acc(x.f, write) --* acc(y.f, write) }
;     (x in xs) ==> acc(x.f, write) --* acc(y.f, write))
(declare-const x@9@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@9@01 xs@2@01))
(declare-const sm@10@01 $PSF<wand@0>)
(declare-const s@11@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@12@01 $PSF<wand@0>)
(declare-fun inv@13@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@14@01 ($Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@9@01 $Ref) (x2@9@01 $Ref)) (!
  (=>
    (and (Set_in x1@9@01 xs@2@01) (Set_in x2@9@01 xs@2@01) (= x1@9@01 x2@9@01))
    (= x1@9@01 x2@9@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (Set_in x@9@01 xs@2@01)
    (and
      (= (inv@13@01 x@9@01 $Perm.Write y@3@01 $Perm.Write) x@9@01)
      (img@14@01 x@9@01 $Perm.Write y@3@01 $Perm.Write)))
  :pattern (($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@12@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@9@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@9@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |quant-u-3|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (img@14@01 x0 x1 x2 x3) (Set_in (inv@13@01 x0 x1 x2 x3) xs@2@01))
    (and
      (= (inv@13@01 x0 x1 x2 x3) x0)
      (= $Perm.Write x1)
      (= y@3@01 x2)
      (= $Perm.Write x3)))
  :pattern ((inv@13@01 x0 x1 x2 x3))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
(declare-const sm@15@01 $PSF<wand@0>)
(declare-const s@16@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@16@01 $Snap)) (!
  (=>
    (and
      (img@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@16@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@16@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@16@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@16@01)))
      (Set_in (inv@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@16@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@16@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@16@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@16@01))) xs@2@01))
    (and
      (not (= s@16@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@15@01  $PSF<wand@0>) s@16@01)
        ($PSF.lookup_wand@0 $t@12@01 s@16@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@15@01  $PSF<wand@0>) s@16@01))
  :pattern (($PSF.lookup_wand@0 $t@12@01 s@16@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@16@01 $Snap)) (!
  ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@12@01 s@16@01) s@16@01)
  :pattern (($PSF.lookup_wand@0 (as sm@15@01  $PSF<wand@0>) s@16@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (Set_in (inv@13@01 x0 x1 x2 x3) xs@2@01)
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@15@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))))
  :pattern ((inv@13@01 x0 x1 x2 x3))
  :qid |quant-u-4|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (z in xs)
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 $Snap.unit))
; [eval] (z in xs)
(assert (Set_in z@4@01 xs@2@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; apply acc(z.f, write) --* acc(y.f, write)
(declare-const sm@18@01 $PSF<wand@0>)
(declare-const s@19@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@19@01 $Snap)) (!
  (=>
    (and
      (img@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@19@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@19@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@19@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@19@01)))
      (Set_in (inv@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@19@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@19@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@19@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@19@01))) xs@2@01))
    (and
      (not (= s@19@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@18@01  $PSF<wand@0>) s@19@01)
        ($PSF.lookup_wand@0 $t@12@01 s@19@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@18@01  $PSF<wand@0>) s@19@01))
  :pattern (($PSF.lookup_wand@0 $t@12@01 s@19@01))
  :qid |qp.psmValDef3|)))
(assert (forall ((s@19@01 $Snap)) (!
  ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@12@01 s@19@01) s@19@01)
  :pattern (($PSF.lookup_wand@0 (as sm@18@01  $PSF<wand@0>) s@19@01))
  :qid |qp.psmResTrgDef4|)))
(assert ($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@18@01  $PSF<wand@0>) ($Snap.combine
  ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap z@4@01)
      ($SortWrappers.$PermTo$Snap $Perm.Write))
    ($SortWrappers.$RefTo$Snap y@3@01))
  ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
  ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap z@4@01)
      ($SortWrappers.$PermTo$Snap $Perm.Write))
    ($SortWrappers.$RefTo$Snap y@3@01))
  ($SortWrappers.$PermTo$Snap $Perm.Write))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) $Perm
  (ite
    (and (= x0 z@4@01) (= x1 $Perm.Write) (= x2 y@3@01) (= x3 $Perm.Write))
    ($Perm.min
      (ite
        (and (img@14@01 x0 x1 x2 x3) (Set_in (inv@13@01 x0 x1 x2 x3) xs@2@01))
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    (-
      (ite
        (and (img@14@01 x0 x1 x2 x3) (Set_in (inv@13@01 x0 x1 x2 x3) xs@2@01))
        $Perm.Write
        $Perm.No)
      (pTaken@20@01 x0 x1 x2 x3))
    $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (= (pTaken@20@01 x0 x1 x2 x3) $Perm.No)
  
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
(assert (not (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (= x0 z@4@01) (= x1 $Perm.Write) (= x2 y@3@01) (= x3 $Perm.Write))
    (= (- $Perm.Write (pTaken@20@01 x0 x1 x2 x3)) $Perm.No))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and
    (img@14@01 z@4@01 $Perm.Write y@3@01 $Perm.Write)
    (Set_in (inv@13@01 z@4@01 $Perm.Write y@3@01 $Perm.Write) xs@2@01))
  (and
    (not
      (=
        ($Snap.combine
          ($Snap.combine
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap z@4@01)
              ($SortWrappers.$PermTo$Snap $Perm.Write))
            ($SortWrappers.$RefTo$Snap y@3@01))
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        $Snap.unit))
    (=
      ($PSF.lookup_wand@0 (as sm@18@01  $PSF<wand@0>) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@4@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      ($PSF.lookup_wand@0 $t@12@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap z@4@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@3@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
(assert ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@12@01 ($Snap.combine
  ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap z@4@01)
      ($SortWrappers.$PermTo$Snap $Perm.Write))
    ($SortWrappers.$RefTo$Snap y@3@01))
  ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
  ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap z@4@01)
      ($SortWrappers.$PermTo$Snap $Perm.Write))
    ($SortWrappers.$RefTo$Snap y@3@01))
  ($SortWrappers.$PermTo$Snap $Perm.Write))))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (= r z@4@01)
    ($Perm.min
      (ite (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@21@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@21@01 r) $Perm.No)
  
  :qid |quant-u-11|))))
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
  (=> (= r z@4@01) (= (- $Perm.Write (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@8@01 z@4@01) (Set_in (inv@7@01 z@4@01) xs@2@01))
  (=
    ($FVF.lookup_f (as sm@22@01  $FVF<f>) z@4@01)
    ($FVF.lookup_f $t@6@01 z@4@01))))
(assert (=
  ($SortWrappers.IntTo$Snap ($FVF.lookup_f (as sm@22@01  $FVF<f>) z@4@01))
  ($Snap.first ($PSF.lookup_wand@0 (as sm@18@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap z@4@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))))
(declare-const sm@23@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@23@01  $FVF<f>) y@3@01)
  ($SortWrappers.$SnapToInt ($Snap.second ($PSF.lookup_wand@0 (as sm@18@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap z@4@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@3@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))))))
(assert (not (= y@3@01 $Ref.null)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@24@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01))
      (< $Perm.No (- $Perm.Write (pTaken@21@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@24@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@3@01)
    (=
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :qid |qp.fvfValDef7|)))
(declare-const pm@25@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@25@01  $FPM) r)
    (+
      (ite
        (and (img@8@01 r) (Set_in (inv@7@01 r) xs@2@01))
        (- $Perm.Write (pTaken@21@01 r))
        $Perm.No)
      (ite (= r y@3@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@25@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@25@01  $FPM) r) $Perm.Write)
  :pattern ((inv@7@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@25@01  $FPM) y@3@01) $Perm.Write))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const xs@26@01 Set<$Ref>)
(declare-const ys@27@01 Set<$Ref>)
(declare-const xs@28@01 Set<$Ref>)
(declare-const ys@29@01 Set<$Ref>)
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
; var z: Ref
(declare-const z@30@01 $Ref)
; [exec]
; inhale (forall x: Ref ::x == z ==> acc(x.f, write))
(declare-const x@31@01 $Ref)
(push) ; 3
; [eval] x == z
(assert (= x@31@01 z@30@01))
(pop) ; 3
(declare-const $t@32@01 $FVF<f>)
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@31@01 $Ref) (x2@31@01 $Ref)) (!
  (=>
    (and (= x1@31@01 z@30@01) (= x2@31@01 z@30@01) (= x1@31@01 x2@31@01))
    (= x1@31@01 x2@31@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@31@01 $Ref)) (!
  (=>
    (= x@31@01 z@30@01)
    (and (= (inv@33@01 x@31@01) x@31@01) (img@34@01 x@31@01)))
  :pattern ((inv@33@01 x@31@01))
  :pattern ((img@34@01 x@31@01))
  :qid |quant-u-14|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (= (inv@33@01 r) z@30@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@31@01 $Ref)) (!
  (=> (= x@31@01 z@30@01) (not (= x@31@01 $Ref.null)))
  :pattern ((inv@33@01 x@31@01))
  :pattern ((img@34@01 x@31@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref ::(x in xs) && (y in ys) ==>
;     acc(x.f, write) --* acc(y.f, write))
(declare-const x@35@01 $Ref)
(declare-const y@36@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && (y in ys)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 0 | !(x@35@01 in xs@28@01) | live]
; [else-branch: 0 | x@35@01 in xs@28@01 | live]
(push) ; 5
; [then-branch: 0 | !(x@35@01 in xs@28@01)]
(assert (not (Set_in x@35@01 xs@28@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | x@35@01 in xs@28@01]
(assert (Set_in x@35@01 xs@28@01))
; [eval] (y in ys)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@35@01 xs@28@01) (not (Set_in x@35@01 xs@28@01))))
(assert (and (Set_in x@35@01 xs@28@01) (Set_in y@36@01 ys@29@01)))
(pop) ; 3
(declare-const $t@37@01 $PSF<wand@0>)
(declare-fun inv@38@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@39@01 ($Ref $Perm $Ref $Perm) Bool)
(declare-fun inv@40@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@41@01 ($Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@35@01 $Ref) (y@36@01 $Ref)) (!
  (=>
    (and (Set_in x@35@01 xs@28@01) (Set_in y@36@01 ys@29@01))
    (or (Set_in x@35@01 xs@28@01) (not (Set_in x@35@01 xs@28@01))))
  :pattern ((Set_in x@35@01 xs@28@01) (Set_in y@36@01 ys@29@01))
  :pattern ((Set_in x@35@01 xs@28@01) (inv@38@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in x@35@01 xs@28@01) (inv@40@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in x@35@01 xs@28@01) (img@39@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in x@35@01 xs@28@01) (img@41@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in y@36@01 ys@29@01) (inv@38@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in y@36@01 ys@29@01) (inv@40@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in y@36@01 ys@29@01) (img@39@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in y@36@01 ys@29@01) (img@41@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((inv@38@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((inv@40@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((img@39@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((img@41@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :qid |wand@0-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@35@01 $Ref) (y1@36@01 $Ref) (x2@35@01 $Ref) (y2@36@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@35@01 xs@28@01) (Set_in y1@36@01 ys@29@01))
      (and (Set_in x2@35@01 xs@28@01) (Set_in y2@36@01 ys@29@01))
      (and (= x1@35@01 x2@35@01) (= y1@36@01 y2@36@01)))
    (and (= x1@35@01 x2@35@01) (= y1@36@01 y2@36@01)))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@35@01 $Ref) (y@36@01 $Ref)) (!
  (=>
    (and (Set_in x@35@01 xs@28@01) (Set_in y@36@01 ys@29@01))
    (and
      (and
        (= (inv@38@01 x@35@01 $Perm.Write y@36@01 $Perm.Write) x@35@01)
        (= (inv@40@01 x@35@01 $Perm.Write y@36@01 $Perm.Write) y@36@01))
      (and
        (img@39@01 x@35@01 $Perm.Write y@36@01 $Perm.Write)
        (img@41@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))))
  :pattern ((Set_in x@35@01 xs@28@01) (Set_in y@36@01 ys@29@01))
  :pattern ((Set_in x@35@01 xs@28@01) (inv@38@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in x@35@01 xs@28@01) (inv@40@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in x@35@01 xs@28@01) (img@39@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in x@35@01 xs@28@01) (img@41@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in y@36@01 ys@29@01) (inv@38@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in y@36@01 ys@29@01) (inv@40@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in y@36@01 ys@29@01) (img@39@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((Set_in y@36@01 ys@29@01) (img@41@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((inv@38@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((inv@40@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((img@39@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :pattern ((img@41@01 x@35@01 $Perm.Write y@36@01 $Perm.Write))
  :qid |quant-u-16|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and
      (and (img@39@01 x0 x1 x2 x3) (img@41@01 x0 x1 x2 x3))
      (and
        (Set_in (inv@38@01 x0 x1 x2 x3) xs@28@01)
        (Set_in (inv@40@01 x0 x1 x2 x3) ys@29@01)))
    (and
      (= (inv@38@01 x0 x1 x2 x3) x0)
      (= $Perm.Write x1)
      (= (inv@40@01 x0 x1 x2 x3) x2)
      (= $Perm.Write x3)))
  :pattern ((inv@38@01 x0 x1 x2 x3))
  :pattern ((inv@40@01 x0 x1 x2 x3))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
(declare-const sm@42@01 $PSF<wand@0>)
(declare-const s@43@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@43@01 $Snap)) (!
  (=>
    (and
      (and
        (img@39@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@43@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@43@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@43@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@43@01)))
        (img@41@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@43@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@43@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@43@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@43@01))))
      (and
        (Set_in (inv@38@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@43@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@43@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@43@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@43@01))) xs@28@01)
        (Set_in (inv@40@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@43@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@43@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@43@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@43@01))) ys@29@01)))
    (and
      (not (= s@43@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) s@43@01)
        ($PSF.lookup_wand@0 $t@37@01 s@43@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) s@43@01))
  :pattern (($PSF.lookup_wand@0 $t@37@01 s@43@01))
  :qid |qp.psmValDef9|)))
(assert (forall ((s@43@01 $Snap)) (!
  ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 s@43@01) s@43@01)
  :pattern (($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) s@43@01))
  :qid |qp.psmResTrgDef10|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and
      (Set_in (inv@38@01 x0 x1 x2 x3) xs@28@01)
      (Set_in (inv@40@01 x0 x1 x2 x3) ys@29@01))
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))))
  :pattern ((inv@38@01 x0 x1 x2 x3) (inv@40@01 x0 x1 x2 x3))
  :qid |quant-u-17|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref ::
;     { acc(x.f, write) --* acc(y.f, write) }
;     (x in xs) && (y in ys) ==> x != y)
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { acc(x.f, write) --* acc(y.f, write) } (x in xs) && (y in ys) ==> x != y)
(declare-const x@45@01 $Ref)
(declare-const y@46@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && (y in ys) ==> x != y
; [eval] (x in xs) && (y in ys)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 1 | !(x@45@01 in xs@28@01) | live]
; [else-branch: 1 | x@45@01 in xs@28@01 | live]
(push) ; 5
; [then-branch: 1 | !(x@45@01 in xs@28@01)]
(assert (not (Set_in x@45@01 xs@28@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | x@45@01 in xs@28@01]
(assert (Set_in x@45@01 xs@28@01))
; [eval] (y in ys)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@45@01 xs@28@01) (not (Set_in x@45@01 xs@28@01))))
(push) ; 4
; [then-branch: 2 | x@45@01 in xs@28@01 && y@46@01 in ys@29@01 | live]
; [else-branch: 2 | !(x@45@01 in xs@28@01 && y@46@01 in ys@29@01) | live]
(push) ; 5
; [then-branch: 2 | x@45@01 in xs@28@01 && y@46@01 in ys@29@01]
(assert (and (Set_in x@45@01 xs@28@01) (Set_in y@46@01 ys@29@01)))
; [eval] x != y
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(x@45@01 in xs@28@01 && y@46@01 in ys@29@01)]
(assert (not (and (Set_in x@45@01 xs@28@01) (Set_in y@46@01 ys@29@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Set_in x@45@01 xs@28@01) (Set_in y@46@01 ys@29@01)))
  (and (Set_in x@45@01 xs@28@01) (Set_in y@46@01 ys@29@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@45@01 $Ref) (y@46@01 $Ref)) (!
  (and
    (or (Set_in x@45@01 xs@28@01) (not (Set_in x@45@01 xs@28@01)))
    (or
      (not (and (Set_in x@45@01 xs@28@01) (Set_in y@46@01 ys@29@01)))
      (and (Set_in x@45@01 xs@28@01) (Set_in y@46@01 ys@29@01))))
  :pattern (($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@45@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@46@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@45@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@46@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/triggerWand.vpr@18@12@18@90-aux|)))
(assert (forall ((x@45@01 $Ref) (y@46@01 $Ref)) (!
  (=>
    (and (Set_in x@45@01 xs@28@01) (Set_in y@46@01 ys@29@01))
    (not (= x@45@01 y@46@01)))
  :pattern (($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@42@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@45@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@46@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@45@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@46@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/triggerWand.vpr@18@12@18@90|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm
;     x: Ref, y: Ref [acc(x.f, write) --* acc(y.f, write)] :: x != y)
; [eval] (forperm x: Ref, y: Ref [acc(x.f, write) --* acc(y.f, write)] :: x != y)
(declare-const x@47@01 $Ref)
(declare-const y@48@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | PredicateTrigger(wand@0, $t@37@01, List(x@47@01, W, y@48@01, W)) && img@39@01(x@47@01, W, y@48@01, W) && img@41@01(x@47@01, W, y@48@01, W) && inv@38@01(x@47@01, W, y@48@01, W) in xs@28@01 && inv@40@01(x@47@01, W, y@48@01, W) in ys@29@01 | live]
; [else-branch: 3 | !(PredicateTrigger(wand@0, $t@37@01, List(x@47@01, W, y@48@01, W)) && img@39@01(x@47@01, W, y@48@01, W) && img@41@01(x@47@01, W, y@48@01, W) && inv@38@01(x@47@01, W, y@48@01, W) in xs@28@01 && inv@40@01(x@47@01, W, y@48@01, W) in ys@29@01) | live]
(push) ; 4
; [then-branch: 3 | PredicateTrigger(wand@0, $t@37@01, List(x@47@01, W, y@48@01, W)) && img@39@01(x@47@01, W, y@48@01, W) && img@41@01(x@47@01, W, y@48@01, W) && inv@38@01(x@47@01, W, y@48@01, W) in xs@28@01 && inv@40@01(x@47@01, W, y@48@01, W) in ys@29@01]
(assert (and
  ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@47@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@48@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@47@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@48@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  (and
    (and
      (img@39@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
      (img@41@01 x@47@01 $Perm.Write y@48@01 $Perm.Write))
    (and
      (Set_in (inv@38@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) xs@28@01)
      (Set_in (inv@40@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) ys@29@01)))))
; [eval] x != y
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(PredicateTrigger(wand@0, $t@37@01, List(x@47@01, W, y@48@01, W)) && img@39@01(x@47@01, W, y@48@01, W) && img@41@01(x@47@01, W, y@48@01, W) && inv@38@01(x@47@01, W, y@48@01, W) in xs@28@01 && inv@40@01(x@47@01, W, y@48@01, W) in ys@29@01)]
(assert (not
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@47@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@48@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@47@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@48@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (and
        (img@39@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
        (img@41@01 x@47@01 $Perm.Write y@48@01 $Perm.Write))
      (and
        (Set_in (inv@38@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) xs@28@01)
        (Set_in (inv@40@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) ys@29@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@47@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@48@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@47@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@48@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (and
        (img@39@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
        (img@41@01 x@47@01 $Perm.Write y@48@01 $Perm.Write))
      (and
        (Set_in (inv@38@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) xs@28@01)
        (Set_in (inv@40@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) ys@29@01))))
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@47@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@48@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@47@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@48@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (img@39@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
    (img@41@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
    (Set_in (inv@38@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) xs@28@01)
    (Set_in (inv@40@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) ys@29@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@47@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@48@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@47@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@48@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (and
          (img@39@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
          (img@41@01 x@47@01 $Perm.Write y@48@01 $Perm.Write))
        (and
          (Set_in (inv@38@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) xs@28@01)
          (Set_in (inv@40@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) ys@29@01)))))
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@47@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@48@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@47@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@48@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (and
        (img@39@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
        (img@41@01 x@47@01 $Perm.Write y@48@01 $Perm.Write))
      (and
        (Set_in (inv@38@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) xs@28@01)
        (Set_in (inv@40@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) ys@29@01))))))
(push) ; 3
(assert (not (forall ((x@47@01 $Ref) (y@48@01 $Ref)) (!
  (=>
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@47@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@48@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@47@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@48@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (and
          (img@39@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
          (img@41@01 x@47@01 $Perm.Write y@48@01 $Perm.Write))
        (and
          (Set_in (inv@38@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) xs@28@01)
          (Set_in (inv@40@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) ys@29@01))))
    (not (= x@47@01 y@48@01)))
  :pattern (($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@47@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@48@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |quant-0|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@47@01 $Ref) (y@48@01 $Ref)) (!
  (=>
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@47@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@48@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap x@47@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@48@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (and
          (img@39@01 x@47@01 $Perm.Write y@48@01 $Perm.Write)
          (img@41@01 x@47@01 $Perm.Write y@48@01 $Perm.Write))
        (and
          (Set_in (inv@38@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) xs@28@01)
          (Set_in (inv@40@01 x@47@01 $Perm.Write y@48@01 $Perm.Write) ys@29@01))))
    (not (= x@47@01 y@48@01)))
  :pattern (($PSF.lookup_wand@0 $t@37@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@47@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@48@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |quant-0|)))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const xs@49@01 Set<$Ref>)
(declare-const ys@50@01 Set<$Ref>)
(declare-const xs@51@01 Set<$Ref>)
(declare-const ys@52@01 Set<$Ref>)
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
; var z: Ref
(declare-const z@53@01 $Ref)
; [exec]
; var a: Ref
(declare-const a@54@01 $Ref)
; [exec]
; var b: Ref
(declare-const b@55@01 $Ref)
; [exec]
; inhale (forall x: Ref ::x == z ==> acc(x.f, write))
(declare-const x@56@01 $Ref)
(push) ; 3
; [eval] x == z
(assert (= x@56@01 z@53@01))
(pop) ; 3
(declare-const $t@57@01 $FVF<f>)
(declare-fun inv@58@01 ($Ref) $Ref)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@56@01 $Ref) (x2@56@01 $Ref)) (!
  (=>
    (and (= x1@56@01 z@53@01) (= x2@56@01 z@53@01) (= x1@56@01 x2@56@01))
    (= x1@56@01 x2@56@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@56@01 $Ref)) (!
  (=>
    (= x@56@01 z@53@01)
    (and (= (inv@58@01 x@56@01) x@56@01) (img@59@01 x@56@01)))
  :pattern ((inv@58@01 x@56@01))
  :pattern ((img@59@01 x@56@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@59@01 r) (= (inv@58@01 r) z@53@01)) (= (inv@58@01 r) r))
  :pattern ((inv@58@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@56@01 $Ref)) (!
  (=> (= x@56@01 z@53@01) (not (= x@56@01 $Ref.null)))
  :pattern ((inv@58@01 x@56@01))
  :pattern ((img@59@01 x@56@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref ::(x in xs) && (y in ys) ==>
;     acc(x.f, write) --* acc(y.f, write))
(declare-const x@60@01 $Ref)
(declare-const y@61@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && (y in ys)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 4 | !(x@60@01 in xs@51@01) | live]
; [else-branch: 4 | x@60@01 in xs@51@01 | live]
(push) ; 5
; [then-branch: 4 | !(x@60@01 in xs@51@01)]
(assert (not (Set_in x@60@01 xs@51@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | x@60@01 in xs@51@01]
(assert (Set_in x@60@01 xs@51@01))
; [eval] (y in ys)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@60@01 xs@51@01) (not (Set_in x@60@01 xs@51@01))))
(assert (and (Set_in x@60@01 xs@51@01) (Set_in y@61@01 ys@52@01)))
(pop) ; 3
(declare-const $t@62@01 $PSF<wand@0>)
(declare-fun inv@63@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@64@01 ($Ref $Perm $Ref $Perm) Bool)
(declare-fun inv@65@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@66@01 ($Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@60@01 $Ref) (y@61@01 $Ref)) (!
  (=>
    (and (Set_in x@60@01 xs@51@01) (Set_in y@61@01 ys@52@01))
    (or (Set_in x@60@01 xs@51@01) (not (Set_in x@60@01 xs@51@01))))
  :pattern ((Set_in x@60@01 xs@51@01) (Set_in y@61@01 ys@52@01))
  :pattern ((Set_in x@60@01 xs@51@01) (inv@63@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in x@60@01 xs@51@01) (inv@65@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in x@60@01 xs@51@01) (img@64@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in x@60@01 xs@51@01) (img@66@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in y@61@01 ys@52@01) (inv@63@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in y@61@01 ys@52@01) (inv@65@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in y@61@01 ys@52@01) (img@64@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in y@61@01 ys@52@01) (img@66@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((inv@63@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((inv@65@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((img@64@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((img@66@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :qid |wand@0-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@60@01 $Ref) (y1@61@01 $Ref) (x2@60@01 $Ref) (y2@61@01 $Ref)) (!
  (=>
    (and
      (and (Set_in x1@60@01 xs@51@01) (Set_in y1@61@01 ys@52@01))
      (and (Set_in x2@60@01 xs@51@01) (Set_in y2@61@01 ys@52@01))
      (and (= x1@60@01 x2@60@01) (= y1@61@01 y2@61@01)))
    (and (= x1@60@01 x2@60@01) (= y1@61@01 y2@61@01)))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@60@01 $Ref) (y@61@01 $Ref)) (!
  (=>
    (and (Set_in x@60@01 xs@51@01) (Set_in y@61@01 ys@52@01))
    (and
      (and
        (= (inv@63@01 x@60@01 $Perm.Write y@61@01 $Perm.Write) x@60@01)
        (= (inv@65@01 x@60@01 $Perm.Write y@61@01 $Perm.Write) y@61@01))
      (and
        (img@64@01 x@60@01 $Perm.Write y@61@01 $Perm.Write)
        (img@66@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))))
  :pattern ((Set_in x@60@01 xs@51@01) (Set_in y@61@01 ys@52@01))
  :pattern ((Set_in x@60@01 xs@51@01) (inv@63@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in x@60@01 xs@51@01) (inv@65@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in x@60@01 xs@51@01) (img@64@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in x@60@01 xs@51@01) (img@66@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in y@61@01 ys@52@01) (inv@63@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in y@61@01 ys@52@01) (inv@65@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in y@61@01 ys@52@01) (img@64@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((Set_in y@61@01 ys@52@01) (img@66@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((inv@63@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((inv@65@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((img@64@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :pattern ((img@66@01 x@60@01 $Perm.Write y@61@01 $Perm.Write))
  :qid |quant-u-21|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and
      (and (img@64@01 x0 x1 x2 x3) (img@66@01 x0 x1 x2 x3))
      (and
        (Set_in (inv@63@01 x0 x1 x2 x3) xs@51@01)
        (Set_in (inv@65@01 x0 x1 x2 x3) ys@52@01)))
    (and
      (= (inv@63@01 x0 x1 x2 x3) x0)
      (= $Perm.Write x1)
      (= (inv@65@01 x0 x1 x2 x3) x2)
      (= $Perm.Write x3)))
  :pattern ((inv@63@01 x0 x1 x2 x3))
  :pattern ((inv@65@01 x0 x1 x2 x3))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
(declare-const sm@67@01 $PSF<wand@0>)
(declare-const s@68@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@68@01 $Snap)) (!
  (=>
    (and
      (and
        (img@64@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@68@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@68@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@68@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@68@01)))
        (img@66@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@68@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@68@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@68@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@68@01))))
      (and
        (Set_in (inv@63@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@68@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@68@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@68@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@68@01))) xs@51@01)
        (Set_in (inv@65@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@68@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@68@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@68@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@68@01))) ys@52@01)))
    (and
      (not (= s@68@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@67@01  $PSF<wand@0>) s@68@01)
        ($PSF.lookup_wand@0 $t@62@01 s@68@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@67@01  $PSF<wand@0>) s@68@01))
  :pattern (($PSF.lookup_wand@0 $t@62@01 s@68@01))
  :qid |qp.psmValDef11|)))
(assert (forall ((s@68@01 $Snap)) (!
  ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@62@01 s@68@01) s@68@01)
  :pattern (($PSF.lookup_wand@0 (as sm@67@01  $PSF<wand@0>) s@68@01))
  :qid |qp.psmResTrgDef12|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and
      (Set_in (inv@63@01 x0 x1 x2 x3) xs@51@01)
      (Set_in (inv@65@01 x0 x1 x2 x3) ys@52@01))
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@67@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))))
  :pattern ((inv@63@01 x0 x1 x2 x3) (inv@65@01 x0 x1 x2 x3))
  :qid |quant-u-22|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref ::
;     { acc(x.f, write) --* acc(y.f, write) }
;     (x in xs) && (y in ys) ==> x != y)
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { acc(x.f, write) --* acc(y.f, write) } (x in xs) && (y in ys) ==> x != y)
(declare-const x@70@01 $Ref)
(declare-const y@71@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && (y in ys) ==> x != y
; [eval] (x in xs) && (y in ys)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 5 | !(x@70@01 in xs@51@01) | live]
; [else-branch: 5 | x@70@01 in xs@51@01 | live]
(push) ; 5
; [then-branch: 5 | !(x@70@01 in xs@51@01)]
(assert (not (Set_in x@70@01 xs@51@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | x@70@01 in xs@51@01]
(assert (Set_in x@70@01 xs@51@01))
; [eval] (y in ys)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in x@70@01 xs@51@01) (not (Set_in x@70@01 xs@51@01))))
(push) ; 4
; [then-branch: 6 | x@70@01 in xs@51@01 && y@71@01 in ys@52@01 | live]
; [else-branch: 6 | !(x@70@01 in xs@51@01 && y@71@01 in ys@52@01) | live]
(push) ; 5
; [then-branch: 6 | x@70@01 in xs@51@01 && y@71@01 in ys@52@01]
(assert (and (Set_in x@70@01 xs@51@01) (Set_in y@71@01 ys@52@01)))
; [eval] x != y
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(x@70@01 in xs@51@01 && y@71@01 in ys@52@01)]
(assert (not (and (Set_in x@70@01 xs@51@01) (Set_in y@71@01 ys@52@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (Set_in x@70@01 xs@51@01) (Set_in y@71@01 ys@52@01)))
  (and (Set_in x@70@01 xs@51@01) (Set_in y@71@01 ys@52@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@70@01 $Ref) (y@71@01 $Ref)) (!
  (and
    (or (Set_in x@70@01 xs@51@01) (not (Set_in x@70@01 xs@51@01)))
    (or
      (not (and (Set_in x@70@01 xs@51@01) (Set_in y@71@01 ys@52@01)))
      (and (Set_in x@70@01 xs@51@01) (Set_in y@71@01 ys@52@01))))
  :pattern (($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@67@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@70@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@71@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@70@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@71@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/triggerWand.vpr@28@12@28@90-aux|)))
(assert (forall ((x@70@01 $Ref) (y@71@01 $Ref)) (!
  (=>
    (and (Set_in x@70@01 xs@51@01) (Set_in y@71@01 ys@52@01))
    (not (= x@70@01 y@71@01)))
  :pattern (($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@67@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@70@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@71@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@70@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@71@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/triggerWand.vpr@28@12@28@90|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (a in xs)
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 $Snap.unit))
; [eval] (a in xs)
(assert (Set_in a@54@01 xs@51@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (b in ys)
(declare-const $t@73@01 $Snap)
(assert (= $t@73@01 $Snap.unit))
; [eval] (b in ys)
(assert (Set_in b@55@01 ys@52@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert perm(acc(a.f, write) --* acc(b.f, write)) == write
; [eval] perm(acc(a.f, write) --* acc(b.f, write)) == write
; [eval] perm(acc(a.f, write) --* acc(b.f, write))
(declare-const sm@74@01 $PSF<wand@0>)
(declare-const s@75@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@75@01 $Snap)) (!
  (=>
    (and
      (and
        (img@64@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@75@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@75@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@75@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@75@01)))
        (img@66@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@75@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@75@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@75@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@75@01))))
      (and
        (Set_in (inv@63@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@75@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@75@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@75@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@75@01))) xs@51@01)
        (Set_in (inv@65@01 ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first ($Snap.first s@75@01)))) ($SortWrappers.$SnapTo$Perm ($Snap.second ($Snap.first ($Snap.first s@75@01)))) ($SortWrappers.$SnapTo$Ref ($Snap.second ($Snap.first s@75@01))) ($SortWrappers.$SnapTo$Perm ($Snap.second s@75@01))) ys@52@01)))
    (and
      (not (= s@75@01 $Snap.unit))
      (=
        ($PSF.lookup_wand@0 (as sm@74@01  $PSF<wand@0>) s@75@01)
        ($PSF.lookup_wand@0 $t@62@01 s@75@01))))
  :pattern (($PSF.lookup_wand@0 (as sm@74@01  $PSF<wand@0>) s@75@01))
  :pattern (($PSF.lookup_wand@0 $t@62@01 s@75@01))
  :qid |qp.psmValDef13|)))
(assert (forall ((s@75@01 $Snap)) (!
  ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@62@01 s@75@01) s@75@01)
  :pattern (($PSF.lookup_wand@0 (as sm@74@01  $PSF<wand@0>) s@75@01))
  :qid |qp.psmResTrgDef14|)))
(declare-const pm@76@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@76@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (ite
      (and
        (and (img@64@01 x0 x1 x2 x3) (img@66@01 x0 x1 x2 x3))
        (and
          (Set_in (inv@63@01 x0 x1 x2 x3) xs@51@01)
          (Set_in (inv@65@01 x0 x1 x2 x3) ys@52@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_wand@0 (as pm@76@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef15|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@74@01  $PSF<wand@0>) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@62@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3))))
  :pattern (($PSF.perm_wand@0 (as pm@76@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resTrgDef16|)))
(assert ($PSF.loc_wand@0 ($PSF.lookup_wand@0 (as sm@74@01  $PSF<wand@0>) ($Snap.combine
  ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@54@01)
      ($SortWrappers.$PermTo$Snap $Perm.Write))
    ($SortWrappers.$RefTo$Snap b@55@01))
  ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
  ($Snap.combine
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@54@01)
      ($SortWrappers.$PermTo$Snap $Perm.Write))
    ($SortWrappers.$RefTo$Snap b@55@01))
  ($SortWrappers.$PermTo$Snap $Perm.Write))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_wand@0 (as pm@76@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@54@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap b@55@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_wand@0 (as pm@76@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@54@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap b@55@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write))
; [exec]
; assert a != b
; [eval] a != b
(push) ; 3
(assert (not (not (= a@54@01 b@55@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= a@54@01 b@55@01)))
(pop) ; 2
(pop) ; 1
