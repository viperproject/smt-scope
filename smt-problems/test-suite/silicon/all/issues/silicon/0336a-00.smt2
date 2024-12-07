(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:27
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0336a.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<parent> 0)
(declare-sort $FVF<rank> 0)
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
(declare-fun $SortWrappers.Set<Int>To$Snap (Set<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Int> ($Snap) Set<Int>)
(assert (forall ((x Set<Int>)) (!
    (= x ($SortWrappers.$SnapToSet<Int>($SortWrappers.Set<Int>To$Snap x)))
    :pattern (($SortWrappers.Set<Int>To$Snap x))
    :qid |$Snap.$SnapToSet<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Int>To$Snap($SortWrappers.$SnapToSet<Int> x)))
    :pattern (($SortWrappers.$SnapToSet<Int> x))
    :qid |$Snap.Set<Int>To$SnapToSet<Int>|
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
(declare-fun $SortWrappers.$FVF<parent>To$Snap ($FVF<parent>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<parent> ($Snap) $FVF<parent>)
(assert (forall ((x $FVF<parent>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<parent>($SortWrappers.$FVF<parent>To$Snap x)))
    :pattern (($SortWrappers.$FVF<parent>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<parent>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<parent>To$Snap($SortWrappers.$SnapTo$FVF<parent> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<parent> x))
    :qid |$Snap.$FVF<parent>To$SnapTo$FVF<parent>|
    )))
(declare-fun $SortWrappers.$FVF<rank>To$Snap ($FVF<rank>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<rank> ($Snap) $FVF<rank>)
(assert (forall ((x $FVF<rank>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<rank>($SortWrappers.$FVF<rank>To$Snap x)))
    :pattern (($SortWrappers.$FVF<rank>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<rank>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<rank>To$Snap($SortWrappers.$SnapTo$FVF<rank> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<rank> x))
    :qid |$Snap.$FVF<rank>To$SnapTo$FVF<rank>|
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
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_skolem_diff (Set<Int> Set<Int>) Int)
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
; /field_value_functions_declarations.smt2 [parent: Ref]
(declare-fun $FVF.domain_parent ($FVF<parent>) Set<$Ref>)
(declare-fun $FVF.lookup_parent ($FVF<parent> $Ref) $Ref)
(declare-fun $FVF.after_parent ($FVF<parent> $FVF<parent>) Bool)
(declare-fun $FVF.loc_parent ($Ref $Ref) Bool)
(declare-fun $FVF.perm_parent ($FPM $Ref) $Perm)
(declare-const $fvfTOP_parent $FVF<parent>)
; /field_value_functions_declarations.smt2 [rank: Int]
(declare-fun $FVF.domain_rank ($FVF<rank>) Set<$Ref>)
(declare-fun $FVF.lookup_rank ($FVF<rank> $Ref) Int)
(declare-fun $FVF.after_rank ($FVF<rank> $FVF<rank>) Bool)
(declare-fun $FVF.loc_rank (Int $Ref) Bool)
(declare-fun $FVF.perm_rank ($FPM $Ref) $Perm)
(declare-const $fvfTOP_rank $FVF<rank>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun uf_bank%trigger ($Snap Set<$Ref>) Bool)
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
(assert (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Int)) (!
  (not (Set_in o (as Set_empty  Set<Int>)))
  :pattern ((Set_in o (as Set_empty  Set<Int>)))
  )))
(assert (forall ((s Set<Int>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Int))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Int)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Int) (o Int)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Int)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Int>) (x Int) (o Int)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Int>) (x Int) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
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
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (Set_subset a b)
    (forall ((o Int)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
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
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
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
; /field_value_functions_axioms.smt2 [parent: Ref]
(assert (forall ((vs $FVF<parent>) (ws $FVF<parent>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_parent vs) ($FVF.domain_parent ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_parent vs))
            (= ($FVF.lookup_parent vs x) ($FVF.lookup_parent ws x)))
          :pattern (($FVF.lookup_parent vs x) ($FVF.lookup_parent ws x))
          :qid |qp.$FVF<parent>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<parent>To$Snap vs)
              ($SortWrappers.$FVF<parent>To$Snap ws)
              )
    :qid |qp.$FVF<parent>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_parent pm r))
    :pattern (($FVF.perm_parent pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_parent f r) true)
    :pattern (($FVF.loc_parent f r)))))
