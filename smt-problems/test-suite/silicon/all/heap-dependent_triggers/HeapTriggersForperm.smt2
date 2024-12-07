(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:02
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr
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
(declare-sort $FVF<f> 0)
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
(declare-fun $SortWrappers.$FVF<f>To$Snap ($FVF<f>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<f> ($Snap) $FVF<f>)
(assert (forall ((x $FVF<f>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<f>($SortWrappers.$FVF<f>To$Snap x)))
    :pattern (($SortWrappers.$FVF<f>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<f>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<f>To$Snap($SortWrappers.$SnapTo$FVF<f> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<f> x))
    :qid |$Snap.$FVF<f>To$SnapTo$FVF<f>|
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
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
; /field_value_functions_axioms.smt2 [f: Int]
(assert (forall ((vs $FVF<f>) (ws $FVF<f>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_f vs) ($FVF.domain_f ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_f vs))
            (= ($FVF.lookup_f vs x) ($FVF.lookup_f ws x)))
          :pattern (($FVF.lookup_f vs x) ($FVF.lookup_f ws x))
          :qid |qp.$FVF<f>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<f>To$Snap vs)
              ($SortWrappers.$FVF<f>To$Snap ws)
              )
    :qid |qp.$FVF<f>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_f pm r))
    :pattern (($FVF.perm_f pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
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
; ---------- m1 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const y@1@01 $Ref)
(declare-const z@2@01 $Ref)
(declare-const xs@3@01 Set<$Ref>)
(declare-const y@4@01 $Ref)
(declare-const z@5@01 $Ref)
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
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@6@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@6@01 xs@3@01))
(pop) ; 3
(declare-const $t@7@01 $FVF<f>)
(declare-fun inv@8@01 ($Ref) $Ref)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@6@01 $Ref) (x2@6@01 $Ref)) (!
  (=>
    (and (Set_in x1@6@01 xs@3@01) (Set_in x2@6@01 xs@3@01) (= x1@6@01 x2@6@01))
    (= x1@6@01 x2@6@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@6@01 $Ref)) (!
  (=>
    (Set_in x@6@01 xs@3@01)
    (and (= (inv@8@01 x@6@01) x@6@01) (img@9@01 x@6@01)))
  :pattern ((Set_in x@6@01 xs@3@01))
  :pattern ((inv@8@01 x@6@01))
  :pattern ((img@9@01 x@6@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)) (= (inv@8@01 r) r))
  :pattern ((inv@8@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@6@01 $Ref)) (!
  (=> (Set_in x@6@01 xs@3@01) (not (= x@6@01 $Ref.null)))
  :pattern ((Set_in x@6@01 xs@3@01))
  :pattern ((inv@8@01 x@6@01))
  :pattern ((img@9@01 x@6@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@10@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@10@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@8@01 r) xs@3@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@10@01  $FVF<f>) r) r))
  :pattern ((inv@8@01 r))
  :qid |quant-u-2|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref ::x == y ==> acc(x.f, write))
(declare-const x@11@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] x == y
(assert (= x@11@01 y@4@01))
(pop) ; 3
(declare-const $t@12@01 $FVF<f>)
(declare-fun inv@13@01 ($Ref) $Ref)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@11@01 $Ref) (x2@11@01 $Ref)) (!
  (=>
    (and (= x1@11@01 y@4@01) (= x2@11@01 y@4@01) (= x1@11@01 x2@11@01))
    (= x1@11@01 x2@11@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (= x@11@01 y@4@01)
    (and (= (inv@13@01 x@11@01) x@11@01) (img@14@01 x@11@01)))
  :pattern ((inv@13@01 x@11@01))
  :pattern ((img@14@01 x@11@01))
  :qid |quant-u-4|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@14@01 r) (= (inv@13@01 r) y@4@01)) (= (inv@13@01 r) r))
  :pattern ((inv@13@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@11@01 $Ref)) (!
  (=> (= x@11@01 y@4@01) (not (= x@11@01 $Ref.null)))
  :pattern ((inv@13@01 x@11@01))
  :pattern ((img@14@01 x@11@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= x@11@01 x@6@01)
    (=
      (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))))
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@15@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@15@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@15@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@13@01 r) y@4@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@15@01  $FVF<f>) r) r))
  :pattern ((inv@13@01 r))
  :qid |quant-u-6|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref ::x == z ==> acc(x.f, write))
