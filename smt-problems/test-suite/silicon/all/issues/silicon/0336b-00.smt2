(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:30
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr
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
  :qid |quant-u-6|)))
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
(declare-const sm@9@01 $FVF<parent>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@7@01 r) b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r) r))
  :pattern ((inv@7@01 r))
  :qid |quant-u-7|)))
(assert (=
  ($Snap.second ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@4@01))))))
(declare-const l@10@01 $Ref)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@10@01 b@2@01))
(pop) ; 3
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@10@01 $Ref) (l2@10@01 $Ref)) (!
  (=>
    (and (Set_in l1@10@01 b@2@01) (Set_in l2@10@01 b@2@01) (= l1@10@01 l2@10@01))
    (= l1@10@01 l2@10@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@10@01 $Ref)) (!
  (=>
    (Set_in l@10@01 b@2@01)
    (and (= (inv@11@01 l@10@01) l@10@01) (img@12@01 l@10@01)))
  :pattern ((Set_in l@10@01 b@2@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@12@01 r) (Set_in (inv@11@01 r) b@2@01)) (= (inv@11@01 r) r))
  :pattern ((inv@11@01 r))
  :qid |rank-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@10@01 $Ref)) (!
  (=> (Set_in l@10@01 b@2@01) (not (= l@10@01 $Ref.null)))
  :pattern ((Set_in l@10@01 b@2@01))
  :qid |rank-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01)))) $Snap.unit))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@13@01 $Ref)
(push) ; 3
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 4
; [then-branch: 0 | l@13@01 in b@2@01 | live]
; [else-branch: 0 | !(l@13@01 in b@2@01) | live]
(push) ; 5
; [then-branch: 0 | l@13@01 in b@2@01]
(assert (Set_in l@13@01 b@2@01))
; [eval] 0 <= l.rank
(push) ; 6
(assert (not (and (img@12@01 l@13@01) (Set_in (inv@11@01 l@13@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(l@13@01 in b@2@01)]
(assert (not (Set_in l@13@01 b@2@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in l@13@01 b@2@01)) (Set_in l@13@01 b@2@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@13@01 $Ref)) (!
  (or (not (Set_in l@13@01 b@2@01)) (Set_in l@13@01 b@2@01))
  :pattern ((Set_in l@13@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|)))
(assert (forall ((l@13@01 $Ref)) (!
  (=>
    (Set_in l@13@01 b@2@01)
    (<=
      0
      ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@13@01)))
  :pattern ((Set_in l@13@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))) $Snap.unit))
; [eval] (forall l: Ref :: { l.parent } (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank)
(declare-const l@14@01 $Ref)
(push) ; 3
; [eval] (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank
; [eval] (l in b) && l.parent != null
; [eval] (l in b)
(push) ; 4
; [then-branch: 1 | !(l@14@01 in b@2@01) | live]
; [else-branch: 1 | l@14@01 in b@2@01 | live]
(push) ; 5
; [then-branch: 1 | !(l@14@01 in b@2@01)]
(assert (not (Set_in l@14@01 b@2@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | l@14@01 in b@2@01]
(assert (Set_in l@14@01 b@2@01))
; [eval] l.parent != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r)
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
    :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
    :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) l@14@01))
(push) ; 6
(assert (not (and (img@8@01 l@14@01) (Set_in (inv@7@01 l@14@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (Set_in l@14@01 b@2@01)
  (and
    (Set_in l@14@01 b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) l@14@01))))
(assert (or (Set_in l@14@01 b@2@01) (not (Set_in l@14@01 b@2@01))))
(push) ; 4
; [then-branch: 2 | l@14@01 in b@2@01 && Lookup(parent, sm@9@01, l@14@01) != Null | live]
; [else-branch: 2 | !(l@14@01 in b@2@01 && Lookup(parent, sm@9@01, l@14@01) != Null) | live]
(push) ; 5
; [then-branch: 2 | l@14@01 in b@2@01 && Lookup(parent, sm@9@01, l@14@01) != Null]
(assert (and
  (Set_in l@14@01 b@2@01)
  (not (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null))))
; [eval] (l.parent in b) && l.parent.rank > l.rank
; [eval] (l.parent in b)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r)
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
    :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
    :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) l@14@01))
(push) ; 6
(assert (not (and (img@8@01 l@14@01) (Set_in (inv@7@01 l@14@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 3 | !(Lookup(parent, sm@9@01, l@14@01) in b@2@01) | live]
; [else-branch: 3 | Lookup(parent, sm@9@01, l@14@01) in b@2@01 | live]
(push) ; 7
; [then-branch: 3 | !(Lookup(parent, sm@9@01, l@14@01) in b@2@01)]
(assert (not (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | Lookup(parent, sm@9@01, l@14@01) in b@2@01]
(assert (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01))
; [eval] l.parent.rank > l.rank
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r)
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
    :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
    :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef1|))))
(push) ; 8
(assert (not (and (img@8@01 l@14@01) (Set_in (inv@7@01 l@14@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (and
  (img@12@01 ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01))
  (Set_in (inv@11@01 ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01)) b@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (and (img@12@01 l@14@01) (Set_in (inv@11@01 l@14@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (or
  (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01)
  (not (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(l@14@01 in b@2@01 && Lookup(parent, sm@9@01, l@14@01) != Null)]
(assert (not
  (and
    (Set_in l@14@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (and
    (Set_in l@14@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null)))
  (and
    (Set_in l@14@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) l@14@01)
    (or
      (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01)
      (not
        (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in l@14@01 b@2@01)
      (not (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null))))
  (and
    (Set_in l@14@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
  :pattern (($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef1|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@14@01 $Ref)) (!
  (and
    (=>
      (Set_in l@14@01 b@2@01)
      (and
        (Set_in l@14@01 b@2@01)
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) l@14@01)))
    (or (Set_in l@14@01 b@2@01) (not (Set_in l@14@01 b@2@01)))
    (=>
      (and
        (Set_in l@14@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null)))
      (and
        (Set_in l@14@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) l@14@01)
        (or
          (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01)
          (not
            (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01)))))
    (or
      (not
        (and
          (Set_in l@14@01 b@2@01)
          (not
            (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null))))
      (and
        (Set_in l@14@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null)))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) l@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|)))
(assert (forall ((l@14@01 $Ref)) (!
  (=>
    (and
      (Set_in l@14@01 b@2@01)
      (not (= ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) b@2@01)
      (>
        ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01))
        ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@14@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l@14@01) l@14@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (uf_bank%trigger ($Snap.first $t@4@01) b@2@01))
; [exec]
; fold acc(uf_bank(b), write)
(declare-const l@15@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@15@01 b@2@01))
(pop) ; 3
(declare-fun inv@16@01 ($Ref) $Ref)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@15@01 $Ref) (l2@15@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in l1@15@01 b@2@01)
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l1@15@01) l1@15@01))
      (and
        (Set_in l2@15@01 b@2@01)
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) l2@15@01) l2@15@01))
      (= l1@15@01 l2@15@01))
    (= l1@15@01 l2@15@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@15@01 $Ref)) (!
  (=>
    (Set_in l@15@01 b@2@01)
    (and (= (inv@16@01 l@15@01) l@15@01) (img@17@01 l@15@01)))
  :pattern ((Set_in l@15@01 b@2@01))
  :qid |parent-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@17@01 r) (Set_in (inv@16@01 r) b@2@01)) (= (inv@16@01 r) r))
  :pattern ((inv@16@01 r))
  :qid |parent-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@16@01 r) b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@9@01  $FVF<parent>) r) r))
  :pattern ((inv@16@01 r))
  :qid |quant-u-11|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@16@01 r) b@2@01) (img@17@01 r) (= r (inv@16@01 r)))
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
    (and (Set_in (inv@16@01 r) b@2@01) (img@17@01 r) (= r (inv@16@01 r)))
    (= (- $Perm.Write (pTaken@18@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<parent>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_parent (as sm@19@01  $FVF<parent>)))
      (and (Set_in (inv@16@01 r) b@2@01) (img@17@01 r)))
    (=>
      (and (Set_in (inv@16@01 r) b@2@01) (img@17@01 r))
      (Set_in r ($FVF.domain_parent (as sm@19@01  $FVF<parent>)))))
  :pattern ((Set_in r ($FVF.domain_parent (as sm@19@01  $FVF<parent>))))
  :qid |qp.fvfDomDef4|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@16@01 r) b@2@01) (img@17@01 r))
      (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01)))
    (=
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef3|)))
(declare-const l@20@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@20@01 b@2@01))
(pop) ; 3
(declare-fun inv@21@01 ($Ref) $Ref)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@20@01 $Ref) (l2@20@01 $Ref)) (!
  (=>
    (and (Set_in l1@20@01 b@2@01) (Set_in l2@20@01 b@2@01) (= l1@20@01 l2@20@01))
    (= l1@20@01 l2@20@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@20@01 $Ref)) (!
  (=>
    (Set_in l@20@01 b@2@01)
    (and (= (inv@21@01 l@20@01) l@20@01) (img@22@01 l@20@01)))
  :pattern ((Set_in l@20@01 b@2@01))
  :qid |rank-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@22@01 r) (Set_in (inv@21@01 r) b@2@01)) (= (inv@21@01 r) r))
  :pattern ((inv@21@01 r))
  :qid |rank-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@21@01 r) b@2@01) (img@22@01 r) (= r (inv@21@01 r)))
    ($Perm.min
      (ite
        (and (img@12@01 r) (Set_in (inv@11@01 r) b@2@01))
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
        (and (img@12@01 r) (Set_in (inv@11@01 r) b@2@01))
        $Perm.Write
        $Perm.No)
      (pTaken@23@01 r))
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
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@21@01 r) b@2@01) (img@22@01 r) (= r (inv@21@01 r)))
    (= (- $Perm.Write (pTaken@23@01 r)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $FVF<rank>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_rank (as sm@24@01  $FVF<rank>)))
      (and (Set_in (inv@21@01 r) b@2@01) (img@22@01 r)))
    (=>
      (and (Set_in (inv@21@01 r) b@2@01) (img@22@01 r))
      (Set_in r ($FVF.domain_rank (as sm@24@01  $FVF<rank>)))))
  :pattern ((Set_in r ($FVF.domain_rank (as sm@24@01  $FVF<rank>))))
  :qid |qp.fvfDomDef6|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@21@01 r) b@2@01) (img@22@01 r))
      (and (img@12@01 r) (Set_in (inv@11@01 r) b@2@01)))
    (=
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)
      ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) r)))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) r))
  :qid |qp.fvfValDef5|)))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@25@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 4
