(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/unofficial_0002.vpr
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
(declare-sort $FVF<left> 0)
(declare-sort $FVF<is_marked> 0)
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
(declare-fun $SortWrappers.$FVF<left>To$Snap ($FVF<left>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<left> ($Snap) $FVF<left>)
(assert (forall ((x $FVF<left>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<left>($SortWrappers.$FVF<left>To$Snap x)))
    :pattern (($SortWrappers.$FVF<left>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<left>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<left>To$Snap($SortWrappers.$SnapTo$FVF<left> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<left> x))
    :qid |$Snap.$FVF<left>To$SnapTo$FVF<left>|
    )))
(declare-fun $SortWrappers.$FVF<is_marked>To$Snap ($FVF<is_marked>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<is_marked> ($Snap) $FVF<is_marked>)
(assert (forall ((x $FVF<is_marked>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<is_marked>($SortWrappers.$FVF<is_marked>To$Snap x)))
    :pattern (($SortWrappers.$FVF<is_marked>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<is_marked>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<is_marked>To$Snap($SortWrappers.$SnapTo$FVF<is_marked> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<is_marked> x))
    :qid |$Snap.$FVF<is_marked>To$SnapTo$FVF<is_marked>|
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
; /field_value_functions_declarations.smt2 [left: Ref]
(declare-fun $FVF.domain_left ($FVF<left>) Set<$Ref>)
(declare-fun $FVF.lookup_left ($FVF<left> $Ref) $Ref)
(declare-fun $FVF.after_left ($FVF<left> $FVF<left>) Bool)
(declare-fun $FVF.loc_left ($Ref $Ref) Bool)
(declare-fun $FVF.perm_left ($FPM $Ref) $Perm)
(declare-const $fvfTOP_left $FVF<left>)
; /field_value_functions_declarations.smt2 [is_marked: Bool]
(declare-fun $FVF.domain_is_marked ($FVF<is_marked>) Set<$Ref>)
(declare-fun $FVF.lookup_is_marked ($FVF<is_marked> $Ref) Bool)
(declare-fun $FVF.after_is_marked ($FVF<is_marked> $FVF<is_marked>) Bool)
(declare-fun $FVF.loc_is_marked (Bool $Ref) Bool)
(declare-fun $FVF.perm_is_marked ($FPM $Ref) $Perm)
(declare-const $fvfTOP_is_marked $FVF<is_marked>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
; /field_value_functions_axioms.smt2 [left: Ref]
(assert (forall ((vs $FVF<left>) (ws $FVF<left>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_left vs) ($FVF.domain_left ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_left vs))
            (= ($FVF.lookup_left vs x) ($FVF.lookup_left ws x)))
          :pattern (($FVF.lookup_left vs x) ($FVF.lookup_left ws x))
          :qid |qp.$FVF<left>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<left>To$Snap vs)
              ($SortWrappers.$FVF<left>To$Snap ws)
              )
    :qid |qp.$FVF<left>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_left pm r))
    :pattern (($FVF.perm_left pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_left f r) true)
    :pattern (($FVF.loc_left f r)))))
; /field_value_functions_axioms.smt2 [is_marked: Bool]
(assert (forall ((vs $FVF<is_marked>) (ws $FVF<is_marked>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_is_marked vs) ($FVF.domain_is_marked ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_is_marked vs))
            (= ($FVF.lookup_is_marked vs x) ($FVF.lookup_is_marked ws x)))
          :pattern (($FVF.lookup_is_marked vs x) ($FVF.lookup_is_marked ws x))
          :qid |qp.$FVF<is_marked>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<is_marked>To$Snap vs)
              ($SortWrappers.$FVF<is_marked>To$Snap ws)
              )
    :qid |qp.$FVF<is_marked>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_is_marked pm r))
    :pattern (($FVF.perm_is_marked pm r)))))