(declare-const x@16@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] x == z
(assert (= x@16@01 z@5@01))
(pop) ; 3
(declare-const $t@17@01 $FVF<f>)
(declare-fun inv@18@01 ($Ref) $Ref)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@16@01 $Ref) (x2@16@01 $Ref)) (!
  (=>
    (and (= x1@16@01 z@5@01) (= x2@16@01 z@5@01) (= x1@16@01 x2@16@01))
    (= x1@16@01 x2@16@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@16@01 $Ref)) (!
  (=>
    (= x@16@01 z@5@01)
    (and (= (inv@18@01 x@16@01) x@16@01) (img@19@01 x@16@01)))
  :pattern ((inv@18@01 x@16@01))
  :pattern ((img@19@01 x@16@01))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@19@01 r) (= (inv@18@01 r) z@5@01)) (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@16@01 $Ref)) (!
  (=> (= x@16@01 z@5@01) (not (= x@16@01 $Ref.null)))
  :pattern ((inv@18@01 x@16@01))
  :pattern ((img@19@01 x@16@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= x@16@01 x@11@01)
    (=
      (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
      (and (img@14@01 r) (= (inv@13@01 r) y@4@01))))
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= x@16@01 x@6@01)
    (=
      (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))))
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= (inv@18@01 r) z@5@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) r))
  :pattern ((inv@18@01 r))
  :qid |quant-u-11|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref :: { x.f } x == y || x == z ==> x.f == 0)
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 $Snap.unit))
; [eval] (forall x: Ref :: { x.f } x == y || x == z ==> x.f == 0)
(declare-const x@22@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] x == y || x == z ==> x.f == 0
; [eval] x == y || x == z
; [eval] x == y
(push) ; 4
; [then-branch: 0 | x@22@01 == y@4@01 | live]
; [else-branch: 0 | x@22@01 != y@4@01 | live]
(push) ; 5
; [then-branch: 0 | x@22@01 == y@4@01]
(assert (= x@22@01 y@4@01))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | x@22@01 != y@4@01]
(assert (not (= x@22@01 y@4@01)))
; [eval] x == z
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= x@22@01 y@4@01)) (= x@22@01 y@4@01)))
(push) ; 4
; [then-branch: 1 | x@22@01 == y@4@01 || x@22@01 == z@5@01 | live]
; [else-branch: 1 | !(x@22@01 == y@4@01 || x@22@01 == z@5@01) | live]
(push) ; 5
; [then-branch: 1 | x@22@01 == y@4@01 || x@22@01 == z@5@01]
(assert (or (= x@22@01 y@4@01) (= x@22@01 z@5@01)))
; [eval] x.f == 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@7@01 r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@12@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@17@01 r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef8|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@22@01) x@22@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and (img@9@01 x@22@01) (Set_in (inv@8@01 x@22@01) xs@3@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@14@01 x@22@01) (= (inv@13@01 x@22@01) y@4@01))
        $Perm.Write
        $Perm.No))
    (ite
      (and (img@19@01 x@22@01) (= (inv@18@01 x@22@01) z@5@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(x@22@01 == y@4@01 || x@22@01 == z@5@01)]
(assert (not (or (= x@22@01 y@4@01) (= x@22@01 z@5@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (=>
  (or (= x@22@01 y@4@01) (= x@22@01 z@5@01))
  (and
    (or (= x@22@01 y@4@01) (= x@22@01 z@5@01))
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@22@01) x@22@01))))
; Joined path conditions
(assert (or
  (not (or (= x@22@01 y@4@01) (= x@22@01 z@5@01)))
  (or (= x@22@01 y@4@01) (= x@22@01 z@5@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@22@01 $Ref)) (!
  (and
    (or (not (= x@22@01 y@4@01)) (= x@22@01 y@4@01))
    (=>
      (or (= x@22@01 y@4@01) (= x@22@01 z@5@01))
      (and
        (or (= x@22@01 y@4@01) (= x@22@01 z@5@01))
        ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@22@01) x@22@01)))
    (or
      (not (or (= x@22@01 y@4@01) (= x@22@01 z@5@01)))
      (or (= x@22@01 y@4@01) (= x@22@01 z@5@01))))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@22@01) x@22@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@11@12@11@64-aux|)))
