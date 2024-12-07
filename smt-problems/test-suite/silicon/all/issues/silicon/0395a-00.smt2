(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:56:36
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0395a.vpr
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
(declare-sort $PSF<accessible_withdraw> 0)
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
(declare-fun $SortWrappers.$PSF<accessible_withdraw>To$Snap ($PSF<accessible_withdraw>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<accessible_withdraw> ($Snap) $PSF<accessible_withdraw>)
(assert (forall ((x $PSF<accessible_withdraw>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<accessible_withdraw>($SortWrappers.$PSF<accessible_withdraw>To$Snap x)))
    :pattern (($SortWrappers.$PSF<accessible_withdraw>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<accessible_withdraw>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<accessible_withdraw>To$Snap($SortWrappers.$SnapTo$PSF<accessible_withdraw> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<accessible_withdraw> x))
    :qid |$Snap.$PSF<accessible_withdraw>To$SnapTo$PSF<accessible_withdraw>|
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
; /predicate_snap_functions_declarations.smt2 [accessible_withdraw: Snap]
(declare-fun $PSF.domain_accessible_withdraw ($PSF<accessible_withdraw>) Set<$Snap>)
(declare-fun $PSF.lookup_accessible_withdraw ($PSF<accessible_withdraw> $Snap) $Snap)
(declare-fun $PSF.after_accessible_withdraw ($PSF<accessible_withdraw> $PSF<accessible_withdraw>) Bool)
(declare-fun $PSF.loc_accessible_withdraw ($Snap $Snap) Bool)
(declare-fun $PSF.perm_accessible_withdraw ($PPM $Snap) $Perm)
(declare-const $psfTOP_accessible_withdraw $PSF<accessible_withdraw>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun isInt ($Snap Int) Bool)
(declare-fun isInt%limited ($Snap Int) Bool)
(declare-fun isInt%stateless (Int) Bool)
(declare-fun isInt%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun accessible_withdraw%trigger ($Snap Int Int Int) Bool)
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
; /predicate_snap_functions_axioms.smt2 [accessible_withdraw: Snap]
(assert (forall ((vs $PSF<accessible_withdraw>) (ws $PSF<accessible_withdraw>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_accessible_withdraw vs) ($PSF.domain_accessible_withdraw ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_accessible_withdraw vs))
            (= ($PSF.lookup_accessible_withdraw vs x) ($PSF.lookup_accessible_withdraw ws x)))
          :pattern (($PSF.lookup_accessible_withdraw vs x) ($PSF.lookup_accessible_withdraw ws x))
          :qid |qp.$PSF<accessible_withdraw>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<accessible_withdraw>To$Snap vs)
              ($SortWrappers.$PSF<accessible_withdraw>To$Snap ws)
              )
    :qid |qp.$PSF<accessible_withdraw>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_accessible_withdraw pm s))
    :pattern (($PSF.perm_accessible_withdraw pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_accessible_withdraw f s) true)
    :pattern (($PSF.loc_accessible_withdraw f s)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (= (isInt%limited s@$ i@0@00) (isInt s@$ i@0@00))
  :pattern ((isInt s@$ i@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (isInt%stateless i@0@00)
  :pattern ((isInt%limited s@$ i@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  (=> (isInt%precondition s@$ i@0@00) (= (isInt s@$ i@0@00) true))
  :pattern ((isInt s@$ i@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int)) (!
  true
  :pattern ((isInt s@$ i@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test1 ----------
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
; var msg_sender: Int
(declare-const msg_sender@0@01 Int)
; [exec]
; var balance: Int
(declare-const balance@1@01 Int)
; [exec]
; inhale (forall a: Int, i: Int, j: Int ::
;     { accessible_withdraw(a, i, j) }
;     balance >= i ==> acc(accessible_withdraw(a, i, j), write))
(declare-const a@2@01 Int)
(declare-const i@3@01 Int)
(declare-const j@4@01 Int)
(push) ; 3
; [eval] balance >= i
(assert (>= balance@1@01 i@3@01))
(declare-const sm@5@01 $PSF<accessible_withdraw>)
(declare-const s@6@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@7@01 $PSF<accessible_withdraw>)
(declare-fun inv@8@01 (Int Int Int) Int)
(declare-fun img@9@01 (Int Int Int) Bool)
(declare-fun inv@10@01 (Int Int Int) Int)
(declare-fun img@11@01 (Int Int Int) Bool)
(declare-fun inv@12@01 (Int Int Int) Int)
(declare-fun img@13@01 (Int Int Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@2@01 Int) (i1@3@01 Int) (j1@4@01 Int) (a2@2@01 Int) (i2@3@01 Int) (j2@4@01 Int)) (!
  (=>
    (and
      (>= balance@1@01 i1@3@01)
      (>= balance@1@01 i2@3@01)
      (and (and (= a1@2@01 a2@2@01) (= i1@3@01 i2@3@01)) (= j1@4@01 j2@4@01)))
    (and (and (= a1@2@01 a2@2@01) (= i1@3@01 i2@3@01)) (= j1@4@01 j2@4@01)))
  
  :qid |accessible_withdraw-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@2@01 Int) (i@3@01 Int) (j@4@01 Int)) (!
  (=>
    (>= balance@1@01 i@3@01)
    (and
      (and
        (= (inv@8@01 a@2@01 i@3@01 j@4@01) a@2@01)
        (= (inv@10@01 a@2@01 i@3@01 j@4@01) i@3@01)
        (= (inv@12@01 a@2@01 i@3@01 j@4@01) j@4@01))
      (and
        (img@9@01 a@2@01 i@3@01 j@4@01)
        (img@11@01 a@2@01 i@3@01 j@4@01)
        (img@13@01 a@2@01 i@3@01 j@4@01))))
  :pattern (($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw $t@7@01 ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap a@2@01)
      ($SortWrappers.IntTo$Snap i@3@01))
    ($SortWrappers.IntTo$Snap j@4@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap a@2@01)
      ($SortWrappers.IntTo$Snap i@3@01))
    ($SortWrappers.IntTo$Snap j@4@01))))
  :qid |quant-u-5|)))
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (=>
    (and
      (and
        (img@9@01 msg_sender amount parameter)
        (img@11@01 msg_sender amount parameter)
        (img@13@01 msg_sender amount parameter))
      (>= balance@1@01 (inv@10@01 msg_sender amount parameter)))
    (and
      (= (inv@8@01 msg_sender amount parameter) msg_sender)
      (= (inv@10@01 msg_sender amount parameter) amount)
      (= (inv@12@01 msg_sender amount parameter) parameter)))
  :pattern ((inv@8@01 msg_sender amount parameter))
  :pattern ((inv@10@01 msg_sender amount parameter))
  :pattern ((inv@12@01 msg_sender amount parameter))
  :qid |accessible_withdraw-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@14@01 $PSF<accessible_withdraw>)
(declare-const s@15@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@15@01 $Snap)) (!
  (=>
    (and
      (and
        (img@9@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second s@15@01)))
        (img@11@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second s@15@01)))
        (img@13@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second s@15@01))))
      (>=
        balance@1@01
        (inv@10@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@15@01))) ($SortWrappers.$SnapToInt ($Snap.second s@15@01)))))
    (and
      (not (= s@15@01 $Snap.unit))
      (=
        ($PSF.lookup_accessible_withdraw (as sm@14@01  $PSF<accessible_withdraw>) s@15@01)
        ($PSF.lookup_accessible_withdraw $t@7@01 s@15@01))))
  :pattern (($PSF.lookup_accessible_withdraw (as sm@14@01  $PSF<accessible_withdraw>) s@15@01))
  :pattern (($PSF.lookup_accessible_withdraw $t@7@01 s@15@01))
  :qid |qp.psmValDef1|)))
