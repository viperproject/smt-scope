(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:06:31
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/permission_introspection/forpermQP.vpr
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
(declare-sort $PSF<P> 0)
(declare-sort $PSF<p2> 0)
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
(declare-fun $SortWrappers.$PSF<P>To$Snap ($PSF<P>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<P> ($Snap) $PSF<P>)
(assert (forall ((x $PSF<P>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<P>($SortWrappers.$PSF<P>To$Snap x)))
    :pattern (($SortWrappers.$PSF<P>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<P>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<P>To$Snap($SortWrappers.$SnapTo$PSF<P> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<P> x))
    :qid |$Snap.$PSF<P>To$SnapTo$PSF<P>|
    )))
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
; /predicate_snap_functions_declarations.smt2 [P: Snap]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) $Snap)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P ($Snap $Snap) Bool)
(declare-fun $PSF.perm_P ($PPM $Snap) $Perm)
(declare-const $psfTOP_P $PSF<P>)
; /predicate_snap_functions_declarations.smt2 [p2: Snap]
(declare-fun $PSF.domain_p2 ($PSF<p2>) Set<$Snap>)
(declare-fun $PSF.lookup_p2 ($PSF<p2> $Snap) $Snap)
(declare-fun $PSF.after_p2 ($PSF<p2> $PSF<p2>) Bool)
(declare-fun $PSF.loc_p2 ($Snap $Snap) Bool)
(declare-fun $PSF.perm_p2 ($PPM $Snap) $Perm)
(declare-const $psfTOP_p2 $PSF<p2>)
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
(declare-fun P%trigger ($Snap $Ref Int) Bool)
(declare-fun p2%trigger ($Snap $Ref $Ref) Bool)
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
; /predicate_snap_functions_axioms.smt2 [P: Snap]
(assert (forall ((vs $PSF<P>) (ws $PSF<P>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_P vs) ($PSF.domain_P ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_P vs))
            (= ($PSF.lookup_P vs x) ($PSF.lookup_P ws x)))
          :pattern (($PSF.lookup_P vs x) ($PSF.lookup_P ws x))
          :qid |qp.$PSF<P>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<P>To$Snap vs)
              ($SortWrappers.$PSF<P>To$Snap ws)
              )
    :qid |qp.$PSF<P>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_P pm s))
    :pattern (($PSF.perm_P pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_P f s) true)
    :pattern (($PSF.loc_P f s)))))
; /predicate_snap_functions_axioms.smt2 [p2: Snap]
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
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_p2 f s) true)
    :pattern (($PSF.loc_p2 f s)))))
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
(declare-const z@2@01 $Ref)
(declare-const x@3@01 $Ref)
(declare-const y@4@01 $Ref)
(declare-const z@5@01 $Ref)
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
; var g: Ref
(declare-const g@6@01 $Ref)
; [exec]
; inhale acc(x.f, write)
(declare-const $t@7@01 Int)
(declare-const sm@8@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_f (as sm@8@01  $FVF<f>) x@3@01) $t@7@01))
(assert (not (= x@3@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(y.f, write) && acc(z.f, write)
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(declare-const sm@10@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@10@01  $FVF<f>) y@4@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@4@01 x@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@4@01 $Ref.null)))
(declare-const sm@11@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@11@01  $FVF<f>) z@5@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@9@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@5@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= z@5@01 x@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@5@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale y != x
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] y != x
(assert (not (= y@4@01 x@3@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale z != x
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] z != x
(assert (not (= z@5@01 x@3@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(g.f, write)
(declare-const $t@14@01 Int)
(declare-const sm@15@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_f (as sm@15@01  $FVF<f>) g@6@01) $t@14@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= g@6@01 z@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= g@6@01 y@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= g@6@01 x@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= g@6@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall a: Ref ::a == g ==> acc(a.f, write)) &&
;   (forall a: Ref ::a == g ==> a.f < 3)
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(declare-const a@17@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] a == g
(assert (= a@17@01 g@6@01))
(pop) ; 3
(declare-fun inv@18@01 ($Ref) $Ref)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@17@01 $Ref) (a2@17@01 $Ref)) (!
  (=>
    (and (= a1@17@01 g@6@01) (= a2@17@01 g@6@01) (= a1@17@01 a2@17@01))
    (= a1@17@01 a2@17@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@17@01 $Ref)) (!
  (=>
    (= a@17@01 g@6@01)
    (and (= (inv@18@01 a@17@01) a@17@01) (img@19@01 a@17@01)))
  :pattern ((inv@18@01 a@17@01))
  :pattern ((img@19@01 a@17@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@19@01 r) (= (inv@18@01 r) g@6@01)) (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((a@17@01 $Ref)) (!
  (=> (= a@17@01 g@6@01) (not (= a@17@01 $Ref.null)))
  :pattern ((inv@18@01 a@17@01))
  :pattern ((img@19@01 a@17@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@16@01) $Snap.unit))
; [eval] (forall a: Ref ::a == g ==> a.f < 3)
(declare-const a@20@01 $Ref)
(push) ; 3
; [eval] a == g ==> a.f < 3
; [eval] a == g
(push) ; 4
; [then-branch: 0 | a@20@01 == g@6@01 | live]
; [else-branch: 0 | a@20@01 != g@6@01 | live]
(push) ; 5
; [then-branch: 0 | a@20@01 == g@6@01]
(assert (= a@20@01 g@6@01))
; [eval] a.f < 3
(declare-const sm@21@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@22@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@22@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r x@3@01) $Perm.Write $Perm.No)
            (ite (= r y@4@01) $Perm.Write $Perm.No))
          (ite (= r z@5@01) $Perm.Write $Perm.No))
        (ite (= r g@6@01) $Perm.Write $Perm.No))
      (ite (and (img@19@01 r) (= (inv@18@01 r) g@6@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@22@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@22@01  $FPM) a@20@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | a@20@01 != g@6@01]
(assert (not (= a@20@01 g@6@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@22@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r x@3@01) $Perm.Write $Perm.No)
            (ite (= r y@4@01) $Perm.Write $Perm.No))
          (ite (= r z@5@01) $Perm.Write $Perm.No))
        (ite (= r g@6@01) $Perm.Write $Perm.No))
      (ite (and (img@19@01 r) (= (inv@18@01 r) g@6@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@22@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Joined path conditions
(assert (or (not (= a@20@01 g@6@01)) (= a@20@01 g@6@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@22@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r x@3@01) $Perm.Write $Perm.No)
            (ite (= r y@4@01) $Perm.Write $Perm.No))
          (ite (= r z@5@01) $Perm.Write $Perm.No))
        (ite (= r g@6@01) $Perm.Write $Perm.No))
      (ite (and (img@19@01 r) (= (inv@18@01 r) g@6@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@22@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((a@20@01 $Ref)) (!
  (=> (= a@20@01 g@6@01) (< ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@20@01) 3))
  
  :qid |prog./silicon/silver/src/test/resources/all/permission_introspection/forpermQP.vpr@15@15@15@62|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert !(forperm a: Ref [a.f] :: a.f > 3)
; [eval] !(forperm a: Ref [a.f] :: a.f > 3)
; [eval] (forperm a: Ref [a.f] :: a.f > 3)
(declare-const a@23@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | FieldTrigger(f, First:($t@16@01), a@23@01) && img@19@01(a@23@01) && inv@18@01(a@23@01) == g@6@01 | live]
; [else-branch: 1 | !(FieldTrigger(f, First:($t@16@01), a@23@01) && img@19@01(a@23@01) && inv@18@01(a@23@01) == g@6@01) | live]
(push) ; 4
; [then-branch: 1 | FieldTrigger(f, First:($t@16@01), a@23@01) && img@19@01(a@23@01) && inv@18@01(a@23@01) == g@6@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01) a@23@01)
  (and (img@19@01 a@23@01) (= (inv@18@01 a@23@01) g@6@01))))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@23@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@23@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@23@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@23@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@23@01) (= (inv@18@01 a@23@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(FieldTrigger(f, First:($t@16@01), a@23@01) && img@19@01(a@23@01) && inv@18@01(a@23@01) == g@6@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01) a@23@01)
    (and (img@19@01 a@23@01) (= (inv@18@01 a@23@01) g@6@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01) a@23@01)
    (and (img@19@01 a@23@01) (= (inv@18@01 a@23@01) g@6@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01) a@23@01)
    (img@19@01 a@23@01)
    (= (inv@18@01 a@23@01) g@6@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01) a@23@01)
      (and (img@19@01 a@23@01) (= (inv@18@01 a@23@01) g@6@01))))
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01) a@23@01)
    (and (img@19@01 a@23@01) (= (inv@18@01 a@23@01) g@6@01)))))
(declare-const a@24@01 $Ref)
(push) ; 3
; [then-branch: 2 | FieldTrigger(f, sm@15@01, a@24@01) && a@24@01 == g@6@01 | live]
; [else-branch: 2 | !(FieldTrigger(f, sm@15@01, a@24@01) && a@24@01 == g@6@01) | live]
(push) ; 4
; [then-branch: 2 | FieldTrigger(f, sm@15@01, a@24@01) && a@24@01 == g@6@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@24@01) a@24@01)
  (= a@24@01 g@6@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@24@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@24@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@24@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@24@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@24@01) (= (inv@18@01 a@24@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(FieldTrigger(f, sm@15@01, a@24@01) && a@24@01 == g@6@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@24@01) a@24@01)
    (= a@24@01 g@6@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@24@01) a@24@01)
      (= a@24@01 g@6@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@24@01) a@24@01)
    (= a@24@01 g@6@01))))
(declare-const a@25@01 $Ref)
(push) ; 3
; [then-branch: 3 | FieldTrigger(f, sm@11@01, a@25@01) && a@25@01 == z@5@01 | live]
; [else-branch: 3 | !(FieldTrigger(f, sm@11@01, a@25@01) && a@25@01 == z@5@01) | live]
(push) ; 4
; [then-branch: 3 | FieldTrigger(f, sm@11@01, a@25@01) && a@25@01 == z@5@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@25@01) a@25@01)
  (= a@25@01 z@5@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@25@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@25@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@25@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@25@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@25@01) (= (inv@18@01 a@25@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(FieldTrigger(f, sm@11@01, a@25@01) && a@25@01 == z@5@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@25@01) a@25@01)
    (= a@25@01 z@5@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@25@01) a@25@01)
      (= a@25@01 z@5@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@25@01) a@25@01)
    (= a@25@01 z@5@01))))
(declare-const a@26@01 $Ref)
(push) ; 3
; [then-branch: 4 | FieldTrigger(f, sm@10@01, a@26@01) && a@26@01 == y@4@01 | live]
; [else-branch: 4 | !(FieldTrigger(f, sm@10@01, a@26@01) && a@26@01 == y@4@01) | live]
(push) ; 4
; [then-branch: 4 | FieldTrigger(f, sm@10@01, a@26@01) && a@26@01 == y@4@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@26@01) a@26@01)
  (= a@26@01 y@4@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@26@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@26@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@26@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@26@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@26@01) (= (inv@18@01 a@26@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(FieldTrigger(f, sm@10@01, a@26@01) && a@26@01 == y@4@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@26@01) a@26@01)
    (= a@26@01 y@4@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@26@01) a@26@01)
      (= a@26@01 y@4@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@26@01) a@26@01)
    (= a@26@01 y@4@01))))