(assert (forall ((x@22@01 $Ref)) (!
  (=>
    (or (= x@22@01 y@4@01) (= x@22@01 z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@22@01) 0))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@22@01) x@22@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@11@12@11@64|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref :: { x.f } (x in xs) ==> x.f == 0)
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] (forall x: Ref :: { x.f } (x in xs) ==> x.f == 0)
(declare-const x@24@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> x.f == 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 2 | x@24@01 in xs@3@01 | live]
; [else-branch: 2 | !(x@24@01 in xs@3@01) | live]
(push) ; 5
; [then-branch: 2 | x@24@01 in xs@3@01]
(assert (Set_in x@24@01 xs@3@01))
; [eval] x.f == 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@7@01 r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@12@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@17@01 r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef8|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@24@01) x@24@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and (img@9@01 x@24@01) (Set_in (inv@8@01 x@24@01) xs@3@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@14@01 x@24@01) (= (inv@13@01 x@24@01) y@4@01))
        $Perm.Write
        $Perm.No))
    (ite
      (and (img@19@01 x@24@01) (= (inv@18@01 x@24@01) z@5@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(x@24@01 in xs@3@01)]
(assert (not (Set_in x@24@01 xs@3@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (=>
  (Set_in x@24@01 xs@3@01)
  (and
    (Set_in x@24@01 xs@3@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@24@01) x@24@01))))
; Joined path conditions
(assert (or (not (Set_in x@24@01 xs@3@01)) (Set_in x@24@01 xs@3@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@24@01 $Ref)) (!
  (and
    (=>
      (Set_in x@24@01 xs@3@01)
      (and
        (Set_in x@24@01 xs@3@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@24@01) x@24@01)))
    (or (not (Set_in x@24@01 xs@3@01)) (Set_in x@24@01 xs@3@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@24@01) x@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@12@12@12@55-aux|)))
(assert (forall ((x@24@01 $Ref)) (!
  (=>
    (Set_in x@24@01 xs@3@01)
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@24@01) 0))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@24@01) x@24@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@12@12@12@55|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm x: Ref [x.f] :: x.f == 0)
; [eval] (forperm x: Ref [x.f] :: x.f == 0)
(declare-const x@25@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 3 | FieldTrigger(f, $t@17@01, x@25@01) && img@19@01(x@25@01) && inv@18@01(x@25@01) == z@5@01 | live]
; [else-branch: 3 | !(FieldTrigger(f, $t@17@01, x@25@01) && img@19@01(x@25@01) && inv@18@01(x@25@01) == z@5@01) | live]
(push) ; 4
; [then-branch: 3 | FieldTrigger(f, $t@17@01, x@25@01) && img@19@01(x@25@01) && inv@18@01(x@25@01) == z@5@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f $t@17@01 x@25@01) x@25@01)
  (and (img@19@01 x@25@01) (= (inv@18@01 x@25@01) z@5@01))))
; [eval] x.f == 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@7@01 r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@12@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@17@01 r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef8|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@25@01) x@25@01))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and (img@9@01 x@25@01) (Set_in (inv@8@01 x@25@01) xs@3@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@14@01 x@25@01) (= (inv@13@01 x@25@01) y@4@01))
        $Perm.Write
        $Perm.No))
    (ite
      (and (img@19@01 x@25@01) (= (inv@18@01 x@25@01) z@5@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(FieldTrigger(f, $t@17@01, x@25@01) && img@19@01(x@25@01) && inv@18@01(x@25@01) == z@5@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 x@25@01) x@25@01)
    (and (img@19@01 x@25@01) (= (inv@18@01 x@25@01) z@5@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 x@25@01) x@25@01)
    (and (img@19@01 x@25@01) (= (inv@18@01 x@25@01) z@5@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 x@25@01) x@25@01)
    (img@19@01 x@25@01)
    (= (inv@18@01 x@25@01) z@5@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@25@01) x@25@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@17@01 x@25@01) x@25@01)
      (and (img@19@01 x@25@01) (= (inv@18@01 x@25@01) z@5@01))))
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 x@25@01) x@25@01)
    (and (img@19@01 x@25@01) (= (inv@18@01 x@25@01) z@5@01)))))
