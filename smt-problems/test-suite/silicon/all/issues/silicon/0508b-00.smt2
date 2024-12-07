(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:18
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0508b.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort VCTArray<Ref> 0)
(declare-sort $FVF<item> 0)
(declare-sort $FVF<bool_prop> 0)
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
(declare-fun $SortWrappers.VCTArray<Ref>To$Snap (VCTArray<Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToVCTArray<Ref> ($Snap) VCTArray<Ref>)
(assert (forall ((x VCTArray<Ref>)) (!
    (= x ($SortWrappers.$SnapToVCTArray<Ref>($SortWrappers.VCTArray<Ref>To$Snap x)))
    :pattern (($SortWrappers.VCTArray<Ref>To$Snap x))
    :qid |$Snap.$SnapToVCTArray<Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.VCTArray<Ref>To$Snap($SortWrappers.$SnapToVCTArray<Ref> x)))
    :pattern (($SortWrappers.$SnapToVCTArray<Ref> x))
    :qid |$Snap.VCTArray<Ref>To$SnapToVCTArray<Ref>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<item>To$Snap ($FVF<item>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<item> ($Snap) $FVF<item>)
(assert (forall ((x $FVF<item>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<item>($SortWrappers.$FVF<item>To$Snap x)))
    :pattern (($SortWrappers.$FVF<item>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<item>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<item>To$Snap($SortWrappers.$SnapTo$FVF<item> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<item> x))
    :qid |$Snap.$FVF<item>To$SnapTo$FVF<item>|
    )))
(declare-fun $SortWrappers.$FVF<bool_prop>To$Snap ($FVF<bool_prop>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<bool_prop> ($Snap) $FVF<bool_prop>)
(assert (forall ((x $FVF<bool_prop>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<bool_prop>($SortWrappers.$FVF<bool_prop>To$Snap x)))
    :pattern (($SortWrappers.$FVF<bool_prop>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<bool_prop>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<bool_prop>To$Snap($SortWrappers.$SnapTo$FVF<bool_prop> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<bool_prop> x))
    :qid |$Snap.$FVF<bool_prop>To$SnapTo$FVF<bool_prop>|
    )))
; ////////// Symbols
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
(declare-fun loc<Ref> (VCTArray<Ref> Int) $Ref)
; /field_value_functions_declarations.smt2 [item: Ref]
(declare-fun $FVF.domain_item ($FVF<item>) Set<$Ref>)
(declare-fun $FVF.lookup_item ($FVF<item> $Ref) $Ref)
(declare-fun $FVF.after_item ($FVF<item> $FVF<item>) Bool)
(declare-fun $FVF.loc_item ($Ref $Ref) Bool)
(declare-fun $FVF.perm_item ($FPM $Ref) $Perm)
(declare-const $fvfTOP_item $FVF<item>)
; /field_value_functions_declarations.smt2 [bool_prop: Bool]
(declare-fun $FVF.domain_bool_prop ($FVF<bool_prop>) Set<$Ref>)
(declare-fun $FVF.lookup_bool_prop ($FVF<bool_prop> $Ref) Bool)
(declare-fun $FVF.after_bool_prop ($FVF<bool_prop> $FVF<bool_prop>) Bool)
(declare-fun $FVF.loc_bool_prop (Bool $Ref) Bool)
(declare-fun $FVF.perm_bool_prop ($FPM $Ref) $Perm)
(declare-const $fvfTOP_bool_prop $FVF<bool_prop>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun alwaysTrue ($Snap $Ref) Bool)
(declare-fun alwaysTrue%limited ($Snap $Ref) Bool)
(declare-fun alwaysTrue%stateless ($Ref) Bool)
(declare-fun alwaysTrue%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((a VCTArray<Ref>) (i Int) (j Int)) (!
  (=>
    (and (>= i 0) (and (>= j 0) (not (= i j))))
    (not (= (loc<Ref> a i) (loc<Ref> a j))))
  :pattern ((loc<Ref> a i) (loc<Ref> a j))
  :qid |prog.loc_inject|)))
; /field_value_functions_axioms.smt2 [item: Ref]
(assert (forall ((vs $FVF<item>) (ws $FVF<item>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_item vs) ($FVF.domain_item ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_item vs))
            (= ($FVF.lookup_item vs x) ($FVF.lookup_item ws x)))
          :pattern (($FVF.lookup_item vs x) ($FVF.lookup_item ws x))
          :qid |qp.$FVF<item>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<item>To$Snap vs)
              ($SortWrappers.$FVF<item>To$Snap ws)
              )
    :qid |qp.$FVF<item>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_item pm r))
    :pattern (($FVF.perm_item pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_item f r) true)
    :pattern (($FVF.loc_item f r)))))