; /field_value_functions_axioms.smt2 [rank: Int]
(assert (forall ((vs $FVF<rank>) (ws $FVF<rank>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_rank vs) ($FVF.domain_rank ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_rank vs))
            (= ($FVF.lookup_rank vs x) ($FVF.lookup_rank ws x)))
          :pattern (($FVF.lookup_rank vs x) ($FVF.lookup_rank ws x))
          :qid |qp.$FVF<rank>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<rank>To$Snap vs)
              ($SortWrappers.$FVF<rank>To$Snap ws)
              )
    :qid |qp.$FVF<rank>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_rank pm r))
    :pattern (($FVF.perm_rank pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_rank f r) true)
    :pattern (($FVF.loc_rank f r)))))
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
; ---------- bad ----------
(declare-const b@0@01 Set<$Ref>)
(declare-const l@1@01 $Ref)
(declare-const b@2@01 Set<$Ref>)
(declare-const l@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] (l in b)
(assert (Set_in l@3@01 b@2@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(uf_bank(b), write)
(assert (=
  ($Snap.first $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.second ($Snap.first $t@4@01)))))
(declare-const l@6@01 $Ref)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@6@01 b@2@01))
(pop) ; 3
(declare-fun inv@7@01 ($Ref) $Ref)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@6@01 $Ref) (l2@6@01 $Ref)) (!
  (=>
    (and (Set_in l1@6@01 b@2@01) (Set_in l2@6@01 b@2@01) (= l1@6@01 l2@6@01))
    (= l1@6@01 l2@6@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@6@01 $Ref)) (!
  (=>
    (Set_in l@6@01 b@2@01)
    (and (= (inv@7@01 l@6@01) l@6@01) (img@8@01 l@6@01)))
  :pattern ((Set_in l@6@01 b@2@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01)) (= (inv@7@01 r) r))
  :pattern ((inv@7@01 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@6@01 $Ref)) (!
  (=> (Set_in l@6@01 b@2@01) (not (= l@6@01 $Ref.null)))
  :pattern ((Set_in l@6@01 b@2@01))
  :qid |parent-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@4@01))))))
(declare-const l@9@01 $Ref)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@9@01 b@2@01))
(pop) ; 3
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@9@01 $Ref) (l2@9@01 $Ref)) (!
  (=>
    (and (Set_in l1@9@01 b@2@01) (Set_in l2@9@01 b@2@01) (= l1@9@01 l2@9@01))
    (= l1@9@01 l2@9@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@9@01 $Ref)) (!
  (=>
    (Set_in l@9@01 b@2@01)
    (and (= (inv@10@01 l@9@01) l@9@01) (img@11@01 l@9@01)))
  :pattern ((Set_in l@9@01 b@2@01))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@11@01 r) (Set_in (inv@10@01 r) b@2@01)) (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |rank-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@9@01 $Ref)) (!
  (=> (Set_in l@9@01 b@2@01) (not (= l@9@01 $Ref.null)))
  :pattern ((Set_in l@9@01 b@2@01))
  :qid |rank-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01)))) $Snap.unit))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@12@01 $Ref)