(declare-const x@26@01 $Ref)
(push) ; 3
; [then-branch: 4 | FieldTrigger(f, $t@12@01, x@26@01) && img@14@01(x@26@01) && inv@13@01(x@26@01) == y@4@01 | live]
; [else-branch: 4 | !(FieldTrigger(f, $t@12@01, x@26@01) && img@14@01(x@26@01) && inv@13@01(x@26@01) == y@4@01) | live]
(push) ; 4
; [then-branch: 4 | FieldTrigger(f, $t@12@01, x@26@01) && img@14@01(x@26@01) && inv@13@01(x@26@01) == y@4@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f $t@12@01 x@26@01) x@26@01)
  (and (img@14@01 x@26@01) (= (inv@13@01 x@26@01) y@4@01))))
; [eval] x.f == 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@7@01 r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@12@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@17@01 r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef8|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@26@01) x@26@01))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and (img@9@01 x@26@01) (Set_in (inv@8@01 x@26@01) xs@3@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@14@01 x@26@01) (= (inv@13@01 x@26@01) y@4@01))
        $Perm.Write
        $Perm.No))
    (ite
      (and (img@19@01 x@26@01) (= (inv@18@01 x@26@01) z@5@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(FieldTrigger(f, $t@12@01, x@26@01) && img@14@01(x@26@01) && inv@13@01(x@26@01) == y@4@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 x@26@01) x@26@01)
    (and (img@14@01 x@26@01) (= (inv@13@01 x@26@01) y@4@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 x@26@01) x@26@01)
    (and (img@14@01 x@26@01) (= (inv@13@01 x@26@01) y@4@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 x@26@01) x@26@01)
    (img@14@01 x@26@01)
    (= (inv@13@01 x@26@01) y@4@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@26@01) x@26@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@12@01 x@26@01) x@26@01)
      (and (img@14@01 x@26@01) (= (inv@13@01 x@26@01) y@4@01))))
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 x@26@01) x@26@01)
    (and (img@14@01 x@26@01) (= (inv@13@01 x@26@01) y@4@01)))))
(declare-const x@27@01 $Ref)
(push) ; 3
; [then-branch: 5 | FieldTrigger(f, $t@7@01, x@27@01) && img@9@01(x@27@01) && inv@8@01(x@27@01) in xs@3@01 | live]
; [else-branch: 5 | !(FieldTrigger(f, $t@7@01, x@27@01) && img@9@01(x@27@01) && inv@8@01(x@27@01) in xs@3@01) | live]
(push) ; 4
; [then-branch: 5 | FieldTrigger(f, $t@7@01, x@27@01) && img@9@01(x@27@01) && inv@8@01(x@27@01) in xs@3@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f $t@7@01 x@27@01) x@27@01)
  (and (img@9@01 x@27@01) (Set_in (inv@8@01 x@27@01) xs@3@01))))
; [eval] x.f == 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@7@01 r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@12@01 r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@17@01 r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
      ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
    :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef8|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@27@01) x@27@01))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and (img@9@01 x@27@01) (Set_in (inv@8@01 x@27@01) xs@3@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@14@01 x@27@01) (= (inv@13@01 x@27@01) y@4@01))
        $Perm.Write
        $Perm.No))
    (ite
      (and (img@19@01 x@27@01) (= (inv@18@01 x@27@01) z@5@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(FieldTrigger(f, $t@7@01, x@27@01) && img@9@01(x@27@01) && inv@8@01(x@27@01) in xs@3@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 x@27@01) x@27@01)
    (and (img@9@01 x@27@01) (Set_in (inv@8@01 x@27@01) xs@3@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@7@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@7@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@14@01 r) (= (inv@13@01 r) y@4@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@19@01 r) (= (inv@18@01 r) z@5@01))
    (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) r) ($FVF.lookup_f $t@17@01 r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@17@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@12@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@17@01 r) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 x@27@01) x@27@01)
    (and (img@9@01 x@27@01) (Set_in (inv@8@01 x@27@01) xs@3@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 x@27@01) x@27@01)
    (img@9@01 x@27@01)
    (Set_in (inv@8@01 x@27@01) xs@3@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@27@01) x@27@01))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@7@01 x@27@01) x@27@01)
      (and (img@9@01 x@27@01) (Set_in (inv@8@01 x@27@01) xs@3@01))))
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@7@01 x@27@01) x@27@01)
    (and (img@9@01 x@27@01) (Set_in (inv@8@01 x@27@01) xs@3@01)))))
