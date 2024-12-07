(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:49:35
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0274.vpr
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
(declare-sort Set<Set<$Ref>> 0)
(declare-sort Set<Bool> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $PSF<access_fields> 0)
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
(declare-fun $SortWrappers.Set<Set<$Ref>>To$Snap (Set<Set<$Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<$Ref>> ($Snap) Set<Set<$Ref>>)
(assert (forall ((x Set<Set<$Ref>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<$Ref>>($SortWrappers.Set<Set<$Ref>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<$Ref>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<$Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<$Ref>>To$Snap($SortWrappers.$SnapToSet<Set<$Ref>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<$Ref>> x))
    :qid |$Snap.Set<Set<$Ref>>To$SnapToSet<Set<$Ref>>|
    )))
(declare-fun $SortWrappers.Set<Bool>To$Snap (Set<Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Bool> ($Snap) Set<Bool>)
(assert (forall ((x Set<Bool>)) (!
    (= x ($SortWrappers.$SnapToSet<Bool>($SortWrappers.Set<Bool>To$Snap x)))
    :pattern (($SortWrappers.Set<Bool>To$Snap x))
    :qid |$Snap.$SnapToSet<Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Bool>To$Snap($SortWrappers.$SnapToSet<Bool> x)))
    :pattern (($SortWrappers.$SnapToSet<Bool> x))
    :qid |$Snap.Set<Bool>To$SnapToSet<Bool>|
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
(declare-fun $SortWrappers.$PSF<access_fields>To$Snap ($PSF<access_fields>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<access_fields> ($Snap) $PSF<access_fields>)
(assert (forall ((x $PSF<access_fields>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<access_fields>($SortWrappers.$PSF<access_fields>To$Snap x)))
    :pattern (($SortWrappers.$PSF<access_fields>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<access_fields>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<access_fields>To$Snap($SortWrappers.$SnapTo$PSF<access_fields> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<access_fields> x))
    :qid |$Snap.$PSF<access_fields>To$SnapTo$PSF<access_fields>|
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
(declare-fun Set_card (Set<Set<$Ref>>) Int)
(declare-const Set_empty Set<Set<$Ref>>)
(declare-fun Set_in (Set<$Ref> Set<Set<$Ref>>) Bool)
(declare-fun Set_singleton (Set<$Ref>) Set<Set<$Ref>>)
(declare-fun Set_unionone (Set<Set<$Ref>> Set<$Ref>) Set<Set<$Ref>>)
(declare-fun Set_union (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_intersection (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_difference (Set<Set<$Ref>> Set<Set<$Ref>>) Set<Set<$Ref>>)
(declare-fun Set_subset (Set<Set<$Ref>> Set<Set<$Ref>>) Bool)
(declare-fun Set_equal (Set<Set<$Ref>> Set<Set<$Ref>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<$Ref>> Set<Set<$Ref>>) Set<$Ref>)
(declare-fun Set_card (Set<Bool>) Int)
(declare-const Set_empty Set<Bool>)
(declare-fun Set_in (Bool Set<Bool>) Bool)
(declare-fun Set_singleton (Bool) Set<Bool>)
(declare-fun Set_unionone (Set<Bool> Bool) Set<Bool>)
(declare-fun Set_union (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_intersection (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_difference (Set<Bool> Set<Bool>) Set<Bool>)
(declare-fun Set_subset (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_equal (Set<Bool> Set<Bool>) Bool)
(declare-fun Set_skolem_diff (Set<Bool> Set<Bool>) Bool)
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
; /predicate_snap_functions_declarations.smt2 [access_fields: Snap]
(declare-fun $PSF.domain_access_fields ($PSF<access_fields>) Set<$Snap>)
(declare-fun $PSF.lookup_access_fields ($PSF<access_fields> $Snap) $Snap)
(declare-fun $PSF.after_access_fields ($PSF<access_fields> $PSF<access_fields>) Bool)
(declare-fun $PSF.loc_access_fields ($Snap $Snap) Bool)
(declare-fun $PSF.perm_access_fields ($PPM $Snap) $Perm)
(declare-const $psfTOP_access_fields $PSF<access_fields>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun access_fields%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s Set<Set<$Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<$Ref>)) (!
  (not (Set_in o (as Set_empty  Set<Set<$Ref>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<$Ref>>)))
  )))
(assert (forall ((s Set<Set<$Ref>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<$Ref>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Set<$Ref>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<$Ref>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<$Ref>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<$Ref>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>) (y Set<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (x Set<$Ref>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (o Set<$Ref>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>) (y Set<$Ref>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
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
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<$Ref>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
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
(assert (forall ((a Set<Set<$Ref>>) (b Set<Set<$Ref>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Bool>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Bool)) (!
  (not (Set_in o (as Set_empty  Set<Bool>)))
  :pattern ((Set_in o (as Set_empty  Set<Bool>)))
  )))
(assert (forall ((s Set<Bool>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Bool>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Bool))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Bool)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Bool) (o Bool)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Bool)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Bool>) (x Bool) (o Bool)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Bool>) (x Bool) (y Bool)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (x Bool)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (o Bool)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>) (y Bool)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
  (=
    (Set_subset a b)
    (forall ((o Bool)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
(assert (forall ((a Set<Bool>) (b Set<Bool>)) (!
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
; /predicate_snap_functions_axioms.smt2 [access_fields: Snap]
(assert (forall ((vs $PSF<access_fields>) (ws $PSF<access_fields>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_access_fields vs) ($PSF.domain_access_fields ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_access_fields vs))
            (= ($PSF.lookup_access_fields vs x) ($PSF.lookup_access_fields ws x)))
          :pattern (($PSF.lookup_access_fields vs x) ($PSF.lookup_access_fields ws x))
          :qid |qp.$PSF<access_fields>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<access_fields>To$Snap vs)
              ($SortWrappers.$PSF<access_fields>To$Snap ws)
              )
    :qid |qp.$PSF<access_fields>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_access_fields pm s))
    :pattern (($PSF.perm_access_fields pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_access_fields f s) true)
    :pattern (($PSF.loc_access_fields f s)))))
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
; ---------- test1 ----------
(declare-const curr_node@0@01 $Ref)
(declare-const all_nodes@1@01 Set<$Ref>)
(declare-const curr_node@2@01 $Ref)
(declare-const all_nodes@3@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const n@5@01 $Ref)
(push) ; 2
; [eval] (n in all_nodes)
(assert (Set_in n@5@01 all_nodes@3@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@5@01 $Ref) (n2@5@01 $Ref)) (!
  (=>
    (and
      (Set_in n1@5@01 all_nodes@3@01)
      (Set_in n2@5@01 all_nodes@3@01)
      (= n1@5@01 n2@5@01))
    (= n1@5@01 n2@5@01))
  
  :qid |access_fields-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@5@01 $Ref)) (!
  (=>
    (Set_in n@5@01 all_nodes@3@01)
    (and (= (inv@6@01 n@5@01) n@5@01) (img@7@01 n@5@01)))
  :pattern ((Set_in n@5@01 all_nodes@3@01))
  :qid |quant-u-1|)))
(assert (forall ((node $Ref)) (!
  (=>
    (and (img@7@01 node) (Set_in (inv@6@01 node) all_nodes@3@01))
    (= (inv@6@01 node) node))
  :pattern ((inv@6@01 node))
  :qid |access_fields-fctOfInv|)))
; Permissions are non-negative
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (forall n: Ref :: { (n in all_nodes) } (n in all_nodes) ==> (unfolding acc(access_fields(n), write) in (n.neighbour subset all_nodes)))
(declare-const n@8@01 $Ref)
(push) ; 2
; [eval] (n in all_nodes) ==> (unfolding acc(access_fields(n), write) in (n.neighbour subset all_nodes))
; [eval] (n in all_nodes)
(push) ; 3
; [then-branch: 0 | n@8@01 in all_nodes@3@01 | live]
; [else-branch: 0 | !(n@8@01 in all_nodes@3@01) | live]
(push) ; 4
; [then-branch: 0 | n@8@01 in all_nodes@3@01]
(assert (Set_in n@8@01 all_nodes@3@01))
; [eval] (unfolding acc(access_fields(n), write) in (n.neighbour subset all_nodes))
(push) ; 5
; Precomputing data for removing quantified permissions
(define-fun pTaken@9@01 ((node $Ref) (n@8@01 $Ref)) $Perm
  (ite
    (= node n@8@01)
    ($Perm.min
      (ite
        (and (img@7@01 node) (Set_in (inv@6@01 node) all_nodes@3@01))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((node $Ref)) (!
  (=
    (-
      (ite
        (and (img@7@01 node) (Set_in (inv@6@01 node) all_nodes@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@9@01 node n@8@01))
    $Perm.No)
  
  :qid |quant-u-3|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((node $Ref)) (!
  (= (pTaken@9@01 node n@8@01) $Perm.No)
  
  :qid |quant-u-4|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((node $Ref)) (!
  (=> (= node n@8@01) (= (- $Perm.Write (pTaken@9@01 node n@8@01)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@10@01 $PSF<access_fields>)
(declare-const s@11@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@7@01 n@8@01) (Set_in (inv@6@01 n@8@01) all_nodes@3@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap n@8@01) $Snap.unit))
    (=
      ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))
      ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap n@8@01))))))
(assert (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)) n@8@01))
(assert (=
  ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)))
    ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))))))
(assert (not (= n@8@01 $Ref.null)))
; [eval] (n.neighbour subset all_nodes)
(pop) ; 5
; Joined path conditions
(assert (and
  (=>
    (and (img@7@01 n@8@01) (Set_in (inv@6@01 n@8@01) all_nodes@3@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap n@8@01) $Snap.unit))
      (=
        ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))
        ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap n@8@01)))))
  (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)) n@8@01)
  (=
    ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)))
      ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)))))
  (not (= n@8@01 $Ref.null))))
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [else-branch: 0 | !(n@8@01 in all_nodes@3@01)]
(assert (not (Set_in n@8@01 all_nodes@3@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (Set_in n@8@01 all_nodes@3@01)
  (and
    (Set_in n@8@01 all_nodes@3@01)
    (=>
      (and (img@7@01 n@8@01) (Set_in (inv@6@01 n@8@01) all_nodes@3@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap n@8@01) $Snap.unit))
        (=
          ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))
          ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap n@8@01)))))
    (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)) n@8@01)
    (=
      ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)))
        ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)))))
    (not (= n@8@01 $Ref.null)))))