(push) ; 3
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 4
; [then-branch: 0 | l@12@01 in b@2@01 | live]
; [else-branch: 0 | !(l@12@01 in b@2@01) | live]
(push) ; 5
; [then-branch: 0 | l@12@01 in b@2@01]
(assert (Set_in l@12@01 b@2@01))
; [eval] 0 <= l.rank
(push) ; 6
(assert (not (and (img@11@01 l@12@01) (Set_in (inv@10@01 l@12@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(l@12@01 in b@2@01)]
(assert (not (Set_in l@12@01 b@2@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in l@12@01 b@2@01)) (Set_in l@12@01 b@2@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@12@01 $Ref)) (!
  (or (not (Set_in l@12@01 b@2@01)) (Set_in l@12@01 b@2@01))
  :pattern ((Set_in l@12@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336a.vpr@8@4@9@48-aux|)))
(assert (forall ((l@12@01 $Ref)) (!
  (=>
    (Set_in l@12@01 b@2@01)
    (<=
      0
      ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@12@01)))
  :pattern ((Set_in l@12@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336a.vpr@8@4@9@48|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (uf_bank%trigger ($Snap.first $t@4@01) b@2@01))
; [exec]
; fold acc(uf_bank(b), write)
(declare-const l@13@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@13@01 b@2@01))
(pop) ; 3
(declare-fun inv@14@01 ($Ref) $Ref)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@13@01 $Ref) (l2@13@01 $Ref)) (!
  (=>
    (and (Set_in l1@13@01 b@2@01) (Set_in l2@13@01 b@2@01) (= l1@13@01 l2@13@01))
    (= l1@13@01 l2@13@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@13@01 $Ref)) (!
  (=>
    (Set_in l@13@01 b@2@01)
    (and (= (inv@14@01 l@13@01) l@13@01) (img@15@01 l@13@01)))
  :pattern ((Set_in l@13@01 b@2@01))
  :qid |parent-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@15@01 r) (Set_in (inv@14@01 r) b@2@01)) (= (inv@14@01 r) r))
  :pattern ((inv@14@01 r))
  :qid |parent-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@16@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@14@01 r) b@2@01) (img@15@01 r) (= r (inv@14@01 r)))
    ($Perm.min
      (ite (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01)) $Perm.Write $Perm.No)
      (pTaken@16@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
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
    (and (Set_in (inv@14@01 r) b@2@01) (img@15@01 r) (= r (inv@14@01 r)))
    (= (- $Perm.Write (pTaken@16@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@17@01 $FVF<parent>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_parent (as sm@17@01  $FVF<parent>)))
      (and (Set_in (inv@14@01 r) b@2@01) (img@15@01 r)))
    (=>
      (and (Set_in (inv@14@01 r) b@2@01) (img@15@01 r))
      (Set_in r ($FVF.domain_parent (as sm@17@01  $FVF<parent>)))))
  :pattern ((Set_in r ($FVF.domain_parent (as sm@17@01  $FVF<parent>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@14@01 r) b@2@01) (img@15@01 r))
      (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01)))
    (=
      ($FVF.lookup_parent (as sm@17@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@17@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef0|)))