; /field_value_functions_axioms.smt2 [bool_prop: Bool]
(assert (forall ((vs $FVF<bool_prop>) (ws $FVF<bool_prop>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_bool_prop vs) ($FVF.domain_bool_prop ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_bool_prop vs))
            (= ($FVF.lookup_bool_prop vs x) ($FVF.lookup_bool_prop ws x)))
          :pattern (($FVF.lookup_bool_prop vs x) ($FVF.lookup_bool_prop ws x))
          :qid |qp.$FVF<bool_prop>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<bool_prop>To$Snap vs)
              ($SortWrappers.$FVF<bool_prop>To$Snap ws)
              )
    :qid |qp.$FVF<bool_prop>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_bool_prop pm r))
    :pattern (($FVF.perm_bool_prop pm r)))))
(assert (forall ((r $Ref) (f Bool)) (!
    (= ($FVF.loc_bool_prop f r) true)
    :pattern (($FVF.loc_bool_prop f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (v@0@00 $Ref)) (!
  (= (alwaysTrue%limited s@$ v@0@00) (alwaysTrue s@$ v@0@00))
  :pattern ((alwaysTrue s@$ v@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (v@0@00 $Ref)) (!
  (alwaysTrue%stateless v@0@00)
  :pattern ((alwaysTrue%limited s@$ v@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (v@0@00 $Ref)) (!
  (let ((result@1@00 (alwaysTrue%limited s@$ v@0@00))) (=>
    (alwaysTrue%precondition s@$ v@0@00)
    (= result@1@00 true)))
  :pattern ((alwaysTrue%limited s@$ v@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (v@0@00 $Ref)) (!
  (let ((result@1@00 (alwaysTrue%limited s@$ v@0@00))) true)
  :pattern ((alwaysTrue%limited s@$ v@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- some_method ----------
(declare-const trees@0@01 VCTArray<Ref>)
(declare-const g@1@01 Int)
(declare-const trees@2@01 VCTArray<Ref>)
(declare-const g@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] 0 < g
(assert (< 0 g@3@01))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(declare-const i@5@01 Int)
(push) ; 2
; [eval] 0 <= i && i < g
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@5@01) | live]
; [else-branch: 0 | 0 <= i@5@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@5@01)]
(assert (not (<= 0 i@5@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@5@01]
(assert (<= 0 i@5@01))
; [eval] i < g
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
(assert (and (<= 0 i@5@01) (< i@5@01 g@3@01)))
; [eval] (loc(trees, i): Ref)
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(declare-const sm@7@01 $FVF<item>)
; Definitional axioms for snapshot map values
; [eval] (loc(trees, i): Ref)
(pop) ; 2
(declare-fun inv@8@01 ($Ref) Int)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@6@01))
; Nested auxiliary terms: non-globals
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 g@3@01))
    (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
  :pattern (($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) (loc<Ref> trees@2@01 i@5@01)) (loc<Ref> trees@2@01 i@5@01)))
  :qid |item-aux|)))
(push) ; 2
(assert (not (forall ((i@5@01 Int)) (!
  (=>
    (and (<= 0 i@5@01) (< i@5@01 g@3@01))
    (or (= $k@6@01 $Perm.No) (< $Perm.No $k@6@01)))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (and (and (<= 0 i1@5@01) (< i1@5@01 g@3@01)) (< $Perm.No $k@6@01))
      (and (and (<= 0 i2@5@01) (< i2@5@01 g@3@01)) (< $Perm.No $k@6@01))
      (= (loc<Ref> trees@2@01 i1@5@01) (loc<Ref> trees@2@01 i2@5@01)))
    (= i1@5@01 i2@5@01))
  
  :qid |item-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (and (<= 0 i@5@01) (< i@5@01 g@3@01)) (< $Perm.No $k@6@01))
    (and
      (= (inv@8@01 (loc<Ref> trees@2@01 i@5@01)) i@5@01)
      (img@9@01 (loc<Ref> trees@2@01 i@5@01))))
  :pattern (($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) (loc<Ref> trees@2@01 i@5@01)) (loc<Ref> trees@2@01 i@5@01)))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@01 r)
      (and
        (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01))
        (< $Perm.No $k@6@01)))
    (= (loc<Ref> trees@2@01 (inv@8@01 r)) r))
  :pattern ((inv@8@01 r))
  :qid |item-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@5@01 Int)) (!
  (<= $Perm.No $k@6@01)
  :pattern (($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) (loc<Ref> trees@2@01 i@5@01)) (loc<Ref> trees@2@01 i@5@01)))
  :qid |item-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@5@01 Int)) (!
  (<= $k@6@01 $Perm.Write)
  :pattern (($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) (loc<Ref> trees@2@01 i@5@01)) (loc<Ref> trees@2@01 i@5@01)))
  :qid |item-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (and (<= 0 i@5@01) (< i@5@01 g@3@01)) (< $Perm.No $k@6@01))
    (not (= (loc<Ref> trees@2@01 i@5@01) $Ref.null)))
  :pattern (($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) (loc<Ref> trees@2@01 i@5@01)) (loc<Ref> trees@2@01 i@5@01)))
  :qid |item-permImpliesNonNull|)))