; Joined path conditions
(assert (or (not (Set_in n@8@01 all_nodes@3@01)) (Set_in n@8@01 all_nodes@3@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n@8@01 $Ref)) (!
  (and
    (=>
      (Set_in n@8@01 all_nodes@3@01)
      (and
        (Set_in n@8@01 all_nodes@3@01)
        (=>
          (and (img@7@01 n@8@01) (Set_in (inv@6@01 n@8@01) all_nodes@3@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap n@8@01) $Snap.unit))
            (=
              ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))
              ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap n@8@01)))))
        (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)) n@8@01)
        (=
          ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)))
            ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)))))
        (not (= n@8@01 $Ref.null))))
    (or (not (Set_in n@8@01 all_nodes@3@01)) (Set_in n@8@01 all_nodes@3@01)))
  :pattern ((Set_in n@8@01 all_nodes@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0274.vpr@10@14@10@146-aux|)))
(assert (forall ((n@8@01 $Ref)) (!
  (=>
    (Set_in n@8@01 all_nodes@3@01)
    (Set_subset ($SortWrappers.$SnapToSet<$Ref> ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap n@8@01)))) all_nodes@3@01))
  :pattern ((Set_in n@8@01 all_nodes@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0274.vpr@10@14@10@146|)))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] (curr_node in all_nodes)
