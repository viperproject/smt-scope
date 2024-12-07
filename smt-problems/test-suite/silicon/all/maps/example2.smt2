(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:05:50
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/maps/example2.vpr
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
(declare-sort Set<Bool> 0)
(declare-sort Map<Int~_Int> 0)
(declare-sort Map<Int~_Bool> 0)
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Map<Int~_Int>To$Snap (Map<Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_Int> ($Snap) Map<Int~_Int>)
(assert (forall ((x Map<Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_Int>($SortWrappers.Map<Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_Int>To$Snap($SortWrappers.$SnapToMap<Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_Int> x))
    :qid |$Snap.Map<Int~_Int>To$SnapToMap<Int~_Int>|
    )))
(declare-fun $SortWrappers.Map<Int~_Bool>To$Snap (Map<Int~_Bool>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_Bool> ($Snap) Map<Int~_Bool>)
(assert (forall ((x Map<Int~_Bool>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_Bool>($SortWrappers.Map<Int~_Bool>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_Bool>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_Bool>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_Bool>To$Snap($SortWrappers.$SnapToMap<Int~_Bool> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_Bool> x))
    :qid |$Snap.Map<Int~_Bool>To$SnapToMap<Int~_Bool>|
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
(declare-fun Map_apply (Map<Int~_Int> Int) Int)
(declare-fun Map_card (Map<Int~_Int>) Int)
(declare-fun Map_disjoint (Map<Int~_Int> Map<Int~_Int>) Bool)
(declare-fun Map_domain (Map<Int~_Int>) Set<Int>)
(declare-const Map_empty Map<Int~_Int>)
(declare-fun Map_equal (Map<Int~_Int> Map<Int~_Int>) Bool)
(declare-fun Map_update (Map<Int~_Int> Int Int) Map<Int~_Int>)
(declare-fun Map_values (Map<Int~_Int>) Set<Int>)
(declare-fun Map_range_domain_skolem (Map<Int~_Int> Int) Int)
(declare-fun Map_apply (Map<Int~_Bool> Int) Bool)
(declare-fun Map_card (Map<Int~_Bool>) Int)
(declare-fun Map_disjoint (Map<Int~_Bool> Map<Int~_Bool>) Bool)
(declare-fun Map_domain (Map<Int~_Bool>) Set<Int>)
(declare-const Map_empty Map<Int~_Bool>)
(declare-fun Map_equal (Map<Int~_Bool> Map<Int~_Bool>) Bool)
(declare-fun Map_update (Map<Int~_Bool> Int Bool) Map<Int~_Bool>)
(declare-fun Map_values (Map<Int~_Bool>) Set<Bool>)
(declare-fun Map_range_domain_skolem (Map<Int~_Bool> Bool) Int)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((m Map<Int~_Int>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_Int>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_Int>))))
  )))
(assert (forall ((m Map<Int~_Int>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_Int>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_Int>) (k1 Int) (k2 Int) (v Int)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int) (v Int)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_Int>) (v Int)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_Int>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
(assert (forall ((m Map<Int~_Bool>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Int~_Bool>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Bool>) (m2 Map<Int~_Bool>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Bool>) (m2 Map<Int~_Bool>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_Bool>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_Bool>))))
  )))