(declare-const sm@10@01 $FVF<item>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
      (< $Perm.No $k@6@01)
      false)
    (=
      ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01))
    ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) r) r))
  :pattern ((inv@8@01 r))
  :qid |quant-u-6|)))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (loc(trees, i): Ref).item, (loc(trees, j): Ref).item } 0 <= i && (i < j && j < g) ==> (loc(trees, i): Ref).item != (loc(trees, j): Ref).item)
(declare-const i@11@01 Int)
(declare-const j@12@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < j && j < g) ==> (loc(trees, i): Ref).item != (loc(trees, j): Ref).item
; [eval] 0 <= i && (i < j && j < g)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 1 | !(0 <= i@11@01) | live]
; [else-branch: 1 | 0 <= i@11@01 | live]
(push) ; 4
; [then-branch: 1 | !(0 <= i@11@01)]
(assert (not (<= 0 i@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | 0 <= i@11@01]
(assert (<= 0 i@11@01))
; [eval] i < j
(push) ; 5
; [then-branch: 2 | !(i@11@01 < j@12@01) | live]
; [else-branch: 2 | i@11@01 < j@12@01 | live]
(push) ; 6
; [then-branch: 2 | !(i@11@01 < j@12@01)]
(assert (not (< i@11@01 j@12@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | i@11@01 < j@12@01]
(assert (< i@11@01 j@12@01))
; [eval] j < g
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< i@11@01 j@12@01) (not (< i@11@01 j@12@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@11@01)
  (and (<= 0 i@11@01) (or (< i@11@01 j@12@01) (not (< i@11@01 j@12@01))))))
(assert (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
(push) ; 3
; [then-branch: 3 | 0 <= i@11@01 && i@11@01 < j@12@01 && j@12@01 < g@3@01 | live]
; [else-branch: 3 | !(0 <= i@11@01 && i@11@01 < j@12@01 && j@12@01 < g@3@01) | live]
(push) ; 4
; [then-branch: 3 | 0 <= i@11@01 && i@11@01 < j@12@01 && j@12@01 < g@3@01]
(assert (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01))))
; [eval] (loc(trees, i): Ref).item != (loc(trees, j): Ref).item
; [eval] (loc(trees, i): Ref)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
        (< $Perm.No $k@6@01)
        false)
      (=
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
    :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
    :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
    :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@11@01)) (loc<Ref> trees@2@01 i@11@01)))