(assert (Set_in curr_node@2@01 all_nodes@3@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] (exists nn: Ref :: { (nn in all_nodes) } (nn in all_nodes) && (nn != curr_node && (unfolding acc(access_fields(nn), write) in !nn.visited)))
(declare-const nn@12@01 $Ref)
(push) ; 2
; [eval] (nn in all_nodes) && (nn != curr_node && (unfolding acc(access_fields(nn), write) in !nn.visited))
; [eval] (nn in all_nodes)
(push) ; 3
; [then-branch: 1 | !(nn@12@01 in all_nodes@3@01) | live]
; [else-branch: 1 | nn@12@01 in all_nodes@3@01 | live]
(push) ; 4
; [then-branch: 1 | !(nn@12@01 in all_nodes@3@01)]
(assert (not (Set_in nn@12@01 all_nodes@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | nn@12@01 in all_nodes@3@01]
(assert (Set_in nn@12@01 all_nodes@3@01))
; [eval] nn != curr_node
(push) ; 5
; [then-branch: 2 | nn@12@01 == curr_node@2@01 | live]
; [else-branch: 2 | nn@12@01 != curr_node@2@01 | live]
(push) ; 6
; [then-branch: 2 | nn@12@01 == curr_node@2@01]
(assert (= nn@12@01 curr_node@2@01))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | nn@12@01 != curr_node@2@01]
(assert (not (= nn@12@01 curr_node@2@01)))
; [eval] (unfolding acc(access_fields(nn), write) in !nn.visited)
(push) ; 7
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((node $Ref) (nn@12@01 $Ref)) $Perm
  (ite
    (= node nn@12@01)
    ($Perm.min
      (ite
        (and (img@7@01 node) (Set_in (inv@6@01 node) all_nodes@3@01))
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
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((node $Ref)) (!
  (=
    (-
      (ite
        (and (img@7@01 node) (Set_in (inv@6@01 node) all_nodes@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@13@01 node nn@12@01))
    $Perm.No)
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (forall ((node $Ref)) (!
  (= (pTaken@13@01 node nn@12@01) $Perm.No)
  
  :qid |quant-u-8|))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 500)
(assert (not (forall ((node $Ref)) (!
  (=>
    (= node nn@12@01)
    (= (- $Perm.Write (pTaken@13@01 node nn@12@01)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@7@01 nn@12@01) (Set_in (inv@6@01 nn@12@01) all_nodes@3@01))
  (and
    (not (= ($SortWrappers.$RefTo$Snap nn@12@01) $Snap.unit))
    (=
      ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
      ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap nn@12@01))))))
(assert (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)) nn@12@01))
(assert (=
  ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))
    ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))))))