(declare-const a@27@01 $Ref)
(push) ; 3
; [then-branch: 5 | FieldTrigger(f, sm@8@01, a@27@01) && a@27@01 == x@3@01 | live]
; [else-branch: 5 | !(FieldTrigger(f, sm@8@01, a@27@01) && a@27@01 == x@3@01) | live]
(push) ; 4
; [then-branch: 5 | FieldTrigger(f, sm@8@01, a@27@01) && a@27@01 == x@3@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@27@01) a@27@01)
  (= a@27@01 x@3@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@27@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@27@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@27@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@27@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@27@01) (= (inv@18@01 a@27@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(FieldTrigger(f, sm@8@01, a@27@01) && a@27@01 == x@3@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@27@01) a@27@01)
    (= a@27@01 x@3@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@27@01) a@27@01)
      (= a@27@01 x@3@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@27@01) a@27@01)
    (= a@27@01 x@3@01))))
(push) ; 3
(assert (not (not
  (and
    (forall ((a@23@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01) a@23@01)
          (and (img@19@01 a@23@01) (= (inv@18@01 a@23@01) g@6@01)))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@23@01) 3))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01))
      :qid |quant-0|))
    (forall ((a@24@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@24@01) a@24@01)
          (= a@24@01 g@6@01))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@24@01) 3))
      :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) a@24@01))
      :qid |quant-1|))
    (forall ((a@25@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@25@01) a@25@01)
          (= a@25@01 z@5@01))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@25@01) 3))
      :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) a@25@01))
      :qid |quant-2|))
    (forall ((a@26@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@26@01) a@26@01)
          (= a@26@01 y@4@01))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@26@01) 3))
      :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) a@26@01))
      :qid |quant-3|))
    (forall ((a@27@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@27@01) a@27@01)
          (= a@27@01 x@3@01))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@27@01) 3))
      :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) a@27@01))
      :qid |quant-4|))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not
  (and
    (forall ((a@23@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01) a@23@01)
          (and (img@19@01 a@23@01) (= (inv@18@01 a@23@01) g@6@01)))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@23@01) 3))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@23@01))
      :qid |quant-0|))
    (forall ((a@24@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@24@01) a@24@01)
          (= a@24@01 g@6@01))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@24@01) 3))
      :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) a@24@01))
      :qid |quant-1|))
    (forall ((a@25@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@25@01) a@25@01)
          (= a@25@01 z@5@01))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@25@01) 3))
      :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) a@25@01))
      :qid |quant-2|))
    (forall ((a@26@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@26@01) a@26@01)
          (= a@26@01 y@4@01))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@26@01) 3))
      :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) a@26@01))
      :qid |quant-3|))
    (forall ((a@27@01 $Ref)) (!
      (=>
        (and
          ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@27@01) a@27@01)
          (= a@27@01 x@3@01))
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@27@01) 3))
      :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) a@27@01))
      :qid |quant-4|)))))
; [exec]
; inhale (forall a: Ref ::a == x || a == y ==> a.f == 4)
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] (forall a: Ref ::a == x || a == y ==> a.f == 4)
(declare-const a@29@01 $Ref)
(push) ; 3
; [eval] a == x || a == y ==> a.f == 4
; [eval] a == x || a == y
; [eval] a == x
(push) ; 4
; [then-branch: 6 | a@29@01 == x@3@01 | live]
; [else-branch: 6 | a@29@01 != x@3@01 | live]
(push) ; 5
; [then-branch: 6 | a@29@01 == x@3@01]
(assert (= a@29@01 x@3@01))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | a@29@01 != x@3@01]
(assert (not (= a@29@01 x@3@01)))
; [eval] a == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@29@01 x@3@01)) (= a@29@01 x@3@01)))
(push) ; 4
; [then-branch: 7 | a@29@01 == x@3@01 || a@29@01 == y@4@01 | live]
; [else-branch: 7 | !(a@29@01 == x@3@01 || a@29@01 == y@4@01) | live]
(push) ; 5
; [then-branch: 7 | a@29@01 == x@3@01 || a@29@01 == y@4@01]
(assert (or (= a@29@01 x@3@01) (= a@29@01 y@4@01)))
; [eval] a.f == 4
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@29@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@29@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@29@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@29@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@29@01) (= (inv@18@01 a@29@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(a@29@01 == x@3@01 || a@29@01 == y@4@01)]
(assert (not (or (= a@29@01 x@3@01) (= a@29@01 y@4@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or
  (not (or (= a@29@01 x@3@01) (= a@29@01 y@4@01)))
  (or (= a@29@01 x@3@01) (= a@29@01 y@4@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((a@29@01 $Ref)) (!
  (=>
    (or (= a@29@01 x@3@01) (= a@29@01 y@4@01))
    (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@29@01) 4))
  
  :qid |prog./silicon/silver/src/test/resources/all/permission_introspection/forpermQP.vpr@20@15@20@61|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall a: Ref ::a == z ==> a.f == 10)
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] (forall a: Ref ::a == z ==> a.f == 10)
(declare-const a@31@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] a == z ==> a.f == 10
; [eval] a == z
(push) ; 4
; [then-branch: 8 | a@31@01 == z@5@01 | live]
; [else-branch: 8 | a@31@01 != z@5@01 | live]
(push) ; 5
; [then-branch: 8 | a@31@01 == z@5@01]
(assert (= a@31@01 z@5@01))
; [eval] a.f == 10
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@31@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@31@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@31@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@31@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@31@01) (= (inv@18@01 a@31@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | a@31@01 != z@5@01]
(assert (not (= a@31@01 z@5@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
; Joined path conditions
(assert (or (not (= a@31@01 z@5@01)) (= a@31@01 z@5@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((a@31@01 $Ref)) (!
  (=> (= a@31@01 z@5@01) (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@31@01) 10))
  
  :qid |prog./silicon/silver/src/test/resources/all/permission_introspection/forpermQP.vpr@21@15@21@52|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [a.f] :: a == g || a.f > 3)
; [eval] (forperm a: Ref [a.f] :: a == g || a.f > 3)
(declare-const a@32@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 9 | FieldTrigger(f, First:($t@16@01), a@32@01) && img@19@01(a@32@01) && inv@18@01(a@32@01) == g@6@01 | live]
; [else-branch: 9 | !(FieldTrigger(f, First:($t@16@01), a@32@01) && img@19@01(a@32@01) && inv@18@01(a@32@01) == g@6@01) | live]
(push) ; 4
; [then-branch: 9 | FieldTrigger(f, First:($t@16@01), a@32@01) && img@19@01(a@32@01) && inv@18@01(a@32@01) == g@6@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01) a@32@01)
  (and (img@19@01 a@32@01) (= (inv@18@01 a@32@01) g@6@01))))
; [eval] a == g || a.f > 3
; [eval] a == g
(push) ; 5
; [then-branch: 10 | a@32@01 == g@6@01 | live]
; [else-branch: 10 | a@32@01 != g@6@01 | live]
(push) ; 6
; [then-branch: 10 | a@32@01 == g@6@01]
(assert (= a@32@01 g@6@01))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | a@32@01 != g@6@01]
(assert (not (= a@32@01 g@6@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@32@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@32@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@32@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@32@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@32@01) (= (inv@18@01 a@32@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (or (not (= a@32@01 g@6@01)) (= a@32@01 g@6@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(FieldTrigger(f, First:($t@16@01), a@32@01) && img@19@01(a@32@01) && inv@18@01(a@32@01) == g@6@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01) a@32@01)
    (and (img@19@01 a@32@01) (= (inv@18@01 a@32@01) g@6@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01) a@32@01)
    (and (img@19@01 a@32@01) (= (inv@18@01 a@32@01) g@6@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01) a@32@01)
    (img@19@01 a@32@01)
    (= (inv@18@01 a@32@01) g@6@01)
    (or (not (= a@32@01 g@6@01)) (= a@32@01 g@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01) a@32@01)
      (and (img@19@01 a@32@01) (= (inv@18@01 a@32@01) g@6@01))))
  (and
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01) a@32@01)
    (and (img@19@01 a@32@01) (= (inv@18@01 a@32@01) g@6@01)))))
(declare-const a@33@01 $Ref)
(push) ; 3
; [then-branch: 11 | FieldTrigger(f, sm@15@01, a@33@01) && a@33@01 == g@6@01 | live]
; [else-branch: 11 | !(FieldTrigger(f, sm@15@01, a@33@01) && a@33@01 == g@6@01) | live]
(push) ; 4
; [then-branch: 11 | FieldTrigger(f, sm@15@01, a@33@01) && a@33@01 == g@6@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01) a@33@01)
  (= a@33@01 g@6@01)))
; [eval] a == g || a.f > 3
; [eval] a == g
(push) ; 5
; [then-branch: 12 | a@33@01 == g@6@01 | live]
; [else-branch: 12 | a@33@01 != g@6@01 | live]
(push) ; 6
; [then-branch: 12 | a@33@01 == g@6@01]
(pop) ; 6
(push) ; 6
; [else-branch: 12 | a@33@01 != g@6@01]
(assert (not (= a@33@01 g@6@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@33@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@33@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@33@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@33@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@33@01) (= (inv@18@01 a@33@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (or (not (= a@33@01 g@6@01)) (= a@33@01 g@6@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(FieldTrigger(f, sm@15@01, a@33@01) && a@33@01 == g@6@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01) a@33@01)
    (= a@33@01 g@6@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01) a@33@01)
    (= a@33@01 g@6@01))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01) a@33@01)
    (= a@33@01 g@6@01)
    (or (not (= a@33@01 g@6@01)) (= a@33@01 g@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01) a@33@01)
      (= a@33@01 g@6@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01) a@33@01)
    (= a@33@01 g@6@01))))
(declare-const a@34@01 $Ref)
(push) ; 3
; [then-branch: 13 | FieldTrigger(f, sm@11@01, a@34@01) && a@34@01 == z@5@01 | live]
; [else-branch: 13 | !(FieldTrigger(f, sm@11@01, a@34@01) && a@34@01 == z@5@01) | live]
(push) ; 4
; [then-branch: 13 | FieldTrigger(f, sm@11@01, a@34@01) && a@34@01 == z@5@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01) a@34@01)
  (= a@34@01 z@5@01)))
; [eval] a == g || a.f > 3
; [eval] a == g
(push) ; 5
; [then-branch: 14 | a@34@01 == g@6@01 | live]
; [else-branch: 14 | a@34@01 != g@6@01 | live]
(push) ; 6
; [then-branch: 14 | a@34@01 == g@6@01]
(assert (= a@34@01 g@6@01))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | a@34@01 != g@6@01]
(assert (not (= a@34@01 g@6@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@34@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@34@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@34@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@34@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@34@01) (= (inv@18@01 a@34@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (or (not (= a@34@01 g@6@01)) (= a@34@01 g@6@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | !(FieldTrigger(f, sm@11@01, a@34@01) && a@34@01 == z@5@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01) a@34@01)
    (= a@34@01 z@5@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01) a@34@01)
    (= a@34@01 z@5@01))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01) a@34@01)
    (= a@34@01 z@5@01)
    (or (not (= a@34@01 g@6@01)) (= a@34@01 g@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01) a@34@01)
      (= a@34@01 z@5@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01) a@34@01)
    (= a@34@01 z@5@01))))