(assert (forall ((s@15@01 $Snap)) (!
  ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw $t@7@01 s@15@01) s@15@01)
  :pattern (($PSF.lookup_accessible_withdraw (as sm@14@01  $PSF<accessible_withdraw>) s@15@01))
  :qid |qp.psmResTrgDef2|)))
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (=>
    (>= balance@1@01 (inv@10@01 msg_sender amount parameter))
    ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw (as sm@14@01  $PSF<accessible_withdraw>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))))
  :pattern ((inv@8@01 msg_sender amount parameter) (inv@10@01 msg_sender amount parameter) (inv@12@01 msg_sender amount parameter))
  :qid |quant-u-6|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(accessible_withdraw(msg_sender, balance + 1, balance + 2)) ==
;   none
; [eval] perm(accessible_withdraw(msg_sender, balance + 1, balance + 2)) == none
; [eval] perm(accessible_withdraw(msg_sender, balance + 1, balance + 2))
; [eval] balance + 1
; [eval] balance + 2
; Definitional axioms for snapshot map values
(declare-const pm@16@01 $PPM)
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (=
    ($PSF.perm_accessible_withdraw (as pm@16@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter)))
    (ite
      (and
        (and
          (img@9@01 msg_sender amount parameter)
          (img@11@01 msg_sender amount parameter)
          (img@13@01 msg_sender amount parameter))
        (>= balance@1@01 (inv@10@01 msg_sender amount parameter)))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_accessible_withdraw (as pm@16@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap msg_sender)
      ($SortWrappers.IntTo$Snap amount))
    ($SortWrappers.IntTo$Snap parameter))))
  :qid |qp.resPrmSumDef3|)))
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (and
    ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw (as sm@14@01  $PSF<accessible_withdraw>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter)))
    ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw $t@7@01 ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))))
  :pattern (($PSF.perm_accessible_withdraw (as pm@16@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap msg_sender)
      ($SortWrappers.IntTo$Snap amount))
    ($SortWrappers.IntTo$Snap parameter))))
  :qid |qp.resTrgDef4|)))
