(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0383b.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $PSF<read_fields> 0)
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
(declare-fun $SortWrappers.$PSF<read_fields>To$Snap ($PSF<read_fields>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<read_fields> ($Snap) $PSF<read_fields>)
(assert (forall ((x $PSF<read_fields>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<read_fields>($SortWrappers.$PSF<read_fields>To$Snap x)))
    :pattern (($SortWrappers.$PSF<read_fields>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<read_fields>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<read_fields>To$Snap($SortWrappers.$SnapTo$PSF<read_fields> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<read_fields> x))
    :qid |$Snap.$PSF<read_fields>To$SnapTo$PSF<read_fields>|
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
; /predicate_snap_functions_declarations.smt2 [read_fields: Snap]
(declare-fun $PSF.domain_read_fields ($PSF<read_fields>) Set<$Snap>)
(declare-fun $PSF.lookup_read_fields ($PSF<read_fields> $Snap) $Snap)
(declare-fun $PSF.after_read_fields ($PSF<read_fields> $PSF<read_fields>) Bool)
(declare-fun $PSF.loc_read_fields ($Snap $Snap) Bool)
(declare-fun $PSF.perm_read_fields ($PPM $Snap) $Perm)
(declare-const $psfTOP_read_fields $PSF<read_fields>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun read_fields%trigger ($Snap $Ref) Bool)
(declare-fun acc_graph%trigger ($Snap Set<$Ref>) Bool)
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
; /predicate_snap_functions_axioms.smt2 [read_fields: Snap]
(assert (forall ((vs $PSF<read_fields>) (ws $PSF<read_fields>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_read_fields vs) ($PSF.domain_read_fields ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_read_fields vs))
            (= ($PSF.lookup_read_fields vs x) ($PSF.lookup_read_fields ws x)))
          :pattern (($PSF.lookup_read_fields vs x) ($PSF.lookup_read_fields ws x))
          :qid |qp.$PSF<read_fields>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<read_fields>To$Snap vs)
              ($SortWrappers.$PSF<read_fields>To$Snap ws)
              )
    :qid |qp.$PSF<read_fields>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_read_fields pm s))
    :pattern (($PSF.perm_read_fields pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_read_fields f s) true)
    :pattern (($PSF.loc_read_fields f s)))))
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
(declare-const n@0@01 $Ref)
(declare-const diff@1@01 $Ref)
(declare-const graph@2@01 Set<$Ref>)
(declare-const n@3@01 $Ref)
(declare-const diff@4@01 $Ref)
(declare-const graph@5@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] graph == Set(n, diff)
; [eval] Set(n, diff)
(assert (Set_equal graph@5@01 (Set_unionone (Set_singleton n@3@01) diff@4@01)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (not (= n@3@01 $Ref.null)))
(push) ; 2
(set-option :timeout 10)
(assert (not (= n@3@01 diff@4@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= diff@4@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
; [exec]
; diff.visited := true
(push) ; 3
(set-option :timeout 10)
(assert (not (= n@3@01 diff@4@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; n.visited := false
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= diff@4@01 n@3@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [exec]
; fold acc(read_fields(diff), write)
(assert (read_fields%trigger ($Snap.combine ($SortWrappers.BoolTo$Snap true) $Snap.unit) diff@4@01))
(declare-const sm@8@01 $PSF<read_fields>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_read_fields (as sm@8@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap diff@4@01))
  ($Snap.combine ($SortWrappers.BoolTo$Snap true) $Snap.unit)))
; [exec]
; fold acc(read_fields(n), write)
(assert (read_fields%trigger ($Snap.combine ($SortWrappers.BoolTo$Snap false) $Snap.unit) n@3@01))
(declare-const sm@9@01 $PSF<read_fields>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_read_fields (as sm@9@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap n@3@01))
  ($Snap.combine ($SortWrappers.BoolTo$Snap false) $Snap.unit)))
; [exec]
; fold acc(acc_graph(graph), write)
(declare-const node@10@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (node in all_nodes)
(assert (Set_in node@10@01 graph@5@01))
(pop) ; 3
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((node1@10@01 $Ref) (node2@10@01 $Ref)) (!
  (=>
    (and
      (Set_in node1@10@01 graph@5@01)
      (Set_in node2@10@01 graph@5@01)
      (= node1@10@01 node2@10@01))
    (= node1@10@01 node2@10@01))
  
  :qid |read_fields-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((node@10@01 $Ref)) (!
  (=>
    (Set_in node@10@01 graph@5@01)
    (and (= (inv@11@01 node@10@01) node@10@01) (img@12@01 node@10@01)))
  :pattern ((Set_in node@10@01 graph@5@01))
  :qid |read_fields-invOfFct|)))
(assert (forall ((node $Ref)) (!
  (=>
    (and (img@12@01 node) (Set_in (inv@11@01 node) graph@5@01))
    (= (inv@11@01 node) node))
  :pattern ((inv@11@01 node))
  :qid |read_fields-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((node $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@11@01 node) graph@5@01)
      (img@12@01 node)
      (= node (inv@11@01 node)))
    ($Perm.min (ite (= node n@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@14@01 ((node $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@11@01 node) graph@5@01)
      (img@12@01 node)
      (= node (inv@11@01 node)))
    ($Perm.min
      (ite (= node diff@4@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@13@01 node)))
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
(assert (not (= (- $Perm.Write (pTaken@13@01 n@3@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((node $Ref)) (!
  (=>
    (and
      (Set_in (inv@11@01 node) graph@5@01)
      (img@12@01 node)
      (= node (inv@11@01 node)))
    (= (- $Perm.Write (pTaken@13@01 node)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@14@01 diff@4@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((node $Ref)) (!
  (= (pTaken@14@01 node) $Perm.No)
  
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
(assert (not (forall ((node $Ref)) (!
  (=>
    (and
      (Set_in (inv@11@01 node) graph@5@01)
      (img@12@01 node)
      (= node (inv@11@01 node)))
    (= (- (- $Perm.Write (pTaken@13@01 node)) (pTaken@14@01 node)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@15@01 $PSF<read_fields>)
(declare-const s@16@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@16@01 $Snap)) (!
  (and
    (=>
      (Set_in s@16@01 ($PSF.domain_read_fields (as sm@15@01  $PSF<read_fields>)))
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@16@01)) graph@5@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@16@01))))
    (=>
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@16@01)) graph@5@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@16@01)))
      (Set_in s@16@01 ($PSF.domain_read_fields (as sm@15@01  $PSF<read_fields>)))))
  :pattern ((Set_in s@16@01 ($PSF.domain_read_fields (as sm@15@01  $PSF<read_fields>))))
  :qid |qp.psmDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@16@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@16@01)) graph@5@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@16@01)))
      (= ($SortWrappers.$SnapTo$Ref s@16@01) n@3@01))
    (and
      (not (= s@16@01 $Snap.unit))
      (=
        ($PSF.lookup_read_fields (as sm@15@01  $PSF<read_fields>) s@16@01)
        ($PSF.lookup_read_fields (as sm@9@01  $PSF<read_fields>) s@16@01))))
  :pattern (($PSF.lookup_read_fields (as sm@15@01  $PSF<read_fields>) s@16@01))
  :pattern (($PSF.lookup_read_fields (as sm@9@01  $PSF<read_fields>) s@16@01))
  :qid |qp.psmValDef0|)))
(assert (forall ((s@16@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@11@01 ($SortWrappers.$SnapTo$Ref s@16@01)) graph@5@01)
        (img@12@01 ($SortWrappers.$SnapTo$Ref s@16@01)))
      (= ($SortWrappers.$SnapTo$Ref s@16@01) diff@4@01))
    (and
      (not (= s@16@01 $Snap.unit))
      (=
        ($PSF.lookup_read_fields (as sm@15@01  $PSF<read_fields>) s@16@01)
        ($PSF.lookup_read_fields (as sm@8@01  $PSF<read_fields>) s@16@01))))
  :pattern (($PSF.lookup_read_fields (as sm@15@01  $PSF<read_fields>) s@16@01))
  :pattern (($PSF.lookup_read_fields (as sm@8@01  $PSF<read_fields>) s@16@01))
  :qid |qp.psmValDef1|)))
