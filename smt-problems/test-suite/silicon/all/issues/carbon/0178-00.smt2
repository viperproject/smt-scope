(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:05
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0178.vpr
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
(declare-sort $FVF<data> 0)
(declare-sort $PSF<Node__isolated> 0)
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
(declare-fun $SortWrappers.$FVF<data>To$Snap ($FVF<data>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<data> ($Snap) $FVF<data>)
(assert (forall ((x $FVF<data>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<data>($SortWrappers.$FVF<data>To$Snap x)))
    :pattern (($SortWrappers.$FVF<data>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<data>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<data>To$Snap($SortWrappers.$SnapTo$FVF<data> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<data> x))
    :qid |$Snap.$FVF<data>To$SnapTo$FVF<data>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$PSF<Node__isolated>To$Snap ($PSF<Node__isolated>) $Snap)
(declare-fun $SortWrappers.$SnapTo$PSF<Node__isolated> ($Snap) $PSF<Node__isolated>)
(assert (forall ((x $PSF<Node__isolated>)) (!
    (= x ($SortWrappers.$SnapTo$PSF<Node__isolated>($SortWrappers.$PSF<Node__isolated>To$Snap x)))
    :pattern (($SortWrappers.$PSF<Node__isolated>To$Snap x))
    :qid |$Snap.$SnapTo$PSF<Node__isolated>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PSF<Node__isolated>To$Snap($SortWrappers.$SnapTo$PSF<Node__isolated> x)))
    :pattern (($SortWrappers.$SnapTo$PSF<Node__isolated> x))
    :qid |$Snap.$PSF<Node__isolated>To$SnapTo$PSF<Node__isolated>|
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
; /field_value_functions_declarations.smt2 [data: Ref]
(declare-fun $FVF.domain_data ($FVF<data>) Set<$Ref>)
(declare-fun $FVF.lookup_data ($FVF<data> $Ref) $Ref)
(declare-fun $FVF.after_data ($FVF<data> $FVF<data>) Bool)
(declare-fun $FVF.loc_data ($Ref $Ref) Bool)
(declare-fun $FVF.perm_data ($FPM $Ref) $Perm)
(declare-const $fvfTOP_data $FVF<data>)
; /predicate_snap_functions_declarations.smt2 [Node__isolated: Snap]
(declare-fun $PSF.domain_Node__isolated ($PSF<Node__isolated>) Set<$Snap>)
(declare-fun $PSF.lookup_Node__isolated ($PSF<Node__isolated> $Snap) $Snap)
(declare-fun $PSF.after_Node__isolated ($PSF<Node__isolated> $PSF<Node__isolated>) Bool)
(declare-fun $PSF.loc_Node__isolated ($Snap $Snap) Bool)
(declare-fun $PSF.perm_Node__isolated ($PPM $Snap) $Perm)
(declare-const $psfTOP_Node__isolated $PSF<Node__isolated>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Node__isolated%trigger ($Snap $Ref Set<$Ref>) Bool)
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
; /field_value_functions_axioms.smt2 [data: Ref]
(assert (forall ((vs $FVF<data>) (ws $FVF<data>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_data vs) ($FVF.domain_data ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_data vs))
            (= ($FVF.lookup_data vs x) ($FVF.lookup_data ws x)))
          :pattern (($FVF.lookup_data vs x) ($FVF.lookup_data ws x))
          :qid |qp.$FVF<data>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<data>To$Snap vs)
              ($SortWrappers.$FVF<data>To$Snap ws)
              )
    :qid |qp.$FVF<data>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_data pm r))
    :pattern (($FVF.perm_data pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_data f r) true)
    :pattern (($FVF.loc_data f r)))))
; /predicate_snap_functions_axioms.smt2 [Node__isolated: Snap]
(assert (forall ((vs $PSF<Node__isolated>) (ws $PSF<Node__isolated>)) (!
    (=>
      (and
        (Set_equal ($PSF.domain_Node__isolated vs) ($PSF.domain_Node__isolated ws))
        (forall ((x $Snap)) (!
          (=>
            (Set_in x ($PSF.domain_Node__isolated vs))
            (= ($PSF.lookup_Node__isolated vs x) ($PSF.lookup_Node__isolated ws x)))
          :pattern (($PSF.lookup_Node__isolated vs x) ($PSF.lookup_Node__isolated ws x))
          :qid |qp.$PSF<Node__isolated>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$PSF<Node__isolated>To$Snap vs)
              ($SortWrappers.$PSF<Node__isolated>To$Snap ws)
              )
    :qid |qp.$PSF<Node__isolated>-eq-outer|
    )))
(assert (forall ((s $Snap) (pm $PPM)) (!
    ($Perm.isValidVar ($PSF.perm_Node__isolated pm s))
    :pattern (($PSF.perm_Node__isolated pm s)))))
(assert (forall ((s $Snap) (f $Snap)) (!
    (= ($PSF.loc_Node__isolated f s) true)
    :pattern (($PSF.loc_Node__isolated f s)))))
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
(declare-const x@0@01 $Ref)
(declare-const x__wset@1@01 Set<$Ref>)
(declare-const x@2@01 $Ref)
(declare-const x__wset@3@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(declare-const sm@5@01 $PSF<Node__isolated>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_Node__isolated (as sm@5@01  $PSF<Node__isolated>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@2@01)
    ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01)))
  $t@4@01))