(assert ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw (as sm@14@01  $PSF<accessible_withdraw>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.IntTo$Snap msg_sender@0@01)
    ($SortWrappers.IntTo$Snap (+ balance@1@01 1)))
  ($SortWrappers.IntTo$Snap (+ balance@1@01 2)))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.IntTo$Snap msg_sender@0@01)
    ($SortWrappers.IntTo$Snap (+ balance@1@01 1)))
  ($SortWrappers.IntTo$Snap (+ balance@1@01 2)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_accessible_withdraw (as pm@16@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap msg_sender@0@01)
      ($SortWrappers.IntTo$Snap (+ balance@1@01 1)))
    ($SortWrappers.IntTo$Snap (+ balance@1@01 2))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_accessible_withdraw (as pm@16@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap msg_sender@0@01)
      ($SortWrappers.IntTo$Snap (+ balance@1@01 1)))
    ($SortWrappers.IntTo$Snap (+ balance@1@01 2))))
  $Perm.No))
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
; var msg_sender: Int
(declare-const msg_sender@17@01 Int)
; [exec]
; var balance: Int
(declare-const balance@18@01 Int)
; [exec]
; inhale (forall a: Int, i: Int, j: Int ::
;     { accessible_withdraw(a, i, j) }
;     isInt(a) && (isInt(j) && balance >= i) ==>
;     acc(accessible_withdraw(a, i, j), write))
(declare-const a@19@01 Int)
(declare-const i@20@01 Int)
(declare-const j@21@01 Int)
(push) ; 3
; [eval] isInt(a) && (isInt(j) && balance >= i)
; [eval] isInt(a)
(push) ; 4
(assert (isInt%precondition $Snap.unit a@19@01))
(pop) ; 4
; Joined path conditions
(assert (isInt%precondition $Snap.unit a@19@01))
(push) ; 4
; [then-branch: 0 | !(isInt(_, a@19@01)) | live]
; [else-branch: 0 | isInt(_, a@19@01) | live]
(push) ; 5
; [then-branch: 0 | !(isInt(_, a@19@01))]
(assert (not (isInt $Snap.unit a@19@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | isInt(_, a@19@01)]
(assert (isInt $Snap.unit a@19@01))
; [eval] isInt(j)
(push) ; 6
(assert (isInt%precondition $Snap.unit j@21@01))
(pop) ; 6
; Joined path conditions
(assert (isInt%precondition $Snap.unit j@21@01))
(push) ; 6
; [then-branch: 1 | !(isInt(_, j@21@01)) | live]
; [else-branch: 1 | isInt(_, j@21@01) | live]
(push) ; 7
; [then-branch: 1 | !(isInt(_, j@21@01))]
(assert (not (isInt $Snap.unit j@21@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | isInt(_, j@21@01)]
(assert (isInt $Snap.unit j@21@01))
; [eval] balance >= i
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (isInt $Snap.unit j@21@01) (not (isInt $Snap.unit j@21@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (isInt $Snap.unit a@19@01)
  (and
    (isInt $Snap.unit a@19@01)
    (isInt%precondition $Snap.unit j@21@01)
    (or (isInt $Snap.unit j@21@01) (not (isInt $Snap.unit j@21@01))))))
(assert (or (isInt $Snap.unit a@19@01) (not (isInt $Snap.unit a@19@01))))
(assert (and
  (isInt $Snap.unit a@19@01)
  (and (isInt $Snap.unit j@21@01) (>= balance@18@01 i@20@01))))
(declare-const sm@22@01 $PSF<accessible_withdraw>)
(declare-const s@23@01 $Snap)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@24@01 $PSF<accessible_withdraw>)
(declare-fun inv@25@01 (Int Int Int) Int)
(declare-fun img@26@01 (Int Int Int) Bool)
(declare-fun inv@27@01 (Int Int Int) Int)
(declare-fun img@28@01 (Int Int Int) Bool)
(declare-fun inv@29@01 (Int Int Int) Int)
(declare-fun img@30@01 (Int Int Int) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((a@19@01 Int) (i@20@01 Int) (j@21@01 Int)) (!
  (=>
    (and
      (isInt $Snap.unit a@19@01)
      (and (isInt $Snap.unit j@21@01) (>= balance@18@01 i@20@01)))
    (and
      (isInt%precondition $Snap.unit a@19@01)
      (=>
        (isInt $Snap.unit a@19@01)
        (and
          (isInt $Snap.unit a@19@01)
          (isInt%precondition $Snap.unit j@21@01)
          (or (isInt $Snap.unit j@21@01) (not (isInt $Snap.unit j@21@01)))))
      (or (isInt $Snap.unit a@19@01) (not (isInt $Snap.unit a@19@01)))))
  :pattern (($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw $t@24@01 ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap a@19@01)
      ($SortWrappers.IntTo$Snap i@20@01))
    ($SortWrappers.IntTo$Snap j@21@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap a@19@01)
      ($SortWrappers.IntTo$Snap i@20@01))
    ($SortWrappers.IntTo$Snap j@21@01))))
  :qid |accessible_withdraw-aux|)))