(declare-const a@35@01 $Ref)
(push) ; 3
; [then-branch: 15 | FieldTrigger(f, sm@10@01, a@35@01) && a@35@01 == y@4@01 | live]
; [else-branch: 15 | !(FieldTrigger(f, sm@10@01, a@35@01) && a@35@01 == y@4@01) | live]
(push) ; 4
; [then-branch: 15 | FieldTrigger(f, sm@10@01, a@35@01) && a@35@01 == y@4@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01) a@35@01)
  (= a@35@01 y@4@01)))
; [eval] a == g || a.f > 3
; [eval] a == g
(push) ; 5
; [then-branch: 16 | a@35@01 == g@6@01 | live]
; [else-branch: 16 | a@35@01 != g@6@01 | live]
(push) ; 6
; [then-branch: 16 | a@35@01 == g@6@01]
(assert (= a@35@01 g@6@01))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | a@35@01 != g@6@01]
(assert (not (= a@35@01 g@6@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@35@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@35@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@35@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@35@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@35@01) (= (inv@18@01 a@35@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (or (not (= a@35@01 g@6@01)) (= a@35@01 g@6@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | !(FieldTrigger(f, sm@10@01, a@35@01) && a@35@01 == y@4@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01) a@35@01)
    (= a@35@01 y@4@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01) a@35@01)
    (= a@35@01 y@4@01))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01) a@35@01)
    (= a@35@01 y@4@01)
    (or (not (= a@35@01 g@6@01)) (= a@35@01 g@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01) a@35@01)
      (= a@35@01 y@4@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01) a@35@01)
    (= a@35@01 y@4@01))))
(declare-const a@36@01 $Ref)
(push) ; 3
; [then-branch: 17 | FieldTrigger(f, sm@8@01, a@36@01) && a@36@01 == x@3@01 | live]
; [else-branch: 17 | !(FieldTrigger(f, sm@8@01, a@36@01) && a@36@01 == x@3@01) | live]
(push) ; 4
; [then-branch: 17 | FieldTrigger(f, sm@8@01, a@36@01) && a@36@01 == x@3@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01) a@36@01)
  (= a@36@01 x@3@01)))
; [eval] a == g || a.f > 3
; [eval] a == g
(push) ; 5
; [then-branch: 18 | a@36@01 == g@6@01 | live]
; [else-branch: 18 | a@36@01 != g@6@01 | live]
(push) ; 6
; [then-branch: 18 | a@36@01 == g@6@01]
(assert (= a@36@01 g@6@01))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | a@36@01 != g@6@01]
(assert (not (= a@36@01 g@6@01)))
; [eval] a.f > 3
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@3@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@4@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@5@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (= r g@6@01)
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
      (=
        ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
    :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
    :qid |qp.fvfValDef4|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite (= a@36@01 x@3@01) $Perm.Write $Perm.No)
          (ite (= a@36@01 y@4@01) $Perm.Write $Perm.No))
        (ite (= a@36@01 z@5@01) $Perm.Write $Perm.No))
      (ite (= a@36@01 g@6@01) $Perm.Write $Perm.No))
    (ite
      (and (img@19@01 a@36@01) (= (inv@18@01 a@36@01) g@6@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (or (not (= a@36@01 g@6@01)) (= a@36@01 g@6@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 17 | !(FieldTrigger(f, sm@8@01, a@36@01) && a@36@01 == x@3@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01) a@36@01)
    (= a@36@01 x@3@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@3@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@4@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@10@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@5@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@11@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r g@6@01)
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) g@6@01))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01) a@36@01)
    (= a@36@01 x@3@01))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01) a@36@01)
    (= a@36@01 x@3@01)
    (or (not (= a@36@01 g@6@01)) (= a@36@01 g@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01) a@36@01)
      (= a@36@01 x@3@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01) a@36@01)
    (= a@36@01 x@3@01))))
(push) ; 3
(assert (not (and
  (forall ((a@32@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01) a@32@01)
        (and (img@19@01 a@32@01) (= (inv@18@01 a@32@01) g@6@01)))
      (or
        (= a@32@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@32@01) 3)))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01))
    :qid |quant-5|))
  (forall ((a@33@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01) a@33@01)
        (= a@33@01 g@6@01))
      (or
        (= a@33@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@33@01) 3)))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01))
    :qid |quant-6|))
  (forall ((a@34@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01) a@34@01)
        (= a@34@01 z@5@01))
      (or
        (= a@34@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@34@01) 3)))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01))
    :qid |quant-7|))
  (forall ((a@35@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01) a@35@01)
        (= a@35@01 y@4@01))
      (or
        (= a@35@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@35@01) 3)))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01))
    :qid |quant-8|))
  (forall ((a@36@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01) a@36@01)
        (= a@36@01 x@3@01))
      (or
        (= a@36@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@36@01) 3)))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01))
    :qid |quant-9|)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((a@32@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01) a@32@01)
        (and (img@19@01 a@32@01) (= (inv@18@01 a@32@01) g@6@01)))
      (or
        (= a@32@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@32@01) 3)))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@16@01)) a@32@01))
    :qid |quant-5|))
  (forall ((a@33@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01) a@33@01)
        (= a@33@01 g@6@01))
      (or
        (= a@33@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@33@01) 3)))
    :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) a@33@01))
    :qid |quant-6|))
  (forall ((a@34@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01) a@34@01)
        (= a@34@01 z@5@01))
      (or
        (= a@34@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@34@01) 3)))
    :pattern (($FVF.lookup_f (as sm@11@01  $FVF<f>) a@34@01))
    :qid |quant-7|))
  (forall ((a@35@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01) a@35@01)
        (= a@35@01 y@4@01))
      (or
        (= a@35@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@35@01) 3)))
    :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) a@35@01))
    :qid |quant-8|))
  (forall ((a@36@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01) a@36@01)
        (= a@36@01 x@3@01))
      (or
        (= a@36@01 g@6@01)
        (> ($FVF.lookup_f (as sm@21@01  $FVF<f>) a@36@01) 3)))
    :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) a@36@01))
    :qid |quant-9|))))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const x@37@01 $Ref)
(declare-const y@38@01 $Ref)
(declare-const x@39@01 $Ref)
(declare-const y@40@01 $Ref)
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
; inhale (forall a: Ref ::a == x ==> acc(P(x, 3), write))
(declare-const a@41@01 $Ref)
(push) ; 3
; [eval] a == x
(assert (= a@41@01 x@39@01))
(pop) ; 3
(declare-const $t@42@01 $PSF<P>)
(declare-fun inv@43@01 ($Ref Int) $Ref)
(declare-fun img@44@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@41@01 $Ref) (a2@41@01 $Ref)) (!
  (=> (and (= a1@41@01 x@39@01) (= a2@41@01 x@39@01)) (= a1@41@01 a2@41@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@41@01 $Ref)) (!
  (=>
    (= a@41@01 x@39@01)
    (and (= (inv@43@01 x@39@01 3) a@41@01) (img@44@01 x@39@01 3)))
  
  :qid |quant-u-3|)))
(assert (forall ((x $Ref) (i Int)) (!
  (=>
    (and (img@44@01 x i) (= (inv@43@01 x i) x@39@01))
    (and (= x@39@01 x) (= 3 i)))
  :pattern ((inv@43@01 x i))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall a: Ref ::a == y ==> acc(P(y, 0), write))
(declare-const a@45@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] a == y
(assert (= a@45@01 y@40@01))
(pop) ; 3
(declare-const $t@46@01 $PSF<P>)
(declare-fun inv@47@01 ($Ref Int) $Ref)
(declare-fun img@48@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@45@01 $Ref) (a2@45@01 $Ref)) (!
  (=> (and (= a1@45@01 y@40@01) (= a2@45@01 y@40@01)) (= a1@45@01 a2@45@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@45@01 $Ref)) (!
  (=>
    (= a@45@01 y@40@01)
    (and (= (inv@47@01 y@40@01 0) a@45@01) (img@48@01 y@40@01 0)))
  
  :qid |quant-u-5|)))
(assert (forall ((x $Ref) (i Int)) (!
  (=>
    (and (img@48@01 x i) (= (inv@47@01 x i) y@40@01))
    (and (= y@40@01 x) (= 0 i)))
  :pattern ((inv@47@01 x i))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (i Int)) (!
  (and
    (= y@40@01 x@39@01)
    (=
      (and (img@48@01 x i) (= (inv@47@01 x i) y@40@01))
      (and (img@44@01 x i) (= (inv@43@01 x i) x@39@01))))
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref, i: Int [P(a, i)] :: i >= 0)
; [eval] (forperm a: Ref, i: Int [P(a, i)] :: i >= 0)
(declare-const a@49@01 $Ref)
(declare-const i@50@01 Int)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 19 | PredicateTrigger(P, $t@46@01, List(a@49@01, i@50@01)) && img@48@01(a@49@01, i@50@01) && inv@47@01(a@49@01, i@50@01) == y@40@01 | live]
; [else-branch: 19 | !(PredicateTrigger(P, $t@46@01, List(a@49@01, i@50@01)) && img@48@01(a@49@01, i@50@01) && inv@47@01(a@49@01, i@50@01) == y@40@01) | live]
(push) ; 4
; [then-branch: 19 | PredicateTrigger(P, $t@46@01, List(a@49@01, i@50@01)) && img@48@01(a@49@01, i@50@01) && inv@47@01(a@49@01, i@50@01) == y@40@01]
(assert (and
  ($PSF.loc_P ($PSF.lookup_P $t@46@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@49@01)
    ($SortWrappers.IntTo$Snap i@50@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@49@01)
    ($SortWrappers.IntTo$Snap i@50@01)))
  (and (img@48@01 a@49@01 i@50@01) (= (inv@47@01 a@49@01 i@50@01) y@40@01))))
; [eval] i >= 0
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(PredicateTrigger(P, $t@46@01, List(a@49@01, i@50@01)) && img@48@01(a@49@01, i@50@01) && inv@47@01(a@49@01, i@50@01) == y@40@01)]
(assert (not
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@46@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01)))
    (and (img@48@01 a@49@01 i@50@01) (= (inv@47@01 a@49@01 i@50@01) y@40@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@46@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01)))
    (and (img@48@01 a@49@01 i@50@01) (= (inv@47@01 a@49@01 i@50@01) y@40@01)))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@46@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01)))
    (img@48@01 a@49@01 i@50@01)
    (= (inv@47@01 a@49@01 i@50@01) y@40@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_P ($PSF.lookup_P $t@46@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@49@01)
        ($SortWrappers.IntTo$Snap i@50@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@49@01)
        ($SortWrappers.IntTo$Snap i@50@01)))
      (and (img@48@01 a@49@01 i@50@01) (= (inv@47@01 a@49@01 i@50@01) y@40@01))))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@46@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01)))
    (and (img@48@01 a@49@01 i@50@01) (= (inv@47@01 a@49@01 i@50@01) y@40@01)))))