(assert (<= $Perm.No (ite (Set_equal x__wset@3@01 x__wset@3@01) $Perm.Write $Perm.No)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(Node__isolated(x, x__wset), write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@6@01 ((ref $Ref) (wset Set<$Ref>)) $Perm
  (ite
    (and (= ref x@2@01) (Set_equal wset x__wset@3@01))
    ($Perm.min
      (ite
        (and (= ref x@2@01) (Set_equal wset x__wset@3@01))
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
(assert (not (=
  (-
    (ite (Set_equal x__wset@3@01 x__wset@3@01) $Perm.Write $Perm.No)
    (pTaken@6@01 x@2@01 x__wset@3@01))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((ref $Ref) (wset Set<$Ref>)) (!
  (=>
    (and (= ref x@2@01) (Set_equal wset x__wset@3@01))
    (= (- $Perm.Write (pTaken@6@01 ref wset)) $Perm.No))
  
  :qid |quant-u-6|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@7@01 $PSF<Node__isolated>)
(declare-const s@8@01 $Snap)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (Set_equal x__wset@3@01 x__wset@3@01)
  (and
    (not
      (=
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@2@01)
          ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01))
        $Snap.unit))
    (=
      ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@2@01)
        ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01)))
      ($PSF.lookup_Node__isolated (as sm@5@01  $PSF<Node__isolated>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@2@01)
        ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01)))))))
(assert (=
  ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@2@01)
    ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01)))
  ($Snap.combine
    ($Snap.first ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap x@2@01)
      ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01))))
    ($Snap.second ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
      ($SortWrappers.$RefTo$Snap x@2@01)
      ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01)))))))
(declare-const r@9@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in wset)
(assert (Set_in r@9@01 x__wset@3@01))
(pop) ; 3
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@9@01 $Ref) (r2@9@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@9@01 x__wset@3@01)
      (Set_in r2@9@01 x__wset@3@01)
      (= r1@9@01 r2@9@01))
    (= r1@9@01 r2@9@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@9@01 $Ref)) (!
  (=>
    (Set_in r@9@01 x__wset@3@01)
    (and (= (inv@10@01 r@9@01) r@9@01) (img@11@01 r@9@01)))
  :pattern ((Set_in r@9@01 x__wset@3@01))
  :pattern ((inv@10@01 r@9@01))
  :pattern ((img@11@01 r@9@01))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (Set_in (inv@10@01 r) x__wset@3@01))
    (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |data-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@9@01 $Ref)) (!
  (=> (Set_in r@9@01 x__wset@3@01) (not (= r@9@01 $Ref.null)))
  :pattern ((Set_in r@9@01 x__wset@3@01))
  :pattern ((inv@10@01 r@9@01))
  :pattern ((img@11@01 r@9@01))
  :qid |data-permImpliesNonNull|)))
(declare-const r@12@01 $Ref)
(push) ; 3
; [eval] (r in wset)
(assert (Set_in r@12@01 x__wset@3@01))
(pop) ; 3
(declare-fun inv@13@01 ($Ref Set<$Ref>) $Ref)
(declare-fun img@14@01 ($Ref Set<$Ref>) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@12@01 $Ref) (r2@12@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@12@01 x__wset@3@01)
      (Set_in r2@12@01 x__wset@3@01)
      (= r1@12@01 r2@12@01))
    (= r1@12@01 r2@12@01))
  
  :qid |Node__isolated-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@12@01 $Ref)) (!
  (=>
    (Set_in r@12@01 x__wset@3@01)
    (and
      (= (inv@13@01 r@12@01 x__wset@3@01) r@12@01)
      (img@14@01 r@12@01 x__wset@3@01)))
  :pattern ((Set_in r@12@01 x__wset@3@01))
  :pattern ((inv@13@01 r@12@01 x__wset@3@01))
  :pattern ((img@14@01 r@12@01 x__wset@3@01))
  :qid |quant-u-10|)))
