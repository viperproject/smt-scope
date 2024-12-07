(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:19
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0196.vpr
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
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<q> 0)
(declare-sort $PSF<Q> 0)
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
(declare-fun $SortWrappers.$FVF<q>To$Snap ($FVF<q>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<q> ($Snap) $FVF<q>)
(assert (forall ((x $FVF<q>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<q>($SortWrappers.$FVF<q>To$Snap x)))
    :pattern (($SortWrappers.$FVF<q>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<q>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<q>To$Snap($SortWrappers.$SnapTo$FVF<q> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<q> x))
    :qid |$Snap.$FVF<q>To$SnapTo$FVF<q>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<Q>To$Snap ($PSF<Q>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<Q> ($Snap) $PSF<Q>)
(assert (forall ((x $PSF<Q>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<Q>($SortWrappers.$PSF<Q>To$Snap x)))
    :pattern (($SortWrappers.$PSF<Q>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<Q>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<Q>To$Snap($SortWrappers.$SnapTo$PSF<Q> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<Q> x))
    :qid |$Snap.$PSF<Q>To$SnapTo$PSF<Q>|
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
; /field_value_functions_declarations.smt2 [q: Ref]
(declare-fun $FVF.domain_q ($FVF<q>) Set<$Ref>)
(declare-fun $FVF.lookup_q ($FVF<q> $Ref) $Ref)
(declare-fun $FVF.after_q ($FVF<q> $FVF<q>) Bool)
(declare-fun $FVF.loc_q ($Ref $Ref) Bool)
(declare-fun $FVF.perm_q ($FPM $Ref) $Perm)
(declare-const $fvfTOP_q $FVF<q>)
; /predicate_snap_functions_declarations.smt2 [Q: Snap]
(declare-fun $PSF.domain_Q ($PSF<Q>) Set<$Snap>)
(declare-fun $PSF.lookup_Q ($PSF<Q> $Snap) $Snap)
(declare-fun $PSF.after_Q ($PSF<Q> $PSF<Q>) Bool)
(declare-fun $PSF.loc_Q ($Snap $Snap) Bool)
(declare-fun $PSF.perm_Q ($PPM $Snap) $Perm)
(declare-const $psfTOP_Q $PSF<Q>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun refs ($Snap $Ref) Set<$Ref>)
(declare-fun refs%limited ($Snap $Ref) Set<$Ref>)
(declare-fun refs%stateless ($Ref) Bool)
(declare-fun refs%precondition ($Snap $Ref) Bool)
(declare-fun testerFull ($Snap $Ref) $Ref)
(declare-fun testerFull%limited ($Snap $Ref) $Ref)
(declare-fun testerFull%stateless ($Ref) Bool)
(declare-fun testerFull%precondition ($Snap $Ref) Bool)
(declare-fun get ($Snap $Ref) $Ref)
(declare-fun get%limited ($Snap $Ref) $Ref)
(declare-fun get%stateless ($Ref) Bool)
(declare-fun get%precondition ($Snap $Ref) Bool)
(declare-fun testerfieldFull ($Snap $Ref) $Ref)
(declare-fun testerfieldFull%limited ($Snap $Ref) $Ref)
(declare-fun testerfieldFull%stateless ($Ref) Bool)
(declare-fun testerfieldFull%precondition ($Snap $Ref) Bool)
(declare-fun tester ($Snap $Ref) $Ref)
(declare-fun tester%limited ($Snap $Ref) $Ref)
(declare-fun tester%stateless ($Ref) Bool)
(declare-fun tester%precondition ($Snap $Ref) Bool)
(declare-fun testerfield ($Snap $Ref) $Ref)
(declare-fun testerfield%limited ($Snap $Ref) $Ref)
(declare-fun testerfield%stateless ($Ref) Bool)
(declare-fun testerfield%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap $Ref) Bool)
(declare-fun P2%trigger ($Snap $Ref) Bool)
(declare-fun R%trigger ($Snap $Ref) Bool)
(declare-fun R2%trigger ($Snap $Ref) Bool)
(declare-fun Q%trigger ($Snap $Ref) Bool)
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
; /field_value_functions_axioms.smt2 [q: Ref]
(assert (forall ((vs $FVF<q>) (ws $FVF<q>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_q vs) ($FVF.domain_q ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_q vs))
            (= ($FVF.lookup_q vs x) ($FVF.lookup_q ws x)))
          :pattern (($FVF.lookup_q vs x) ($FVF.lookup_q ws x))
          :qid |qp.$FVF<q>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<q>To$Snap vs)
              ($SortWrappers.$FVF<q>To$Snap ws)
              )
    :qid |qp.$FVF<q>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_q pm r))
    :pattern (($FVF.perm_q pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_q f r) true)
    :pattern (($FVF.loc_q f r)))))
; /predicate_snap_functions_axioms.smt2 [Q: Snap]
(assert (forall ((vs $PSF<Q>) (ws $PSF<Q>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_Q vs) ($PSF.domain_Q ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_Q vs))
            (= ($PSF.lookup_Q vs x) ($PSF.lookup_Q ws x)))
          :pattern (($PSF.lookup_Q vs x) ($PSF.lookup_Q ws x))
          :qid |qp.$PSF<Q>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<Q>To$Snap vs)
              ($SortWrappers.$PSF<Q>To$Snap ws)
              )
    :qid |qp.$PSF<Q>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_Q pm s))
    :pattern (($PSF.perm_Q pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_Q f s) true)
    :pattern (($PSF.loc_Q f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun $k@13@00 () $Perm)
(declare-fun $k@14@00 () $Perm)
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (refs%limited s@$ r@0@00) (refs s@$ r@0@00))
  :pattern ((refs s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (refs%stateless r@0@00)
  :pattern ((refs%limited s@$ r@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (testerFull%limited s@$ r@2@00) (testerFull s@$ r@2@00))
  :pattern ((testerFull s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (testerFull%stateless r@2@00)
  :pattern ((testerFull%limited s@$ r@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (= (get%limited s@$ r@4@00) (get s@$ r@4@00))
  :pattern ((get s@$ r@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (get%stateless r@4@00)
  :pattern ((get%limited s@$ r@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (let ((result@5@00 (get%limited s@$ r@4@00))) (=>
    (get%precondition s@$ r@4@00)
    (Set_in result@5@00 (refs $Snap.unit r@4@00))))
  :pattern ((get%limited s@$ r@4@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (r@4@00 $Ref)) (!
  (let ((result@5@00 (get%limited s@$ r@4@00))) (=>
    (get%precondition s@$ r@4@00)
    (refs%precondition $Snap.unit r@4@00)))
  :pattern ((get%limited s@$ r@4@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (= (testerfieldFull%limited s@$ r@6@00) (testerfieldFull s@$ r@6@00))
  :pattern ((testerfieldFull s@$ r@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (testerfieldFull%stateless r@6@00)
  :pattern ((testerfieldFull%limited s@$ r@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (= (tester%limited s@$ r@8@00) (tester s@$ r@8@00))
  :pattern ((tester s@$ r@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (tester%stateless r@8@00)
  :pattern ((tester%limited s@$ r@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (= (testerfield%limited s@$ r@10@00) (testerfield s@$ r@10@00))
  :pattern ((testerfield s@$ r@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (testerfield%stateless r@10@00)
  :pattern ((testerfield%limited s@$ r@10@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- pred1 ----------
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $k@2@01 $Perm)
(assert ($Perm.isReadVar $k@2@01))
(declare-const $t@3@01 $Snap)
(assert (<= $Perm.No $k@2@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var r2: Ref
(declare-const r2@4@01 $Ref)
; [exec]
; var r3: Ref
(declare-const r3@5@01 $Ref)
; [exec]
; unfold acc(P(r), wildcard)
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@2@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@6@01 $k@2@01))
(assert (<= $Perm.No (- $k@2@01 $k@6@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@7@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@1@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@1@01))
(assert (Set_in e@7@01 (refs $Snap.unit r@1@01)))
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(pop) ; 3
(declare-fun inv@9@01 ($Ref) $Ref)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@8@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@7@01 $Ref)) (!
  (=>
    (Set_in e@7@01 (refs $Snap.unit r@1@01))
    (refs%precondition $Snap.unit r@1@01))
  :pattern ((Set_in e@7@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@9@01 e@7@01))
  :pattern ((img@10@01 e@7@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@7@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@1@01)
      (Set_in e@7@01 (refs $Snap.unit r@1@01)))
    (or (= $k@8@01 $Perm.No) (< $Perm.No $k@8@01)))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@7@01 $Ref) (e2@7@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@1@01)
    (=>
      (and (Set_in e1@7@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@8@01))
      (refs%precondition $Snap.unit r@1@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@7@01 $Ref) (e2@7@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@7@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@8@01))
      (and (Set_in e2@7@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@8@01))
      (= e1@7@01 e2@7@01))
    (= e1@7@01 e2@7@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@7@01 $Ref)) (!
  (refs%precondition $Snap.unit r@1@01)
  :pattern ((Set_in e@7@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@9@01 e@7@01))
  :pattern ((img@10@01 e@7@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=> (img@10@01 r) (refs%precondition $Snap.unit r@1@01))
  :pattern ((inv@9@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@7@01 $Ref)) (!
  (=>
    (and
      (Set_in e@7@01 (refs $Snap.unit r@1@01))
      (< $Perm.No (* $k@8@01 $k@6@01)))
    (and (= (inv@9@01 e@7@01) e@7@01) (img@10@01 e@7@01)))
  :pattern ((Set_in e@7@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@9@01 e@7@01))
  :pattern ((img@10@01 e@7@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@01 r)
      (and
        (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01))
        (< $Perm.No (* $k@8@01 $k@6@01))))
    (= (inv@9@01 r) r))
  :pattern ((inv@9@01 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@7@01 $Ref)) (!
  (<= $Perm.No (* $k@8@01 $k@6@01))
  :pattern ((Set_in e@7@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@9@01 e@7@01))
  :pattern ((img@10@01 e@7@01))
  :qid |Q-permAtLeastZero|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@3@01 r@1@01))
; [exec]
; fold acc(P(r), wildcard)
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(declare-const e@12@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@1@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@1@01))
(assert (Set_in e@12@01 (refs $Snap.unit r@1@01)))
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(pop) ; 3
(declare-fun inv@14@01 ($Ref) $Ref)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@13@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@12@01 $Ref)) (!
  (=>
    (Set_in e@12@01 (refs $Snap.unit r@1@01))
    (refs%precondition $Snap.unit r@1@01))
  :pattern ((Set_in e@12@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@14@01 e@12@01))
  :pattern ((img@15@01 e@12@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@12@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@1@01)
      (Set_in e@12@01 (refs $Snap.unit r@1@01)))
    (or (= $k@13@01 $Perm.No) (< $Perm.No $k@13@01)))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@12@01 $Ref) (e2@12@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@1@01)
    (=>
      (and (Set_in e1@12@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@13@01))
      (refs%precondition $Snap.unit r@1@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@12@01 $Ref) (e2@12@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@12@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@13@01))
      (and (Set_in e2@12@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@13@01))
      (= e1@12@01 e2@12@01))
    (= e1@12@01 e2@12@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@12@01 $Ref)) (!
  (refs%precondition $Snap.unit r@1@01)
  :pattern ((Set_in e@12@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@14@01 e@12@01))
  :pattern ((img@15@01 e@12@01))
  :qid |Q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (img@15@01 r) (refs%precondition $Snap.unit r@1@01))
  :pattern ((inv@14@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@12@01 $Ref)) (!
  (=>
    (and (Set_in e@12@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@13@01))
    (and (= (inv@14@01 e@12@01) e@12@01) (img@15@01 e@12@01)))
  :pattern ((Set_in e@12@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@14@01 e@12@01))
  :pattern ((img@15@01 e@12@01))
  :qid |Q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (Set_in (inv@14@01 r) (refs $Snap.unit r@1@01)) (< $Perm.No $k@13@01)))
    (= (inv@14@01 r) r))
  :pattern ((inv@14@01 r))
  :qid |Q-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@16@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@14@01 r) (refs $Snap.unit r@1@01))
      (img@15@01 r)
      (= r (inv@14@01 r)))
    ($Perm.min
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
        (* $k@8@01 $k@6@01)
        $Perm.No)
      (* $k@13@01 $k@11@01))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@13@01 * $k@11@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
          (* $k@8@01 $k@6@01)
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
      (<
        (ite
          (and
            (Set_in (inv@14@01 r) (refs $Snap.unit r@1@01))
            (img@15@01 r)
            (= r (inv@14@01 r)))
          (* $k@13@01 $k@11@01)
          $Perm.No)
        (* $k@8@01 $k@6@01))
      (<
        (ite
          (and
            (Set_in (inv@14@01 r) (refs $Snap.unit r@1@01))
            (img@15@01 r)
            (= r (inv@14@01 r)))
          (* $k@13@01 $k@11@01)
          $Perm.No)
        $Perm.No)))
  :pattern ((img@10@01 r))
  :pattern ((Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
  :pattern ((Set_in (inv@14@01 r) (refs $Snap.unit r@1@01)))
  :pattern ((img@15@01 r))
  :qid |qp.srp0|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@14@01 r) (refs $Snap.unit r@1@01))
      (img@15@01 r)
      (= r (inv@14@01 r)))
    (= (- (* $k@13@01 $k@11@01) (pTaken@16@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@17@01 $PSF<Q>)
(declare-const s@18@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@18@01 $Snap)) (!
  (and
    (=>
      (Set_in s@18@01 ($PSF.domain_Q (as sm@17@01  $PSF<Q>)))
      (and
        (Set_in (inv@14@01 ($SortWrappers.$SnapTo$Ref s@18@01)) (refs $Snap.unit r@1@01))
        (< $Perm.No (* $k@13@01 $k@11@01))
        (img@15@01 ($SortWrappers.$SnapTo$Ref s@18@01))))
    (=>
      (and
        (Set_in (inv@14@01 ($SortWrappers.$SnapTo$Ref s@18@01)) (refs $Snap.unit r@1@01))
        (< $Perm.No (* $k@13@01 $k@11@01))
        (img@15@01 ($SortWrappers.$SnapTo$Ref s@18@01)))
      (Set_in s@18@01 ($PSF.domain_Q (as sm@17@01  $PSF<Q>)))))
  :pattern ((Set_in s@18@01 ($PSF.domain_Q (as sm@17@01  $PSF<Q>))))
  :qid |qp.psmDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@18@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@14@01 ($SortWrappers.$SnapTo$Ref s@18@01)) (refs $Snap.unit r@1@01))
        (< $Perm.No (* $k@13@01 $k@11@01))
        (img@15@01 ($SortWrappers.$SnapTo$Ref s@18@01)))
      (ite
        (and
          (img@10@01 ($SortWrappers.$SnapTo$Ref s@18@01))
          (Set_in (inv@9@01 ($SortWrappers.$SnapTo$Ref s@18@01)) (refs $Snap.unit r@1@01)))
        (< $Perm.No (* $k@8@01 $k@6@01))
        false))
    (and
      (not (= s@18@01 $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@17@01  $PSF<Q>) s@18@01)
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@3@01) s@18@01))))
  :pattern (($PSF.lookup_Q (as sm@17@01  $PSF<Q>) s@18@01))
  :pattern (($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@3@01) s@18@01))
  :qid |qp.psmValDef1|)))
(assert (P%trigger ($SortWrappers.$PSF<Q>To$Snap (as sm@17@01  $PSF<Q>)) r@1@01))
(declare-const $t@19@01 $Snap)
(assert (and
  (=> (< $Perm.No (- $k@2@01 $k@6@01)) (= $t@19@01 $t@3@01))
  (=>
    (< $Perm.No $k@11@01)
    (= $t@19@01 ($SortWrappers.$PSF<Q>To$Snap (as sm@17@01  $PSF<Q>))))))
(assert (<= $Perm.No (+ (- $k@2@01 $k@6@01) $k@11@01)))
; [exec]
; unfold acc(P(r), wildcard)
(declare-const $k@20@01 $Perm)
(assert ($Perm.isReadVar $k@20@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@2@01 $k@6@01) $k@11@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@20@01 (+ (- $k@2@01 $k@6@01) $k@11@01)))
(assert (<= $Perm.No (- (+ (- $k@2@01 $k@6@01) $k@11@01) $k@20@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@20@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@21@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@1@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@1@01))
(assert (Set_in e@21@01 (refs $Snap.unit r@1@01)))
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(pop) ; 3
(declare-fun inv@23@01 ($Ref) $Ref)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@22@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@21@01 $Ref)) (!
  (=>
    (Set_in e@21@01 (refs $Snap.unit r@1@01))
    (refs%precondition $Snap.unit r@1@01))
  :pattern ((Set_in e@21@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@23@01 e@21@01))
  :pattern ((img@24@01 e@21@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@21@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@1@01)
      (Set_in e@21@01 (refs $Snap.unit r@1@01)))
    (or (= $k@22@01 $Perm.No) (< $Perm.No $k@22@01)))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@21@01 $Ref) (e2@21@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@1@01)
    (=>
      (and (Set_in e1@21@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@22@01))
      (refs%precondition $Snap.unit r@1@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@21@01 $Ref) (e2@21@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@21@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@22@01))
      (and (Set_in e2@21@01 (refs $Snap.unit r@1@01)) (< $Perm.No $k@22@01))
      (= e1@21@01 e2@21@01))
    (= e1@21@01 e2@21@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@21@01 $Ref)) (!
  (refs%precondition $Snap.unit r@1@01)
  :pattern ((Set_in e@21@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@23@01 e@21@01))
  :pattern ((img@24@01 e@21@01))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=> (img@24@01 r) (refs%precondition $Snap.unit r@1@01))
  :pattern ((inv@23@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@21@01 $Ref)) (!
  (=>
    (and
      (Set_in e@21@01 (refs $Snap.unit r@1@01))
      (< $Perm.No (* $k@22@01 $k@20@01)))
    (and (= (inv@23@01 e@21@01) e@21@01) (img@24@01 e@21@01)))
  :pattern ((Set_in e@21@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@23@01 e@21@01))
  :pattern ((img@24@01 e@21@01))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (and
        (Set_in (inv@23@01 r) (refs $Snap.unit r@1@01))
        (< $Perm.No (* $k@22@01 $k@20@01))))
    (= (inv@23@01 r) r))
  :pattern ((inv@23@01 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@21@01 $Ref)) (!
  (<= $Perm.No (* $k@22@01 $k@20@01))
  :pattern ((Set_in e@21@01 (refs $Snap.unit r@1@01)))
  :pattern ((inv@23@01 e@21@01))
  :pattern ((img@24@01 e@21@01))
  :qid |Q-permAtLeastZero|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@21@01 e@7@01)
    (=
      (and (img@24@01 r) (Set_in (inv@23@01 r) (refs $Snap.unit r@1@01)))
      (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))))
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@19@01 r@1@01))
; [exec]
; r2 := tester(get(r))
; [eval] tester(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition $Snap.unit r@1@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition $Snap.unit r@1@01))
(push) ; 3
(declare-const $k@25@01 $Perm)
(assert ($Perm.isReadVar $k@25@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@1@01))
    ($Perm.min
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
        (- (* $k@8@01 $k@6@01) (pTaken@16@01 r))
        $Perm.No)
      $k@25@01)
    $Perm.No))
(define-fun pTaken@27@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@1@01))
    ($Perm.min
      (ite
        (and (img@24@01 r) (Set_in (inv@23@01 r) (refs $Snap.unit r@1@01)))
        (* $k@22@01 $k@20@01)
        $Perm.No)
      (- $k@25@01 (pTaken@26@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@25@01
(assert (=>
  (not
    (=
      (ite
        (and
          (img@10@01 (get $Snap.unit r@1@01))
          (Set_in (inv@9@01 (get $Snap.unit r@1@01)) (refs $Snap.unit r@1@01)))
        (- (* $k@8@01 $k@6@01) (pTaken@16@01 (get $Snap.unit r@1@01)))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@10@01 (get $Snap.unit r@1@01))
      (Set_in (inv@9@01 (get $Snap.unit r@1@01)) (refs $Snap.unit r@1@01)))
    (<
      (ite (= (get $Snap.unit r@1@01) (get $Snap.unit r@1@01)) $k@25@01 $Perm.No)
      (- (* $k@8@01 $k@6@01) (pTaken@16@01 (get $Snap.unit r@1@01))))
    (<
      (ite (= (get $Snap.unit r@1@01) (get $Snap.unit r@1@01)) $k@25@01 $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r (get $Snap.unit r@1@01)) (= (- $k@25@01 (pTaken@26@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@28@01 $PSF<Q>)
(declare-const s@29@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@10@01 (get $Snap.unit r@1@01))
      (Set_in (inv@9@01 (get $Snap.unit r@1@01)) (refs $Snap.unit r@1@01)))
    (< $Perm.No (- (* $k@8@01 $k@6@01) (pTaken@16@01 (get $Snap.unit r@1@01))))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)) $Snap.unit))
    (=
      ($PSF.lookup_Q (as sm@28@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)))
      ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@3@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)))))))
(assert (=>
  (ite
    (and
      (img@24@01 (get $Snap.unit r@1@01))
      (Set_in (inv@23@01 (get $Snap.unit r@1@01)) (refs $Snap.unit r@1@01)))
    (< $Perm.No (* $k@22@01 $k@20@01))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)) $Snap.unit))
    (=
      ($PSF.lookup_Q (as sm@28@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)))
      ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@19@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)))))))
