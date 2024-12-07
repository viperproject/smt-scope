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
; ---------- FUNCTION foo----------
(declare-fun self@0@00 () $Ref)
(declare-fun result@1@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const $k@2@00 $Perm)
(assert ($Perm.isReadVar $k@2@00))
(declare-fun sm@3@00 ($Snap $Ref) $PSF<P>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))
  s@$))
(assert (<= $Perm.No $k@2@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (= (foo%limited s@$ self@0@00) (foo s@$ self@0@00))
  :pattern ((foo s@$ self@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (self@0@00 $Ref)) (!
  (foo%stateless self@0@00)
  :pattern ((foo%limited s@$ self@0@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (=
  ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))
  s@$))
(assert (<= $Perm.No $k@2@00))
(assert ($Perm.isReadVar $k@2@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] (unfolding acc(P(self), wildcard) in (forall i: Int :: { loc(self.elements, i) } 0 <= i && i < len(self.elements) ==> foo(loc(self.elements, i))))
(declare-const $k@4@00 $Perm)
(assert ($Perm.isReadVar $k@4@00))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(declare-const $k@5@00 $Perm)
(assert ($Perm.isReadVar $k@5@00))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@5@00
(assert (=> (not (= $k@2@00 $Perm.No)) (< $k@5@00 $k@2@00)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=>
    (= self self@0@00)
    (=
      (-
        $k@5@00
        (ite
          (= self self@0@00)
          ($Perm.min (ite (= self self@0@00) $k@2@00 $Perm.No) $k@5@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@6@00 ($Snap $Ref) $PSF<P>)
(declare-const s@7@00 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (< $Perm.No $k@2@00)
  (and
    (not (= ($SortWrappers.$RefTo$Snap self@0@00) $Snap.unit))
    (=
      ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))
      ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))
(assert (P%trigger ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)) self@0@00))
(assert (=
  ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))
    ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))
(assert (=
  ($Snap.first ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))
  $Snap.unit))
; [eval] self != null
(assert (not (= self@0@00 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))
    ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))
(assert (<= $Perm.No $k@4@00))
(assert (<= $k@4@00 $Perm.Write))
(assert (=> (< $Perm.No $k@4@00) (not (= self@0@00 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))
    ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))
  $Snap.unit))