(declare-const a@51@01 $Ref)
(declare-const i@52@01 Int)
(push) ; 3
; [then-branch: 20 | PredicateTrigger(P, $t@42@01, List(a@51@01, i@52@01)) && img@44@01(a@51@01, i@52@01) && inv@43@01(a@51@01, i@52@01) == x@39@01 | live]
; [else-branch: 20 | !(PredicateTrigger(P, $t@42@01, List(a@51@01, i@52@01)) && img@44@01(a@51@01, i@52@01) && inv@43@01(a@51@01, i@52@01) == x@39@01) | live]
(push) ; 4
; [then-branch: 20 | PredicateTrigger(P, $t@42@01, List(a@51@01, i@52@01)) && img@44@01(a@51@01, i@52@01) && inv@43@01(a@51@01, i@52@01) == x@39@01]
(assert (and
  ($PSF.loc_P ($PSF.lookup_P $t@42@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@51@01)
    ($SortWrappers.IntTo$Snap i@52@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@51@01)
    ($SortWrappers.IntTo$Snap i@52@01)))
  (and (img@44@01 a@51@01 i@52@01) (= (inv@43@01 a@51@01 i@52@01) x@39@01))))
; [eval] i >= 0
(pop) ; 4
(push) ; 4
; [else-branch: 20 | !(PredicateTrigger(P, $t@42@01, List(a@51@01, i@52@01)) && img@44@01(a@51@01, i@52@01) && inv@43@01(a@51@01, i@52@01) == x@39@01)]
(assert (not
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@42@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01)))
    (and (img@44@01 a@51@01 i@52@01) (= (inv@43@01 a@51@01 i@52@01) x@39@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@42@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01)))
    (and (img@44@01 a@51@01 i@52@01) (= (inv@43@01 a@51@01 i@52@01) x@39@01)))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@42@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01)))
    (img@44@01 a@51@01 i@52@01)
    (= (inv@43@01 a@51@01 i@52@01) x@39@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_P ($PSF.lookup_P $t@42@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@51@01)
        ($SortWrappers.IntTo$Snap i@52@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@51@01)
        ($SortWrappers.IntTo$Snap i@52@01)))
      (and (img@44@01 a@51@01 i@52@01) (= (inv@43@01 a@51@01 i@52@01) x@39@01))))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@42@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01)))
    (and (img@44@01 a@51@01 i@52@01) (= (inv@43@01 a@51@01 i@52@01) x@39@01)))))
(push) ; 3
(assert (not (and
  (forall ((a@49@01 $Ref) (i@50@01 Int)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@46@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@49@01)
          ($SortWrappers.IntTo$Snap i@50@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@49@01)
          ($SortWrappers.IntTo$Snap i@50@01)))
        (and (img@48@01 a@49@01 i@50@01) (= (inv@47@01 a@49@01 i@50@01) y@40@01)))
      (>= i@50@01 0))
    :pattern (($PSF.lookup_P $t@46@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01))))
    :qid |quant-10|))
  (forall ((a@51@01 $Ref) (i@52@01 Int)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@42@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@51@01)
          ($SortWrappers.IntTo$Snap i@52@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@51@01)
          ($SortWrappers.IntTo$Snap i@52@01)))
        (and (img@44@01 a@51@01 i@52@01) (= (inv@43@01 a@51@01 i@52@01) x@39@01)))
      (>= i@52@01 0))
    :pattern (($PSF.lookup_P $t@42@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01))))
    :qid |quant-11|)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((a@49@01 $Ref) (i@50@01 Int)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@46@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@49@01)
          ($SortWrappers.IntTo$Snap i@50@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@49@01)
          ($SortWrappers.IntTo$Snap i@50@01)))
        (and (img@48@01 a@49@01 i@50@01) (= (inv@47@01 a@49@01 i@50@01) y@40@01)))
      (>= i@50@01 0))
    :pattern (($PSF.lookup_P $t@46@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@49@01)
      ($SortWrappers.IntTo$Snap i@50@01))))
    :qid |quant-10|))
  (forall ((a@51@01 $Ref) (i@52@01 Int)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@42@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@51@01)
          ($SortWrappers.IntTo$Snap i@52@01))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@51@01)
          ($SortWrappers.IntTo$Snap i@52@01)))
        (and (img@44@01 a@51@01 i@52@01) (= (inv@43@01 a@51@01 i@52@01) x@39@01)))
      (>= i@52@01 0))
    :pattern (($PSF.lookup_P $t@42@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@51@01)
      ($SortWrappers.IntTo$Snap i@52@01))))
    :qid |quant-11|))))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const x@53@01 $Ref)
(declare-const y@54@01 $Ref)
(declare-const z@55@01 $Ref)
(declare-const x@56@01 $Ref)
(declare-const y@57@01 $Ref)
(declare-const z@58@01 $Ref)
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
; inhale acc(x.f, write)
(declare-const $t@59@01 Int)
(assert (not (= x@56@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(z.f, write)
(declare-const $t@60@01 Int)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@56@01 z@58@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@58@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x.f == 5
(declare-const $t@61@01 $Snap)
(assert (= $t@61@01 $Snap.unit))
; [eval] x.f == 5
(assert (= $t@59@01 5))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale z.f == 10
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 $Snap.unit))
; [eval] z.f == 10
(assert (= $t@60@01 10))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x != y
(declare-const $t@63@01 $Snap)
(assert (= $t@63@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@56@01 y@57@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale z != y
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 $Snap.unit))
; [eval] z != y
(assert (not (= z@58@01 y@57@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forall a: Ref ::perm(a.f) == write ==> a == x || a == z)
; [eval] (forall a: Ref ::perm(a.f) == write ==> a == x || a == z)
(declare-const a@65@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] perm(a.f) == write ==> a == x || a == z
; [eval] perm(a.f) == write
; [eval] perm(a.f)
(push) ; 4
; [then-branch: 21 | (a@65@01 == z@58@01 ? W : Z) + (a@65@01 == x@56@01 ? W : Z) == W | live]
; [else-branch: 21 | (a@65@01 == z@58@01 ? W : Z) + (a@65@01 == x@56@01 ? W : Z) != W | live]
(push) ; 5
; [then-branch: 21 | (a@65@01 == z@58@01 ? W : Z) + (a@65@01 == x@56@01 ? W : Z) == W]
(assert (=
  (+
    (ite (= a@65@01 z@58@01) $Perm.Write $Perm.No)
    (ite (= a@65@01 x@56@01) $Perm.Write $Perm.No))
  $Perm.Write))
; [eval] a == x || a == z
; [eval] a == x
(push) ; 6
; [then-branch: 22 | a@65@01 == x@56@01 | live]
; [else-branch: 22 | a@65@01 != x@56@01 | live]
(push) ; 7
; [then-branch: 22 | a@65@01 == x@56@01]
(assert (= a@65@01 x@56@01))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | a@65@01 != x@56@01]
(assert (not (= a@65@01 x@56@01)))
; [eval] a == z
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@65@01 x@56@01)) (= a@65@01 x@56@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | (a@65@01 == z@58@01 ? W : Z) + (a@65@01 == x@56@01 ? W : Z) != W]
(assert (not
  (=
    (+
      (ite (= a@65@01 z@58@01) $Perm.Write $Perm.No)
      (ite (= a@65@01 x@56@01) $Perm.Write $Perm.No))
    $Perm.Write)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (=
    (+
      (ite (= a@65@01 z@58@01) $Perm.Write $Perm.No)
      (ite (= a@65@01 x@56@01) $Perm.Write $Perm.No))
    $Perm.Write)
  (and
    (=
      (+
        (ite (= a@65@01 z@58@01) $Perm.Write $Perm.No)
        (ite (= a@65@01 x@56@01) $Perm.Write $Perm.No))
      $Perm.Write)
    (or (not (= a@65@01 x@56@01)) (= a@65@01 x@56@01)))))
; Joined path conditions
(assert (or
  (not
    (=
      (+
        (ite (= a@65@01 z@58@01) $Perm.Write $Perm.No)
        (ite (= a@65@01 x@56@01) $Perm.Write $Perm.No))
      $Perm.Write))
  (=
    (+
      (ite (= a@65@01 z@58@01) $Perm.Write $Perm.No)
      (ite (= a@65@01 x@56@01) $Perm.Write $Perm.No))
    $Perm.Write)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((a@65@01 $Ref)) (!
  (=>
    (=
      (+
        (ite (= a@65@01 z@58@01) $Perm.Write $Perm.No)
        (ite (= a@65@01 x@56@01) $Perm.Write $Perm.No))
      $Perm.Write)
    (or (= a@65@01 x@56@01) (= a@65@01 z@58@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/permission_introspection/forpermQP.vpr@40@12@40@68|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((a@65@01 $Ref)) (!
  (=>
    (=
      (+
        (ite (= a@65@01 z@58@01) $Perm.Write $Perm.No)
        (ite (= a@65@01 x@56@01) $Perm.Write $Perm.No))
      $Perm.Write)
    (or (= a@65@01 x@56@01) (= a@65@01 z@58@01)))
  
  :qid |prog./silicon/silver/src/test/resources/all/permission_introspection/forpermQP.vpr@40@12@40@68|)))
; [exec]
; inhale (forall a: Ref ::a == x || a == z ==>
;     acc(a.f, write) --* acc(y.f, write))
(declare-const a@66@01 $Ref)
(push) ; 3
; [eval] a == x || a == z
; [eval] a == x
(push) ; 4
; [then-branch: 23 | a@66@01 == x@56@01 | live]
; [else-branch: 23 | a@66@01 != x@56@01 | live]
(push) ; 5
; [then-branch: 23 | a@66@01 == x@56@01]
(assert (= a@66@01 x@56@01))
(pop) ; 5
(push) ; 5
; [else-branch: 23 | a@66@01 != x@56@01]
(assert (not (= a@66@01 x@56@01)))
; [eval] a == z
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@66@01 x@56@01)) (= a@66@01 x@56@01)))
(assert (or (= a@66@01 x@56@01) (= a@66@01 z@58@01)))
(pop) ; 3
(declare-const $t@67@01 $PSF<wand@0>)
(declare-fun inv@68@01 ($Ref $Perm $Ref $Perm) $Ref)
(declare-fun img@69@01 ($Ref $Perm $Ref $Perm) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@66@01 $Ref)) (!
  (=>
    (or (= a@66@01 x@56@01) (= a@66@01 z@58@01))
    (or (not (= a@66@01 x@56@01)) (= a@66@01 x@56@01)))
  :pattern ((inv@68@01 a@66@01 $Perm.Write y@57@01 $Perm.Write))
  :pattern ((img@69@01 a@66@01 $Perm.Write y@57@01 $Perm.Write))
  :qid |wand@0-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@66@01 $Ref) (a2@66@01 $Ref)) (!
  (=>
    (and
      (or (= a1@66@01 x@56@01) (= a1@66@01 z@58@01))
      (or (= a2@66@01 x@56@01) (= a2@66@01 z@58@01))
      (= a1@66@01 a2@66@01))
    (= a1@66@01 a2@66@01))
  
  :qid |wand@0-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@66@01 $Ref)) (!
  (=>
    (or (= a@66@01 x@56@01) (= a@66@01 z@58@01))
    (and
      (= (inv@68@01 a@66@01 $Perm.Write y@57@01 $Perm.Write) a@66@01)
      (img@69@01 a@66@01 $Perm.Write y@57@01 $Perm.Write)))
  :pattern ((inv@68@01 a@66@01 $Perm.Write y@57@01 $Perm.Write))
  :pattern ((img@69@01 a@66@01 $Perm.Write y@57@01 $Perm.Write))
  :qid |quant-u-8|)))