(assert (forall ((ref $Ref) (wset Set<$Ref>)) (!
  (=>
    (and (img@14@01 ref wset) (Set_in (inv@13@01 ref wset) x__wset@3@01))
    (and (= (inv@13@01 ref wset) ref) (Set_equal x__wset@3@01 wset)))
  :pattern ((inv@13@01 ref wset))
  :qid |Node__isolated-fctOfInv|)))
; Permissions are non-negative
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Node__isolated%trigger ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
  ($SortWrappers.$RefTo$Snap x@2@01)
  ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01))) x@2@01 x__wset@3@01))
; [exec]
; fold acc(Node__isolated(x, x__wset), write)
(declare-const r@15@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in wset)
(assert (Set_in r@15@01 x__wset@3@01))
(pop) ; 3
(declare-fun inv@16@01 ($Ref) $Ref)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@15@01 $Ref) (r2@15@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@15@01 x__wset@3@01)
      (Set_in r2@15@01 x__wset@3@01)
      (= r1@15@01 r2@15@01))
    (= r1@15@01 r2@15@01))
  
  :qid |data-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@15@01 $Ref)) (!
  (=>
    (Set_in r@15@01 x__wset@3@01)
    (and (= (inv@16@01 r@15@01) r@15@01) (img@17@01 r@15@01)))
  :pattern ((Set_in r@15@01 x__wset@3@01))
  :pattern ((inv@16@01 r@15@01))
  :pattern ((img@17@01 r@15@01))
  :qid |data-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@17@01 r) (Set_in (inv@16@01 r) x__wset@3@01))
    (= (inv@16@01 r) r))
  :pattern ((inv@16@01 r))
  :qid |data-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@16@01 r) x__wset@3@01) (img@17@01 r) (= r (inv@16@01 r)))
    ($Perm.min
      (ite
        (and (img@11@01 r) (Set_in (inv@10@01 r) x__wset@3@01))
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@11@01 r) (Set_in (inv@10@01 r) x__wset@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@18@01 r))
    $Perm.No)
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@16@01 r) x__wset@3@01) (img@17@01 r) (= r (inv@16@01 r)))
    (= (- $Perm.Write (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<data>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_data (as sm@19@01  $FVF<data>)))
      (and (Set_in (inv@16@01 r) x__wset@3@01) (img@17@01 r)))
    (=>
      (and (Set_in (inv@16@01 r) x__wset@3@01) (img@17@01 r))
      (Set_in r ($FVF.domain_data (as sm@19@01  $FVF<data>)))))
  :pattern ((Set_in r ($FVF.domain_data (as sm@19@01  $FVF<data>))))
  :qid |qp.fvfDomDef2|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@16@01 r) x__wset@3@01) (img@17@01 r))
      (and (img@11@01 r) (Set_in (inv@10@01 r) x__wset@3@01)))
    (=
      ($FVF.lookup_data (as sm@19@01  $FVF<data>) r)
      ($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
        ($SortWrappers.$RefTo$Snap x@2@01)
        ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01))))) r)))
  :pattern (($FVF.lookup_data (as sm@19@01  $FVF<data>) r))
  :pattern (($FVF.lookup_data ($SortWrappers.$SnapTo$FVF<data> ($Snap.first ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@2@01)
    ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01))))) r))
  :qid |qp.fvfValDef1|)))
(declare-const r@20@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in wset)
(assert (Set_in r@20@01 x__wset@3@01))
(pop) ; 3
(declare-fun inv@21@01 ($Ref Set<$Ref>) $Ref)
(declare-fun img@22@01 ($Ref Set<$Ref>) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@20@01 $Ref) (r2@20@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@20@01 x__wset@3@01)
      (Set_in r2@20@01 x__wset@3@01)
      (= r1@20@01 r2@20@01))
    (= r1@20@01 r2@20@01))
  
  :qid |Node__isolated-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@20@01 $Ref)) (!
  (=>
    (Set_in r@20@01 x__wset@3@01)
    (and
      (= (inv@21@01 r@20@01 x__wset@3@01) r@20@01)
      (img@22@01 r@20@01 x__wset@3@01)))
  :pattern ((Set_in r@20@01 x__wset@3@01))
  :pattern ((inv@21@01 r@20@01 x__wset@3@01))
  :pattern ((img@22@01 r@20@01 x__wset@3@01))
  :qid |Node__isolated-invOfFct|)))
