(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr
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
(declare-sort Set<Array_> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Array_ 0)
(declare-sort $FVF<elements> 0)
(declare-sort $PSF<P> 0)
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
(declare-fun $SortWrappers.Set<Array_>To$Snap (Set<Array_>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Array_> ($Snap) Set<Array_>)
(assert (forall ((x Set<Array_>)) (!
    (= x ($SortWrappers.$SnapToSet<Array_>($SortWrappers.Set<Array_>To$Snap x)))
    :pattern (($SortWrappers.Set<Array_>To$Snap x))
    :qid |$Snap.$SnapToSet<Array_>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Array_>To$Snap($SortWrappers.$SnapToSet<Array_> x)))
    :pattern (($SortWrappers.$SnapToSet<Array_> x))
    :qid |$Snap.Set<Array_>To$SnapToSet<Array_>|
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
(declare-fun $SortWrappers.Array_To$Snap (Array_) $Snap)
(declare-fun $SortWrappers.$SnapToArray_ ($Snap) Array_)
(assert (forall ((x Array_)) (!
    (= x ($SortWrappers.$SnapToArray_($SortWrappers.Array_To$Snap x)))
    :pattern (($SortWrappers.Array_To$Snap x))
    :qid |$Snap.$SnapToArray_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Array_To$Snap($SortWrappers.$SnapToArray_ x)))
    :pattern (($SortWrappers.$SnapToArray_ x))
    :qid |$Snap.Array_To$SnapToArray_|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<elements>To$Snap ($FVF<elements>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<elements> ($Snap) $FVF<elements>)
(assert (forall ((x $FVF<elements>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<elements>($SortWrappers.$FVF<elements>To$Snap x)))
    :pattern (($SortWrappers.$FVF<elements>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<elements>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<elements>To$Snap($SortWrappers.$SnapTo$FVF<elements> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<elements> x))
    :qid |$Snap.$FVF<elements>To$SnapTo$FVF<elements>|
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
; ////////// Symbols
(declare-fun Set_card (Set<Array_>) Int)
(declare-const Set_empty Set<Array_>)
(declare-fun Set_in (Array_ Set<Array_>) Bool)
(declare-fun Set_singleton (Array_) Set<Array_>)
(declare-fun Set_unionone (Set<Array_> Array_) Set<Array_>)
(declare-fun Set_union (Set<Array_> Set<Array_>) Set<Array_>)
(declare-fun Set_intersection (Set<Array_> Set<Array_>) Set<Array_>)
(declare-fun Set_difference (Set<Array_> Set<Array_>) Set<Array_>)
(declare-fun Set_subset (Set<Array_> Set<Array_>) Bool)
(declare-fun Set_equal (Set<Array_> Set<Array_>) Bool)
(declare-fun Set_skolem_diff (Set<Array_> Set<Array_>) Array_)
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
(declare-fun loc<Ref> (Array_ Int) $Ref)
(declare-fun len<Int> (Array_) Int)
(declare-fun first<Array> ($Ref) Array_)
(declare-fun second<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [elements: Array]
(declare-fun $FVF.domain_elements ($FVF<elements>) Set<$Ref>)
(declare-fun $FVF.lookup_elements ($FVF<elements> $Ref) Array_)
(declare-fun $FVF.after_elements ($FVF<elements> $FVF<elements>) Bool)
(declare-fun $FVF.loc_elements (Array_ $Ref) Bool)
(declare-fun $FVF.perm_elements ($FPM $Ref) $Perm)
(declare-const $fvfTOP_elements $FVF<elements>)
; /predicate_snap_functions_declarations.smt2 [P: Snap]
(declare-fun $PSF.domain_P ($PSF<P>) Set<$Snap>)
(declare-fun $PSF.lookup_P ($PSF<P> $Snap) $Snap)
(declare-fun $PSF.after_P ($PSF<P> $PSF<P>) Bool)
(declare-fun $PSF.loc_P ($Snap $Snap) Bool)
(declare-fun $PSF.perm_P ($PPM $Snap) $Perm)
(declare-const $psfTOP_P $PSF<P>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun foo ($Snap $Ref) Bool)
(declare-fun foo%limited ($Snap $Ref) Bool)
(declare-fun foo%stateless ($Ref) Bool)
(declare-fun foo%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Set<Array_>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Array_)) (!
  (not (Set_in o (as Set_empty  Set<Array_>)))
  :pattern ((Set_in o (as Set_empty  Set<Array_>)))
  )))
(assert (forall ((s Set<Array_>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Array_>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Array_))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Array_)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Array_) (o Array_)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Array_)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Array_>) (x Array_) (o Array_)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Array_>) (x Array_)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Array_>) (x Array_) (y Array_)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Array_>) (x Array_)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Array_>) (x Array_)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>) (o Array_)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>) (y Array_)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>) (y Array_)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>) (o Array_)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>) (o Array_)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>) (y Array_)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
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
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
  (=
    (Set_subset a b)
    (forall ((o Array_)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
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
(assert (forall ((a Set<Array_>) (b Set<Array_>)) (!
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
(assert (forall ((a Array_) (i Int)) (!
  (and (= (first<Array> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.all_diff|)))
(assert (forall ((a Array_)) (!
  (>= (len<Int> a) 0)
  :pattern ((len<Int> a))
  :qid |prog.length_non_neg|)))
; /field_value_functions_axioms.smt2 [elements: Array]
(assert (forall ((vs $FVF<elements>) (ws $FVF<elements>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_elements vs) ($FVF.domain_elements ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_elements vs))
            (= ($FVF.lookup_elements vs x) ($FVF.lookup_elements ws x)))
          :pattern (($FVF.lookup_elements vs x) ($FVF.lookup_elements ws x))
          :qid |qp.$FVF<elements>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<elements>To$Snap vs)
              ($SortWrappers.$FVF<elements>To$Snap ws)
              )
    :qid |qp.$FVF<elements>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_elements pm r))
    :pattern (($FVF.perm_elements pm r)))))
(assert (forall ((r $Ref) (f Array_)) (!
    (= ($FVF.loc_elements f r) true)
    :pattern (($FVF.loc_elements f r)))))
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
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@2@00 () $Perm)
(declare-fun sm@3@00 ($Snap $Ref) $PSF<P>)
(declare-fun $k@4@00 () $Perm)
(declare-fun $k@5@00 () $Perm)
(declare-fun $k@13@00 () $Perm)
(declare-fun inv@10@00 ($Snap $Ref $Ref) Int)
(declare-fun img@11@00 ($Snap $Ref $Ref) Bool)
(declare-fun sm@6@00 ($Snap $Ref) $PSF<P>)
(declare-fun sm@14@00 ($Snap $Ref) $PSF<P>)
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (= (foo%limited s@$ self@0@00) (foo s@$ self@0@00))
  :pattern ((foo s@$ self@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (foo%stateless self@0@00)
  :pattern ((foo%limited s@$ self@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (and
    (forall ((x@9@00 Int)) (!
      (=>
        (and
          (and
            (<= 0 x@9@00)
            (<
              x@9@00
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
          (< $Perm.No $k@4@00))
        (and
          (=
            (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@9@00))
            x@9@00)
          (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@9@00))))
      :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@9@00))
      :qid |quant-u-6|))
    (forall ((self $Ref)) (!
      (=>
        (and
          (img@11@00 s@$ self@0@00 self)
          (and
            (and
              (<= 0 (inv@10@00 s@$ self@0@00 self))
              (<
                (inv@10@00 s@$ self@0@00 self)
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
            (< $Perm.No $k@4@00)))
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) (inv@10@00 s@$ self@0@00 self))
          self))
      :pattern ((inv@10@00 s@$ self@0@00 self))
      :qid |P-fctOfInv|))
    (=
      ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))
      s@$)
    (forall ((s@7@00 $Snap)) (!
      (=>
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@7@00) self@0@00)
          (< $Perm.No $k@2@00)
          false)
        (and
          (not (= s@7@00 $Snap.unit))
          (=
            ($PSF.lookup_P (sm@6@00 s@$ self@0@00) s@7@00)
            ($PSF.lookup_P (sm@3@00 s@$ self@0@00) s@7@00))))
      :pattern (($PSF.lookup_P (sm@6@00 s@$ self@0@00) s@7@00))
      :pattern (($PSF.lookup_P (sm@3@00 s@$ self@0@00) s@7@00))
      :qid |qp.psmValDef1|))
    (forall ((s@15@00 $Snap)) (!
      (=>
        (ite
          (= ($SortWrappers.$SnapTo$Ref s@15@00) self@0@00)
          (<
            $Perm.No
            (-
              $k@2@00
              (ite
                (= ($SortWrappers.$SnapTo$Ref s@15@00) self@0@00)
                ($Perm.min
                  (ite
                    (= ($SortWrappers.$SnapTo$Ref s@15@00) self@0@00)
                    $k@2@00
                    $Perm.No)
                  $k@5@00)
                $Perm.No)))
          false)
        (and
          (not (= s@15@00 $Snap.unit))
          (=
            ($PSF.lookup_P (sm@14@00 s@$ self@0@00) s@15@00)
            ($PSF.lookup_P (sm@3@00 s@$ self@0@00) s@15@00))))
      :pattern (($PSF.lookup_P (sm@14@00 s@$ self@0@00) s@15@00))
      :pattern (($PSF.lookup_P (sm@3@00 s@$ self@0@00) s@15@00))
      :qid |qp.psmValDef3|))
    (forall ((s@15@00 $Snap)) (!
      (=>
        (ite
          (and
            (img@11@00 s@$ self@0@00 ($SortWrappers.$SnapTo$Ref s@15@00))
            (and
              (<=
                0
                (inv@10@00 s@$ self@0@00 ($SortWrappers.$SnapTo$Ref s@15@00)))
              (<
                (inv@10@00 s@$ self@0@00 ($SortWrappers.$SnapTo$Ref s@15@00))
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
          (< $Perm.No $k@4@00)
          false)
        (and
          (not (= s@15@00 $Snap.unit))
          (=
            ($PSF.lookup_P (sm@14@00 s@$ self@0@00) s@15@00)
            ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))) s@15@00))))
      :pattern (($PSF.lookup_P (sm@14@00 s@$ self@0@00) s@15@00))
      :pattern (($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))) s@15@00))
      :qid |qp.psmValDef4|))
    ($Perm.isReadVar $k@2@00)
    ($Perm.isReadVar $k@4@00)
    ($Perm.isReadVar $k@5@00)
    ($Perm.isReadVar $k@13@00)
    (=>
      (foo%precondition s@$ self@0@00)
      (=
        (foo s@$ self@0@00)
        (forall ((i Int)) (!
          (=>
            (and
              (<= 0 i)
              (<
                i
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
            (foo%limited ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i)))
          :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i))
          )))))
  :pattern ((foo s@$ self@0@00))
  :pattern ((foo%stateless self@0@00) (P%trigger ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)) self@0@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (=>
    (foo%precondition s@$ self@0@00)
    (forall ((i Int)) (!
      (=>
        (and
          (<= 0 i)
          (<
            i
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
        (foo%precondition ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i)))
      :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i))
      )))
  :pattern ((foo s@$ self@0@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