(assert (tester%precondition ($PSF.lookup_Q (as sm@28@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01))) (get $Snap.unit r@1@01)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@25@01))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@10@01 (get $Snap.unit r@1@01))
            (Set_in (inv@9@01 (get $Snap.unit r@1@01)) (refs $Snap.unit r@1@01)))
          (- (* $k@8@01 $k@6@01) (pTaken@16@01 (get $Snap.unit r@1@01)))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@10@01 (get $Snap.unit r@1@01))
        (Set_in (inv@9@01 (get $Snap.unit r@1@01)) (refs $Snap.unit r@1@01)))
      (<
        (ite
          (= (get $Snap.unit r@1@01) (get $Snap.unit r@1@01))
          $k@25@01
          $Perm.No)
        (- (* $k@8@01 $k@6@01) (pTaken@16@01 (get $Snap.unit r@1@01))))
      (<
        (ite
          (= (get $Snap.unit r@1@01) (get $Snap.unit r@1@01))
          $k@25@01
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (and
        (img@10@01 (get $Snap.unit r@1@01))
        (Set_in (inv@9@01 (get $Snap.unit r@1@01)) (refs $Snap.unit r@1@01)))
      (< $Perm.No (- (* $k@8@01 $k@6@01) (pTaken@16@01 (get $Snap.unit r@1@01))))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)) $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@28@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)))
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@3@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01))))))
  (=>
    (ite
      (and
        (img@24@01 (get $Snap.unit r@1@01))
        (Set_in (inv@23@01 (get $Snap.unit r@1@01)) (refs $Snap.unit r@1@01)))
      (< $Perm.No (* $k@22@01 $k@20@01))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)) $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@28@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01)))
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@19@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01))))))
  (tester%precondition ($PSF.lookup_Q (as sm@28@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01))) (get $Snap.unit r@1@01))))
(declare-const r2@30@01 $Ref)
(assert (=
  r2@30@01
  (tester ($PSF.lookup_Q (as sm@28@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@1@01))) (get $Snap.unit r@1@01))))
; [exec]
; r3 := testerFull(get(r))
; [eval] testerFull(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@1@01))
    ($Perm.min
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
        (- (* $k@8@01 $k@6@01) (pTaken@16@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@32@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@1@01))
    ($Perm.min
      (ite
        (and (img@24@01 r) (Set_in (inv@23@01 r) (refs $Snap.unit r@1@01)))
        (* $k@22@01 $k@20@01)
        $Perm.No)
      (- $Perm.Write (pTaken@31@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
        (- (* $k@8@01 $k@6@01) (pTaken@16@01 r))
        $Perm.No)
      (pTaken@31@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@31@01 r) $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@1@01))
    (= (- $Perm.Write (pTaken@31@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@24@01 r) (Set_in (inv@23@01 r) (refs $Snap.unit r@1@01)))
        (* $k@22@01 $k@20@01)
        $Perm.No)
      (pTaken@32@01 r))
    $Perm.No)
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@32@01 r) $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@1@01))
    (= (- (- $Perm.Write (pTaken@31@01 r)) (pTaken@32@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@1@01))
    (= (- (- $Perm.Write (pTaken@31@01 r)) (pTaken@32@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@7@01 e@21@01)
    (=
      (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
      (and (img@24@01 r) (Set_in (inv@23@01 r) (refs $Snap.unit r@1@01)))))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@1@01))
    ($Perm.min
      (ite
        (and (img@24@01 r) (Set_in (inv@23@01 r) (refs $Snap.unit r@1@01)))
        (* $k@22@01 $k@20@01)
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@1@01))
    ($Perm.min
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
        (- (* $k@8@01 $k@6@01) (pTaken@16@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@33@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@24@01 r) (Set_in (inv@23@01 r) (refs $Snap.unit r@1@01)))
        (* $k@22@01 $k@20@01)
        $Perm.No)
      (pTaken@33@01 r))
    $Perm.No)
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@33@01 r) $Perm.No)
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@1@01))
    (= (- $Perm.Write (pTaken@33@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) (refs $Snap.unit r@1@01)))
        (- (* $k@8@01 $k@6@01) (pTaken@16@01 r))
        $Perm.No)
      (pTaken@34@01 r))
    $Perm.No)
  
  :qid |quant-u-46|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@34@01 r) $Perm.No)
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@1@01))
    (= (- (- $Perm.Write (pTaken@33@01 r)) (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@1@01))
    (= (- (- $Perm.Write (pTaken@33@01 r)) (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- pred2 ----------
(declare-const r@35@01 $Ref)
(declare-const r@36@01 $Ref)
(push) ; 1
(declare-const $t@37@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var r2: Ref
(declare-const r2@38@01 $Ref)
; [exec]
; var r3: Ref
(declare-const r3@39@01 $Ref)
; [exec]
; unfold acc(P(r), write)
(declare-const e@40@01 $Ref)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@36@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@36@01))
(assert (Set_in e@40@01 (refs $Snap.unit r@36@01)))
(declare-const $k@41@01 $Perm)
(assert ($Perm.isReadVar $k@41@01))
(pop) ; 3
(declare-fun inv@42@01 ($Ref) $Ref)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@41@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@40@01 $Ref)) (!
  (=>
    (Set_in e@40@01 (refs $Snap.unit r@36@01))
    (refs%precondition $Snap.unit r@36@01))
  :pattern ((Set_in e@40@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@42@01 e@40@01))
  :pattern ((img@43@01 e@40@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@40@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@36@01)
      (Set_in e@40@01 (refs $Snap.unit r@36@01)))
    (or (= $k@41@01 $Perm.No) (< $Perm.No $k@41@01)))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@40@01 $Ref) (e2@40@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@36@01)
    (=>
      (and (Set_in e1@40@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@41@01))
      (refs%precondition $Snap.unit r@36@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@40@01 $Ref) (e2@40@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@40@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@41@01))
      (and (Set_in e2@40@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@41@01))
      (= e1@40@01 e2@40@01))
    (= e1@40@01 e2@40@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@40@01 $Ref)) (!
  (refs%precondition $Snap.unit r@36@01)
  :pattern ((Set_in e@40@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@42@01 e@40@01))
  :pattern ((img@43@01 e@40@01))
  :qid |quant-u-50|)))
(assert (forall ((r $Ref)) (!
  (=> (img@43@01 r) (refs%precondition $Snap.unit r@36@01))
  :pattern ((inv@42@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@40@01 $Ref)) (!
  (=>
    (and (Set_in e@40@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@41@01))
    (and (= (inv@42@01 e@40@01) e@40@01) (img@43@01 e@40@01)))
  :pattern ((Set_in e@40@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@42@01 e@40@01))
  :pattern ((img@43@01 e@40@01))
  :qid |quant-u-50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@01 r)
      (and
        (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01))
        (< $Perm.No $k@41@01)))
    (= (inv@42@01 r) r))
  :pattern ((inv@42@01 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@40@01 $Ref)) (!
  (<= $Perm.No $k@41@01)
  :pattern ((Set_in e@40@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@42@01 e@40@01))
  :pattern ((img@43@01 e@40@01))
  :qid |Q-permAtLeastZero|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@37@01 r@36@01))
; [exec]
; fold acc(P(r), write)
(declare-const e@44@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@36@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@36@01))
(assert (Set_in e@44@01 (refs $Snap.unit r@36@01)))
(declare-const $k@45@01 $Perm)
(assert ($Perm.isReadVar $k@45@01))
(pop) ; 3
(declare-fun inv@46@01 ($Ref) $Ref)
(declare-fun img@47@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@45@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@44@01 $Ref)) (!
  (=>
    (Set_in e@44@01 (refs $Snap.unit r@36@01))
    (refs%precondition $Snap.unit r@36@01))
  :pattern ((Set_in e@44@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@46@01 e@44@01))
  :pattern ((img@47@01 e@44@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@44@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@36@01)
      (Set_in e@44@01 (refs $Snap.unit r@36@01)))
    (or (= $k@45@01 $Perm.No) (< $Perm.No $k@45@01)))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@44@01 $Ref) (e2@44@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@36@01)
    (=>
      (and (Set_in e1@44@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@45@01))
      (refs%precondition $Snap.unit r@36@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@44@01 $Ref) (e2@44@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@44@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@45@01))
      (and (Set_in e2@44@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@45@01))
      (= e1@44@01 e2@44@01))
    (= e1@44@01 e2@44@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@44@01 $Ref)) (!
  (refs%precondition $Snap.unit r@36@01)
  :pattern ((Set_in e@44@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@46@01 e@44@01))
  :pattern ((img@47@01 e@44@01))
  :qid |Q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (img@47@01 r) (refs%precondition $Snap.unit r@36@01))
  :pattern ((inv@46@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@44@01 $Ref)) (!
  (=>
    (and (Set_in e@44@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@45@01))
    (and (= (inv@46@01 e@44@01) e@44@01) (img@47@01 e@44@01)))
  :pattern ((Set_in e@44@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@46@01 e@44@01))
  :pattern ((img@47@01 e@44@01))
  :qid |Q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@01 r)
      (and
        (Set_in (inv@46@01 r) (refs $Snap.unit r@36@01))
        (< $Perm.No $k@45@01)))
    (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |Q-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@46@01 r) (refs $Snap.unit r@36@01))
      (img@47@01 r)
      (= r (inv@46@01 r)))
    ($Perm.min
      (ite
        (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
        $k@41@01
        $Perm.No)
      $k@45@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@45@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
          $k@41@01
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
      (<
        (ite
          (and
            (Set_in (inv@46@01 r) (refs $Snap.unit r@36@01))
            (img@47@01 r)
            (= r (inv@46@01 r)))
          $k@45@01
          $Perm.No)
        $k@41@01)
      (<
        (ite
          (and
            (Set_in (inv@46@01 r) (refs $Snap.unit r@36@01))
            (img@47@01 r)
            (= r (inv@46@01 r)))
          $k@45@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@43@01 r))
  :pattern ((Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
  :pattern ((Set_in (inv@46@01 r) (refs $Snap.unit r@36@01)))
  :pattern ((img@47@01 r))
  :qid |qp.srp6|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@46@01 r) (refs $Snap.unit r@36@01))
      (img@47@01 r)
      (= r (inv@46@01 r)))
    (= (- $k@45@01 (pTaken@48@01 r)) $Perm.No))
  
  :qid |quant-u-54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $PSF<Q>)
(declare-const s@50@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@50@01 $Snap)) (!
  (and
    (=>
      (Set_in s@50@01 ($PSF.domain_Q (as sm@49@01  $PSF<Q>)))
      (and
        (Set_in (inv@46@01 ($SortWrappers.$SnapTo$Ref s@50@01)) (refs $Snap.unit r@36@01))
        (< $Perm.No $k@45@01)
        (img@47@01 ($SortWrappers.$SnapTo$Ref s@50@01))))
    (=>
      (and
        (Set_in (inv@46@01 ($SortWrappers.$SnapTo$Ref s@50@01)) (refs $Snap.unit r@36@01))
        (< $Perm.No $k@45@01)
        (img@47@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
      (Set_in s@50@01 ($PSF.domain_Q (as sm@49@01  $PSF<Q>)))))
  :pattern ((Set_in s@50@01 ($PSF.domain_Q (as sm@49@01  $PSF<Q>))))
  :qid |qp.psmDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@50@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@46@01 ($SortWrappers.$SnapTo$Ref s@50@01)) (refs $Snap.unit r@36@01))
        (< $Perm.No $k@45@01)
        (img@47@01 ($SortWrappers.$SnapTo$Ref s@50@01)))
      (ite
        (and
          (img@43@01 ($SortWrappers.$SnapTo$Ref s@50@01))
          (Set_in (inv@42@01 ($SortWrappers.$SnapTo$Ref s@50@01)) (refs $Snap.unit r@36@01)))
        (< $Perm.No $k@41@01)
        false))
    (and
      (not (= s@50@01 $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@49@01  $PSF<Q>) s@50@01)
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@37@01) s@50@01))))
  :pattern (($PSF.lookup_Q (as sm@49@01  $PSF<Q>) s@50@01))
  :pattern (($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@37@01) s@50@01))
  :qid |qp.psmValDef7|)))
(assert (P%trigger ($SortWrappers.$PSF<Q>To$Snap (as sm@49@01  $PSF<Q>)) r@36@01))
; [exec]
; unfold acc(P(r), write)
(declare-const e@51@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@36@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@36@01))
(assert (Set_in e@51@01 (refs $Snap.unit r@36@01)))
(declare-const $k@52@01 $Perm)
(assert ($Perm.isReadVar $k@52@01))
(pop) ; 3
(declare-fun inv@53@01 ($Ref) $Ref)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@52@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@51@01 $Ref)) (!
  (=>
    (Set_in e@51@01 (refs $Snap.unit r@36@01))
    (refs%precondition $Snap.unit r@36@01))
  :pattern ((Set_in e@51@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@53@01 e@51@01))
  :pattern ((img@54@01 e@51@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@51@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@36@01)
      (Set_in e@51@01 (refs $Snap.unit r@36@01)))
    (or (= $k@52@01 $Perm.No) (< $Perm.No $k@52@01)))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@51@01 $Ref) (e2@51@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@36@01)
    (=>
      (and (Set_in e1@51@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@52@01))
      (refs%precondition $Snap.unit r@36@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@51@01 $Ref) (e2@51@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@51@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@52@01))
      (and (Set_in e2@51@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@52@01))
      (= e1@51@01 e2@51@01))
    (= e1@51@01 e2@51@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@51@01 $Ref)) (!
  (refs%precondition $Snap.unit r@36@01)
  :pattern ((Set_in e@51@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@53@01 e@51@01))
  :pattern ((img@54@01 e@51@01))
  :qid |quant-u-56|)))
(assert (forall ((r $Ref)) (!
  (=> (img@54@01 r) (refs%precondition $Snap.unit r@36@01))
  :pattern ((inv@53@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@51@01 $Ref)) (!
  (=>
    (and (Set_in e@51@01 (refs $Snap.unit r@36@01)) (< $Perm.No $k@52@01))
    (and (= (inv@53@01 e@51@01) e@51@01) (img@54@01 e@51@01)))
  :pattern ((Set_in e@51@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@53@01 e@51@01))
  :pattern ((img@54@01 e@51@01))
  :qid |quant-u-56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@01 r)
      (and
        (Set_in (inv@53@01 r) (refs $Snap.unit r@36@01))
        (< $Perm.No $k@52@01)))
    (= (inv@53@01 r) r))
  :pattern ((inv@53@01 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@51@01 $Ref)) (!
  (<= $Perm.No $k@52@01)
  :pattern ((Set_in e@51@01 (refs $Snap.unit r@36@01)))
  :pattern ((inv@53@01 e@51@01))
  :pattern ((img@54@01 e@51@01))
  :qid |Q-permAtLeastZero|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@51@01 e@40@01)
    (=
      (and (img@54@01 r) (Set_in (inv@53@01 r) (refs $Snap.unit r@36@01)))
      (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))))
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; r2 := tester(get(r))
; [eval] tester(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition $Snap.unit r@36@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition $Snap.unit r@36@01))
(push) ; 3
(declare-const $k@55@01 $Perm)
(assert ($Perm.isReadVar $k@55@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@36@01))
    ($Perm.min
      (ite
        (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
        (- $k@41@01 (pTaken@48@01 r))
        $Perm.No)
      $k@55@01)
    $Perm.No))
(define-fun pTaken@57@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@36@01))
    ($Perm.min
      (ite
        (and (img@54@01 r) (Set_in (inv@53@01 r) (refs $Snap.unit r@36@01)))
        $k@52@01
        $Perm.No)
      (- $k@55@01 (pTaken@56@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@55@01
(assert (=>
  (not
    (=
      (ite
        (and
          (img@43@01 (get $Snap.unit r@36@01))
          (Set_in (inv@42@01 (get $Snap.unit r@36@01)) (refs $Snap.unit r@36@01)))
        (- $k@41@01 (pTaken@48@01 (get $Snap.unit r@36@01)))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@43@01 (get $Snap.unit r@36@01))
      (Set_in (inv@42@01 (get $Snap.unit r@36@01)) (refs $Snap.unit r@36@01)))
    (<
      (ite
        (= (get $Snap.unit r@36@01) (get $Snap.unit r@36@01))
        $k@55@01
        $Perm.No)
      (- $k@41@01 (pTaken@48@01 (get $Snap.unit r@36@01))))
    (<
      (ite
        (= (get $Snap.unit r@36@01) (get $Snap.unit r@36@01))
        $k@55@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r (get $Snap.unit r@36@01)) (= (- $k@55@01 (pTaken@56@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@58@01 $PSF<Q>)
(declare-const s@59@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@43@01 (get $Snap.unit r@36@01))
      (Set_in (inv@42@01 (get $Snap.unit r@36@01)) (refs $Snap.unit r@36@01)))
    (< $Perm.No (- $k@41@01 (pTaken@48@01 (get $Snap.unit r@36@01))))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)) $Snap.unit))
    (=
      ($PSF.lookup_Q (as sm@58@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)))
      ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@37@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)))))))
(assert (=>
  (ite
    (and
      (img@54@01 (get $Snap.unit r@36@01))
      (Set_in (inv@53@01 (get $Snap.unit r@36@01)) (refs $Snap.unit r@36@01)))
    (< $Perm.No $k@52@01)
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)) $Snap.unit))
    (=
      ($PSF.lookup_Q (as sm@58@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)))
      ($PSF.lookup_Q (as sm@49@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)))))))
(assert (tester%precondition ($PSF.lookup_Q (as sm@58@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01))) (get $Snap.unit r@36@01)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@55@01))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@43@01 (get $Snap.unit r@36@01))
            (Set_in (inv@42@01 (get $Snap.unit r@36@01)) (refs $Snap.unit r@36@01)))
          (- $k@41@01 (pTaken@48@01 (get $Snap.unit r@36@01)))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@43@01 (get $Snap.unit r@36@01))
        (Set_in (inv@42@01 (get $Snap.unit r@36@01)) (refs $Snap.unit r@36@01)))
      (<
        (ite
          (= (get $Snap.unit r@36@01) (get $Snap.unit r@36@01))
          $k@55@01
          $Perm.No)
        (- $k@41@01 (pTaken@48@01 (get $Snap.unit r@36@01))))
      (<
        (ite
          (= (get $Snap.unit r@36@01) (get $Snap.unit r@36@01))
          $k@55@01
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (and
        (img@43@01 (get $Snap.unit r@36@01))
        (Set_in (inv@42@01 (get $Snap.unit r@36@01)) (refs $Snap.unit r@36@01)))
      (< $Perm.No (- $k@41@01 (pTaken@48@01 (get $Snap.unit r@36@01))))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)) $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@58@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)))
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@37@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01))))))
  (=>
    (ite
      (and
        (img@54@01 (get $Snap.unit r@36@01))
        (Set_in (inv@53@01 (get $Snap.unit r@36@01)) (refs $Snap.unit r@36@01)))
      (< $Perm.No $k@52@01)
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)) $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@58@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01)))
        ($PSF.lookup_Q (as sm@49@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01))))))
  (tester%precondition ($PSF.lookup_Q (as sm@58@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01))) (get $Snap.unit r@36@01))))
(declare-const r2@60@01 $Ref)
(assert (=
  r2@60@01
  (tester ($PSF.lookup_Q (as sm@58@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@36@01))) (get $Snap.unit r@36@01))))