(assert (forall ((ref $Ref) (wset Set<$Ref>)) (!
  (=>
    (and (img@22@01 ref wset) (Set_in (inv@21@01 ref wset) x__wset@3@01))
    (and (= (inv@21@01 ref wset) ref) (Set_equal x__wset@3@01 wset)))
  :pattern ((inv@21@01 ref wset))
  :qid |Node__isolated-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((ref $Ref) (wset Set<$Ref>)) $Perm
  (ite
    (and
      (Set_in (inv@21@01 ref wset) x__wset@3@01)
      (img@22@01 ref wset)
      (and (= ref (inv@21@01 ref wset)) (Set_equal wset x__wset@3@01)))
    ($Perm.min
      (ite
        (and (img@14@01 ref wset) (Set_in (inv@13@01 ref wset) x__wset@3@01))
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
(assert (not (forall ((ref $Ref) (wset Set<$Ref>)) (!
  (=
    (-
      (ite
        (and (img@14@01 ref wset) (Set_in (inv@13@01 ref wset) x__wset@3@01))
        $Perm.Write
        $Perm.No)
      (pTaken@23@01 ref wset))
    $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((ref $Ref) (wset Set<$Ref>)) (!
  (=>
    (and
      (Set_in (inv@21@01 ref wset) x__wset@3@01)
      (img@22@01 ref wset)
      (and (= ref (inv@21@01 ref wset)) (Set_equal wset x__wset@3@01)))
    (= (- $Perm.Write (pTaken@23@01 ref wset)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $PSF<Node__isolated>)
(declare-const s@25@01 $Snap)
; Definitional axioms for snapshot map domain
(assert (forall ((s@25@01 $Snap)) (!
  (and
    (=>
      (Set_in s@25@01 ($PSF.domain_Node__isolated (as sm@24@01  $PSF<Node__isolated>)))
      (and
        (Set_in (inv@21@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@25@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.second s@25@01))) x__wset@3@01)
        (img@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@25@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.second s@25@01)))))
    (=>
      (and
        (Set_in (inv@21@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@25@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.second s@25@01))) x__wset@3@01)
        (img@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@25@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.second s@25@01))))
      (Set_in s@25@01 ($PSF.domain_Node__isolated (as sm@24@01  $PSF<Node__isolated>)))))
  :pattern ((Set_in s@25@01 ($PSF.domain_Node__isolated (as sm@24@01  $PSF<Node__isolated>))))
  :qid |qp.psmDomDef4|)))
; Definitional axioms for snapshot map values
(assert (forall ((s@25@01 $Snap)) (!
  (=>
    (and
      (and
        (Set_in (inv@21@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@25@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.second s@25@01))) x__wset@3@01)
        (img@22@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@25@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.second s@25@01))))
      (and
        (img@14@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@25@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.second s@25@01)))
        (Set_in (inv@13@01 ($SortWrappers.$SnapTo$Ref ($Snap.first s@25@01)) ($SortWrappers.$SnapToSet<$Ref> ($Snap.second s@25@01))) x__wset@3@01)))
    (and
      (not (= s@25@01 $Snap.unit))
      (=
        ($PSF.lookup_Node__isolated (as sm@24@01  $PSF<Node__isolated>) s@25@01)
        ($PSF.lookup_Node__isolated ($SortWrappers.$SnapTo$PSF<Node__isolated> ($Snap.second ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
          ($SortWrappers.$RefTo$Snap x@2@01)
          ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01))))) s@25@01))))
  :pattern (($PSF.lookup_Node__isolated (as sm@24@01  $PSF<Node__isolated>) s@25@01))
  :pattern (($PSF.lookup_Node__isolated ($SortWrappers.$SnapTo$PSF<Node__isolated> ($Snap.second ($PSF.lookup_Node__isolated (as sm@7@01  $PSF<Node__isolated>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@2@01)
    ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01))))) s@25@01))
  :qid |qp.psmValDef3|)))
(assert (Node__isolated%trigger ($Snap.combine
  ($SortWrappers.$FVF<data>To$Snap (as sm@19@01  $FVF<data>))
  ($SortWrappers.$PSF<Node__isolated>To$Snap (as sm@24@01  $PSF<Node__isolated>))) x@2@01 x__wset@3@01))
(declare-const sm@26@01 $PSF<Node__isolated>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($PSF.lookup_Node__isolated (as sm@26@01  $PSF<Node__isolated>) ($Snap.combine
    ($SortWrappers.$RefTo$Snap x@2@01)
    ($SortWrappers.Set<$Ref>To$Snap x__wset@3@01)))
  ($Snap.combine
    ($SortWrappers.$FVF<data>To$Snap (as sm@19@01  $FVF<data>))
    ($SortWrappers.$PSF<Node__isolated>To$Snap (as sm@24@01  $PSF<Node__isolated>)))))
(pop) ; 2
(pop) ; 1