; [then-branch: 4 | l@25@01 in b@2@01 | live]
; [else-branch: 4 | !(l@25@01 in b@2@01) | live]
(push) ; 5
; [then-branch: 4 | l@25@01 in b@2@01]
(assert (Set_in l@25@01 b@2@01))
; [eval] 0 <= l.rank
(push) ; 6
(assert (not (and (img@12@01 l@25@01) (Set_in (inv@11@01 l@25@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(l@25@01 in b@2@01)]
(assert (not (Set_in l@25@01 b@2@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in l@25@01 b@2@01)) (Set_in l@25@01 b@2@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@25@01 $Ref)) (!
  (or (not (Set_in l@25@01 b@2@01)) (Set_in l@25@01 b@2@01))
  :pattern ((Set_in l@25@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|)))
(push) ; 3
(assert (not (forall ((l@25@01 $Ref)) (!
  (=>
    (Set_in l@25@01 b@2@01)
    (<=
      0
      ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@25@01)))
  :pattern ((Set_in l@25@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((l@25@01 $Ref)) (!
  (=>
    (Set_in l@25@01 b@2@01)
    (<=
      0
      ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@25@01)))
  :pattern ((Set_in l@25@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|)))
; [eval] (forall l: Ref :: { l.parent } (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank)
(declare-const l@26@01 $Ref)
(push) ; 3
; [eval] (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank
; [eval] (l in b) && l.parent != null
; [eval] (l in b)
(push) ; 4
; [then-branch: 5 | !(l@26@01 in b@2@01) | live]
; [else-branch: 5 | l@26@01 in b@2@01 | live]
(push) ; 5
; [then-branch: 5 | !(l@26@01 in b@2@01)]
(assert (not (Set_in l@26@01 b@2@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | l@26@01 in b@2@01]
(assert (Set_in l@26@01 b@2@01))
; [eval] l.parent != null
(assert ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) l@26@01))
(push) ; 6
(assert (not (and (img@8@01 l@26@01) (Set_in (inv@7@01 l@26@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in l@26@01 b@2@01)
  (and
    (Set_in l@26@01 b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) l@26@01))))
(assert (or (Set_in l@26@01 b@2@01) (not (Set_in l@26@01 b@2@01))))
(push) ; 4
; [then-branch: 6 | l@26@01 in b@2@01 && Lookup(parent, First:(First:($t@4@01)), l@26@01) != Null | live]
; [else-branch: 6 | !(l@26@01 in b@2@01 && Lookup(parent, First:(First:($t@4@01)), l@26@01) != Null) | live]
(push) ; 5
; [then-branch: 6 | l@26@01 in b@2@01 && Lookup(parent, First:(First:($t@4@01)), l@26@01) != Null]
(assert (and
  (Set_in l@26@01 b@2@01)
  (not
    (=
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
      $Ref.null))))
; [eval] (l.parent in b) && l.parent.rank > l.rank
; [eval] (l.parent in b)
(assert ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) l@26@01))
(push) ; 6
(assert (not (and (img@8@01 l@26@01) (Set_in (inv@7@01 l@26@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 7 | !(Lookup(parent, First:(First:($t@4@01)), l@26@01) in b@2@01) | live]
; [else-branch: 7 | Lookup(parent, First:(First:($t@4@01)), l@26@01) in b@2@01 | live]
(push) ; 7
; [then-branch: 7 | !(Lookup(parent, First:(First:($t@4@01)), l@26@01) in b@2@01)]
(assert (not
  (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | Lookup(parent, First:(First:($t@4@01)), l@26@01) in b@2@01]
(assert (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01))
; [eval] l.parent.rank > l.rank
(push) ; 8
(assert (not (and (img@8@01 l@26@01) (Set_in (inv@7@01 l@26@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (and
  (img@12@01 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01))
  (Set_in (inv@11@01 ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)) b@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (and (img@12@01 l@26@01) (Set_in (inv@11@01 l@26@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01)
  (not
    (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(l@26@01 in b@2@01 && Lookup(parent, First:(First:($t@4@01)), l@26@01) != Null)]
(assert (not
  (and
    (Set_in l@26@01 b@2@01)
    (not
      (=
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
        $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in l@26@01 b@2@01)
    (not
      (=
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
        $Ref.null)))
  (and
    (Set_in l@26@01 b@2@01)
    (not
      (=
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
        $Ref.null))
    ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) l@26@01)
    (or
      (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01)
      (not
        (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in l@26@01 b@2@01)
      (not
        (=
          ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
          $Ref.null))))
  (and
    (Set_in l@26@01 b@2@01)
    (not
      (=
        ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
        $Ref.null)))))
(declare-const sm@27@01 $FVF<parent>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@27@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@27@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
  :pattern (($FVF.lookup_parent (as sm@27@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef8|)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@27@01  $FVF<parent>) r)
      ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r)))
  :pattern (($FVF.lookup_parent (as sm@27@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) r) r)
  :pattern (($FVF.lookup_parent (as sm@27@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef8|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@26@01 $Ref)) (!
  (and
    (=>
      (Set_in l@26@01 b@2@01)
      (and
        (Set_in l@26@01 b@2@01)
        ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) l@26@01)))
    (or (Set_in l@26@01 b@2@01) (not (Set_in l@26@01 b@2@01)))
    (=>
      (and
        (Set_in l@26@01 b@2@01)
        (not
          (=
            ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
            $Ref.null)))
      (and
        (Set_in l@26@01 b@2@01)
        (not
          (=
            ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
            $Ref.null))
        ($FVF.loc_parent ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) l@26@01)
        (or
          (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01)
          (not
            (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01)))))
    (or
      (not
        (and
          (Set_in l@26@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
              $Ref.null))))
      (and
        (Set_in l@26@01 b@2@01)
        (not
          (=
            ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
            $Ref.null)))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@27@01  $FVF<parent>) l@26@01) l@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|)))
(push) ; 3
(assert (not (forall ((l@26@01 $Ref)) (!
  (=>
    (and
      (Set_in l@26@01 b@2@01)
      (not
        (=
          ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
          $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01)
      (>
        ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01))
        ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@26@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@27@01  $FVF<parent>) l@26@01) l@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((l@26@01 $Ref)) (!
  (=>
    (and
      (Set_in l@26@01 b@2@01)
      (not
        (=
          ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01)
          $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01) b@2@01)
      (>
        ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) ($FVF.lookup_parent ($SortWrappers.$SnapTo$FVF<parent> ($Snap.first ($Snap.first $t@4@01))) l@26@01))
        ($FVF.lookup_rank ($SortWrappers.$SnapTo$FVF<rank> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))) l@26@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@27@01  $FVF<parent>) l@26@01) l@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|)))
(assert (uf_bank%trigger ($Snap.combine
  ($SortWrappers.$FVF<parent>To$Snap (as sm@19@01  $FVF<parent>))
  ($Snap.combine
    ($SortWrappers.$FVF<rank>To$Snap (as sm@24@01  $FVF<rank>))
    ($Snap.combine $Snap.unit $Snap.unit))) b@2@01))
; [exec]
; assert (let n ==
;     ((unfolding acc(uf_bank(b), write) in l.rank)) in
;     n > n)
; [eval] (let n == ((unfolding acc(uf_bank(b), write) in l.rank)) in n > n)
; [eval] (unfolding acc(uf_bank(b), write) in l.rank)
(push) ; 3
(declare-const l@28@01 $Ref)
(push) ; 4
; [eval] (l in b)
(assert (Set_in l@28@01 b@2@01))
(pop) ; 4
(declare-fun inv@29@01 ($Ref) $Ref)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@28@01 $Ref) (l2@28@01 $Ref)) (!
  (=>
    (and (Set_in l1@28@01 b@2@01) (Set_in l2@28@01 b@2@01) (= l1@28@01 l2@28@01))
    (= l1@28@01 l2@28@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@28@01 $Ref)) (!
  (=>
    (Set_in l@28@01 b@2@01)
    (and (= (inv@29@01 l@28@01) l@28@01) (img@30@01 l@28@01)))
  :pattern ((Set_in l@28@01 b@2@01))
  :qid |quant-u-20|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01)) (= (inv@29@01 r) r))
  :pattern ((inv@29@01 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@28@01 $Ref)) (!
  (=> (Set_in l@28@01 b@2@01) (not (= l@28@01 $Ref.null)))
  :pattern ((Set_in l@28@01 b@2@01))
  :qid |parent-permImpliesNonNull|)))
(declare-const sm@31@01 $FVF<parent>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@29@01 r) b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r) r))
  :pattern ((inv@29@01 r))
  :qid |quant-u-21|)))
(declare-const l@32@01 $Ref)
(push) ; 4
; [eval] (l in b)
(assert (Set_in l@32@01 b@2@01))
(pop) ; 4
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@32@01 $Ref) (l2@32@01 $Ref)) (!
  (=>
    (and (Set_in l1@32@01 b@2@01) (Set_in l2@32@01 b@2@01) (= l1@32@01 l2@32@01))
    (= l1@32@01 l2@32@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@32@01 $Ref)) (!
  (=>
    (Set_in l@32@01 b@2@01)
    (and (= (inv@33@01 l@32@01) l@32@01) (img@34@01 l@32@01)))
  :pattern ((Set_in l@32@01 b@2@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (Set_in (inv@33@01 r) b@2@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |rank-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@32@01 $Ref)) (!
  (=> (Set_in l@32@01 b@2@01) (not (= l@32@01 $Ref.null)))
  :pattern ((Set_in l@32@01 b@2@01))
  :qid |rank-permImpliesNonNull|)))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@35@01 $Ref)
(push) ; 4
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 5
; [then-branch: 8 | l@35@01 in b@2@01 | live]
; [else-branch: 8 | !(l@35@01 in b@2@01) | live]
(push) ; 6
; [then-branch: 8 | l@35@01 in b@2@01]
(assert (Set_in l@35@01 b@2@01))
; [eval] 0 <= l.rank
(push) ; 7
(assert (not (and (img@34@01 l@35@01) (Set_in (inv@33@01 l@35@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 8 | !(l@35@01 in b@2@01)]
(assert (not (Set_in l@35@01 b@2@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in l@35@01 b@2@01)) (Set_in l@35@01 b@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@35@01 $Ref)) (!
  (or (not (Set_in l@35@01 b@2@01)) (Set_in l@35@01 b@2@01))
  :pattern ((Set_in l@35@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|)))
(assert (forall ((l@35@01 $Ref)) (!
  (=>
    (Set_in l@35@01 b@2@01)
    (<= 0 ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) l@35@01)))
  :pattern ((Set_in l@35@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|)))
; [eval] (forall l: Ref :: { l.parent } (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank)
(declare-const l@36@01 $Ref)
(push) ; 4
; [eval] (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank
; [eval] (l in b) && l.parent != null
; [eval] (l in b)
(push) ; 5
; [then-branch: 9 | !(l@36@01 in b@2@01) | live]
; [else-branch: 9 | l@36@01 in b@2@01 | live]
(push) ; 6
; [then-branch: 9 | !(l@36@01 in b@2@01)]
(assert (not (Set_in l@36@01 b@2@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | l@36@01 in b@2@01]
(assert (Set_in l@36@01 b@2@01))
; [eval] l.parent != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef10|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01))
(push) ; 7
(assert (not (and (img@30@01 l@36@01) (Set_in (inv@29@01 l@36@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (=>
  (Set_in l@36@01 b@2@01)
  (and
    (Set_in l@36@01 b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01))))
(assert (or (Set_in l@36@01 b@2@01) (not (Set_in l@36@01 b@2@01))))
(push) ; 5
; [then-branch: 10 | l@36@01 in b@2@01 && Lookup(parent, sm@31@01, l@36@01) != Null | live]
; [else-branch: 10 | !(l@36@01 in b@2@01 && Lookup(parent, sm@31@01, l@36@01) != Null) | live]
(push) ; 6
; [then-branch: 10 | l@36@01 in b@2@01 && Lookup(parent, sm@31@01, l@36@01) != Null]
(assert (and
  (Set_in l@36@01 b@2@01)
  (not (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null))))
; [eval] (l.parent in b) && l.parent.rank > l.rank
; [eval] (l.parent in b)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef10|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01))
(push) ; 7
(assert (not (and (img@30@01 l@36@01) (Set_in (inv@29@01 l@36@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 11 | !(Lookup(parent, sm@31@01, l@36@01) in b@2@01) | live]
; [else-branch: 11 | Lookup(parent, sm@31@01, l@36@01) in b@2@01 | live]
(push) ; 8
; [then-branch: 11 | !(Lookup(parent, sm@31@01, l@36@01) in b@2@01)]
(assert (not (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 11 | Lookup(parent, sm@31@01, l@36@01) in b@2@01]
(assert (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01))
; [eval] l.parent.rank > l.rank
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef10|))))
(push) ; 9
(assert (not (and (img@30@01 l@36@01) (Set_in (inv@29@01 l@36@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and
  (img@34@01 ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01))
  (Set_in (inv@33@01 ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01)) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and (img@34@01 l@36@01) (Set_in (inv@33@01 l@36@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (or
  (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)
  (not (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(l@36@01 in b@2@01 && Lookup(parent, sm@31@01, l@36@01) != Null)]
(assert (not
  (and
    (Set_in l@36@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (=>
  (and
    (Set_in l@36@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null)))
  (and
    (Set_in l@36@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01)
    (or
      (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)
      (not
        (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in l@36@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null))))
  (and
    (Set_in l@36@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@36@01 $Ref)) (!
  (and
    (=>
      (Set_in l@36@01 b@2@01)
      (and
        (Set_in l@36@01 b@2@01)
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01)))
    (or (Set_in l@36@01 b@2@01) (not (Set_in l@36@01 b@2@01)))
    (=>
      (and
        (Set_in l@36@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null)))
      (and
        (Set_in l@36@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01)
        (or
          (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)
          (not
            (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)))))
    (or
      (not
        (and
          (Set_in l@36@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01)
              $Ref.null))))
      (and
        (Set_in l@36@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null)))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|)))
(assert (forall ((l@36@01 $Ref)) (!
  (=>
    (and
      (Set_in l@36@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)
      (>
        ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01))
        ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) l@36@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|)))
(push) ; 4
(assert (not (and (img@34@01 l@3@01) (Set_in (inv@33@01 l@3@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=> (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01)) (= (inv@29@01 r) r))
  :pattern ((inv@29@01 r))
  :qid |parent-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (Set_in (inv@33@01 r) b@2@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |rank-fctOfInv|)))
(assert (and
  (forall ((l@28@01 $Ref)) (!
    (=>
      (Set_in l@28@01 b@2@01)
      (and (= (inv@29@01 l@28@01) l@28@01) (img@30@01 l@28@01)))
    :pattern ((Set_in l@28@01 b@2@01))
    :qid |quant-u-20|))
  (forall ((l@28@01 $Ref)) (!
    (=> (Set_in l@28@01 b@2@01) (not (= l@28@01 $Ref.null)))
    :pattern ((Set_in l@28@01 b@2@01))
    :qid |parent-permImpliesNonNull|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@29@01 r) b@2@01)
      ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) r) r))
    :pattern ((inv@29@01 r))
    :qid |quant-u-21|))))
(assert (and
  (forall ((l@32@01 $Ref)) (!
    (=>
      (Set_in l@32@01 b@2@01)
      (and (= (inv@33@01 l@32@01) l@32@01) (img@34@01 l@32@01)))
    :pattern ((Set_in l@32@01 b@2@01))
    :qid |quant-u-23|))
  (forall ((l@32@01 $Ref)) (!
    (=> (Set_in l@32@01 b@2@01) (not (= l@32@01 $Ref.null)))
    :pattern ((Set_in l@32@01 b@2@01))
    :qid |rank-permImpliesNonNull|))
  (forall ((l@35@01 $Ref)) (!
    (or (not (Set_in l@35@01 b@2@01)) (Set_in l@35@01 b@2@01))
    :pattern ((Set_in l@35@01 b@2@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|))
  (forall ((l@35@01 $Ref)) (!
    (=>
      (Set_in l@35@01 b@2@01)
      (<= 0 ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) l@35@01)))
    :pattern ((Set_in l@35@01 b@2@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|))
  (forall ((l@36@01 $Ref)) (!
    (and
      (=>
        (Set_in l@36@01 b@2@01)
        (and
          (Set_in l@36@01 b@2@01)
          ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01)))
      (or (Set_in l@36@01 b@2@01) (not (Set_in l@36@01 b@2@01)))
      (=>
        (and
          (Set_in l@36@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01)
              $Ref.null)))
        (and
          (Set_in l@36@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01)
              $Ref.null))
          ($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01)
          (or
            (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)
            (not
              (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)))))
      (or
        (not
          (and
            (Set_in l@36@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01)
                $Ref.null))))
        (and
          (Set_in l@36@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01)
              $Ref.null)))))
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|))
  (forall ((l@36@01 $Ref)) (!
    (=>
      (and
        (Set_in l@36@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) $Ref.null)))
      (and
        (Set_in ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) b@2@01)
        (>
          ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01))
          ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) l@36@01))))
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@31@01  $FVF<parent>) l@36@01) l@36@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|))))
(declare-const letvar@37@01 Int)
(assert (= (as letvar@37@01  Int) ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) l@3@01)))
; [eval] n > n
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let n == ((unfolding acc(uf_bank(b), write) in l.rank)) in n > n)
; [eval] (unfolding acc(uf_bank(b), write) in l.rank)
(set-option :timeout 0)
(push) ; 3
(declare-const l@38@01 $Ref)
(push) ; 4
; [eval] (l in b)
(assert (Set_in l@38@01 b@2@01))
(pop) ; 4
(declare-fun inv@39@01 ($Ref) $Ref)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@38@01 $Ref) (l2@38@01 $Ref)) (!
  (=>
    (and (Set_in l1@38@01 b@2@01) (Set_in l2@38@01 b@2@01) (= l1@38@01 l2@38@01))
    (= l1@38@01 l2@38@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@38@01 $Ref)) (!
  (=>
    (Set_in l@38@01 b@2@01)
    (and (= (inv@39@01 l@38@01) l@38@01) (img@40@01 l@38@01)))
  :pattern ((Set_in l@38@01 b@2@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@38@01 $Ref)) (!
  (=> (Set_in l@38@01 b@2@01) (not (= l@38@01 $Ref.null)))
  :pattern ((Set_in l@38@01 b@2@01))
  :qid |parent-permImpliesNonNull|)))