(declare-const l@18@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@18@01 b@2@01))
(pop) ; 3
(declare-fun inv@19@01 ($Ref) $Ref)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@18@01 $Ref) (l2@18@01 $Ref)) (!
  (=>
    (and (Set_in l1@18@01 b@2@01) (Set_in l2@18@01 b@2@01) (= l1@18@01 l2@18@01))
    (= l1@18@01 l2@18@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@18@01 $Ref)) (!
  (=>
    (Set_in l@18@01 b@2@01)
    (and (= (inv@19@01 l@18@01) l@18@01) (img@20@01 l@18@01)))
  :pattern ((Set_in l@18@01 b@2@01))
  :qid |rank-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@20@01 r) (Set_in (inv@19@01 r) b@2@01)) (= (inv@19@01 r) r))
  :pattern ((inv@19@01 r))
  :qid |rank-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@19@01 r) b@2@01) (img@20@01 r) (= r (inv@19@01 r)))
    ($Perm.min
      (ite
        (and (img@11@01 r) (Set_in (inv@10@01 r) b@2@01))
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
        (and (img@11@01 r) (Set_in (inv@10@01 r) b@2@01))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 r))
    $Perm.No)
  
  :qid |quant-u-14|))))
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
    (and (Set_in (inv@19@01 r) b@2@01) (img@20@01 r) (= r (inv@19@01 r)))
    (= (- $Perm.Write (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $FVF<rank>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_rank (as sm@22@01  $FVF<rank>)))
      (and (Set_in (inv@19@01 r) b@2@01) (img@20@01 r)))
    (=>
      (and (Set_in (inv@19@01 r) b@2@01) (img@20@01 r))
      (Set_in r ($FVF.domain_rank (as sm@22@01  $FVF<rank>)))))
  :pattern ((Set_in r ($FVF.domain_rank (as sm@22@01  $FVF<rank>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@19@01 r) b@2@01) (img@20@01 r))
      (and (img@11@01 r) (Set_in (inv@10@01 r) b@2@01)))
    (=
      ($FVF.lookup_rank (as sm@22@01  $FVF<rank>) r)
      ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) r)))
  :pattern (($FVF.lookup_rank (as sm@22@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) r))
  :qid |qp.fvfValDef2|)))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@23@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 4
; [then-branch: 1 | l@23@01 in b@2@01 | live]
; [else-branch: 1 | !(l@23@01 in b@2@01) | live]
(push) ; 5
; [then-branch: 1 | l@23@01 in b@2@01]
(assert (Set_in l@23@01 b@2@01))
; [eval] 0 <= l.rank
(push) ; 6
(assert (not (and (img@11@01 l@23@01) (Set_in (inv@10@01 l@23@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(l@23@01 in b@2@01)]
(assert (not (Set_in l@23@01 b@2@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in l@23@01 b@2@01)) (Set_in l@23@01 b@2@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@23@01 $Ref)) (!
  (or (not (Set_in l@23@01 b@2@01)) (Set_in l@23@01 b@2@01))
  :pattern ((Set_in l@23@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336a.vpr@8@4@9@48-aux|)))
(push) ; 3
(assert (not (forall ((l@23@01 $Ref)) (!
  (=>
    (Set_in l@23@01 b@2@01)
    (<=
      0
      ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@23@01)))
  :pattern ((Set_in l@23@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336a.vpr@8@4@9@48|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((l@23@01 $Ref)) (!
  (=>
    (Set_in l@23@01 b@2@01)
    (<=
      0
      ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@23@01)))
  :pattern ((Set_in l@23@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336a.vpr@8@4@9@48|)))
(assert (uf_bank%trigger ($Snap.combine
  ($SortWrappers.$FVF<parent>To$Snap (as sm@17@01  $FVF<parent>))
  ($Snap.combine
    ($SortWrappers.$FVF<rank>To$Snap (as sm@22@01  $FVF<rank>))
    ($Snap.combine $Snap.unit $Snap.unit))) b@2@01))
; [exec]
; unfold acc(uf_bank(b), write)
(declare-const l@24@01 $Ref)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@24@01 b@2@01))
(pop) ; 3
(declare-fun inv@25@01 ($Ref) $Ref)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@24@01 $Ref) (l2@24@01 $Ref)) (!
  (=>
    (and (Set_in l1@24@01 b@2@01) (Set_in l2@24@01 b@2@01) (= l1@24@01 l2@24@01))
    (= l1@24@01 l2@24@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@24@01 $Ref)) (!
  (=>
    (Set_in l@24@01 b@2@01)
    (and (= (inv@25@01 l@24@01) l@24@01) (img@26@01 l@24@01)))
  :pattern ((Set_in l@24@01 b@2@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@26@01 r) (Set_in (inv@25@01 r) b@2@01)) (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@24@01 $Ref)) (!
  (=> (Set_in l@24@01 b@2@01) (not (= l@24@01 $Ref.null)))
  :pattern ((Set_in l@24@01 b@2@01))
  :qid |parent-permImpliesNonNull|)))
(declare-const l@27@01 $Ref)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@27@01 b@2@01))
(pop) ; 3
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@27@01 $Ref) (l2@27@01 $Ref)) (!
  (=>
    (and (Set_in l1@27@01 b@2@01) (Set_in l2@27@01 b@2@01) (= l1@27@01 l2@27@01))
    (= l1@27@01 l2@27@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@27@01 $Ref)) (!
  (=>
    (Set_in l@27@01 b@2@01)
    (and (= (inv@28@01 l@27@01) l@27@01) (img@29@01 l@27@01)))
  :pattern ((Set_in l@27@01 b@2@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@29@01 r) (Set_in (inv@28@01 r) b@2@01)) (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |rank-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@27@01 $Ref)) (!
  (=> (Set_in l@27@01 b@2@01) (not (= l@27@01 $Ref.null)))
  :pattern ((Set_in l@27@01 b@2@01))
  :qid |rank-permImpliesNonNull|)))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@30@01 $Ref)