(assert (forall ((x0 $Ref) (x1 $Perm) (x2 $Ref) (x3 $Perm)) (!
  (=>
    (and
      (img@69@01 x0 x1 x2 x3)
      (or
        (= (inv@68@01 x0 x1 x2 x3) x@56@01)
        (= (inv@68@01 x0 x1 x2 x3) z@58@01)))
    (and
      (= (inv@68@01 x0 x1 x2 x3) x0)
      (= $Perm.Write x1)
      (= y@57@01 x2)
      (= $Perm.Write x3)))
  :pattern ((inv@68@01 x0 x1 x2 x3))
  :qid |wand@0-fctOfInv|)))
; Permissons are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [a.f] :: a.f > 0)
; [eval] (forperm a: Ref [a.f] :: a.f > 0)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | True | live]
; [else-branch: 24 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 24 | True]
; [eval] a.f > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 25 | True]
; [eval] a.f > 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (and (> $t@60@01 0) (> $t@59@01 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (> $t@60@01 0) (> $t@59@01 0)))
; [exec]
; assert (forperm
;     a: Ref [acc(a.f, write) --* acc(y.f, write)] :: a == x || a == z)
; [eval] (forperm a: Ref [acc(a.f, write) --* acc(y.f, write)] :: a == x || a == z)
(declare-const a@70@01 $Ref)
(push) ; 3
; [then-branch: 26 | PredicateTrigger(wand@0, $t@67@01, List(a@70@01, W, y@57@01, W)) && img@69@01(a@70@01, W, y@57@01, W) && inv@68@01(a@70@01, W, y@57@01, W) == x@56@01 || inv@68@01(a@70@01, W, y@57@01, W) == z@58@01 | live]
; [else-branch: 26 | !(PredicateTrigger(wand@0, $t@67@01, List(a@70@01, W, y@57@01, W)) && img@69@01(a@70@01, W, y@57@01, W) && inv@68@01(a@70@01, W, y@57@01, W) == x@56@01 || inv@68@01(a@70@01, W, y@57@01, W) == z@58@01) | live]
(push) ; 4
; [then-branch: 26 | PredicateTrigger(wand@0, $t@67@01, List(a@70@01, W, y@57@01, W)) && img@69@01(a@70@01, W, y@57@01, W) && inv@68@01(a@70@01, W, y@57@01, W) == x@56@01 || inv@68@01(a@70@01, W, y@57@01, W) == z@58@01]
(assert (and
  ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@70@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@57@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@70@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@57@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  (and
    (img@69@01 a@70@01 $Perm.Write y@57@01 $Perm.Write)
    (or
      (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) x@56@01)
      (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) z@58@01)))))
; [eval] a == x || a == z
; [eval] a == x
(push) ; 5
; [then-branch: 27 | a@70@01 == x@56@01 | live]
; [else-branch: 27 | a@70@01 != x@56@01 | live]
(push) ; 6
; [then-branch: 27 | a@70@01 == x@56@01]
(assert (= a@70@01 x@56@01))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | a@70@01 != x@56@01]
(assert (not (= a@70@01 x@56@01)))
; [eval] a == z
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@70@01 x@56@01)) (= a@70@01 x@56@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 26 | !(PredicateTrigger(wand@0, $t@67@01, List(a@70@01, W, y@57@01, W)) && img@69@01(a@70@01, W, y@57@01, W) && inv@68@01(a@70@01, W, y@57@01, W) == x@56@01 || inv@68@01(a@70@01, W, y@57@01, W) == z@58@01)]
(assert (not
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@70@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@57@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@70@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@57@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (img@69@01 a@70@01 $Perm.Write y@57@01 $Perm.Write)
      (or
        (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) x@56@01)
        (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) z@58@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@70@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@57@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@70@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@57@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (img@69@01 a@70@01 $Perm.Write y@57@01 $Perm.Write)
      (or
        (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) x@56@01)
        (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) z@58@01))))
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@70@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@57@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@70@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@57@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (img@69@01 a@70@01 $Perm.Write y@57@01 $Perm.Write)
    (or
      (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) x@56@01)
      (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) z@58@01))
    (or (not (= a@70@01 x@56@01)) (= a@70@01 x@56@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@70@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@57@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@70@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@57@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (img@69@01 a@70@01 $Perm.Write y@57@01 $Perm.Write)
        (or
          (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) x@56@01)
          (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) z@58@01)))))
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@70@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@57@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@70@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap y@57@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (img@69@01 a@70@01 $Perm.Write y@57@01 $Perm.Write)
      (or
        (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) x@56@01)
        (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) z@58@01))))))
(push) ; 3
(assert (not (forall ((a@70@01 $Ref)) (!
  (=>
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@70@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@57@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@70@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@57@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (img@69@01 a@70@01 $Perm.Write y@57@01 $Perm.Write)
        (or
          (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) x@56@01)
          (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) z@58@01))))
    (or (= a@70@01 x@56@01) (= a@70@01 z@58@01)))
  :pattern (($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@70@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@57@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |quant-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((a@70@01 $Ref)) (!
  (=>
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@70@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@57@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@70@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap y@57@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (img@69@01 a@70@01 $Perm.Write y@57@01 $Perm.Write)
        (or
          (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) x@56@01)
          (= (inv@68@01 a@70@01 $Perm.Write y@57@01 $Perm.Write) z@58@01))))
    (or (= a@70@01 x@56@01) (= a@70@01 z@58@01)))
  :pattern (($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@70@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap y@57@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |quant-12|)))
; [exec]
; assert (forperm
;     a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: b == y)
; [eval] (forperm a: Ref, b: Ref [acc(a.f, write) --* acc(b.f, write)] :: b == y)
(declare-const a@71@01 $Ref)
(declare-const b@72@01 $Ref)
(push) ; 3
; [then-branch: 28 | PredicateTrigger(wand@0, $t@67@01, List(a@71@01, W, b@72@01, W)) && img@69@01(a@71@01, W, b@72@01, W) && inv@68@01(a@71@01, W, b@72@01, W) == x@56@01 || inv@68@01(a@71@01, W, b@72@01, W) == z@58@01 | live]
; [else-branch: 28 | !(PredicateTrigger(wand@0, $t@67@01, List(a@71@01, W, b@72@01, W)) && img@69@01(a@71@01, W, b@72@01, W) && inv@68@01(a@71@01, W, b@72@01, W) == x@56@01 || inv@68@01(a@71@01, W, b@72@01, W) == z@58@01) | live]
(push) ; 4
; [then-branch: 28 | PredicateTrigger(wand@0, $t@67@01, List(a@71@01, W, b@72@01, W)) && img@69@01(a@71@01, W, b@72@01, W) && inv@68@01(a@71@01, W, b@72@01, W) == x@56@01 || inv@68@01(a@71@01, W, b@72@01, W) == z@58@01]
(assert (and
  ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@71@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap b@72@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@71@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap b@72@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write)))
  (and
    (img@69@01 a@71@01 $Perm.Write b@72@01 $Perm.Write)
    (or
      (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) x@56@01)
      (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) z@58@01)))))
; [eval] b == y
(pop) ; 4
(push) ; 4
; [else-branch: 28 | !(PredicateTrigger(wand@0, $t@67@01, List(a@71@01, W, b@72@01, W)) && img@69@01(a@71@01, W, b@72@01, W) && inv@68@01(a@71@01, W, b@72@01, W) == x@56@01 || inv@68@01(a@71@01, W, b@72@01, W) == z@58@01)]
(assert (not
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@71@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap b@72@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@71@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap b@72@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (img@69@01 a@71@01 $Perm.Write b@72@01 $Perm.Write)
      (or
        (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) x@56@01)
        (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) z@58@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@71@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap b@72@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@71@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap b@72@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (img@69@01 a@71@01 $Perm.Write b@72@01 $Perm.Write)
      (or
        (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) x@56@01)
        (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) z@58@01))))
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@71@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap b@72@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@71@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap b@72@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (img@69@01 a@71@01 $Perm.Write b@72@01 $Perm.Write)
    (or
      (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) x@56@01)
      (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) z@58@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@71@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap b@72@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@71@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap b@72@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (img@69@01 a@71@01 $Perm.Write b@72@01 $Perm.Write)
        (or
          (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) x@56@01)
          (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) z@58@01)))))
  (and
    ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@71@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap b@72@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
      ($Snap.combine
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@71@01)
          ($SortWrappers.$PermTo$Snap $Perm.Write))
        ($SortWrappers.$RefTo$Snap b@72@01))
      ($SortWrappers.$PermTo$Snap $Perm.Write)))
    (and
      (img@69@01 a@71@01 $Perm.Write b@72@01 $Perm.Write)
      (or
        (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) x@56@01)
        (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) z@58@01))))))
(push) ; 3
(assert (not (forall ((a@71@01 $Ref) (b@72@01 $Ref)) (!
  (=>
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@71@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap b@72@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@71@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap b@72@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (img@69@01 a@71@01 $Perm.Write b@72@01 $Perm.Write)
        (or
          (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) x@56@01)
          (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) z@58@01))))
    (= b@72@01 y@57@01))
  :pattern (($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@71@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap b@72@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |quant-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((a@71@01 $Ref) (b@72@01 $Ref)) (!
  (=>
    (and
      ($PSF.loc_wand@0 ($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@71@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap b@72@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write))) ($Snap.combine
        ($Snap.combine
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap a@71@01)
            ($SortWrappers.$PermTo$Snap $Perm.Write))
          ($SortWrappers.$RefTo$Snap b@72@01))
        ($SortWrappers.$PermTo$Snap $Perm.Write)))
      (and
        (img@69@01 a@71@01 $Perm.Write b@72@01 $Perm.Write)
        (or
          (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) x@56@01)
          (= (inv@68@01 a@71@01 $Perm.Write b@72@01 $Perm.Write) z@58@01))))
    (= b@72@01 y@57@01))
  :pattern (($PSF.lookup_wand@0 $t@67@01 ($Snap.combine
    ($Snap.combine
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@71@01)
        ($SortWrappers.$PermTo$Snap $Perm.Write))
      ($SortWrappers.$RefTo$Snap b@72@01))
    ($SortWrappers.$PermTo$Snap $Perm.Write))))
  :qid |quant-13|)))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const x@73@01 $Ref)
(declare-const y@74@01 $Ref)
(declare-const x@75@01 $Ref)
(declare-const y@76@01 $Ref)
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
; inhale (forall a: Ref ::a == x || a == y ==> acc(p2(a, x), write))
(declare-const a@77@01 $Ref)
(push) ; 3
; [eval] a == x || a == y
; [eval] a == x
(push) ; 4
; [then-branch: 29 | a@77@01 == x@75@01 | live]
; [else-branch: 29 | a@77@01 != x@75@01 | live]
(push) ; 5
; [then-branch: 29 | a@77@01 == x@75@01]
(assert (= a@77@01 x@75@01))
(pop) ; 5
(push) ; 5
; [else-branch: 29 | a@77@01 != x@75@01]
(assert (not (= a@77@01 x@75@01)))
; [eval] a == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@77@01 x@75@01)) (= a@77@01 x@75@01)))
(assert (or (= a@77@01 x@75@01) (= a@77@01 y@76@01)))
(pop) ; 3
(declare-const $t@78@01 $PSF<p2>)
(declare-fun inv@79@01 ($Ref $Ref) $Ref)
(declare-fun img@80@01 ($Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@77@01 $Ref)) (!
  (=>
    (or (= a@77@01 x@75@01) (= a@77@01 y@76@01))
    (or (not (= a@77@01 x@75@01)) (= a@77@01 x@75@01)))
  :pattern ((inv@79@01 a@77@01 x@75@01))
  :pattern ((img@80@01 a@77@01 x@75@01))
  :qid |p2-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@77@01 $Ref) (a2@77@01 $Ref)) (!
  (=>
    (and
      (or (= a1@77@01 x@75@01) (= a1@77@01 y@76@01))
      (or (= a2@77@01 x@75@01) (= a2@77@01 y@76@01))
      (= a1@77@01 a2@77@01))
    (= a1@77@01 a2@77@01))
  
  :qid |p2-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@77@01 $Ref)) (!
  (=>
    (or (= a@77@01 x@75@01) (= a@77@01 y@76@01))
    (and (= (inv@79@01 a@77@01 x@75@01) a@77@01) (img@80@01 a@77@01 x@75@01)))
  :pattern ((inv@79@01 a@77@01 x@75@01))
  :pattern ((img@80@01 a@77@01 x@75@01))
  :qid |quant-u-10|)))