(push) ; 3
(assert (not (and
  (forall ((x@25@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f $t@17@01 x@25@01) x@25@01)
        (and (img@19@01 x@25@01) (= (inv@18@01 x@25@01) z@5@01)))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@25@01) 0))
    :pattern (($FVF.lookup_f $t@17@01 x@25@01))
    :qid |quant-0|))
  (forall ((x@26@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f $t@12@01 x@26@01) x@26@01)
        (and (img@14@01 x@26@01) (= (inv@13@01 x@26@01) y@4@01)))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@26@01) 0))
    :pattern (($FVF.lookup_f $t@12@01 x@26@01))
    :qid |quant-1|))
  (forall ((x@27@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f $t@7@01 x@27@01) x@27@01)
        (and (img@9@01 x@27@01) (Set_in (inv@8@01 x@27@01) xs@3@01)))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@27@01) 0))
    :pattern (($FVF.lookup_f $t@7@01 x@27@01))
    :qid |quant-2|)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((x@25@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f $t@17@01 x@25@01) x@25@01)
        (and (img@19@01 x@25@01) (= (inv@18@01 x@25@01) z@5@01)))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@25@01) 0))
    :pattern (($FVF.lookup_f $t@17@01 x@25@01))
    :qid |quant-0|))
  (forall ((x@26@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f $t@12@01 x@26@01) x@26@01)
        (and (img@14@01 x@26@01) (= (inv@13@01 x@26@01) y@4@01)))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@26@01) 0))
    :pattern (($FVF.lookup_f $t@12@01 x@26@01))
    :qid |quant-1|))
  (forall ((x@27@01 $Ref)) (!
    (=>
      (and
        ($FVF.loc_f ($FVF.lookup_f $t@7@01 x@27@01) x@27@01)
        (and (img@9@01 x@27@01) (Set_in (inv@8@01 x@27@01) xs@3@01)))
      (= ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@27@01) 0))
    :pattern (($FVF.lookup_f $t@7@01 x@27@01))
    :qid |quant-2|))))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const xs@28@01 Set<$Ref>)
(declare-const y@29@01 $Ref)
(declare-const xs@30@01 Set<$Ref>)
(declare-const y@31@01 $Ref)
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
; inhale (forall x: Ref :: { x.f } (x in xs) ==> acc(x.f, write))
(declare-const x@32@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@32@01 xs@30@01))
(declare-const sm@33@01 $FVF<f>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@34@01 $FVF<f>)
(declare-fun inv@35@01 ($Ref) $Ref)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@32@01 $Ref) (x2@32@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@32@01 xs@30@01)
      (Set_in x2@32@01 xs@30@01)
      (= x1@32@01 x2@32@01))
    (= x1@32@01 x2@32@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@32@01 $Ref)) (!
  (=>
    (Set_in x@32@01 xs@30@01)
    (and (= (inv@35@01 x@32@01) x@32@01) (img@36@01 x@32@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@34@01 x@32@01) x@32@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01)) (= (inv@35@01 r) r))
  :pattern ((inv@35@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@32@01 $Ref)) (!
  (=> (Set_in x@32@01 xs@30@01) (not (= x@32@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f $t@34@01 x@32@01) x@32@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@37@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
    (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r)
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@35@01 r) xs@30@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) r))
  :pattern ((inv@35@01 r))
  :qid |quant-u-14|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall x: Ref :: { x.f } (x in xs) ==> perm(x.f) >= write)
; [eval] (forall x: Ref :: { x.f } (x in xs) ==> perm(x.f) >= write)
(declare-const x@38@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> perm(x.f) >= write
; [eval] (x in xs)
(push) ; 4
; [then-branch: 6 | x@38@01 in xs@30@01 | live]
; [else-branch: 6 | !(x@38@01 in xs@30@01) | live]
(push) ; 5
; [then-branch: 6 | x@38@01 in xs@30@01]
(assert (Set_in x@38@01 xs@30@01))
; [eval] perm(x.f) >= write
; [eval] perm(x.f)
; Definitional axioms for snapshot map values
(declare-const pm@39@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@39@01  $FPM) r)
    (ite
      (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@39@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r))
  :pattern (($FVF.perm_f (as pm@39@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@38@01) x@38@01))