(declare-const sm@41@01 $FVF<parent>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@39@01 r) b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
  :pattern ((inv@39@01 r))
  :qid |quant-u-26|)))
(declare-const l@42@01 $Ref)
(push) ; 4
; [eval] (l in b)
(assert (Set_in l@42@01 b@2@01))
(pop) ; 4
(declare-fun inv@43@01 ($Ref) $Ref)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@42@01 $Ref) (l2@42@01 $Ref)) (!
  (=>
    (and (Set_in l1@42@01 b@2@01) (Set_in l2@42@01 b@2@01) (= l1@42@01 l2@42@01))
    (= l1@42@01 l2@42@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@42@01 $Ref)) (!
  (=>
    (Set_in l@42@01 b@2@01)
    (and (= (inv@43@01 l@42@01) l@42@01) (img@44@01 l@42@01)))
  :pattern ((Set_in l@42@01 b@2@01))
  :qid |quant-u-28|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |rank-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@42@01 $Ref)) (!
  (=> (Set_in l@42@01 b@2@01) (not (= l@42@01 $Ref.null)))
  :pattern ((Set_in l@42@01 b@2@01))
  :qid |rank-permImpliesNonNull|)))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@45@01 $Ref)
(push) ; 4
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 5
; [then-branch: 12 | l@45@01 in b@2@01 | live]
; [else-branch: 12 | !(l@45@01 in b@2@01) | live]
(push) ; 6
; [then-branch: 12 | l@45@01 in b@2@01]
(assert (Set_in l@45@01 b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@46@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@46@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@46@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@46@01  $FPM) r))
  :qid |qp.resTrgDef14|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@46@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@47@01 $FVF<rank>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@47@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@47@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef15|)))
