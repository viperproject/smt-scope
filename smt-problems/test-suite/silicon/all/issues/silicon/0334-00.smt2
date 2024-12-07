(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:55:21
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0334.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<left> 0)
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
; ////////// Symbols
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
; /field_value_functions_declarations.smt2 [left: Ref]
(declare-fun $FVF.domain_left ($FVF<left>) Set<$Ref>)
(declare-fun $FVF.lookup_left ($FVF<left> $Ref) $Ref)
(declare-fun $FVF.after_left ($FVF<left> $FVF<left>) Bool)
(declare-fun $FVF.loc_left ($Ref $Ref) Bool)
(declare-fun $FVF.perm_left ($FPM $Ref) $Perm)
(declare-const $fvfTOP_left $FVF<left>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun tree_size_fix ($Snap $Ref Int Int) Int)
(declare-fun tree_size_fix%limited ($Snap $Ref Int Int) Int)
(declare-fun tree_size_fix%stateless ($Ref Int Int) Bool)
(declare-fun tree_size_fix%precondition ($Snap $Ref Int Int) Bool)
(declare-fun tree_size ($Snap $Ref) Int)
(declare-fun tree_size%limited ($Snap $Ref) Int)
(declare-fun tree_size%stateless ($Ref) Bool)
(declare-fun tree_size%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun BTree%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@6@00 ($Snap $Ref Int Int) Int)
(declare-fun joined_unfolding@7@00 ($Snap $Ref) Int)
(assert (forall ((s@$ $Snap) (tree@0@00 $Ref) (i@1@00 Int) (b@2@00 Int)) (!
  (=
    (tree_size_fix%limited s@$ tree@0@00 i@1@00 b@2@00)
    (tree_size_fix s@$ tree@0@00 i@1@00 b@2@00))
  :pattern ((tree_size_fix s@$ tree@0@00 i@1@00 b@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (tree@0@00 $Ref) (i@1@00 Int) (b@2@00 Int)) (!
  (tree_size_fix%stateless tree@0@00 i@1@00 b@2@00)
  :pattern ((tree_size_fix%limited s@$ tree@0@00 i@1@00 b@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (tree@0@00 $Ref) (i@1@00 Int) (b@2@00 Int)) (!
  (=>
    (tree_size_fix%precondition s@$ tree@0@00 i@1@00 b@2@00)
    (=
      (tree_size_fix s@$ tree@0@00 i@1@00 b@2@00)
      (ite
        (= tree@0@00 $Ref.null)
        0
        (+
          (+
            1
            (tree_size_fix%limited (ite
              (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
              ($Snap.first ($Snap.second s@$))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) i@1@00 b@2@00))
          (tree_size_fix%limited (ite
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
                $Ref.null))
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) i@1@00 b@2@00)))))
  :pattern ((tree_size_fix s@$ tree@0@00 i@1@00 b@2@00))
  :pattern ((tree_size_fix%stateless tree@0@00 i@1@00 b@2@00) (BTree%trigger s@$ tree@0@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (tree@0@00 $Ref) (i@1@00 Int) (b@2@00 Int)) (!
  (=>
    (tree_size_fix%precondition s@$ tree@0@00 i@1@00 b@2@00)
    (ite
      (= tree@0@00 $Ref.null)
      true
      (and
        (tree_size_fix%precondition (ite
          (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
          ($Snap.first ($Snap.second s@$))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) i@1@00 b@2@00)
        (tree_size_fix%precondition (ite
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
              $Ref.null))
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))) i@1@00 b@2@00))))
  :pattern ((tree_size_fix s@$ tree@0@00 i@1@00 b@2@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (tree@4@00 $Ref)) (!
  (= (tree_size%limited s@$ tree@4@00) (tree_size s@$ tree@4@00))
  :pattern ((tree_size s@$ tree@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (tree@4@00 $Ref)) (!
  (tree_size%stateless tree@4@00)
  :pattern ((tree_size%limited s@$ tree@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (tree@4@00 $Ref)) (!
  (=>
    (tree_size%precondition s@$ tree@4@00)
    (=
      (tree_size s@$ tree@4@00)
      (ite
        (= tree@4@00 $Ref.null)
        0
        (+
          (+
            1
            (tree_size%limited (ite
              (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
              ($Snap.first ($Snap.second s@$))
              $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
          (tree_size%limited (ite
            (not
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
                $Ref.null))
            ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
            $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((tree_size s@$ tree@4@00))
  :pattern ((tree_size%stateless tree@4@00) (BTree%trigger s@$ tree@4@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (tree@4@00 $Ref)) (!
  (=>
    (tree_size%precondition s@$ tree@4@00)
    (ite
      (= tree@4@00 $Ref.null)
      true
      (and
        (tree_size%precondition (ite
          (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)) $Ref.null))
          ($Snap.first ($Snap.second s@$))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$)))
        (tree_size%precondition (ite
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
              $Ref.null))
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
          $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))))
  :pattern ((tree_size s@$ tree@4@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- toArray ----------
(declare-const tree@0@01 $Ref)
(declare-const tree@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] tree != null
(assert (not (= tree@1@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(BTree(tree), write)
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))
; [eval] self.left != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 0 | First:(Second:($t@2@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:($t@2@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@2@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))))
; [eval] self.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(Second:(Second:(Second:($t@2@01)))) != Null | live]
; [else-branch: 1 | First:(Second:(Second:(Second:($t@2@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | First:(Second:(Second:(Second:($t@2@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (BTree%trigger ($Snap.second $t@2@01) tree@1@01))
; [exec]
; assert (forall i: Int, b: Int ::tree_size(tree.left) < i && i < b ==>
;     tree_size(tree.left) + 1 < b)
; [eval] (forall i: Int, b: Int ::tree_size(tree.left) < i && i < b ==> tree_size(tree.left) + 1 < b)
(declare-const i@3@01 Int)
(declare-const b@4@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] tree_size(tree.left) < i && i < b ==> tree_size(tree.left) + 1 < b
; [eval] tree_size(tree.left) < i && i < b
; [eval] tree_size(tree.left) < i
; [eval] tree_size(tree.left)
(push) ; 6
; [eval] tree != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 2 | First:(Second:($t@2@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 2 | First:(Second:($t@2@01)) != Null]
(assert (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))
      $Ref.null))
  (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(push) ; 6
; [then-branch: 3 | !(tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@3@01) | live]
; [else-branch: 3 | tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@3@01 | live]
(push) ; 7
; [then-branch: 3 | !(tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@3@01)]
(assert (not
  (<
    (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@3@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@3@01]
(assert (<
  (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
  i@3@01))
; [eval] i < b
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@3@01)
  (not
    (<
      (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@3@01))))
(push) ; 6
; [then-branch: 4 | tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@3@01 && i@3@01 < b@4@01 | live]
; [else-branch: 4 | !(tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@3@01 && i@3@01 < b@4@01) | live]
(push) ; 7
; [then-branch: 4 | tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@3@01 && i@3@01 < b@4@01]
(assert (and
  (<
    (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@3@01)
  (< i@3@01 b@4@01)))
; [eval] tree_size(tree.left) + 1 < b
; [eval] tree_size(tree.left) + 1
; [eval] tree_size(tree.left)
(push) ; 8
; [eval] tree != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 5 | First:(Second:($t@2@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 5 | First:(Second:($t@2@01)) != Null]
(assert (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 4 | !(tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@3@01 && i@3@01 < b@4@01)]
(assert (not
  (and
    (<
      (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@3@01)
    (< i@3@01 b@4@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        i@3@01)
      (< i@3@01 b@4@01)))
  (and
    (<
      (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@3@01)
    (< i@3@01 b@4@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))
      $Ref.null))
  (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int) (b@4@01 Int)) (!
  (and
    (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    (=>
      (and
        (<
          (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
          i@3@01)
        (< i@3@01 b@4@01))
      (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77_precondition|)))
(push) ; 5
(assert (not (forall ((i@3@01 Int) (b@4@01 Int)) (!
  (=>
    (and
      (and
        (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        (=>
          (and
            (<
              (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
              i@3@01)
            (< i@3@01 b@4@01))
          (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
      (and
        (<
          (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
          i@3@01)
        (< i@3@01 b@4@01)))
    (<
      (+
        (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        1)
      b@4@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@3@01 Int) (b@4@01 Int)) (!
  (=>
    (and
      (<
        (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        i@3@01)
      (< i@3@01 b@4@01))
    (<
      (+
        (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        1)
      b@4@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77|)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | First:(Second:(Second:(Second:($t@2@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (BTree%trigger ($Snap.second $t@2@01) tree@1@01))
; [exec]
; assert (forall i: Int, b: Int ::tree_size(tree.left) < i && i < b ==>
;     tree_size(tree.left) + 1 < b)
; [eval] (forall i: Int, b: Int ::tree_size(tree.left) < i && i < b ==> tree_size(tree.left) + 1 < b)
(declare-const i@5@01 Int)
(declare-const b@6@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] tree_size(tree.left) < i && i < b ==> tree_size(tree.left) + 1 < b
; [eval] tree_size(tree.left) < i && i < b
; [eval] tree_size(tree.left) < i
; [eval] tree_size(tree.left)
(push) ; 6
; [eval] tree != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 6 | First:(Second:($t@2@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 6 | First:(Second:($t@2@01)) != Null]
(assert (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))
      $Ref.null))
  (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(push) ; 6
; [then-branch: 7 | !(tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@5@01) | live]
; [else-branch: 7 | tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@5@01 | live]
(push) ; 7
; [then-branch: 7 | !(tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@5@01)]
(assert (not
  (<
    (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@5@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@5@01]
(assert (<
  (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
  i@5@01))
; [eval] i < b
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@5@01)
  (not
    (<
      (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@5@01))))
(push) ; 6
; [then-branch: 8 | tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@5@01 && i@5@01 < b@6@01 | live]
; [else-branch: 8 | !(tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@5@01 && i@5@01 < b@6@01) | live]
(push) ; 7
; [then-branch: 8 | tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@5@01 && i@5@01 < b@6@01]
(assert (and
  (<
    (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@5@01)
  (< i@5@01 b@6@01)))
; [eval] tree_size(tree.left) + 1 < b
; [eval] tree_size(tree.left) + 1
; [eval] tree_size(tree.left)
(push) ; 8
; [eval] tree != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:($t@2@01)) != Null | live]
; [else-branch: 9 | First:(Second:($t@2@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 9 | First:(Second:($t@2@01)) != Null]
(assert (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 8 | !(tree_size(First:(Second:(Second:($t@2@01))), First:(Second:($t@2@01))) < i@5@01 && i@5@01 < b@6@01)]
(assert (not
  (and
    (<
      (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@5@01)
    (< i@5@01 b@6@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        i@5@01)
      (< i@5@01 b@6@01)))
  (and
    (<
      (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@5@01)
    (< i@5@01 b@6@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))
      $Ref.null))
  (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@5@01 Int) (b@6@01 Int)) (!
  (and
    (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    (=>
      (and
        (<
          (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
          i@5@01)
        (< i@5@01 b@6@01))
      (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77_precondition|)))
(push) ; 5
(assert (not (forall ((i@5@01 Int) (b@6@01 Int)) (!
  (=>
    (and
      (and
        (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        (=>
          (and
            (<
              (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
              i@5@01)
            (< i@5@01 b@6@01))
          (tree_size%precondition ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
      (and
        (<
          (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
          i@5@01)
        (< i@5@01 b@6@01)))
    (<
      (+
        (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        1)
      b@6@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@5@01 Int) (b@6@01 Int)) (!
  (=>
    (and
      (<
        (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        i@5@01)
      (< i@5@01 b@6@01))
    (<
      (+
        (tree_size ($Snap.first ($Snap.second ($Snap.second $t@2@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        1)
      b@6@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(Second:($t@2@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@2@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@2@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))))
; [eval] self.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:(Second:(Second:($t@2@01)))) != Null | live]
; [else-branch: 10 | First:(Second:(Second:(Second:($t@2@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 10 | First:(Second:(Second:(Second:($t@2@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (BTree%trigger ($Snap.second $t@2@01) tree@1@01))
; [exec]
; assert (forall i: Int, b: Int ::tree_size(tree.left) < i && i < b ==>
;     tree_size(tree.left) + 1 < b)
; [eval] (forall i: Int, b: Int ::tree_size(tree.left) < i && i < b ==> tree_size(tree.left) + 1 < b)
(declare-const i@7@01 Int)
(declare-const b@8@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] tree_size(tree.left) < i && i < b ==> tree_size(tree.left) + 1 < b
; [eval] tree_size(tree.left) < i && i < b
; [eval] tree_size(tree.left) < i
; [eval] tree_size(tree.left)
(push) ; 6
; [eval] tree != null
; [then-branch: 11 | First:(Second:($t@2@01)) != Null | dead]
; [else-branch: 11 | First:(Second:($t@2@01)) == Null | live]
(push) ; 7
; [else-branch: 11 | First:(Second:($t@2@01)) == Null]
(assert (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)
  (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(push) ; 6
; [then-branch: 12 | !(tree_size(_, First:(Second:($t@2@01))) < i@7@01) | live]
; [else-branch: 12 | tree_size(_, First:(Second:($t@2@01))) < i@7@01 | live]
(push) ; 7
; [then-branch: 12 | !(tree_size(_, First:(Second:($t@2@01))) < i@7@01)]
(assert (not
  (<
    (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@7@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 12 | tree_size(_, First:(Second:($t@2@01))) < i@7@01]
(assert (<
  (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
  i@7@01))
; [eval] i < b
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@7@01)
  (not
    (<
      (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@7@01))))
(push) ; 6
; [then-branch: 13 | tree_size(_, First:(Second:($t@2@01))) < i@7@01 && i@7@01 < b@8@01 | live]
; [else-branch: 13 | !(tree_size(_, First:(Second:($t@2@01))) < i@7@01 && i@7@01 < b@8@01) | live]
(push) ; 7
; [then-branch: 13 | tree_size(_, First:(Second:($t@2@01))) < i@7@01 && i@7@01 < b@8@01]
(assert (and
  (<
    (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@7@01)
  (< i@7@01 b@8@01)))
; [eval] tree_size(tree.left) + 1 < b
; [eval] tree_size(tree.left) + 1
; [eval] tree_size(tree.left)
(push) ; 8
; [eval] tree != null
; [then-branch: 14 | First:(Second:($t@2@01)) != Null | dead]
; [else-branch: 14 | First:(Second:($t@2@01)) == Null | live]
(push) ; 9
; [else-branch: 14 | First:(Second:($t@2@01)) == Null]
(assert (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 13 | !(tree_size(_, First:(Second:($t@2@01))) < i@7@01 && i@7@01 < b@8@01)]
(assert (not
  (and
    (<
      (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@7@01)
    (< i@7@01 b@8@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        i@7@01)
      (< i@7@01 b@8@01)))
  (and
    (<
      (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@7@01)
    (< i@7@01 b@8@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)
  (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int) (b@8@01 Int)) (!
  (and
    (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    (=>
      (and
        (<
          (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
          i@7@01)
        (< i@7@01 b@8@01))
      (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77_precondition|)))
(push) ; 5
(assert (not (forall ((i@7@01 Int) (b@8@01 Int)) (!
  (=>
    (and
      (and
        (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        (=>
          (and
            (<
              (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
              i@7@01)
            (< i@7@01 b@8@01))
          (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
      (and
        (<
          (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
          i@7@01)
        (< i@7@01 b@8@01)))
    (<
      (+
        (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        1)
      b@8@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@7@01 Int) (b@8@01 Int)) (!
  (=>
    (and
      (<
        (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        i@7@01)
      (< i@7@01 b@8@01))
    (<
      (+
        (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        1)
      b@8@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77|)))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | First:(Second:(Second:(Second:($t@2@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (BTree%trigger ($Snap.second $t@2@01) tree@1@01))
; [exec]
; assert (forall i: Int, b: Int ::tree_size(tree.left) < i && i < b ==>
;     tree_size(tree.left) + 1 < b)
; [eval] (forall i: Int, b: Int ::tree_size(tree.left) < i && i < b ==> tree_size(tree.left) + 1 < b)
(declare-const i@9@01 Int)
(declare-const b@10@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] tree_size(tree.left) < i && i < b ==> tree_size(tree.left) + 1 < b
; [eval] tree_size(tree.left) < i && i < b
; [eval] tree_size(tree.left) < i
; [eval] tree_size(tree.left)
(push) ; 6
; [eval] tree != null
; [then-branch: 15 | First:(Second:($t@2@01)) != Null | dead]
; [else-branch: 15 | First:(Second:($t@2@01)) == Null | live]
(push) ; 7
; [else-branch: 15 | First:(Second:($t@2@01)) == Null]
(assert (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)
  (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
(push) ; 6
; [then-branch: 16 | !(tree_size(_, First:(Second:($t@2@01))) < i@9@01) | live]
; [else-branch: 16 | tree_size(_, First:(Second:($t@2@01))) < i@9@01 | live]
(push) ; 7
; [then-branch: 16 | !(tree_size(_, First:(Second:($t@2@01))) < i@9@01)]
(assert (not
  (<
    (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@9@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 16 | tree_size(_, First:(Second:($t@2@01))) < i@9@01]
(assert (<
  (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
  i@9@01))
; [eval] i < b
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@9@01)
  (not
    (<
      (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@9@01))))
(push) ; 6
; [then-branch: 17 | tree_size(_, First:(Second:($t@2@01))) < i@9@01 && i@9@01 < b@10@01 | live]
; [else-branch: 17 | !(tree_size(_, First:(Second:($t@2@01))) < i@9@01 && i@9@01 < b@10@01) | live]
(push) ; 7
; [then-branch: 17 | tree_size(_, First:(Second:($t@2@01))) < i@9@01 && i@9@01 < b@10@01]
(assert (and
  (<
    (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    i@9@01)
  (< i@9@01 b@10@01)))
; [eval] tree_size(tree.left) + 1 < b
; [eval] tree_size(tree.left) + 1
; [eval] tree_size(tree.left)
(push) ; 8
; [eval] tree != null
; [then-branch: 18 | First:(Second:($t@2@01)) != Null | dead]
; [else-branch: 18 | First:(Second:($t@2@01)) == Null | live]
(push) ; 9
; [else-branch: 18 | First:(Second:($t@2@01)) == Null]
(assert (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 17 | !(tree_size(_, First:(Second:($t@2@01))) < i@9@01 && i@9@01 < b@10@01)]
(assert (not
  (and
    (<
      (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@9@01)
    (< i@9@01 b@10@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        i@9@01)
      (< i@9@01 b@10@01)))
  (and
    (<
      (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
      i@9@01)
    (< i@9@01 b@10@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))) $Ref.null)
  (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@01 Int) (b@10@01 Int)) (!
  (and
    (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
    (=>
      (and
        (<
          (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
          i@9@01)
        (< i@9@01 b@10@01))
      (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77_precondition|)))
(push) ; 5
(assert (not (forall ((i@9@01 Int) (b@10@01 Int)) (!
  (=>
    (and
      (and
        (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        (=>
          (and
            (<
              (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
              i@9@01)
            (< i@9@01 b@10@01))
          (tree_size%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))))
      (and
        (<
          (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
          i@9@01)
        (< i@9@01 b@10@01)))
    (<
      (+
        (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        1)
      b@10@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@9@01 Int) (b@10@01 Int)) (!
  (=>
    (and
      (<
        (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        i@9@01)
      (< i@9@01 b@10@01))
    (<
      (+
        (tree_size $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@2@01))))
        1)
      b@10@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@29@5@30@77|)))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- toArray_fix ----------
(declare-const tree@11@01 $Ref)
(declare-const tree@12@01 $Ref)
(push) ; 1
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 ($Snap.combine ($Snap.first $t@13@01) ($Snap.second $t@13@01))))
(assert (= ($Snap.first $t@13@01) $Snap.unit))
; [eval] tree != null
(assert (not (= tree@12@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(BTree(tree), write)
(assert (=
  ($Snap.second $t@13@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@13@01))
    ($Snap.second ($Snap.second $t@13@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@13@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@13@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@13@01))))))
; [eval] self.left != null
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:($t@13@01)) != Null | live]
; [else-branch: 19 | First:(Second:($t@13@01)) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 19 | First:(Second:($t@13@01)) != Null]
(assert (not
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@13@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01))))))))
; [eval] self.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | First:(Second:(Second:(Second:($t@13@01)))) != Null | live]
; [else-branch: 20 | First:(Second:(Second:(Second:($t@13@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 20 | First:(Second:(Second:(Second:($t@13@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
    $Ref.null)))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (BTree%trigger ($Snap.second $t@13@01) tree@12@01))
; [exec]
; assert (forall i: Int, b: Int ::
;     { tree_size_fix(tree.left, i, b) }
;     tree_size_fix(tree.left, i, b) < i && i < b ==>
;     tree_size_fix(tree.left, i, b) + 1 < b)
; [eval] (forall i: Int, b: Int :: { tree_size_fix(tree.left, i, b) } tree_size_fix(tree.left, i, b) < i && i < b ==> tree_size_fix(tree.left, i, b) + 1 < b)
(declare-const i@14@01 Int)
(declare-const b@15@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] tree_size_fix(tree.left, i, b) < i && i < b ==> tree_size_fix(tree.left, i, b) + 1 < b
; [eval] tree_size_fix(tree.left, i, b) < i && i < b
; [eval] tree_size_fix(tree.left, i, b) < i
; [eval] tree_size_fix(tree.left, i, b)
(push) ; 6
; [eval] tree != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | First:(Second:($t@13@01)) != Null | live]
; [else-branch: 21 | First:(Second:($t@13@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 21 | First:(Second:($t@13@01)) != Null]
(assert (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
      $Ref.null))
  (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)))
(push) ; 6
; [then-branch: 22 | !(tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@14@01, b@15@01) < i@14@01) | live]
; [else-branch: 22 | tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@14@01, b@15@01) < i@14@01 | live]
(push) ; 7
; [then-branch: 22 | !(tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@14@01, b@15@01) < i@14@01)]
(assert (not
  (<
    (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
    i@14@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@14@01, b@15@01) < i@14@01]
(assert (<
  (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
  i@14@01))
; [eval] i < b
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
    i@14@01)
  (not
    (<
      (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
      i@14@01))))
(push) ; 6
; [then-branch: 23 | tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@14@01, b@15@01) < i@14@01 && i@14@01 < b@15@01 | live]
; [else-branch: 23 | !(tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@14@01, b@15@01) < i@14@01 && i@14@01 < b@15@01) | live]
(push) ; 7
; [then-branch: 23 | tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@14@01, b@15@01) < i@14@01 && i@14@01 < b@15@01]
(assert (and
  (<
    (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
    i@14@01)
  (< i@14@01 b@15@01)))
; [eval] tree_size_fix(tree.left, i, b) + 1 < b
; [eval] tree_size_fix(tree.left, i, b) + 1
; [eval] tree_size_fix(tree.left, i, b)
(push) ; 8
; [eval] tree != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | First:(Second:($t@13@01)) != Null | live]
; [else-branch: 24 | First:(Second:($t@13@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 24 | First:(Second:($t@13@01)) != Null]
(assert (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 23 | !(tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@14@01, b@15@01) < i@14@01 && i@14@01 < b@15@01)]
(assert (not
  (and
    (<
      (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
      i@14@01)
    (< i@14@01 b@15@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
        i@14@01)
      (< i@14@01 b@15@01)))
  (and
    (<
      (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
      i@14@01)
    (< i@14@01 b@15@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@01 Int) (b@15@01 Int)) (!
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
          $Ref.null))
      (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01))
    (or
      (<
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
        i@14@01)
      (not
        (<
          (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
          i@14@01)))
    (or
      (not
        (and
          (<
            (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
            i@14@01)
          (< i@14@01 b@15@01)))
      (and
        (<
          (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
          i@14@01)
        (< i@14@01 b@15@01))))
  :pattern ((tree_size_fix%limited ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97-aux|)))
(assert (forall ((i@14@01 Int) (b@15@01 Int)) (!
  (and
    (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
    (=>
      (and
        (<
          (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
          i@14@01)
        (< i@14@01 b@15@01))
      (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)))
  :pattern ((tree_size_fix%limited ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97_precondition|)))
(push) ; 5
(assert (not (forall ((i@14@01 Int) (b@15@01 Int)) (!
  (=>
    (and
      (and
        (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
        (=>
          (and
            (<
              (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
              i@14@01)
            (< i@14@01 b@15@01))
          (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)))
      (and
        (<
          (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
          i@14@01)
        (< i@14@01 b@15@01)))
    (<
      (+
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
        1)
      b@15@01))
  :pattern ((tree_size_fix%limited ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@14@01 Int) (b@15@01 Int)) (!
  (=>
    (and
      (<
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
        i@14@01)
      (< i@14@01 b@15@01))
    (<
      (+
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01)
        1)
      b@15@01))
  :pattern ((tree_size_fix%limited ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@14@01 b@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97|)))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | First:(Second:(Second:(Second:($t@13@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (BTree%trigger ($Snap.second $t@13@01) tree@12@01))
; [exec]
; assert (forall i: Int, b: Int ::
;     { tree_size_fix(tree.left, i, b) }
;     tree_size_fix(tree.left, i, b) < i && i < b ==>
;     tree_size_fix(tree.left, i, b) + 1 < b)
; [eval] (forall i: Int, b: Int :: { tree_size_fix(tree.left, i, b) } tree_size_fix(tree.left, i, b) < i && i < b ==> tree_size_fix(tree.left, i, b) + 1 < b)
(declare-const i@16@01 Int)
(declare-const b@17@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] tree_size_fix(tree.left, i, b) < i && i < b ==> tree_size_fix(tree.left, i, b) + 1 < b
; [eval] tree_size_fix(tree.left, i, b) < i && i < b
; [eval] tree_size_fix(tree.left, i, b) < i
; [eval] tree_size_fix(tree.left, i, b)
(push) ; 6
; [eval] tree != null
(push) ; 7
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | First:(Second:($t@13@01)) != Null | live]
; [else-branch: 25 | First:(Second:($t@13@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 25 | First:(Second:($t@13@01)) != Null]
(assert (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
      $Ref.null))
  (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)))
(push) ; 6
; [then-branch: 26 | !(tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@16@01, b@17@01) < i@16@01) | live]
; [else-branch: 26 | tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@16@01, b@17@01) < i@16@01 | live]
(push) ; 7
; [then-branch: 26 | !(tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@16@01, b@17@01) < i@16@01)]
(assert (not
  (<
    (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
    i@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@16@01, b@17@01) < i@16@01]
(assert (<
  (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
  i@16@01))
; [eval] i < b
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
    i@16@01)
  (not
    (<
      (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
      i@16@01))))
(push) ; 6
; [then-branch: 27 | tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@16@01, b@17@01) < i@16@01 && i@16@01 < b@17@01 | live]
; [else-branch: 27 | !(tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@16@01, b@17@01) < i@16@01 && i@16@01 < b@17@01) | live]
(push) ; 7
; [then-branch: 27 | tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@16@01, b@17@01) < i@16@01 && i@16@01 < b@17@01]
(assert (and
  (<
    (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
    i@16@01)
  (< i@16@01 b@17@01)))
; [eval] tree_size_fix(tree.left, i, b) + 1 < b
; [eval] tree_size_fix(tree.left, i, b) + 1
; [eval] tree_size_fix(tree.left, i, b)
(push) ; 8
; [eval] tree != null
(push) ; 9
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | First:(Second:($t@13@01)) != Null | live]
; [else-branch: 28 | First:(Second:($t@13@01)) == Null | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 28 | First:(Second:($t@13@01)) != Null]
(assert (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 27 | !(tree_size_fix(First:(Second:(Second:($t@13@01))), First:(Second:($t@13@01)), i@16@01, b@17@01) < i@16@01 && i@16@01 < b@17@01)]
(assert (not
  (and
    (<
      (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
      i@16@01)
    (< i@16@01 b@17@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
        i@16@01)
      (< i@16@01 b@17@01)))
  (and
    (<
      (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
      i@16@01)
    (< i@16@01 b@17@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@16@01 Int) (b@17@01 Int)) (!
  (and
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
          $Ref.null))
      (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01))
    (or
      (<
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
        i@16@01)
      (not
        (<
          (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
          i@16@01)))
    (or
      (not
        (and
          (<
            (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
            i@16@01)
          (< i@16@01 b@17@01)))
      (and
        (<
          (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
          i@16@01)
        (< i@16@01 b@17@01))))
  :pattern ((tree_size_fix%limited ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97-aux|)))
(assert (forall ((i@16@01 Int) (b@17@01 Int)) (!
  (and
    (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
    (=>
      (and
        (<
          (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
          i@16@01)
        (< i@16@01 b@17@01))
      (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)))
  :pattern ((tree_size_fix%limited ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97_precondition|)))
(push) ; 5
(assert (not (forall ((i@16@01 Int) (b@17@01 Int)) (!
  (=>
    (and
      (and
        (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
        (=>
          (and
            (<
              (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
              i@16@01)
            (< i@16@01 b@17@01))
          (tree_size_fix%precondition ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)))
      (and
        (<
          (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
          i@16@01)
        (< i@16@01 b@17@01)))
    (<
      (+
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
        1)
      b@17@01))
  :pattern ((tree_size_fix%limited ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@16@01 Int) (b@17@01 Int)) (!
  (=>
    (and
      (<
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
        i@16@01)
      (< i@16@01 b@17@01))
    (<
      (+
        (tree_size_fix ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01)
        1)
      b@17@01))
  :pattern ((tree_size_fix%limited ($Snap.first ($Snap.second ($Snap.second $t@13@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@16@01 b@17@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97|)))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 19 | First:(Second:($t@13@01)) == Null]
(assert (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@13@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@13@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01))))))))
; [eval] self.right != null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | First:(Second:(Second:(Second:($t@13@01)))) != Null | live]
; [else-branch: 29 | First:(Second:(Second:(Second:($t@13@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 29 | First:(Second:(Second:(Second:($t@13@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
    $Ref.null)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (BTree%trigger ($Snap.second $t@13@01) tree@12@01))
; [exec]
; assert (forall i: Int, b: Int ::
;     { tree_size_fix(tree.left, i, b) }
;     tree_size_fix(tree.left, i, b) < i && i < b ==>
;     tree_size_fix(tree.left, i, b) + 1 < b)
; [eval] (forall i: Int, b: Int :: { tree_size_fix(tree.left, i, b) } tree_size_fix(tree.left, i, b) < i && i < b ==> tree_size_fix(tree.left, i, b) + 1 < b)
(declare-const i@18@01 Int)
(declare-const b@19@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] tree_size_fix(tree.left, i, b) < i && i < b ==> tree_size_fix(tree.left, i, b) + 1 < b
; [eval] tree_size_fix(tree.left, i, b) < i && i < b
; [eval] tree_size_fix(tree.left, i, b) < i
; [eval] tree_size_fix(tree.left, i, b)
(push) ; 6
; [eval] tree != null
; [then-branch: 30 | First:(Second:($t@13@01)) != Null | dead]
; [else-branch: 30 | First:(Second:($t@13@01)) == Null | live]
(push) ; 7
; [else-branch: 30 | First:(Second:($t@13@01)) == Null]
(assert (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)
  (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)))
(push) ; 6
; [then-branch: 31 | !(tree_size_fix(_, First:(Second:($t@13@01)), i@18@01, b@19@01) < i@18@01) | live]
; [else-branch: 31 | tree_size_fix(_, First:(Second:($t@13@01)), i@18@01, b@19@01) < i@18@01 | live]
(push) ; 7
; [then-branch: 31 | !(tree_size_fix(_, First:(Second:($t@13@01)), i@18@01, b@19@01) < i@18@01)]
(assert (not
  (<
    (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
    i@18@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 31 | tree_size_fix(_, First:(Second:($t@13@01)), i@18@01, b@19@01) < i@18@01]
(assert (<
  (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
  i@18@01))
; [eval] i < b
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
    i@18@01)
  (not
    (<
      (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
      i@18@01))))
(push) ; 6
; [then-branch: 32 | tree_size_fix(_, First:(Second:($t@13@01)), i@18@01, b@19@01) < i@18@01 && i@18@01 < b@19@01 | live]
; [else-branch: 32 | !(tree_size_fix(_, First:(Second:($t@13@01)), i@18@01, b@19@01) < i@18@01 && i@18@01 < b@19@01) | live]
(push) ; 7
; [then-branch: 32 | tree_size_fix(_, First:(Second:($t@13@01)), i@18@01, b@19@01) < i@18@01 && i@18@01 < b@19@01]
(assert (and
  (<
    (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
    i@18@01)
  (< i@18@01 b@19@01)))
; [eval] tree_size_fix(tree.left, i, b) + 1 < b
; [eval] tree_size_fix(tree.left, i, b) + 1
; [eval] tree_size_fix(tree.left, i, b)
(push) ; 8
; [eval] tree != null
; [then-branch: 33 | First:(Second:($t@13@01)) != Null | dead]
; [else-branch: 33 | First:(Second:($t@13@01)) == Null | live]
(push) ; 9
; [else-branch: 33 | First:(Second:($t@13@01)) == Null]
(assert (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 32 | !(tree_size_fix(_, First:(Second:($t@13@01)), i@18@01, b@19@01) < i@18@01 && i@18@01 < b@19@01)]
(assert (not
  (and
    (<
      (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
      i@18@01)
    (< i@18@01 b@19@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
        i@18@01)
      (< i@18@01 b@19@01)))
  (and
    (<
      (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
      i@18@01)
    (< i@18@01 b@19@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@18@01 Int) (b@19@01 Int)) (!
  (and
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
        $Ref.null)
      (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01))
    (or
      (<
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
        i@18@01)
      (not
        (<
          (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
          i@18@01)))
    (or
      (not
        (and
          (<
            (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
            i@18@01)
          (< i@18@01 b@19@01)))
      (and
        (<
          (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
          i@18@01)
        (< i@18@01 b@19@01))))
  :pattern ((tree_size_fix%limited $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97-aux|)))
(assert (forall ((i@18@01 Int) (b@19@01 Int)) (!
  (and
    (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
    (=>
      (and
        (<
          (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
          i@18@01)
        (< i@18@01 b@19@01))
      (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)))
  :pattern ((tree_size_fix%limited $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97_precondition|)))
(push) ; 5
(assert (not (forall ((i@18@01 Int) (b@19@01 Int)) (!
  (=>
    (and
      (and
        (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
        (=>
          (and
            (<
              (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
              i@18@01)
            (< i@18@01 b@19@01))
          (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)))
      (and
        (<
          (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
          i@18@01)
        (< i@18@01 b@19@01)))
    (<
      (+
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
        1)
      b@19@01))
  :pattern ((tree_size_fix%limited $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@18@01 Int) (b@19@01 Int)) (!
  (=>
    (and
      (<
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
        i@18@01)
      (< i@18@01 b@19@01))
    (<
      (+
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01)
        1)
      b@19@01))
  :pattern ((tree_size_fix%limited $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@18@01 b@19@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97|)))
(pop) ; 4
(push) ; 4
; [else-branch: 29 | First:(Second:(Second:(Second:($t@13@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
  $Ref.null))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@13@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (BTree%trigger ($Snap.second $t@13@01) tree@12@01))
; [exec]
; assert (forall i: Int, b: Int ::
;     { tree_size_fix(tree.left, i, b) }
;     tree_size_fix(tree.left, i, b) < i && i < b ==>
;     tree_size_fix(tree.left, i, b) + 1 < b)
; [eval] (forall i: Int, b: Int :: { tree_size_fix(tree.left, i, b) } tree_size_fix(tree.left, i, b) < i && i < b ==> tree_size_fix(tree.left, i, b) + 1 < b)
(declare-const i@20@01 Int)
(declare-const b@21@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] tree_size_fix(tree.left, i, b) < i && i < b ==> tree_size_fix(tree.left, i, b) + 1 < b
; [eval] tree_size_fix(tree.left, i, b) < i && i < b
; [eval] tree_size_fix(tree.left, i, b) < i
; [eval] tree_size_fix(tree.left, i, b)
(push) ; 6
; [eval] tree != null
; [then-branch: 34 | First:(Second:($t@13@01)) != Null | dead]
; [else-branch: 34 | First:(Second:($t@13@01)) == Null | live]
(push) ; 7
; [else-branch: 34 | First:(Second:($t@13@01)) == Null]
(assert (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (= ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) $Ref.null)
  (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)))
(push) ; 6
; [then-branch: 35 | !(tree_size_fix(_, First:(Second:($t@13@01)), i@20@01, b@21@01) < i@20@01) | live]
; [else-branch: 35 | tree_size_fix(_, First:(Second:($t@13@01)), i@20@01, b@21@01) < i@20@01 | live]
(push) ; 7
; [then-branch: 35 | !(tree_size_fix(_, First:(Second:($t@13@01)), i@20@01, b@21@01) < i@20@01)]
(assert (not
  (<
    (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
    i@20@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 35 | tree_size_fix(_, First:(Second:($t@13@01)), i@20@01, b@21@01) < i@20@01]
(assert (<
  (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
  i@20@01))
; [eval] i < b
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (<
    (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
    i@20@01)
  (not
    (<
      (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
      i@20@01))))
(push) ; 6
; [then-branch: 36 | tree_size_fix(_, First:(Second:($t@13@01)), i@20@01, b@21@01) < i@20@01 && i@20@01 < b@21@01 | live]
; [else-branch: 36 | !(tree_size_fix(_, First:(Second:($t@13@01)), i@20@01, b@21@01) < i@20@01 && i@20@01 < b@21@01) | live]
(push) ; 7
; [then-branch: 36 | tree_size_fix(_, First:(Second:($t@13@01)), i@20@01, b@21@01) < i@20@01 && i@20@01 < b@21@01]
(assert (and
  (<
    (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
    i@20@01)
  (< i@20@01 b@21@01)))
; [eval] tree_size_fix(tree.left, i, b) + 1 < b
; [eval] tree_size_fix(tree.left, i, b) + 1
; [eval] tree_size_fix(tree.left, i, b)
(push) ; 8
; [eval] tree != null
; [then-branch: 37 | First:(Second:($t@13@01)) != Null | dead]
; [else-branch: 37 | First:(Second:($t@13@01)) == Null | live]
(push) ; 9
; [else-branch: 37 | First:(Second:($t@13@01)) == Null]
(assert (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(pop) ; 7
(push) ; 7
; [else-branch: 36 | !(tree_size_fix(_, First:(Second:($t@13@01)), i@20@01, b@21@01) < i@20@01 && i@20@01 < b@21@01)]
(assert (not
  (and
    (<
      (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
      i@20@01)
    (< i@20@01 b@21@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
        i@20@01)
      (< i@20@01 b@21@01)))
  (and
    (<
      (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
      i@20@01)
    (< i@20@01 b@21@01))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@20@01 Int) (b@21@01 Int)) (!
  (and
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01)))
        $Ref.null)
      (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01))
    (or
      (<
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
        i@20@01)
      (not
        (<
          (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
          i@20@01)))
    (or
      (not
        (and
          (<
            (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
            i@20@01)
          (< i@20@01 b@21@01)))
      (and
        (<
          (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
          i@20@01)
        (< i@20@01 b@21@01))))
  :pattern ((tree_size_fix%limited $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97-aux|)))
(assert (forall ((i@20@01 Int) (b@21@01 Int)) (!
  (and
    (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
    (=>
      (and
        (<
          (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
          i@20@01)
        (< i@20@01 b@21@01))
      (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)))
  :pattern ((tree_size_fix%limited $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97_precondition|)))
(push) ; 5
(assert (not (forall ((i@20@01 Int) (b@21@01 Int)) (!
  (=>
    (and
      (and
        (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
        (=>
          (and
            (<
              (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
              i@20@01)
            (< i@20@01 b@21@01))
          (tree_size_fix%precondition $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)))
      (and
        (<
          (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
          i@20@01)
        (< i@20@01 b@21@01)))
    (<
      (+
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
        1)
      b@21@01))
  :pattern ((tree_size_fix%limited $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@20@01 Int) (b@21@01 Int)) (!
  (=>
    (and
      (<
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
        i@20@01)
      (< i@20@01 b@21@01))
    (<
      (+
        (tree_size_fix $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01)
        1)
      b@21@01))
  :pattern ((tree_size_fix%limited $Snap.unit ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@13@01))) i@20@01 b@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0334.vpr@47@5@48@97|)))
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