; [exec]
; r3 := testerFull(get(r))
; [eval] testerFull(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@36@01))
    ($Perm.min
      (ite
        (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
        (- $k@41@01 (pTaken@48@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@36@01))
    ($Perm.min
      (ite
        (and (img@54@01 r) (Set_in (inv@53@01 r) (refs $Snap.unit r@36@01)))
        $k@52@01
        $Perm.No)
      (- $Perm.Write (pTaken@61@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
        (- $k@41@01 (pTaken@48@01 r))
        $Perm.No)
      (pTaken@61@01 r))
    $Perm.No)
  
  :qid |quant-u-62|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@61@01 r) $Perm.No)
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@36@01))
    (= (- $Perm.Write (pTaken@61@01 r)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@54@01 r) (Set_in (inv@53@01 r) (refs $Snap.unit r@36@01)))
        $k@52@01
        $Perm.No)
      (pTaken@62@01 r))
    $Perm.No)
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@62@01 r) $Perm.No)
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@36@01))
    (= (- (- $Perm.Write (pTaken@61@01 r)) (pTaken@62@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@36@01))
    (= (- (- $Perm.Write (pTaken@61@01 r)) (pTaken@62@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@40@01 e@51@01)
    (=
      (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
      (and (img@54@01 r) (Set_in (inv@53@01 r) (refs $Snap.unit r@36@01)))))
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@36@01))
    ($Perm.min
      (ite
        (and (img@54@01 r) (Set_in (inv@53@01 r) (refs $Snap.unit r@36@01)))
        $k@52@01
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@36@01))
    ($Perm.min
      (ite
        (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
        (- $k@41@01 (pTaken@48@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@63@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@54@01 r) (Set_in (inv@53@01 r) (refs $Snap.unit r@36@01)))
        $k@52@01
        $Perm.No)
      (pTaken@63@01 r))
    $Perm.No)
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@63@01 r) $Perm.No)
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@36@01))
    (= (- $Perm.Write (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@43@01 r) (Set_in (inv@42@01 r) (refs $Snap.unit r@36@01)))
        (- $k@41@01 (pTaken@48@01 r))
        $Perm.No)
      (pTaken@64@01 r))
    $Perm.No)
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@64@01 r) $Perm.No)
  
  :qid |quant-u-74|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@36@01))
    (= (- (- $Perm.Write (pTaken@63@01 r)) (pTaken@64@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@36@01))
    (= (- (- $Perm.Write (pTaken@63@01 r)) (pTaken@64@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- pred3 ----------
(declare-const r@65@01 $Ref)
(declare-const r@66@01 $Ref)
(push) ; 1
(declare-const $t@67@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var r2: Ref
(declare-const r2@68@01 $Ref)
; [exec]
; var r3: Ref
(declare-const r3@69@01 $Ref)
; [exec]
; unfold acc(P(r), 1 / 2)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@70@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@66@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@66@01))
(assert (Set_in e@70@01 (refs $Snap.unit r@66@01)))
(declare-const $k@71@01 $Perm)
(assert ($Perm.isReadVar $k@71@01))
(pop) ; 3
(declare-fun inv@72@01 ($Ref) $Ref)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@71@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@70@01 $Ref)) (!
  (=>
    (Set_in e@70@01 (refs $Snap.unit r@66@01))
    (refs%precondition $Snap.unit r@66@01))
  :pattern ((Set_in e@70@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@72@01 e@70@01))
  :pattern ((img@73@01 e@70@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@70@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@66@01)
      (Set_in e@70@01 (refs $Snap.unit r@66@01)))
    (or (= $k@71@01 $Perm.No) (< $Perm.No $k@71@01)))
  
  :qid |quant-u-76|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@70@01 $Ref) (e2@70@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@66@01)
    (=>
      (and (Set_in e1@70@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@71@01))
      (refs%precondition $Snap.unit r@66@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@70@01 $Ref) (e2@70@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@70@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@71@01))
      (and (Set_in e2@70@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@71@01))
      (= e1@70@01 e2@70@01))
    (= e1@70@01 e2@70@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@70@01 $Ref)) (!
  (refs%precondition $Snap.unit r@66@01)
  :pattern ((Set_in e@70@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@72@01 e@70@01))
  :pattern ((img@73@01 e@70@01))
  :qid |quant-u-77|)))
(assert (forall ((r $Ref)) (!
  (=> (img@73@01 r) (refs%precondition $Snap.unit r@66@01))
  :pattern ((inv@72@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@70@01 $Ref)) (!
  (=>
    (and
      (Set_in e@70@01 (refs $Snap.unit r@66@01))
      (< $Perm.No (* $k@71@01 (/ (to_real 1) (to_real 2)))))
    (and (= (inv@72@01 e@70@01) e@70@01) (img@73@01 e@70@01)))
  :pattern ((Set_in e@70@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@72@01 e@70@01))
  :pattern ((img@73@01 e@70@01))
  :qid |quant-u-77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@73@01 r)
      (and
        (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01))
        (< $Perm.No (* $k@71@01 (/ (to_real 1) (to_real 2))))))
    (= (inv@72@01 r) r))
  :pattern ((inv@72@01 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@70@01 $Ref)) (!
  (<= $Perm.No (* $k@71@01 (/ (to_real 1) (to_real 2))))
  :pattern ((Set_in e@70@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@72@01 e@70@01))
  :pattern ((img@73@01 e@70@01))
  :qid |Q-permAtLeastZero|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@67@01 r@66@01))
; [exec]
; fold acc(P(r), 1 / 2)
(declare-const e@74@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@66@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@66@01))
(assert (Set_in e@74@01 (refs $Snap.unit r@66@01)))
(declare-const $k@75@01 $Perm)
(assert ($Perm.isReadVar $k@75@01))
(pop) ; 3
(declare-fun inv@76@01 ($Ref) $Ref)
(declare-fun img@77@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@75@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@74@01 $Ref)) (!
  (=>
    (Set_in e@74@01 (refs $Snap.unit r@66@01))
    (refs%precondition $Snap.unit r@66@01))
  :pattern ((Set_in e@74@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@76@01 e@74@01))
  :pattern ((img@77@01 e@74@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@74@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@66@01)
      (Set_in e@74@01 (refs $Snap.unit r@66@01)))
    (or (= $k@75@01 $Perm.No) (< $Perm.No $k@75@01)))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@74@01 $Ref) (e2@74@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@66@01)
    (=>
      (and (Set_in e1@74@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@75@01))
      (refs%precondition $Snap.unit r@66@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@74@01 $Ref) (e2@74@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@74@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@75@01))
      (and (Set_in e2@74@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@75@01))
      (= e1@74@01 e2@74@01))
    (= e1@74@01 e2@74@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@74@01 $Ref)) (!
  (refs%precondition $Snap.unit r@66@01)
  :pattern ((Set_in e@74@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@76@01 e@74@01))
  :pattern ((img@77@01 e@74@01))
  :qid |Q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (img@77@01 r) (refs%precondition $Snap.unit r@66@01))
  :pattern ((inv@76@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@74@01 $Ref)) (!
  (=>
    (and (Set_in e@74@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@75@01))
    (and (= (inv@76@01 e@74@01) e@74@01) (img@77@01 e@74@01)))
  :pattern ((Set_in e@74@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@76@01 e@74@01))
  :pattern ((img@77@01 e@74@01))
  :qid |Q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@77@01 r)
      (and
        (Set_in (inv@76@01 r) (refs $Snap.unit r@66@01))
        (< $Perm.No $k@75@01)))
    (= (inv@76@01 r) r))
  :pattern ((inv@76@01 r))
  :qid |Q-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@76@01 r) (refs $Snap.unit r@66@01))
      (img@77@01 r)
      (= r (inv@76@01 r)))
    ($Perm.min
      (ite
        (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
        (* $k@71@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (* $k@75@01 (/ (to_real 1) (to_real 2))))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@75@01 * 1/2
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
          (* $k@71@01 (/ (to_real 1) (to_real 2)))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
      (<
        (ite
          (and
            (Set_in (inv@76@01 r) (refs $Snap.unit r@66@01))
            (img@77@01 r)
            (= r (inv@76@01 r)))
          (* $k@75@01 (/ (to_real 1) (to_real 2)))
          $Perm.No)
        (* $k@71@01 (/ (to_real 1) (to_real 2))))
      (<
        (ite
          (and
            (Set_in (inv@76@01 r) (refs $Snap.unit r@66@01))
            (img@77@01 r)
            (= r (inv@76@01 r)))
          (* $k@75@01 (/ (to_real 1) (to_real 2)))
          $Perm.No)
        $Perm.No)))
  :pattern ((img@73@01 r))
  :pattern ((Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
  :pattern ((Set_in (inv@76@01 r) (refs $Snap.unit r@66@01)))
  :pattern ((img@77@01 r))
  :qid |qp.srp12|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@76@01 r) (refs $Snap.unit r@66@01))
      (img@77@01 r)
      (= r (inv@76@01 r)))
    (= (- (* $k@75@01 (/ (to_real 1) (to_real 2))) (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@79@01 $PSF<Q>)
(declare-const s@80@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@80@01 $Snap)) (!
  (and
    (=>
      (Set_in s@80@01 ($PSF.domain_Q (as sm@79@01  $PSF<Q>)))
      (and
        (Set_in (inv@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (refs $Snap.unit r@66@01))
        (< $Perm.No (* $k@75@01 (/ (to_real 1) (to_real 2))))
        (img@77@01 ($SortWrappers.$SnapTo$Ref s@80@01))))
    (=>
      (and
        (Set_in (inv@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (refs $Snap.unit r@66@01))
        (< $Perm.No (* $k@75@01 (/ (to_real 1) (to_real 2))))
        (img@77@01 ($SortWrappers.$SnapTo$Ref s@80@01)))
      (Set_in s@80@01 ($PSF.domain_Q (as sm@79@01  $PSF<Q>)))))
  :pattern ((Set_in s@80@01 ($PSF.domain_Q (as sm@79@01  $PSF<Q>))))
  :qid |qp.psmDomDef14|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@80@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@76@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (refs $Snap.unit r@66@01))
        (< $Perm.No (* $k@75@01 (/ (to_real 1) (to_real 2))))
        (img@77@01 ($SortWrappers.$SnapTo$Ref s@80@01)))
      (ite
        (and
          (img@73@01 ($SortWrappers.$SnapTo$Ref s@80@01))
          (Set_in (inv@72@01 ($SortWrappers.$SnapTo$Ref s@80@01)) (refs $Snap.unit r@66@01)))
        (< $Perm.No (* $k@71@01 (/ (to_real 1) (to_real 2))))
        false))
    (and
      (not (= s@80@01 $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@79@01  $PSF<Q>) s@80@01)
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@67@01) s@80@01))))
  :pattern (($PSF.lookup_Q (as sm@79@01  $PSF<Q>) s@80@01))
  :pattern (($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@67@01) s@80@01))
  :qid |qp.psmValDef13|)))
(assert (P%trigger ($SortWrappers.$PSF<Q>To$Snap (as sm@79@01  $PSF<Q>)) r@66@01))
(assert (= $t@67@01 ($SortWrappers.$PSF<Q>To$Snap (as sm@79@01  $PSF<Q>))))
; [exec]
; unfold acc(P(r), 1 / 2)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@81@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@66@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@66@01))
(assert (Set_in e@81@01 (refs $Snap.unit r@66@01)))
(declare-const $k@82@01 $Perm)
(assert ($Perm.isReadVar $k@82@01))
(pop) ; 3
(declare-fun inv@83@01 ($Ref) $Ref)
(declare-fun img@84@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@82@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@81@01 $Ref)) (!
  (=>
    (Set_in e@81@01 (refs $Snap.unit r@66@01))
    (refs%precondition $Snap.unit r@66@01))
  :pattern ((Set_in e@81@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@83@01 e@81@01))
  :pattern ((img@84@01 e@81@01))
  :qid |Q-aux|)))
(push) ; 3
(assert (not (forall ((e@81@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@66@01)
      (Set_in e@81@01 (refs $Snap.unit r@66@01)))
    (or (= $k@82@01 $Perm.No) (< $Perm.No $k@82@01)))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@81@01 $Ref) (e2@81@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@66@01)
    (=>
      (and (Set_in e1@81@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@82@01))
      (refs%precondition $Snap.unit r@66@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@81@01 $Ref) (e2@81@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@81@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@82@01))
      (and (Set_in e2@81@01 (refs $Snap.unit r@66@01)) (< $Perm.No $k@82@01))
      (= e1@81@01 e2@81@01))
    (= e1@81@01 e2@81@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@81@01 $Ref)) (!
  (refs%precondition $Snap.unit r@66@01)
  :pattern ((Set_in e@81@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@83@01 e@81@01))
  :pattern ((img@84@01 e@81@01))
  :qid |quant-u-83|)))
(assert (forall ((r $Ref)) (!
  (=> (img@84@01 r) (refs%precondition $Snap.unit r@66@01))
  :pattern ((inv@83@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@81@01 $Ref)) (!
  (=>
    (and
      (Set_in e@81@01 (refs $Snap.unit r@66@01))
      (< $Perm.No (* $k@82@01 (/ (to_real 1) (to_real 2)))))
    (and (= (inv@83@01 e@81@01) e@81@01) (img@84@01 e@81@01)))
  :pattern ((Set_in e@81@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@83@01 e@81@01))
  :pattern ((img@84@01 e@81@01))
  :qid |quant-u-83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@84@01 r)
      (and
        (Set_in (inv@83@01 r) (refs $Snap.unit r@66@01))
        (< $Perm.No (* $k@82@01 (/ (to_real 1) (to_real 2))))))
    (= (inv@83@01 r) r))
  :pattern ((inv@83@01 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@81@01 $Ref)) (!
  (<= $Perm.No (* $k@82@01 (/ (to_real 1) (to_real 2))))
  :pattern ((Set_in e@81@01 (refs $Snap.unit r@66@01)))
  :pattern ((inv@83@01 e@81@01))
  :pattern ((img@84@01 e@81@01))
  :qid |Q-permAtLeastZero|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@81@01 e@70@01)
    (=
      (and (img@84@01 r) (Set_in (inv@83@01 r) (refs $Snap.unit r@66@01)))
      (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))))
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; r2 := tester(get(r))
; [eval] tester(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition $Snap.unit r@66@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition $Snap.unit r@66@01))
(push) ; 3
(declare-const $k@85@01 $Perm)
(assert ($Perm.isReadVar $k@85@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@86@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@66@01))
    ($Perm.min
      (ite
        (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
        (- (* $k@71@01 (/ (to_real 1) (to_real 2))) (pTaken@78@01 r))
        $Perm.No)
      $k@85@01)
    $Perm.No))
(define-fun pTaken@87@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@66@01))
    ($Perm.min
      (ite
        (and (img@84@01 r) (Set_in (inv@83@01 r) (refs $Snap.unit r@66@01)))
        (* $k@82@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (- $k@85@01 (pTaken@86@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@85@01
(assert (=>
  (not
    (=
      (ite
        (and
          (img@73@01 (get $Snap.unit r@66@01))
          (Set_in (inv@72@01 (get $Snap.unit r@66@01)) (refs $Snap.unit r@66@01)))
        (-
          (* $k@71@01 (/ (to_real 1) (to_real 2)))
          (pTaken@78@01 (get $Snap.unit r@66@01)))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@73@01 (get $Snap.unit r@66@01))
      (Set_in (inv@72@01 (get $Snap.unit r@66@01)) (refs $Snap.unit r@66@01)))
    (<
      (ite
        (= (get $Snap.unit r@66@01) (get $Snap.unit r@66@01))
        $k@85@01
        $Perm.No)
      (-
        (* $k@71@01 (/ (to_real 1) (to_real 2)))
        (pTaken@78@01 (get $Snap.unit r@66@01))))
    (<
      (ite
        (= (get $Snap.unit r@66@01) (get $Snap.unit r@66@01))
        $k@85@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r (get $Snap.unit r@66@01)) (= (- $k@85@01 (pTaken@86@01 r)) $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@88@01 $PSF<Q>)
(declare-const s@89@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@73@01 (get $Snap.unit r@66@01))
      (Set_in (inv@72@01 (get $Snap.unit r@66@01)) (refs $Snap.unit r@66@01)))
    (<
      $Perm.No
      (-
        (* $k@71@01 (/ (to_real 1) (to_real 2)))
        (pTaken@78@01 (get $Snap.unit r@66@01))))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)) $Snap.unit))
    (=
      ($PSF.lookup_Q (as sm@88@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)))
      ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@67@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)))))))
(assert (=>
  (ite
    (and
      (img@84@01 (get $Snap.unit r@66@01))
      (Set_in (inv@83@01 (get $Snap.unit r@66@01)) (refs $Snap.unit r@66@01)))
    (< $Perm.No (* $k@82@01 (/ (to_real 1) (to_real 2))))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)) $Snap.unit))
    (=
      ($PSF.lookup_Q (as sm@88@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)))
      ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@67@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)))))))
(assert (tester%precondition ($PSF.lookup_Q (as sm@88@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01))) (get $Snap.unit r@66@01)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@85@01))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@73@01 (get $Snap.unit r@66@01))
            (Set_in (inv@72@01 (get $Snap.unit r@66@01)) (refs $Snap.unit r@66@01)))
          (-
            (* $k@71@01 (/ (to_real 1) (to_real 2)))
            (pTaken@78@01 (get $Snap.unit r@66@01)))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@73@01 (get $Snap.unit r@66@01))
        (Set_in (inv@72@01 (get $Snap.unit r@66@01)) (refs $Snap.unit r@66@01)))
      (<
        (ite
          (= (get $Snap.unit r@66@01) (get $Snap.unit r@66@01))
          $k@85@01
          $Perm.No)
        (-
          (* $k@71@01 (/ (to_real 1) (to_real 2)))
          (pTaken@78@01 (get $Snap.unit r@66@01))))
      (<
        (ite
          (= (get $Snap.unit r@66@01) (get $Snap.unit r@66@01))
          $k@85@01
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (and
        (img@73@01 (get $Snap.unit r@66@01))
        (Set_in (inv@72@01 (get $Snap.unit r@66@01)) (refs $Snap.unit r@66@01)))
      (<
        $Perm.No
        (-
          (* $k@71@01 (/ (to_real 1) (to_real 2)))
          (pTaken@78@01 (get $Snap.unit r@66@01))))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)) $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@88@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)))
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@67@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01))))))
  (=>
    (ite
      (and
        (img@84@01 (get $Snap.unit r@66@01))
        (Set_in (inv@83@01 (get $Snap.unit r@66@01)) (refs $Snap.unit r@66@01)))
      (< $Perm.No (* $k@82@01 (/ (to_real 1) (to_real 2))))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)) $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@88@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01)))
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@67@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01))))))
  (tester%precondition ($PSF.lookup_Q (as sm@88@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01))) (get $Snap.unit r@66@01))))
(declare-const r2@90@01 $Ref)
(assert (=
  r2@90@01
  (tester ($PSF.lookup_Q (as sm@88@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@66@01))) (get $Snap.unit r@66@01))))
; [exec]
; r3 := testerFull(get(r))
; [eval] testerFull(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@91@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@66@01))
    ($Perm.min
      (ite
        (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
        (- (* $k@71@01 (/ (to_real 1) (to_real 2))) (pTaken@78@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@92@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@66@01))
    ($Perm.min
      (ite
        (and (img@84@01 r) (Set_in (inv@83@01 r) (refs $Snap.unit r@66@01)))
        (* $k@82@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (- $Perm.Write (pTaken@91@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
        (- (* $k@71@01 (/ (to_real 1) (to_real 2))) (pTaken@78@01 r))
        $Perm.No)
      (pTaken@91@01 r))
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
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@91@01 r) $Perm.No)
  
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@66@01))
    (= (- $Perm.Write (pTaken@91@01 r)) $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@84@01 r) (Set_in (inv@83@01 r) (refs $Snap.unit r@66@01)))
        (* $k@82@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (pTaken@92@01 r))
    $Perm.No)
  
  :qid |quant-u-92|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@92@01 r) $Perm.No)
  
  :qid |quant-u-93|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@66@01))
    (= (- (- $Perm.Write (pTaken@91@01 r)) (pTaken@92@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@66@01))
    (= (- (- $Perm.Write (pTaken@91@01 r)) (pTaken@92@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@70@01 e@81@01)
    (=
      (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
      (and (img@84@01 r) (Set_in (inv@83@01 r) (refs $Snap.unit r@66@01)))))
  
  :qid |quant-u-95|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@66@01))
    ($Perm.min
      (ite
        (and (img@84@01 r) (Set_in (inv@83@01 r) (refs $Snap.unit r@66@01)))
        (* $k@82@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@94@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@66@01))
    ($Perm.min
      (ite
        (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
        (- (* $k@71@01 (/ (to_real 1) (to_real 2))) (pTaken@78@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@93@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@84@01 r) (Set_in (inv@83@01 r) (refs $Snap.unit r@66@01)))
        (* $k@82@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (pTaken@93@01 r))
    $Perm.No)
  
  :qid |quant-u-97|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@93@01 r) $Perm.No)
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@66@01))
    (= (- $Perm.Write (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@73@01 r) (Set_in (inv@72@01 r) (refs $Snap.unit r@66@01)))
        (- (* $k@71@01 (/ (to_real 1) (to_real 2))) (pTaken@78@01 r))
        $Perm.No)
      (pTaken@94@01 r))
    $Perm.No)
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@94@01 r) $Perm.No)
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@66@01))
    (= (- (- $Perm.Write (pTaken@93@01 r)) (pTaken@94@01 r)) $Perm.No))
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@66@01))
    (= (- (- $Perm.Write (pTaken@93@01 r)) (pTaken@94@01 r)) $Perm.No))
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- pred4 ----------
(declare-const r@95@01 $Ref)
(declare-const r@96@01 $Ref)
(push) ; 1
(declare-const $t@97@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var r2: Ref
(declare-const r2@98@01 $Ref)
; [exec]
; var r3: Ref
(declare-const r3@99@01 $Ref)
; [exec]
; unfold acc(P2(r), wildcard)
(declare-const $k@100@01 $Perm)
(assert ($Perm.isReadVar $k@100@01))
(assert (< $k@100@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@100@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@100@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@101@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@96@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@96@01))
(assert (Set_in e@101@01 (refs $Snap.unit r@96@01)))
(pop) ; 3
(declare-fun inv@102@01 ($Ref) $Ref)
(declare-fun img@103@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((e@101@01 $Ref)) (!
  (=>
    (Set_in e@101@01 (refs $Snap.unit r@96@01))
    (refs%precondition $Snap.unit r@96@01))
  :pattern ((Set_in e@101@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@102@01 e@101@01))
  :pattern ((img@103@01 e@101@01))
  :qid |Q-aux|)))