(assert (not (= nn@12@01 $Ref.null)))
; [eval] !nn.visited
(pop) ; 7
; Joined path conditions
(assert (and
  (=>
    (and (img@7@01 nn@12@01) (Set_in (inv@6@01 nn@12@01) all_nodes@3@01))
    (and
      (not (= ($SortWrappers.$RefTo$Snap nn@12@01) $Snap.unit))
      (=
        ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
        ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap nn@12@01)))))
  (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)) nn@12@01)
  (=
    ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))
      ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))))
  (not (= nn@12@01 $Ref.null))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= nn@12@01 curr_node@2@01))
  (and
    (not (= nn@12@01 curr_node@2@01))
    (=>
      (and (img@7@01 nn@12@01) (Set_in (inv@6@01 nn@12@01) all_nodes@3@01))
      (and
        (not (= ($SortWrappers.$RefTo$Snap nn@12@01) $Snap.unit))
        (=
          ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
          ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap nn@12@01)))))
    (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)) nn@12@01)
    (=
      ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))
        ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))))
    (not (= nn@12@01 $Ref.null)))))
(assert (or (not (= nn@12@01 curr_node@2@01)) (= nn@12@01 curr_node@2@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in nn@12@01 all_nodes@3@01)
  (and
    (Set_in nn@12@01 all_nodes@3@01)
    (=>
      (not (= nn@12@01 curr_node@2@01))
      (and
        (not (= nn@12@01 curr_node@2@01))
        (=>
          (and (img@7@01 nn@12@01) (Set_in (inv@6@01 nn@12@01) all_nodes@3@01))
          (and
            (not (= ($SortWrappers.$RefTo$Snap nn@12@01) $Snap.unit))
            (=
              ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
              ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap nn@12@01)))))
        (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)) nn@12@01)
        (=
          ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))
            ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))))
        (not (= nn@12@01 $Ref.null))))
    (or (not (= nn@12@01 curr_node@2@01)) (= nn@12@01 curr_node@2@01)))))