; perm(x.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@39@01  $FPM) x@38@01) $Perm.Write))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(x@38@01 in xs@30@01)]
(assert (not (Set_in x@38@01 xs@30@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@39@01  $FPM) r)
    (ite
      (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@39@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r))
  :pattern (($FVF.perm_f (as pm@39@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
(assert (=>
  (Set_in x@38@01 xs@30@01)
  (and
    (Set_in x@38@01 xs@30@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@38@01) x@38@01)
    (<= ($FVF.perm_f (as pm@39@01  $FPM) x@38@01) $Perm.Write))))
; Joined path conditions
(assert (or (not (Set_in x@38@01 xs@30@01)) (Set_in x@38@01 xs@30@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@39@01  $FPM) r)
    (ite
      (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@39@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r))
  :pattern (($FVF.perm_f (as pm@39@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@38@01 $Ref)) (!
  (and
    (=>
      (Set_in x@38@01 xs@30@01)
      (and
        (Set_in x@38@01 xs@30@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@38@01) x@38@01)
        (<= ($FVF.perm_f (as pm@39@01  $FPM) x@38@01) $Perm.Write)))
    (or (not (Set_in x@38@01 xs@30@01)) (Set_in x@38@01 xs@30@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@38@01) x@38@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@22@12@22@65-aux|)))
(push) ; 3
(assert (not (forall ((x@38@01 $Ref)) (!
  (=>
    (Set_in x@38@01 xs@30@01)
    (>= ($FVF.perm_f (as pm@39@01  $FPM) x@38@01) $Perm.Write))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@38@01) x@38@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@22@12@22@65|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@38@01 $Ref)) (!
  (=>
    (Set_in x@38@01 xs@30@01)
    (>= ($FVF.perm_f (as pm@39@01  $FPM) x@38@01) $Perm.Write))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@38@01) x@38@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@22@12@22@65|)))
; [exec]
; inhale (forall x: Ref :: { x.f } (x in xs) ==> x.f != 0)
(declare-const $t@40@01 $Snap)
(assert (= $t@40@01 $Snap.unit))
; [eval] (forall x: Ref :: { x.f } (x in xs) ==> x.f != 0)
(declare-const x@41@01 $Ref)
(push) ; 3
; [eval] (x in xs) ==> x.f != 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 7 | x@41@01 in xs@30@01 | live]
; [else-branch: 7 | !(x@41@01 in xs@30@01) | live]
(push) ; 5
; [then-branch: 7 | x@41@01 in xs@30@01]
(assert (Set_in x@41@01 xs@30@01))
; [eval] x.f != 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
      (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
    :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@34@01 r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r)
    :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef11|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@41@01) x@41@01))
(push) ; 6
(assert (not (and (img@36@01 x@41@01) (Set_in (inv@35@01 x@41@01) xs@30@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(x@41@01 in xs@30@01)]
(assert (not (Set_in x@41@01 xs@30@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
    (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r)
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (=>
  (Set_in x@41@01 xs@30@01)
  (and
    (Set_in x@41@01 xs@30@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@41@01) x@41@01))))
; Joined path conditions
(assert (or (not (Set_in x@41@01 xs@30@01)) (Set_in x@41@01 xs@30@01)))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
    (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r)
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef11|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@41@01 $Ref)) (!
  (and
    (=>
      (Set_in x@41@01 xs@30@01)
      (and
        (Set_in x@41@01 xs@30@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@41@01) x@41@01)))
    (or (not (Set_in x@41@01 xs@30@01)) (Set_in x@41@01 xs@30@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@41@01) x@41@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@23@12@23@55-aux|)))
(assert (forall ((x@41@01 $Ref)) (!
  (=>
    (Set_in x@41@01 xs@30@01)
    (not (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@41@01) 0)))
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@41@01) x@41@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/HeapTriggersForperm.vpr@23@12@23@55|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forperm x: Ref [x.f] :: (x in xs) ==> x.f != 0)
; [eval] (forperm x: Ref [x.f] :: (x in xs) ==> x.f != 0)
(declare-const x@42@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | FieldTrigger(f, $t@34@01, x@42@01) && img@36@01(x@42@01) && inv@35@01(x@42@01) in xs@30@01 | live]
; [else-branch: 8 | !(FieldTrigger(f, $t@34@01, x@42@01) && img@36@01(x@42@01) && inv@35@01(x@42@01) in xs@30@01) | live]
(push) ; 4
; [then-branch: 8 | FieldTrigger(f, $t@34@01, x@42@01) && img@36@01(x@42@01) && inv@35@01(x@42@01) in xs@30@01]
(assert (and
  ($FVF.loc_f ($FVF.lookup_f $t@34@01 x@42@01) x@42@01)
  (and (img@36@01 x@42@01) (Set_in (inv@35@01 x@42@01) xs@30@01))))
; [eval] (x in xs) ==> x.f != 0
; [eval] (x in xs)
(push) ; 5
; [then-branch: 9 | x@42@01 in xs@30@01 | live]
; [else-branch: 9 | !(x@42@01 in xs@30@01) | live]
(push) ; 6
; [then-branch: 9 | x@42@01 in xs@30@01]
(assert (Set_in x@42@01 xs@30@01))
; [eval] x.f != 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
      (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
    :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f $t@34@01 r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r)
    :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
    :qid |qp.fvfResTrgDef11|))))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@42@01) x@42@01))