; Check receiver injectivity
(assert (forall ((e1@101@01 $Ref) (e2@101@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@96@01)
    (=>
      (Set_in e1@101@01 (refs $Snap.unit r@96@01))
      (refs%precondition $Snap.unit r@96@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@101@01 $Ref) (e2@101@01 $Ref)) (!
  (=>
    (and
      (Set_in e1@101@01 (refs $Snap.unit r@96@01))
      (Set_in e2@101@01 (refs $Snap.unit r@96@01))
      (= e1@101@01 e2@101@01))
    (= e1@101@01 e2@101@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@101@01 $Ref)) (!
  (refs%precondition $Snap.unit r@96@01)
  :pattern ((Set_in e@101@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@102@01 e@101@01))
  :pattern ((img@103@01 e@101@01))
  :qid |quant-u-104|)))
(assert (forall ((r $Ref)) (!
  (=> (img@103@01 r) (refs%precondition $Snap.unit r@96@01))
  :pattern ((inv@102@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@101@01 $Ref)) (!
  (=>
    (and
      (Set_in e@101@01 (refs $Snap.unit r@96@01))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@100@01)))
    (and (= (inv@102@01 e@101@01) e@101@01) (img@103@01 e@101@01)))
  :pattern ((Set_in e@101@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@102@01 e@101@01))
  :pattern ((img@103@01 e@101@01))
  :qid |quant-u-104|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@103@01 r)
      (and
        (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@100@01))))
    (= (inv@102@01 r) r))
  :pattern ((inv@102@01 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@101@01 $Ref)) (!
  (<= $Perm.No (* (/ (to_real 1) (to_real 2)) $k@100@01))
  :pattern ((Set_in e@101@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@102@01 e@101@01))
  :pattern ((img@103@01 e@101@01))
  :qid |Q-permAtLeastZero|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P2%trigger $t@97@01 r@96@01))
; [exec]
; fold acc(P2(r), wildcard)
(declare-const $k@104@01 $Perm)
(assert ($Perm.isReadVar $k@104@01))
(declare-const e@105@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@96@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@96@01))
(assert (Set_in e@105@01 (refs $Snap.unit r@96@01)))
(pop) ; 3
(declare-fun inv@106@01 ($Ref) $Ref)
(declare-fun img@107@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((e@105@01 $Ref)) (!
  (=>
    (Set_in e@105@01 (refs $Snap.unit r@96@01))
    (refs%precondition $Snap.unit r@96@01))
  :pattern ((Set_in e@105@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@106@01 e@105@01))
  :pattern ((img@107@01 e@105@01))
  :qid |Q-aux|)))
; Check receiver injectivity
(assert (forall ((e1@105@01 $Ref) (e2@105@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@96@01)
    (=>
      (Set_in e1@105@01 (refs $Snap.unit r@96@01))
      (refs%precondition $Snap.unit r@96@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@105@01 $Ref) (e2@105@01 $Ref)) (!
  (=>
    (and
      (Set_in e1@105@01 (refs $Snap.unit r@96@01))
      (Set_in e2@105@01 (refs $Snap.unit r@96@01))
      (= e1@105@01 e2@105@01))
    (= e1@105@01 e2@105@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@105@01 $Ref)) (!
  (refs%precondition $Snap.unit r@96@01)
  :pattern ((Set_in e@105@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@106@01 e@105@01))
  :pattern ((img@107@01 e@105@01))
  :qid |Q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (img@107@01 r) (refs%precondition $Snap.unit r@96@01))
  :pattern ((inv@106@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@105@01 $Ref)) (!
  (=>
    (Set_in e@105@01 (refs $Snap.unit r@96@01))
    (and (= (inv@106@01 e@105@01) e@105@01) (img@107@01 e@105@01)))
  :pattern ((Set_in e@105@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@106@01 e@105@01))
  :pattern ((img@107@01 e@105@01))
  :qid |Q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@107@01 r) (Set_in (inv@106@01 r) (refs $Snap.unit r@96@01)))
    (= (inv@106@01 r) r))
  :pattern ((inv@106@01 r))
  :qid |Q-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@108@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@106@01 r) (refs $Snap.unit r@96@01))
      (img@107@01 r)
      (= r (inv@106@01 r)))
    ($Perm.min
      (ite
        (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
        (* (/ (to_real 1) (to_real 2)) $k@100@01)
        $Perm.No)
      (* (/ (to_real 1) (to_real 2)) $k@104@01))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions 1/2 * $k@104@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
          (* (/ (to_real 1) (to_real 2)) $k@100@01)
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
      (<
        (ite
          (and
            (Set_in (inv@106@01 r) (refs $Snap.unit r@96@01))
            (img@107@01 r)
            (= r (inv@106@01 r)))
          (* (/ (to_real 1) (to_real 2)) $k@104@01)
          $Perm.No)
        (* (/ (to_real 1) (to_real 2)) $k@100@01))
      (<
        (ite
          (and
            (Set_in (inv@106@01 r) (refs $Snap.unit r@96@01))
            (img@107@01 r)
            (= r (inv@106@01 r)))
          (* (/ (to_real 1) (to_real 2)) $k@104@01)
          $Perm.No)
        $Perm.No)))
  :pattern ((img@103@01 r))
  :pattern ((Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
  :pattern ((Set_in (inv@106@01 r) (refs $Snap.unit r@96@01)))
  :pattern ((img@107@01 r))
  :qid |qp.srp18|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@106@01 r) (refs $Snap.unit r@96@01))
      (img@107@01 r)
      (= r (inv@106@01 r)))
    (= (- (* (/ (to_real 1) (to_real 2)) $k@104@01) (pTaken@108@01 r)) $Perm.No))
  
  :qid |quant-u-108|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@109@01 $PSF<Q>)
(declare-const s@110@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@110@01 $Snap)) (!
  (and
    (=>
      (Set_in s@110@01 ($PSF.domain_Q (as sm@109@01  $PSF<Q>)))
      (and
        (Set_in (inv@106@01 ($SortWrappers.$SnapTo$Ref s@110@01)) (refs $Snap.unit r@96@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@104@01))
        (img@107@01 ($SortWrappers.$SnapTo$Ref s@110@01))))
    (=>
      (and
        (Set_in (inv@106@01 ($SortWrappers.$SnapTo$Ref s@110@01)) (refs $Snap.unit r@96@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@104@01))
        (img@107@01 ($SortWrappers.$SnapTo$Ref s@110@01)))
      (Set_in s@110@01 ($PSF.domain_Q (as sm@109@01  $PSF<Q>)))))
  :pattern ((Set_in s@110@01 ($PSF.domain_Q (as sm@109@01  $PSF<Q>))))
  :qid |qp.psmDomDef20|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@110@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@106@01 ($SortWrappers.$SnapTo$Ref s@110@01)) (refs $Snap.unit r@96@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@104@01))
        (img@107@01 ($SortWrappers.$SnapTo$Ref s@110@01)))
      (ite
        (and
          (img@103@01 ($SortWrappers.$SnapTo$Ref s@110@01))
          (Set_in (inv@102@01 ($SortWrappers.$SnapTo$Ref s@110@01)) (refs $Snap.unit r@96@01)))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@100@01))
        false))
    (and
      (not (= s@110@01 $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@109@01  $PSF<Q>) s@110@01)
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@97@01) s@110@01))))
  :pattern (($PSF.lookup_Q (as sm@109@01  $PSF<Q>) s@110@01))
  :pattern (($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@97@01) s@110@01))
  :qid |qp.psmValDef19|)))
(assert (P2%trigger ($SortWrappers.$PSF<Q>To$Snap (as sm@109@01  $PSF<Q>)) r@96@01))
(declare-const $t@111@01 $Snap)
(assert (and
  (=> (< $Perm.No (- $Perm.Write $k@100@01)) (= $t@111@01 $t@97@01))
  (=>
    (< $Perm.No $k@104@01)
    (= $t@111@01 ($SortWrappers.$PSF<Q>To$Snap (as sm@109@01  $PSF<Q>))))))
(assert (<= $Perm.No (+ (- $Perm.Write $k@100@01) $k@104@01)))
; [exec]
; unfold acc(P2(r), wildcard)
(declare-const $k@112@01 $Perm)
(assert ($Perm.isReadVar $k@112@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (+ (- $Perm.Write $k@100@01) $k@104@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@112@01 (+ (- $Perm.Write $k@100@01) $k@104@01)))
(assert (<= $Perm.No (- (+ (- $Perm.Write $k@100@01) $k@104@01) $k@112@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@112@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@113@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@96@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@96@01))
(assert (Set_in e@113@01 (refs $Snap.unit r@96@01)))
(pop) ; 3
(declare-fun inv@114@01 ($Ref) $Ref)
(declare-fun img@115@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((e@113@01 $Ref)) (!
  (=>
    (Set_in e@113@01 (refs $Snap.unit r@96@01))
    (refs%precondition $Snap.unit r@96@01))
  :pattern ((Set_in e@113@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@114@01 e@113@01))
  :pattern ((img@115@01 e@113@01))
  :qid |Q-aux|)))
; Check receiver injectivity
(assert (forall ((e1@113@01 $Ref) (e2@113@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@96@01)
    (=>
      (Set_in e1@113@01 (refs $Snap.unit r@96@01))
      (refs%precondition $Snap.unit r@96@01)))
  
  :qid |Q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@113@01 $Ref) (e2@113@01 $Ref)) (!
  (=>
    (and
      (Set_in e1@113@01 (refs $Snap.unit r@96@01))
      (Set_in e2@113@01 (refs $Snap.unit r@96@01))
      (= e1@113@01 e2@113@01))
    (= e1@113@01 e2@113@01))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@113@01 $Ref)) (!
  (refs%precondition $Snap.unit r@96@01)
  :pattern ((Set_in e@113@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@114@01 e@113@01))
  :pattern ((img@115@01 e@113@01))
  :qid |quant-u-110|)))
(assert (forall ((r $Ref)) (!
  (=> (img@115@01 r) (refs%precondition $Snap.unit r@96@01))
  :pattern ((inv@114@01 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@113@01 $Ref)) (!
  (=>
    (and
      (Set_in e@113@01 (refs $Snap.unit r@96@01))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@112@01)))
    (and (= (inv@114@01 e@113@01) e@113@01) (img@115@01 e@113@01)))
  :pattern ((Set_in e@113@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@114@01 e@113@01))
  :pattern ((img@115@01 e@113@01))
  :qid |quant-u-110|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@115@01 r)
      (and
        (Set_in (inv@114@01 r) (refs $Snap.unit r@96@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@112@01))))
    (= (inv@114@01 r) r))
  :pattern ((inv@114@01 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@113@01 $Ref)) (!
  (<= $Perm.No (* (/ (to_real 1) (to_real 2)) $k@112@01))
  :pattern ((Set_in e@113@01 (refs $Snap.unit r@96@01)))
  :pattern ((inv@114@01 e@113@01))
  :pattern ((img@115@01 e@113@01))
  :qid |Q-permAtLeastZero|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@113@01 e@101@01)
    (=
      (and (img@115@01 r) (Set_in (inv@114@01 r) (refs $Snap.unit r@96@01)))
      (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P2%trigger $t@111@01 r@96@01))
; [exec]
; r2 := tester(get(r))
; [eval] tester(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition $Snap.unit r@96@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition $Snap.unit r@96@01))
(push) ; 3
(declare-const $k@116@01 $Perm)
(assert ($Perm.isReadVar $k@116@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@117@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@96@01))
    ($Perm.min
      (ite
        (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@100@01) (pTaken@108@01 r))
        $Perm.No)
      $k@116@01)
    $Perm.No))
(define-fun pTaken@118@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@96@01))
    ($Perm.min
      (ite
        (and (img@115@01 r) (Set_in (inv@114@01 r) (refs $Snap.unit r@96@01)))
        (* (/ (to_real 1) (to_real 2)) $k@112@01)
        $Perm.No)
      (- $k@116@01 (pTaken@117@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@116@01
(assert (=>
  (not
    (=
      (ite
        (and
          (img@103@01 (get $Snap.unit r@96@01))
          (Set_in (inv@102@01 (get $Snap.unit r@96@01)) (refs $Snap.unit r@96@01)))
        (-
          (* (/ (to_real 1) (to_real 2)) $k@100@01)
          (pTaken@108@01 (get $Snap.unit r@96@01)))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@103@01 (get $Snap.unit r@96@01))
      (Set_in (inv@102@01 (get $Snap.unit r@96@01)) (refs $Snap.unit r@96@01)))
    (<
      (ite
        (= (get $Snap.unit r@96@01) (get $Snap.unit r@96@01))
        $k@116@01
        $Perm.No)
      (-
        (* (/ (to_real 1) (to_real 2)) $k@100@01)
        (pTaken@108@01 (get $Snap.unit r@96@01))))
    (<
      (ite
        (= (get $Snap.unit r@96@01) (get $Snap.unit r@96@01))
        $k@116@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@96@01))
    (= (- $k@116@01 (pTaken@117@01 r)) $Perm.No))
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@119@01 $PSF<Q>)
(declare-const s@120@01 $Snap)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@103@01 (get $Snap.unit r@96@01))
      (Set_in (inv@102@01 (get $Snap.unit r@96@01)) (refs $Snap.unit r@96@01)))
    (<
      $Perm.No
      (-
        (* (/ (to_real 1) (to_real 2)) $k@100@01)
        (pTaken@108@01 (get $Snap.unit r@96@01))))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)) $Snap.unit))
    (=
      ($PSF.lookup_Q (as sm@119@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)))
      ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@97@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)))))))
(assert (=>
  (ite
    (and
      (img@115@01 (get $Snap.unit r@96@01))
      (Set_in (inv@114@01 (get $Snap.unit r@96@01)) (refs $Snap.unit r@96@01)))
    (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@112@01))
    false)
  (and
    (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)) $Snap.unit))
    (=
      ($PSF.lookup_Q (as sm@119@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)))
      ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@111@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)))))))
(assert (tester%precondition ($PSF.lookup_Q (as sm@119@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01))) (get $Snap.unit r@96@01)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@116@01))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@103@01 (get $Snap.unit r@96@01))
            (Set_in (inv@102@01 (get $Snap.unit r@96@01)) (refs $Snap.unit r@96@01)))
          (-
            (* (/ (to_real 1) (to_real 2)) $k@100@01)
            (pTaken@108@01 (get $Snap.unit r@96@01)))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@103@01 (get $Snap.unit r@96@01))
        (Set_in (inv@102@01 (get $Snap.unit r@96@01)) (refs $Snap.unit r@96@01)))
      (<
        (ite
          (= (get $Snap.unit r@96@01) (get $Snap.unit r@96@01))
          $k@116@01
          $Perm.No)
        (-
          (* (/ (to_real 1) (to_real 2)) $k@100@01)
          (pTaken@108@01 (get $Snap.unit r@96@01))))
      (<
        (ite
          (= (get $Snap.unit r@96@01) (get $Snap.unit r@96@01))
          $k@116@01
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (and
        (img@103@01 (get $Snap.unit r@96@01))
        (Set_in (inv@102@01 (get $Snap.unit r@96@01)) (refs $Snap.unit r@96@01)))
      (<
        $Perm.No
        (-
          (* (/ (to_real 1) (to_real 2)) $k@100@01)
          (pTaken@108@01 (get $Snap.unit r@96@01))))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)) $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@119@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)))
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@97@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01))))))
  (=>
    (ite
      (and
        (img@115@01 (get $Snap.unit r@96@01))
        (Set_in (inv@114@01 (get $Snap.unit r@96@01)) (refs $Snap.unit r@96@01)))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@112@01))
      false)
    (and
      (not (= ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)) $Snap.unit))
      (=
        ($PSF.lookup_Q (as sm@119@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01)))
        ($PSF.lookup_Q ($SortWrappers.$SnapTo$PSF<Q> $t@111@01) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01))))))
  (tester%precondition ($PSF.lookup_Q (as sm@119@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01))) (get $Snap.unit r@96@01))))
(declare-const r2@121@01 $Ref)
(assert (=
  r2@121@01
  (tester ($PSF.lookup_Q (as sm@119@01  $PSF<Q>) ($SortWrappers.$RefTo$Snap (get $Snap.unit r@96@01))) (get $Snap.unit r@96@01))))
; [exec]
; r3 := testerFull(get(r))
; [eval] testerFull(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@96@01))
    ($Perm.min
      (ite
        (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@100@01) (pTaken@108@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@96@01))
    ($Perm.min
      (ite
        (and (img@115@01 r) (Set_in (inv@114@01 r) (refs $Snap.unit r@96@01)))
        (* (/ (to_real 1) (to_real 2)) $k@112@01)
        $Perm.No)
      (- $Perm.Write (pTaken@122@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@100@01) (pTaken@108@01 r))
        $Perm.No)
      (pTaken@122@01 r))
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
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@122@01 r) $Perm.No)
  
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@96@01))
    (= (- $Perm.Write (pTaken@122@01 r)) $Perm.No))
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@115@01 r) (Set_in (inv@114@01 r) (refs $Snap.unit r@96@01)))
        (* (/ (to_real 1) (to_real 2)) $k@112@01)
        $Perm.No)
      (pTaken@123@01 r))
    $Perm.No)
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@123@01 r) $Perm.No)
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@96@01))
    (= (- (- $Perm.Write (pTaken@122@01 r)) (pTaken@123@01 r)) $Perm.No))
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@96@01))
    (= (- (- $Perm.Write (pTaken@122@01 r)) (pTaken@123@01 r)) $Perm.No))
  
  :qid |quant-u-121|))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@101@01 e@113@01)
    (=
      (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
      (and (img@115@01 r) (Set_in (inv@114@01 r) (refs $Snap.unit r@96@01)))))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@124@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@96@01))
    ($Perm.min
      (ite
        (and (img@115@01 r) (Set_in (inv@114@01 r) (refs $Snap.unit r@96@01)))
        (* (/ (to_real 1) (to_real 2)) $k@112@01)
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@125@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@96@01))
    ($Perm.min
      (ite
        (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@100@01) (pTaken@108@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@124@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@115@01 r) (Set_in (inv@114@01 r) (refs $Snap.unit r@96@01)))
        (* (/ (to_real 1) (to_real 2)) $k@112@01)
        $Perm.No)
      (pTaken@124@01 r))
    $Perm.No)
  
  :qid |quant-u-124|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@124@01 r) $Perm.No)
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@96@01))
    (= (- $Perm.Write (pTaken@124@01 r)) $Perm.No))
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@103@01 r) (Set_in (inv@102@01 r) (refs $Snap.unit r@96@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@100@01) (pTaken@108@01 r))
        $Perm.No)
      (pTaken@125@01 r))
    $Perm.No)
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@125@01 r) $Perm.No)
  
  :qid |quant-u-128|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@96@01))
    (= (- (- $Perm.Write (pTaken@124@01 r)) (pTaken@125@01 r)) $Perm.No))
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@96@01))
    (= (- (- $Perm.Write (pTaken@124@01 r)) (pTaken@125@01 r)) $Perm.No))
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- func1 ----------
(declare-const r@126@01 $Ref)
(declare-const r@127@01 $Ref)
(push) ; 1
(declare-const $k@128@01 $Perm)
(assert ($Perm.isReadVar $k@128@01))
(declare-const $t@129@01 $FVF<q>)
(assert (<= $Perm.No $k@128@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var r2: Ref
(declare-const r2@130@01 $Ref)
; [exec]
; var r3: Ref
(declare-const r3@131@01 $Ref)
; [exec]
; unfold acc(R(r), wildcard)
(declare-const $k@132@01 $Perm)
(assert ($Perm.isReadVar $k@132@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@128@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@132@01 $k@128@01))
(assert (<= $Perm.No (- $k@128@01 $k@132@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@132@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@133@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@127@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@127@01))
(assert (Set_in e@133@01 (refs $Snap.unit r@127@01)))
(declare-const $k@134@01 $Perm)
(assert ($Perm.isReadVar $k@134@01))
(pop) ; 3
(declare-fun inv@135@01 ($Ref) $Ref)
(declare-fun img@136@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@134@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@133@01 $Ref)) (!
  (=>
    (Set_in e@133@01 (refs $Snap.unit r@127@01))
    (refs%precondition $Snap.unit r@127@01))
  :pattern ((Set_in e@133@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@135@01 e@133@01))
  :pattern ((img@136@01 e@133@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@133@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@127@01)
      (Set_in e@133@01 (refs $Snap.unit r@127@01)))
    (or (= $k@134@01 $Perm.No) (< $Perm.No $k@134@01)))
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@133@01 $Ref) (e2@133@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@127@01)
    (=>
      (and (Set_in e1@133@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@134@01))
      (refs%precondition $Snap.unit r@127@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@133@01 $Ref) (e2@133@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@133@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@134@01))
      (and (Set_in e2@133@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@134@01))
      (= e1@133@01 e2@133@01))
    (= e1@133@01 e2@133@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@133@01 $Ref)) (!
  (refs%precondition $Snap.unit r@127@01)
  :pattern ((Set_in e@133@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@135@01 e@133@01))
  :pattern ((img@136@01 e@133@01))
  :qid |quant-u-131|)))