; Check receiver injectivity
(assert (forall ((a1@19@01 Int) (i1@20@01 Int) (j1@21@01 Int) (a2@19@01 Int) (i2@20@01 Int) (j2@21@01 Int)) (!
  (and
    (and
      (isInt%precondition $Snap.unit a1@19@01)
      (=> (isInt $Snap.unit a1@19@01) (isInt%precondition $Snap.unit j1@21@01)))
    (=>
      (and
        (isInt $Snap.unit a1@19@01)
        (and (isInt $Snap.unit j1@21@01) (>= balance@18@01 i1@20@01)))
      (and
        (isInt%precondition $Snap.unit a2@19@01)
        (=> (isInt $Snap.unit a2@19@01) (isInt%precondition $Snap.unit j2@21@01)))))
  
  :qid |accessible_withdraw-rcvrInj|)))
(push) ; 3
(assert (not (forall ((a1@19@01 Int) (i1@20@01 Int) (j1@21@01 Int) (a2@19@01 Int) (i2@20@01 Int) (j2@21@01 Int)) (!
  (=>
    (and
      (and
        (isInt $Snap.unit a1@19@01)
        (and (isInt $Snap.unit j1@21@01) (>= balance@18@01 i1@20@01)))
      (and
        (isInt $Snap.unit a2@19@01)
        (and (isInt $Snap.unit j2@21@01) (>= balance@18@01 i2@20@01)))
      (and
        (and (= a1@19@01 a2@19@01) (= i1@20@01 i2@20@01))
        (= j1@21@01 j2@21@01)))
    (and (and (= a1@19@01 a2@19@01) (= i1@20@01 i2@20@01)) (= j1@21@01 j2@21@01)))
  
  :qid |accessible_withdraw-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@19@01 Int) (i@20@01 Int) (j@21@01 Int)) (!
  (and
    (isInt%precondition $Snap.unit a@19@01)
    (=> (isInt $Snap.unit a@19@01) (isInt%precondition $Snap.unit j@21@01)))
  :pattern (($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw $t@24@01 ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap a@19@01)
      ($SortWrappers.IntTo$Snap i@20@01))
    ($SortWrappers.IntTo$Snap j@21@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap a@19@01)
      ($SortWrappers.IntTo$Snap i@20@01))
    ($SortWrappers.IntTo$Snap j@21@01))))
  :qid |quant-u-8|)))
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (=>
    (and
      (img@26@01 msg_sender amount parameter)
      (img@28@01 msg_sender amount parameter)
      (img@30@01 msg_sender amount parameter))
    (and
      (isInt%precondition $Snap.unit (inv@25@01 msg_sender amount parameter))
      (=>
        (isInt $Snap.unit (inv@25@01 msg_sender amount parameter))
        (isInt%precondition $Snap.unit (inv@29@01 msg_sender amount parameter)))))
  :pattern ((inv@25@01 msg_sender amount parameter))
  :pattern ((inv@27@01 msg_sender amount parameter))
  :pattern ((inv@29@01 msg_sender amount parameter))
  :qid |accessible_withdraw-fctOfInv|)))