(push) ; 3
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 4
; [then-branch: 2 | l@30@01 in b@2@01 | live]
; [else-branch: 2 | !(l@30@01 in b@2@01) | live]
(push) ; 5
; [then-branch: 2 | l@30@01 in b@2@01]
(assert (Set_in l@30@01 b@2@01))
; [eval] 0 <= l.rank
(push) ; 6
(assert (not (and (img@29@01 l@30@01) (Set_in (inv@28@01 l@30@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(l@30@01 in b@2@01)]
(assert (not (Set_in l@30@01 b@2@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in l@30@01 b@2@01)) (Set_in l@30@01 b@2@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@30@01 $Ref)) (!
  (or (not (Set_in l@30@01 b@2@01)) (Set_in l@30@01 b@2@01))
  :pattern ((Set_in l@30@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336a.vpr@8@4@9@48-aux|)))
(assert (forall ((l@30@01 $Ref)) (!
  (=>
    (Set_in l@30@01 b@2@01)
    (<= 0 ($FVF.lookup_rank (as sm@22@01  $FVF<rank>) l@30@01)))
  :pattern ((Set_in l@30@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336a.vpr@8@4@9@48|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert true
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
(declare-const sm@31@01 $FVF<parent>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (Set_in (inv@25@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@17@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@17@01  $FVF<parent>) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@32@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@32@01  $FPM) r)
    (ite (and (img@26@01 r) (Set_in (inv@25@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@32@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@32@01  $FPM) r) $Perm.Write)
  :pattern ((inv@25@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@33@01 $FVF<rank>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (Set_in (inv@28@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@33@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@22@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@33@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@22@01  $FVF<rank>) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@34@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@34@01  $FPM) r)
    (ite (and (img@29@01 r) (Set_in (inv@28@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@34@01  $FPM) r) $Perm.Write)
  :pattern ((inv@28@01 r))
  :qid |qp-fld-prm-bnd|)))
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
(declare-const sm@35@01 $FVF<parent>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@26@01 r) (Set_in (inv@25@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@35@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@17@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@35@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@17@01  $FVF<parent>) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@36@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@36@01  $FPM) r)
    (ite (and (img@26@01 r) (Set_in (inv@25@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@36@01  $FPM) r) $Perm.Write)
  :pattern ((inv@25@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@37@01 $FVF<rank>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@29@01 r) (Set_in (inv@28@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@37@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@22@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@37@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@22@01  $FVF<rank>) r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@38@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@38@01  $FPM) r)
    (ite (and (img@29@01 r) (Set_in (inv@28@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@38@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@38@01  $FPM) r) $Perm.Write)
  :pattern ((inv@28@01 r))
  :qid |qp-fld-prm-bnd|)))
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
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
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