(assert (forall ((r $Ref) (f Bool)) (!
    (= ($FVF.loc_is_marked f r) true)
    :pattern (($FVF.loc_is_marked f r)))))
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
; ---------- trav ----------
(declare-const graph@0@01 Set<$Ref>)
(declare-const node@1@01 $Ref)
(declare-const graph@2@01 Set<$Ref>)
(declare-const node@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] (node in graph)
(assert (Set_in node@3@01 graph@2@01))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] !((null in graph))
; [eval] (null in graph)
(assert (not (Set_in $Ref.null graph@2@01)))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(declare-const a@5@01 $Ref)
(push) ; 2
; [eval] (a in graph)
(assert (Set_in a@5@01 graph@2@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((a1@5@01 $Ref) (a2@5@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@5@01 graph@2@01)
      (Set_in a2@5@01 graph@2@01)
      (= a1@5@01 a2@5@01))
    (= a1@5@01 a2@5@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@5@01 $Ref)) (!
  (=>
    (Set_in a@5@01 graph@2@01)
    (and (= (inv@6@01 a@5@01) a@5@01) (img@7@01 a@5@01)))
  :pattern ((Set_in a@5@01 graph@2@01))
  :pattern ((inv@6@01 a@5@01))
  :pattern ((img@7@01 a@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) graph@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |left-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((a@5@01 $Ref)) (!
  (=> (Set_in a@5@01 graph@2@01) (not (= a@5@01 $Ref.null)))
  :pattern ((Set_in a@5@01 graph@2@01))
  :pattern ((inv@6@01 a@5@01))
  :pattern ((img@7@01 a@5@01))
  :qid |left-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(declare-const c@8@01 $Ref)
(push) ; 2
; [eval] (c in graph)
(assert (Set_in c@8@01 graph@2@01))
(pop) ; 2
(declare-fun inv@9@01 ($Ref) $Ref)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((c1@8@01 $Ref) (c2@8@01 $Ref)) (!
  (=>
    (and
      (Set_in c1@8@01 graph@2@01)
      (Set_in c2@8@01 graph@2@01)
      (= c1@8@01 c2@8@01))
    (= c1@8@01 c2@8@01))
  
  :qid |is_marked-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((c@8@01 $Ref)) (!
  (=>
    (Set_in c@8@01 graph@2@01)
    (and (= (inv@9@01 c@8@01) c@8@01) (img@10@01 c@8@01)))
  :pattern ((Set_in c@8@01 graph@2@01))
  :pattern ((inv@9@01 c@8@01))
  :pattern ((img@10@01 c@8@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01)) (= (inv@9@01 r) r))
  :pattern ((inv@9@01 r))
  :qid |is_marked-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((c@8@01 $Ref)) (!
  (=> (Set_in c@8@01 graph@2@01) (not (= c@8@01 $Ref.null)))
  :pattern ((Set_in c@8@01 graph@2@01))
  :pattern ((inv@9@01 c@8@01))
  :pattern ((img@10@01 c@8@01))
  :qid |is_marked-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; [eval] (forall x: Ref :: { (x in graph) } { (x.left in graph) } (x in graph) ==> x.left != null ==> (x.left in graph))
(declare-const x@11@01 $Ref)
(push) ; 2
; [eval] (x in graph) ==> x.left != null ==> (x.left in graph)
; [eval] (x in graph)
(push) ; 3
; [then-branch: 0 | x@11@01 in graph@2@01 | live]
; [else-branch: 0 | !(x@11@01 in graph@2@01) | live]
(push) ; 4
; [then-branch: 0 | x@11@01 in graph@2@01]
(assert (Set_in x@11@01 graph@2@01))
; [eval] x.left != null ==> (x.left in graph)
; [eval] x.left != null
(push) ; 5
(assert (not (and (img@7@01 x@11@01) (Set_in (inv@6@01 x@11@01) graph@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 1 | Lookup(left, First:(Second:(Second:($t@4@01))), x@11@01) != Null | live]
; [else-branch: 1 | Lookup(left, First:(Second:(Second:($t@4@01))), x@11@01) == Null | live]
(push) ; 6
; [then-branch: 1 | Lookup(left, First:(Second:(Second:($t@4@01))), x@11@01) != Null]
(assert (not
  (=
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
    $Ref.null)))
; [eval] (x.left in graph)
(push) ; 7
(assert (not (and (img@7@01 x@11@01) (Set_in (inv@6@01 x@11@01) graph@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 1 | Lookup(left, First:(Second:(Second:($t@4@01))), x@11@01) == Null]
(assert (=
  ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
  $Ref.null))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (=
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
    $Ref.null)
  (not
    (=
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
      $Ref.null))))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(x@11@01 in graph@2@01)]
(assert (not (Set_in x@11@01 graph@2@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (Set_in x@11@01 graph@2@01)
  (and
    (Set_in x@11@01 graph@2@01)
    (or
      (=
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
        $Ref.null)
      (not
        (=
          ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
          $Ref.null))))))
; Joined path conditions
(assert (or (not (Set_in x@11@01 graph@2@01)) (Set_in x@11@01 graph@2@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@11@01 $Ref)) (!
  (and
    (=>
      (Set_in x@11@01 graph@2@01)
      (and
        (Set_in x@11@01 graph@2@01)
        (or
          (=
            ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
              $Ref.null)))))
    (or (not (Set_in x@11@01 graph@2@01)) (Set_in x@11@01 graph@2@01)))
  :pattern ((Set_in x@11@01 graph@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/unofficial_0002.vpr@19@28@19@38-aux|)))
(assert (forall ((x@11@01 $Ref)) (!
  (and
    (=>
      (Set_in x@11@01 graph@2@01)
      (and
        (Set_in x@11@01 graph@2@01)
        (or
          (=
            ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
            $Ref.null)
          (not
            (=
              ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
              $Ref.null)))))
    (or (not (Set_in x@11@01 graph@2@01)) (Set_in x@11@01 graph@2@01)))
  :pattern ((Set_in ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01) graph@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/unofficial_0002.vpr@19@28@19@38-aux|)))
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (and
      (Set_in x@11@01 graph@2@01)
      (not
        (=
          ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01) graph@2@01))
  :pattern ((Set_in x@11@01 graph@2@01))
  :pattern ((Set_in ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) x@11@01) graph@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/unofficial_0002.vpr@19@28@19@38|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; [eval] !node.is_marked
(push) ; 2
(assert (not (and (img@10@01 node@3@01) (Set_in (inv@9@01 node@3@01) graph@2@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not
  ($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) node@3@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(declare-const sm@13@01 $FVF<is_marked>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_is_marked (as sm@13@01  $FVF<is_marked>) node@3@01)
  ($SortWrappers.$SnapToBool ($Snap.first $t@12@01))))
(assert (not (= node@3@01 $Ref.null)))
(assert (= ($Snap.second $t@12@01) $Snap.unit))
(assert ($FVF.lookup_is_marked (as sm@13@01  $FVF<is_marked>) node@3@01))
(pop) ; 2
(push) ; 2
; [exec]
; node.is_marked := true
; Precomputing data for removing quantified permissions
(define-fun pTaken@14@01 ((r $Ref)) $Perm
  (ite
    (= r node@3@01)
    ($Perm.min
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
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
        (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
        $Perm.Write
        $Perm.No)
      (pTaken@14@01 r))
    $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@14@01 r) $Perm.No)
  
  :qid |quant-u-6|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r node@3@01) (= (- $Perm.Write (pTaken@14@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@15@01 $FVF<is_marked>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) node@3@01) true))
; [eval] node.left != null && !node.left.is_marked
; [eval] node.left != null
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@7@01 node@3@01) (Set_in (inv@6@01 node@3@01) graph@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
; [then-branch: 2 | Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01) == Null | live]
; [else-branch: 2 | Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01) != Null | live]
(push) ; 4
; [then-branch: 2 | Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01) == Null]
(assert (=
  ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
  $Ref.null))
(pop) ; 4
(push) ; 4
; [else-branch: 2 | Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01) != Null]
(assert (not
  (=
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
    $Ref.null)))
; [eval] !node.left.is_marked
(push) ; 5
(assert (not (and (img@7@01 node@3@01) (Set_in (inv@6@01 node@3@01) graph@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-const sm@16@01 $FVF<is_marked>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r node@3@01)
    (=
      ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r)
      ($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) r)))
  :pattern (($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r))
  :pattern (($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r)
      ($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r)))
  :pattern (($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r))
  :pattern (($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@17@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_is_marked (as pm@17@01  $FPM) r)
    (+
      (ite (= r node@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_is_marked (as pm@17@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(push) ; 5
(assert (not (<
  $Perm.No
  ($FVF.perm_is_marked (as pm@17@01  $FPM) ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r node@3@01)
    (=
      ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r)
      ($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) r)))
  :pattern (($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r))
  :pattern (($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r)
      ($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r)))
  :pattern (($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r))
  :pattern (($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_is_marked (as pm@17@01  $FPM) r)
    (+
      (ite (= r node@3@01) $Perm.Write $Perm.No)
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_is_marked (as pm@17@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(assert (or
  (not
    (=
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
      $Ref.null))
  (=
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
    $Ref.null)))
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (and
    (not
      (=
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
        $Ref.null))
    (not
      ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (not
    (=
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
      $Ref.null))
  (not
    ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 3 | Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01) != Null && !(Lookup(is_marked, sm@16@01, Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01))) | live]
; [else-branch: 3 | !(Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01) != Null && !(Lookup(is_marked, sm@16@01, Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01)))) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01) != Null && !(Lookup(is_marked, sm@16@01, Lookup(left, First:(Second:(Second:($t@4@01))), node@3@01)))]
(assert (and
  (not
    (=
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
      $Ref.null))
  (not
    ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)))))
; [exec]
; trav(graph, node.left)
(push) ; 4
(assert (not (and (img@7@01 node@3@01) (Set_in (inv@6@01 node@3@01) graph@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (node in graph)
(push) ; 4
(assert (not (Set_in ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01) graph@2@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Set_in ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01) graph@2@01))
; [eval] !((null in graph))
; [eval] (null in graph)
(declare-const a@18@01 $Ref)
(push) ; 4
; [eval] (a in graph)
(assert (Set_in a@18@01 graph@2@01))
(pop) ; 4
(declare-fun inv@19@01 ($Ref) $Ref)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((a1@18@01 $Ref) (a2@18@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@18@01 graph@2@01)
      (Set_in a2@18@01 graph@2@01)
      (= a1@18@01 a2@18@01))
    (= a1@18@01 a2@18@01))
  
  :qid |left-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@18@01 $Ref)) (!
  (=>
    (Set_in a@18@01 graph@2@01)
    (and (= (inv@19@01 a@18@01) a@18@01) (img@20@01 a@18@01)))
  :pattern ((Set_in a@18@01 graph@2@01))
  :pattern ((inv@19@01 a@18@01))
  :pattern ((img@20@01 a@18@01))
  :qid |left-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@20@01 r) (Set_in (inv@19@01 r) graph@2@01)) (= (inv@19@01 r) r))
  :pattern ((inv@19@01 r))
  :qid |left-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@19@01 r) graph@2@01) (img@20@01 r) (= r (inv@19@01 r)))
    ($Perm.min
      (ite
        (and (img@7@01 r) (Set_in (inv@6@01 r) graph@2@01))
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
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@7@01 r) (Set_in (inv@6@01 r) graph@2@01))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@19@01 r) graph@2@01) (img@20@01 r) (= r (inv@19@01 r)))
    (= (- $Perm.Write (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $FVF<left>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) graph@2@01))
    (=
      ($FVF.lookup_left (as sm@22@01  $FVF<left>) r)
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_left (as sm@22@01  $FVF<left>) r))
  :pattern (($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef3|)))