; [eval] (forall x: Int :: { loc(self.elements, x) } 0 <= x && x < len(self.elements) ==> loc(self.elements, x) != null)
(declare-const x@8@00 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= x && x < len(self.elements) ==> loc(self.elements, x) != null
; [eval] 0 <= x && x < len(self.elements)
; [eval] 0 <= x
(push) ; 4
; [then-branch: 0 | !(0 <= x@8@00) | live]
; [else-branch: 0 | 0 <= x@8@00 | live]
(push) ; 5
; [then-branch: 0 | !(0 <= x@8@00)]
(assert (not (<= 0 x@8@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | 0 <= x@8@00]
(assert (<= 0 x@8@00))
; [eval] x < len(self.elements)
; [eval] len(self.elements)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@8@00) (not (<= 0 x@8@00))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | 0 <= x@8@00 && x@8@00 < len[Int](First:(Second:(PredicateLookup(P, sm@6@00(s@$, self@0@00), List(self@0@00))))) | live]
; [else-branch: 1 | !(0 <= x@8@00 && x@8@00 < len[Int](First:(Second:(PredicateLookup(P, sm@6@00(s@$, self@0@00), List(self@0@00)))))) | live]
(push) ; 5
; [then-branch: 1 | 0 <= x@8@00 && x@8@00 < len[Int](First:(Second:(PredicateLookup(P, sm@6@00(s@$, self@0@00), List(self@0@00)))))]
(assert (and
  (<= 0 x@8@00)
  (<
    x@8@00
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
; [eval] loc(self.elements, x) != null
; [eval] loc(self.elements, x)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | !(0 <= x@8@00 && x@8@00 < len[Int](First:(Second:(PredicateLookup(P, sm@6@00(s@$, self@0@00), List(self@0@00))))))]
(assert (not
  (and
    (<= 0 x@8@00)
    (<
      x@8@00
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 x@8@00)
      (<
        x@8@00
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
  (and
    (<= 0 x@8@00)
    (<
      x@8@00
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@8@00 Int)) (!
  (and
    (or (<= 0 x@8@00) (not (<= 0 x@8@00)))
    (or
      (not
        (and
          (<= 0 x@8@00)
          (<
            x@8@00
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
      (and
        (<= 0 x@8@00)
        (<
          x@8@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@8@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@29@9@32@44-aux|)))
(assert (forall ((x@8@00 Int)) (!
  (=>
    (and
      (<= 0 x@8@00)
      (<
        x@8@00
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@8@00)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@8@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@29@9@32@44|)))
(declare-const x@9@00 Int)
(push) ; 3
; [eval] 0 <= x && x < len(self.elements)
; [eval] 0 <= x
(push) ; 4
; [then-branch: 2 | !(0 <= x@9@00) | live]
; [else-branch: 2 | 0 <= x@9@00 | live]
(push) ; 5
; [then-branch: 2 | !(0 <= x@9@00)]
(assert (not (<= 0 x@9@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | 0 <= x@9@00]
(assert (<= 0 x@9@00))
; [eval] x < len(self.elements)
; [eval] len(self.elements)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@9@00) (not (<= 0 x@9@00))))
(assert (and
  (<= 0 x@9@00)
  (<
    x@9@00
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
; [eval] loc(self.elements, x)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@10@00 ($Snap $Ref $Ref) Int)
(declare-fun img@11@00 ($Snap $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@9@00 Int)) (!
  (=>
    (and
      (<= 0 x@9@00)
      (<
        x@9@00
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
    (or (<= 0 x@9@00) (not (<= 0 x@9@00))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@9@00))
  :qid |P-aux|)))
; Check receiver injectivity
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((x1@9@00 Int) (x2@9@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 x1@9@00)
        (<
          x1@9@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
      (and
        (<= 0 x2@9@00)
        (<
          x2@9@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x1@9@00)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x2@9@00)))
    (= x1@9@00 x2@9@00))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@9@00 Int)) (!
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
  :qid |quant-u-6|)))
(assert (forall ((self $Ref)) (!
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
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((x@9@00 Int)) (!
  (<= $Perm.No $k@4@00)
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@9@00))
  :qid |P-permAtLeastZero|)))
; [eval] (forall i: Int :: { loc(self.elements, i) } 0 <= i && i < len(self.elements) ==> foo(loc(self.elements, i)))
(declare-const i@12@00 Int)
(push) ; 3
; [eval] 0 <= i && i < len(self.elements) ==> foo(loc(self.elements, i))
; [eval] 0 <= i && i < len(self.elements)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 3 | !(0 <= i@12@00) | live]
; [else-branch: 3 | 0 <= i@12@00 | live]
(push) ; 5
; [then-branch: 3 | !(0 <= i@12@00)]
(assert (not (<= 0 i@12@00)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | 0 <= i@12@00]
(assert (<= 0 i@12@00))
; [eval] i < len(self.elements)
; [eval] len(self.elements)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@12@00) (not (<= 0 i@12@00))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | 0 <= i@12@00 && i@12@00 < len[Int](First:(Second:(PredicateLookup(P, sm@6@00(s@$, self@0@00), List(self@0@00))))) | live]
; [else-branch: 4 | !(0 <= i@12@00 && i@12@00 < len[Int](First:(Second:(PredicateLookup(P, sm@6@00(s@$, self@0@00), List(self@0@00)))))) | live]
(push) ; 5
; [then-branch: 4 | 0 <= i@12@00 && i@12@00 < len[Int](First:(Second:(PredicateLookup(P, sm@6@00(s@$, self@0@00), List(self@0@00)))))]
(assert (and
  (<= 0 i@12@00)
  (<
    i@12@00
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
; [eval] foo(loc(self.elements, i))
; [eval] loc(self.elements, i)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@4@00)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  self@0@00
  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Constrain original permissions $k@13@00
(assert (=>
  (not
    (=
      (ite
        (and
          (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          (and
            (<=
              0
              (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
            (<
              (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
        $k@4@00
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
      (and
        (<=
          0
          (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
        (<
          (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
    (<
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
        $k@13@00
        $Perm.No)
      $k@4@00)
    (<
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
        $k@13@00
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((self $Ref)) (!
  (=>
    (=
      self
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
    (=
      (-
        $k@13@00
        (ite
          (=
            self
            (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          ($Perm.min
            (ite
              (and
                (img@11@00 s@$ self@0@00 self)
                (and
                  (<= 0 (inv@10@00 s@$ self@0@00 self))
                  (<
                    (inv@10@00 s@$ self@0@00 self)
                    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
              $k@4@00
              $Perm.No)
            $k@13@00)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@14@00 ($Snap $Ref) $PSF<P>)
(declare-const s@15@00 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
      self@0@00)
    (<
      $Perm.No
      (-
        $k@2@00
        (ite
          (=
            (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
            self@0@00)
          ($Perm.min
            (ite
              (=
                (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                self@0@00)
              $k@2@00
              $Perm.No)
            $k@5@00)
          $Perm.No)))
    false)
  (and
    (not
      (=
        ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
        $Snap.unit))
    (=
      ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
      ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))))))
(assert (=>
  (ite
    (and
      (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
      (and
        (<=
          0
          (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
        (<
          (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
    (< $Perm.No $k@4@00)
    false)
  (and
    (not
      (=
        ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
        $Snap.unit))
    (=
      ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
      ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))))))
(assert (foo%precondition ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
(pop) ; 6
; Joined path conditions
(assert ($Perm.isReadVar $k@13@00))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
            (and
              (<=
                0
                (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
              (<
                (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
          $k@4@00
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
        (and
          (<=
            0
            (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
          (<
            (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
      (<
        (ite
          (=
            (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
            (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          $k@13@00
          $Perm.No)
        $k@4@00)
      (<
        (ite
          (=
            (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
            (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          $k@13@00
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
        self@0@00)
      (<
        $Perm.No
        (-
          $k@2@00
          (ite
            (=
              (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
              self@0@00)
            ($Perm.min
              (ite
                (=
                  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                  self@0@00)
                $k@2@00
                $Perm.No)
              $k@5@00)
            $Perm.No)))
      false)
    (and
      (not
        (=
          ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          $Snap.unit))
      (=
        ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
        ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))))
  (=>
    (ite
      (and
        (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
        (and
          (<=
            0
            (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
          (<
            (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
      (< $Perm.No $k@4@00)
      false)
    (and
      (not
        (=
          ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          $Snap.unit))
      (=
        ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
        ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))))
  (foo%precondition ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 4 | !(0 <= i@12@00 && i@12@00 < len[Int](First:(Second:(PredicateLookup(P, sm@6@00(s@$, self@0@00), List(self@0@00))))))]
(assert (not
  (and
    (<= 0 i@12@00)
    (<
      i@12@00
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert ($Perm.isReadVar $k@13@00))
(assert (=>
  (and
    (<= 0 i@12@00)
    (<
      i@12@00
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
  (and
    (<= 0 i@12@00)
    (<
      i@12@00
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))
    (=>
      (not
        (=
          (ite
            (and
              (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
              (and
                (<=
                  0
                  (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                (<
                  (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
            $k@4@00
            $Perm.No)
          $Perm.No))
      (ite
        (and
          (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          (and
            (<=
              0
              (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
            (<
              (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
        (<
          (ite
            (=
              (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
              (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
            $k@13@00
            $Perm.No)
          $k@4@00)
        (<
          (ite
            (=
              (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
              (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
            $k@13@00
            $Perm.No)
          $Perm.No)))
    (=>
      (ite
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
          self@0@00)
        (<
          $Perm.No
          (-
            $k@2@00
            (ite
              (=
                (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                self@0@00)
              ($Perm.min
                (ite
                  (=
                    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                    self@0@00)
                  $k@2@00
                  $Perm.No)
                $k@5@00)
              $Perm.No)))
        false)
      (and
        (not
          (=
            ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
            $Snap.unit))
        (=
          ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
          ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))))
    (=>
      (ite
        (and
          (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
          (and
            (<=
              0
              (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
            (<
              (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
        (< $Perm.No $k@4@00)
        false)
      (and
        (not
          (=
            ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
            $Snap.unit))
        (=
          ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
          ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))))
    (foo%precondition ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@12@00)
      (<
        i@12@00
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
  (and
    (<= 0 i@12@00)
    (<
      i@12@00
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert ($Perm.isReadVar $k@13@00))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@12@00 Int)) (!
  (and
    (or (<= 0 i@12@00) (not (<= 0 i@12@00)))
    (=>
      (and
        (<= 0 i@12@00)
        (<
          i@12@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
      (and
        (<= 0 i@12@00)
        (<
          i@12@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))
        (=>
          (not
            (=
              (ite
                (and
                  (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                  (and
                    (<=
                      0
                      (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                    (<
                      (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
                $k@4@00
                $Perm.No)
              $Perm.No))
          (ite
            (and
              (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
              (and
                (<=
                  0
                  (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                (<
                  (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
            (<
              (ite
                (=
                  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                $k@13@00
                $Perm.No)
              $k@4@00)
            (<
              (ite
                (=
                  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                  (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                $k@13@00
                $Perm.No)
              $Perm.No)))
        (=>
          (ite
            (=
              (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
              self@0@00)
            (<
              $Perm.No
              (-
                $k@2@00
                (ite
                  (=
                    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                    self@0@00)
                  ($Perm.min
                    (ite
                      (=
                        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                        self@0@00)
                      $k@2@00
                      $Perm.No)
                    $k@5@00)
                  $Perm.No)))
            false)
          (and
            (not
              (=
                ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                $Snap.unit))
            (=
              ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
              ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))))
        (=>
          (ite
            (and
              (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
              (and
                (<=
                  0
                  (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                (<
                  (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                  (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
            (< $Perm.No $k@4@00)
            false)
          (and
            (not
              (=
                ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                $Snap.unit))
            (=
              ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
              ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))))
        (foo%precondition ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))
    (or
      (not
        (and
          (<= 0 i@12@00)
          (<
            i@12@00
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
      (and
        (<= 0 i@12@00)
        (<
          i@12@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@40@9@42@43-aux|)))
(pop) ; 2
; Joined path conditions
(assert ($Perm.isReadVar $k@5@00))
(assert (forall ((self $Ref)) (!
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
  :qid |P-fctOfInv|)))
(assert ($Perm.isReadVar $k@13@00))
(assert (and
  (=> (not (= $k@2@00 $Perm.No)) (< $k@5@00 $k@2@00))
  (=>
    (< $Perm.No $k@2@00)
    (and
      (not (= ($SortWrappers.$RefTo$Snap self@0@00) $Snap.unit))
      (=
        ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))
        ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))
  (P%trigger ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)) self@0@00)
  (=
    ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))
      ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))
  (=
    ($Snap.first ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))
    $Snap.unit)
  (not (= self@0@00 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))
    ($Snap.combine
      ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))
      ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))
  (<= $Perm.No $k@4@00)
  (<= $k@4@00 $Perm.Write)
  (=> (< $Perm.No $k@4@00) (not (= self@0@00 $Ref.null)))
  (=
    ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))
      ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))
  (=
    ($Snap.first ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))
    $Snap.unit)
  (forall ((x@8@00 Int)) (!
    (and
      (or (<= 0 x@8@00) (not (<= 0 x@8@00)))
      (or
        (not
          (and
            (<= 0 x@8@00)
            (<
              x@8@00
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
        (and
          (<= 0 x@8@00)
          (<
            x@8@00
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))))
    :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@8@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@29@9@32@44-aux|))
  (forall ((x@8@00 Int)) (!
    (=>
      (and
        (<= 0 x@8@00)
        (<
          x@8@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
      (not
        (=
          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@8@00)
          $Ref.null)))
    :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@8@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@29@9@32@44|))
  (forall ((x@9@00 Int)) (!
    (=>
      (and
        (<= 0 x@9@00)
        (<
          x@9@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
      (or (<= 0 x@9@00) (not (<= 0 x@9@00))))
    :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@9@00))
    :qid |P-aux|))))
(assert (and
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
  (forall ((x@9@00 Int)) (!
    (<= $Perm.No $k@4@00)
    :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) x@9@00))
    :qid |P-permAtLeastZero|))
  (forall ((i@12@00 Int)) (!
    (and
      (or (<= 0 i@12@00) (not (<= 0 i@12@00)))
      (=>
        (and
          (<= 0 i@12@00)
          (<
            i@12@00
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
        (and
          (<= 0 i@12@00)
          (<
            i@12@00
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))
          (=>
            (not
              (=
                (ite
                  (and
                    (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                    (and
                      (<=
                        0
                        (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                      (<
                        (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
                  $k@4@00
                  $Perm.No)
                $Perm.No))
            (ite
              (and
                (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                (and
                  (<=
                    0
                    (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                  (<
                    (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
              (<
                (ite
                  (=
                    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                  $k@13@00
                  $Perm.No)
                $k@4@00)
              (<
                (ite
                  (=
                    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                    (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                  $k@13@00
                  $Perm.No)
                $Perm.No)))
          (=>
            (ite
              (=
                (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                self@0@00)
              (<
                $Perm.No
                (-
                  $k@2@00
                  (ite
                    (=
                      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                      self@0@00)
                    ($Perm.min
                      (ite
                        (=
                          (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)
                          self@0@00)
                        $k@2@00
                        $Perm.No)
                      $k@5@00)
                    $Perm.No)))
              false)
            (and
              (not
                (=
                  ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                  $Snap.unit))
              (=
                ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                ($PSF.lookup_P (sm@3@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))))
          (=>
            (ite
              (and
                (img@11@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                (and
                  (<=
                    0
                    (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                  (<
                    (inv@10@00 s@$ self@0@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
              (< $Perm.No $k@4@00)
              false)
            (and
              (not
                (=
                  ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
                  $Snap.unit))
              (=
                ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
                ($PSF.lookup_P ($SortWrappers.$SnapTo$PSF<P> ($Snap.second ($Snap.second ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))))
          (foo%precondition ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))))
      (or
        (not
          (and
            (<= 0 i@12@00)
            (<
              i@12@00
              (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00)))))))))
        (and
          (<= 0 i@12@00)
          (<
            i@12@00
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))))
    :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@40@9@42@43-aux|))))
(assert (=
  result@1@00
  (forall ((i@12@00 Int)) (!
    (=>
      (and
        (<= 0 i@12@00)
        (<
          i@12@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))))))
      (foo ($PSF.lookup_P (sm@14@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))) (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00)))
    :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second ($PSF.lookup_P (sm@6@00 s@$ self@0@00) ($SortWrappers.$RefTo$Snap self@0@00))))) i@12@00))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@40@9@42@43|))))
(pop) ; 1
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
; ---------- P ----------
(declare-const self@16@00 $Ref)
(push) ; 1
(declare-const $t@17@00 $Snap)
(assert (= $t@17@00 ($Snap.combine ($Snap.first $t@17@00) ($Snap.second $t@17@00))))
(assert (= ($Snap.first $t@17@00) $Snap.unit))
; [eval] self != null
(assert (not (= self@16@00 $Ref.null)))
(assert (=
  ($Snap.second $t@17@00)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@00))
    ($Snap.second ($Snap.second $t@17@00)))))
(assert (=
  ($Snap.second ($Snap.second $t@17@00))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@00)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@00))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@17@00))) $Snap.unit))
; [eval] (forall x: Int :: { loc(self.elements, x) } 0 <= x && x < len(self.elements) ==> loc(self.elements, x) != null)
(declare-const x@18@00 Int)
(push) ; 2
; [eval] 0 <= x && x < len(self.elements) ==> loc(self.elements, x) != null
; [eval] 0 <= x && x < len(self.elements)
; [eval] 0 <= x
(push) ; 3
; [then-branch: 5 | !(0 <= x@18@00) | live]
; [else-branch: 5 | 0 <= x@18@00 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= x@18@00)]
(assert (not (<= 0 x@18@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= x@18@00]
(assert (<= 0 x@18@00))
; [eval] x < len(self.elements)
; [eval] len(self.elements)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@18@00) (not (<= 0 x@18@00))))
(push) ; 3
; [then-branch: 6 | 0 <= x@18@00 && x@18@00 < len[Int](First:(Second:($t@17@00))) | live]
; [else-branch: 6 | !(0 <= x@18@00 && x@18@00 < len[Int](First:(Second:($t@17@00)))) | live]
(push) ; 4
; [then-branch: 6 | 0 <= x@18@00 && x@18@00 < len[Int](First:(Second:($t@17@00)))]
(assert (and
  (<= 0 x@18@00)
  (<
    x@18@00
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00)))))))
; [eval] loc(self.elements, x) != null
; [eval] loc(self.elements, x)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(0 <= x@18@00 && x@18@00 < len[Int](First:(Second:($t@17@00))))]
(assert (not
  (and
    (<= 0 x@18@00)
    (<
      x@18@00
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 x@18@00)
      (<
        x@18@00
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00)))))))
  (and
    (<= 0 x@18@00)
    (<
      x@18@00
      (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@18@00 Int)) (!
  (and
    (or (<= 0 x@18@00) (not (<= 0 x@18@00)))
    (or
      (not
        (and
          (<= 0 x@18@00)
          (<
            x@18@00
            (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00)))))))
      (and
        (<= 0 x@18@00)
        (<
          x@18@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))))))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x@18@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@29@9@32@44-aux|)))
(assert (forall ((x@18@00 Int)) (!
  (=>
    (and
      (<= 0 x@18@00)
      (<
        x@18@00
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))))))
    (not
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x@18@00)
        $Ref.null)))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x@18@00))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0378a.vpr@29@9@32@44|)))
(declare-const x@19@00 Int)
(push) ; 2
; [eval] 0 <= x && x < len(self.elements)
; [eval] 0 <= x
(push) ; 3
; [then-branch: 7 | !(0 <= x@19@00) | live]
; [else-branch: 7 | 0 <= x@19@00 | live]
(push) ; 4
; [then-branch: 7 | !(0 <= x@19@00)]
(assert (not (<= 0 x@19@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | 0 <= x@19@00]
(assert (<= 0 x@19@00))
; [eval] x < len(self.elements)
; [eval] len(self.elements)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 x@19@00) (not (<= 0 x@19@00))))
(assert (and
  (<= 0 x@19@00)
  (<
    x@19@00
    (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00)))))))
; [eval] loc(self.elements, x)
(pop) ; 2
(declare-fun inv@20@00 ($Ref) Int)
(declare-fun img@21@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((x@19@00 Int)) (!
  (=>
    (and
      (<= 0 x@19@00)
      (<
        x@19@00
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))))))
    (or (<= 0 x@19@00) (not (<= 0 x@19@00))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x@19@00))
  :qid |P-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@19@00 Int) (x2@19@00 Int)) (!
  (=>
    (and
      (and
        (<= 0 x1@19@00)
        (<
          x1@19@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))))))
      (and
        (<= 0 x2@19@00)
        (<
          x2@19@00
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))))))
      (=
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x1@19@00)
        (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x2@19@00)))
    (= x1@19@00 x2@19@00))
  
  :qid |P-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@19@00 Int)) (!
  (=>
    (and
      (<= 0 x@19@00)
      (<
        x@19@00
        (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))))))
    (and
      (=
        (inv@20@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x@19@00))
        x@19@00)
      (img@21@00 (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x@19@00))))
  :pattern ((loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) x@19@00))
  :qid |quant-u-13|)))
(assert (forall ((self $Ref)) (!
  (=>
    (and
      (img@21@00 self)
      (and
        (<= 0 (inv@20@00 self))
        (<
          (inv@20@00 self)
          (len<Int> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00)))))))
    (=
      (loc<Ref> ($SortWrappers.$SnapToArray_ ($Snap.first ($Snap.second $t@17@00))) (inv@20@00 self))
      self))
  :pattern ((inv@20@00 self))
  :qid |P-fctOfInv|)))
; Permissions are non-negative
(pop) ; 1