(assert (forall ((r $Ref)) (!
  (=> (img@136@01 r) (refs%precondition $Snap.unit r@127@01))
  :pattern ((inv@135@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@133@01 $Ref)) (!
  (=>
    (and
      (Set_in e@133@01 (refs $Snap.unit r@127@01))
      (< $Perm.No (* $k@134@01 $k@132@01)))
    (and (= (inv@135@01 e@133@01) e@133@01) (img@136@01 e@133@01)))
  :pattern ((Set_in e@133@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@135@01 e@133@01))
  :pattern ((img@136@01 e@133@01))
  :qid |quant-u-131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@136@01 r)
      (and
        (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01))
        (< $Perm.No (* $k@134@01 $k@132@01))))
    (= (inv@135@01 r) r))
  :pattern ((inv@135@01 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@133@01 $Ref)) (!
  (<= $Perm.No (* $k@134@01 $k@132@01))
  :pattern ((Set_in e@133@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@135@01 e@133@01))
  :pattern ((img@136@01 e@133@01))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@133@01 $Ref)) (!
  (<= (* $k@134@01 $k@132@01) $Perm.Write)
  :pattern ((Set_in e@133@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@135@01 e@133@01))
  :pattern ((img@136@01 e@133@01))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@133@01 $Ref)) (!
  (=>
    (and
      (Set_in e@133@01 (refs $Snap.unit r@127@01))
      (< $Perm.No (* $k@134@01 $k@132@01)))
    (not (= e@133@01 $Ref.null)))
  :pattern ((Set_in e@133@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@135@01 e@133@01))
  :pattern ((img@136@01 e@133@01))
  :qid |q-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (R%trigger ($SortWrappers.$FVF<q>To$Snap $t@129@01) r@127@01))
; [exec]
; fold acc(R(r), wildcard)
(declare-const $k@137@01 $Perm)
(assert ($Perm.isReadVar $k@137@01))
(declare-const e@138@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@127@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@127@01))
(assert (Set_in e@138@01 (refs $Snap.unit r@127@01)))
(declare-const $k@139@01 $Perm)
(assert ($Perm.isReadVar $k@139@01))
(pop) ; 3
(declare-fun inv@140@01 ($Ref) $Ref)
(declare-fun img@141@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@139@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@138@01 $Ref)) (!
  (=>
    (Set_in e@138@01 (refs $Snap.unit r@127@01))
    (refs%precondition $Snap.unit r@127@01))
  :pattern ((Set_in e@138@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@140@01 e@138@01))
  :pattern ((img@141@01 e@138@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@138@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@127@01)
      (Set_in e@138@01 (refs $Snap.unit r@127@01)))
    (or (= $k@139@01 $Perm.No) (< $Perm.No $k@139@01)))
  
  :qid |quant-u-132|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@138@01 $Ref) (e2@138@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@127@01)
    (=>
      (and (Set_in e1@138@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@139@01))
      (refs%precondition $Snap.unit r@127@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@138@01 $Ref) (e2@138@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@138@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@139@01))
      (and (Set_in e2@138@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@139@01))
      (= e1@138@01 e2@138@01))
    (= e1@138@01 e2@138@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@138@01 $Ref)) (!
  (refs%precondition $Snap.unit r@127@01)
  :pattern ((Set_in e@138@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@140@01 e@138@01))
  :pattern ((img@141@01 e@138@01))
  :qid |q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (img@141@01 r) (refs%precondition $Snap.unit r@127@01))
  :pattern ((inv@140@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@138@01 $Ref)) (!
  (=>
    (and (Set_in e@138@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@139@01))
    (and (= (inv@140@01 e@138@01) e@138@01) (img@141@01 e@138@01)))
  :pattern ((Set_in e@138@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@140@01 e@138@01))
  :pattern ((img@141@01 e@138@01))
  :qid |q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@141@01 r)
      (and
        (Set_in (inv@140@01 r) (refs $Snap.unit r@127@01))
        (< $Perm.No $k@139@01)))
    (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |q-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@142@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@140@01 r) (refs $Snap.unit r@127@01))
      (img@141@01 r)
      (= r (inv@140@01 r)))
    ($Perm.min
      (ite
        (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
        (* $k@134@01 $k@132@01)
        $Perm.No)
      (* $k@139@01 $k@137@01))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@139@01 * $k@137@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
          (* $k@134@01 $k@132@01)
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
      (<
        (ite
          (and
            (Set_in (inv@140@01 r) (refs $Snap.unit r@127@01))
            (img@141@01 r)
            (= r (inv@140@01 r)))
          (* $k@139@01 $k@137@01)
          $Perm.No)
        (* $k@134@01 $k@132@01))
      (<
        (ite
          (and
            (Set_in (inv@140@01 r) (refs $Snap.unit r@127@01))
            (img@141@01 r)
            (= r (inv@140@01 r)))
          (* $k@139@01 $k@137@01)
          $Perm.No)
        $Perm.No)))
  :pattern ((img@136@01 r))
  :pattern ((Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
  :pattern ((Set_in (inv@140@01 r) (refs $Snap.unit r@127@01)))
  :pattern ((img@141@01 r))
  :qid |qp.srp24|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@140@01 r) (refs $Snap.unit r@127@01))
      (img@141@01 r)
      (= r (inv@140@01 r)))
    (= (- (* $k@139@01 $k@137@01) (pTaken@142@01 r)) $Perm.No))
  
  :qid |quant-u-135|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@143@01 $FVF<q>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_q (as sm@143@01  $FVF<q>)))
      (and
        (Set_in (inv@140@01 r) (refs $Snap.unit r@127@01))
        (< $Perm.No (* $k@139@01 $k@137@01))
        (img@141@01 r)))
    (=>
      (and
        (Set_in (inv@140@01 r) (refs $Snap.unit r@127@01))
        (< $Perm.No (* $k@139@01 $k@137@01))
        (img@141@01 r))
      (Set_in r ($FVF.domain_q (as sm@143@01  $FVF<q>)))))
  :pattern ((Set_in r ($FVF.domain_q (as sm@143@01  $FVF<q>))))
  :qid |qp.fvfDomDef26|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@140@01 r) (refs $Snap.unit r@127@01))
        (< $Perm.No (* $k@139@01 $k@137@01))
        (img@141@01 r))
      (ite
        (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
        (< $Perm.No (* $k@134@01 $k@132@01))
        false))
    (= ($FVF.lookup_q (as sm@143@01  $FVF<q>) r) ($FVF.lookup_q $t@129@01 r)))
  :pattern (($FVF.lookup_q (as sm@143@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@129@01 r))
  :qid |qp.fvfValDef25|)))
(assert (R%trigger ($SortWrappers.$FVF<q>To$Snap (as sm@143@01  $FVF<q>)) r@127@01))
(declare-const $t@144@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $k@128@01 $k@132@01))
    (= $t@144@01 ($SortWrappers.$FVF<q>To$Snap $t@129@01)))
  (=>
    (< $Perm.No $k@137@01)
    (= $t@144@01 ($SortWrappers.$FVF<q>To$Snap (as sm@143@01  $FVF<q>))))))
(assert (<= $Perm.No (+ (- $k@128@01 $k@132@01) $k@137@01)))
; [exec]
; unfold acc(R(r), wildcard)
(declare-const $k@145@01 $Perm)
(assert ($Perm.isReadVar $k@145@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@128@01 $k@132@01) $k@137@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@145@01 (+ (- $k@128@01 $k@132@01) $k@137@01)))
(assert (<= $Perm.No (- (+ (- $k@128@01 $k@132@01) $k@137@01) $k@145@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@145@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@146@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@127@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@127@01))
(assert (Set_in e@146@01 (refs $Snap.unit r@127@01)))
(declare-const $k@147@01 $Perm)
(assert ($Perm.isReadVar $k@147@01))
(pop) ; 3
(declare-fun inv@148@01 ($Ref) $Ref)
(declare-fun img@149@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@147@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@146@01 $Ref)) (!
  (=>
    (Set_in e@146@01 (refs $Snap.unit r@127@01))
    (refs%precondition $Snap.unit r@127@01))
  :pattern ((Set_in e@146@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@148@01 e@146@01))
  :pattern ((img@149@01 e@146@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@146@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@127@01)
      (Set_in e@146@01 (refs $Snap.unit r@127@01)))
    (or (= $k@147@01 $Perm.No) (< $Perm.No $k@147@01)))
  
  :qid |quant-u-136|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@146@01 $Ref) (e2@146@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@127@01)
    (=>
      (and (Set_in e1@146@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@147@01))
      (refs%precondition $Snap.unit r@127@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@146@01 $Ref) (e2@146@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@146@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@147@01))
      (and (Set_in e2@146@01 (refs $Snap.unit r@127@01)) (< $Perm.No $k@147@01))
      (= e1@146@01 e2@146@01))
    (= e1@146@01 e2@146@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@146@01 $Ref)) (!
  (refs%precondition $Snap.unit r@127@01)
  :pattern ((Set_in e@146@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@148@01 e@146@01))
  :pattern ((img@149@01 e@146@01))
  :qid |quant-u-137|)))
(assert (forall ((r $Ref)) (!
  (=> (img@149@01 r) (refs%precondition $Snap.unit r@127@01))
  :pattern ((inv@148@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@146@01 $Ref)) (!
  (=>
    (and
      (Set_in e@146@01 (refs $Snap.unit r@127@01))
      (< $Perm.No (* $k@147@01 $k@145@01)))
    (and (= (inv@148@01 e@146@01) e@146@01) (img@149@01 e@146@01)))
  :pattern ((Set_in e@146@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@148@01 e@146@01))
  :pattern ((img@149@01 e@146@01))
  :qid |quant-u-137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@149@01 r)
      (and
        (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01))
        (< $Perm.No (* $k@147@01 $k@145@01))))
    (= (inv@148@01 r) r))
  :pattern ((inv@148@01 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@146@01 $Ref)) (!
  (<= $Perm.No (* $k@147@01 $k@145@01))
  :pattern ((Set_in e@146@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@148@01 e@146@01))
  :pattern ((img@149@01 e@146@01))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@146@01 $Ref)) (!
  (<= (* $k@147@01 $k@145@01) $Perm.Write)
  :pattern ((Set_in e@146@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@148@01 e@146@01))
  :pattern ((img@149@01 e@146@01))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@146@01 $Ref)) (!
  (=>
    (and
      (Set_in e@146@01 (refs $Snap.unit r@127@01))
      (< $Perm.No (* $k@147@01 $k@145@01)))
    (not (= e@146@01 $Ref.null)))
  :pattern ((Set_in e@146@01 (refs $Snap.unit r@127@01)))
  :pattern ((inv@148@01 e@146@01))
  :pattern ((img@149@01 e@146@01))
  :qid |q-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@146@01 e@133@01)
    (=
      (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))
      (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))))
  
  :qid |quant-u-138|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (R%trigger $t@144@01 r@127@01))
; [exec]
; r2 := testerfield(get(r))
; [eval] testerfield(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition $Snap.unit r@127@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition $Snap.unit r@127@01))
(push) ; 3
(declare-const $k@150@01 $Perm)
(assert ($Perm.isReadVar $k@150@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@151@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@127@01))
    ($Perm.min
      (ite
        (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 r))
        $Perm.No)
      $k@150@01)
    $Perm.No))
(define-fun pTaken@152@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@127@01))
    ($Perm.min
      (ite
        (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))
        (* $k@147@01 $k@145@01)
        $Perm.No)
      (- $k@150@01 (pTaken@151@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@150@01
(assert (=>
  (not
    (=
      (ite
        (and
          (img@136@01 (get $Snap.unit r@127@01))
          (Set_in (inv@135@01 (get $Snap.unit r@127@01)) (refs $Snap.unit r@127@01)))
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 (get $Snap.unit r@127@01)))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@136@01 (get $Snap.unit r@127@01))
      (Set_in (inv@135@01 (get $Snap.unit r@127@01)) (refs $Snap.unit r@127@01)))
    (<
      (ite
        (= (get $Snap.unit r@127@01) (get $Snap.unit r@127@01))
        $k@150@01
        $Perm.No)
      (- (* $k@134@01 $k@132@01) (pTaken@142@01 (get $Snap.unit r@127@01))))
    (<
      (ite
        (= (get $Snap.unit r@127@01) (get $Snap.unit r@127@01))
        $k@150@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@127@01))
    (= (- $k@150@01 (pTaken@151@01 r)) $Perm.No))
  
  :qid |quant-u-141|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@153@01 $FVF<q>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@136@01 (get $Snap.unit r@127@01))
      (Set_in (inv@135@01 (get $Snap.unit r@127@01)) (refs $Snap.unit r@127@01)))
    (<
      $Perm.No
      (- (* $k@134@01 $k@132@01) (pTaken@142@01 (get $Snap.unit r@127@01))))
    false)
  (=
    ($FVF.lookup_q (as sm@153@01  $FVF<q>) (get $Snap.unit r@127@01))
    ($FVF.lookup_q $t@129@01 (get $Snap.unit r@127@01)))))
(assert (=>
  (ite
    (and
      (img@149@01 (get $Snap.unit r@127@01))
      (Set_in (inv@148@01 (get $Snap.unit r@127@01)) (refs $Snap.unit r@127@01)))
    (< $Perm.No (* $k@147@01 $k@145@01))
    false)
  (=
    ($FVF.lookup_q (as sm@153@01  $FVF<q>) (get $Snap.unit r@127@01))
    ($FVF.lookup_q ($SortWrappers.$SnapTo$FVF<q> $t@144@01) (get $Snap.unit r@127@01)))))
(assert (testerfield%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@153@01  $FVF<q>) (get $Snap.unit r@127@01))) (get $Snap.unit r@127@01)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@150@01))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@136@01 (get $Snap.unit r@127@01))
            (Set_in (inv@135@01 (get $Snap.unit r@127@01)) (refs $Snap.unit r@127@01)))
          (- (* $k@134@01 $k@132@01) (pTaken@142@01 (get $Snap.unit r@127@01)))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@136@01 (get $Snap.unit r@127@01))
        (Set_in (inv@135@01 (get $Snap.unit r@127@01)) (refs $Snap.unit r@127@01)))
      (<
        (ite
          (= (get $Snap.unit r@127@01) (get $Snap.unit r@127@01))
          $k@150@01
          $Perm.No)
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 (get $Snap.unit r@127@01))))
      (<
        (ite
          (= (get $Snap.unit r@127@01) (get $Snap.unit r@127@01))
          $k@150@01
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (and
        (img@136@01 (get $Snap.unit r@127@01))
        (Set_in (inv@135@01 (get $Snap.unit r@127@01)) (refs $Snap.unit r@127@01)))
      (<
        $Perm.No
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 (get $Snap.unit r@127@01))))
      false)
    (=
      ($FVF.lookup_q (as sm@153@01  $FVF<q>) (get $Snap.unit r@127@01))
      ($FVF.lookup_q $t@129@01 (get $Snap.unit r@127@01))))
  (=>
    (ite
      (and
        (img@149@01 (get $Snap.unit r@127@01))
        (Set_in (inv@148@01 (get $Snap.unit r@127@01)) (refs $Snap.unit r@127@01)))
      (< $Perm.No (* $k@147@01 $k@145@01))
      false)
    (=
      ($FVF.lookup_q (as sm@153@01  $FVF<q>) (get $Snap.unit r@127@01))
      ($FVF.lookup_q ($SortWrappers.$SnapTo$FVF<q> $t@144@01) (get $Snap.unit r@127@01))))
  (testerfield%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@153@01  $FVF<q>) (get $Snap.unit r@127@01))) (get $Snap.unit r@127@01))))
(declare-const r2@154@01 $Ref)
(assert (=
  r2@154@01
  (testerfield ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@153@01  $FVF<q>) (get $Snap.unit r@127@01))) (get $Snap.unit r@127@01))))
; [exec]
; r3 := testerfieldFull(get(r))
; [eval] testerfieldFull(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@155@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@127@01))
    ($Perm.min
      (ite
        (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@156@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@127@01))
    ($Perm.min
      (ite
        (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))
        (* $k@147@01 $k@145@01)
        $Perm.No)
      (- $Perm.Write (pTaken@155@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 r))
        $Perm.No)
      (pTaken@155@01 r))
    $Perm.No)
  
  :qid |quant-u-143|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@155@01 r) $Perm.No)
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@127@01))
    (= (- $Perm.Write (pTaken@155@01 r)) $Perm.No))
  
  :qid |quant-u-145|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))
        (* $k@147@01 $k@145@01)
        $Perm.No)
      (pTaken@156@01 r))
    $Perm.No)
  
  :qid |quant-u-146|))))
(check-sat)
; unknown
(pop) ; 4
; 0,28s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@156@01 r) $Perm.No)
  
  :qid |quant-u-147|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@127@01))
    (= (- (- $Perm.Write (pTaken@155@01 r)) (pTaken@156@01 r)) $Perm.No))
  
  :qid |quant-u-148|))))
(check-sat)
; unknown
(pop) ; 4
; 0,50s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@127@01))
    (= (- (- $Perm.Write (pTaken@155@01 r)) (pTaken@156@01 r)) $Perm.No))
  
  :qid |quant-u-148|))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@133@01 e@146@01)
    (=
      (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
      (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))))
  
  :qid |quant-u-149|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
      (< $Perm.No (- (* $k@134@01 $k@132@01) (pTaken@142@01 r)))
      false)
    (= ($FVF.lookup_q (as sm@153@01  $FVF<q>) r) ($FVF.lookup_q $t@129@01 r)))
  :pattern (($FVF.lookup_q (as sm@153@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@129@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))
      (< $Perm.No (* $k@147@01 $k@145@01))
      false)
    (=
      ($FVF.lookup_q (as sm@153@01  $FVF<q>) r)
      ($FVF.lookup_q ($SortWrappers.$SnapTo$FVF<q> $t@144@01) r)))
  :pattern (($FVF.lookup_q (as sm@153@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q ($SortWrappers.$SnapTo$FVF<q> $t@144@01) r))
  :qid |qp.fvfValDef29|)))
(declare-const pm@157@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_q (as pm@157@01  $FPM) r)
    (+
      (ite
        (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 r))
        $Perm.No)
      (ite
        (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))
        (* $k@147@01 $k@145@01)
        $Perm.No)))
  :pattern (($FVF.perm_q (as pm@157@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
; Assume upper permission bound for field q
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_q (as pm@157@01  $FPM) r) $Perm.Write)
  :pattern ((inv@135@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field q
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_q (as pm@157@01  $FPM) r) $Perm.Write)
  :pattern ((inv@148@01 r))
  :qid |qp-fld-prm-bnd|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@158@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@127@01))
    ($Perm.min
      (ite
        (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))
        (* $k@147@01 $k@145@01)
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@159@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@127@01))
    ($Perm.min
      (ite
        (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@158@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@149@01 r) (Set_in (inv@148@01 r) (refs $Snap.unit r@127@01)))
        (* $k@147@01 $k@145@01)
        $Perm.No)
      (pTaken@158@01 r))
    $Perm.No)
  
  :qid |quant-u-151|))))
(check-sat)
; unknown
(pop) ; 4
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@158@01 r) $Perm.No)
  
  :qid |quant-u-152|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@127@01))
    (= (- $Perm.Write (pTaken@158@01 r)) $Perm.No))
  
  :qid |quant-u-153|))))
(check-sat)
; unknown
(pop) ; 4
; 0,33s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@136@01 r) (Set_in (inv@135@01 r) (refs $Snap.unit r@127@01)))
        (- (* $k@134@01 $k@132@01) (pTaken@142@01 r))
        $Perm.No)
      (pTaken@159@01 r))
    $Perm.No)
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 4
; 0,50s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@159@01 r) $Perm.No)
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@127@01))
    (= (- (- $Perm.Write (pTaken@158@01 r)) (pTaken@159@01 r)) $Perm.No))
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 4
; 0,50s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@127@01))
    (= (- (- $Perm.Write (pTaken@158@01 r)) (pTaken@159@01 r)) $Perm.No))
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 4
; 0,60s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- func2 ----------
(declare-const r@160@01 $Ref)
(declare-const r@161@01 $Ref)
(push) ; 1
(declare-const $t@162@01 $FVF<q>)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var r2: Ref
(declare-const r2@163@01 $Ref)
; [exec]
; var r3: Ref
(declare-const r3@164@01 $Ref)
; [exec]
; unfold acc(R(r), write)
(declare-const e@165@01 $Ref)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@161@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@161@01))
(assert (Set_in e@165@01 (refs $Snap.unit r@161@01)))
(declare-const $k@166@01 $Perm)
(assert ($Perm.isReadVar $k@166@01))
(pop) ; 3
(declare-fun inv@167@01 ($Ref) $Ref)
(declare-fun img@168@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@166@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@165@01 $Ref)) (!
  (=>
    (Set_in e@165@01 (refs $Snap.unit r@161@01))
    (refs%precondition $Snap.unit r@161@01))
  :pattern ((Set_in e@165@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@167@01 e@165@01))
  :pattern ((img@168@01 e@165@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@165@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@161@01)
      (Set_in e@165@01 (refs $Snap.unit r@161@01)))
    (or (= $k@166@01 $Perm.No) (< $Perm.No $k@166@01)))
  
  :qid |quant-u-157|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@165@01 $Ref) (e2@165@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@161@01)
    (=>
      (and (Set_in e1@165@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@166@01))
      (refs%precondition $Snap.unit r@161@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@165@01 $Ref) (e2@165@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@165@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@166@01))
      (and (Set_in e2@165@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@166@01))
      (= e1@165@01 e2@165@01))
    (= e1@165@01 e2@165@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@165@01 $Ref)) (!
  (refs%precondition $Snap.unit r@161@01)
  :pattern ((Set_in e@165@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@167@01 e@165@01))
  :pattern ((img@168@01 e@165@01))
  :qid |quant-u-158|)))