(push) ; 5
(assert (not (ite
  (and
    (img@9@01 (loc<Ref> trees@2@01 i@11@01))
    (and
      (<= 0 (inv@8@01 (loc<Ref> trees@2@01 i@11@01)))
      (< (inv@8@01 (loc<Ref> trees@2@01 i@11@01)) g@3@01)))
  (< $Perm.No $k@6@01)
  false)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] (loc(trees, j): Ref)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
        (< $Perm.No $k@6@01)
        false)
      (=
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
    :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
    :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
    :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@12@01)) (loc<Ref> trees@2@01 j@12@01)))
(push) ; 5
(assert (not (ite
  (and
    (img@9@01 (loc<Ref> trees@2@01 j@12@01))
    (and
      (<= 0 (inv@8@01 (loc<Ref> trees@2@01 j@12@01)))
      (< (inv@8@01 (loc<Ref> trees@2@01 j@12@01)) g@3@01)))
  (< $Perm.No $k@6@01)
  false)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(0 <= i@11@01 && i@11@01 < j@12@01 && j@12@01 < g@3@01)]
(assert (not (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
      (< $Perm.No $k@6@01)
      false)
    (=
      ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01)))
  (and
    (<= 0 i@11@01)
    (< i@11@01 j@12@01)
    (< j@12@01 g@3@01)
    ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@11@01)) (loc<Ref> trees@2@01 i@11@01))
    ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@12@01)) (loc<Ref> trees@2@01 j@12@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01))))
  (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01)))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
      (< $Perm.No $k@6@01)
      false)
    (=
      ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (<= 0 i@11@01)
      (and (<= 0 i@11@01) (or (< i@11@01 j@12@01) (not (< i@11@01 j@12@01)))))
    (or (<= 0 i@11@01) (not (<= 0 i@11@01)))
    (=>
      (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01)))
      (and
        (<= 0 i@11@01)
        (< i@11@01 j@12@01)
        (< j@12@01 g@3@01)
        ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@11@01)) (loc<Ref> trees@2@01 i@11@01))
        ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@12@01)) (loc<Ref> trees@2@01 j@12@01))))
    (or
      (not (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01))))
      (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01)))))
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@11@01)) (loc<Ref> trees@2@01 i@11@01)) ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@12@01)) (loc<Ref> trees@2@01 j@12@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508b.vpr@20@13@20@148-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (and (< i@11@01 j@12@01) (< j@12@01 g@3@01)))
    (not
      (=
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@11@01))
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@12@01)))))
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@11@01)) (loc<Ref> trees@2@01 i@11@01)) ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@12@01)) (loc<Ref> trees@2@01 j@12@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0508b.vpr@20@13@20@148|)))
(declare-const i@13@01 Int)
(push) ; 2
; [eval] 0 <= i && i < g
; [eval] 0 <= i
(push) ; 3
; [then-branch: 4 | !(0 <= i@13@01) | live]
; [else-branch: 4 | 0 <= i@13@01 | live]
(push) ; 4
; [then-branch: 4 | !(0 <= i@13@01)]
(assert (not (<= 0 i@13@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | 0 <= i@13@01]
(assert (<= 0 i@13@01))
; [eval] i < g
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@13@01) (not (<= 0 i@13@01))))
(assert (and (<= 0 i@13@01) (< i@13@01 g@3@01)))
; [eval] (loc(trees, i): Ref)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
        (< $Perm.No $k@6@01)
        false)
      (=
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
    :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
    :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
    :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)) (loc<Ref> trees@2@01 i@13@01)))
(push) ; 3
(assert (not (ite
  (and
    (img@9@01 (loc<Ref> trees@2@01 i@13@01))
    (and
      (<= 0 (inv@8@01 (loc<Ref> trees@2@01 i@13@01)))
      (< (inv@8@01 (loc<Ref> trees@2@01 i@13@01)) g@3@01)))
  (< $Perm.No $k@6@01)
  false)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(declare-const sm@15@01 $FVF<bool_prop>)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@16@01 ($Ref) Int)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
      (< $Perm.No $k@6@01)
      false)
    (=
      ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert ($Perm.isReadVar $k@14@01))
; Nested auxiliary terms: non-globals
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (<= 0 i@13@01) (< i@13@01 g@3@01))
    (and
      (or (<= 0 i@13@01) (not (<= 0 i@13@01)))
      ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)) (loc<Ref> trees@2@01 i@13@01))))
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)) (loc<Ref> trees@2@01 i@13@01)) ($FVF.loc_bool_prop ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))))
  :qid |bool_prop-aux|)))
