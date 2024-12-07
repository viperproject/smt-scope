(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:16
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0331.vpr
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
(declare-sort $FVF<nx> 0)
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
(declare-fun $SortWrappers.$FVF<nx>To$Snap ($FVF<nx>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<nx> ($Snap) $FVF<nx>)
(assert (forall ((x $FVF<nx>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<nx>($SortWrappers.$FVF<nx>To$Snap x)))
    :pattern (($SortWrappers.$FVF<nx>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<nx>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<nx>To$Snap($SortWrappers.$SnapTo$FVF<nx> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<nx> x))
    :qid |$Snap.$FVF<nx>To$SnapTo$FVF<nx>|
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
; /field_value_functions_declarations.smt2 [nx: Ref]
(declare-fun $FVF.domain_nx ($FVF<nx>) Set<$Ref>)
(declare-fun $FVF.lookup_nx ($FVF<nx> $Ref) $Ref)
(declare-fun $FVF.after_nx ($FVF<nx> $FVF<nx>) Bool)
(declare-fun $FVF.loc_nx ($Ref $Ref) Bool)
(declare-fun $FVF.perm_nx ($FPM $Ref) $Perm)
(declare-const $fvfTOP_nx $FVF<nx>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun integer ($Snap $Ref) Int)
(declare-fun integer%limited ($Snap $Ref) Int)
(declare-fun integer%stateless ($Ref) Bool)
(declare-fun integer%precondition ($Snap $Ref) Bool)
(declare-fun integer2 ($Snap $Ref Int) Int)
(declare-fun integer2%limited ($Snap $Ref Int) Int)
(declare-fun integer2%stateless ($Ref Int) Bool)
(declare-fun integer2%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Peano%trigger ($Snap $Ref) Bool)
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
; /field_value_functions_axioms.smt2 [nx: Ref]
(assert (forall ((vs $FVF<nx>) (ws $FVF<nx>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_nx vs) ($FVF.domain_nx ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_nx vs))
            (= ($FVF.lookup_nx vs x) ($FVF.lookup_nx ws x)))
          :pattern (($FVF.lookup_nx vs x) ($FVF.lookup_nx ws x))
          :qid |qp.$FVF<nx>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<nx>To$Snap vs)
              ($SortWrappers.$FVF<nx>To$Snap ws)
              )
    :qid |qp.$FVF<nx>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_nx pm r))
    :pattern (($FVF.perm_nx pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_nx f r) true)
    :pattern (($FVF.loc_nx f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@5@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (= (integer%limited s@$ r@0@00) (integer s@$ r@0@00))
  :pattern ((integer s@$ r@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (integer%stateless r@0@00)
  :pattern ((integer%limited s@$ r@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (=>
    (integer%precondition s@$ r@0@00)
    (=
      (integer s@$ r@0@00)
      (ite
        (= r@0@00 $Ref.null)
        0
        (+
          1
          (integer%limited ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))))
  :pattern ((integer s@$ r@0@00))
  :pattern ((integer%stateless r@0@00) (Peano%trigger s@$ r@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (r@0@00 $Ref)) (!
  (=>
    (integer%precondition s@$ r@0@00)
    (ite
      (= r@0@00 $Ref.null)
      true
      (integer%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))))
  :pattern ((integer s@$ r@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref) (k@3@00 Int)) (!
  (= (integer2%limited s@$ r@2@00 k@3@00) (integer2 s@$ r@2@00 k@3@00))
  :pattern ((integer2 s@$ r@2@00 k@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref) (k@3@00 Int)) (!
  (integer2%stateless r@2@00 k@3@00)
  :pattern ((integer2%limited s@$ r@2@00 k@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref) (k@3@00 Int)) (!
  (=>
    (integer2%precondition s@$ r@2@00 k@3@00)
    (= (integer2 s@$ r@2@00 k@3@00) (+ (integer s@$ r@2@00) k@3@00)))
  :pattern ((integer2 s@$ r@2@00 k@3@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (r@2@00 $Ref) (k@3@00 Int)) (!
  (=>
    (integer2%precondition s@$ r@2@00 k@3@00)
    (integer%precondition s@$ r@2@00))
  :pattern ((integer2 s@$ r@2@00 k@3@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- A ----------
(declare-const r@0@01 $Ref)
(declare-const r@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.second $t@2@01) $Snap.unit))
; [eval] r != null
(assert (not (= r@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (unfolding acc(Peano(r), write) in r.nx == r)
(declare-const $t@3@01 $Snap)
(assert (= $t@3@01 $Snap.unit))
; [eval] (unfolding acc(Peano(r), write) in r.nx == r)
(push) ; 3
(assert (Peano%trigger ($Snap.first $t@2@01) r@1@01))
; [eval] r != null
(push) ; 4
(set-option :timeout 10)
(assert (not (= r@1@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | r@1@01 != Null | live]
; [else-branch: 0 | r@1@01 == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | r@1@01 != Null]
(assert (=
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.second ($Snap.first $t@2@01)))))
; [eval] r.nx == r
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (Peano%trigger ($Snap.first $t@2@01) r@1@01))
(assert (=>
  (not (= r@1@01 $Ref.null))
  (=
    ($Snap.first $t@2@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@2@01))
      ($Snap.second ($Snap.first $t@2@01))))))
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) r@1@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall k: Int ::
;     { integer2(r.nx, k) }
;     (unfolding acc(Peano(r), write) in integer2(r.nx, k) >= 0) ==>
;     integer2(r, k) > 0)
; [eval] (forall k: Int :: { integer2(r.nx, k) } (unfolding acc(Peano(r), write) in integer2(r.nx, k) >= 0) ==> integer2(r, k) > 0)
(declare-const k@4@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (unfolding acc(Peano(r), write) in integer2(r.nx, k) >= 0) ==> integer2(r, k) > 0
; [eval] (unfolding acc(Peano(r), write) in integer2(r.nx, k) >= 0)
(push) ; 4
; [eval] r != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@1@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | r@1@01 != Null | live]
; [else-branch: 1 | r@1@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 1 | r@1@01 != Null]
(assert (=
  ($Snap.first $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@2@01))
    ($Snap.second ($Snap.first $t@2@01)))))
; [eval] integer2(r.nx, k) >= 0
; [eval] integer2(r.nx, k)
(push) ; 6
(assert (integer2%precondition ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01))
(pop) ; 6
; Joined path conditions
(assert (integer2%precondition ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (not (= r@1@01 $Ref.null))
  (and
    (=
      ($Snap.first $t@2@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@2@01))
        ($Snap.second ($Snap.first $t@2@01))))
    (integer2%precondition ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01))))
(push) ; 4
; [then-branch: 2 | integer2(Second:(First:($t@2@01)), First:(First:($t@2@01)), k@4@01) >= 0 | live]
; [else-branch: 2 | !(integer2(Second:(First:($t@2@01)), First:(First:($t@2@01)), k@4@01) >= 0) | live]
(push) ; 5
; [then-branch: 2 | integer2(Second:(First:($t@2@01)), First:(First:($t@2@01)), k@4@01) >= 0]
(assert (>=
  (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
  0))
; [eval] integer2(r, k) > 0
; [eval] integer2(r, k)
(push) ; 6
(assert (integer2%precondition ($Snap.first $t@2@01) r@1@01 k@4@01))
(pop) ; 6
; Joined path conditions
(assert (integer2%precondition ($Snap.first $t@2@01) r@1@01 k@4@01))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(integer2(Second:(First:($t@2@01)), First:(First:($t@2@01)), k@4@01) >= 0)]
(assert (not
  (>=
    (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
    0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>=
    (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
    0)
  (and
    (>=
      (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
      0)
    (integer2%precondition ($Snap.first $t@2@01) r@1@01 k@4@01))))
; Joined path conditions
(assert (or
  (not
    (>=
      (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
      0))
  (>=
    (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
    0)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@4@01 Int)) (!
  (and
    (=>
      (not (= r@1@01 $Ref.null))
      (and
        (=
          ($Snap.first $t@2@01)
          ($Snap.combine
            ($Snap.first ($Snap.first $t@2@01))
            ($Snap.second ($Snap.first $t@2@01))))
        (integer2%precondition ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)))
    (=>
      (>=
        (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
        0)
      (and
        (>=
          (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
          0)
        (integer2%precondition ($Snap.first $t@2@01) r@1@01 k@4@01)))
    (or
      (not
        (>=
          (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
          0))
      (>=
        (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
        0)))
  :pattern ((integer2%limited ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0331.vpr@21@10@23@72-aux|)))
(assert (forall ((k@4@01 Int)) (!
  (and
    (integer2%precondition ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
    (=>
      (>=
        (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
        0)
      (integer2%precondition ($Snap.first $t@2@01) r@1@01 k@4@01)))
  :pattern ((integer2%limited ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0331.vpr@21@10@23@72_precondition|)))
(push) ; 3
(assert (not (forall ((k@4@01 Int)) (!
  (=>
    (and
      (and
        (integer2%precondition ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
        (=>
          (>=
            (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
            0)
          (integer2%precondition ($Snap.first $t@2@01) r@1@01 k@4@01)))
      (>=
        (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
        0))
    (> (integer2 ($Snap.first $t@2@01) r@1@01 k@4@01) 0))
  :pattern ((integer2%limited ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0331.vpr@21@10@23@72|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@4@01 Int)) (!
  (=>
    (>=
      (integer2 ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01)
      0)
    (> (integer2 ($Snap.first $t@2@01) r@1@01 k@4@01) 0))
  :pattern ((integer2%limited ($Snap.second ($Snap.first $t@2@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@2@01))) k@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0331.vpr@21@10@23@72|)))
(pop) ; 2
(pop) ; 1
; ---------- B ----------
(declare-const r@5@01 $Ref)
(declare-const r@6@01 $Ref)
(push) ; 1
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 ($Snap.combine ($Snap.first $t@7@01) ($Snap.second $t@7@01))))
(assert (= ($Snap.second $t@7@01) $Snap.unit))
; [eval] r != null
(assert (not (= r@6@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall k: Int ::
;     { integer2(r, k) }
;     (unfolding acc(Peano(r), write) in integer2(r.nx, k) >= 0) ==>
;     integer2(r, k) > 0)
; [eval] (forall k: Int :: { integer2(r, k) } (unfolding acc(Peano(r), write) in integer2(r.nx, k) >= 0) ==> integer2(r, k) > 0)
(declare-const k@8@01 Int)
(push) ; 3
; [eval] (unfolding acc(Peano(r), write) in integer2(r.nx, k) >= 0) ==> integer2(r, k) > 0
; [eval] (unfolding acc(Peano(r), write) in integer2(r.nx, k) >= 0)
(push) ; 4
(assert (Peano%trigger ($Snap.first $t@7@01) r@6@01))
; [eval] r != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= r@6@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | r@6@01 != Null | live]
; [else-branch: 3 | r@6@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | r@6@01 != Null]
(assert (=
  ($Snap.first $t@7@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@7@01))
    ($Snap.second ($Snap.first $t@7@01)))))
; [eval] integer2(r.nx, k) >= 0
; [eval] integer2(r.nx, k)
(push) ; 6
(assert (integer2%precondition ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01))
(pop) ; 6
; Joined path conditions
(assert (integer2%precondition ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (Peano%trigger ($Snap.first $t@7@01) r@6@01))
(assert (=>
  (not (= r@6@01 $Ref.null))
  (and
    (=
      ($Snap.first $t@7@01)
      ($Snap.combine
        ($Snap.first ($Snap.first $t@7@01))
        ($Snap.second ($Snap.first $t@7@01))))
    (integer2%precondition ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01))))
(push) ; 4
; [then-branch: 4 | integer2(Second:(First:($t@7@01)), First:(First:($t@7@01)), k@8@01) >= 0 | live]
; [else-branch: 4 | !(integer2(Second:(First:($t@7@01)), First:(First:($t@7@01)), k@8@01) >= 0) | live]
(push) ; 5
; [then-branch: 4 | integer2(Second:(First:($t@7@01)), First:(First:($t@7@01)), k@8@01) >= 0]
(assert (>=
  (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
  0))
; [eval] integer2(r, k) > 0
; [eval] integer2(r, k)
(push) ; 6
(assert (integer2%precondition ($Snap.first $t@7@01) r@6@01 k@8@01))
(pop) ; 6
; Joined path conditions
(assert (integer2%precondition ($Snap.first $t@7@01) r@6@01 k@8@01))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(integer2(Second:(First:($t@7@01)), First:(First:($t@7@01)), k@8@01) >= 0)]
(assert (not
  (>=
    (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
    0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>=
    (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
    0)
  (and
    (>=
      (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
      0)
    (integer2%precondition ($Snap.first $t@7@01) r@6@01 k@8@01))))
; Joined path conditions
(assert (or
  (not
    (>=
      (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
      0))
  (>=
    (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
    0)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (Peano%trigger ($Snap.first $t@7@01) r@6@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@8@01 Int)) (!
  (and
    (=>
      (not (= r@6@01 $Ref.null))
      (and
        (=
          ($Snap.first $t@7@01)
          ($Snap.combine
            ($Snap.first ($Snap.first $t@7@01))
            ($Snap.second ($Snap.first $t@7@01))))
        (integer2%precondition ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)))
    (=>
      (>=
        (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
        0)
      (and
        (>=
          (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
          0)
        (integer2%precondition ($Snap.first $t@7@01) r@6@01 k@8@01)))
    (or
      (not
        (>=
          (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
          0))
      (>=
        (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
        0)))
  :pattern ((integer2%limited ($Snap.first $t@7@01) r@6@01 k@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0331.vpr@30@10@32@72-aux|)))
(assert (forall ((k@8@01 Int)) (!
  (and
    (integer2%precondition ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
    (=>
      (>=
        (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
        0)
      (integer2%precondition ($Snap.first $t@7@01) r@6@01 k@8@01)))
  :pattern ((integer2%limited ($Snap.first $t@7@01) r@6@01 k@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0331.vpr@30@10@32@72_precondition|)))
(push) ; 3
(assert (not (forall ((k@8@01 Int)) (!
  (=>
    (and
      (and
        (integer2%precondition ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
        (=>
          (>=
            (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
            0)
          (integer2%precondition ($Snap.first $t@7@01) r@6@01 k@8@01)))
      (>=
        (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
        0))
    (> (integer2 ($Snap.first $t@7@01) r@6@01 k@8@01) 0))
  :pattern ((integer2%limited ($Snap.first $t@7@01) r@6@01 k@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0331.vpr@30@10@32@72|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@8@01 Int)) (!
  (=>
    (>=
      (integer2 ($Snap.second ($Snap.first $t@7@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.first $t@7@01))) k@8@01)
      0)
    (> (integer2 ($Snap.first $t@7@01) r@6@01 k@8@01) 0))
  :pattern ((integer2%limited ($Snap.first $t@7@01) r@6@01 k@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0331.vpr@30@10@32@72|)))
(pop) ; 2
(pop) ; 1