(assert (forall ((r $Ref)) (!
  (=> (img@168@01 r) (refs%precondition $Snap.unit r@161@01))
  :pattern ((inv@167@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@165@01 $Ref)) (!
  (=>
    (and (Set_in e@165@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@166@01))
    (and (= (inv@167@01 e@165@01) e@165@01) (img@168@01 e@165@01)))
  :pattern ((Set_in e@165@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@167@01 e@165@01))
  :pattern ((img@168@01 e@165@01))
  :qid |quant-u-158|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@168@01 r)
      (and
        (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01))
        (< $Perm.No $k@166@01)))
    (= (inv@167@01 r) r))
  :pattern ((inv@167@01 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@165@01 $Ref)) (!
  (<= $Perm.No $k@166@01)
  :pattern ((Set_in e@165@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@167@01 e@165@01))
  :pattern ((img@168@01 e@165@01))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@165@01 $Ref)) (!
  (<= $k@166@01 $Perm.Write)
  :pattern ((Set_in e@165@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@167@01 e@165@01))
  :pattern ((img@168@01 e@165@01))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@165@01 $Ref)) (!
  (=>
    (and (Set_in e@165@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@166@01))
    (not (= e@165@01 $Ref.null)))
  :pattern ((Set_in e@165@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@167@01 e@165@01))
  :pattern ((img@168@01 e@165@01))
  :qid |q-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (R%trigger ($SortWrappers.$FVF<q>To$Snap $t@162@01) r@161@01))
; [exec]
; fold acc(R(r), write)
(declare-const e@169@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@161@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@161@01))
(assert (Set_in e@169@01 (refs $Snap.unit r@161@01)))
(declare-const $k@170@01 $Perm)
(assert ($Perm.isReadVar $k@170@01))
(pop) ; 3
(declare-fun inv@171@01 ($Ref) $Ref)
(declare-fun img@172@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@170@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@169@01 $Ref)) (!
  (=>
    (Set_in e@169@01 (refs $Snap.unit r@161@01))
    (refs%precondition $Snap.unit r@161@01))
  :pattern ((Set_in e@169@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@171@01 e@169@01))
  :pattern ((img@172@01 e@169@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@169@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@161@01)
      (Set_in e@169@01 (refs $Snap.unit r@161@01)))
    (or (= $k@170@01 $Perm.No) (< $Perm.No $k@170@01)))
  
  :qid |quant-u-159|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@169@01 $Ref) (e2@169@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@161@01)
    (=>
      (and (Set_in e1@169@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@170@01))
      (refs%precondition $Snap.unit r@161@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@169@01 $Ref) (e2@169@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@169@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@170@01))
      (and (Set_in e2@169@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@170@01))
      (= e1@169@01 e2@169@01))
    (= e1@169@01 e2@169@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@169@01 $Ref)) (!
  (refs%precondition $Snap.unit r@161@01)
  :pattern ((Set_in e@169@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@171@01 e@169@01))
  :pattern ((img@172@01 e@169@01))
  :qid |q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (img@172@01 r) (refs%precondition $Snap.unit r@161@01))
  :pattern ((inv@171@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@169@01 $Ref)) (!
  (=>
    (and (Set_in e@169@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@170@01))
    (and (= (inv@171@01 e@169@01) e@169@01) (img@172@01 e@169@01)))
  :pattern ((Set_in e@169@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@171@01 e@169@01))
  :pattern ((img@172@01 e@169@01))
  :qid |q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@172@01 r)
      (and
        (Set_in (inv@171@01 r) (refs $Snap.unit r@161@01))
        (< $Perm.No $k@170@01)))
    (= (inv@171@01 r) r))
  :pattern ((inv@171@01 r))
  :qid |q-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@173@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@171@01 r) (refs $Snap.unit r@161@01))
      (img@172@01 r)
      (= r (inv@171@01 r)))
    ($Perm.min
      (ite
        (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
        $k@166@01
        $Perm.No)
      $k@170@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@170@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
          $k@166@01
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
      (<
        (ite
          (and
            (Set_in (inv@171@01 r) (refs $Snap.unit r@161@01))
            (img@172@01 r)
            (= r (inv@171@01 r)))
          $k@170@01
          $Perm.No)
        $k@166@01)
      (<
        (ite
          (and
            (Set_in (inv@171@01 r) (refs $Snap.unit r@161@01))
            (img@172@01 r)
            (= r (inv@171@01 r)))
          $k@170@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@168@01 r))
  :pattern ((Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
  :pattern ((Set_in (inv@171@01 r) (refs $Snap.unit r@161@01)))
  :pattern ((img@172@01 r))
  :qid |qp.srp31|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@171@01 r) (refs $Snap.unit r@161@01))
      (img@172@01 r)
      (= r (inv@171@01 r)))
    (= (- $k@170@01 (pTaken@173@01 r)) $Perm.No))
  
  :qid |quant-u-162|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@174@01 $FVF<q>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_q (as sm@174@01  $FVF<q>)))
      (and
        (Set_in (inv@171@01 r) (refs $Snap.unit r@161@01))
        (< $Perm.No $k@170@01)
        (img@172@01 r)))
    (=>
      (and
        (Set_in (inv@171@01 r) (refs $Snap.unit r@161@01))
        (< $Perm.No $k@170@01)
        (img@172@01 r))
      (Set_in r ($FVF.domain_q (as sm@174@01  $FVF<q>)))))
  :pattern ((Set_in r ($FVF.domain_q (as sm@174@01  $FVF<q>))))
  :qid |qp.fvfDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@171@01 r) (refs $Snap.unit r@161@01))
        (< $Perm.No $k@170@01)
        (img@172@01 r))
      (ite
        (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
        (< $Perm.No $k@166@01)
        false))
    (= ($FVF.lookup_q (as sm@174@01  $FVF<q>) r) ($FVF.lookup_q $t@162@01 r)))
  :pattern (($FVF.lookup_q (as sm@174@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@162@01 r))
  :qid |qp.fvfValDef32|)))
(assert (R%trigger ($SortWrappers.$FVF<q>To$Snap (as sm@174@01  $FVF<q>)) r@161@01))
; [exec]
; unfold acc(R(r), write)
(declare-const e@175@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@161@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@161@01))
(assert (Set_in e@175@01 (refs $Snap.unit r@161@01)))
(declare-const $k@176@01 $Perm)
(assert ($Perm.isReadVar $k@176@01))
(pop) ; 3
(declare-fun inv@177@01 ($Ref) $Ref)
(declare-fun img@178@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@176@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@175@01 $Ref)) (!
  (=>
    (Set_in e@175@01 (refs $Snap.unit r@161@01))
    (refs%precondition $Snap.unit r@161@01))
  :pattern ((Set_in e@175@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@177@01 e@175@01))
  :pattern ((img@178@01 e@175@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@175@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@161@01)
      (Set_in e@175@01 (refs $Snap.unit r@161@01)))
    (or (= $k@176@01 $Perm.No) (< $Perm.No $k@176@01)))
  
  :qid |quant-u-163|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@175@01 $Ref) (e2@175@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@161@01)
    (=>
      (and (Set_in e1@175@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@176@01))
      (refs%precondition $Snap.unit r@161@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@175@01 $Ref) (e2@175@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@175@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@176@01))
      (and (Set_in e2@175@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@176@01))
      (= e1@175@01 e2@175@01))
    (= e1@175@01 e2@175@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@175@01 $Ref)) (!
  (refs%precondition $Snap.unit r@161@01)
  :pattern ((Set_in e@175@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@177@01 e@175@01))
  :pattern ((img@178@01 e@175@01))
  :qid |quant-u-164|)))
(assert (forall ((r $Ref)) (!
  (=> (img@178@01 r) (refs%precondition $Snap.unit r@161@01))
  :pattern ((inv@177@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@175@01 $Ref)) (!
  (=>
    (and (Set_in e@175@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@176@01))
    (and (= (inv@177@01 e@175@01) e@175@01) (img@178@01 e@175@01)))
  :pattern ((Set_in e@175@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@177@01 e@175@01))
  :pattern ((img@178@01 e@175@01))
  :qid |quant-u-164|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@178@01 r)
      (and
        (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01))
        (< $Perm.No $k@176@01)))
    (= (inv@177@01 r) r))
  :pattern ((inv@177@01 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@175@01 $Ref)) (!
  (<= $Perm.No $k@176@01)
  :pattern ((Set_in e@175@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@177@01 e@175@01))
  :pattern ((img@178@01 e@175@01))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@175@01 $Ref)) (!
  (<= $k@176@01 $Perm.Write)
  :pattern ((Set_in e@175@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@177@01 e@175@01))
  :pattern ((img@178@01 e@175@01))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@175@01 $Ref)) (!
  (=>
    (and (Set_in e@175@01 (refs $Snap.unit r@161@01)) (< $Perm.No $k@176@01))
    (not (= e@175@01 $Ref.null)))
  :pattern ((Set_in e@175@01 (refs $Snap.unit r@161@01)))
  :pattern ((inv@177@01 e@175@01))
  :pattern ((img@178@01 e@175@01))
  :qid |q-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@175@01 e@165@01)
    (=
      (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))
      (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))))
  
  :qid |quant-u-165|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; r2 := testerfield(get(r))
; [eval] testerfield(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition $Snap.unit r@161@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition $Snap.unit r@161@01))
(push) ; 3
(declare-const $k@179@01 $Perm)
(assert ($Perm.isReadVar $k@179@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@180@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@161@01))
    ($Perm.min
      (ite
        (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
        (- $k@166@01 (pTaken@173@01 r))
        $Perm.No)
      $k@179@01)
    $Perm.No))
(define-fun pTaken@181@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@161@01))
    ($Perm.min
      (ite
        (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))
        $k@176@01
        $Perm.No)
      (- $k@179@01 (pTaken@180@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@179@01
(assert (=>
  (not
    (=
      (ite
        (and
          (img@168@01 (get $Snap.unit r@161@01))
          (Set_in (inv@167@01 (get $Snap.unit r@161@01)) (refs $Snap.unit r@161@01)))
        (- $k@166@01 (pTaken@173@01 (get $Snap.unit r@161@01)))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@168@01 (get $Snap.unit r@161@01))
      (Set_in (inv@167@01 (get $Snap.unit r@161@01)) (refs $Snap.unit r@161@01)))
    (<
      (ite
        (= (get $Snap.unit r@161@01) (get $Snap.unit r@161@01))
        $k@179@01
        $Perm.No)
      (- $k@166@01 (pTaken@173@01 (get $Snap.unit r@161@01))))
    (<
      (ite
        (= (get $Snap.unit r@161@01) (get $Snap.unit r@161@01))
        $k@179@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@161@01))
    (= (- $k@179@01 (pTaken@180@01 r)) $Perm.No))
  
  :qid |quant-u-168|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@182@01 $FVF<q>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@168@01 (get $Snap.unit r@161@01))
      (Set_in (inv@167@01 (get $Snap.unit r@161@01)) (refs $Snap.unit r@161@01)))
    (< $Perm.No (- $k@166@01 (pTaken@173@01 (get $Snap.unit r@161@01))))
    false)
  (=
    ($FVF.lookup_q (as sm@182@01  $FVF<q>) (get $Snap.unit r@161@01))
    ($FVF.lookup_q $t@162@01 (get $Snap.unit r@161@01)))))
(assert (=>
  (ite
    (and
      (img@178@01 (get $Snap.unit r@161@01))
      (Set_in (inv@177@01 (get $Snap.unit r@161@01)) (refs $Snap.unit r@161@01)))
    (< $Perm.No $k@176@01)
    false)
  (=
    ($FVF.lookup_q (as sm@182@01  $FVF<q>) (get $Snap.unit r@161@01))
    ($FVF.lookup_q (as sm@174@01  $FVF<q>) (get $Snap.unit r@161@01)))))
(assert (testerfield%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@182@01  $FVF<q>) (get $Snap.unit r@161@01))) (get $Snap.unit r@161@01)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@179@01))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@168@01 (get $Snap.unit r@161@01))
            (Set_in (inv@167@01 (get $Snap.unit r@161@01)) (refs $Snap.unit r@161@01)))
          (- $k@166@01 (pTaken@173@01 (get $Snap.unit r@161@01)))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@168@01 (get $Snap.unit r@161@01))
        (Set_in (inv@167@01 (get $Snap.unit r@161@01)) (refs $Snap.unit r@161@01)))
      (<
        (ite
          (= (get $Snap.unit r@161@01) (get $Snap.unit r@161@01))
          $k@179@01
          $Perm.No)
        (- $k@166@01 (pTaken@173@01 (get $Snap.unit r@161@01))))
      (<
        (ite
          (= (get $Snap.unit r@161@01) (get $Snap.unit r@161@01))
          $k@179@01
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (and
        (img@168@01 (get $Snap.unit r@161@01))
        (Set_in (inv@167@01 (get $Snap.unit r@161@01)) (refs $Snap.unit r@161@01)))
      (< $Perm.No (- $k@166@01 (pTaken@173@01 (get $Snap.unit r@161@01))))
      false)
    (=
      ($FVF.lookup_q (as sm@182@01  $FVF<q>) (get $Snap.unit r@161@01))
      ($FVF.lookup_q $t@162@01 (get $Snap.unit r@161@01))))
  (=>
    (ite
      (and
        (img@178@01 (get $Snap.unit r@161@01))
        (Set_in (inv@177@01 (get $Snap.unit r@161@01)) (refs $Snap.unit r@161@01)))
      (< $Perm.No $k@176@01)
      false)
    (=
      ($FVF.lookup_q (as sm@182@01  $FVF<q>) (get $Snap.unit r@161@01))
      ($FVF.lookup_q (as sm@174@01  $FVF<q>) (get $Snap.unit r@161@01))))
  (testerfield%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@182@01  $FVF<q>) (get $Snap.unit r@161@01))) (get $Snap.unit r@161@01))))
(declare-const r2@183@01 $Ref)
(assert (=
  r2@183@01
  (testerfield ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@182@01  $FVF<q>) (get $Snap.unit r@161@01))) (get $Snap.unit r@161@01))))
; [exec]
; r3 := testerfieldFull(get(r))
; [eval] testerfieldFull(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@184@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@161@01))
    ($Perm.min
      (ite
        (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
        (- $k@166@01 (pTaken@173@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@185@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@161@01))
    ($Perm.min
      (ite
        (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))
        $k@176@01
        $Perm.No)
      (- $Perm.Write (pTaken@184@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
        (- $k@166@01 (pTaken@173@01 r))
        $Perm.No)
      (pTaken@184@01 r))
    $Perm.No)
  
  :qid |quant-u-170|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@184@01 r) $Perm.No)
  
  :qid |quant-u-171|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@161@01))
    (= (- $Perm.Write (pTaken@184@01 r)) $Perm.No))
  
  :qid |quant-u-172|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))
        $k@176@01
        $Perm.No)
      (pTaken@185@01 r))
    $Perm.No)
  
  :qid |quant-u-173|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@185@01 r) $Perm.No)
  
  :qid |quant-u-174|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@161@01))
    (= (- (- $Perm.Write (pTaken@184@01 r)) (pTaken@185@01 r)) $Perm.No))
  
  :qid |quant-u-175|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@161@01))
    (= (- (- $Perm.Write (pTaken@184@01 r)) (pTaken@185@01 r)) $Perm.No))
  
  :qid |quant-u-175|))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@165@01 e@175@01)
    (=
      (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
      (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))))
  
  :qid |quant-u-176|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
      (< $Perm.No (- $k@166@01 (pTaken@173@01 r)))
      false)
    (= ($FVF.lookup_q (as sm@182@01  $FVF<q>) r) ($FVF.lookup_q $t@162@01 r)))
  :pattern (($FVF.lookup_q (as sm@182@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@162@01 r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))
      (< $Perm.No $k@176@01)
      false)
    (=
      ($FVF.lookup_q (as sm@182@01  $FVF<q>) r)
      ($FVF.lookup_q (as sm@174@01  $FVF<q>) r)))
  :pattern (($FVF.lookup_q (as sm@182@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q (as sm@174@01  $FVF<q>) r))
  :qid |qp.fvfValDef36|)))
(declare-const pm@186@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_q (as pm@186@01  $FPM) r)
    (+
      (ite
        (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
        (- $k@166@01 (pTaken@173@01 r))
        $Perm.No)
      (ite
        (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))
        $k@176@01
        $Perm.No)))
  :pattern (($FVF.perm_q (as pm@186@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
; Assume upper permission bound for field q
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_q (as pm@186@01  $FPM) r) $Perm.Write)
  :pattern ((inv@167@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field q
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_q (as pm@186@01  $FPM) r) $Perm.Write)
  :pattern ((inv@177@01 r))
  :qid |qp-fld-prm-bnd|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@187@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@161@01))
    ($Perm.min
      (ite
        (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))
        $k@176@01
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@188@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@161@01))
    ($Perm.min
      (ite
        (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
        (- $k@166@01 (pTaken@173@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@187@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@178@01 r) (Set_in (inv@177@01 r) (refs $Snap.unit r@161@01)))
        $k@176@01
        $Perm.No)
      (pTaken@187@01 r))
    $Perm.No)
  
  :qid |quant-u-178|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@187@01 r) $Perm.No)
  
  :qid |quant-u-179|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@161@01))
    (= (- $Perm.Write (pTaken@187@01 r)) $Perm.No))
  
  :qid |quant-u-180|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@168@01 r) (Set_in (inv@167@01 r) (refs $Snap.unit r@161@01)))
        (- $k@166@01 (pTaken@173@01 r))
        $Perm.No)
      (pTaken@188@01 r))
    $Perm.No)
  
  :qid |quant-u-181|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@188@01 r) $Perm.No)
  
  :qid |quant-u-182|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@161@01))
    (= (- (- $Perm.Write (pTaken@187@01 r)) (pTaken@188@01 r)) $Perm.No))
  
  :qid |quant-u-183|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@161@01))
    (= (- (- $Perm.Write (pTaken@187@01 r)) (pTaken@188@01 r)) $Perm.No))
  
  :qid |quant-u-183|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- func3 ----------
(declare-const r@189@01 $Ref)
(declare-const r@190@01 $Ref)
(push) ; 1
(declare-const $t@191@01 $FVF<q>)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var r2: Ref
(declare-const r2@192@01 $Ref)
; [exec]
; var r3: Ref
(declare-const r3@193@01 $Ref)
; [exec]
; unfold acc(R(r), 1 / 2)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@194@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@190@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@190@01))
(assert (Set_in e@194@01 (refs $Snap.unit r@190@01)))
(declare-const $k@195@01 $Perm)
(assert ($Perm.isReadVar $k@195@01))
(pop) ; 3
(declare-fun inv@196@01 ($Ref) $Ref)
(declare-fun img@197@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@195@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@194@01 $Ref)) (!
  (=>
    (Set_in e@194@01 (refs $Snap.unit r@190@01))
    (refs%precondition $Snap.unit r@190@01))
  :pattern ((Set_in e@194@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@196@01 e@194@01))
  :pattern ((img@197@01 e@194@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@194@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@190@01)
      (Set_in e@194@01 (refs $Snap.unit r@190@01)))
    (or (= $k@195@01 $Perm.No) (< $Perm.No $k@195@01)))
  
  :qid |quant-u-184|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@194@01 $Ref) (e2@194@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@190@01)
    (=>
      (and (Set_in e1@194@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@195@01))
      (refs%precondition $Snap.unit r@190@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@194@01 $Ref) (e2@194@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@194@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@195@01))
      (and (Set_in e2@194@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@195@01))
      (= e1@194@01 e2@194@01))
    (= e1@194@01 e2@194@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@194@01 $Ref)) (!
  (refs%precondition $Snap.unit r@190@01)
  :pattern ((Set_in e@194@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@196@01 e@194@01))
  :pattern ((img@197@01 e@194@01))
  :qid |quant-u-185|)))
(assert (forall ((r $Ref)) (!
  (=> (img@197@01 r) (refs%precondition $Snap.unit r@190@01))
  :pattern ((inv@196@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@194@01 $Ref)) (!
  (=>
    (and
      (Set_in e@194@01 (refs $Snap.unit r@190@01))
      (< $Perm.No (* $k@195@01 (/ (to_real 1) (to_real 2)))))
    (and (= (inv@196@01 e@194@01) e@194@01) (img@197@01 e@194@01)))
  :pattern ((Set_in e@194@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@196@01 e@194@01))
  :pattern ((img@197@01 e@194@01))
  :qid |quant-u-185|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@197@01 r)
      (and
        (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01))
        (< $Perm.No (* $k@195@01 (/ (to_real 1) (to_real 2))))))
    (= (inv@196@01 r) r))
  :pattern ((inv@196@01 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@194@01 $Ref)) (!
  (<= $Perm.No (* $k@195@01 (/ (to_real 1) (to_real 2))))
  :pattern ((Set_in e@194@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@196@01 e@194@01))
  :pattern ((img@197@01 e@194@01))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@194@01 $Ref)) (!
  (<= (* $k@195@01 (/ (to_real 1) (to_real 2))) $Perm.Write)
  :pattern ((Set_in e@194@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@196@01 e@194@01))
  :pattern ((img@197@01 e@194@01))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@194@01 $Ref)) (!
  (=>
    (and
      (Set_in e@194@01 (refs $Snap.unit r@190@01))
      (< $Perm.No (* $k@195@01 (/ (to_real 1) (to_real 2)))))
    (not (= e@194@01 $Ref.null)))
  :pattern ((Set_in e@194@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@196@01 e@194@01))
  :pattern ((img@197@01 e@194@01))
  :qid |q-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (R%trigger ($SortWrappers.$FVF<q>To$Snap $t@191@01) r@190@01))