(declare-const c@23@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (c in graph)
(assert (Set_in c@23@01 graph@2@01))
(pop) ; 4
(declare-fun inv@24@01 ($Ref) $Ref)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((c1@23@01 $Ref) (c2@23@01 $Ref)) (!
  (=>
    (and
      (Set_in c1@23@01 graph@2@01)
      (Set_in c2@23@01 graph@2@01)
      (= c1@23@01 c2@23@01))
    (= c1@23@01 c2@23@01))
  
  :qid |is_marked-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((c@23@01 $Ref)) (!
  (=>
    (Set_in c@23@01 graph@2@01)
    (and (= (inv@24@01 c@23@01) c@23@01) (img@25@01 c@23@01)))
  :pattern ((Set_in c@23@01 graph@2@01))
  :pattern ((inv@24@01 c@23@01))
  :pattern ((img@25@01 c@23@01))
  :qid |is_marked-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@25@01 r) (Set_in (inv@24@01 r) graph@2@01)) (= (inv@24@01 r) r))
  :pattern ((inv@24@01 r))
  :qid |is_marked-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@24@01 r) graph@2@01) (img@25@01 r) (= r (inv@24@01 r)))
    ($Perm.min
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@27@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@24@01 r) graph@2@01) (img@25@01 r) (= r (inv@24@01 r)))
    ($Perm.min
      (ite (= r node@3@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@26@01 r)))
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
        (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
        (- $Perm.Write (pTaken@14@01 r))
        $Perm.No)
      (pTaken@26@01 r))
    $Perm.No)
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@24@01 r) graph@2@01) (img@25@01 r) (= r (inv@24@01 r)))
    (= (- $Perm.Write (pTaken@26@01 r)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@27@01 node@3@01)) $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@24@01 r) graph@2@01) (img@25@01 r) (= r (inv@24@01 r)))
    (= (- (- $Perm.Write (pTaken@26@01 r)) (pTaken@27@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@28@01 $FVF<is_marked>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
      (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
      false)
    (=
      ($FVF.lookup_is_marked (as sm@28@01  $FVF<is_marked>) r)
      ($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r)))
  :pattern (($FVF.lookup_is_marked (as sm@28@01  $FVF<is_marked>) r))
  :pattern (($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r node@3@01)
    (=
      ($FVF.lookup_is_marked (as sm@28@01  $FVF<is_marked>) r)
      ($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) r)))
  :pattern (($FVF.lookup_is_marked (as sm@28@01  $FVF<is_marked>) r))
  :pattern (($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) r))
  :qid |qp.fvfValDef5|)))