(declare-const pm@48@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@48@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@48@01  $FPM) r) $Perm.Write)
  :pattern ((inv@43@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= l.rank
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@44@01 l@45@01) (Set_in (inv@43@01 l@45@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 12 | !(l@45@01 in b@2@01)]
(assert (not (Set_in l@45@01 b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@49@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@49@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef18|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@49@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@50@01 $FVF<rank>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@50@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef19|)))
(declare-const pm@51@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@51@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@51@01  $FPM) r) $Perm.Write)
  :pattern ((inv@43@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@46@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@46@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@46@01  $FPM) r))
  :qid |qp.resTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@47@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@47@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@48@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(assert (=>
  (Set_in l@45@01 b@2@01)
  (and
    (Set_in l@45@01 b@2@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@46@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@48@01  $FPM) r) $Perm.Write)
      :pattern ((inv@43@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@49@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@50@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@51@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
(assert (=>
  (not (Set_in l@45@01 b@2@01))
  (and
    (not (Set_in l@45@01 b@2@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@49@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@51@01  $FPM) r) $Perm.Write)
      :pattern ((inv@43@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or (not (Set_in l@45@01 b@2@01)) (Set_in l@45@01 b@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@46@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@46@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@46@01  $FPM) r))
  :qid |qp.resTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@47@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@47@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@48@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@49@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@50@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@51@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@45@01 $Ref)) (!
  (and
    (=>
      (Set_in l@45@01 b@2@01)
      (and
        (Set_in l@45@01 b@2@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@46@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@48@01  $FPM) r) $Perm.Write)
          :pattern ((inv@43@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (not (Set_in l@45@01 b@2@01))
      (and
        (not (Set_in l@45@01 b@2@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@49@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@51@01  $FPM) r) $Perm.Write)
          :pattern ((inv@43@01 r))
          :qid |qp-fld-prm-bnd|))))
    (or (not (Set_in l@45@01 b@2@01)) (Set_in l@45@01 b@2@01)))
  :pattern ((Set_in l@45@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|)))
(assert (forall ((l@45@01 $Ref)) (!
  (=>
    (Set_in l@45@01 b@2@01)
    (<= 0 ($FVF.lookup_rank (as sm@47@01  $FVF<rank>) l@45@01)))
  :pattern ((Set_in l@45@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|)))
; [eval] (forall l: Ref :: { l.parent } (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank)
(declare-const l@52@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank
; [eval] (l in b) && l.parent != null
; [eval] (l in b)
(push) ; 5
; [then-branch: 13 | !(l@52@01 in b@2@01) | live]
; [else-branch: 13 | l@52@01 in b@2@01 | live]
(push) ; 6
; [then-branch: 13 | !(l@52@01 in b@2@01)]
(assert (not (Set_in l@52@01 b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@53@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@53@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef22|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@53@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@54@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@54@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@54@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@54@01  $FPM) r) $Perm.Write)
  :pattern ((inv@43@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 13 | l@52@01 in b@2@01]
(assert (Set_in l@52@01 b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@55@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@55@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@55@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@55@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@56@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@56@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@56@01  $FPM) r))
  :qid |qp.resPrmSumDef26|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
  :pattern ((inv@43@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] l.parent != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef12|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01))
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@40@01 l@52@01) (Set_in (inv@39@01 l@52@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@53@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@54@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@54@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (=>
  (not (Set_in l@52@01 b@2@01))
  (and
    (not (Set_in l@52@01 b@2@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@53@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@54@01  $FPM) r) $Perm.Write)
      :pattern ((inv@43@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@55@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@55@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@55@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@56@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@56@01  $FPM) r))
  :qid |qp.resPrmSumDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (=>
  (Set_in l@52@01 b@2@01)
  (and
    (Set_in l@52@01 b@2@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
      :pattern ((inv@43@01 r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01))))
(assert (or (Set_in l@52@01 b@2@01) (not (Set_in l@52@01 b@2@01))))
(push) ; 5
; [then-branch: 14 | l@52@01 in b@2@01 && Lookup(parent, sm@41@01, l@52@01) != Null | live]
; [else-branch: 14 | !(l@52@01 in b@2@01 && Lookup(parent, sm@41@01, l@52@01) != Null) | live]
(push) ; 6
; [then-branch: 14 | l@52@01 in b@2@01 && Lookup(parent, sm@41@01, l@52@01) != Null]
(assert (and
  (Set_in l@52@01 b@2@01)
  (not (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
  :pattern ((inv@43@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (l.parent in b) && l.parent.rank > l.rank
; [eval] (l.parent in b)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef12|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01))
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@40@01 l@52@01) (Set_in (inv@39@01 l@52@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 15 | !(Lookup(parent, sm@41@01, l@52@01) in b@2@01) | live]
; [else-branch: 15 | Lookup(parent, sm@41@01, l@52@01) in b@2@01 | live]
(push) ; 8
; [then-branch: 15 | !(Lookup(parent, sm@41@01, l@52@01) in b@2@01)]
(assert (not (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 15 | Lookup(parent, sm@41@01, l@52@01) in b@2@01]
(assert (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
; [eval] l.parent.rank > l.rank
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef11|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef12|))))
(set-option :timeout 0)
(push) ; 9
(assert (not (and (img@40@01 l@52@01) (Set_in (inv@39@01 l@52@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and
  (img@44@01 ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01))
  (Set_in (inv@43@01 ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and (img@44@01 l@52@01) (Set_in (inv@43@01 l@52@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (or
  (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)
  (not (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | !(l@52@01 in b@2@01 && Lookup(parent, sm@41@01, l@52@01) != Null)]
(assert (not
  (and
    (Set_in l@52@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef12|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
  :pattern ((inv@43@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (=>
  (and
    (Set_in l@52@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null)))
  (and
    (Set_in l@52@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
      :pattern ((inv@43@01 r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01)
    (or
      (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)
      (not
        (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01))))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in l@52@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in l@52@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
      :pattern ((inv@43@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in l@52@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null))))
  (and
    (Set_in l@52@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@53@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@54@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@54@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@55@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@55@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@55@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@56@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@56@01  $FPM) r))
  :qid |qp.resPrmSumDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef12|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@52@01 $Ref)) (!
  (and
    (=>
      (not (Set_in l@52@01 b@2@01))
      (and
        (not (Set_in l@52@01 b@2@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@53@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@54@01  $FPM) r) $Perm.Write)
          :pattern ((inv@43@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (Set_in l@52@01 b@2@01)
      (and
        (Set_in l@52@01 b@2@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
          :pattern ((inv@43@01 r))
          :qid |qp-fld-prm-bnd|))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01)))
    (or (Set_in l@52@01 b@2@01) (not (Set_in l@52@01 b@2@01)))
    (=>
      (and
        (Set_in l@52@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null)))
      (and
        (Set_in l@52@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
          :pattern ((inv@43@01 r))
          :qid |qp-fld-prm-bnd|))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01)
        (or
          (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)
          (not
            (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)))))
    (=>
      (not
        (and
          (Set_in l@52@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
              $Ref.null))))
      (and
        (not
          (and
            (Set_in l@52@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
                $Ref.null))))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
          :pattern ((inv@43@01 r))
          :qid |qp-fld-prm-bnd|))))
    (or
      (not
        (and
          (Set_in l@52@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
              $Ref.null))))
      (and
        (Set_in l@52@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null)))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|)))
(assert (forall ((l@52@01 $Ref)) (!
  (=>
    (and
      (Set_in l@52@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)
      (>
        ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01))
        ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) l@52@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@57@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@57@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@57@01  $FPM) r))
  :qid |qp.resTrgDef28|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@57@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@58@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@58@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@58@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@58@01  $FPM) r) $Perm.Write)
  :pattern ((inv@43@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 4
(assert (not (and (img@44@01 l@3@01) (Set_in (inv@43@01 l@3@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=> (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) (= (inv@39@01 r) r))
  :pattern ((inv@39@01 r))
  :qid |parent-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |rank-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@46@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@46@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@46@01  $FPM) r))
  :qid |qp.resTrgDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@47@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@47@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@48@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@48@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@49@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@50@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@51@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@53@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@53@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@53@01  $FPM) r))
  :qid |qp.resTrgDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@54@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@54@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@55@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@55@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@55@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@56@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@56@01  $FPM) r))
  :qid |qp.resPrmSumDef26|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@57@01  $FPM) r)
    (ite (and (img@40@01 r) (Set_in (inv@39@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@57@01  $FPM) r))
  :qid |qp.resTrgDef28|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@58@01  $FPM) r)
    (ite (and (img@44@01 r) (Set_in (inv@43@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@58@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
(assert (and
  (forall ((l@38@01 $Ref)) (!
    (=>
      (Set_in l@38@01 b@2@01)
      (and (= (inv@39@01 l@38@01) l@38@01) (img@40@01 l@38@01)))
    :pattern ((Set_in l@38@01 b@2@01))
    :qid |quant-u-25|))
  (forall ((l@38@01 $Ref)) (!
    (=> (Set_in l@38@01 b@2@01) (not (= l@38@01 $Ref.null)))
    :pattern ((Set_in l@38@01 b@2@01))
    :qid |parent-permImpliesNonNull|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@39@01 r) b@2@01)
      ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
    :pattern ((inv@39@01 r))
    :qid |quant-u-26|))))
(assert (and
  (forall ((l@42@01 $Ref)) (!
    (=>
      (Set_in l@42@01 b@2@01)
      (and (= (inv@43@01 l@42@01) l@42@01) (img@44@01 l@42@01)))
    :pattern ((Set_in l@42@01 b@2@01))
    :qid |quant-u-28|))
  (forall ((l@42@01 $Ref)) (!
    (=> (Set_in l@42@01 b@2@01) (not (= l@42@01 $Ref.null)))
    :pattern ((Set_in l@42@01 b@2@01))
    :qid |rank-permImpliesNonNull|))
  (forall ((l@45@01 $Ref)) (!
    (and
      (=>
        (Set_in l@45@01 b@2@01)
        (and
          (Set_in l@45@01 b@2@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@46@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@48@01  $FPM) r) $Perm.Write)
            :pattern ((inv@43@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (not (Set_in l@45@01 b@2@01))
        (and
          (not (Set_in l@45@01 b@2@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@49@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@51@01  $FPM) r) $Perm.Write)
            :pattern ((inv@43@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or (not (Set_in l@45@01 b@2@01)) (Set_in l@45@01 b@2@01)))
    :pattern ((Set_in l@45@01 b@2@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|))
  (forall ((l@45@01 $Ref)) (!
    (=>
      (Set_in l@45@01 b@2@01)
      (<= 0 ($FVF.lookup_rank (as sm@47@01  $FVF<rank>) l@45@01)))
    :pattern ((Set_in l@45@01 b@2@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|))
  (forall ((l@52@01 $Ref)) (!
    (and
      (=>
        (not (Set_in l@52@01 b@2@01))
        (and
          (not (Set_in l@52@01 b@2@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@53@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@54@01  $FPM) r) $Perm.Write)
            :pattern ((inv@43@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (Set_in l@52@01 b@2@01)
        (and
          (Set_in l@52@01 b@2@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
            :pattern ((inv@43@01 r))
            :qid |qp-fld-prm-bnd|))
          ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01)))
      (or (Set_in l@52@01 b@2@01) (not (Set_in l@52@01 b@2@01)))
      (=>
        (and
          (Set_in l@52@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
              $Ref.null)))
        (and
          (Set_in l@52@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
              $Ref.null))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
            :pattern ((inv@43@01 r))
            :qid |qp-fld-prm-bnd|))
          ($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01)
          (or
            (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)
            (not
              (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)))))
      (=>
        (not
          (and
            (Set_in l@52@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
                $Ref.null))))
        (and
          (not
            (and
              (Set_in l@52@01 b@2@01)
              (not
                (=
                  ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
                  $Ref.null))))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@55@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@56@01  $FPM) r) $Perm.Write)
            :pattern ((inv@43@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or
        (not
          (and
            (Set_in l@52@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
                $Ref.null))))
        (and
          (Set_in l@52@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01)
              $Ref.null)))))
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|))
  (forall ((l@52@01 $Ref)) (!
    (=>
      (and
        (Set_in l@52@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) $Ref.null)))
      (and
        (Set_in ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) b@2@01)
        (>
          ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01))
          ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) l@52@01))))
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) l@52@01) l@52@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_parent (as pm@57@01  $FPM) r) $Perm.Write)
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@41@01  $FVF<parent>) r) r))
    :qid |qp-fld-prm-bnd|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_rank (as pm@58@01  $FPM) r) $Perm.Write)
    :pattern ((inv@43@01 r))
    :qid |qp-fld-prm-bnd|))))
(declare-const letvar@59@01 Int)
(assert (= (as letvar@59@01  Int) ($FVF.lookup_rank (as sm@50@01  $FVF<rank>) l@3@01)))
; [eval] n > n
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,02s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] (let n == ((unfolding acc(uf_bank(b), write) in l.rank)) in n > n)
; [eval] (unfolding acc(uf_bank(b), write) in l.rank)
(set-option :timeout 0)
(push) ; 3
(declare-const l@60@01 $Ref)
(push) ; 4
; [eval] (l in b)
(assert (Set_in l@60@01 b@2@01))
(pop) ; 4
(declare-fun inv@61@01 ($Ref) $Ref)
(declare-fun img@62@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@60@01 $Ref) (l2@60@01 $Ref)) (!
  (=>
    (and (Set_in l1@60@01 b@2@01) (Set_in l2@60@01 b@2@01) (= l1@60@01 l2@60@01))
    (= l1@60@01 l2@60@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@60@01 $Ref)) (!
  (=>
    (Set_in l@60@01 b@2@01)
    (and (= (inv@61@01 l@60@01) l@60@01) (img@62@01 l@60@01)))
  :pattern ((Set_in l@60@01 b@2@01))
  :qid |quant-u-30|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) (= (inv@61@01 r) r))
  :pattern ((inv@61@01 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@60@01 $Ref)) (!
  (=> (Set_in l@60@01 b@2@01) (not (= l@60@01 $Ref.null)))
  :pattern ((Set_in l@60@01 b@2@01))
  :qid |parent-permImpliesNonNull|)))
(declare-const sm@63@01 $FVF<parent>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@61@01 r) b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
  :pattern ((inv@61@01 r))
  :qid |quant-u-31|)))
(declare-const l@64@01 $Ref)
(push) ; 4
; [eval] (l in b)
(assert (Set_in l@64@01 b@2@01))
(pop) ; 4
(declare-fun inv@65@01 ($Ref) $Ref)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@64@01 $Ref) (l2@64@01 $Ref)) (!
  (=>
    (and (Set_in l1@64@01 b@2@01) (Set_in l2@64@01 b@2@01) (= l1@64@01 l2@64@01))
    (= l1@64@01 l2@64@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@64@01 $Ref)) (!
  (=>
    (Set_in l@64@01 b@2@01)
    (and (= (inv@65@01 l@64@01) l@64@01) (img@66@01 l@64@01)))
  :pattern ((Set_in l@64@01 b@2@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |rank-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@64@01 $Ref)) (!
  (=> (Set_in l@64@01 b@2@01) (not (= l@64@01 $Ref.null)))
  :pattern ((Set_in l@64@01 b@2@01))
  :qid |rank-permImpliesNonNull|)))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@67@01 $Ref)
(push) ; 4
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 5
; [then-branch: 16 | l@67@01 in b@2@01 | live]
; [else-branch: 16 | !(l@67@01 in b@2@01) | live]
(push) ; 6
; [then-branch: 16 | l@67@01 in b@2@01]
(assert (Set_in l@67@01 b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@68@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@68@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@68@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@68@01  $FPM) r))
  :qid |qp.resTrgDef33|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@68@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@69@01 $FVF<rank>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@69@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@69@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef34|)))
(declare-const pm@70@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@70@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@70@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= l.rank
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@66@01 l@67@01) (Set_in (inv@65@01 l@67@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(l@67@01 in b@2@01)]
(assert (not (Set_in l@67@01 b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@71@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@71@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@71@01  $FPM) r))
  :qid |qp.resTrgDef37|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@71@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@72@01 $FVF<rank>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@72@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef38|)))