(assert (or (Set_in nn@12@01 all_nodes@3@01) (not (Set_in nn@12@01 all_nodes@3@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((nn@12@01 $Ref)) (!
  (and
    (=>
      (Set_in nn@12@01 all_nodes@3@01)
      (and
        (Set_in nn@12@01 all_nodes@3@01)
        (=>
          (not (= nn@12@01 curr_node@2@01))
          (and
            (not (= nn@12@01 curr_node@2@01))
            (=>
              (and
                (img@7@01 nn@12@01)
                (Set_in (inv@6@01 nn@12@01) all_nodes@3@01))
              (and
                (not (= ($SortWrappers.$RefTo$Snap nn@12@01) $Snap.unit))
                (=
                  ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
                  ($PSF.lookup_access_fields ($SortWrappers.$SnapTo$PSF<access_fields> ($Snap.first $t@4@01)) ($SortWrappers.$RefTo$Snap nn@12@01)))))
            (access_fields%trigger ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)) nn@12@01)
            (=
              ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01))
              ($Snap.combine
                ($Snap.first ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))
                ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))))
            (not (= nn@12@01 $Ref.null))))
        (or (not (= nn@12@01 curr_node@2@01)) (= nn@12@01 curr_node@2@01))))
    (or (Set_in nn@12@01 all_nodes@3@01) (not (Set_in nn@12@01 all_nodes@3@01))))
  :pattern ((Set_in nn@12@01 all_nodes@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0274.vpr@12@14@12@113-aux|)))
(assert (exists ((nn@12@01 $Ref)) (!
  (and
    (Set_in nn@12@01 all_nodes@3@01)
    (and
      (not (= nn@12@01 curr_node@2@01))
      (not
        ($SortWrappers.$SnapToBool ($Snap.second ($PSF.lookup_access_fields (as sm@10@01  $PSF<access_fields>) ($SortWrappers.$RefTo$Snap nn@12@01)))))))
  :pattern ((Set_in nn@12@01 all_nodes@3@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0274.vpr@12@14@12@113|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
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
; inhale (exists nn: Ref :: nn != null &&
;     (unfolding acc(access_fields(nn), write) in true))
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] (exists nn: Ref :: nn != null && (unfolding acc(access_fields(nn), write) in true))
(declare-const nn@15@01 $Ref)
(push) ; 3
; [eval] nn != null && (unfolding acc(access_fields(nn), write) in true)
; [eval] nn != null
(push) ; 4
; [then-branch: 3 | nn@15@01 == Null | live]
; [else-branch: 3 | nn@15@01 != Null | live]
(push) ; 5
; [then-branch: 3 | nn@15@01 == Null]
(assert (= nn@15@01 $Ref.null))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | nn@15@01 != Null]
(assert (not (= nn@15@01 $Ref.null)))
; [eval] (unfolding acc(access_fields(nn), write) in true)
(push) ; 6
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
