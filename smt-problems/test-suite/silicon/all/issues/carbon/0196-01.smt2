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
; ---------- FUNCTION refs----------
(declare-fun r@0@00 () $Ref)
(declare-fun result@1@00 () Set<$Ref>)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (refs%limited s@$ r@0@00) (refs s@$ r@0@00))
  :pattern ((refs s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (refs%stateless r@0@00)
  :pattern ((refs%limited s@$ r@0@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION testerFull----------
(declare-fun r@2@00 () $Ref)
(declare-fun result@3@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (= (testerFull%limited s@$ r@2@00) (testerFull s@$ r@2@00))
  :pattern ((testerFull s@$ r@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref)) (!
  (testerFull%stateless r@2@00)
  :pattern ((testerFull%limited s@$ r@2@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION get----------
(declare-fun r@4@00 () $Ref)
(declare-fun result@5@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $t@12@00 $Snap)
(assert (= $t@12@00 $Snap.unit))
; [eval] (result in refs(r))
; [eval] refs(r)
(push) ; 2
(assert (refs%precondition $Snap.unit r@4@00))
(pop) ; 2
; Joined path conditions
(assert (refs%precondition $Snap.unit r@4@00))
(assert (Set_in result@5@00 (refs $Snap.unit r@4@00)))
(pop) ; 1
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
; ---------- FUNCTION testerfieldFull----------
(declare-fun r@6@00 () $Ref)
(declare-fun result@7@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (not (= r@6@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (= (testerfieldFull%limited s@$ r@6@00) (testerfieldFull s@$ r@6@00))
  :pattern ((testerfieldFull s@$ r@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@6@00 $Ref)) (!
  (testerfieldFull%stateless r@6@00)
  :pattern ((testerfieldFull%limited s@$ r@6@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION tester----------
(declare-fun r@8@00 () $Ref)
(declare-fun result@9@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@13@00 $Perm)
(assert ($Perm.isReadVar $k@13@00))
(assert (<= $Perm.No $k@13@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (= (tester%limited s@$ r@8@00) (tester s@$ r@8@00))
  :pattern ((tester s@$ r@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (r@8@00 $Ref)) (!
  (tester%stateless r@8@00)
  :pattern ((tester%limited s@$ r@8@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION testerfield----------
(declare-fun r@10@00 () $Ref)
(declare-fun result@11@00 () $Ref)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const $k@14@00 $Perm)
(assert ($Perm.isReadVar $k@14@00))
(assert (<= $Perm.No $k@14@00))
(assert (<= $k@14@00 $Perm.Write))
(assert (=> (< $Perm.No $k@14@00) (not (= r@10@00 $Ref.null))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (= (testerfield%limited s@$ r@10@00) (testerfield s@$ r@10@00))
  :pattern ((testerfield s@$ r@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (r@10@00 $Ref)) (!
  (testerfield%stateless r@10@00)
  :pattern ((testerfield%limited s@$ r@10@00))
  :qid |quant-u-11|)))
; ---------- P ----------
(declare-const r@15@00 $Ref)
(push) ; 1
(declare-const e@16@00 $Ref)
(push) ; 2
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 3
(assert (refs%precondition $Snap.unit r@15@00))
(pop) ; 3
; Joined path conditions
(assert (refs%precondition $Snap.unit r@15@00))
(assert (Set_in e@16@00 (refs $Snap.unit r@15@00)))
(declare-const $k@17@00 $Perm)
(assert ($Perm.isReadVar $k@17@00))
(pop) ; 2
(declare-const $t@18@00 $PSF<Q>)
(declare-fun inv@19@00 ($Ref) $Ref)
(declare-fun img@20@00 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@17@00))
; Nested auxiliary terms: non-globals
(assert (forall ((e@16@00 $Ref)) (!
  (=>
    (Set_in e@16@00 (refs $Snap.unit r@15@00))
    (refs%precondition $Snap.unit r@15@00))
  :pattern ((Set_in e@16@00 (refs $Snap.unit r@15@00)))
  :pattern ((inv@19@00 e@16@00))
  :pattern ((img@20@00 e@16@00))
  :qid |Q-aux|)))
(push) ; 2
(assert (not (forall ((e@16@00 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@15@00)
      (Set_in e@16@00 (refs $Snap.unit r@15@00)))
    (or (= $k@17@00 $Perm.No) (< $Perm.No $k@17@00)))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@16@00 $Ref) (e2@16@00 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@15@00)
    (=>
      (and (Set_in e1@16@00 (refs $Snap.unit r@15@00)) (< $Perm.No $k@17@00))
      (refs%precondition $Snap.unit r@15@00)))
  
  :qid |Q-rcvrInj|)))
(push) ; 2
(assert (not (forall ((e1@16@00 $Ref) (e2@16@00 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@16@00 (refs $Snap.unit r@15@00)) (< $Perm.No $k@17@00))
      (and (Set_in e2@16@00 (refs $Snap.unit r@15@00)) (< $Perm.No $k@17@00))
      (= e1@16@00 e2@16@00))
    (= e1@16@00 e2@16@00))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@16@00 $Ref)) (!
  (refs%precondition $Snap.unit r@15@00)
  :pattern ((Set_in e@16@00 (refs $Snap.unit r@15@00)))
  :pattern ((inv@19@00 e@16@00))
  :pattern ((img@20@00 e@16@00))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=> (img@20@00 r) (refs%precondition $Snap.unit r@15@00))
  :pattern ((inv@19@00 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@16@00 $Ref)) (!
  (=>
    (and (Set_in e@16@00 (refs $Snap.unit r@15@00)) (< $Perm.No $k@17@00))
    (and (= (inv@19@00 e@16@00) e@16@00) (img@20@00 e@16@00)))
  :pattern ((Set_in e@16@00 (refs $Snap.unit r@15@00)))
  :pattern ((inv@19@00 e@16@00))
  :pattern ((img@20@00 e@16@00))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@00 r)
      (and
        (Set_in (inv@19@00 r) (refs $Snap.unit r@15@00))
        (< $Perm.No $k@17@00)))
    (= (inv@19@00 r) r))
  :pattern ((inv@19@00 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@16@00 $Ref)) (!
  (<= $Perm.No $k@17@00)
  :pattern ((Set_in e@16@00 (refs $Snap.unit r@15@00)))
  :pattern ((inv@19@00 e@16@00))
  :pattern ((img@20@00 e@16@00))
  :qid |Q-permAtLeastZero|)))
(pop) ; 1
; ---------- P2 ----------
(declare-const r@21@00 $Ref)
(push) ; 1
(declare-const e@22@00 $Ref)
(push) ; 2
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 3
(assert (refs%precondition $Snap.unit r@21@00))
(pop) ; 3
; Joined path conditions
(assert (refs%precondition $Snap.unit r@21@00))
(assert (Set_in e@22@00 (refs $Snap.unit r@21@00)))
(pop) ; 2
(declare-const $t@23@00 $PSF<Q>)
(declare-fun inv@24@00 ($Ref) $Ref)
(declare-fun img@25@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((e@22@00 $Ref)) (!
  (=>
    (Set_in e@22@00 (refs $Snap.unit r@21@00))
    (refs%precondition $Snap.unit r@21@00))
  :pattern ((Set_in e@22@00 (refs $Snap.unit r@21@00)))
  :pattern ((inv@24@00 e@22@00))
  :pattern ((img@25@00 e@22@00))
  :qid |Q-aux|)))
; Check receiver injectivity
(assert (forall ((e1@22@00 $Ref) (e2@22@00 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@21@00)
    (=>
      (Set_in e1@22@00 (refs $Snap.unit r@21@00))
      (refs%precondition $Snap.unit r@21@00)))
  
  :qid |Q-rcvrInj|)))
(push) ; 2
(assert (not (forall ((e1@22@00 $Ref) (e2@22@00 $Ref)) (!
  (=>
    (and
      (Set_in e1@22@00 (refs $Snap.unit r@21@00))
      (Set_in e2@22@00 (refs $Snap.unit r@21@00))
      (= e1@22@00 e2@22@00))
    (= e1@22@00 e2@22@00))
  
  :qid |Q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@22@00 $Ref)) (!
  (refs%precondition $Snap.unit r@21@00)
  :pattern ((Set_in e@22@00 (refs $Snap.unit r@21@00)))
  :pattern ((inv@24@00 e@22@00))
  :pattern ((img@25@00 e@22@00))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=> (img@25@00 r) (refs%precondition $Snap.unit r@21@00))
  :pattern ((inv@24@00 r))
  :qid |Q-fctOfInv|)))
(assert (forall ((e@22@00 $Ref)) (!
  (=>
    (Set_in e@22@00 (refs $Snap.unit r@21@00))
    (and (= (inv@24@00 e@22@00) e@22@00) (img@25@00 e@22@00)))
  :pattern ((Set_in e@22@00 (refs $Snap.unit r@21@00)))
  :pattern ((inv@24@00 e@22@00))
  :pattern ((img@25@00 e@22@00))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@25@00 r) (Set_in (inv@24@00 r) (refs $Snap.unit r@21@00)))
    (= (inv@24@00 r) r))
  :pattern ((inv@24@00 r))
  :qid |Q-fctOfInv|)))
; Permissions are non-negative
(pop) ; 1
; ---------- R ----------
(declare-const r@26@00 $Ref)
(push) ; 1
(declare-const e@27@00 $Ref)
(push) ; 2
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 3
(assert (refs%precondition $Snap.unit r@26@00))
(pop) ; 3
; Joined path conditions
(assert (refs%precondition $Snap.unit r@26@00))
(assert (Set_in e@27@00 (refs $Snap.unit r@26@00)))
(declare-const $k@28@00 $Perm)
(assert ($Perm.isReadVar $k@28@00))
(pop) ; 2
(declare-const $t@29@00 $FVF<q>)
(declare-fun inv@30@00 ($Ref) $Ref)
(declare-fun img@31@00 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@28@00))
; Nested auxiliary terms: non-globals
(assert (forall ((e@27@00 $Ref)) (!
  (=>
    (Set_in e@27@00 (refs $Snap.unit r@26@00))
    (refs%precondition $Snap.unit r@26@00))
  :pattern ((Set_in e@27@00 (refs $Snap.unit r@26@00)))
  :pattern ((inv@30@00 e@27@00))
  :pattern ((img@31@00 e@27@00))
  :qid |q-aux|)))
(push) ; 2
(assert (not (forall ((e@27@00 $Ref)) (!
  (=>
    (and
      (refs%precondition $Snap.unit r@26@00)
      (Set_in e@27@00 (refs $Snap.unit r@26@00)))
    (or (= $k@28@00 $Perm.No) (< $Perm.No $k@28@00)))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(assert (forall ((e1@27@00 $Ref) (e2@27@00 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@26@00)
    (=>
      (and (Set_in e1@27@00 (refs $Snap.unit r@26@00)) (< $Perm.No $k@28@00))
      (refs%precondition $Snap.unit r@26@00)))
  
  :qid |q-rcvrInj|)))
(push) ; 2
(assert (not (forall ((e1@27@00 $Ref) (e2@27@00 $Ref)) (!
  (=>
    (and
      (and (Set_in e1@27@00 (refs $Snap.unit r@26@00)) (< $Perm.No $k@28@00))
      (and (Set_in e2@27@00 (refs $Snap.unit r@26@00)) (< $Perm.No $k@28@00))
      (= e1@27@00 e2@27@00))
    (= e1@27@00 e2@27@00))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@27@00 $Ref)) (!
  (refs%precondition $Snap.unit r@26@00)
  :pattern ((Set_in e@27@00 (refs $Snap.unit r@26@00)))
  :pattern ((inv@30@00 e@27@00))
  :pattern ((img@31@00 e@27@00))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=> (img@31@00 r) (refs%precondition $Snap.unit r@26@00))
  :pattern ((inv@30@00 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@27@00 $Ref)) (!
  (=>
    (and (Set_in e@27@00 (refs $Snap.unit r@26@00)) (< $Perm.No $k@28@00))
    (and (= (inv@30@00 e@27@00) e@27@00) (img@31@00 e@27@00)))
  :pattern ((Set_in e@27@00 (refs $Snap.unit r@26@00)))
  :pattern ((inv@30@00 e@27@00))
  :pattern ((img@31@00 e@27@00))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 r)
      (and
        (Set_in (inv@30@00 r) (refs $Snap.unit r@26@00))
        (< $Perm.No $k@28@00)))
    (= (inv@30@00 r) r))
  :pattern ((inv@30@00 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((e@27@00 $Ref)) (!
  (<= $Perm.No $k@28@00)
  :pattern ((Set_in e@27@00 (refs $Snap.unit r@26@00)))
  :pattern ((inv@30@00 e@27@00))
  :pattern ((img@31@00 e@27@00))
  :qid |q-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((e@27@00 $Ref)) (!
  (<= $k@28@00 $Perm.Write)
  :pattern ((Set_in e@27@00 (refs $Snap.unit r@26@00)))
  :pattern ((inv@30@00 e@27@00))
  :pattern ((img@31@00 e@27@00))
  :qid |q-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((e@27@00 $Ref)) (!
  (=>
    (and (Set_in e@27@00 (refs $Snap.unit r@26@00)) (< $Perm.No $k@28@00))
    (not (= e@27@00 $Ref.null)))
  :pattern ((Set_in e@27@00 (refs $Snap.unit r@26@00)))
  :pattern ((inv@30@00 e@27@00))
  :pattern ((img@31@00 e@27@00))
  :qid |q-permImpliesNonNull|)))
(pop) ; 1
; ---------- R2 ----------
(declare-const r@32@00 $Ref)
(push) ; 1
(declare-const e@33@00 $Ref)
(push) ; 2
; [eval] (e in refs(r))
; [eval] refs(r)
(push) ; 3
(assert (refs%precondition $Snap.unit r@32@00))
(pop) ; 3
; Joined path conditions
(assert (refs%precondition $Snap.unit r@32@00))
(assert (Set_in e@33@00 (refs $Snap.unit r@32@00)))
(pop) ; 2
(declare-const $t@34@00 $FVF<q>)
(declare-fun inv@35@00 ($Ref) $Ref)
(declare-fun img@36@00 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((e@33@00 $Ref)) (!
  (=>
    (Set_in e@33@00 (refs $Snap.unit r@32@00))
    (refs%precondition $Snap.unit r@32@00))
  :pattern ((Set_in e@33@00 (refs $Snap.unit r@32@00)))
  :pattern ((inv@35@00 e@33@00))
  :pattern ((img@36@00 e@33@00))
  :qid |q-aux|)))
; Check receiver injectivity
(assert (forall ((e1@33@00 $Ref) (e2@33@00 $Ref)) (!
  (and
    (refs%precondition $Snap.unit r@32@00)
    (=>
      (Set_in e1@33@00 (refs $Snap.unit r@32@00))
      (refs%precondition $Snap.unit r@32@00)))
  
  :qid |q-rcvrInj|)))
(push) ; 2
(assert (not (forall ((e1@33@00 $Ref) (e2@33@00 $Ref)) (!
  (=>
    (and
      (Set_in e1@33@00 (refs $Snap.unit r@32@00))
      (Set_in e2@33@00 (refs $Snap.unit r@32@00))
      (= e1@33@00 e2@33@00))
    (= e1@33@00 e2@33@00))
  
  :qid |q-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@33@00 $Ref)) (!
  (refs%precondition $Snap.unit r@32@00)
  :pattern ((Set_in e@33@00 (refs $Snap.unit r@32@00)))
  :pattern ((inv@35@00 e@33@00))
  :pattern ((img@36@00 e@33@00))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=> (img@36@00 r) (refs%precondition $Snap.unit r@32@00))
  :pattern ((inv@35@00 r))
  :qid |q-fctOfInv|)))
(assert (forall ((e@33@00 $Ref)) (!
  (=>
    (Set_in e@33@00 (refs $Snap.unit r@32@00))
    (and (= (inv@35@00 e@33@00) e@33@00) (img@36@00 e@33@00)))
  :pattern ((Set_in e@33@00 (refs $Snap.unit r@32@00)))
  :pattern ((inv@35@00 e@33@00))
  :pattern ((img@36@00 e@33@00))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@00 r) (Set_in (inv@35@00 r) (refs $Snap.unit r@32@00)))
    (= (inv@35@00 r) r))
  :pattern ((inv@35@00 r))
  :qid |q-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((e@33@00 $Ref)) (!
  (=> (Set_in e@33@00 (refs $Snap.unit r@32@00)) (not (= e@33@00 $Ref.null)))
  :pattern ((Set_in e@33@00 (refs $Snap.unit r@32@00)))
  :pattern ((inv@35@00 e@33@00))
  :pattern ((img@36@00 e@33@00))
  :qid |q-permImpliesNonNull|)))
(pop) ; 1
; ---------- Q ----------
(declare-const r@37@00 $Ref)