(assert (forall ((m Map<Int~_Bool>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_Bool>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Int~_Bool>) (m2 Map<Int~_Bool>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Int~_Bool>) (m2 Map<Int~_Bool>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Int~_Bool>) (k1 Int) (k2 Int) (v Bool)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  )))
(assert (forall ((m Map<Int~_Bool>) (k Int) (v Bool)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Int~_Bool>) (v Bool)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Int~_Bool>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Int~_Bool>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  )))
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
; var m: Map[Int,Int]
(declare-const m@0@01 Map<Int~_Int>)
; [exec]
; m := Map(2 := 3)
; [eval] Map(2 := 3)
; [eval] Map[Int,Int]()[2 := 3]
; [eval] Map[Int,Int]()
(declare-const m@1@01 Map<Int~_Int>)
(assert (= m@1@01 (Map_update (as Map_empty  Map<Int~_Int>) 2 3)))
; [exec]
; assert (2 in m)
; [eval] (2 in m)
(push) ; 3
(assert (not (Set_in 2 (Map_domain m@1@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 2 (Map_domain m@1@01)))
; [exec]
; assert !((3 in m))
; [eval] !((3 in m))
; [eval] (3 in m)
(push) ; 3
(assert (not (not (Set_in 3 (Map_domain m@1@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_in 3 (Map_domain m@1@01))))
; [exec]
; assert m[2] == 3
; [eval] m[2] == 3
; [eval] m[2]
(push) ; 3
(assert (not (= (Map_apply m@1@01 2) 3)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@1@01 2) 3))
; [exec]
; assert m[2 := 4] == Map(2 := 4)
; [eval] m[2 := 4] == Map(2 := 4)
; [eval] m[2 := 4]
; [eval] Map(2 := 4)
; [eval] Map[Int,Int]()[2 := 4]
; [eval] Map[Int,Int]()
(push) ; 3
(assert (not (Map_equal (Map_update m@1@01 2 4) (Map_update (as Map_empty  Map<Int~_Int>) 2 4))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_equal (Map_update m@1@01 2 4) (Map_update (as Map_empty  Map<Int~_Int>) 2 4)))
; [exec]
; assert m[7 := 1] == Map(2 := 3, 7 := 1)
; [eval] m[7 := 1] == Map(2 := 3, 7 := 1)
; [eval] m[7 := 1]
; [eval] Map(2 := 3, 7 := 1)
; [eval] Map[Int,Int]()[2 := 3][7 := 1]
; [eval] Map[Int,Int]()[2 := 3]
; [eval] Map[Int,Int]()
(push) ; 3
(assert (not (Map_equal (Map_update m@1@01 7 1) (Map_update (Map_update (as Map_empty  Map<Int~_Int>) 2 3) 7 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_equal (Map_update m@1@01 7 1) (Map_update (Map_update (as Map_empty  Map<Int~_Int>) 2 3) 7 1)))
; [exec]
; assert m == Map(2 := 3)
; [eval] m == Map(2 := 3)
; [eval] Map(2 := 3)
; [eval] Map[Int,Int]()[2 := 3]
; [eval] Map[Int,Int]()
(push) ; 3
(assert (not (Map_equal m@1@01 (Map_update (as Map_empty  Map<Int~_Int>) 2 3))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_equal m@1@01 (Map_update (as Map_empty  Map<Int~_Int>) 2 3)))
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
; var m1: Map[Int,Int]
(declare-const m1@2@01 Map<Int~_Int>)
; [exec]
; var m2: Map[Int,Int]
(declare-const m2@3@01 Map<Int~_Int>)
; [exec]
; m1 := Map(2 := 3)
; [eval] Map(2 := 3)
; [eval] Map[Int,Int]()[2 := 3]
; [eval] Map[Int,Int]()
(declare-const m1@4@01 Map<Int~_Int>)
(assert (= m1@4@01 (Map_update (as Map_empty  Map<Int~_Int>) 2 3)))
; [exec]
; m2 := Map(3 := 2)
; [eval] Map(3 := 2)
; [eval] Map[Int,Int]()[3 := 2]
; [eval] Map[Int,Int]()
(declare-const m2@5@01 Map<Int~_Int>)
(assert (= m2@5@01 (Map_update (as Map_empty  Map<Int~_Int>) 3 2)))
; [exec]
; assert m1[m2[3]] == 3
; [eval] m1[m2[3]] == 3
; [eval] m1[m2[3]]
; [eval] m2[3]
(push) ; 3
(assert (not (Set_in 3 (Map_domain m2@5@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (Set_in (Map_apply m2@5@01 3) (Map_domain m1@4@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Map_apply m1@4@01 (Map_apply m2@5@01 3)) 3)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m1@4@01 (Map_apply m2@5@01 3)) 3))
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const m1@6@01 Map<Int~_Bool>)
(declare-const m2@7@01 Map<Int~_Bool>)
(declare-const m1@8@01 Map<Int~_Bool>)
(declare-const m2@9@01 Map<Int~_Bool>)
(push) ; 1
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] (forall i: Int :: { (i in m1) } { (i in m2) } { m1[i] } { m2[i] } 0 <= i && i < 100 ==> (i in m1) && ((i in m2) && m1[i] != m2[i]))
(declare-const i@11@01 Int)
(push) ; 2
; [eval] 0 <= i && i < 100 ==> (i in m1) && ((i in m2) && m1[i] != m2[i])
; [eval] 0 <= i && i < 100
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@11@01) | live]
; [else-branch: 0 | 0 <= i@11@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@11@01)]
(assert (not (<= 0 i@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@11@01]
(assert (<= 0 i@11@01))
; [eval] i < 100
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@11@01) (not (<= 0 i@11@01))))
(push) ; 3
; [then-branch: 1 | 0 <= i@11@01 && i@11@01 < 100 | live]
; [else-branch: 1 | !(0 <= i@11@01 && i@11@01 < 100) | live]
(push) ; 4
; [then-branch: 1 | 0 <= i@11@01 && i@11@01 < 100]
(assert (and (<= 0 i@11@01) (< i@11@01 100)))
; [eval] (i in m1) && ((i in m2) && m1[i] != m2[i])
; [eval] (i in m1)
(push) ; 5
; [then-branch: 2 | !(i@11@01 in domain(m1@8@01)) | live]
; [else-branch: 2 | i@11@01 in domain(m1@8@01) | live]
(push) ; 6
; [then-branch: 2 | !(i@11@01 in domain(m1@8@01))]
(assert (not (Set_in i@11@01 (Map_domain m1@8@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | i@11@01 in domain(m1@8@01)]
(assert (Set_in i@11@01 (Map_domain m1@8@01)))
; [eval] (i in m2)
(push) ; 7
; [then-branch: 3 | !(i@11@01 in domain(m2@9@01)) | live]
; [else-branch: 3 | i@11@01 in domain(m2@9@01) | live]
(push) ; 8
; [then-branch: 3 | !(i@11@01 in domain(m2@9@01))]
(assert (not (Set_in i@11@01 (Map_domain m2@9@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 3 | i@11@01 in domain(m2@9@01)]
(assert (Set_in i@11@01 (Map_domain m2@9@01)))
; [eval] m1[i] != m2[i]
; [eval] m1[i]
; [eval] m2[i]
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in i@11@01 (Map_domain m2@9@01))
  (not (Set_in i@11@01 (Map_domain m2@9@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in i@11@01 (Map_domain m1@8@01))
  (and
    (Set_in i@11@01 (Map_domain m1@8@01))
    (or
      (Set_in i@11@01 (Map_domain m2@9@01))
      (not (Set_in i@11@01 (Map_domain m2@9@01)))))))
(assert (or
  (Set_in i@11@01 (Map_domain m1@8@01))
  (not (Set_in i@11@01 (Map_domain m1@8@01)))))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(0 <= i@11@01 && i@11@01 < 100)]
(assert (not (and (<= 0 i@11@01) (< i@11@01 100))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@11@01) (< i@11@01 100))
  (and
    (<= 0 i@11@01)
    (< i@11@01 100)
    (=>
      (Set_in i@11@01 (Map_domain m1@8@01))
      (and
        (Set_in i@11@01 (Map_domain m1@8@01))
        (or
          (Set_in i@11@01 (Map_domain m2@9@01))
          (not (Set_in i@11@01 (Map_domain m2@9@01))))))
    (or
      (Set_in i@11@01 (Map_domain m1@8@01))
      (not (Set_in i@11@01 (Map_domain m1@8@01)))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@11@01) (< i@11@01 100)))
  (and (<= 0 i@11@01) (< i@11@01 100))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@11@01 Int)) (!
  (and
    (or (<= 0 i@11@01) (not (<= 0 i@11@01)))
    (=>
      (and (<= 0 i@11@01) (< i@11@01 100))
      (and
        (<= 0 i@11@01)
        (< i@11@01 100)
        (=>
          (Set_in i@11@01 (Map_domain m1@8@01))
          (and
            (Set_in i@11@01 (Map_domain m1@8@01))
            (or
              (Set_in i@11@01 (Map_domain m2@9@01))
              (not (Set_in i@11@01 (Map_domain m2@9@01))))))
        (or
          (Set_in i@11@01 (Map_domain m1@8@01))
          (not (Set_in i@11@01 (Map_domain m1@8@01))))))
    (or
      (not (and (<= 0 i@11@01) (< i@11@01 100)))
      (and (<= 0 i@11@01) (< i@11@01 100))))
  :pattern ((Set_in i@11@01 (Map_domain m1@8@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@30@12@31@63-aux|)))
(assert (forall ((i@11@01 Int)) (!
  (and
    (or (<= 0 i@11@01) (not (<= 0 i@11@01)))
    (=>
      (and (<= 0 i@11@01) (< i@11@01 100))
      (and
        (<= 0 i@11@01)
        (< i@11@01 100)
        (=>
          (Set_in i@11@01 (Map_domain m1@8@01))
          (and
            (Set_in i@11@01 (Map_domain m1@8@01))
            (or
              (Set_in i@11@01 (Map_domain m2@9@01))
              (not (Set_in i@11@01 (Map_domain m2@9@01))))))
        (or
          (Set_in i@11@01 (Map_domain m1@8@01))
          (not (Set_in i@11@01 (Map_domain m1@8@01))))))
    (or
      (not (and (<= 0 i@11@01) (< i@11@01 100)))
      (and (<= 0 i@11@01) (< i@11@01 100))))
  :pattern ((Set_in i@11@01 (Map_domain m2@9@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@30@12@31@63-aux|)))
(assert (forall ((i@11@01 Int)) (!
  (and
    (or (<= 0 i@11@01) (not (<= 0 i@11@01)))
    (=>
      (and (<= 0 i@11@01) (< i@11@01 100))
      (and
        (<= 0 i@11@01)
        (< i@11@01 100)
        (=>
          (Set_in i@11@01 (Map_domain m1@8@01))
          (and
            (Set_in i@11@01 (Map_domain m1@8@01))
            (or
              (Set_in i@11@01 (Map_domain m2@9@01))
              (not (Set_in i@11@01 (Map_domain m2@9@01))))))
        (or
          (Set_in i@11@01 (Map_domain m1@8@01))
          (not (Set_in i@11@01 (Map_domain m1@8@01))))))
    (or
      (not (and (<= 0 i@11@01) (< i@11@01 100)))
      (and (<= 0 i@11@01) (< i@11@01 100))))
  :pattern ((Map_apply m1@8@01 i@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@30@12@31@63-aux|)))
(assert (forall ((i@11@01 Int)) (!
  (and
    (or (<= 0 i@11@01) (not (<= 0 i@11@01)))
    (=>
      (and (<= 0 i@11@01) (< i@11@01 100))
      (and
        (<= 0 i@11@01)
        (< i@11@01 100)
        (=>
          (Set_in i@11@01 (Map_domain m1@8@01))
          (and
            (Set_in i@11@01 (Map_domain m1@8@01))
            (or
              (Set_in i@11@01 (Map_domain m2@9@01))
              (not (Set_in i@11@01 (Map_domain m2@9@01))))))
        (or
          (Set_in i@11@01 (Map_domain m1@8@01))
          (not (Set_in i@11@01 (Map_domain m1@8@01))))))
    (or
      (not (and (<= 0 i@11@01) (< i@11@01 100)))
      (and (<= 0 i@11@01) (< i@11@01 100))))
  :pattern ((Map_apply m2@9@01 i@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@30@12@31@63-aux|)))
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 0 i@11@01) (< i@11@01 100))
    (and
      (Set_in i@11@01 (Map_domain m1@8@01))
      (and
        (Set_in i@11@01 (Map_domain m2@9@01))
        (not (= (Map_apply m1@8@01 i@11@01) (Map_apply m2@9@01 i@11@01))))))
  :pattern ((Set_in i@11@01 (Map_domain m1@8@01)))
  :pattern ((Set_in i@11@01 (Map_domain m2@9@01)))
  :pattern ((Map_apply m1@8@01 i@11@01))
  :pattern ((Map_apply m2@9@01 i@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@30@12@31@63|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall i: Int ::
;     { m1[i] }
;     { m2[i] }
;     0 <= i && i < 100 ==> m1[i] || m2[i])
; [eval] (forall i: Int :: { m1[i] } { m2[i] } 0 <= i && i < 100 ==> m1[i] || m2[i])
(declare-const i@12@01 Int)
(push) ; 3
; [eval] 0 <= i && i < 100 ==> m1[i] || m2[i]
; [eval] 0 <= i && i < 100
; [eval] 0 <= i
(push) ; 4
; [then-branch: 4 | !(0 <= i@12@01) | live]
; [else-branch: 4 | 0 <= i@12@01 | live]
(push) ; 5
; [then-branch: 4 | !(0 <= i@12@01)]
(assert (not (<= 0 i@12@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | 0 <= i@12@01]
(assert (<= 0 i@12@01))
; [eval] i < 100
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@12@01) (not (<= 0 i@12@01))))
(push) ; 4
; [then-branch: 5 | 0 <= i@12@01 && i@12@01 < 100 | live]
; [else-branch: 5 | !(0 <= i@12@01 && i@12@01 < 100) | live]
(push) ; 5
; [then-branch: 5 | 0 <= i@12@01 && i@12@01 < 100]
(assert (and (<= 0 i@12@01) (< i@12@01 100)))
; [eval] m1[i] || m2[i]
; [eval] m1[i]
(push) ; 6
(assert (not (Set_in i@12@01 (Map_domain m1@8@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 6 | m1@8@01[i@12@01] | live]
; [else-branch: 6 | !(m1@8@01[i@12@01]) | live]
(push) ; 7
; [then-branch: 6 | m1@8@01[i@12@01]]
(assert (Map_apply m1@8@01 i@12@01))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | !(m1@8@01[i@12@01])]
(assert (not (Map_apply m1@8@01 i@12@01)))
; [eval] m2[i]
(push) ; 8
(assert (not (Set_in i@12@01 (Map_domain m2@9@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (Map_apply m1@8@01 i@12@01)) (Map_apply m1@8@01 i@12@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(0 <= i@12@01 && i@12@01 < 100)]
(assert (not (and (<= 0 i@12@01) (< i@12@01 100))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (<= 0 i@12@01) (< i@12@01 100))
  (and
    (<= 0 i@12@01)
    (< i@12@01 100)
    (or (not (Map_apply m1@8@01 i@12@01)) (Map_apply m1@8@01 i@12@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@12@01) (< i@12@01 100)))
  (and (<= 0 i@12@01) (< i@12@01 100))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@12@01 Int)) (!
  (and
    (or (<= 0 i@12@01) (not (<= 0 i@12@01)))
    (=>
      (and (<= 0 i@12@01) (< i@12@01 100))
      (and
        (<= 0 i@12@01)
        (< i@12@01 100)
        (or (not (Map_apply m1@8@01 i@12@01)) (Map_apply m1@8@01 i@12@01))))
    (or
      (not (and (<= 0 i@12@01) (< i@12@01 100)))
      (and (<= 0 i@12@01) (< i@12@01 100))))
  :pattern ((Map_apply m1@8@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@33@10@33@64-aux|)))
(assert (forall ((i@12@01 Int)) (!
  (and
    (or (<= 0 i@12@01) (not (<= 0 i@12@01)))
    (=>
      (and (<= 0 i@12@01) (< i@12@01 100))
      (and
        (<= 0 i@12@01)
        (< i@12@01 100)
        (or (not (Map_apply m1@8@01 i@12@01)) (Map_apply m1@8@01 i@12@01))))
    (or
      (not (and (<= 0 i@12@01) (< i@12@01 100)))
      (and (<= 0 i@12@01) (< i@12@01 100))))
  :pattern ((Map_apply m2@9@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@33@10@33@64-aux|)))
(push) ; 3
(assert (not (forall ((i@12@01 Int)) (!
  (=>
    (and (<= 0 i@12@01) (< i@12@01 100))
    (or (Map_apply m1@8@01 i@12@01) (Map_apply m2@9@01 i@12@01)))
  :pattern ((Map_apply m1@8@01 i@12@01))
  :pattern ((Map_apply m2@9@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@33@10@33@64|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (<= 0 i@12@01) (< i@12@01 100))
    (or (Map_apply m1@8@01 i@12@01) (Map_apply m2@9@01 i@12@01)))
  :pattern ((Map_apply m1@8@01 i@12@01))
  :pattern ((Map_apply m2@9@01 i@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@33@10@33@64|)))
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const m@13@01 Map<Int~_Int>)
(declare-const m@14@01 Map<Int~_Int>)
(push) ; 1
(declare-const $t@15@01 $Snap)
(assert (= $t@15@01 $Snap.unit))
; [eval] (forall i: Int :: { (i in m) } { m[i] } 0 <= i && i < 100 ==> (i in m) && m[i] == i * i)
(declare-const i@16@01 Int)
(push) ; 2
; [eval] 0 <= i && i < 100 ==> (i in m) && m[i] == i * i
; [eval] 0 <= i && i < 100
; [eval] 0 <= i
(push) ; 3
; [then-branch: 7 | !(0 <= i@16@01) | live]
; [else-branch: 7 | 0 <= i@16@01 | live]
(push) ; 4
; [then-branch: 7 | !(0 <= i@16@01)]
(assert (not (<= 0 i@16@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | 0 <= i@16@01]
(assert (<= 0 i@16@01))
; [eval] i < 100
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@16@01) (not (<= 0 i@16@01))))
(push) ; 3
; [then-branch: 8 | 0 <= i@16@01 && i@16@01 < 100 | live]
; [else-branch: 8 | !(0 <= i@16@01 && i@16@01 < 100) | live]
(push) ; 4
; [then-branch: 8 | 0 <= i@16@01 && i@16@01 < 100]
(assert (and (<= 0 i@16@01) (< i@16@01 100)))
; [eval] (i in m) && m[i] == i * i
; [eval] (i in m)
(push) ; 5
; [then-branch: 9 | !(i@16@01 in domain(m@14@01)) | live]
; [else-branch: 9 | i@16@01 in domain(m@14@01) | live]
(push) ; 6
; [then-branch: 9 | !(i@16@01 in domain(m@14@01))]
(assert (not (Set_in i@16@01 (Map_domain m@14@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | i@16@01 in domain(m@14@01)]
(assert (Set_in i@16@01 (Map_domain m@14@01)))
; [eval] m[i] == i * i
; [eval] m[i]
; [eval] i * i
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in i@16@01 (Map_domain m@14@01))
  (not (Set_in i@16@01 (Map_domain m@14@01)))))
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(0 <= i@16@01 && i@16@01 < 100)]
(assert (not (and (<= 0 i@16@01) (< i@16@01 100))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@16@01) (< i@16@01 100))
  (and
    (<= 0 i@16@01)
    (< i@16@01 100)
    (or
      (Set_in i@16@01 (Map_domain m@14@01))
      (not (Set_in i@16@01 (Map_domain m@14@01)))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@16@01) (< i@16@01 100)))
  (and (<= 0 i@16@01) (< i@16@01 100))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@16@01 Int)) (!
  (and
    (or (<= 0 i@16@01) (not (<= 0 i@16@01)))
    (=>
      (and (<= 0 i@16@01) (< i@16@01 100))
      (and
        (<= 0 i@16@01)
        (< i@16@01 100)
        (or
          (Set_in i@16@01 (Map_domain m@14@01))
          (not (Set_in i@16@01 (Map_domain m@14@01))))))
    (or
      (not (and (<= 0 i@16@01) (< i@16@01 100)))
      (and (<= 0 i@16@01) (< i@16@01 100))))
  :pattern ((Set_in i@16@01 (Map_domain m@14@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@37@12@37@75-aux|)))
(assert (forall ((i@16@01 Int)) (!
  (and
    (or (<= 0 i@16@01) (not (<= 0 i@16@01)))
    (=>
      (and (<= 0 i@16@01) (< i@16@01 100))
      (and
        (<= 0 i@16@01)
        (< i@16@01 100)
        (or
          (Set_in i@16@01 (Map_domain m@14@01))
          (not (Set_in i@16@01 (Map_domain m@14@01))))))
    (or
      (not (and (<= 0 i@16@01) (< i@16@01 100)))
      (and (<= 0 i@16@01) (< i@16@01 100))))
  :pattern ((Map_apply m@14@01 i@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@37@12@37@75-aux|)))
(assert (forall ((i@16@01 Int)) (!
  (=>
    (and (<= 0 i@16@01) (< i@16@01 100))
    (and
      (Set_in i@16@01 (Map_domain m@14@01))
      (= (Map_apply m@14@01 i@16@01) (* i@16@01 i@16@01))))
  :pattern ((Set_in i@16@01 (Map_domain m@14@01)))
  :pattern ((Map_apply m@14@01 i@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@37@12@37@75|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert m[20] == 400
; [eval] m[20] == 400
; [eval] m[20]
(push) ; 3
(assert (not (Set_in 20 (Map_domain m@14@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Map_apply m@14@01 20) 400)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@14@01 20) 400))
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
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
; var m: Map[Int,Int]
(declare-const m@17@01 Map<Int~_Int>)
; [exec]
; m := Map(3 := 9)
; [eval] Map(3 := 9)
; [eval] Map[Int,Int]()[3 := 9]
; [eval] Map[Int,Int]()
(declare-const m@18@01 Map<Int~_Int>)
(assert (= m@18@01 (Map_update (as Map_empty  Map<Int~_Int>) 3 9)))
(pop) ; 2
(pop) ; 1
; ---------- test6 ----------
(declare-const m@19@01 Map<Int~_Int>)
(declare-const m@20@01 Map<Int~_Int>)
(push) ; 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 $Snap.unit))
; [eval] (20 in m)
(assert (Set_in 20 (Map_domain m@20@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert m[20] <= 0 || 0 < m[20]
; [eval] m[20] <= 0 || 0 < m[20]
; [eval] m[20] <= 0
; [eval] m[20]
(push) ; 3
; [then-branch: 10 | m@20@01[20] <= 0 | live]
; [else-branch: 10 | !(m@20@01[20] <= 0) | live]
(push) ; 4
; [then-branch: 10 | m@20@01[20] <= 0]
(assert (<= (Map_apply m@20@01 20) 0))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(m@20@01[20] <= 0)]
(assert (not (<= (Map_apply m@20@01 20) 0)))
; [eval] 0 < m[20]
; [eval] m[20]
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (<= (Map_apply m@20@01 20) 0)) (<= (Map_apply m@20@01 20) 0)))
(push) ; 3
(assert (not (or (<= (Map_apply m@20@01 20) 0) (< 0 (Map_apply m@20@01 20)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (or (<= (Map_apply m@20@01 20) 0) (< 0 (Map_apply m@20@01 20))))
(pop) ; 2
(pop) ; 1
; ---------- test7 ----------
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
; var m: Map[Int,Int]
(declare-const m@22@01 Map<Int~_Int>)
; [exec]
; m := Map(3 := 9)
; [eval] Map(3 := 9)
; [eval] Map[Int,Int]()[3 := 9]
; [eval] Map[Int,Int]()
(declare-const m@23@01 Map<Int~_Int>)
(assert (= m@23@01 (Map_update (as Map_empty  Map<Int~_Int>) 3 9)))
; [exec]
; assert m[3 := 5] == Map(3 := 5)
; [eval] m[3 := 5] == Map(3 := 5)
; [eval] m[3 := 5]
; [eval] Map(3 := 5)
; [eval] Map[Int,Int]()[3 := 5]
; [eval] Map[Int,Int]()
(push) ; 3
(assert (not (Map_equal (Map_update m@23@01 3 5) (Map_update (as Map_empty  Map<Int~_Int>) 3 5))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_equal (Map_update m@23@01 3 5) (Map_update (as Map_empty  Map<Int~_Int>) 3 5)))
; [exec]
; assert m[2 := 5] == Map(2 := 5, 3 := 9)
; [eval] m[2 := 5] == Map(2 := 5, 3 := 9)
; [eval] m[2 := 5]
; [eval] Map(2 := 5, 3 := 9)
; [eval] Map[Int,Int]()[2 := 5][3 := 9]
; [eval] Map[Int,Int]()[2 := 5]
; [eval] Map[Int,Int]()
(push) ; 3
(assert (not (Map_equal (Map_update m@23@01 2 5) (Map_update (Map_update (as Map_empty  Map<Int~_Int>) 2 5) 3 9))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_equal (Map_update m@23@01 2 5) (Map_update (Map_update (as Map_empty  Map<Int~_Int>) 2 5) 3 9)))
; [exec]
; assert m[2 := 5] == Map(2 := 6, 3 := 9, 2 := 5)
; [eval] m[2 := 5] == Map(2 := 6, 3 := 9, 2 := 5)
; [eval] m[2 := 5]
; [eval] Map(2 := 6, 3 := 9, 2 := 5)
; [eval] Map[Int,Int]()[2 := 6][3 := 9][2 := 5]
; [eval] Map[Int,Int]()[2 := 6][3 := 9]
; [eval] Map[Int,Int]()[2 := 6]
; [eval] Map[Int,Int]()
(push) ; 3
(assert (not (Map_equal (Map_update m@23@01 2 5) (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Int>) 2 6) 3 9) 2 5))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Map_equal (Map_update m@23@01 2 5) (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Int>) 2 6) 3 9) 2 5)))
(pop) ; 2
(pop) ; 1
; ---------- test8 ----------
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
; var m: Map[Int,Int]
(declare-const m@24@01 Map<Int~_Int>)
; [exec]
; m := Map(1 := 1, 2 := 4, 3 := 9)
; [eval] Map(1 := 1, 2 := 4, 3 := 9)
; [eval] Map[Int,Int]()[1 := 1][2 := 4][3 := 9]
; [eval] Map[Int,Int]()[1 := 1][2 := 4]
; [eval] Map[Int,Int]()[1 := 1]
; [eval] Map[Int,Int]()
(declare-const m@25@01 Map<Int~_Int>)
(assert (=
  m@25@01
  (Map_update (Map_update (Map_update (as Map_empty  Map<Int~_Int>) 1 1) 2 4) 3 9)))
; [exec]
; assert (forall i: Int :: { m[i] } (i in m) ==> m[i] == i * i)
; [eval] (forall i: Int :: { m[i] } (i in m) ==> m[i] == i * i)
(declare-const i@26@01 Int)
(push) ; 3
; [eval] (i in m) ==> m[i] == i * i
; [eval] (i in m)
(push) ; 4
; [then-branch: 11 | i@26@01 in domain(m@25@01) | live]
; [else-branch: 11 | !(i@26@01 in domain(m@25@01)) | live]
(push) ; 5
; [then-branch: 11 | i@26@01 in domain(m@25@01)]
(assert (Set_in i@26@01 (Map_domain m@25@01)))
; [eval] m[i] == i * i
; [eval] m[i]
; [eval] i * i
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(i@26@01 in domain(m@25@01))]
(assert (not (Set_in i@26@01 (Map_domain m@25@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in i@26@01 (Map_domain m@25@01)))
  (Set_in i@26@01 (Map_domain m@25@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int)) (!
  (or
    (not (Set_in i@26@01 (Map_domain m@25@01)))
    (Set_in i@26@01 (Map_domain m@25@01)))
  :pattern ((Map_apply m@25@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@72@10@72@61-aux|)))
(push) ; 3
(assert (not (forall ((i@26@01 Int)) (!
  (=>
    (Set_in i@26@01 (Map_domain m@25@01))
    (= (Map_apply m@25@01 i@26@01) (* i@26@01 i@26@01)))
  :pattern ((Map_apply m@25@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@72@10@72@61|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@26@01 Int)) (!
  (=>
    (Set_in i@26@01 (Map_domain m@25@01))
    (= (Map_apply m@25@01 i@26@01) (* i@26@01 i@26@01)))
  :pattern ((Map_apply m@25@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@72@10@72@61|)))
; [exec]
; assert !((0 in m))
; [eval] !((0 in m))
; [eval] (0 in m)
(push) ; 3
(assert (not (not (Set_in 0 (Map_domain m@25@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_in 0 (Map_domain m@25@01))))
; [exec]
; assert (1 in m)
; [eval] (1 in m)
(push) ; 3
(assert (not (Set_in 1 (Map_domain m@25@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 1 (Map_domain m@25@01)))
; [exec]
; assert (2 in m)
; [eval] (2 in m)
(push) ; 3
(assert (not (Set_in 2 (Map_domain m@25@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 2 (Map_domain m@25@01)))
; [exec]
; assert (3 in m)
; [eval] (3 in m)
(push) ; 3
(assert (not (Set_in 3 (Map_domain m@25@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 3 (Map_domain m@25@01)))
; [exec]
; assert (forall i: Int :: { (i in m) } i < 1 || i > 3 ==> !((i in m)))
; [eval] (forall i: Int :: { (i in m) } i < 1 || i > 3 ==> !((i in m)))
(declare-const i@27@01 Int)
(push) ; 3
; [eval] i < 1 || i > 3 ==> !((i in m))
; [eval] i < 1 || i > 3
; [eval] i < 1
(push) ; 4
; [then-branch: 12 | i@27@01 < 1 | live]
; [else-branch: 12 | !(i@27@01 < 1) | live]
(push) ; 5
; [then-branch: 12 | i@27@01 < 1]
(assert (< i@27@01 1))
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(i@27@01 < 1)]
(assert (not (< i@27@01 1)))
; [eval] i > 3
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< i@27@01 1)) (< i@27@01 1)))
(push) ; 4
; [then-branch: 13 | i@27@01 < 1 || i@27@01 > 3 | live]
; [else-branch: 13 | !(i@27@01 < 1 || i@27@01 > 3) | live]
(push) ; 5
; [then-branch: 13 | i@27@01 < 1 || i@27@01 > 3]
(assert (or (< i@27@01 1) (> i@27@01 3)))
; [eval] !((i in m))
; [eval] (i in m)
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(i@27@01 < 1 || i@27@01 > 3)]
(assert (not (or (< i@27@01 1) (> i@27@01 3))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (or (< i@27@01 1) (> i@27@01 3))) (or (< i@27@01 1) (> i@27@01 3))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@27@01 Int)) (!
  (and
    (or (not (< i@27@01 1)) (< i@27@01 1))
    (or (not (or (< i@27@01 1) (> i@27@01 3))) (or (< i@27@01 1) (> i@27@01 3))))
  :pattern ((Set_in i@27@01 (Map_domain m@25@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@77@10@77@67-aux|)))
(push) ; 3
(assert (not (forall ((i@27@01 Int)) (!
  (=>
    (or (< i@27@01 1) (> i@27@01 3))
    (not (Set_in i@27@01 (Map_domain m@25@01))))
  :pattern ((Set_in i@27@01 (Map_domain m@25@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@77@10@77@67|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@27@01 Int)) (!
  (=>
    (or (< i@27@01 1) (> i@27@01 3))
    (not (Set_in i@27@01 (Map_domain m@25@01))))
  :pattern ((Set_in i@27@01 (Map_domain m@25@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@77@10@77@67|)))
(pop) ; 2
(pop) ; 1
; ---------- test9 ----------
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
; var m: Map[Int,Int]
(declare-const m@28@01 Map<Int~_Int>)
; [exec]
; var i: Int
(declare-const i@29@01 Int)
; [exec]
; var n: Int
(declare-const n@30@01 Int)
; [exec]
; m := Map[Int,Int]()
; [eval] Map[Int,Int]()
; [exec]
; assert (forall k: Int :: { (k in m) } !((k in m)))
; [eval] (forall k: Int :: { (k in m) } !((k in m)))
(declare-const k@31@01 Int)
(push) ; 3
; [eval] !((k in m))
; [eval] (k in m)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
(assert (not (forall ((k@31@01 Int)) (!
  (not (Set_in k@31@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k@31@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@83@10@83@37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@31@01 Int)) (!
  (not (Set_in k@31@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k@31@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@83@10@83@37|)))
; [exec]
; i := 0
; [exec]
; n := 100
(declare-const m@32@01 Map<Int~_Int>)
(declare-const i@33@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@34@01 $Snap)
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (= ($Snap.first $t@34@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@33@01))
(assert (=
  ($Snap.second $t@34@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@34@01))
    ($Snap.second ($Snap.second $t@34@01)))))
(assert (= ($Snap.first ($Snap.second $t@34@01)) $Snap.unit))
; [eval] i <= n
(assert (<= i@33@01 100))
(assert (=
  ($Snap.second ($Snap.second $t@34@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@34@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@34@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@34@01))) $Snap.unit))
; [eval] n == 100
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@34@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@34@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@34@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@34@01))))
  $Snap.unit))
; [eval] (forall k: Int :: { (k in m) } (0 <= k && k < i) == (k in m))
(declare-const k@35@01 Int)
(push) ; 4
; [eval] (0 <= k && k < i) == (k in m)
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 5
; [then-branch: 14 | !(0 <= k@35@01) | live]
; [else-branch: 14 | 0 <= k@35@01 | live]
(push) ; 6
; [then-branch: 14 | !(0 <= k@35@01)]
(assert (not (<= 0 k@35@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | 0 <= k@35@01]
(assert (<= 0 k@35@01))
; [eval] k < i
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@35@01) (not (<= 0 k@35@01))))
; [eval] (k in m)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@35@01 Int)) (!
  (or (<= 0 k@35@01) (not (<= 0 k@35@01)))
  :pattern ((Set_in k@35@01 (Map_domain m@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62-aux|)))
(assert (forall ((k@35@01 Int)) (!
  (=
    (and (<= 0 k@35@01) (< k@35@01 i@33@01))
    (Set_in k@35@01 (Map_domain m@32@01)))
  :pattern ((Set_in k@35@01 (Map_domain m@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@34@01))))
  $Snap.unit))
; [eval] (forall k: Int :: { (k in m) } { m[k] } (k in m) ==> m[k] == k * k)
(declare-const k@36@01 Int)
(push) ; 4
; [eval] (k in m) ==> m[k] == k * k
; [eval] (k in m)
(push) ; 5
; [then-branch: 15 | k@36@01 in domain(m@32@01) | live]
; [else-branch: 15 | !(k@36@01 in domain(m@32@01)) | live]
(push) ; 6
; [then-branch: 15 | k@36@01 in domain(m@32@01)]
(assert (Set_in k@36@01 (Map_domain m@32@01)))
; [eval] m[k] == k * k
; [eval] m[k]
; [eval] k * k
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(k@36@01 in domain(m@32@01))]
(assert (not (Set_in k@36@01 (Map_domain m@32@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in k@36@01 (Map_domain m@32@01)))
  (Set_in k@36@01 (Map_domain m@32@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@36@01 Int)) (!
  (or
    (not (Set_in k@36@01 (Map_domain m@32@01)))
    (Set_in k@36@01 (Map_domain m@32@01)))
  :pattern ((Set_in k@36@01 (Map_domain m@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57-aux|)))
(assert (forall ((k@36@01 Int)) (!
  (or
    (not (Set_in k@36@01 (Map_domain m@32@01)))
    (Set_in k@36@01 (Map_domain m@32@01)))
  :pattern ((Map_apply m@32@01 k@36@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57-aux|)))
(assert (forall ((k@36@01 Int)) (!
  (=>
    (Set_in k@36@01 (Map_domain m@32@01))
    (= (Map_apply m@32@01 k@36@01) (* k@36@01 k@36@01)))
  :pattern ((Set_in k@36@01 (Map_domain m@32@01)))
  :pattern ((Map_apply m@32@01 k@36@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i <= n
; [eval] n == 100
; [eval] (forall k: Int :: { (k in m) } (0 <= k && k < i) == (k in m))
(declare-const k@37@01 Int)
(push) ; 4
; [eval] (0 <= k && k < i) == (k in m)
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 5
; [then-branch: 16 | !(0 <= k@37@01) | live]
; [else-branch: 16 | 0 <= k@37@01 | live]
(push) ; 6
; [then-branch: 16 | !(0 <= k@37@01)]
(assert (not (<= 0 k@37@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | 0 <= k@37@01]
(assert (<= 0 k@37@01))
; [eval] k < i
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@37@01) (not (<= 0 k@37@01))))
; [eval] (k in m)
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@37@01 Int)) (!
  (or (<= 0 k@37@01) (not (<= 0 k@37@01)))
  :pattern ((Set_in k@37@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62-aux|)))
(push) ; 4
(assert (not (forall ((k@37@01 Int)) (!
  (=
    (and (<= 0 k@37@01) (< k@37@01 0))
    (Set_in k@37@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k@37@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@37@01 Int)) (!
  (=
    (and (<= 0 k@37@01) (< k@37@01 0))
    (Set_in k@37@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k@37@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62|)))
; [eval] (forall k: Int :: { (k in m) } { m[k] } (k in m) ==> m[k] == k * k)
(declare-const k@38@01 Int)
(push) ; 4
; [eval] (k in m) ==> m[k] == k * k
; [eval] (k in m)
(push) ; 5
; [then-branch: 17 | k@38@01 in domain(Ø) | live]
; [else-branch: 17 | !(k@38@01 in domain(Ø)) | live]
(push) ; 6
; [then-branch: 17 | k@38@01 in domain(Ø)]
(assert (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
; [eval] m[k] == k * k
; [eval] m[k]
; [eval] k * k
(pop) ; 6
(push) ; 6
; [else-branch: 17 | !(k@38@01 in domain(Ø))]
(assert (not (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@38@01 Int)) (!
  (or
    (not (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
    (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57-aux|)))
(assert (forall ((k@38@01 Int)) (!
  (or
    (not (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
    (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Map_apply (as Map_empty  Map<Int~_Int>) k@38@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57-aux|)))
(push) ; 4
(assert (not (forall ((k@38@01 Int)) (!
  (=>
    (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>)))
    (= (Map_apply (as Map_empty  Map<Int~_Int>) k@38@01) (* k@38@01 k@38@01)))
  :pattern ((Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Map_apply (as Map_empty  Map<Int~_Int>) k@38@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@38@01 Int)) (!
  (=>
    (Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>)))
    (= (Map_apply (as Map_empty  Map<Int~_Int>) k@38@01) (* k@38@01 k@38@01)))
  :pattern ((Set_in k@38@01 (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Map_apply (as Map_empty  Map<Int~_Int>) k@38@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@34@01 ($Snap.combine ($Snap.first $t@34@01) ($Snap.second $t@34@01))))
(assert (= ($Snap.first $t@34@01) $Snap.unit))
(assert (<= 0 i@33@01))
(assert (=
  ($Snap.second $t@34@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@34@01))
    ($Snap.second ($Snap.second $t@34@01)))))
(assert (= ($Snap.first ($Snap.second $t@34@01)) $Snap.unit))
(assert (<= i@33@01 100))
(assert (=
  ($Snap.second ($Snap.second $t@34@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@34@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@34@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@34@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@34@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@34@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@34@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@34@01))))
  $Snap.unit))
(assert (forall ((k@35@01 Int)) (!
  (or (<= 0 k@35@01) (not (<= 0 k@35@01)))
  :pattern ((Set_in k@35@01 (Map_domain m@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62-aux|)))
(assert (forall ((k@35@01 Int)) (!
  (=
    (and (<= 0 k@35@01) (< k@35@01 i@33@01))
    (Set_in k@35@01 (Map_domain m@32@01)))
  :pattern ((Set_in k@35@01 (Map_domain m@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@34@01))))
  $Snap.unit))
(assert (forall ((k@36@01 Int)) (!
  (or
    (not (Set_in k@36@01 (Map_domain m@32@01)))
    (Set_in k@36@01 (Map_domain m@32@01)))
  :pattern ((Set_in k@36@01 (Map_domain m@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57-aux|)))
(assert (forall ((k@36@01 Int)) (!
  (or
    (not (Set_in k@36@01 (Map_domain m@32@01)))
    (Set_in k@36@01 (Map_domain m@32@01)))
  :pattern ((Map_apply m@32@01 k@36@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57-aux|)))
(assert (forall ((k@36@01 Int)) (!
  (=>
    (Set_in k@36@01 (Map_domain m@32@01))
    (= (Map_apply m@32@01 k@36@01) (* k@36@01 k@36@01)))
  :pattern ((Set_in k@36@01 (Map_domain m@32@01)))
  :pattern ((Map_apply m@32@01 k@36@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] i < n
(pop) ; 5
(push) ; 5
; [eval] !(i < n)
; [eval] i < n
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < n
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@33@01 100))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@33@01 100)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | i@33@01 < 100 | live]
; [else-branch: 18 | !(i@33@01 < 100) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | i@33@01 < 100]
(assert (< i@33@01 100))
; [exec]
; m := m[i := i * i]
; [eval] m[i := i * i]
; [eval] i * i
(declare-const m@39@01 Map<Int~_Int>)
(assert (= m@39@01 (Map_update m@32@01 i@33@01 (* i@33@01 i@33@01))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@40@01 Int)
(assert (= i@40@01 (+ i@33@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(push) ; 6
(assert (not (<= 0 i@40@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@40@01))
; [eval] i <= n
(push) ; 6
(assert (not (<= i@40@01 100)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@40@01 100))
; [eval] n == 100
; [eval] (forall k: Int :: { (k in m) } (0 <= k && k < i) == (k in m))
(declare-const k@41@01 Int)
(push) ; 6
; [eval] (0 <= k && k < i) == (k in m)
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 7
; [then-branch: 19 | !(0 <= k@41@01) | live]
; [else-branch: 19 | 0 <= k@41@01 | live]
(push) ; 8
; [then-branch: 19 | !(0 <= k@41@01)]
(assert (not (<= 0 k@41@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | 0 <= k@41@01]
(assert (<= 0 k@41@01))
; [eval] k < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@41@01) (not (<= 0 k@41@01))))
; [eval] (k in m)
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@41@01 Int)) (!
  (or (<= 0 k@41@01) (not (<= 0 k@41@01)))
  :pattern ((Set_in k@41@01 (Map_domain m@39@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62-aux|)))
(push) ; 6
(assert (not (forall ((k@41@01 Int)) (!
  (=
    (and (<= 0 k@41@01) (< k@41@01 i@40@01))
    (Set_in k@41@01 (Map_domain m@39@01)))
  :pattern ((Set_in k@41@01 (Map_domain m@39@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@41@01 Int)) (!
  (=
    (and (<= 0 k@41@01) (< k@41@01 i@40@01))
    (Set_in k@41@01 (Map_domain m@39@01)))
  :pattern ((Set_in k@41@01 (Map_domain m@39@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@90@15@90@62|)))
; [eval] (forall k: Int :: { (k in m) } { m[k] } (k in m) ==> m[k] == k * k)
(declare-const k@42@01 Int)
(push) ; 6
; [eval] (k in m) ==> m[k] == k * k
; [eval] (k in m)
(push) ; 7
; [then-branch: 20 | k@42@01 in domain(m@39@01) | live]
; [else-branch: 20 | !(k@42@01 in domain(m@39@01)) | live]
(push) ; 8
; [then-branch: 20 | k@42@01 in domain(m@39@01)]
(assert (Set_in k@42@01 (Map_domain m@39@01)))
; [eval] m[k] == k * k
; [eval] m[k]
; [eval] k * k
(pop) ; 8
(push) ; 8
; [else-branch: 20 | !(k@42@01 in domain(m@39@01))]
(assert (not (Set_in k@42@01 (Map_domain m@39@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in k@42@01 (Map_domain m@39@01)))
  (Set_in k@42@01 (Map_domain m@39@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@42@01 Int)) (!
  (or
    (not (Set_in k@42@01 (Map_domain m@39@01)))
    (Set_in k@42@01 (Map_domain m@39@01)))
  :pattern ((Set_in k@42@01 (Map_domain m@39@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57-aux|)))
(assert (forall ((k@42@01 Int)) (!
  (or
    (not (Set_in k@42@01 (Map_domain m@39@01)))
    (Set_in k@42@01 (Map_domain m@39@01)))
  :pattern ((Map_apply m@39@01 k@42@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57-aux|)))
(push) ; 6
(assert (not (forall ((k@42@01 Int)) (!
  (=>
    (Set_in k@42@01 (Map_domain m@39@01))
    (= (Map_apply m@39@01 k@42@01) (* k@42@01 k@42@01)))
  :pattern ((Set_in k@42@01 (Map_domain m@39@01)))
  :pattern ((Map_apply m@39@01 k@42@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@42@01 Int)) (!
  (=>
    (Set_in k@42@01 (Map_domain m@39@01))
    (= (Map_apply m@39@01 k@42@01) (* k@42@01 k@42@01)))
  :pattern ((Set_in k@42@01 (Map_domain m@39@01)))
  :pattern ((Map_apply m@39@01 k@42@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@91@15@91@57|)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(i@33@01 < 100)]
(assert (not (< i@33@01 100)))
(pop) ; 5
; [eval] !(i < n)
; [eval] i < n
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@33@01 100)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@33@01 100))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | !(i@33@01 < 100) | live]
; [else-branch: 21 | i@33@01 < 100 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | !(i@33@01 < 100)]
(assert (not (< i@33@01 100)))
; [exec]
; test4(m)
; [eval] (forall i: Int :: { (i in m) } { m[i] } 0 <= i && i < 100 ==> (i in m) && m[i] == i * i)
(declare-const i@43@01 Int)
(push) ; 6
; [eval] 0 <= i && i < 100 ==> (i in m) && m[i] == i * i
; [eval] 0 <= i && i < 100
; [eval] 0 <= i
(push) ; 7
; [then-branch: 22 | !(0 <= i@43@01) | live]
; [else-branch: 22 | 0 <= i@43@01 | live]
(push) ; 8
; [then-branch: 22 | !(0 <= i@43@01)]
(assert (not (<= 0 i@43@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 22 | 0 <= i@43@01]
(assert (<= 0 i@43@01))
; [eval] i < 100
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@43@01) (not (<= 0 i@43@01))))
(push) ; 7
; [then-branch: 23 | 0 <= i@43@01 && i@43@01 < 100 | live]
; [else-branch: 23 | !(0 <= i@43@01 && i@43@01 < 100) | live]
(push) ; 8
; [then-branch: 23 | 0 <= i@43@01 && i@43@01 < 100]
(assert (and (<= 0 i@43@01) (< i@43@01 100)))
; [eval] (i in m) && m[i] == i * i
; [eval] (i in m)
(push) ; 9
; [then-branch: 24 | !(i@43@01 in domain(m@32@01)) | live]
; [else-branch: 24 | i@43@01 in domain(m@32@01) | live]
(push) ; 10
; [then-branch: 24 | !(i@43@01 in domain(m@32@01))]
(assert (not (Set_in i@43@01 (Map_domain m@32@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 24 | i@43@01 in domain(m@32@01)]
(assert (Set_in i@43@01 (Map_domain m@32@01)))
; [eval] m[i] == i * i
; [eval] m[i]
; [eval] i * i
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (Set_in i@43@01 (Map_domain m@32@01))
  (not (Set_in i@43@01 (Map_domain m@32@01)))))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | !(0 <= i@43@01 && i@43@01 < 100)]
(assert (not (and (<= 0 i@43@01) (< i@43@01 100))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and (<= 0 i@43@01) (< i@43@01 100))
  (and
    (<= 0 i@43@01)
    (< i@43@01 100)
    (or
      (Set_in i@43@01 (Map_domain m@32@01))
      (not (Set_in i@43@01 (Map_domain m@32@01)))))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@43@01) (< i@43@01 100)))
  (and (<= 0 i@43@01) (< i@43@01 100))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@43@01 Int)) (!
  (and
    (or (<= 0 i@43@01) (not (<= 0 i@43@01)))
    (=>
      (and (<= 0 i@43@01) (< i@43@01 100))
      (and
        (<= 0 i@43@01)
        (< i@43@01 100)
        (or
          (Set_in i@43@01 (Map_domain m@32@01))
          (not (Set_in i@43@01 (Map_domain m@32@01))))))
    (or
      (not (and (<= 0 i@43@01) (< i@43@01 100)))
      (and (<= 0 i@43@01) (< i@43@01 100))))
  :pattern ((Set_in i@43@01 (Map_domain m@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@37@12@37@75-aux|)))
(assert (forall ((i@43@01 Int)) (!
  (and
    (or (<= 0 i@43@01) (not (<= 0 i@43@01)))
    (=>
      (and (<= 0 i@43@01) (< i@43@01 100))
      (and
        (<= 0 i@43@01)
        (< i@43@01 100)
        (or
          (Set_in i@43@01 (Map_domain m@32@01))
          (not (Set_in i@43@01 (Map_domain m@32@01))))))
    (or
      (not (and (<= 0 i@43@01) (< i@43@01 100)))
      (and (<= 0 i@43@01) (< i@43@01 100))))
  :pattern ((Map_apply m@32@01 i@43@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@37@12@37@75-aux|)))
(push) ; 6
(assert (not (forall ((i@43@01 Int)) (!
  (=>
    (and (<= 0 i@43@01) (< i@43@01 100))
    (and
      (Set_in i@43@01 (Map_domain m@32@01))
      (= (Map_apply m@32@01 i@43@01) (* i@43@01 i@43@01))))
  :pattern ((Set_in i@43@01 (Map_domain m@32@01)))
  :pattern ((Map_apply m@32@01 i@43@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@37@12@37@75|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@43@01 Int)) (!
  (=>
    (and (<= 0 i@43@01) (< i@43@01 100))
    (and
      (Set_in i@43@01 (Map_domain m@32@01))
      (= (Map_apply m@32@01 i@43@01) (* i@43@01 i@43@01))))
  :pattern ((Set_in i@43@01 (Map_domain m@32@01)))
  :pattern ((Map_apply m@32@01 i@43@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@37@12@37@75|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 21 | i@33@01 < 100]
(assert (< i@33@01 100))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
(declare-const m@44@01 Map<Int~_Int>)
(declare-const m@45@01 Map<Int~_Int>)
(push) ; 1
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(assert (= ($Snap.first $t@46@01) $Snap.unit))
; [eval] (forall i: Int :: { (i in m) } (0 <= i && i < 10) == (i in m))
(declare-const i@47@01 Int)
(push) ; 2
; [eval] (0 <= i && i < 10) == (i in m)
; [eval] 0 <= i && i < 10
; [eval] 0 <= i
(push) ; 3
; [then-branch: 25 | !(0 <= i@47@01) | live]
; [else-branch: 25 | 0 <= i@47@01 | live]
(push) ; 4
; [then-branch: 25 | !(0 <= i@47@01)]
(assert (not (<= 0 i@47@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 25 | 0 <= i@47@01]
(assert (<= 0 i@47@01))
; [eval] i < 10
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@47@01) (not (<= 0 i@47@01))))
; [eval] (i in m)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@47@01 Int)) (!
  (or (<= 0 i@47@01) (not (<= 0 i@47@01)))
  :pattern ((Set_in i@47@01 (Map_domain m@45@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@101@12@101@71-aux|)))
(assert (forall ((i@47@01 Int)) (!
  (= (and (<= 0 i@47@01) (< i@47@01 10)) (Set_in i@47@01 (Map_domain m@45@01)))
  :pattern ((Set_in i@47@01 (Map_domain m@45@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@101@12@101@71|)))
(assert (= ($Snap.second $t@46@01) $Snap.unit))
; [eval] (forall i: Int :: { m[i] } (i in m) ==> m[i] == i * 2)
(declare-const i@48@01 Int)
(push) ; 2
; [eval] (i in m) ==> m[i] == i * 2
; [eval] (i in m)
(push) ; 3
; [then-branch: 26 | i@48@01 in domain(m@45@01) | live]
; [else-branch: 26 | !(i@48@01 in domain(m@45@01)) | live]
(push) ; 4
; [then-branch: 26 | i@48@01 in domain(m@45@01)]
(assert (Set_in i@48@01 (Map_domain m@45@01)))
; [eval] m[i] == i * 2
; [eval] m[i]
; [eval] i * 2
(pop) ; 4
(push) ; 4
; [else-branch: 26 | !(i@48@01 in domain(m@45@01))]
(assert (not (Set_in i@48@01 (Map_domain m@45@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in i@48@01 (Map_domain m@45@01)))
  (Set_in i@48@01 (Map_domain m@45@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@48@01 Int)) (!
  (or
    (not (Set_in i@48@01 (Map_domain m@45@01)))
    (Set_in i@48@01 (Map_domain m@45@01)))
  :pattern ((Map_apply m@45@01 i@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@102@12@102@63-aux|)))
(assert (forall ((i@48@01 Int)) (!
  (=>
    (Set_in i@48@01 (Map_domain m@45@01))
    (= (Map_apply m@45@01 i@48@01) (* i@48@01 2)))
  :pattern ((Map_apply m@45@01 i@48@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@102@12@102@63|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (0 in m)
; [eval] (0 in m)
(push) ; 3
(assert (not (Set_in 0 (Map_domain m@45@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 0 (Map_domain m@45@01)))
; [exec]
; assert (1 in m)
; [eval] (1 in m)
(push) ; 3
(assert (not (Set_in 1 (Map_domain m@45@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 1 (Map_domain m@45@01)))
; [exec]
; assert !((10 in m))
; [eval] !((10 in m))
; [eval] (10 in m)
(push) ; 3
(assert (not (not (Set_in 10 (Map_domain m@45@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_in 10 (Map_domain m@45@01))))
; [exec]
; assert m[0] == 0 && m[2] == 4
; [eval] m[0] == 0
; [eval] m[0]
(push) ; 3
(assert (not (= (Map_apply m@45@01 0) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@45@01 0) 0))
; [eval] m[2] == 4
; [eval] m[2]
(push) ; 3
(assert (not (Set_in 2 (Map_domain m@45@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Map_apply m@45@01 2) 4)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@45@01 2) 4))
(pop) ; 2
(pop) ; 1
; ---------- test11 ----------
(declare-const m@49@01 Map<Int~_Int>)
(declare-const m@50@01 Map<Int~_Int>)
(push) ; 1
(declare-const $t@51@01 $Snap)
(assert (= $t@51@01 ($Snap.combine ($Snap.first $t@51@01) ($Snap.second $t@51@01))))
(assert (= ($Snap.first $t@51@01) $Snap.unit))
; [eval] (forall i: Int :: { (i in m) } (2 <= i && i < 6) == (i in m))
(declare-const i@52@01 Int)
(push) ; 2
; [eval] (2 <= i && i < 6) == (i in m)
; [eval] 2 <= i && i < 6
; [eval] 2 <= i
(push) ; 3
; [then-branch: 27 | !(2 <= i@52@01) | live]
; [else-branch: 27 | 2 <= i@52@01 | live]
(push) ; 4
; [then-branch: 27 | !(2 <= i@52@01)]
(assert (not (<= 2 i@52@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 27 | 2 <= i@52@01]
(assert (<= 2 i@52@01))
; [eval] i < 6
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 2 i@52@01) (not (<= 2 i@52@01))))
; [eval] (i in m)
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@52@01 Int)) (!
  (or (<= 2 i@52@01) (not (<= 2 i@52@01)))
  :pattern ((Set_in i@52@01 (Map_domain m@50@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@111@12@111@70-aux|)))
(assert (forall ((i@52@01 Int)) (!
  (= (and (<= 2 i@52@01) (< i@52@01 6)) (Set_in i@52@01 (Map_domain m@50@01)))
  :pattern ((Set_in i@52@01 (Map_domain m@50@01)))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@111@12@111@70|)))
(assert (= ($Snap.second $t@51@01) $Snap.unit))
; [eval] (forall i: Int :: { m[i] } (i in m) ==> m[i] == i + 1)
(declare-const i@53@01 Int)
(push) ; 2
; [eval] (i in m) ==> m[i] == i + 1
; [eval] (i in m)
(push) ; 3
; [then-branch: 28 | i@53@01 in domain(m@50@01) | live]
; [else-branch: 28 | !(i@53@01 in domain(m@50@01)) | live]
(push) ; 4
; [then-branch: 28 | i@53@01 in domain(m@50@01)]
(assert (Set_in i@53@01 (Map_domain m@50@01)))
; [eval] m[i] == i + 1
; [eval] m[i]
; [eval] i + 1
(pop) ; 4
(push) ; 4
; [else-branch: 28 | !(i@53@01 in domain(m@50@01))]
(assert (not (Set_in i@53@01 (Map_domain m@50@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in i@53@01 (Map_domain m@50@01)))
  (Set_in i@53@01 (Map_domain m@50@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@53@01 Int)) (!
  (or
    (not (Set_in i@53@01 (Map_domain m@50@01)))
    (Set_in i@53@01 (Map_domain m@50@01)))
  :pattern ((Map_apply m@50@01 i@53@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@112@12@112@63-aux|)))
(assert (forall ((i@53@01 Int)) (!
  (=>
    (Set_in i@53@01 (Map_domain m@50@01))
    (= (Map_apply m@50@01 i@53@01) (+ i@53@01 1)))
  :pattern ((Map_apply m@50@01 i@53@01))
  :qid |prog./silicon/silver/src/test/resources/all/maps/example2.vpr@112@12@112@63|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (5 in domain(m))
; [eval] (5 in domain(m))
; [eval] domain(m)
(push) ; 3
(assert (not (Set_in 5 (Map_domain m@50@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 5 (Map_domain m@50@01)))
; [exec]
; assert !((6 in domain(m)))
; [eval] !((6 in domain(m)))
; [eval] (6 in domain(m))
; [eval] domain(m)
(push) ; 3
(assert (not (not (Set_in 6 (Map_domain m@50@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_in 6 (Map_domain m@50@01))))
; [exec]
; assert m[5] == 6
; [eval] m[5] == 6
; [eval] m[5]
(push) ; 3
(assert (not (= (Map_apply m@50@01 5) 6)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@50@01 5) 6))
; [exec]
; assert (6 in range(m))
; [eval] (6 in range(m))
; [eval] range(m)
(push) ; 3
(assert (not (Set_in 6 (Map_values m@50@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in 6 (Map_values m@50@01)))
(pop) ; 2
(pop) ; 1