(assert (forall ((a@19@01 Int) (i@20@01 Int) (j@21@01 Int)) (!
  (=>
    (and
      (isInt $Snap.unit a@19@01)
      (and (isInt $Snap.unit j@21@01) (>= balance@18@01 i@20@01)))
    (and
      (and
        (= (inv@25@01 a@19@01 i@20@01 j@21@01) a@19@01)
        (= (inv@27@01 a@19@01 i@20@01 j@21@01) i@20@01)
        (= (inv@29@01 a@19@01 i@20@01 j@21@01) j@21@01))
      (and
        (img@26@01 a@19@01 i@20@01 j@21@01)
        (img@28@01 a@19@01 i@20@01 j@21@01)
        (img@30@01 a@19@01 i@20@01 j@21@01))))
  :pattern (($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw $t@24@01 ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap a@19@01)
      ($SortWrappers.IntTo$Snap i@20@01))
    ($SortWrappers.IntTo$Snap j@21@01))) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap a@19@01)
      ($SortWrappers.IntTo$Snap i@20@01))
    ($SortWrappers.IntTo$Snap j@21@01))))
  :qid |quant-u-8|)))
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (=>
    (and
      (and
        (img@26@01 msg_sender amount parameter)
        (img@28@01 msg_sender amount parameter)
        (img@30@01 msg_sender amount parameter))
      (and
        (isInt $Snap.unit (inv@25@01 msg_sender amount parameter))
        (and
          (isInt $Snap.unit (inv@29@01 msg_sender amount parameter))
          (>= balance@18@01 (inv@27@01 msg_sender amount parameter)))))
    (and
      (= (inv@25@01 msg_sender amount parameter) msg_sender)
      (= (inv@27@01 msg_sender amount parameter) amount)
      (= (inv@29@01 msg_sender amount parameter) parameter)))
  :pattern ((inv@25@01 msg_sender amount parameter))
  :pattern ((inv@27@01 msg_sender amount parameter))
  :pattern ((inv@29@01 msg_sender amount parameter))
  :qid |accessible_withdraw-fctOfInv|)))
; Permissions are non-negative
(declare-const sm@31@01 $PSF<accessible_withdraw>)
(declare-const s@32@01 $Snap)
; Definitional axioms for snapshot map values
(assert (forall ((s@32@01 $Snap)) (!
  (=>
    (and
      (and
        (img@26@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second s@32@01)))
        (img@28@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second s@32@01)))
        (img@30@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second s@32@01))))
      (and
        (isInt $Snap.unit (inv@25@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second s@32@01))))
        (and
          (isInt $Snap.unit (inv@29@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second s@32@01))))
          (>=
            balance@18@01
            (inv@27@01 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second ($Snap.first s@32@01))) ($SortWrappers.$SnapToInt ($Snap.second s@32@01)))))))
    (and
      (not (= s@32@01 $Snap.unit))
      (=
        ($PSF.lookup_accessible_withdraw (as sm@31@01  $PSF<accessible_withdraw>) s@32@01)
        ($PSF.lookup_accessible_withdraw $t@24@01 s@32@01))))
  :pattern (($PSF.lookup_accessible_withdraw (as sm@31@01  $PSF<accessible_withdraw>) s@32@01))
  :pattern (($PSF.lookup_accessible_withdraw $t@24@01 s@32@01))
  :qid |qp.psmValDef6|)))