(push) ; 2
(assert (not (forall ((i@13@01 Int)) (!
  (=>
    (and (<= 0 i@13@01) (< i@13@01 g@3@01))
    (or (= $k@14@01 $Perm.No) (< $Perm.No $k@14@01)))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@13@01 Int) (i2@13@01 Int)) (!
  (=>
    (and
      (and (and (<= 0 i1@13@01) (< i1@13@01 g@3@01)) (< $Perm.No $k@14@01))
      (and (and (<= 0 i2@13@01) (< i2@13@01 g@3@01)) (< $Perm.No $k@14@01))
      (=
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i1@13@01))
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i2@13@01))))
    (= i1@13@01 i2@13@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (and (<= 0 i@13@01) (< i@13@01 g@3@01)) (< $Perm.No $k@14@01))
    (and
      (=
        (inv@16@01 ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)))
        i@13@01)
      (img@17@01 ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)))))
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)) (loc<Ref> trees@2@01 i@13@01)) ($FVF.loc_bool_prop ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@01 r)
      (and
        (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) g@3@01))
        (< $Perm.No $k@14@01)))
    (=
      ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 (inv@16@01 r)))
      r))
  :pattern ((inv@16@01 r))
  :qid |bool_prop-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@13@01 Int)) (!
  (<= $Perm.No $k@14@01)
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)) (loc<Ref> trees@2@01 i@13@01)) ($FVF.loc_bool_prop ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))))
  :qid |bool_prop-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@13@01 Int)) (!
  (<= $k@14@01 $Perm.Write)
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)) (loc<Ref> trees@2@01 i@13@01)) ($FVF.loc_bool_prop ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))))
  :qid |bool_prop-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (and (<= 0 i@13@01) (< i@13@01 g@3@01)) (< $Perm.No $k@14@01))
    (not
      (=
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))
        $Ref.null)))
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01)) (loc<Ref> trees@2@01 i@13@01)) ($FVF.loc_bool_prop ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 i@13@01))))
  :qid |bool_prop-permImpliesNonNull|)))
(declare-const sm@18@01 $FVF<bool_prop>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) g@3@01)))
      (< $Perm.No $k@14@01)
      false)
    (=
      ($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) r)
      ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) r)))
  :pattern (($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) r))
  :pattern (($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_bool_prop ($FVF.lookup_bool_prop ($SortWrappers.$SnapTo$FVF<bool_prop> ($Snap.second ($Snap.second ($Snap.second $t@4@01)))) r) r)
  :pattern (($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) g@3@01))
    ($FVF.loc_bool_prop ($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) r) r))
  :pattern ((inv@16@01 r))
  :qid |quant-u-9|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall j: Int ::
;     { (loc(trees, j): Ref).item.bool_prop }
;     0 <= j && j < g ==> acc((loc(trees, j): Ref).item.bool_prop, wildcard))
(declare-const j@19@01 Int)
(push) ; 3
; [eval] 0 <= j && j < g
; [eval] 0 <= j
(push) ; 4
; [then-branch: 5 | !(0 <= j@19@01) | live]
; [else-branch: 5 | 0 <= j@19@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= j@19@01)]
(assert (not (<= 0 j@19@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= j@19@01]
(assert (<= 0 j@19@01))
; [eval] j < g
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@19@01) (not (<= 0 j@19@01))))
(assert (and (<= 0 j@19@01) (< j@19@01 g@3@01)))
(declare-const $k@20@01 $Perm)
(assert ($Perm.isReadVar $k@20@01))
; [eval] (loc(trees, j): Ref)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
        (< $Perm.No $k@6@01)
        false)
      (=
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
        ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
    :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
    :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
    :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01)) (loc<Ref> trees@2@01 j@19@01)))