(assert (forall ((x $Ref) (y $Ref)) (!
  (=>
    (and
      (img@80@01 x y)
      (or (= (inv@79@01 x y) x@75@01) (= (inv@79@01 x y) y@76@01)))
    (and (= (inv@79@01 x y) x) (= x@75@01 y)))
  :pattern ((inv@79@01 x y))
  :qid |p2-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != y
(declare-const $t@81@01 $Snap)
(assert (= $t@81@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@75@01 y@76@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [p2(a, a)] :: a == x)
; [eval] (forperm a: Ref [p2(a, a)] :: a == x)
(declare-const a@82@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 30 | PredicateTrigger(p2, $t@78@01, List(a@82@01, a@82@01)) && img@80@01(a@82@01, a@82@01) && inv@79@01(a@82@01, a@82@01) == x@75@01 || inv@79@01(a@82@01, a@82@01) == y@76@01 | live]
; [else-branch: 30 | !(PredicateTrigger(p2, $t@78@01, List(a@82@01, a@82@01)) && img@80@01(a@82@01, a@82@01) && inv@79@01(a@82@01, a@82@01) == x@75@01 || inv@79@01(a@82@01, a@82@01) == y@76@01) | live]
(push) ; 4
; [then-branch: 30 | PredicateTrigger(p2, $t@78@01, List(a@82@01, a@82@01)) && img@80@01(a@82@01, a@82@01) && inv@79@01(a@82@01, a@82@01) == x@75@01 || inv@79@01(a@82@01, a@82@01) == y@76@01]
(assert (and
  ($PSF.loc_p2 ($PSF.lookup_p2 $t@78@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@82@01)
    ($SortWrappers.$RefTo$Snap a@82@01))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@82@01)
    ($SortWrappers.$RefTo$Snap a@82@01)))
  (and
    (img@80@01 a@82@01 a@82@01)
    (or
      (= (inv@79@01 a@82@01 a@82@01) x@75@01)
      (= (inv@79@01 a@82@01 a@82@01) y@76@01)))))
; [eval] a == x
(pop) ; 4
(push) ; 4
; [else-branch: 30 | !(PredicateTrigger(p2, $t@78@01, List(a@82@01, a@82@01)) && img@80@01(a@82@01, a@82@01) && inv@79@01(a@82@01, a@82@01) == x@75@01 || inv@79@01(a@82@01, a@82@01) == y@76@01)]
(assert (not
  (and
    ($PSF.loc_p2 ($PSF.lookup_p2 $t@78@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@82@01)
      ($SortWrappers.$RefTo$Snap a@82@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@82@01)
      ($SortWrappers.$RefTo$Snap a@82@01)))
    (and
      (img@80@01 a@82@01 a@82@01)
      (or
        (= (inv@79@01 a@82@01 a@82@01) x@75@01)
        (= (inv@79@01 a@82@01 a@82@01) y@76@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_p2 ($PSF.lookup_p2 $t@78@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@82@01)
      ($SortWrappers.$RefTo$Snap a@82@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@82@01)
      ($SortWrappers.$RefTo$Snap a@82@01)))
    (and
      (img@80@01 a@82@01 a@82@01)
      (or
        (= (inv@79@01 a@82@01 a@82@01) x@75@01)
        (= (inv@79@01 a@82@01 a@82@01) y@76@01))))
  (and
    ($PSF.loc_p2 ($PSF.lookup_p2 $t@78@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@82@01)
      ($SortWrappers.$RefTo$Snap a@82@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@82@01)
      ($SortWrappers.$RefTo$Snap a@82@01)))
    (img@80@01 a@82@01 a@82@01)
    (or
      (= (inv@79@01 a@82@01 a@82@01) x@75@01)
      (= (inv@79@01 a@82@01 a@82@01) y@76@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_p2 ($PSF.lookup_p2 $t@78@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@82@01)
        ($SortWrappers.$RefTo$Snap a@82@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@82@01)
        ($SortWrappers.$RefTo$Snap a@82@01)))
      (and
        (img@80@01 a@82@01 a@82@01)
        (or
          (= (inv@79@01 a@82@01 a@82@01) x@75@01)
          (= (inv@79@01 a@82@01 a@82@01) y@76@01)))))
  (and
    ($PSF.loc_p2 ($PSF.lookup_p2 $t@78@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@82@01)
      ($SortWrappers.$RefTo$Snap a@82@01))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@82@01)
      ($SortWrappers.$RefTo$Snap a@82@01)))
    (and
      (img@80@01 a@82@01 a@82@01)
      (or
        (= (inv@79@01 a@82@01 a@82@01) x@75@01)
        (= (inv@79@01 a@82@01 a@82@01) y@76@01))))))
(push) ; 3
(assert (not (forall ((a@82@01 $Ref)) (!
  (=>
    (and
      ($PSF.loc_p2 ($PSF.lookup_p2 $t@78@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@82@01)
        ($SortWrappers.$RefTo$Snap a@82@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@82@01)
        ($SortWrappers.$RefTo$Snap a@82@01)))
      (and
        (img@80@01 a@82@01 a@82@01)
        (or
          (= (inv@79@01 a@82@01 a@82@01) x@75@01)
          (= (inv@79@01 a@82@01 a@82@01) y@76@01))))
    (= a@82@01 x@75@01))
  :pattern (($PSF.lookup_p2 $t@78@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@82@01)
    ($SortWrappers.$RefTo$Snap a@82@01))))
  :qid |quant-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((a@82@01 $Ref)) (!
  (=>
    (and
      ($PSF.loc_p2 ($PSF.lookup_p2 $t@78@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@82@01)
        ($SortWrappers.$RefTo$Snap a@82@01))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@82@01)
        ($SortWrappers.$RefTo$Snap a@82@01)))
      (and
        (img@80@01 a@82@01 a@82@01)
        (or
          (= (inv@79@01 a@82@01 a@82@01) x@75@01)
          (= (inv@79@01 a@82@01 a@82@01) y@76@01))))
    (= a@82@01 x@75@01))
  :pattern (($PSF.lookup_p2 $t@78@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@82@01)
    ($SortWrappers.$RefTo$Snap a@82@01))))
  :qid |quant-14|)))
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const x@83@01 $Ref)
(declare-const y@84@01 $Ref)
(declare-const z@85@01 $Ref)
(declare-const x@86@01 $Ref)
(declare-const y@87@01 $Ref)
(declare-const z@88@01 $Ref)
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
; inhale x != y
(declare-const $t@89@01 $Snap)
(assert (= $t@89@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@86@01 y@87@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale z != y
(declare-const $t@90@01 $Snap)
(assert (= $t@90@01 $Snap.unit))
; [eval] z != y
(assert (not (= z@88@01 y@87@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall a: Ref ::a == x ==> acc(P(a, 3), write))
(declare-const a@91@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] a == x
(assert (= a@91@01 x@86@01))
(pop) ; 3
(declare-const $t@92@01 $PSF<P>)
(declare-fun inv@93@01 ($Ref Int) $Ref)
(declare-fun img@94@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@91@01 $Ref) (a2@91@01 $Ref)) (!
  (=>
    (and (= a1@91@01 x@86@01) (= a2@91@01 x@86@01) (= a1@91@01 a2@91@01))
    (= a1@91@01 a2@91@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@91@01 $Ref)) (!
  (=>
    (= a@91@01 x@86@01)
    (and (= (inv@93@01 a@91@01 3) a@91@01) (img@94@01 a@91@01 3)))
  :pattern ((inv@93@01 a@91@01 3))
  :pattern ((img@94@01 a@91@01 3))
  :qid |quant-u-12|)))
(assert (forall ((x $Ref) (i Int)) (!
  (=>
    (and (img@94@01 x i) (= (inv@93@01 x i) x@86@01))
    (and (= (inv@93@01 x i) x) (= 3 i)))
  :pattern ((inv@93@01 x i))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall a: Ref ::true && a == y ==> acc(P(a, 10), write)) &&
;   (forall a: Ref ::true && a == z ==> acc(P(a, 3), write))
(declare-const $t@95@01 $Snap)
(assert (= $t@95@01 ($Snap.combine ($Snap.first $t@95@01) ($Snap.second $t@95@01))))
(declare-const a@96@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] true && a == y
(push) ; 4
; [then-branch: 31 | False | live]
; [else-branch: 31 | True | live]
(push) ; 5
; [then-branch: 31 | False]
(assert false)
(pop) ; 5
(push) ; 5
; [else-branch: 31 | True]
; [eval] a == y
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (= a@96@01 y@87@01))
(pop) ; 3
(declare-fun inv@97@01 ($Ref Int) $Ref)
(declare-fun img@98@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@96@01 $Ref) (a2@96@01 $Ref)) (!
  (=>
    (and (= a1@96@01 y@87@01) (= a2@96@01 y@87@01) (= a1@96@01 a2@96@01))
    (= a1@96@01 a2@96@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@96@01 $Ref)) (!
  (=>
    (= a@96@01 y@87@01)
    (and (= (inv@97@01 a@96@01 10) a@96@01) (img@98@01 a@96@01 10)))
  :pattern ((inv@97@01 a@96@01 10))
  :pattern ((img@98@01 a@96@01 10))
  :qid |quant-u-14|)))
(assert (forall ((x $Ref) (i Int)) (!
  (=>
    (and (img@98@01 x i) (= (inv@97@01 x i) y@87@01))
    (and (= (inv@97@01 x i) x) (= 10 i)))
  :pattern ((inv@97@01 x i))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (i Int)) (!
  (and
    (= a@96@01 a@91@01)
    (=
      (and (img@98@01 x i) (= (inv@97@01 x i) y@87@01))
      (and (img@94@01 x i) (= (inv@93@01 x i) x@86@01))))
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const a@99@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] true && a == z
(push) ; 4
; [then-branch: 32 | False | live]
; [else-branch: 32 | True | live]
(push) ; 5
; [then-branch: 32 | False]
(assert false)
(pop) ; 5
(push) ; 5
; [else-branch: 32 | True]
; [eval] a == z
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (= a@99@01 z@88@01))
(pop) ; 3
(declare-fun inv@100@01 ($Ref Int) $Ref)
(declare-fun img@101@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@99@01 $Ref) (a2@99@01 $Ref)) (!
  (=>
    (and (= a1@99@01 z@88@01) (= a2@99@01 z@88@01) (= a1@99@01 a2@99@01))
    (= a1@99@01 a2@99@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@99@01 $Ref)) (!
  (=>
    (= a@99@01 z@88@01)
    (and (= (inv@100@01 a@99@01 3) a@99@01) (img@101@01 a@99@01 3)))
  :pattern ((inv@100@01 a@99@01 3))
  :pattern ((img@101@01 a@99@01 3))
  :qid |quant-u-17|)))