; [eval] (forall node: Ref :: { (node in all_nodes) } (node in all_nodes) ==> (unfolding acc(read_fields(node), write) in true))
(declare-const node@17@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (node in all_nodes) ==> (unfolding acc(read_fields(node), write) in true)
; [eval] (node in all_nodes)
(push) ; 4
; [then-branch: 0 | node@17@01 in graph@5@01 | live]
; [else-branch: 0 | !(node@17@01 in graph@5@01) | live]
(push) ; 5
; [then-branch: 0 | node@17@01 in graph@5@01]
(assert (Set_in node@17@01 graph@5@01))
; [eval] (unfolding acc(read_fields(node), write) in true)
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (= n@3@01 node@17@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= diff@4@01 node@17@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((node $Ref) (node@17@01 $Ref)) $Perm
  (ite
    (= node node@17@01)
    ($Perm.min (ite (= node n@3@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@19@01 ((node $Ref) (node@17@01 $Ref)) $Perm
  (ite
    (= node node@17@01)
    ($Perm.min
      (ite (= node diff@4@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@18@01 node node@17@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@18@01 n@3@01 node@17@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((node $Ref)) (!
  (= (pTaken@18@01 node node@17@01) $Perm.No)
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((node $Ref)) (!
  (=>
    (= node node@17@01)
    (= (- $Perm.Write (pTaken@18@01 node node@17@01)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@19@01 diff@4@01 node@17@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((node $Ref)) (!
  (= (pTaken@19@01 node node@17@01) $Perm.No)
  
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
(assert (not (forall ((node $Ref)) (!
  (=>
    (= node node@17@01)
    (=
      (-
        (- $Perm.Write (pTaken@18@01 node node@17@01))
        (pTaken@19@01 node node@17@01))
      $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $PSF<read_fields>)
(declare-const s@21@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= node@17@01 n@3@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap node@17@01) $Snap.unit))
    (=
      ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
      ($PSF.lookup_read_fields (as sm@9@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))))))
(assert (=>
  (= node@17@01 diff@4@01)
  (and
    (not (= ($SortWrappers.$RefTo$Snap node@17@01) $Snap.unit))
    (=
      ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
      ($PSF.lookup_read_fields (as sm@8@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))))))
(assert (read_fields%trigger ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)) node@17@01))
(assert (=
  ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))
    ($Snap.second ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))))))
(assert (not (= node@17@01 $Ref.null)))
(assert (=
  ($Snap.second ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))
  $Snap.unit))
(pop) ; 6
; Joined path conditions
(assert (and
  (=>
    (= node@17@01 n@3@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap node@17@01) $Snap.unit))
      (=
        ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
        ($PSF.lookup_read_fields (as sm@9@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
  (=>
    (= node@17@01 diff@4@01)
    (and
      (not (= ($SortWrappers.$RefTo$Snap node@17@01) $Snap.unit))
      (=
        ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
        ($PSF.lookup_read_fields (as sm@8@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
  (read_fields%trigger ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)) node@17@01)
  (=
    ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
    ($Snap.combine
      ($Snap.first ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))
      ($Snap.second ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
  (not (= node@17@01 $Ref.null))
  (=
    ($Snap.second ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))
    $Snap.unit)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 0 | !(node@17@01 in graph@5@01)]
(assert (not (Set_in node@17@01 graph@5@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in node@17@01 graph@5@01)
  (and
    (Set_in node@17@01 graph@5@01)
    (=>
      (= node@17@01 n@3@01)
      (and
        (not (= ($SortWrappers.$RefTo$Snap node@17@01) $Snap.unit))
        (=
          ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
          ($PSF.lookup_read_fields (as sm@9@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
    (=>
      (= node@17@01 diff@4@01)
      (and
        (not (= ($SortWrappers.$RefTo$Snap node@17@01) $Snap.unit))
        (=
          ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
          ($PSF.lookup_read_fields (as sm@8@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
    (read_fields%trigger ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)) node@17@01)
    (=
      ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
      ($Snap.combine
        ($Snap.first ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))
        ($Snap.second ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
    (not (= node@17@01 $Ref.null))
    (=
      ($Snap.second ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))
      $Snap.unit))))
; Joined path conditions
(assert (or (not (Set_in node@17@01 graph@5@01)) (Set_in node@17@01 graph@5@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((node@17@01 $Ref)) (!
  (and
    (=>
      (Set_in node@17@01 graph@5@01)
      (and
        (Set_in node@17@01 graph@5@01)
        (=>
          (= node@17@01 n@3@01)
          (and
            (not (= ($SortWrappers.$RefTo$Snap node@17@01) $Snap.unit))
            (=
              ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
              ($PSF.lookup_read_fields (as sm@9@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
        (=>
          (= node@17@01 diff@4@01)
          (and
            (not (= ($SortWrappers.$RefTo$Snap node@17@01) $Snap.unit))
            (=
              ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
              ($PSF.lookup_read_fields (as sm@8@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
        (read_fields%trigger ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)) node@17@01)
        (=
          ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01))
          ($Snap.combine
            ($Snap.first ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))
            ($Snap.second ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))))
        (not (= node@17@01 $Ref.null))
        (=
          ($Snap.second ($PSF.lookup_read_fields (as sm@20@01  $PSF<read_fields>) ($SortWrappers.$RefTo$Snap node@17@01)))
          $Snap.unit)))
    (or (not (Set_in node@17@01 graph@5@01)) (Set_in node@17@01 graph@5@01)))
  :pattern ((Set_in node@17@01 graph@5@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0383b.vpr@9@3@11@43-aux|)))
(assert (acc_graph%trigger ($Snap.combine
  ($SortWrappers.$PSF<read_fields>To$Snap (as sm@15@01  $PSF<read_fields>))
  $Snap.unit) graph@5@01))
(push) ; 3
(assert (not false))
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
(assert (not false))
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
(assert (not false))
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
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