(assert (forall ((s@32@01 $Snap)) (!
  ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw $t@24@01 s@32@01) s@32@01)
  :pattern (($PSF.lookup_accessible_withdraw (as sm@31@01  $PSF<accessible_withdraw>) s@32@01))
  :qid |qp.psmResTrgDef7|)))
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (=>
    (and
      (isInt $Snap.unit (inv@25@01 msg_sender amount parameter))
      (and
        (isInt $Snap.unit (inv@29@01 msg_sender amount parameter))
        (>= balance@18@01 (inv@27@01 msg_sender amount parameter))))
    ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw (as sm@31@01  $PSF<accessible_withdraw>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))))
  :pattern ((inv@25@01 msg_sender amount parameter) (inv@27@01 msg_sender amount parameter) (inv@29@01 msg_sender amount parameter))
  :qid |quant-u-9|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert perm(accessible_withdraw(msg_sender, balance + 1, balance + 2)) ==
;   none
; [eval] perm(accessible_withdraw(msg_sender, balance + 1, balance + 2)) == none
; [eval] perm(accessible_withdraw(msg_sender, balance + 1, balance + 2))
; [eval] balance + 1
; [eval] balance + 2
; Definitional axioms for snapshot map values
(declare-const pm@33@01 $PPM)
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (=
    ($PSF.perm_accessible_withdraw (as pm@33@01  $PPM) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter)))
    (ite
      (and
        (and
          (img@26@01 msg_sender amount parameter)
          (img@28@01 msg_sender amount parameter)
          (img@30@01 msg_sender amount parameter))
        (and
          (isInt $Snap.unit (inv@25@01 msg_sender amount parameter))
          (and
            (isInt $Snap.unit (inv@29@01 msg_sender amount parameter))
            (>= balance@18@01 (inv@27@01 msg_sender amount parameter)))))
      $Perm.Write
      $Perm.No))
  :pattern (($PSF.perm_accessible_withdraw (as pm@33@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap msg_sender)
      ($SortWrappers.IntTo$Snap amount))
    ($SortWrappers.IntTo$Snap parameter))))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((msg_sender Int) (amount Int) (parameter Int)) (!
  (and
    ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw (as sm@31@01  $PSF<accessible_withdraw>) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter)))
    ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw $t@24@01 ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))) ($Snap.combine
      ($Snap.combine
        ($SortWrappers.IntTo$Snap msg_sender)
        ($SortWrappers.IntTo$Snap amount))
      ($SortWrappers.IntTo$Snap parameter))))
  :pattern (($PSF.perm_accessible_withdraw (as pm@33@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap msg_sender)
      ($SortWrappers.IntTo$Snap amount))
    ($SortWrappers.IntTo$Snap parameter))))
  :qid |qp.resTrgDef9|)))
(assert ($PSF.loc_accessible_withdraw ($PSF.lookup_accessible_withdraw (as sm@31@01  $PSF<accessible_withdraw>) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.IntTo$Snap msg_sender@17@01)
    ($SortWrappers.IntTo$Snap (+ balance@18@01 1)))
  ($SortWrappers.IntTo$Snap (+ balance@18@01 2)))) ($Snap.combine
  ($Snap.combine
    ($SortWrappers.IntTo$Snap msg_sender@17@01)
    ($SortWrappers.IntTo$Snap (+ balance@18@01 1)))
  ($SortWrappers.IntTo$Snap (+ balance@18@01 2)))))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  ($PSF.perm_accessible_withdraw (as pm@33@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap msg_sender@17@01)
      ($SortWrappers.IntTo$Snap (+ balance@18@01 1)))
    ($SortWrappers.IntTo$Snap (+ balance@18@01 2))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($PSF.perm_accessible_withdraw (as pm@33@01  $PPM) ($Snap.combine
    ($Snap.combine
      ($SortWrappers.IntTo$Snap msg_sender@17@01)
      ($SortWrappers.IntTo$Snap (+ balance@18@01 1)))
    ($SortWrappers.IntTo$Snap (+ balance@18@01 2))))
  $Perm.No))
(pop) ; 2
(pop) ; 1