(push) ; 4
(assert (not (ite
  (and
    (img@9@01 (loc<Ref> trees@2@01 j@19@01))
    (and
      (<= 0 (inv@8@01 (loc<Ref> trees@2@01 j@19@01)))
      (< (inv@8@01 (loc<Ref> trees@2@01 j@19@01)) g@3@01)))
  (< $Perm.No $k@6@01)
  false)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@20@01))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@9@01 r) (and (<= 0 (inv@8@01 r)) (< (inv@8@01 r) g@3@01)))
      (< $Perm.No $k@6@01)
      false)
    (=
      ($FVF.lookup_item (as sm@10@01  $FVF<item>) r)
      ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r)))
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :pattern (($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_item ($FVF.lookup_item ($SortWrappers.$SnapTo$FVF<item> ($Snap.first ($Snap.second $t@4@01))) r) r)
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals
(assert (forall ((j@19@01 Int)) (!
  (=>
    (and (<= 0 j@19@01) (< j@19@01 g@3@01))
    (and
      (or (<= 0 j@19@01) (not (<= 0 j@19@01)))
      ($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01)) (loc<Ref> trees@2@01 j@19@01))))
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01)) (loc<Ref> trees@2@01 j@19@01)) ($FVF.loc_bool_prop ($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01))))
  :qid |bool_prop-aux|)))
(push) ; 3
(assert (not (forall ((j@19@01 Int)) (!
  (=>
    (and (<= 0 j@19@01) (< j@19@01 g@3@01))
    (or (= $k@20@01 $Perm.No) (< $Perm.No $k@20@01)))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@19@01 Int) (j2@19@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (<= 0 j1@19@01) (< j1@19@01 g@3@01))
          ($FVF.loc_bool_prop ($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j1@19@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j1@19@01))))
        (< $Perm.No $k@20@01))
      (and
        (and
          (and (<= 0 j2@19@01) (< j2@19@01 g@3@01))
          ($FVF.loc_bool_prop ($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j2@19@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j2@19@01))))
        (< $Perm.No $k@20@01))
      (=
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j1@19@01))
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j2@19@01))))
    (= j1@19@01 j2@19@01))
  
  :qid |bool_prop-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@19@01 Int)) (!
  (=>
    (and (and (<= 0 j@19@01) (< j@19@01 g@3@01)) (< $Perm.No $k@20@01))
    (and
      (=
        (inv@21@01 ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01)))
        j@19@01)
      (img@22@01 ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01)))))
  :pattern (($FVF.loc_item ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01)) (loc<Ref> trees@2@01 j@19@01)) ($FVF.loc_bool_prop ($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01))) ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 j@19@01))))
  :qid |bool_prop-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@01 r)
      (and
        (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) g@3@01))
        (< $Perm.No $k@20@01)))
    (=
      ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 (inv@21@01 r)))
      r))
  :pattern ((inv@21@01 r))
  :qid |bool_prop-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) g@3@01))
    ($FVF.loc_bool_prop ($FVF.lookup_bool_prop (as sm@18@01  $FVF<bool_prop>) r) r))
  :pattern ((inv@21@01 r))
  :qid |quant-u-11|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) g@3@01))
      (img@22@01 r)
      (=
        r
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 (inv@21@01 r)))))
    ($Perm.min
      (ite
        (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) g@3@01)))
        $k@14@01
        $Perm.No)
      $k@20@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@20@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) g@3@01)))
          $k@14@01
          $Perm.No)
        $Perm.No))
    (ite
      (and (img@17@01 r) (and (<= 0 (inv@16@01 r)) (< (inv@16@01 r) g@3@01)))
      (<
        (ite
          (and
            (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) g@3@01))
            (img@22@01 r)
            (=
              r
              ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 (inv@21@01 r)))))
          $k@20@01
          $Perm.No)
        $k@14@01)
      (<
        (ite
          (and
            (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) g@3@01))
            (img@22@01 r)
            (=
              r
              ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 (inv@21@01 r)))))
          $k@20@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@17@01 r))
  :pattern ((inv@16@01 r))
  :pattern ((img@22@01 r))
  :pattern (($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 (inv@21@01 r))))
  :qid |qp.srp6|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and (<= 0 (inv@21@01 r)) (< (inv@21@01 r) g@3@01))
      (img@22@01 r)
      (=
        r
        ($FVF.lookup_item (as sm@10@01  $FVF<item>) (loc<Ref> trees@2@01 (inv@21@01 r)))))
    (= (- $k@20@01 (pTaken@23@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(pop) ; 2
(pop) ; 1