(declare-const pm@73@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@73@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@73@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@73@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@68@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@68@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@68@01  $FPM) r))
  :qid |qp.resTrgDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@69@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@69@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@70@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (=>
  (Set_in l@67@01 b@2@01)
  (and
    (Set_in l@67@01 b@2@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@68@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@70@01  $FPM) r) $Perm.Write)
      :pattern ((inv@65@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@71@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@71@01  $FPM) r))
  :qid |qp.resTrgDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@72@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@73@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@73@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
(assert (=>
  (not (Set_in l@67@01 b@2@01))
  (and
    (not (Set_in l@67@01 b@2@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@71@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@73@01  $FPM) r) $Perm.Write)
      :pattern ((inv@65@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or (not (Set_in l@67@01 b@2@01)) (Set_in l@67@01 b@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@68@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@68@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@68@01  $FPM) r))
  :qid |qp.resTrgDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@69@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@69@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@70@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@71@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@71@01  $FPM) r))
  :qid |qp.resTrgDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@72@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@73@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@73@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@67@01 $Ref)) (!
  (and
    (=>
      (Set_in l@67@01 b@2@01)
      (and
        (Set_in l@67@01 b@2@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@68@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@70@01  $FPM) r) $Perm.Write)
          :pattern ((inv@65@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (not (Set_in l@67@01 b@2@01))
      (and
        (not (Set_in l@67@01 b@2@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@71@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@73@01  $FPM) r) $Perm.Write)
          :pattern ((inv@65@01 r))
          :qid |qp-fld-prm-bnd|))))
    (or (not (Set_in l@67@01 b@2@01)) (Set_in l@67@01 b@2@01)))
  :pattern ((Set_in l@67@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|)))
(assert (forall ((l@67@01 $Ref)) (!
  (=>
    (Set_in l@67@01 b@2@01)
    (<= 0 ($FVF.lookup_rank (as sm@69@01  $FVF<rank>) l@67@01)))
  :pattern ((Set_in l@67@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|)))
; [eval] (forall l: Ref :: { l.parent } (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank)
(declare-const l@74@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank
; [eval] (l in b) && l.parent != null
; [eval] (l in b)
(push) ; 5
; [then-branch: 17 | !(l@74@01 in b@2@01) | live]
; [else-branch: 17 | l@74@01 in b@2@01 | live]
(push) ; 6
; [then-branch: 17 | !(l@74@01 in b@2@01)]
(assert (not (Set_in l@74@01 b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@75@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@75@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@75@01  $FPM) r))
  :qid |qp.resTrgDef41|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@75@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@76@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@76@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@76@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 17 | l@74@01 in b@2@01]
(assert (Set_in l@74@01 b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@77@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@77@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@77@01  $FPM) r))
  :qid |qp.resTrgDef44|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@78@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@78@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@78@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] l.parent != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef30|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef31|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01))
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@62@01 l@74@01) (Set_in (inv@61@01 l@74@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@75@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@75@01  $FPM) r))
  :qid |qp.resTrgDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@76@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (=>
  (not (Set_in l@74@01 b@2@01))
  (and
    (not (Set_in l@74@01 b@2@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@75@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@76@01  $FPM) r) $Perm.Write)
      :pattern ((inv@65@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@77@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@77@01  $FPM) r))
  :qid |qp.resTrgDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@78@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@78@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef31|)))
(assert (=>
  (Set_in l@74@01 b@2@01)
  (and
    (Set_in l@74@01 b@2@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
      :pattern ((inv@65@01 r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01))))
(assert (or (Set_in l@74@01 b@2@01) (not (Set_in l@74@01 b@2@01))))
(push) ; 5
; [then-branch: 18 | l@74@01 in b@2@01 && Lookup(parent, sm@63@01, l@74@01) != Null | live]
; [else-branch: 18 | !(l@74@01 in b@2@01 && Lookup(parent, sm@63@01, l@74@01) != Null) | live]
(push) ; 6
; [then-branch: 18 | l@74@01 in b@2@01 && Lookup(parent, sm@63@01, l@74@01) != Null]
(assert (and
  (Set_in l@74@01 b@2@01)
  (not (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (l.parent in b) && l.parent.rank > l.rank
; [eval] (l.parent in b)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef30|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef31|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01))
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@62@01 l@74@01) (Set_in (inv@61@01 l@74@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 19 | !(Lookup(parent, sm@63@01, l@74@01) in b@2@01) | live]
; [else-branch: 19 | Lookup(parent, sm@63@01, l@74@01) in b@2@01 | live]
(push) ; 8
; [then-branch: 19 | !(Lookup(parent, sm@63@01, l@74@01) in b@2@01)]
(assert (not (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 19 | Lookup(parent, sm@63@01, l@74@01) in b@2@01]
(assert (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
; [eval] l.parent.rank > l.rank
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef30|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef31|))))
(set-option :timeout 0)
(push) ; 9
(assert (not (and (img@62@01 l@74@01) (Set_in (inv@61@01 l@74@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and
  (img@66@01 ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01))
  (Set_in (inv@65@01 ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and (img@66@01 l@74@01) (Set_in (inv@65@01 l@74@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef31|)))
(assert (or
  (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)
  (not (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | !(l@74@01 in b@2@01 && Lookup(parent, sm@63@01, l@74@01) != Null)]
(assert (not
  (and
    (Set_in l@74@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef31|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef31|)))
(assert (=>
  (and
    (Set_in l@74@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null)))
  (and
    (Set_in l@74@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
      :pattern ((inv@65@01 r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01)
    (or
      (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)
      (not
        (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01))))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in l@74@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in l@74@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
      :pattern ((inv@65@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in l@74@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null))))
  (and
    (Set_in l@74@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@75@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@75@01  $FPM) r))
  :qid |qp.resTrgDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@76@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@77@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@77@01  $FPM) r))
  :qid |qp.resTrgDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@78@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@78@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef31|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@74@01 $Ref)) (!
  (and
    (=>
      (not (Set_in l@74@01 b@2@01))
      (and
        (not (Set_in l@74@01 b@2@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@75@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@76@01  $FPM) r) $Perm.Write)
          :pattern ((inv@65@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (Set_in l@74@01 b@2@01)
      (and
        (Set_in l@74@01 b@2@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
          :pattern ((inv@65@01 r))
          :qid |qp-fld-prm-bnd|))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01)))
    (or (Set_in l@74@01 b@2@01) (not (Set_in l@74@01 b@2@01)))
    (=>
      (and
        (Set_in l@74@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null)))
      (and
        (Set_in l@74@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
          :pattern ((inv@65@01 r))
          :qid |qp-fld-prm-bnd|))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01)
        (or
          (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)
          (not
            (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)))))
    (=>
      (not
        (and
          (Set_in l@74@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
              $Ref.null))))
      (and
        (not
          (and
            (Set_in l@74@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
                $Ref.null))))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
          :pattern ((inv@65@01 r))
          :qid |qp-fld-prm-bnd|))))
    (or
      (not
        (and
          (Set_in l@74@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
              $Ref.null))))
      (and
        (Set_in l@74@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null)))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|)))
(assert (forall ((l@74@01 $Ref)) (!
  (=>
    (and
      (Set_in l@74@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)
      (>
        ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01))
        ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) l@74@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@79@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@79@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@79@01  $FPM) r))
  :qid |qp.resPrmSumDef46|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@79@01  $FPM) r))
  :qid |qp.resTrgDef47|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@79@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@80@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@80@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef48|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@80@01  $FPM) r) $Perm.Write)
  :pattern ((inv@65@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 4
(assert (not (and (img@66@01 l@3@01) (Set_in (inv@65@01 l@3@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=> (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) (= (inv@61@01 r) r))
  :pattern ((inv@61@01 r))
  :qid |parent-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef31|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |rank-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@68@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@68@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@68@01  $FPM) r))
  :qid |qp.resTrgDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@69@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@69@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@70@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@71@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@71@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@71@01  $FPM) r))
  :qid |qp.resTrgDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@72@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@73@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@73@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@75@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@75@01  $FPM) r))
  :qid |qp.resTrgDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@76@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@76@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@77@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@77@01  $FPM) r))
  :qid |qp.resTrgDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@78@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@78@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@79@01  $FPM) r)
    (ite (and (img@62@01 r) (Set_in (inv@61@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@79@01  $FPM) r))
  :qid |qp.resPrmSumDef46|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@79@01  $FPM) r))
  :qid |qp.resTrgDef47|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@80@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@80@01  $FPM) r))
  :qid |qp.resPrmSumDef48|)))
(assert (and
  (forall ((l@60@01 $Ref)) (!
    (=>
      (Set_in l@60@01 b@2@01)
      (and (= (inv@61@01 l@60@01) l@60@01) (img@62@01 l@60@01)))
    :pattern ((Set_in l@60@01 b@2@01))
    :qid |quant-u-30|))
  (forall ((l@60@01 $Ref)) (!
    (=> (Set_in l@60@01 b@2@01) (not (= l@60@01 $Ref.null)))
    :pattern ((Set_in l@60@01 b@2@01))
    :qid |parent-permImpliesNonNull|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@61@01 r) b@2@01)
      ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
    :pattern ((inv@61@01 r))
    :qid |quant-u-31|))))
(assert (and
  (forall ((l@64@01 $Ref)) (!
    (=>
      (Set_in l@64@01 b@2@01)
      (and (= (inv@65@01 l@64@01) l@64@01) (img@66@01 l@64@01)))
    :pattern ((Set_in l@64@01 b@2@01))
    :qid |quant-u-33|))
  (forall ((l@64@01 $Ref)) (!
    (=> (Set_in l@64@01 b@2@01) (not (= l@64@01 $Ref.null)))
    :pattern ((Set_in l@64@01 b@2@01))
    :qid |rank-permImpliesNonNull|))
  (forall ((l@67@01 $Ref)) (!
    (and
      (=>
        (Set_in l@67@01 b@2@01)
        (and
          (Set_in l@67@01 b@2@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@68@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@70@01  $FPM) r) $Perm.Write)
            :pattern ((inv@65@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (not (Set_in l@67@01 b@2@01))
        (and
          (not (Set_in l@67@01 b@2@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@71@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@73@01  $FPM) r) $Perm.Write)
            :pattern ((inv@65@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or (not (Set_in l@67@01 b@2@01)) (Set_in l@67@01 b@2@01)))
    :pattern ((Set_in l@67@01 b@2@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|))
  (forall ((l@67@01 $Ref)) (!
    (=>
      (Set_in l@67@01 b@2@01)
      (<= 0 ($FVF.lookup_rank (as sm@69@01  $FVF<rank>) l@67@01)))
    :pattern ((Set_in l@67@01 b@2@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|))
  (forall ((l@74@01 $Ref)) (!
    (and
      (=>
        (not (Set_in l@74@01 b@2@01))
        (and
          (not (Set_in l@74@01 b@2@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@75@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@76@01  $FPM) r) $Perm.Write)
            :pattern ((inv@65@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (Set_in l@74@01 b@2@01)
        (and
          (Set_in l@74@01 b@2@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
            :pattern ((inv@65@01 r))
            :qid |qp-fld-prm-bnd|))
          ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01)))
      (or (Set_in l@74@01 b@2@01) (not (Set_in l@74@01 b@2@01)))
      (=>
        (and
          (Set_in l@74@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
              $Ref.null)))
        (and
          (Set_in l@74@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
              $Ref.null))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
            :pattern ((inv@65@01 r))
            :qid |qp-fld-prm-bnd|))
          ($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01)
          (or
            (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)
            (not
              (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)))))
      (=>
        (not
          (and
            (Set_in l@74@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
                $Ref.null))))
        (and
          (not
            (and
              (Set_in l@74@01 b@2@01)
              (not
                (=
                  ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
                  $Ref.null))))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@77@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@78@01  $FPM) r) $Perm.Write)
            :pattern ((inv@65@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or
        (not
          (and
            (Set_in l@74@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
                $Ref.null))))
        (and
          (Set_in l@74@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01)
              $Ref.null)))))
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|))
  (forall ((l@74@01 $Ref)) (!
    (=>
      (and
        (Set_in l@74@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) $Ref.null)))
      (and
        (Set_in ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) b@2@01)
        (>
          ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01))
          ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) l@74@01))))
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) l@74@01) l@74@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_parent (as pm@79@01  $FPM) r) $Perm.Write)
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@63@01  $FVF<parent>) r) r))
    :qid |qp-fld-prm-bnd|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_rank (as pm@80@01  $FPM) r) $Perm.Write)
    :pattern ((inv@65@01 r))
    :qid |qp-fld-prm-bnd|))))