(push) ; 7
(assert (not (and (img@36@01 x@42@01) (Set_in (inv@35@01 x@42@01) xs@30@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 9 | !(x@42@01 in xs@30@01)]
(assert (not (Set_in x@42@01 xs@30@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
    (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r)
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (=>
  (Set_in x@42@01 xs@30@01)
  (and
    (Set_in x@42@01 xs@30@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@42@01) x@42@01))))
; Joined path conditions
(assert (or (not (Set_in x@42@01 xs@30@01)) (Set_in x@42@01 xs@30@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(FieldTrigger(f, $t@34@01, x@42@01) && img@36@01(x@42@01) && inv@35@01(x@42@01) in xs@30@01)]
(assert (not
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 x@42@01) x@42@01)
    (and (img@36@01 x@42@01) (Set_in (inv@35@01 x@42@01) xs@30@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@36@01 r) (Set_in (inv@35@01 r) xs@30@01))
    (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@34@01 r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@34@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@34@01 r) r)
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (=>
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 x@42@01) x@42@01)
    (and (img@36@01 x@42@01) (Set_in (inv@35@01 x@42@01) xs@30@01)))
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 x@42@01) x@42@01)
    (img@36@01 x@42@01)
    (Set_in (inv@35@01 x@42@01) xs@30@01)
    (=>
      (Set_in x@42@01 xs@30@01)
      (and
        (Set_in x@42@01 xs@30@01)
        ($FVF.loc_f ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@42@01) x@42@01)))
    (or (not (Set_in x@42@01 xs@30@01)) (Set_in x@42@01 xs@30@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      ($FVF.loc_f ($FVF.lookup_f $t@34@01 x@42@01) x@42@01)
      (and (img@36@01 x@42@01) (Set_in (inv@35@01 x@42@01) xs@30@01))))
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@34@01 x@42@01) x@42@01)
    (and (img@36@01 x@42@01) (Set_in (inv@35@01 x@42@01) xs@30@01)))))
(push) ; 3
(assert (not (forall ((x@42@01 $Ref)) (!
  (=>
    (and
      (and
        ($FVF.loc_f ($FVF.lookup_f $t@34@01 x@42@01) x@42@01)
        (and (img@36@01 x@42@01) (Set_in (inv@35@01 x@42@01) xs@30@01)))
      (Set_in x@42@01 xs@30@01))
    (not (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@42@01) 0)))
  :pattern (($FVF.lookup_f $t@34@01 x@42@01))
  :qid |quant-3|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@42@01 $Ref)) (!
  (=>
    (and
      (and
        ($FVF.loc_f ($FVF.lookup_f $t@34@01 x@42@01) x@42@01)
        (and (img@36@01 x@42@01) (Set_in (inv@35@01 x@42@01) xs@30@01)))
      (Set_in x@42@01 xs@30@01))
    (not (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) x@42@01) 0)))
  :pattern (($FVF.lookup_f $t@34@01 x@42@01))
  :qid |quant-3|)))
(pop) ; 2
(pop) ; 1