(assert (forall ((x $Ref) (i Int)) (!
  (=>
    (and (img@101@01 x i) (= (inv@100@01 x i) z@88@01))
    (and (= (inv@100@01 x i) x) (= 3 i)))
  :pattern ((inv@100@01 x i))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (i Int)) (!
  (and
    (= a@99@01 a@96@01)
    (=
      (and (img@101@01 x i) (= (inv@100@01 x i) z@88@01))
      (and (img@98@01 x i) (= (inv@97@01 x i) y@87@01))))
  
  :qid |quant-u-18|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (i Int)) (!
  (and
    (= a@99@01 a@91@01)
    (=
      (and (img@101@01 x i) (= (inv@100@01 x i) z@88@01))
      (and (img@94@01 x i) (= (inv@93@01 x i) x@86@01))))
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [P(a, 3)] :: a == x || a == z)
; [eval] (forperm a: Ref [P(a, 3)] :: a == x || a == z)
(declare-const a@102@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 33 | PredicateTrigger(P, Second:($t@95@01), List(a@102@01, 3)) && img@101@01(a@102@01, 3) && inv@100@01(a@102@01, 3) == z@88@01 | live]
; [else-branch: 33 | !(PredicateTrigger(P, Second:($t@95@01), List(a@102@01, 3)) && img@101@01(a@102@01, 3) && inv@100@01(a@102@01, 3) == z@88@01) | live]
(push) ; 4
; [then-branch: 33 | PredicateTrigger(P, Second:($t@95@01), List(a@102@01, 3)) && img@101@01(a@102@01, 3) && inv@100@01(a@102@01, 3) == z@88@01]
(assert (and
  ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@102@01)
    ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@102@01)
    ($SortWrappers.IntTo$Snap 3)))
  (and (img@101@01 a@102@01 3) (= (inv@100@01 a@102@01 3) z@88@01))))
; [eval] a == x || a == z
; [eval] a == x
(push) ; 5
; [then-branch: 34 | a@102@01 == x@86@01 | live]
; [else-branch: 34 | a@102@01 != x@86@01 | live]
(push) ; 6
; [then-branch: 34 | a@102@01 == x@86@01]
(assert (= a@102@01 x@86@01))
(pop) ; 6
(push) ; 6
; [else-branch: 34 | a@102@01 != x@86@01]
(assert (not (= a@102@01 x@86@01)))
; [eval] a == z
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@102@01 x@86@01)) (= a@102@01 x@86@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | !(PredicateTrigger(P, Second:($t@95@01), List(a@102@01, 3)) && img@101@01(a@102@01, 3) && inv@100@01(a@102@01, 3) == z@88@01)]
(assert (not
  (and
    ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@101@01 a@102@01 3) (= (inv@100@01 a@102@01 3) z@88@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@101@01 a@102@01 3) (= (inv@100@01 a@102@01 3) z@88@01)))
  (and
    ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3)))
    (img@101@01 a@102@01 3)
    (= (inv@100@01 a@102@01 3) z@88@01)
    (or (not (= a@102@01 x@86@01)) (= a@102@01 x@86@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@102@01)
        ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@102@01)
        ($SortWrappers.IntTo$Snap 3)))
      (and (img@101@01 a@102@01 3) (= (inv@100@01 a@102@01 3) z@88@01))))
  (and
    ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@101@01 a@102@01 3) (= (inv@100@01 a@102@01 3) z@88@01)))))
(declare-const a@103@01 $Ref)
(push) ; 3
; [then-branch: 35 | PredicateTrigger(P, First:($t@95@01), List(a@103@01, 3)) && img@98@01(a@103@01, 3) && inv@97@01(a@103@01, 3) == y@87@01 | live]
; [else-branch: 35 | !(PredicateTrigger(P, First:($t@95@01), List(a@103@01, 3)) && img@98@01(a@103@01, 3) && inv@97@01(a@103@01, 3) == y@87@01) | live]
(push) ; 4
; [then-branch: 35 | PredicateTrigger(P, First:($t@95@01), List(a@103@01, 3)) && img@98@01(a@103@01, 3) && inv@97@01(a@103@01, 3) == y@87@01]
(assert (and
  ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@103@01)
    ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@103@01)
    ($SortWrappers.IntTo$Snap 3)))
  (and (img@98@01 a@103@01 3) (= (inv@97@01 a@103@01 3) y@87@01))))
; [eval] a == x || a == z
; [eval] a == x
(push) ; 5
; [then-branch: 36 | a@103@01 == x@86@01 | live]
; [else-branch: 36 | a@103@01 != x@86@01 | live]
(push) ; 6
; [then-branch: 36 | a@103@01 == x@86@01]
(assert (= a@103@01 x@86@01))
(pop) ; 6
(push) ; 6
; [else-branch: 36 | a@103@01 != x@86@01]
(assert (not (= a@103@01 x@86@01)))
; [eval] a == z
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@103@01 x@86@01)) (= a@103@01 x@86@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 35 | !(PredicateTrigger(P, First:($t@95@01), List(a@103@01, 3)) && img@98@01(a@103@01, 3) && inv@97@01(a@103@01, 3) == y@87@01)]
(assert (not
  (and
    ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@98@01 a@103@01 3) (= (inv@97@01 a@103@01 3) y@87@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@98@01 a@103@01 3) (= (inv@97@01 a@103@01 3) y@87@01)))
  (and
    ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3)))
    (img@98@01 a@103@01 3)
    (= (inv@97@01 a@103@01 3) y@87@01)
    (or (not (= a@103@01 x@86@01)) (= a@103@01 x@86@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@103@01)
        ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@103@01)
        ($SortWrappers.IntTo$Snap 3)))
      (and (img@98@01 a@103@01 3) (= (inv@97@01 a@103@01 3) y@87@01))))
  (and
    ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@98@01 a@103@01 3) (= (inv@97@01 a@103@01 3) y@87@01)))))
(declare-const a@104@01 $Ref)
(push) ; 3
; [then-branch: 37 | PredicateTrigger(P, $t@92@01, List(a@104@01, 3)) && img@94@01(a@104@01, 3) && inv@93@01(a@104@01, 3) == x@86@01 | live]
; [else-branch: 37 | !(PredicateTrigger(P, $t@92@01, List(a@104@01, 3)) && img@94@01(a@104@01, 3) && inv@93@01(a@104@01, 3) == x@86@01) | live]
(push) ; 4
; [then-branch: 37 | PredicateTrigger(P, $t@92@01, List(a@104@01, 3)) && img@94@01(a@104@01, 3) && inv@93@01(a@104@01, 3) == x@86@01]
(assert (and
  ($PSF.loc_P ($PSF.lookup_P $t@92@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@104@01)
    ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@104@01)
    ($SortWrappers.IntTo$Snap 3)))
  (and (img@94@01 a@104@01 3) (= (inv@93@01 a@104@01 3) x@86@01))))
; [eval] a == x || a == z
; [eval] a == x
(push) ; 5
; [then-branch: 38 | a@104@01 == x@86@01 | live]
; [else-branch: 38 | a@104@01 != x@86@01 | live]
(push) ; 6
; [then-branch: 38 | a@104@01 == x@86@01]
(assert (= a@104@01 x@86@01))
(pop) ; 6
(push) ; 6
; [else-branch: 38 | a@104@01 != x@86@01]
(assert (not (= a@104@01 x@86@01)))
; [eval] a == z
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= a@104@01 x@86@01)) (= a@104@01 x@86@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 37 | !(PredicateTrigger(P, $t@92@01, List(a@104@01, 3)) && img@94@01(a@104@01, 3) && inv@93@01(a@104@01, 3) == x@86@01)]
(assert (not
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@92@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@94@01 a@104@01 3) (= (inv@93@01 a@104@01 3) x@86@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@92@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@94@01 a@104@01 3) (= (inv@93@01 a@104@01 3) x@86@01)))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@92@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3)))
    (img@94@01 a@104@01 3)
    (= (inv@93@01 a@104@01 3) x@86@01)
    (or (not (= a@104@01 x@86@01)) (= a@104@01 x@86@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_P ($PSF.lookup_P $t@92@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@104@01)
        ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@104@01)
        ($SortWrappers.IntTo$Snap 3)))
      (and (img@94@01 a@104@01 3) (= (inv@93@01 a@104@01 3) x@86@01))))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@92@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3)))
    (and (img@94@01 a@104@01 3) (= (inv@93@01 a@104@01 3) x@86@01)))))
(push) ; 3
(assert (not (and
  (forall ((a@102@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@102@01)
          ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@102@01)
          ($SortWrappers.IntTo$Snap 3)))
        (and (img@101@01 a@102@01 3) (= (inv@100@01 a@102@01 3) z@88@01)))
      (or (= a@102@01 x@86@01) (= a@102@01 z@88@01)))
    :pattern (($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3))))
    :qid |quant-15|))
  (forall ((a@103@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@103@01)
          ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@103@01)
          ($SortWrappers.IntTo$Snap 3)))
        (and (img@98@01 a@103@01 3) (= (inv@97@01 a@103@01 3) y@87@01)))
      (or (= a@103@01 x@86@01) (= a@103@01 z@88@01)))
    :pattern (($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3))))
    :qid |quant-16|))
  (forall ((a@104@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@92@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@104@01)
          ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@104@01)
          ($SortWrappers.IntTo$Snap 3)))
        (and (img@94@01 a@104@01 3) (= (inv@93@01 a@104@01 3) x@86@01)))
      (or (= a@104@01 x@86@01) (= a@104@01 z@88@01)))
    :pattern (($PSF.lookup_P $t@92@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3))))
    :qid |quant-17|)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((a@102@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@102@01)
          ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@102@01)
          ($SortWrappers.IntTo$Snap 3)))
        (and (img@101@01 a@102@01 3) (= (inv@100@01 a@102@01 3) z@88@01)))
      (or (= a@102@01 x@86@01) (= a@102@01 z@88@01)))
    :pattern (($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@102@01)
      ($SortWrappers.IntTo$Snap 3))))
    :qid |quant-15|))
  (forall ((a@103@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@103@01)
          ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@103@01)
          ($SortWrappers.IntTo$Snap 3)))
        (and (img@98@01 a@103@01 3) (= (inv@97@01 a@103@01 3) y@87@01)))
      (or (= a@103@01 x@86@01) (= a@103@01 z@88@01)))
    :pattern (($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.first $t@95@01)) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@103@01)
      ($SortWrappers.IntTo$Snap 3))))
    :qid |quant-16|))
  (forall ((a@104@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@92@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@104@01)
          ($SortWrappers.IntTo$Snap 3))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@104@01)
          ($SortWrappers.IntTo$Snap 3)))
        (and (img@94@01 a@104@01 3) (= (inv@93@01 a@104@01 3) x@86@01)))
      (or (= a@104@01 x@86@01) (= a@104@01 z@88@01)))
    :pattern (($PSF.lookup_P $t@92@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@104@01)
      ($SortWrappers.IntTo$Snap 3))))
    :qid |quant-17|))))