(declare-const letvar@81@01 Int)
(assert (= (as letvar@81@01  Int) ($FVF.lookup_rank (as sm@72@01  $FVF<rank>) l@3@01)))
; [eval] n > n
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
; [eval] (let n == ((unfolding acc(uf_bank(b), write) in l.rank)) in n > n)
; [eval] (unfolding acc(uf_bank(b), write) in l.rank)
(set-option :timeout 0)
(push) ; 3
(declare-const l@82@01 $Ref)
(push) ; 4
; [eval] (l in b)
(assert (Set_in l@82@01 b@2@01))
(pop) ; 4
(declare-fun inv@83@01 ($Ref) $Ref)
(declare-fun img@84@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@82@01 $Ref) (l2@82@01 $Ref)) (!
  (=>
    (and (Set_in l1@82@01 b@2@01) (Set_in l2@82@01 b@2@01) (= l1@82@01 l2@82@01))
    (= l1@82@01 l2@82@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@82@01 $Ref)) (!
  (=>
    (Set_in l@82@01 b@2@01)
    (and (= (inv@83@01 l@82@01) l@82@01) (img@84@01 l@82@01)))
  :pattern ((Set_in l@82@01 b@2@01))
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) (= (inv@83@01 r) r))
  :pattern ((inv@83@01 r))
  :qid |parent-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@82@01 $Ref)) (!
  (=> (Set_in l@82@01 b@2@01) (not (= l@82@01 $Ref.null)))
  :pattern ((Set_in l@82@01 b@2@01))
  :qid |parent-permImpliesNonNull|)))
(declare-const sm@85@01 $FVF<parent>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@83@01 r) b@2@01)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
  :pattern ((inv@83@01 r))
  :qid |quant-u-36|)))
(declare-const l@86@01 $Ref)
(push) ; 4
; [eval] (l in b)
(assert (Set_in l@86@01 b@2@01))
(pop) ; 4
(declare-fun inv@87@01 ($Ref) $Ref)
(declare-fun img@88@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@86@01 $Ref) (l2@86@01 $Ref)) (!
  (=>
    (and (Set_in l1@86@01 b@2@01) (Set_in l2@86@01 b@2@01) (= l1@86@01 l2@86@01))
    (= l1@86@01 l2@86@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@86@01 $Ref)) (!
  (=>
    (Set_in l@86@01 b@2@01)
    (and (= (inv@87@01 l@86@01) l@86@01) (img@88@01 l@86@01)))
  :pattern ((Set_in l@86@01 b@2@01))
  :qid |quant-u-38|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) (= (inv@87@01 r) r))
  :pattern ((inv@87@01 r))
  :qid |rank-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((l@86@01 $Ref)) (!
  (=> (Set_in l@86@01 b@2@01) (not (= l@86@01 $Ref.null)))
  :pattern ((Set_in l@86@01 b@2@01))
  :qid |rank-permImpliesNonNull|)))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@89@01 $Ref)
(push) ; 4
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 5
; [then-branch: 20 | l@89@01 in b@2@01 | live]
; [else-branch: 20 | !(l@89@01 in b@2@01) | live]
(push) ; 6
; [then-branch: 20 | l@89@01 in b@2@01]
(assert (Set_in l@89@01 b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@90@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@90@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@90@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@90@01  $FPM) r))
  :qid |qp.resTrgDef52|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@90@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@91@01 $FVF<rank>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@91@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@91@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef53|)))
(declare-const pm@92@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@92@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@92@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@92@01  $FPM) r) $Perm.Write)
  :pattern ((inv@87@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] 0 <= l.rank
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@88@01 l@89@01) (Set_in (inv@87@01 l@89@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 20 | !(l@89@01 in b@2@01)]
(assert (not (Set_in l@89@01 b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@93@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@93@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef55|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@93@01  $FPM) r))
  :qid |qp.resTrgDef56|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@93@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
(declare-const sm@94@01 $FVF<rank>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@94@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef57|)))
(declare-const pm@95@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@95@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@95@01  $FPM) r) $Perm.Write)
  :pattern ((inv@87@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@90@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@90@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@90@01  $FPM) r))
  :qid |qp.resTrgDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@91@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@91@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@92@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@92@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (=>
  (Set_in l@89@01 b@2@01)
  (and
    (Set_in l@89@01 b@2@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@90@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@92@01  $FPM) r) $Perm.Write)
      :pattern ((inv@87@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@93@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef55|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@93@01  $FPM) r))
  :qid |qp.resTrgDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@94@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@95@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
(assert (=>
  (not (Set_in l@89@01 b@2@01))
  (and
    (not (Set_in l@89@01 b@2@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@93@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@95@01  $FPM) r) $Perm.Write)
      :pattern ((inv@87@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or (not (Set_in l@89@01 b@2@01)) (Set_in l@89@01 b@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@90@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@90@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@90@01  $FPM) r))
  :qid |qp.resTrgDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@91@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@91@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@92@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@92@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@93@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef55|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@93@01  $FPM) r))
  :qid |qp.resTrgDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@94@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@95@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@89@01 $Ref)) (!
  (and
    (=>
      (Set_in l@89@01 b@2@01)
      (and
        (Set_in l@89@01 b@2@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@90@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@92@01  $FPM) r) $Perm.Write)
          :pattern ((inv@87@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (not (Set_in l@89@01 b@2@01))
      (and
        (not (Set_in l@89@01 b@2@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@93@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@95@01  $FPM) r) $Perm.Write)
          :pattern ((inv@87@01 r))
          :qid |qp-fld-prm-bnd|))))
    (or (not (Set_in l@89@01 b@2@01)) (Set_in l@89@01 b@2@01)))
  :pattern ((Set_in l@89@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|)))
(assert (forall ((l@89@01 $Ref)) (!
  (=>
    (Set_in l@89@01 b@2@01)
    (<= 0 ($FVF.lookup_rank (as sm@91@01  $FVF<rank>) l@89@01)))
  :pattern ((Set_in l@89@01 b@2@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|)))
; [eval] (forall l: Ref :: { l.parent } (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank)
(declare-const l@96@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank
; [eval] (l in b) && l.parent != null
; [eval] (l in b)
(push) ; 5
; [then-branch: 21 | !(l@96@01 in b@2@01) | live]
; [else-branch: 21 | l@96@01 in b@2@01 | live]
(push) ; 6
; [then-branch: 21 | !(l@96@01 in b@2@01)]
(assert (not (Set_in l@96@01 b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@97@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@97@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@97@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@97@01  $FPM) r))
  :qid |qp.resTrgDef60|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@97@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@98@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@98@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@98@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@98@01  $FPM) r) $Perm.Write)
  :pattern ((inv@87@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 21 | l@96@01 in b@2@01]
(assert (Set_in l@96@01 b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@99@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@99@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@99@01  $FPM) r))
  :qid |qp.resTrgDef63|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@100@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@100@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@100@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
  :pattern ((inv@87@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] l.parent != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef49|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef50|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01))
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@84@01 l@96@01) (Set_in (inv@83@01 l@96@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@97@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@97@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@97@01  $FPM) r))
  :qid |qp.resTrgDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@98@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@98@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (=>
  (not (Set_in l@96@01 b@2@01))
  (and
    (not (Set_in l@96@01 b@2@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@97@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@98@01  $FPM) r) $Perm.Write)
      :pattern ((inv@87@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@99@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@99@01  $FPM) r))
  :qid |qp.resTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@100@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@100@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (=>
  (Set_in l@96@01 b@2@01)
  (and
    (Set_in l@96@01 b@2@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
      :pattern ((inv@87@01 r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01))))
(assert (or (Set_in l@96@01 b@2@01) (not (Set_in l@96@01 b@2@01))))
(push) ; 5
; [then-branch: 22 | l@96@01 in b@2@01 && Lookup(parent, sm@85@01, l@96@01) != Null | live]
; [else-branch: 22 | !(l@96@01 in b@2@01 && Lookup(parent, sm@85@01, l@96@01) != Null) | live]
(push) ; 6
; [then-branch: 22 | l@96@01 in b@2@01 && Lookup(parent, sm@85@01, l@96@01) != Null]
(assert (and
  (Set_in l@96@01 b@2@01)
  (not (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
  :pattern ((inv@87@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (l.parent in b) && l.parent.rank > l.rank
; [eval] (l.parent in b)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef49|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef50|))))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01))
(set-option :timeout 0)
(push) ; 7
(assert (not (and (img@84@01 l@96@01) (Set_in (inv@83@01 l@96@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 23 | !(Lookup(parent, sm@85@01, l@96@01) in b@2@01) | live]
; [else-branch: 23 | Lookup(parent, sm@85@01, l@96@01) in b@2@01 | live]
(push) ; 8
; [then-branch: 23 | !(Lookup(parent, sm@85@01, l@96@01) in b@2@01)]
(assert (not (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unsat
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 23 | Lookup(parent, sm@85@01, l@96@01) in b@2@01]
(assert (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field parent
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
; [eval] l.parent.rank > l.rank
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
      (=
        ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
        ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
    :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
    :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
    :qid |qp.fvfValDef49|))
  (forall ((r $Ref)) (!
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
    :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
    :qid |qp.fvfResTrgDef50|))))
(set-option :timeout 0)
(push) ; 9
(assert (not (and (img@84@01 l@96@01) (Set_in (inv@83@01 l@96@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and
  (img@88@01 ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01))
  (Set_in (inv@87@01 ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and (img@88@01 l@96@01) (Set_in (inv@87@01 l@96@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (or
  (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)
  (not (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | !(l@96@01 in b@2@01 && Lookup(parent, sm@85@01, l@96@01) != Null)]
(assert (not
  (and
    (Set_in l@96@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef50|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
  :pattern ((inv@87@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (=>
  (and
    (Set_in l@96@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null)))
  (and
    (Set_in l@96@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
      :pattern ((inv@87@01 r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01)
    (or
      (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)
      (not
        (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01))))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in l@96@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in l@96@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
      :pattern ((inv@87@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in l@96@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null))))
  (and
    (Set_in l@96@01 b@2@01)
    (not (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@97@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@97@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@97@01  $FPM) r))
  :qid |qp.resTrgDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@98@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@98@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@99@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@99@01  $FPM) r))
  :qid |qp.resTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@100@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@100@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef50|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@96@01 $Ref)) (!
  (and
    (=>
      (not (Set_in l@96@01 b@2@01))
      (and
        (not (Set_in l@96@01 b@2@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@97@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@98@01  $FPM) r) $Perm.Write)
          :pattern ((inv@87@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (Set_in l@96@01 b@2@01)
      (and
        (Set_in l@96@01 b@2@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
          :pattern ((inv@87@01 r))
          :qid |qp-fld-prm-bnd|))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01)))
    (or (Set_in l@96@01 b@2@01) (not (Set_in l@96@01 b@2@01)))
    (=>
      (and
        (Set_in l@96@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null)))
      (and
        (Set_in l@96@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
          :pattern ((inv@87@01 r))
          :qid |qp-fld-prm-bnd|))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01)
        (or
          (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)
          (not
            (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)))))
    (=>
      (not
        (and
          (Set_in l@96@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
              $Ref.null))))
      (and
        (not
          (and
            (Set_in l@96@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
                $Ref.null))))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
          :pattern ((inv@87@01 r))
          :qid |qp-fld-prm-bnd|))))
    (or
      (not
        (and
          (Set_in l@96@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
              $Ref.null))))
      (and
        (Set_in l@96@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null)))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|)))
(assert (forall ((l@96@01 $Ref)) (!
  (=>
    (and
      (Set_in l@96@01 b@2@01)
      (not
        (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)
      (>
        ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01))
        ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) l@96@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|)))
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@101@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@101@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@101@01  $FPM) r))
  :qid |qp.resTrgDef66|)))
; Assume upper permission bound for field parent
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_parent (as pm@101@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
  :qid |qp-fld-prm-bnd|)))
; Definitional axioms for snapshot map values
(declare-const pm@102@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@102@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@102@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
; Assume upper permission bound for field rank
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_rank (as pm@102@01  $FPM) r) $Perm.Write)
  :pattern ((inv@87@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 4
(assert (not (and (img@88@01 l@3@01) (Set_in (inv@87@01 l@3@01) b@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=> (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) (= (inv@83@01 r) r))
  :pattern ((inv@83@01 r))
  :qid |parent-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01))
    (=
      ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) (= (inv@87@01 r) r))
  :pattern ((inv@87@01 r))
  :qid |rank-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@90@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@90@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@90@01  $FPM) r))
  :qid |qp.resTrgDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@91@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@91@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@92@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@92@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@93@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef55|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@93@01  $FPM) r))
  :qid |qp.resTrgDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01))
    (=
      ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@94@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@24@01  $FVF<rank>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@95@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef58|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@97@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@97@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@97@01  $FPM) r))
  :qid |qp.resTrgDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@98@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@98@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@99@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@99@01  $FPM) r))
  :qid |qp.resTrgDef63|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@100@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@100@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_parent (as pm@101@01  $FPM) r)
    (ite (and (img@84@01 r) (Set_in (inv@83@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_parent (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r)
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@19@01  $FVF<parent>) r) r))
  :pattern (($FVF.perm_parent (as pm@101@01  $FPM) r))
  :qid |qp.resTrgDef66|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_rank (as pm@102@01  $FPM) r)
    (ite (and (img@88@01 r) (Set_in (inv@87@01 r) b@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_rank (as pm@102@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
(assert (and
  (forall ((l@82@01 $Ref)) (!
    (=>
      (Set_in l@82@01 b@2@01)
      (and (= (inv@83@01 l@82@01) l@82@01) (img@84@01 l@82@01)))
    :pattern ((Set_in l@82@01 b@2@01))
    :qid |quant-u-35|))
  (forall ((l@82@01 $Ref)) (!
    (=> (Set_in l@82@01 b@2@01) (not (= l@82@01 $Ref.null)))
    :pattern ((Set_in l@82@01 b@2@01))
    :qid |parent-permImpliesNonNull|))
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@83@01 r) b@2@01)
      ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
    :pattern ((inv@83@01 r))
    :qid |quant-u-36|))))
