(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:44
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permission_introspection/permWandQP.vpr
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
; /predicate_snap_functions_declarations.smt2 [acc(Ref.f, Perm) --* acc(Ref.g, Perm): Snap]
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
(declare-const x@0@01 $Ref)
(declare-const y@1@01 $Ref)
(declare-const as@2@01 Set<$Ref>)
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(declare-const as@5@01 Set<$Ref>)
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
; inhale (forall a: Ref ::(a in as) ==> acc(a.f, write))
(declare-const a@6@01 $Ref)
(push) ; 3
; [eval] (a in as)
(assert (Set_in a@6@01 as@5@01))
(pop) ; 3
(declare-const $t@7@01 $FVF<f>)
(declare-fun inv@8@01 ($Ref) $Ref)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@6@01 $Ref) (a2@6@01 $Ref)) (!
  (=>
    (and (Set_in a1@6@01 as@5@01) (Set_in a2@6@01 as@5@01) (= a1@6@01 a2@6@01))
    (= a1@6@01 a2@6@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@6@01 $Ref)) (!
  (=>
    (Set_in a@6@01 as@5@01)
    (and (= (inv@8@01 a@6@01) a@6@01) (img@9@01 a@6@01)))
  :pattern ((Set_in a@6@01 as@5@01))
  :pattern ((inv@8@01 a@6@01))
  :pattern ((img@9@01 a@6@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@9@01 r) (Set_in (inv@8@01 r) as@5@01)) (= (inv@8@01 r) r))
  :pattern ((inv@8@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((a@6@01 $Ref)) (!
  (=> (Set_in a@6@01 as@5@01) (not (= a@6@01 $Ref.null)))
  :pattern ((Set_in a@6@01 as@5@01))
  :pattern ((inv@8@01 a@6@01))
  :pattern ((img@9@01 a@6@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall a: Ref ::(a in as) ==> acc(a.f, write) --* acc(x.g, write))
(declare-const a@10@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (a in as)
(assert (Set_in a@10@01 as@5@01))
(pop) ; 3
(declare-const $t@11@01 $PSF<wand@0>)
(declare-fun inv@12@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@13@01 ($Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@10@01 $Ref) (a2@10@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@10@01 as@5@01)
      (Set_in a2@10@01 as@5@01)
      (= a1@10@01 a2@10@01))
    (= a1@10@01 a2@10@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@10@01 $Ref)) (!
  (=>
    (Set_in a@10@01 as@5@01)
    (and
      (= (inv@12@01 a@10@01 $Perm.Write x@3@01 $Perm.Write) a@10@01)
      (img@13@01 a@10@01 $Perm.Write x@3@01 $Perm.Write)))
  :pattern ((Set_in a@10@01 as@5@01))
  :pattern ((inv@12@01 a@10@01 $Perm.Write x@3@01 $Perm.Write))
  :pattern ((img@13@01 a@10@01 $Perm.Write x@3@01 $Perm.Write))
  :qid |quant-u-3|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and (img@13@01 x0 x1 x2 x3) (Set_in (inv@12@01 x0 x1 x2 x3) as@5@01))
    (and
      (= (inv@12@01 x0 x1 x2 x3) x0)
      (= $Perm.Write x1)
      (= x@3@01 x2)
      (= $Perm.Write x3)))
  :pattern ((inv@12@01 x0 x1 x2 x3))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (x in as)
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] (x in as)
(assert (Set_in x@3@01 as@5@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (y in as)
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] (y in as)
(assert (Set_in y@4@01 as@5@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert perm(acc(x.f, write) --* acc(x.g, write)) == write
; [eval] perm(acc(x.f, write) --* acc(x.g, write)) == write
; [eval] perm(acc(x.f, write) --* acc(x.g, write))
(declare-const pm@16@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@16@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (ite
      (and (img@13@01 x0 x1 x2 x3) (Set_in (inv@12@01 x0 x1 x2 x3) as@5@01))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_wand@0 (as pm@16@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef0|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_wand@0 (as pm@16@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@3@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap x@3@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_wand@0 (as pm@16@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@3@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap x@3@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write))
; [exec]
; assert perm(acc(y.f, write) --* acc(x.g, write)) == write
; [eval] perm(acc(y.f, write) --* acc(x.g, write)) == write
; [eval] perm(acc(y.f, write) --* acc(x.g, write))
(declare-const pm@17@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@17@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (ite
      (and (img@13@01 x0 x1 x2 x3) (Set_in (inv@12@01 x0 x1 x2 x3) as@5@01))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_wand@0 (as pm@17@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef1|)))
(push) ; 3
(assert (not (=
  ($PSF.perm_wand@0 (as pm@17@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap y@4@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap x@3@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_wand@0 (as pm@17@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap y@4@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap x@3@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write))
; [exec]
; assert perm(acc(y.f, write) --* acc(y.g, write)) == write
; [eval] perm(acc(y.f, write) --* acc(y.g, write)) == write
; [eval] perm(acc(y.f, write) --* acc(y.g, write))
(declare-const pm@18@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@18@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (ite
      (and (img@13@01 x0 x1 x2 x3) (Set_in (inv@12@01 x0 x1 x2 x3) as@5@01))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_wand@0 (as pm@18@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef2|)))
(push) ; 3
(assert (not (=
  ($PSF.perm_wand@0 (as pm@18@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap y@4@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@4@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write)))
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
(declare-const sm@19@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) as@5@01))
    (= ($FVF.lookup_f (as sm@19@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef3|)))
(declare-const pm@20@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@20@01  $FPM) r)
    (ite (and (img@9@01 r) (Set_in (inv@8@01 r) as@5@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@20@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@20@01  $FPM) r) $Perm.Write)
  :pattern ((inv@8@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] perm(acc(y.f, write) --* acc(y.g, write)) == write
; [eval] perm(acc(y.f, write) --* acc(y.g, write))
(declare-const pm@21@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@21@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (ite
      (and (img@13@01 x0 x1 x2 x3) (Set_in (inv@12@01 x0 x1 x2 x3) as@5@01))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_wand@0 (as pm@21@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef5|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_wand@0 (as pm@21@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap y@4@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@4@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write)))
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
(declare-const sm@22@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) as@5@01))
    (= ($FVF.lookup_f (as sm@22@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@22@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@23@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@23@01  $FPM) r)
    (ite (and (img@9@01 r) (Set_in (inv@8@01 r) as@5@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@23@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@23@01  $FPM) r) $Perm.Write)
  :pattern ((inv@8@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] perm(acc(y.f, write) --* acc(y.g, write)) == write
; [eval] perm(acc(y.f, write) --* acc(y.g, write))
(declare-const pm@24@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@24@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (ite
      (and (img@13@01 x0 x1 x2 x3) (Set_in (inv@12@01 x0 x1 x2 x3) as@5@01))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_wand@0 (as pm@24@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef8|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_wand@0 (as pm@24@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap y@4@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@4@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write)))
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
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] perm(acc(y.f, write) --* acc(y.g, write)) == write
; [eval] perm(acc(y.f, write) --* acc(y.g, write))
(declare-const pm@25@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@25@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (ite
      (and (img@13@01 x0 x1 x2 x3) (Set_in (inv@12@01 x0 x1 x2 x3) as@5@01))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_wand@0 (as pm@25@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef9|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_wand@0 (as pm@25@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap y@4@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@4@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const x@26@01 $Ref)
(declare-const y@27@01 $Ref)
(declare-const as@28@01 Set<$Ref>)
(declare-const x@29@01 $Ref)
(declare-const y@30@01 $Ref)
(declare-const as@31@01 Set<$Ref>)
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
; inhale (forall a: Ref ::(a in as) ==> acc(a.f, write))
(declare-const a@32@01 $Ref)
(push) ; 3
; [eval] (a in as)
(assert (Set_in a@32@01 as@31@01))
(pop) ; 3
(declare-const $t@33@01 $FVF<f>)
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@32@01 $Ref) (a2@32@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@32@01 as@31@01)
      (Set_in a2@32@01 as@31@01)
      (= a1@32@01 a2@32@01))
    (= a1@32@01 a2@32@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@32@01 $Ref)) (!
  (=>
    (Set_in a@32@01 as@31@01)
    (and (= (inv@34@01 a@32@01) a@32@01) (img@35@01 a@32@01)))
  :pattern ((Set_in a@32@01 as@31@01))
  :pattern ((inv@34@01 a@32@01))
  :pattern ((img@35@01 a@32@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@35@01 r) (Set_in (inv@34@01 r) as@31@01)) (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((a@32@01 $Ref)) (!
  (=> (Set_in a@32@01 as@31@01) (not (= a@32@01 $Ref.null)))
  :pattern ((Set_in a@32@01 as@31@01))
  :pattern ((inv@34@01 a@32@01))
  :pattern ((img@35@01 a@32@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (x in as)
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 $Snap.unit))
; [eval] (x in as)
(assert (Set_in x@29@01 as@31@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall a: Ref ::(a in as) && a.f > 3 ==>
;     acc(a.f, write) --* acc(x.g, write))
(declare-const a@37@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (a in as) && a.f > 3
; [eval] (a in as)
(push) ; 4
; [then-branch: 0 | !(a@37@01 in as@31@01) | live]
; [else-branch: 0 | a@37@01 in as@31@01 | live]
(push) ; 5
; [then-branch: 0 | !(a@37@01 in as@31@01)]
(assert (not (Set_in a@37@01 as@31@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | a@37@01 in as@31@01]
(assert (Set_in a@37@01 as@31@01))
; [eval] a.f > 3
(push) ; 6
(assert (not (and (img@35@01 a@37@01) (Set_in (inv@34@01 a@37@01) as@31@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (Set_in a@37@01 as@31@01) (not (Set_in a@37@01 as@31@01))))
(assert (and (Set_in a@37@01 as@31@01) (> ($FVF.lookup_f $t@33@01 a@37@01) 3)))
(pop) ; 3
(declare-const $t@38@01 $PSF<wand@0>)
(declare-fun inv@39@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@40@01 ($Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@37@01 $Ref)) (!
  (=>
    (and (Set_in a@37@01 as@31@01) (> ($FVF.lookup_f $t@33@01 a@37@01) 3))
    (or (Set_in a@37@01 as@31@01) (not (Set_in a@37@01 as@31@01))))
  :pattern ((Set_in a@37@01 as@31@01))
  :pattern (($FVF.lookup_f $t@33@01 a@37@01))
  :pattern ((inv@39@01 a@37@01 $Perm.Write x@29@01 $Perm.Write))
  :pattern ((img@40@01 a@37@01 $Perm.Write x@29@01 $Perm.Write))
  :qid |wand@0-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@37@01 $Ref) (a2@37@01 $Ref)) (!
  (=>
    (and
      (and (Set_in a1@37@01 as@31@01) (> ($FVF.lookup_f $t@33@01 a1@37@01) 3))
      (and (Set_in a2@37@01 as@31@01) (> ($FVF.lookup_f $t@33@01 a2@37@01) 3))
      (= a1@37@01 a2@37@01))
    (= a1@37@01 a2@37@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@37@01 $Ref)) (!
  (=>
    (and (Set_in a@37@01 as@31@01) (> ($FVF.lookup_f $t@33@01 a@37@01) 3))
    (and
      (= (inv@39@01 a@37@01 $Perm.Write x@29@01 $Perm.Write) a@37@01)
      (img@40@01 a@37@01 $Perm.Write x@29@01 $Perm.Write)))
  :pattern ((Set_in a@37@01 as@31@01))
  :pattern (($FVF.lookup_f $t@33@01 a@37@01))
  :pattern ((inv@39@01 a@37@01 $Perm.Write x@29@01 $Perm.Write))
  :pattern ((img@40@01 a@37@01 $Perm.Write x@29@01 $Perm.Write))
  :qid |quant-u-7|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and
      (img@40@01 x0 x1 x2 x3)
      (and
        (Set_in (inv@39@01 x0 x1 x2 x3) as@31@01)
        (> ($FVF.lookup_f $t@33@01 (inv@39@01 x0 x1 x2 x3)) 3)))
    (and
      (= (inv@39@01 x0 x1 x2 x3) x0)
      (= $Perm.Write x1)
      (= x@29@01 x2)
      (= $Perm.Write x3)))
  :pattern ((inv@39@01 x0 x1 x2 x3))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.f > 3
(declare-const $t@41@01 $Snap)
(assert (= $t@41@01 $Snap.unit))
; [eval] x.f > 3
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@35@01 x@29@01) (Set_in (inv@34@01 x@29@01) as@31@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($FVF.lookup_f $t@33@01 x@29@01) 3))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(acc(x.f, write) --* acc(x.g, write)) == write
; [eval] perm(acc(x.f, write) --* acc(x.g, write)) == write
; [eval] perm(acc(x.f, write) --* acc(x.g, write))
(declare-const pm@42@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@42@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (ite
      (and
        (img@40@01 x0 x1 x2 x3)
        (and
          (Set_in (inv@39@01 x0 x1 x2 x3) as@31@01)
          (> ($FVF.lookup_f $t@33@01 (inv@39@01 x0 x1 x2 x3)) 3)))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_wand@0 (as pm@42@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef10|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_wand@0 (as pm@42@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@29@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap x@29@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_wand@0 (as pm@42@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@29@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap x@29@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $Perm.Write))
; [exec]
; inhale acc(y.f, write) --* acc(y.g, write)
(declare-const $t@43@01 $Snap)
(declare-const sm@44@01 $PSF<wand@0>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_wand@0 (as sm@44@01  $PSF<wand@0>) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap y@30@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@30@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  $t@43@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] x == y
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@29@01 y@30@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@29@01 y@30@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | x@29@01 == y@30@01 | live]
; [else-branch: 1 | x@29@01 != y@30@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | x@29@01 == y@30@01]
(assert (= x@29@01 y@30@01))
; [exec]
; assert perm(acc(x.f, write) --* acc(x.g, write)) == 2 * write
; [eval] perm(acc(x.f, write) --* acc(x.g, write)) == 2 * write
; [eval] perm(acc(x.f, write) --* acc(x.g, write))
(declare-const pm@45@01 $PPM)
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=
    ($PSF.perm_wand@0 (as pm@45@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x0)
          ($SortWrappers.$PermTo$Snap x1))
        ($SortWrappers.$RefTo$Snap x2))
      ($SortWrappers.$PermTo$Snap x3)))
    (+
      (ite
        (and (= x0 y@30@01) (= x1 $Perm.Write) (= x2 y@30@01) (= x3 $Perm.Write))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@40@01 x0 x1 x2 x3)
          (and
            (Set_in (inv@39@01 x0 x1 x2 x3) as@31@01)
            (> ($FVF.lookup_f $t@33@01 (inv@39@01 x0 x1 x2 x3)) 3)))
        $Perm.Write
        $Perm.No)))
  :pattern (($PSF.perm_wand@0 (as pm@45@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x0)
        ($SortWrappers.$PermTo$Snap x1))
      ($SortWrappers.$RefTo$Snap x2))
    ($SortWrappers.$PermTo$Snap x3))))
  :qid |qp.resPrmSumDef11|)))
; [eval] 2 * write
(push) ; 4
(assert (not (=
  ($PSF.perm_wand@0 (as pm@45@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@29@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap x@29@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  (/ (to_real 2) (to_real 1)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_wand@0 (as pm@45@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@29@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap x@29@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  (/ (to_real 2) (to_real 1))))
(pop) ; 3
(push) ; 3
; [else-branch: 1 | x@29@01 != y@30@01]
(assert (not (= x@29@01 y@30@01)))
(pop) ; 3
; [eval] !(x == y)
; [eval] x == y
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@29@01 y@30@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= x@29@01 y@30@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | x@29@01 != y@30@01 | live]
; [else-branch: 2 | x@29@01 == y@30@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | x@29@01 != y@30@01]
(assert (not (= x@29@01 y@30@01)))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | x@29@01 == y@30@01]
(assert (= x@29@01 y@30@01))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const xs@46@01 Set<$Ref>)
(declare-const ys@47@01 Set<$Ref>)
(declare-const xs@48@01 Set<$Ref>)
(declare-const ys@49@01 Set<$Ref>)
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
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write)) --*
;   (forall y: Ref ::(y in ys) ==> acc(y.f, write))
(declare-const $t@50@01 $MWSF)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm((forall x: Ref ::(x in xs) ==> acc(x.f, write)) --*
;   (forall y: Ref ::(y in ys) ==> acc(y.f, write))) ==
;   write
; [eval] perm((forall x: Ref ::(x in xs) ==> acc(x.f, write)) --* (forall y: Ref ::(y in ys) ==> acc(y.f, write))) == write
; [eval] perm((forall x: Ref ::(x in xs) ==> acc(x.f, write)) --* (forall y: Ref ::(y in ys) ==> acc(y.f, write)))
(pop) ; 2
(pop) ; 1