(pop) ; 2
(pop) ; 1
; ---------- m6 ----------
(declare-const x@105@01 $Ref)
(declare-const y@106@01 $Ref)
(declare-const x@107@01 $Ref)
(declare-const y@108@01 $Ref)
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
; inhale (forall a: Ref ::a == x ==> acc(P(a, 10), write))
(declare-const a@109@01 $Ref)
(push) ; 3
; [eval] a == x
(assert (= a@109@01 x@107@01))
(pop) ; 3
(declare-const $t@110@01 $PSF<P>)
(declare-fun inv@111@01 ($Ref Int) $Ref)
(declare-fun img@112@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@109@01 $Ref) (a2@109@01 $Ref)) (!
  (=>
    (and (= a1@109@01 x@107@01) (= a2@109@01 x@107@01) (= a1@109@01 a2@109@01))
    (= a1@109@01 a2@109@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@109@01 $Ref)) (!
  (=>
    (= a@109@01 x@107@01)
    (and (= (inv@111@01 a@109@01 10) a@109@01) (img@112@01 a@109@01 10)))
  :pattern ((inv@111@01 a@109@01 10))
  :pattern ((img@112@01 a@109@01 10))
  :qid |quant-u-21|)))
(assert (forall ((x $Ref) (i Int)) (!
  (=>
    (and (img@112@01 x i) (= (inv@111@01 x i) x@107@01))
    (and (= (inv@111@01 x i) x) (= 10 i)))
  :pattern ((inv@111@01 x i))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall a: Ref ::a == y ==> acc(P(a, 5), write))
(declare-const a@113@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] a == y
(assert (= a@113@01 y@108@01))
(pop) ; 3
(declare-const $t@114@01 $PSF<P>)
(declare-fun inv@115@01 ($Ref Int) $Ref)
(declare-fun img@116@01 ($Ref Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@113@01 $Ref) (a2@113@01 $Ref)) (!
  (=>
    (and (= a1@113@01 y@108@01) (= a2@113@01 y@108@01) (= a1@113@01 a2@113@01))
    (= a1@113@01 a2@113@01))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@113@01 $Ref)) (!
  (=>
    (= a@113@01 y@108@01)
    (and (= (inv@115@01 a@113@01 5) a@113@01) (img@116@01 a@113@01 5)))
  :pattern ((inv@115@01 a@113@01 5))
  :pattern ((img@116@01 a@113@01 5))
  :qid |quant-u-23|)))
(assert (forall ((x $Ref) (i Int)) (!
  (=>
    (and (img@116@01 x i) (= (inv@115@01 x i) y@108@01))
    (and (= (inv@115@01 x i) x) (= 5 i)))
  :pattern ((inv@115@01 x i))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((x $Ref) (i Int)) (!
  (and
    (= a@113@01 a@109@01)
    (=
      (and (img@116@01 x i) (= (inv@115@01 x i) y@108@01))
      (and (img@112@01 x i) (= (inv@111@01 x i) x@107@01))))
  
  :qid |quant-u-24|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale x != y
(declare-const $t@117@01 $Snap)
(assert (= $t@117@01 $Snap.unit))
; [eval] x != y
(assert (not (= x@107@01 y@108@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forperm a: Ref [P(a, 10)] :: a == x)
; [eval] (forperm a: Ref [P(a, 10)] :: a == x)
(declare-const a@118@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 39 | PredicateTrigger(P, $t@114@01, List(a@118@01, 10)) && img@116@01(a@118@01, 10) && inv@115@01(a@118@01, 10) == y@108@01 | live]
; [else-branch: 39 | !(PredicateTrigger(P, $t@114@01, List(a@118@01, 10)) && img@116@01(a@118@01, 10) && inv@115@01(a@118@01, 10) == y@108@01) | live]
(push) ; 4
; [then-branch: 39 | PredicateTrigger(P, $t@114@01, List(a@118@01, 10)) && img@116@01(a@118@01, 10) && inv@115@01(a@118@01, 10) == y@108@01]
(assert (and
  ($PSF.loc_P ($PSF.lookup_P $t@114@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@118@01)
    ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@118@01)
    ($SortWrappers.IntTo$Snap 10)))
  (and (img@116@01 a@118@01 10) (= (inv@115@01 a@118@01 10) y@108@01))))
; [eval] a == x
(pop) ; 4
(push) ; 4
; [else-branch: 39 | !(PredicateTrigger(P, $t@114@01, List(a@118@01, 10)) && img@116@01(a@118@01, 10) && inv@115@01(a@118@01, 10) == y@108@01)]
(assert (not
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@114@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10)))
    (and (img@116@01 a@118@01 10) (= (inv@115@01 a@118@01 10) y@108@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@114@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10)))
    (and (img@116@01 a@118@01 10) (= (inv@115@01 a@118@01 10) y@108@01)))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@114@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10)))
    (img@116@01 a@118@01 10)
    (= (inv@115@01 a@118@01 10) y@108@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_P ($PSF.lookup_P $t@114@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@118@01)
        ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@118@01)
        ($SortWrappers.IntTo$Snap 10)))
      (and (img@116@01 a@118@01 10) (= (inv@115@01 a@118@01 10) y@108@01))))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@114@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10)))
    (and (img@116@01 a@118@01 10) (= (inv@115@01 a@118@01 10) y@108@01)))))
(declare-const a@119@01 $Ref)
(push) ; 3
; [then-branch: 40 | PredicateTrigger(P, $t@110@01, List(a@119@01, 10)) && img@112@01(a@119@01, 10) && inv@111@01(a@119@01, 10) == x@107@01 | live]
; [else-branch: 40 | !(PredicateTrigger(P, $t@110@01, List(a@119@01, 10)) && img@112@01(a@119@01, 10) && inv@111@01(a@119@01, 10) == x@107@01) | live]
(push) ; 4
; [then-branch: 40 | PredicateTrigger(P, $t@110@01, List(a@119@01, 10)) && img@112@01(a@119@01, 10) && inv@111@01(a@119@01, 10) == x@107@01]
(assert (and
  ($PSF.loc_P ($PSF.lookup_P $t@110@01 ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@119@01)
    ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
    ($SortWrappers.$RefTo$Snap a@119@01)
    ($SortWrappers.IntTo$Snap 10)))
  (and (img@112@01 a@119@01 10) (= (inv@111@01 a@119@01 10) x@107@01))))
; [eval] a == x
(pop) ; 4
(push) ; 4
; [else-branch: 40 | !(PredicateTrigger(P, $t@110@01, List(a@119@01, 10)) && img@112@01(a@119@01, 10) && inv@111@01(a@119@01, 10) == x@107@01)]
(assert (not
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@110@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10)))
    (and (img@112@01 a@119@01 10) (= (inv@111@01 a@119@01 10) x@107@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@110@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10)))
    (and (img@112@01 a@119@01 10) (= (inv@111@01 a@119@01 10) x@107@01)))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@110@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10)))
    (img@112@01 a@119@01 10)
    (= (inv@111@01 a@119@01 10) x@107@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($PSF.loc_P ($PSF.lookup_P $t@110@01 ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@119@01)
        ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
        ($SortWrappers.$RefTo$Snap a@119@01)
        ($SortWrappers.IntTo$Snap 10)))
      (and (img@112@01 a@119@01 10) (= (inv@111@01 a@119@01 10) x@107@01))))
  (and
    ($PSF.loc_P ($PSF.lookup_P $t@110@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10)))
    (and (img@112@01 a@119@01 10) (= (inv@111@01 a@119@01 10) x@107@01)))))
(push) ; 3
(assert (not (and
  (forall ((a@118@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@114@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@118@01)
          ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@118@01)
          ($SortWrappers.IntTo$Snap 10)))
        (and (img@116@01 a@118@01 10) (= (inv@115@01 a@118@01 10) y@108@01)))
      (= a@118@01 x@107@01))
    :pattern (($PSF.lookup_P $t@114@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10))))
    :qid |quant-18|))
  (forall ((a@119@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@110@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@119@01)
          ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@119@01)
          ($SortWrappers.IntTo$Snap 10)))
        (and (img@112@01 a@119@01 10) (= (inv@111@01 a@119@01 10) x@107@01)))
      (= a@119@01 x@107@01))
    :pattern (($PSF.lookup_P $t@110@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10))))
    :qid |quant-19|)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((a@118@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@114@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@118@01)
          ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@118@01)
          ($SortWrappers.IntTo$Snap 10)))
        (and (img@116@01 a@118@01 10) (= (inv@115@01 a@118@01 10) y@108@01)))
      (= a@118@01 x@107@01))
    :pattern (($PSF.lookup_P $t@114@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@118@01)
      ($SortWrappers.IntTo$Snap 10))))
    :qid |quant-18|))
  (forall ((a@119@01 $Ref)) (!
    (=>
      (and
        ($PSF.loc_P ($PSF.lookup_P $t@110@01 ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@119@01)
          ($SortWrappers.IntTo$Snap 10))) ($Snap.combine
          ($SortWrappers.$RefTo$Snap a@119@01)
          ($SortWrappers.IntTo$Snap 10)))
        (and (img@112@01 a@119@01 10) (= (inv@111@01 a@119@01 10) x@107@01)))
      (= a@119@01 x@107@01))
    :pattern (($PSF.lookup_P $t@110@01 ($Snap.combine
      ($SortWrappers.$RefTo$Snap a@119@01)
      ($SortWrappers.IntTo$Snap 10))))
    :qid |quant-19|))))
(pop) ; 2
(pop) ; 1
; ---------- m7 ----------
(declare-const xs@120@01 Set<$Ref>)
(declare-const ys@121@01 Set<$Ref>)
(declare-const zs@122@01 Set<$Ref>)
(declare-const xs@123@01 Set<$Ref>)
(declare-const ys@124@01 Set<$Ref>)
(declare-const zs@125@01 Set<$Ref>)
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
(declare-const $t@126@01 $MWSF)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall z: Ref ::(z in zs) ==> acc(z.f, write)) --*
;   (forall y: Ref ::(y in ys) ==> acc(y.f, write))
(declare-const $t@127@01 $MWSF)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert (forperm
;     a: Perm [(forall x: Ref ::(x in xs) ==> acc(x.f, a)) --*
;     (forall y: Ref ::(y in ys) ==> acc(y.f, a))] :: a == write)
; [eval] (forperm a: Perm [(forall x: Ref ::(x in xs) ==> acc(x.f, a)) --* (forall y: Ref ::(y in ys) ==> acc(y.f, a))] :: a == write)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (Set_equal xs@123@01 zs@125@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (Set_equal xs@123@01 zs@125@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | xs@123@01 === zs@125@01 | live]
; [else-branch: 41 | !(xs@123@01 === zs@125@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 41 | xs@123@01 === zs@125@01]
(assert (Set_equal xs@123@01 zs@125@01))
; [eval] a == write
(pop) ; 4
(push) ; 4
; [else-branch: 41 | !(xs@123@01 === zs@125@01)]
(assert (not (Set_equal xs@123@01 zs@125@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_equal xs@123@01 zs@125@01)) (Set_equal xs@123@01 zs@125@01)))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | True | live]
; [else-branch: 42 | False | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 42 | True]
; [eval] a == write
(pop) ; 4
(pop) ; 3
; Joined path conditions
(pop) ; 2
(pop) ; 1