(assert (and
  (forall ((l@86@01 $Ref)) (!
    (=>
      (Set_in l@86@01 b@2@01)
      (and (= (inv@87@01 l@86@01) l@86@01) (img@88@01 l@86@01)))
    :pattern ((Set_in l@86@01 b@2@01))
    :qid |quant-u-38|))
  (forall ((l@86@01 $Ref)) (!
    (=> (Set_in l@86@01 b@2@01) (not (= l@86@01 $Ref.null)))
    :pattern ((Set_in l@86@01 b@2@01))
    :qid |rank-permImpliesNonNull|))
  (forall ((l@89@01 $Ref)) (!
    (and
      (=>
        (Set_in l@89@01 b@2@01)
        (and
          (Set_in l@89@01 b@2@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@90@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@92@01  $FPM) r) $Perm.Write)
            :pattern ((inv@87@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (not (Set_in l@89@01 b@2@01))
        (and
          (not (Set_in l@89@01 b@2@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@93@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@95@01  $FPM) r) $Perm.Write)
            :pattern ((inv@87@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or (not (Set_in l@89@01 b@2@01)) (Set_in l@89@01 b@2@01)))
    :pattern ((Set_in l@89@01 b@2@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|))
  (forall ((l@89@01 $Ref)) (!
    (=>
      (Set_in l@89@01 b@2@01)
      (<= 0 ($FVF.lookup_rank (as sm@91@01  $FVF<rank>) l@89@01)))
    :pattern ((Set_in l@89@01 b@2@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|))
  (forall ((l@96@01 $Ref)) (!
    (and
      (=>
        (not (Set_in l@96@01 b@2@01))
        (and
          (not (Set_in l@96@01 b@2@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@97@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@98@01  $FPM) r) $Perm.Write)
            :pattern ((inv@87@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (Set_in l@96@01 b@2@01)
        (and
          (Set_in l@96@01 b@2@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
            :pattern ((inv@87@01 r))
            :qid |qp-fld-prm-bnd|))
          ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01)))
      (or (Set_in l@96@01 b@2@01) (not (Set_in l@96@01 b@2@01)))
      (=>
        (and
          (Set_in l@96@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
              $Ref.null)))
        (and
          (Set_in l@96@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
              $Ref.null))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
            :pattern ((inv@87@01 r))
            :qid |qp-fld-prm-bnd|))
          ($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01)
          (or
            (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)
            (not
              (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)))))
      (=>
        (not
          (and
            (Set_in l@96@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
                $Ref.null))))
        (and
          (not
            (and
              (Set_in l@96@01 b@2@01)
              (not
                (=
                  ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
                  $Ref.null))))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_parent (as pm@99@01  $FPM) r) $Perm.Write)
            :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_rank (as pm@100@01  $FPM) r) $Perm.Write)
            :pattern ((inv@87@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or
        (not
          (and
            (Set_in l@96@01 b@2@01)
            (not
              (=
                ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
                $Ref.null))))
        (and
          (Set_in l@96@01 b@2@01)
          (not
            (=
              ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01)
              $Ref.null)))))
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|))
  (forall ((l@96@01 $Ref)) (!
    (=>
      (and
        (Set_in l@96@01 b@2@01)
        (not
          (= ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) $Ref.null)))
      (and
        (Set_in ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) b@2@01)
        (>
          ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01))
          ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) l@96@01))))
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) l@96@01) l@96@01))
    :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_parent (as pm@101@01  $FPM) r) $Perm.Write)
    :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@85@01  $FVF<parent>) r) r))
    :qid |qp-fld-prm-bnd|))
  (forall ((r $Ref)) (!
    (<= ($FVF.perm_rank (as pm@102@01  $FPM) r) $Perm.Write)
    :pattern ((inv@87@01 r))
    :qid |qp-fld-prm-bnd|))))
(declare-const letvar@103@01 Int)
(assert (= (as letvar@103@01  Int) ($FVF.lookup_rank (as sm@94@01  $FVF<rank>) l@3@01)))
; [eval] n > n
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,08s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- veryBad ----------
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@104@01 $Snap)
(assert (= $t@104@01 $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
; [exec]
; var l: Ref
(declare-const l@105@01 $Ref)
; [exec]
; l := new(parent, rank)
(declare-const l@106@01 $Ref)
(assert (not (= l@106@01 $Ref.null)))
(declare-const parent@107@01 $Ref)
(declare-const sm@108@01 $FVF<parent>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_parent (as sm@108@01  $FVF<parent>) l@106@01) parent@107@01))
(declare-const rank@109@01 Int)
(declare-const sm@110@01 $FVF<rank>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_rank (as sm@110@01  $FVF<rank>) l@106@01) rank@109@01))
(assert (not (= l@106@01 l@105@01)))
; [exec]
; l.parent := null
(declare-const sm@111@01 $FVF<parent>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@106@01)
    (=
      ($FVF.lookup_parent (as sm@111@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@108@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@111@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@108@01  $FVF<parent>) r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@108@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@111@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef69|)))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@111@01  $FVF<parent>) l@106@01) l@106@01))
; Precomputing data for removing quantified permissions
(define-fun pTaken@112@01 ((r $Ref)) $Perm
  (ite
    (= r l@106@01)
    ($Perm.min (ite (= r l@106@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@112@01 l@106@01)) $Perm.No)))
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
  (=> (= r l@106@01) (= (- $Perm.Write (pTaken@112@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@113@01 $FVF<parent>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@106@01) $Ref.null))
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@106@01) l@106@01))
; [exec]
; l.rank := 0
; Precomputing data for removing quantified permissions
(define-fun pTaken@114@01 ((r $Ref)) $Perm
  (ite
    (= r l@106@01)
    ($Perm.min (ite (= r l@106@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@114@01 l@106@01)) $Perm.No)))
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
  (=> (= r l@106@01) (= (- $Perm.Write (pTaken@114@01 r)) $Perm.No))
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@115@01 $FVF<rank>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_rank (as sm@115@01  $FVF<rank>) l@106@01) 0))
; [exec]
; fold acc(uf_bank(Set(l)), write)
; [eval] Set(l)
(declare-const l@116@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@116@01 (Set_singleton l@106@01)))
(pop) ; 3
(declare-fun inv@117@01 ($Ref) $Ref)
(declare-fun img@118@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@119@01 $FVF<parent>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@106@01)
    (=
      ($FVF.lookup_parent (as sm@119@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@119@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@119@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef71|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@116@01 $Ref) (l2@116@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in l1@116@01 (Set_singleton l@106@01))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@119@01  $FVF<parent>) l1@116@01) l1@116@01))
      (and
        (Set_in l2@116@01 (Set_singleton l@106@01))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@119@01  $FVF<parent>) l2@116@01) l2@116@01))
      (= l1@116@01 l2@116@01))
    (= l1@116@01 l2@116@01))
  
  :qid |parent-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@116@01 $Ref)) (!
  (=>
    (Set_in l@116@01 (Set_singleton l@106@01))
    (and (= (inv@117@01 l@116@01) l@116@01) (img@118@01 l@116@01)))
  :pattern ((Set_in l@116@01 (Set_singleton l@106@01)))
  :qid |parent-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@118@01 r) (Set_in (inv@117@01 r) (Set_singleton l@106@01)))
    (= (inv@117@01 r) r))
  :pattern ((inv@117@01 r))
  :qid |parent-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@117@01 r) (Set_singleton l@106@01))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@119@01  $FVF<parent>) r) r))
  :pattern ((inv@117@01 r))
  :qid |quant-u-46|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@117@01 r) (Set_singleton l@106@01))
      (img@118@01 r)
      (= r (inv@117@01 r)))
    ($Perm.min (ite (= r l@106@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@120@01 l@106@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@120@01 r) $Perm.No)
  
  :qid |quant-u-49|))))
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
  (=>
    (and
      (Set_in (inv@117@01 r) (Set_singleton l@106@01))
      (img@118@01 r)
      (= r (inv@117@01 r)))
    (= (- $Perm.Write (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@121@01 $FVF<parent>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_parent (as sm@121@01  $FVF<parent>)))
      (and (Set_in (inv@117@01 r) (Set_singleton l@106@01)) (img@118@01 r)))
    (=>
      (and (Set_in (inv@117@01 r) (Set_singleton l@106@01)) (img@118@01 r))
      (Set_in r ($FVF.domain_parent (as sm@121@01  $FVF<parent>)))))
  :pattern ((Set_in r ($FVF.domain_parent (as sm@121@01  $FVF<parent>))))
  :qid |qp.fvfDomDef74|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@117@01 r) (Set_singleton l@106@01)) (img@118@01 r))
      (= r l@106@01))
    (=
      ($FVF.lookup_parent (as sm@121@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@121@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@121@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef73|)))