; [eval] (forall x: Ref :: { (x in graph) } { (x.left in graph) } (x in graph) ==> x.left != null ==> (x.left in graph))
(declare-const x@29@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in graph) ==> x.left != null ==> (x.left in graph)
; [eval] (x in graph)
(push) ; 5
; [then-branch: 4 | x@29@01 in graph@2@01 | live]
; [else-branch: 4 | !(x@29@01 in graph@2@01) | live]
(push) ; 6
; [then-branch: 4 | x@29@01 in graph@2@01]
(assert (Set_in x@29@01 graph@2@01))
; [eval] x.left != null ==> (x.left in graph)
; [eval] x.left != null
(push) ; 7
(assert (not (and (img@7@01 x@29@01) (Set_in (inv@6@01 x@29@01) graph@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 5 | Lookup(left, sm@22@01, x@29@01) != Null | live]
; [else-branch: 5 | Lookup(left, sm@22@01, x@29@01) == Null | live]
(push) ; 8
; [then-branch: 5 | Lookup(left, sm@22@01, x@29@01) != Null]
(assert (not (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)))
; [eval] (x.left in graph)
(push) ; 9
(assert (not (and (img@7@01 x@29@01) (Set_in (inv@6@01 x@29@01) graph@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 5 | Lookup(left, sm@22@01, x@29@01) == Null]
(assert (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)
  (not (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null))))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | !(x@29@01 in graph@2@01)]
(assert (not (Set_in x@29@01 graph@2@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (Set_in x@29@01 graph@2@01)
  (and
    (Set_in x@29@01 graph@2@01)
    (or
      (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)
      (not (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null))))))
; Joined path conditions
(assert (or (not (Set_in x@29@01 graph@2@01)) (Set_in x@29@01 graph@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@29@01 $Ref)) (!
  (and
    (=>
      (Set_in x@29@01 graph@2@01)
      (and
        (Set_in x@29@01 graph@2@01)
        (or
          (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)
          (not
            (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)))))
    (or (not (Set_in x@29@01 graph@2@01)) (Set_in x@29@01 graph@2@01)))
  :pattern ((Set_in x@29@01 graph@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/unofficial_0002.vpr@19@28@19@38-aux|)))
(assert (forall ((x@29@01 $Ref)) (!
  (and
    (=>
      (Set_in x@29@01 graph@2@01)
      (and
        (Set_in x@29@01 graph@2@01)
        (or
          (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)
          (not
            (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)))))
    (or (not (Set_in x@29@01 graph@2@01)) (Set_in x@29@01 graph@2@01)))
  :pattern ((Set_in ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) graph@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/unofficial_0002.vpr@19@28@19@38-aux|)))
(push) ; 4
(assert (not (forall ((x@29@01 $Ref)) (!
  (=>
    (and
      (Set_in x@29@01 graph@2@01)
      (not (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)))
    (Set_in ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) graph@2@01))
  :pattern ((Set_in x@29@01 graph@2@01))
  :pattern ((Set_in ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) graph@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/unofficial_0002.vpr@19@28@19@38|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@29@01 $Ref)) (!
  (=>
    (and
      (Set_in x@29@01 graph@2@01)
      (not (= ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) $Ref.null)))
    (Set_in ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) graph@2@01))
  :pattern ((Set_in x@29@01 graph@2@01))
  :pattern ((Set_in ($FVF.lookup_left (as sm@22@01  $FVF<left>) x@29@01) graph@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/unofficial_0002.vpr@19@28@19@38|)))
; [eval] !node.is_marked
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r node@3@01)
      (=
        ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r)
        ($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) r)))
    :pattern (($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r))
    :pattern (($FVF.lookup_is_marked (as sm@15@01  $FVF<is_marked>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@10@01 r) (Set_in (inv@9@01 r) graph@2@01))
        (< $Perm.No (- $Perm.Write (pTaken@14@01 r)))
        false)
      (=
        ($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r)
        ($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r)))
    :pattern (($FVF.lookup_is_marked (as sm@16@01  $FVF<is_marked>) r))
    :pattern (($FVF.lookup_is_marked ($SortWrappers.$SnapTo$FVF<is_marked> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite
      (=
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
        node@3@01)
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@10@01 ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
        (Set_in (inv@9@01 ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)) graph@2@01))
      (-
        $Perm.Write
        (pTaken@14@01 ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(declare-const sm@31@01 $FVF<is_marked>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_is_marked (as sm@31@01  $FVF<is_marked>) ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
  ($SortWrappers.$SnapToBool ($Snap.first $t@30@01))))
(assert (<=
  $Perm.No
  (ite
    (=
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (=
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (=
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
    ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
  (not
    (=
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
      $Ref.null))))
(assert (= ($Snap.second $t@30@01) $Snap.unit))
(push) ; 4
(assert (not (=
  ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)
  ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert ($FVF.lookup_is_marked (as sm@31@01  $FVF<is_marked>) ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert node.is_marked
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  node@3@01
  ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@32@01 $FVF<is_marked>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
    (=
      ($FVF.lookup_is_marked (as sm@32@01  $FVF<is_marked>) r)
      ($FVF.lookup_is_marked (as sm@31@01  $FVF<is_marked>) r)))
  :pattern (($FVF.lookup_is_marked (as sm@32@01  $FVF<is_marked>) r))
  :pattern (($FVF.lookup_is_marked (as sm@31@01  $FVF<is_marked>) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_is_marked (as pm@33@01  $FPM) r)
    (ite
      (=
        r
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_is_marked (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (<=
  ($FVF.perm_is_marked (as pm@33@01  $FPM) ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
  $Perm.Write))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  node@3@01
  ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@34@01 $FVF<is_marked>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
    (=
      ($FVF.lookup_is_marked (as sm@34@01  $FVF<is_marked>) r)
      ($FVF.lookup_is_marked (as sm@31@01  $FVF<is_marked>) r)))
  :pattern (($FVF.lookup_is_marked (as sm@34@01  $FVF<is_marked>) r))
  :pattern (($FVF.lookup_is_marked (as sm@31@01  $FVF<is_marked>) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@35@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_is_marked (as pm@35@01  $FPM) r)
    (ite
      (=
        r
        ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_is_marked (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(assert (<=
  ($FVF.perm_is_marked (as pm@35@01  $FPM) ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))
  $Perm.Write))
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  node@3@01
  ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(set-option :timeout 0)
(push) ; 4
(assert (not (=
  node@3@01
  ($FVF.lookup_left ($SortWrappers.$SnapTo$FVF<left> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) node@3@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