; [exec]
; fold acc(R(r), 1 / 2)
(declare-const e@198@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@190@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@190@01))
(assert (Set_in e@198@01 (refs $Snap.unit r@190@01)))
(declare-const $k@199@01 $Perm)
(assert ($Perm.isReadVar $k@199@01))
(pop) ; 3
(declare-fun inv@200@01 ($Ref) $Ref)
(declare-fun img@201@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@199@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@198@01 $Ref)) (!
  (=>
    (Set_in e@198@01 (refs $Snap.unit r@190@01))
    (refs%precondition $Snap.unit r@190@01))
  :pattern ((Set_in e@198@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@200@01 e@198@01))
  :pattern ((img@201@01 e@198@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@198@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@190@01)
      (Set_in e@198@01 (refs $Snap.unit r@190@01)))
    (or (= $k@199@01 $Perm.No) (< $Perm.No $k@199@01)))
  
  :qid |quant-u-186|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@198@01 $Ref) (e2@198@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@190@01)
    (=>
      (and (Set_in e1@198@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@199@01))
      (refs%precondition $Snap.unit r@190@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@198@01 $Ref) (e2@198@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@198@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@199@01))
      (and (Set_in e2@198@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@199@01))
      (= e1@198@01 e2@198@01))
    (= e1@198@01 e2@198@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@198@01 $Ref)) (!
  (refs%precondition $Snap.unit r@190@01)
  :pattern ((Set_in e@198@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@200@01 e@198@01))
  :pattern ((img@201@01 e@198@01))
  :qid |q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (img@201@01 r) (refs%precondition $Snap.unit r@190@01))
  :pattern ((inv@200@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@198@01 $Ref)) (!
  (=>
    (and (Set_in e@198@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@199@01))
    (and (= (inv@200@01 e@198@01) e@198@01) (img@201@01 e@198@01)))
  :pattern ((Set_in e@198@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@200@01 e@198@01))
  :pattern ((img@201@01 e@198@01))
  :qid |q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@201@01 r)
      (and
        (Set_in (inv@200@01 r) (refs $Snap.unit r@190@01))
        (< $Perm.No $k@199@01)))
    (= (inv@200@01 r) r))
  :pattern ((inv@200@01 r))
  :qid |q-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@202@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@200@01 r) (refs $Snap.unit r@190@01))
      (img@201@01 r)
      (= r (inv@200@01 r)))
    ($Perm.min
      (ite
        (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
        (* $k@195@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (* $k@199@01 (/ (to_real 1) (to_real 2))))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@199@01 * 1/2
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
          (* $k@195@01 (/ (to_real 1) (to_real 2)))
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
      (<
        (ite
          (and
            (Set_in (inv@200@01 r) (refs $Snap.unit r@190@01))
            (img@201@01 r)
            (= r (inv@200@01 r)))
          (* $k@199@01 (/ (to_real 1) (to_real 2)))
          $Perm.No)
        (* $k@195@01 (/ (to_real 1) (to_real 2))))
      (<
        (ite
          (and
            (Set_in (inv@200@01 r) (refs $Snap.unit r@190@01))
            (img@201@01 r)
            (= r (inv@200@01 r)))
          (* $k@199@01 (/ (to_real 1) (to_real 2)))
          $Perm.No)
        $Perm.No)))
  :pattern ((img@197@01 r))
  :pattern ((Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
  :pattern ((Set_in (inv@200@01 r) (refs $Snap.unit r@190@01)))
  :pattern ((img@201@01 r))
  :qid |qp.srp38|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@200@01 r) (refs $Snap.unit r@190@01))
      (img@201@01 r)
      (= r (inv@200@01 r)))
    (= (- (* $k@199@01 (/ (to_real 1) (to_real 2))) (pTaken@202@01 r)) $Perm.No))
  
  :qid |quant-u-189|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@203@01 $FVF<q>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_q (as sm@203@01  $FVF<q>)))
      (and
        (Set_in (inv@200@01 r) (refs $Snap.unit r@190@01))
        (< $Perm.No (* $k@199@01 (/ (to_real 1) (to_real 2))))
        (img@201@01 r)))
    (=>
      (and
        (Set_in (inv@200@01 r) (refs $Snap.unit r@190@01))
        (< $Perm.No (* $k@199@01 (/ (to_real 1) (to_real 2))))
        (img@201@01 r))
      (Set_in r ($FVF.domain_q (as sm@203@01  $FVF<q>)))))
  :pattern ((Set_in r ($FVF.domain_q (as sm@203@01  $FVF<q>))))
  :qid |qp.fvfDomDef40|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@200@01 r) (refs $Snap.unit r@190@01))
        (< $Perm.No (* $k@199@01 (/ (to_real 1) (to_real 2))))
        (img@201@01 r))
      (ite
        (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
        (< $Perm.No (* $k@195@01 (/ (to_real 1) (to_real 2))))
        false))
    (= ($FVF.lookup_q (as sm@203@01  $FVF<q>) r) ($FVF.lookup_q $t@191@01 r)))
  :pattern (($FVF.lookup_q (as sm@203@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@191@01 r))
  :qid |qp.fvfValDef39|)))
(assert (R%trigger ($SortWrappers.$FVF<q>To$Snap (as sm@203@01  $FVF<q>)) r@190@01))
(assert (=
  ($SortWrappers.$FVF<q>To$Snap $t@191@01)
  ($SortWrappers.$FVF<q>To$Snap (as sm@203@01  $FVF<q>))))
; [exec]
; unfold acc(R(r), 1 / 2)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@204@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@190@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@190@01))
(assert (Set_in e@204@01 (refs $Snap.unit r@190@01)))
(declare-const $k@205@01 $Perm)
(assert ($Perm.isReadVar $k@205@01))
(pop) ; 3
(declare-fun inv@206@01 ($Ref) $Ref)
(declare-fun img@207@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@205@01))
; Nested auxiliary terms: non-globals
(assert (forall ((e@204@01 $Ref)) (!
  (=>
    (Set_in e@204@01 (refs $Snap.unit r@190@01))
    (refs%precondition $Snap.unit r@190@01))
  :pattern ((Set_in e@204@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@206@01 e@204@01))
  :pattern ((img@207@01 e@204@01))
  :qid |q-aux|)))
(push) ; 3
(assert (not (forall ((e@204@01 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@190@01)
      (Set_in e@204@01 (refs $Snap.unit r@190@01)))
    (or (= $k@205@01 $Perm.No) (< $Perm.No $k@205@01)))
  
  :qid |quant-u-190|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@204@01 $Ref) (e2@204@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@190@01)
    (=>
      (and (Set_in e1@204@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@205@01))
      (refs%precondition $Snap.unit r@190@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@204@01 $Ref) (e2@204@01 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@204@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@205@01))
      (and (Set_in e2@204@01 (refs $Snap.unit r@190@01)) (< $Perm.No $k@205@01))
      (= e1@204@01 e2@204@01))
    (= e1@204@01 e2@204@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@204@01 $Ref)) (!
  (refs%precondition $Snap.unit r@190@01)
  :pattern ((Set_in e@204@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@206@01 e@204@01))
  :pattern ((img@207@01 e@204@01))
  :qid |quant-u-191|)))
(assert (forall ((r $Ref)) (!
  (=> (img@207@01 r) (refs%precondition $Snap.unit r@190@01))
  :pattern ((inv@206@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@204@01 $Ref)) (!
  (=>
    (and
      (Set_in e@204@01 (refs $Snap.unit r@190@01))
      (< $Perm.No (* $k@205@01 (/ (to_real 1) (to_real 2)))))
    (and (= (inv@206@01 e@204@01) e@204@01) (img@207@01 e@204@01)))
  :pattern ((Set_in e@204@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@206@01 e@204@01))
  :pattern ((img@207@01 e@204@01))
  :qid |quant-u-191|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@207@01 r)
      (and
        (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01))
        (< $Perm.No (* $k@205@01 (/ (to_real 1) (to_real 2))))))
    (= (inv@206@01 r) r))
  :pattern ((inv@206@01 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@204@01 $Ref)) (!
  (<= $Perm.No (* $k@205@01 (/ (to_real 1) (to_real 2))))
  :pattern ((Set_in e@204@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@206@01 e@204@01))
  :pattern ((img@207@01 e@204@01))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@204@01 $Ref)) (!
  (<= (* $k@205@01 (/ (to_real 1) (to_real 2))) $Perm.Write)
  :pattern ((Set_in e@204@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@206@01 e@204@01))
  :pattern ((img@207@01 e@204@01))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@204@01 $Ref)) (!
  (=>
    (and
      (Set_in e@204@01 (refs $Snap.unit r@190@01))
      (< $Perm.No (* $k@205@01 (/ (to_real 1) (to_real 2)))))
    (not (= e@204@01 $Ref.null)))
  :pattern ((Set_in e@204@01 (refs $Snap.unit r@190@01)))
  :pattern ((inv@206@01 e@204@01))
  :pattern ((img@207@01 e@204@01))
  :qid |q-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@204@01 e@194@01)
    (=
      (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))
      (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))))
  
  :qid |quant-u-192|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; r2 := testerfield(get(r))
; [eval] testerfield(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition $Snap.unit r@190@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition $Snap.unit r@190@01))
(push) ; 3
(declare-const $k@208@01 $Perm)
(assert ($Perm.isReadVar $k@208@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@209@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@190@01))
    ($Perm.min
      (ite
        (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
        (- (* $k@195@01 (/ (to_real 1) (to_real 2))) (pTaken@202@01 r))
        $Perm.No)
      $k@208@01)
    $Perm.No))
(define-fun pTaken@210@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@190@01))
    ($Perm.min
      (ite
        (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))
        (* $k@205@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (- $k@208@01 (pTaken@209@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@208@01
(assert (=>
  (not
    (=
      (ite
        (and
          (img@197@01 (get $Snap.unit r@190@01))
          (Set_in (inv@196@01 (get $Snap.unit r@190@01)) (refs $Snap.unit r@190@01)))
        (-
          (* $k@195@01 (/ (to_real 1) (to_real 2)))
          (pTaken@202@01 (get $Snap.unit r@190@01)))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@197@01 (get $Snap.unit r@190@01))
      (Set_in (inv@196@01 (get $Snap.unit r@190@01)) (refs $Snap.unit r@190@01)))
    (<
      (ite
        (= (get $Snap.unit r@190@01) (get $Snap.unit r@190@01))
        $k@208@01
        $Perm.No)
      (-
        (* $k@195@01 (/ (to_real 1) (to_real 2)))
        (pTaken@202@01 (get $Snap.unit r@190@01))))
    (<
      (ite
        (= (get $Snap.unit r@190@01) (get $Snap.unit r@190@01))
        $k@208@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@190@01))
    (= (- $k@208@01 (pTaken@209@01 r)) $Perm.No))
  
  :qid |quant-u-195|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@211@01 $FVF<q>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@197@01 (get $Snap.unit r@190@01))
      (Set_in (inv@196@01 (get $Snap.unit r@190@01)) (refs $Snap.unit r@190@01)))
    (<
      $Perm.No
      (-
        (* $k@195@01 (/ (to_real 1) (to_real 2)))
        (pTaken@202@01 (get $Snap.unit r@190@01))))
    false)
  (=
    ($FVF.lookup_q (as sm@211@01  $FVF<q>) (get $Snap.unit r@190@01))
    ($FVF.lookup_q $t@191@01 (get $Snap.unit r@190@01)))))
(assert (=>
  (ite
    (and
      (img@207@01 (get $Snap.unit r@190@01))
      (Set_in (inv@206@01 (get $Snap.unit r@190@01)) (refs $Snap.unit r@190@01)))
    (< $Perm.No (* $k@205@01 (/ (to_real 1) (to_real 2))))
    false)
  (=
    ($FVF.lookup_q (as sm@211@01  $FVF<q>) (get $Snap.unit r@190@01))
    ($FVF.lookup_q $t@191@01 (get $Snap.unit r@190@01)))))
(assert (testerfield%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@211@01  $FVF<q>) (get $Snap.unit r@190@01))) (get $Snap.unit r@190@01)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@208@01))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@197@01 (get $Snap.unit r@190@01))
            (Set_in (inv@196@01 (get $Snap.unit r@190@01)) (refs $Snap.unit r@190@01)))
          (-
            (* $k@195@01 (/ (to_real 1) (to_real 2)))
            (pTaken@202@01 (get $Snap.unit r@190@01)))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@197@01 (get $Snap.unit r@190@01))
        (Set_in (inv@196@01 (get $Snap.unit r@190@01)) (refs $Snap.unit r@190@01)))
      (<
        (ite
          (= (get $Snap.unit r@190@01) (get $Snap.unit r@190@01))
          $k@208@01
          $Perm.No)
        (-
          (* $k@195@01 (/ (to_real 1) (to_real 2)))
          (pTaken@202@01 (get $Snap.unit r@190@01))))
      (<
        (ite
          (= (get $Snap.unit r@190@01) (get $Snap.unit r@190@01))
          $k@208@01
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (and
        (img@197@01 (get $Snap.unit r@190@01))
        (Set_in (inv@196@01 (get $Snap.unit r@190@01)) (refs $Snap.unit r@190@01)))
      (<
        $Perm.No
        (-
          (* $k@195@01 (/ (to_real 1) (to_real 2)))
          (pTaken@202@01 (get $Snap.unit r@190@01))))
      false)
    (=
      ($FVF.lookup_q (as sm@211@01  $FVF<q>) (get $Snap.unit r@190@01))
      ($FVF.lookup_q $t@191@01 (get $Snap.unit r@190@01))))
  (=>
    (ite
      (and
        (img@207@01 (get $Snap.unit r@190@01))
        (Set_in (inv@206@01 (get $Snap.unit r@190@01)) (refs $Snap.unit r@190@01)))
      (< $Perm.No (* $k@205@01 (/ (to_real 1) (to_real 2))))
      false)
    (=
      ($FVF.lookup_q (as sm@211@01  $FVF<q>) (get $Snap.unit r@190@01))
      ($FVF.lookup_q $t@191@01 (get $Snap.unit r@190@01))))
  (testerfield%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@211@01  $FVF<q>) (get $Snap.unit r@190@01))) (get $Snap.unit r@190@01))))
(declare-const r2@212@01 $Ref)
(assert (=
  r2@212@01
  (testerfield ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@211@01  $FVF<q>) (get $Snap.unit r@190@01))) (get $Snap.unit r@190@01))))
; [exec]
; r3 := testerfieldFull(get(r))
; [eval] testerfieldFull(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@213@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@190@01))
    ($Perm.min
      (ite
        (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
        (- (* $k@195@01 (/ (to_real 1) (to_real 2))) (pTaken@202@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@214@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@190@01))
    ($Perm.min
      (ite
        (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))
        (* $k@205@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (- $Perm.Write (pTaken@213@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
        (- (* $k@195@01 (/ (to_real 1) (to_real 2))) (pTaken@202@01 r))
        $Perm.No)
      (pTaken@213@01 r))
    $Perm.No)
  
  :qid |quant-u-197|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@213@01 r) $Perm.No)
  
  :qid |quant-u-198|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@190@01))
    (= (- $Perm.Write (pTaken@213@01 r)) $Perm.No))
  
  :qid |quant-u-199|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))
        (* $k@205@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (pTaken@214@01 r))
    $Perm.No)
  
  :qid |quant-u-200|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@214@01 r) $Perm.No)
  
  :qid |quant-u-201|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@190@01))
    (= (- (- $Perm.Write (pTaken@213@01 r)) (pTaken@214@01 r)) $Perm.No))
  
  :qid |quant-u-202|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@190@01))
    (= (- (- $Perm.Write (pTaken@213@01 r)) (pTaken@214@01 r)) $Perm.No))
  
  :qid |quant-u-202|))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@194@01 e@204@01)
    (=
      (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
      (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))))
  
  :qid |quant-u-203|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
      (<
        $Perm.No
        (- (* $k@195@01 (/ (to_real 1) (to_real 2))) (pTaken@202@01 r)))
      false)
    (= ($FVF.lookup_q (as sm@211@01  $FVF<q>) r) ($FVF.lookup_q $t@191@01 r)))
  :pattern (($FVF.lookup_q (as sm@211@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@191@01 r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))
      (< $Perm.No (* $k@205@01 (/ (to_real 1) (to_real 2))))
      false)
    (= ($FVF.lookup_q (as sm@211@01  $FVF<q>) r) ($FVF.lookup_q $t@191@01 r)))
  :pattern (($FVF.lookup_q (as sm@211@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@191@01 r))
  :qid |qp.fvfValDef43|)))
(declare-const pm@215@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_q (as pm@215@01  $FPM) r)
    (+
      (ite
        (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
        (- (* $k@195@01 (/ (to_real 1) (to_real 2))) (pTaken@202@01 r))
        $Perm.No)
      (ite
        (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))
        (* $k@205@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)))
  :pattern (($FVF.perm_q (as pm@215@01  $FPM) r))
  :qid |qp.resPrmSumDef44|)))
; Assume upper permission bound for field q
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_q (as pm@215@01  $FPM) r) $Perm.Write)
  :pattern ((inv@196@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field q
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_q (as pm@215@01  $FPM) r) $Perm.Write)
  :pattern ((inv@206@01 r))
  :qid |qp-fld-prm-bnd|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@216@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@190@01))
    ($Perm.min
      (ite
        (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))
        (* $k@205@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@217@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@190@01))
    ($Perm.min
      (ite
        (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
        (- (* $k@195@01 (/ (to_real 1) (to_real 2))) (pTaken@202@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@216@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@207@01 r) (Set_in (inv@206@01 r) (refs $Snap.unit r@190@01)))
        (* $k@205@01 (/ (to_real 1) (to_real 2)))
        $Perm.No)
      (pTaken@216@01 r))
    $Perm.No)
  
  :qid |quant-u-205|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@216@01 r) $Perm.No)
  
  :qid |quant-u-206|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@190@01))
    (= (- $Perm.Write (pTaken@216@01 r)) $Perm.No))
  
  :qid |quant-u-207|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@197@01 r) (Set_in (inv@196@01 r) (refs $Snap.unit r@190@01)))
        (- (* $k@195@01 (/ (to_real 1) (to_real 2))) (pTaken@202@01 r))
        $Perm.No)
      (pTaken@217@01 r))
    $Perm.No)
  
  :qid |quant-u-208|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@217@01 r) $Perm.No)
  
  :qid |quant-u-209|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@190@01))
    (= (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@217@01 r)) $Perm.No))
  
  :qid |quant-u-210|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@190@01))
    (= (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@217@01 r)) $Perm.No))
  
  :qid |quant-u-210|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- func4 ----------
(declare-const r@218@01 $Ref)
(declare-const r@219@01 $Ref)
(push) ; 1
(declare-const $t@220@01 $FVF<q>)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var r2: Ref
(declare-const r2@221@01 $Ref)
; [exec]
; var r3: Ref
(declare-const r3@222@01 $Ref)
; [exec]
; unfold acc(R2(r), wildcard)
(declare-const $k@223@01 $Perm)
(assert ($Perm.isReadVar $k@223@01))
(assert (< $k@223@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@223@01)))
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@223@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@224@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@219@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@219@01))
(assert (Set_in e@224@01 (refs $Snap.unit r@219@01)))
(pop) ; 3
(declare-fun inv@225@01 ($Ref) $Ref)
(declare-fun img@226@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((e@224@01 $Ref)) (!
  (=>
    (Set_in e@224@01 (refs $Snap.unit r@219@01))
    (refs%precondition $Snap.unit r@219@01))
  :pattern ((Set_in e@224@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@225@01 e@224@01))
  :pattern ((img@226@01 e@224@01))
  :qid |q-aux|)))