(declare-const l@122@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b)
(assert (Set_in l@122@01 (Set_singleton l@106@01)))
(pop) ; 3
(declare-fun inv@123@01 ($Ref) $Ref)
(declare-fun img@124@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((l1@122@01 $Ref) (l2@122@01 $Ref)) (!
  (=>
    (and
      (Set_in l1@122@01 (Set_singleton l@106@01))
      (Set_in l2@122@01 (Set_singleton l@106@01))
      (= l1@122@01 l2@122@01))
    (= l1@122@01 l2@122@01))
  
  :qid |rank-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@122@01 $Ref)) (!
  (=>
    (Set_in l@122@01 (Set_singleton l@106@01))
    (and (= (inv@123@01 l@122@01) l@122@01) (img@124@01 l@122@01)))
  :pattern ((Set_in l@122@01 (Set_singleton l@106@01)))
  :qid |rank-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@124@01 r) (Set_in (inv@123@01 r) (Set_singleton l@106@01)))
    (= (inv@123@01 r) r))
  :pattern ((inv@123@01 r))
  :qid |rank-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@125@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@123@01 r) (Set_singleton l@106@01))
      (img@124@01 r)
      (= r (inv@123@01 r)))
    ($Perm.min (ite (= r l@106@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@125@01 l@106@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@125@01 r) $Perm.No)
  
  :qid |quant-u-54|))))
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
  (=>
    (and
      (Set_in (inv@123@01 r) (Set_singleton l@106@01))
      (img@124@01 r)
      (= r (inv@123@01 r)))
    (= (- $Perm.Write (pTaken@125@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@126@01 $FVF<rank>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_rank (as sm@126@01  $FVF<rank>)))
      (and (Set_in (inv@123@01 r) (Set_singleton l@106@01)) (img@124@01 r)))
    (=>
      (and (Set_in (inv@123@01 r) (Set_singleton l@106@01)) (img@124@01 r))
      (Set_in r ($FVF.domain_rank (as sm@126@01  $FVF<rank>)))))
  :pattern ((Set_in r ($FVF.domain_rank (as sm@126@01  $FVF<rank>))))
  :qid |qp.fvfDomDef76|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@123@01 r) (Set_singleton l@106@01)) (img@124@01 r))
      (= r l@106@01))
    (=
      ($FVF.lookup_rank (as sm@126@01  $FVF<rank>) r)
      ($FVF.lookup_rank (as sm@115@01  $FVF<rank>) r)))
  :pattern (($FVF.lookup_rank (as sm@126@01  $FVF<rank>) r))
  :pattern (($FVF.lookup_rank (as sm@115@01  $FVF<rank>) r))
  :qid |qp.fvfValDef75|)))
; [eval] (forall l: Ref :: { (l in b) } (l in b) ==> 0 <= l.rank)
(declare-const l@127@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in b) ==> 0 <= l.rank
; [eval] (l in b)
(push) ; 4
; [then-branch: 24 | l@127@01 in {l@106@01} | live]
; [else-branch: 24 | !(l@127@01 in {l@106@01}) | live]
(push) ; 5
; [then-branch: 24 | l@127@01 in {l@106@01}]
(assert (Set_in l@127@01 (Set_singleton l@106@01)))
; [eval] 0 <= l.rank
(push) ; 6
(assert (not (= l@127@01 l@106@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 24 | !(l@127@01 in {l@106@01})]
(assert (not (Set_in l@127@01 (Set_singleton l@106@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in l@127@01 (Set_singleton l@106@01)))
  (Set_in l@127@01 (Set_singleton l@106@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@127@01 $Ref)) (!
  (or
    (not (Set_in l@127@01 (Set_singleton l@106@01)))
    (Set_in l@127@01 (Set_singleton l@106@01)))
  :pattern ((Set_in l@127@01 (Set_singleton l@106@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48-aux|)))
(push) ; 3
(assert (not (forall ((l@127@01 $Ref)) (!
  (=>
    (Set_in l@127@01 (Set_singleton l@106@01))
    (<= 0 ($FVF.lookup_rank (as sm@115@01  $FVF<rank>) l@127@01)))
  :pattern ((Set_in l@127@01 (Set_singleton l@106@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((l@127@01 $Ref)) (!
  (=>
    (Set_in l@127@01 (Set_singleton l@106@01))
    (<= 0 ($FVF.lookup_rank (as sm@115@01  $FVF<rank>) l@127@01)))
  :pattern ((Set_in l@127@01 (Set_singleton l@106@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@9@4@10@48|)))
; [eval] (forall l: Ref :: { l.parent } (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank)
(declare-const l@128@01 $Ref)
(push) ; 3
; [eval] (l in b) && l.parent != null ==> (l.parent in b) && l.parent.rank > l.rank
; [eval] (l in b) && l.parent != null
; [eval] (l in b)
(push) ; 4
; [then-branch: 25 | !(l@128@01 in {l@106@01}) | live]
; [else-branch: 25 | l@128@01 in {l@106@01} | live]
(push) ; 5
; [then-branch: 25 | !(l@128@01 in {l@106@01})]
(assert (not (Set_in l@128@01 (Set_singleton l@106@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 25 | l@128@01 in {l@106@01}]
(assert (Set_in l@128@01 (Set_singleton l@106@01)))
; [eval] l.parent != null
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) l@128@01))
(push) ; 6
(assert (not (= l@128@01 l@106@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in l@128@01 (Set_singleton l@106@01))
  (and
    (Set_in l@128@01 (Set_singleton l@106@01))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) l@128@01))))
(assert (or
  (Set_in l@128@01 (Set_singleton l@106@01))
  (not (Set_in l@128@01 (Set_singleton l@106@01)))))
(push) ; 4
; [then-branch: 26 | l@128@01 in {l@106@01} && Lookup(parent, sm@113@01, l@128@01) != Null | live]
; [else-branch: 26 | !(l@128@01 in {l@106@01} && Lookup(parent, sm@113@01, l@128@01) != Null) | live]
(push) ; 5
; [then-branch: 26 | l@128@01 in {l@106@01} && Lookup(parent, sm@113@01, l@128@01) != Null]
(assert (and
  (Set_in l@128@01 (Set_singleton l@106@01))
  (not (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) $Ref.null))))
; [eval] (l.parent in b) && l.parent.rank > l.rank
; [eval] (l.parent in b)
(assert ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) l@128@01))
(push) ; 6
(assert (not (= l@128@01 l@106@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 27 | !(Lookup(parent, sm@113@01, l@128@01) in {l@106@01}) | live]
; [else-branch: 27 | Lookup(parent, sm@113@01, l@128@01) in {l@106@01} | live]
(push) ; 7
; [then-branch: 27 | !(Lookup(parent, sm@113@01, l@128@01) in {l@106@01})]
(assert (not
  (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 27 | Lookup(parent, sm@113@01, l@128@01) in {l@106@01}]
(assert (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01)))
; [eval] l.parent.rank > l.rank
(push) ; 8
(assert (not (= l@128@01 l@106@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) l@106@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (= l@128@01 l@106@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01))
  (not
    (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01)))))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(l@128@01 in {l@106@01} && Lookup(parent, sm@113@01, l@128@01) != Null)]
(assert (not
  (and
    (Set_in l@128@01 (Set_singleton l@106@01))
    (not
      (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Set_in l@128@01 (Set_singleton l@106@01))
    (not
      (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) $Ref.null)))
  (and
    (Set_in l@128@01 (Set_singleton l@106@01))
    (not
      (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) $Ref.null))
    ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) l@128@01)
    (or
      (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01))
      (not
        (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01)))))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in l@128@01 (Set_singleton l@106@01))
      (not
        (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) $Ref.null))))
  (and
    (Set_in l@128@01 (Set_singleton l@106@01))
    (not
      (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) $Ref.null)))))
(declare-const sm@129@01 $FVF<parent>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@106@01)
    (=
      ($FVF.lookup_parent (as sm@129@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@129@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@129@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef78|)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r l@106@01)
    (=
      ($FVF.lookup_parent (as sm@129@01  $FVF<parent>) r)
      ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r)))
  :pattern (($FVF.lookup_parent (as sm@129@01  $FVF<parent>) r))
  :pattern (($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r))
  :qid |qp.fvfValDef77|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) r) r)
  :pattern (($FVF.lookup_parent (as sm@129@01  $FVF<parent>) r))
  :qid |qp.fvfResTrgDef78|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@128@01 $Ref)) (!
  (and
    (=>
      (Set_in l@128@01 (Set_singleton l@106@01))
      (and
        (Set_in l@128@01 (Set_singleton l@106@01))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) l@128@01)))
    (or
      (Set_in l@128@01 (Set_singleton l@106@01))
      (not (Set_in l@128@01 (Set_singleton l@106@01))))
    (=>
      (and
        (Set_in l@128@01 (Set_singleton l@106@01))
        (not
          (=
            ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01)
            $Ref.null)))
      (and
        (Set_in l@128@01 (Set_singleton l@106@01))
        (not
          (=
            ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01)
            $Ref.null))
        ($FVF.loc_parent ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) l@128@01)
        (or
          (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01))
          (not
            (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01))))))
    (or
      (not
        (and
          (Set_in l@128@01 (Set_singleton l@106@01))
          (not
            (=
              ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01)
              $Ref.null))))
      (and
        (Set_in l@128@01 (Set_singleton l@106@01))
        (not
          (=
            ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01)
            $Ref.null)))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@129@01  $FVF<parent>) l@128@01) l@128@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44-aux|)))
(push) ; 3
(assert (not (forall ((l@128@01 $Ref)) (!
  (=>
    (and
      (Set_in l@128@01 (Set_singleton l@106@01))
      (not
        (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01))
      (>
        ($FVF.lookup_rank (as sm@115@01  $FVF<rank>) ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01))
        ($FVF.lookup_rank (as sm@115@01  $FVF<rank>) l@128@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@129@01  $FVF<parent>) l@128@01) l@128@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((l@128@01 $Ref)) (!
  (=>
    (and
      (Set_in l@128@01 (Set_singleton l@106@01))
      (not
        (= ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) $Ref.null)))
    (and
      (Set_in ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01) (Set_singleton l@106@01))
      (>
        ($FVF.lookup_rank (as sm@115@01  $FVF<rank>) ($FVF.lookup_parent (as sm@113@01  $FVF<parent>) l@128@01))
        ($FVF.lookup_rank (as sm@115@01  $FVF<rank>) l@128@01))))
  :pattern (($FVF.loc_parent ($FVF.lookup_parent (as sm@129@01  $FVF<parent>) l@128@01) l@128@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0336b.vpr@11@4@12@44|)))
(assert (uf_bank%trigger ($Snap.combine
  ($SortWrappers.$FVF<parent>To$Snap (as sm@121@01  $FVF<parent>))
  ($Snap.combine
    ($SortWrappers.$FVF<rank>To$Snap (as sm@126@01  $FVF<rank>))
    ($Snap.combine $Snap.unit $Snap.unit))) (Set_singleton l@106@01)))
; [exec]
; bad(Set(l), l)
; [eval] Set(l)
; [eval] (l in b)
(push) ; 3
(assert (not (Set_in l@106@01 (Set_singleton l@106@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in l@106@01 (Set_singleton l@106@01)))
(declare-const $t@130@01 $Snap)
(assert (= $t@130@01 $Snap.unit))
(assert false)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unsat
(pop) ; 2
(pop) ; 1