; Check receiver injectivity
(assert (forall ((e1@224@01 $Ref) (e2@224@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@219@01)
    (=>
      (Set_in e1@224@01 (refs $Snap.unit r@219@01))
      (refs%precondition $Snap.unit r@219@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@224@01 $Ref) (e2@224@01 $Ref)) (!
  (=>
    (and
      (Set_in e1@224@01 (refs $Snap.unit r@219@01))
      (Set_in e2@224@01 (refs $Snap.unit r@219@01))
      (= e1@224@01 e2@224@01))
    (= e1@224@01 e2@224@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@224@01 $Ref)) (!
  (refs%precondition $Snap.unit r@219@01)
  :pattern ((Set_in e@224@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@225@01 e@224@01))
  :pattern ((img@226@01 e@224@01))
  :qid |quant-u-212|)))
(assert (forall ((r $Ref)) (!
  (=> (img@226@01 r) (refs%precondition $Snap.unit r@219@01))
  :pattern ((inv@225@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@224@01 $Ref)) (!
  (=>
    (and
      (Set_in e@224@01 (refs $Snap.unit r@219@01))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@223@01)))
    (and (= (inv@225@01 e@224@01) e@224@01) (img@226@01 e@224@01)))
  :pattern ((Set_in e@224@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@225@01 e@224@01))
  :pattern ((img@226@01 e@224@01))
  :qid |quant-u-212|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@226@01 r)
      (and
        (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@223@01))))
    (= (inv@225@01 r) r))
  :pattern ((inv@225@01 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@224@01 $Ref)) (!
  (<= $Perm.No (* (/ (to_real 1) (to_real 2)) $k@223@01))
  :pattern ((Set_in e@224@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@225@01 e@224@01))
  :pattern ((img@226@01 e@224@01))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@224@01 $Ref)) (!
  (<= (* (/ (to_real 1) (to_real 2)) $k@223@01) $Perm.Write)
  :pattern ((Set_in e@224@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@225@01 e@224@01))
  :pattern ((img@226@01 e@224@01))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@224@01 $Ref)) (!
  (=>
    (and
      (Set_in e@224@01 (refs $Snap.unit r@219@01))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@223@01)))
    (not (= e@224@01 $Ref.null)))
  :pattern ((Set_in e@224@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@225@01 e@224@01))
  :pattern ((img@226@01 e@224@01))
  :qid |q-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (R2%trigger ($SortWrappers.$FVF<q>To$Snap $t@220@01) r@219@01))
; [exec]
; fold acc(R2(r), wildcard)
(declare-const $k@227@01 $Perm)
(assert ($Perm.isReadVar $k@227@01))
(declare-const e@228@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@219@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@219@01))
(assert (Set_in e@228@01 (refs $Snap.unit r@219@01)))
(pop) ; 3
(declare-fun inv@229@01 ($Ref) $Ref)
(declare-fun img@230@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((e@228@01 $Ref)) (!
  (=>
    (Set_in e@228@01 (refs $Snap.unit r@219@01))
    (refs%precondition $Snap.unit r@219@01))
  :pattern ((Set_in e@228@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@229@01 e@228@01))
  :pattern ((img@230@01 e@228@01))
  :qid |q-aux|)))
; Check receiver injectivity
(assert (forall ((e1@228@01 $Ref) (e2@228@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@219@01)
    (=>
      (Set_in e1@228@01 (refs $Snap.unit r@219@01))
      (refs%precondition $Snap.unit r@219@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@228@01 $Ref) (e2@228@01 $Ref)) (!
  (=>
    (and
      (Set_in e1@228@01 (refs $Snap.unit r@219@01))
      (Set_in e2@228@01 (refs $Snap.unit r@219@01))
      (= e1@228@01 e2@228@01))
    (= e1@228@01 e2@228@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@228@01 $Ref)) (!
  (refs%precondition $Snap.unit r@219@01)
  :pattern ((Set_in e@228@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@229@01 e@228@01))
  :pattern ((img@230@01 e@228@01))
  :qid |q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (img@230@01 r) (refs%precondition $Snap.unit r@219@01))
  :pattern ((inv@229@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@228@01 $Ref)) (!
  (=>
    (Set_in e@228@01 (refs $Snap.unit r@219@01))
    (and (= (inv@229@01 e@228@01) e@228@01) (img@230@01 e@228@01)))
  :pattern ((Set_in e@228@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@229@01 e@228@01))
  :pattern ((img@230@01 e@228@01))
  :qid |q-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@230@01 r) (Set_in (inv@229@01 r) (refs $Snap.unit r@219@01)))
    (= (inv@229@01 r) r))
  :pattern ((inv@229@01 r))
  :qid |q-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@231@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@229@01 r) (refs $Snap.unit r@219@01))
      (img@230@01 r)
      (= r (inv@229@01 r)))
    ($Perm.min
      (ite
        (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
        (* (/ (to_real 1) (to_real 2)) $k@223@01)
        $Perm.No)
      (* (/ (to_real 1) (to_real 2)) $k@227@01))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions 1/2 * $k@227@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
          (* (/ (to_real 1) (to_real 2)) $k@223@01)
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
      (<
        (ite
          (and
            (Set_in (inv@229@01 r) (refs $Snap.unit r@219@01))
            (img@230@01 r)
            (= r (inv@229@01 r)))
          (* (/ (to_real 1) (to_real 2)) $k@227@01)
          $Perm.No)
        (* (/ (to_real 1) (to_real 2)) $k@223@01))
      (<
        (ite
          (and
            (Set_in (inv@229@01 r) (refs $Snap.unit r@219@01))
            (img@230@01 r)
            (= r (inv@229@01 r)))
          (* (/ (to_real 1) (to_real 2)) $k@227@01)
          $Perm.No)
        $Perm.No)))
  :pattern ((img@226@01 r))
  :pattern ((Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
  :pattern ((Set_in (inv@229@01 r) (refs $Snap.unit r@219@01)))
  :pattern ((img@230@01 r))
  :qid |qp.srp45|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@229@01 r) (refs $Snap.unit r@219@01))
      (img@230@01 r)
      (= r (inv@229@01 r)))
    (= (- (* (/ (to_real 1) (to_real 2)) $k@227@01) (pTaken@231@01 r)) $Perm.No))
  
  :qid |quant-u-216|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@232@01 $FVF<q>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_q (as sm@232@01  $FVF<q>)))
      (and
        (Set_in (inv@229@01 r) (refs $Snap.unit r@219@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@227@01))
        (img@230@01 r)))
    (=>
      (and
        (Set_in (inv@229@01 r) (refs $Snap.unit r@219@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@227@01))
        (img@230@01 r))
      (Set_in r ($FVF.domain_q (as sm@232@01  $FVF<q>)))))
  :pattern ((Set_in r ($FVF.domain_q (as sm@232@01  $FVF<q>))))
  :qid |qp.fvfDomDef47|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@229@01 r) (refs $Snap.unit r@219@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@227@01))
        (img@230@01 r))
      (ite
        (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@223@01))
        false))
    (= ($FVF.lookup_q (as sm@232@01  $FVF<q>) r) ($FVF.lookup_q $t@220@01 r)))
  :pattern (($FVF.lookup_q (as sm@232@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@220@01 r))
  :qid |qp.fvfValDef46|)))
(assert (R2%trigger ($SortWrappers.$FVF<q>To$Snap (as sm@232@01  $FVF<q>)) r@219@01))
(declare-const $t@233@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write $k@223@01))
    (= $t@233@01 ($SortWrappers.$FVF<q>To$Snap $t@220@01)))
  (=>
    (< $Perm.No $k@227@01)
    (= $t@233@01 ($SortWrappers.$FVF<q>To$Snap (as sm@232@01  $FVF<q>))))))
(assert (<= $Perm.No (+ (- $Perm.Write $k@223@01) $k@227@01)))
; [exec]
; unfold acc(R2(r), wildcard)
(declare-const $k@234@01 $Perm)
(assert ($Perm.isReadVar $k@234@01))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (+ (- $Perm.Write $k@223@01) $k@227@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@234@01 (+ (- $Perm.Write $k@223@01) $k@227@01)))
(assert (<= $Perm.No (- (+ (- $Perm.Write $k@223@01) $k@227@01) $k@234@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@234@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const e@235@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 4
(assert (refs%precondition $Snap.unit r@219@01))
(pop) ; 4
; Joined path conditions
(assert (refs%precondition $Snap.unit r@219@01))
(assert (Set_in e@235@01 (refs $Snap.unit r@219@01)))
(pop) ; 3
(declare-fun inv@236@01 ($Ref) $Ref)
(declare-fun img@237@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((e@235@01 $Ref)) (!
  (=>
    (Set_in e@235@01 (refs $Snap.unit r@219@01))
    (refs%precondition $Snap.unit r@219@01))
  :pattern ((Set_in e@235@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@236@01 e@235@01))
  :pattern ((img@237@01 e@235@01))
  :qid |q-aux|)))
; Check receiver injectivity
(assert (forall ((e1@235@01 $Ref) (e2@235@01 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@219@01)
    (=>
      (Set_in e1@235@01 (refs $Snap.unit r@219@01))
      (refs%precondition $Snap.unit r@219@01)))
  
  :qid |q-rcvrInj|)))
(push) ; 3
(assert (not (forall ((e1@235@01 $Ref) (e2@235@01 $Ref)) (!
  (=>
    (and
      (Set_in e1@235@01 (refs $Snap.unit r@219@01))
      (Set_in e2@235@01 (refs $Snap.unit r@219@01))
      (= e1@235@01 e2@235@01))
    (= e1@235@01 e2@235@01))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@235@01 $Ref)) (!
  (refs%precondition $Snap.unit r@219@01)
  :pattern ((Set_in e@235@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@236@01 e@235@01))
  :pattern ((img@237@01 e@235@01))
  :qid |quant-u-218|)))
(assert (forall ((r $Ref)) (!
  (=> (img@237@01 r) (refs%precondition $Snap.unit r@219@01))
  :pattern ((inv@236@01 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@235@01 $Ref)) (!
  (=>
    (and
      (Set_in e@235@01 (refs $Snap.unit r@219@01))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@234@01)))
    (and (= (inv@236@01 e@235@01) e@235@01) (img@237@01 e@235@01)))
  :pattern ((Set_in e@235@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@236@01 e@235@01))
  :pattern ((img@237@01 e@235@01))
  :qid |quant-u-218|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@237@01 r)
      (and
        (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01))
        (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@234@01))))
    (= (inv@236@01 r) r))
  :pattern ((inv@236@01 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@235@01 $Ref)) (!
  (<= $Perm.No (* (/ (to_real 1) (to_real 2)) $k@234@01))
  :pattern ((Set_in e@235@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@236@01 e@235@01))
  :pattern ((img@237@01 e@235@01))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@235@01 $Ref)) (!
  (<= (* (/ (to_real 1) (to_real 2)) $k@234@01) $Perm.Write)
  :pattern ((Set_in e@235@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@236@01 e@235@01))
  :pattern ((img@237@01 e@235@01))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@235@01 $Ref)) (!
  (=>
    (and
      (Set_in e@235@01 (refs $Snap.unit r@219@01))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@234@01)))
    (not (= e@235@01 $Ref.null)))
  :pattern ((Set_in e@235@01 (refs $Snap.unit r@219@01)))
  :pattern ((inv@236@01 e@235@01))
  :pattern ((img@237@01 e@235@01))
  :qid |q-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@235@01 e@224@01)
    (=
      (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))
      (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))))
  
  :qid |quant-u-219|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (R2%trigger $t@233@01 r@219@01))
; [exec]
; r2 := testerfield(get(r))
; [eval] testerfield(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(assert (get%precondition $Snap.unit r@219@01))
(pop) ; 3
; Joined path conditions
(assert (get%precondition $Snap.unit r@219@01))
(push) ; 3
(declare-const $k@238@01 $Perm)
(assert ($Perm.isReadVar $k@238@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@239@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@219@01))
    ($Perm.min
      (ite
        (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@223@01) (pTaken@231@01 r))
        $Perm.No)
      $k@238@01)
    $Perm.No))
(define-fun pTaken@240@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@219@01))
    ($Perm.min
      (ite
        (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))
        (* (/ (to_real 1) (to_real 2)) $k@234@01)
        $Perm.No)
      (- $k@238@01 (pTaken@239@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@238@01
(assert (=>
  (not
    (=
      (ite
        (and
          (img@226@01 (get $Snap.unit r@219@01))
          (Set_in (inv@225@01 (get $Snap.unit r@219@01)) (refs $Snap.unit r@219@01)))
        (-
          (* (/ (to_real 1) (to_real 2)) $k@223@01)
          (pTaken@231@01 (get $Snap.unit r@219@01)))
        $Perm.No)
      $Perm.No))
  (ite
    (and
      (img@226@01 (get $Snap.unit r@219@01))
      (Set_in (inv@225@01 (get $Snap.unit r@219@01)) (refs $Snap.unit r@219@01)))
    (<
      (ite
        (= (get $Snap.unit r@219@01) (get $Snap.unit r@219@01))
        $k@238@01
        $Perm.No)
      (-
        (* (/ (to_real 1) (to_real 2)) $k@223@01)
        (pTaken@231@01 (get $Snap.unit r@219@01))))
    (<
      (ite
        (= (get $Snap.unit r@219@01) (get $Snap.unit r@219@01))
        $k@238@01
        $Perm.No)
      $Perm.No))))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@219@01))
    (= (- $k@238@01 (pTaken@239@01 r)) $Perm.No))
  
  :qid |quant-u-222|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@241@01 $FVF<q>)
; Definitional axioms for snapshot map domain (instantiated)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@226@01 (get $Snap.unit r@219@01))
      (Set_in (inv@225@01 (get $Snap.unit r@219@01)) (refs $Snap.unit r@219@01)))
    (<
      $Perm.No
      (-
        (* (/ (to_real 1) (to_real 2)) $k@223@01)
        (pTaken@231@01 (get $Snap.unit r@219@01))))
    false)
  (=
    ($FVF.lookup_q (as sm@241@01  $FVF<q>) (get $Snap.unit r@219@01))
    ($FVF.lookup_q $t@220@01 (get $Snap.unit r@219@01)))))
(assert (=>
  (ite
    (and
      (img@237@01 (get $Snap.unit r@219@01))
      (Set_in (inv@236@01 (get $Snap.unit r@219@01)) (refs $Snap.unit r@219@01)))
    (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@234@01))
    false)
  (=
    ($FVF.lookup_q (as sm@241@01  $FVF<q>) (get $Snap.unit r@219@01))
    ($FVF.lookup_q ($SortWrappers.$SnapTo$FVF<q> $t@233@01) (get $Snap.unit r@219@01)))))
(assert (testerfield%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@241@01  $FVF<q>) (get $Snap.unit r@219@01))) (get $Snap.unit r@219@01)))
(pop) ; 3
; Joined path conditions
(assert ($Perm.isReadVar $k@238@01))
(assert (and
  (=>
    (not
      (=
        (ite
          (and
            (img@226@01 (get $Snap.unit r@219@01))
            (Set_in (inv@225@01 (get $Snap.unit r@219@01)) (refs $Snap.unit r@219@01)))
          (-
            (* (/ (to_real 1) (to_real 2)) $k@223@01)
            (pTaken@231@01 (get $Snap.unit r@219@01)))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@226@01 (get $Snap.unit r@219@01))
        (Set_in (inv@225@01 (get $Snap.unit r@219@01)) (refs $Snap.unit r@219@01)))
      (<
        (ite
          (= (get $Snap.unit r@219@01) (get $Snap.unit r@219@01))
          $k@238@01
          $Perm.No)
        (-
          (* (/ (to_real 1) (to_real 2)) $k@223@01)
          (pTaken@231@01 (get $Snap.unit r@219@01))))
      (<
        (ite
          (= (get $Snap.unit r@219@01) (get $Snap.unit r@219@01))
          $k@238@01
          $Perm.No)
        $Perm.No)))
  (=>
    (ite
      (and
        (img@226@01 (get $Snap.unit r@219@01))
        (Set_in (inv@225@01 (get $Snap.unit r@219@01)) (refs $Snap.unit r@219@01)))
      (<
        $Perm.No
        (-
          (* (/ (to_real 1) (to_real 2)) $k@223@01)
          (pTaken@231@01 (get $Snap.unit r@219@01))))
      false)
    (=
      ($FVF.lookup_q (as sm@241@01  $FVF<q>) (get $Snap.unit r@219@01))
      ($FVF.lookup_q $t@220@01 (get $Snap.unit r@219@01))))
  (=>
    (ite
      (and
        (img@237@01 (get $Snap.unit r@219@01))
        (Set_in (inv@236@01 (get $Snap.unit r@219@01)) (refs $Snap.unit r@219@01)))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@234@01))
      false)
    (=
      ($FVF.lookup_q (as sm@241@01  $FVF<q>) (get $Snap.unit r@219@01))
      ($FVF.lookup_q ($SortWrappers.$SnapTo$FVF<q> $t@233@01) (get $Snap.unit r@219@01))))
  (testerfield%precondition ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@241@01  $FVF<q>) (get $Snap.unit r@219@01))) (get $Snap.unit r@219@01))))
(declare-const r2@242@01 $Ref)
(assert (=
  r2@242@01
  (testerfield ($SortWrappers.$RefTo$Snap ($FVF.lookup_q (as sm@241@01  $FVF<q>) (get $Snap.unit r@219@01))) (get $Snap.unit r@219@01))))
; [exec]
; r3 := testerfieldFull(get(r))
; [eval] testerfieldFull(get(r))
; [eval] get(r)
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@243@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@219@01))
    ($Perm.min
      (ite
        (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@223@01) (pTaken@231@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@244@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@219@01))
    ($Perm.min
      (ite
        (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))
        (* (/ (to_real 1) (to_real 2)) $k@234@01)
        $Perm.No)
      (- $Perm.Write (pTaken@243@01 r)))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@223@01) (pTaken@231@01 r))
        $Perm.No)
      (pTaken@243@01 r))
    $Perm.No)
  
  :qid |quant-u-224|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@243@01 r) $Perm.No)
  
  :qid |quant-u-225|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@219@01))
    (= (- $Perm.Write (pTaken@243@01 r)) $Perm.No))
  
  :qid |quant-u-226|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))
        (* (/ (to_real 1) (to_real 2)) $k@234@01)
        $Perm.No)
      (pTaken@244@01 r))
    $Perm.No)
  
  :qid |quant-u-227|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@244@01 r) $Perm.No)
  
  :qid |quant-u-228|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@219@01))
    (= (- (- $Perm.Write (pTaken@243@01 r)) (pTaken@244@01 r)) $Perm.No))
  
  :qid |quant-u-229|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@219@01))
    (= (- (- $Perm.Write (pTaken@243@01 r)) (pTaken@244@01 r)) $Perm.No))
  
  :qid |quant-u-229|))))
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
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= e@224@01 e@235@01)
    (=
      (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
      (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))))
  
  :qid |quant-u-230|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
      (<
        $Perm.No
        (- (* (/ (to_real 1) (to_real 2)) $k@223@01) (pTaken@231@01 r)))
      false)
    (= ($FVF.lookup_q (as sm@241@01  $FVF<q>) r) ($FVF.lookup_q $t@220@01 r)))
  :pattern (($FVF.lookup_q (as sm@241@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q $t@220@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))
      (< $Perm.No (* (/ (to_real 1) (to_real 2)) $k@234@01))
      false)
    (=
      ($FVF.lookup_q (as sm@241@01  $FVF<q>) r)
      ($FVF.lookup_q ($SortWrappers.$SnapTo$FVF<q> $t@233@01) r)))
  :pattern (($FVF.lookup_q (as sm@241@01  $FVF<q>) r))
  :pattern (($FVF.lookup_q ($SortWrappers.$SnapTo$FVF<q> $t@233@01) r))
  :qid |qp.fvfValDef50|)))
(declare-const pm@245@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_q (as pm@245@01  $FPM) r)
    (+
      (ite
        (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@223@01) (pTaken@231@01 r))
        $Perm.No)
      (ite
        (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))
        (* (/ (to_real 1) (to_real 2)) $k@234@01)
        $Perm.No)))
  :pattern (($FVF.perm_q (as pm@245@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
; Assume upper permission bound for field q
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_q (as pm@245@01  $FPM) r) $Perm.Write)
  :pattern ((inv@225@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field q
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_q (as pm@245@01  $FPM) r) $Perm.Write)
  :pattern ((inv@236@01 r))
  :qid |qp-fld-prm-bnd|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@246@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@219@01))
    ($Perm.min
      (ite
        (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))
        (* (/ (to_real 1) (to_real 2)) $k@234@01)
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@247@01 ((r $Ref)) $Perm
  (ite
    (= r (get $Snap.unit r@219@01))
    ($Perm.min
      (ite
        (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@223@01) (pTaken@231@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@246@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@237@01 r) (Set_in (inv@236@01 r) (refs $Snap.unit r@219@01)))
        (* (/ (to_real 1) (to_real 2)) $k@234@01)
        $Perm.No)
      (pTaken@246@01 r))
    $Perm.No)
  
  :qid |quant-u-232|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@246@01 r) $Perm.No)
  
  :qid |quant-u-233|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@219@01))
    (= (- $Perm.Write (pTaken@246@01 r)) $Perm.No))
  
  :qid |quant-u-234|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@226@01 r) (Set_in (inv@225@01 r) (refs $Snap.unit r@219@01)))
        (- (* (/ (to_real 1) (to_real 2)) $k@223@01) (pTaken@231@01 r))
        $Perm.No)
      (pTaken@247@01 r))
    $Perm.No)
  
  :qid |quant-u-235|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@247@01 r) $Perm.No)
  
  :qid |quant-u-236|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@219@01))
    (= (- (- $Perm.Write (pTaken@246@01 r)) (pTaken@247@01 r)) $Perm.No))
  
  :qid |quant-u-237|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (get $Snap.unit r@219@01))
    (= (- (- $Perm.Write (pTaken@246@01 r)) (pTaken@247@01 r)) $Perm.No))
  
  :qid |quant-u-237|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 3
(pop) ; 2
(pop) ; 1
