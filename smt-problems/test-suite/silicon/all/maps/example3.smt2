(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:05:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/maps/example3.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<Set<Int>> 0)
(declare-sort Map<Set<Int>~_Int> 0)
(declare-sort Map<Int~_Bool> 0)
(declare-sort Test<Int> 0)
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
(declare-fun $SortWrappers.Set<Set<Int>>To$Snap (Set<Set<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Set<Int>> ($Snap) Set<Set<Int>>)
(assert (forall ((x Set<Set<Int>>)) (!
    (= x ($SortWrappers.$SnapToSet<Set<Int>>($SortWrappers.Set<Set<Int>>To$Snap x)))
    :pattern (($SortWrappers.Set<Set<Int>>To$Snap x))
    :qid |$Snap.$SnapToSet<Set<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Set<Int>>To$Snap($SortWrappers.$SnapToSet<Set<Int>> x)))
    :pattern (($SortWrappers.$SnapToSet<Set<Int>> x))
    :qid |$Snap.Set<Set<Int>>To$SnapToSet<Set<Int>>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Map<Set<Int>~_Int>To$Snap (Map<Set<Int>~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Set<Int>~_Int> ($Snap) Map<Set<Int>~_Int>)
(assert (forall ((x Map<Set<Int>~_Int>)) (!
    (= x ($SortWrappers.$SnapToMap<Set<Int>~_Int>($SortWrappers.Map<Set<Int>~_Int>To$Snap x)))
    :pattern (($SortWrappers.Map<Set<Int>~_Int>To$Snap x))
    :qid |$Snap.$SnapToMap<Set<Int>~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Set<Int>~_Int>To$Snap($SortWrappers.$SnapToMap<Set<Int>~_Int> x)))
    :pattern (($SortWrappers.$SnapToMap<Set<Int>~_Int> x))
    :qid |$Snap.Map<Set<Int>~_Int>To$SnapToMap<Set<Int>~_Int>|
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
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Test<Int>To$Snap (Test<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToTest<Int> ($Snap) Test<Int>)
(assert (forall ((x Test<Int>)) (!
    (= x ($SortWrappers.$SnapToTest<Int>($SortWrappers.Test<Int>To$Snap x)))
    :pattern (($SortWrappers.Test<Int>To$Snap x))
    :qid |$Snap.$SnapToTest<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Test<Int>To$Snap($SortWrappers.$SnapToTest<Int> x)))
    :pattern (($SortWrappers.$SnapToTest<Int> x))
    :qid |$Snap.Test<Int>To$SnapToTest<Int>|
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
(declare-fun Set_card (Set<Set<Int>>) Int)
(declare-const Set_empty Set<Set<Int>>)
(declare-fun Set_in (Set<Int> Set<Set<Int>>) Bool)
(declare-fun Set_singleton (Set<Int>) Set<Set<Int>>)
(declare-fun Set_unionone (Set<Set<Int>> Set<Int>) Set<Set<Int>>)
(declare-fun Set_union (Set<Set<Int>> Set<Set<Int>>) Set<Set<Int>>)
(declare-fun Set_intersection (Set<Set<Int>> Set<Set<Int>>) Set<Set<Int>>)
(declare-fun Set_difference (Set<Set<Int>> Set<Set<Int>>) Set<Set<Int>>)
(declare-fun Set_subset (Set<Set<Int>> Set<Set<Int>>) Bool)
(declare-fun Set_equal (Set<Set<Int>> Set<Set<Int>>) Bool)
(declare-fun Set_skolem_diff (Set<Set<Int>> Set<Set<Int>>) Set<Int>)
(declare-fun Map_apply (Map<Set<Int>~_Int> Set<Int>) Int)
(declare-fun Map_card (Map<Set<Int>~_Int>) Int)
(declare-fun Map_disjoint (Map<Set<Int>~_Int> Map<Set<Int>~_Int>) Bool)
(declare-fun Map_domain (Map<Set<Int>~_Int>) Set<Set<Int>>)
(declare-const Map_empty Map<Set<Int>~_Int>)
(declare-fun Map_equal (Map<Set<Int>~_Int> Map<Set<Int>~_Int>) Bool)
(declare-fun Map_update (Map<Set<Int>~_Int> Set<Int> Int) Map<Set<Int>~_Int>)
(declare-fun Map_values (Map<Set<Int>~_Int>) Set<Int>)
(declare-fun Map_range_domain_skolem (Map<Set<Int>~_Int> Int) Set<Int>)
(declare-fun Map_apply (Map<Int~_Bool> Int) Bool)
(declare-fun Map_card (Map<Int~_Bool>) Int)
(declare-fun Map_disjoint (Map<Int~_Bool> Map<Int~_Bool>) Bool)
(declare-fun Map_domain (Map<Int~_Bool>) Set<Int>)
(declare-const Map_empty Map<Int~_Bool>)
(declare-fun Map_equal (Map<Int~_Bool> Map<Int~_Bool>) Bool)
(declare-fun Map_update (Map<Int~_Bool> Int Bool) Map<Int~_Bool>)
(declare-fun Map_values (Map<Int~_Bool>) Set<Bool>)
(declare-fun Map_range_domain_skolem (Map<Int~_Bool> Bool) Int)
(declare-fun f<Map<Set<Int>~Int>> (Int) Map<Set<Int>~_Int>)
; Declaring symbols related to program functions (from program analysis)
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
(assert (forall ((s Set<Set<Int>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Set<Int>)) (!
  (not (Set_in o (as Set_empty  Set<Set<Int>>)))
  :pattern ((Set_in o (as Set_empty  Set<Set<Int>>)))
  )))
(assert (forall ((s Set<Set<Int>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Set<Int>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Set<Int>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Set<Int>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Set<Int>) (o Set<Int>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Set<Int>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>) (o Set<Int>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>) (y Set<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Int>>) (x Set<Int>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (o Set<Int>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (y Set<Int>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (y Set<Int>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (o Set<Int>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (o Set<Int>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>) (y Set<Int>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
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
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Set<Int>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
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
(assert (forall ((a Set<Set<Int>>) (b Set<Set<Int>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((m Map<Set<Int>~_Int>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  )))
(assert (forall ((m Map<Set<Int>~_Int>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Set<Int>~_Int>) (m2 Map<Set<Int>~_Int>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Set<Int>)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((m1 Map<Set<Int>~_Int>) (m2 Map<Set<Int>~_Int>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Set<Int>)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  )))
(assert (forall ((k Set<Int>)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Set<Int>~_Int>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Set<Int>~_Int>))))
  )))
(assert (forall ((m Map<Set<Int>~_Int>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Set<Int>~_Int>)))
    (and
      (=>
        (not (= (Map_card m) 0))
        (exists ((u Set<Int>)) 
          (Set_in u (Map_domain m))))
      (forall ((u Set<Int>)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  )))
(assert (forall ((m1 Map<Set<Int>~_Int>) (m2 Map<Set<Int>~_Int>)) (!
  (=>
    (and
      (forall ((k Set<Int>)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Set<Int>)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m1 Map<Set<Int>~_Int>) (m2 Map<Set<Int>~_Int>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  )))
(assert (forall ((m Map<Set<Int>~_Int>) (k1 Set<Int>) (k2 Set<Int>) (v Int)) (!
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
(assert (forall ((m Map<Set<Int>~_Int>) (k Set<Int>) (v Int)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  )))
(assert (forall ((m Map<Set<Int>~_Int>) (v Int)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  )))
(assert (forall ((m Map<Set<Int>~_Int>) (k Set<Int>)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  )))
(assert (forall ((m Map<Set<Int>~_Int>) (k Set<Int>)) (!
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
(assert (forall ((x Int) (s Set<Int>)) (!
  (= (Set_in s (Map_domain (f<Map<Set<Int>~Int>> x))) (Set_in x s))
  :pattern ((Set_in s (Map_domain (f<Map<Set<Int>~Int>> x))))
  )))
(assert (forall ((x Int) (s Set<Int>)) (!
  (=>
    (Set_in s (Map_domain (f<Map<Set<Int>~Int>> x)))
    (= (Map_apply (f<Map<Set<Int>~Int>> x) s) x))
  :pattern ((Map_apply (f<Map<Set<Int>~Int>> x) s))
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
; var m: Map[Set[Int],Int]
(declare-const m@0@01 Map<Set<Int>~_Int>)
; [exec]
; var s: Set[Int]
(declare-const s@1@01 Set<Int>)
; [exec]
; m := Map(Set(5, 7) := 12)
; [eval] Map(Set(5, 7) := 12)
; [eval] Map[Set[Int],Int]()[Set(5, 7) := 12]
; [eval] Map[Set[Int],Int]()
; [eval] Set(5, 7)
(declare-const m@2@01 Map<Set<Int>~_Int>)
(assert (=
  m@2@01
  (Map_update (as Map_empty  Map<Set<Int>~_Int>) (Set_unionone (Set_singleton 5) 7) 12)))
; [exec]
; s := Set(7, 5)
; [eval] Set(7, 5)
(declare-const s@3@01 Set<Int>)
(assert (= s@3@01 (Set_unionone (Set_singleton 7) 5)))
; [exec]
; assert s == Set(5, 7)
; [eval] s == Set(5, 7)
; [eval] Set(5, 7)
(push) ; 3
(assert (not (Set_equal s@3@01 (Set_unionone (Set_singleton 5) 7))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_equal s@3@01 (Set_unionone (Set_singleton 5) 7)))
; [exec]
; assert (s in m)
; [eval] (s in m)
(push) ; 3
(assert (not (Set_in s@3@01 (Map_domain m@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in s@3@01 (Map_domain m@2@01)))
; [exec]
; assert m[s] == 12
; [eval] m[s] == 12
; [eval] m[s]
(push) ; 3
(assert (not (= (Map_apply m@2@01 s@3@01) 12)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply m@2@01 s@3@01) 12))
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
; var s: Set[Int]
(declare-const s@4@01 Set<Int>)
; [exec]
; assert (Set(1, 2, 3) in (f(2): Map[Set[Int],Int]))
; [eval] (Set(1, 2, 3) in (f(2): Map[Set[Int],Int]))
; [eval] Set(1, 2, 3)
; [eval] (f(2): Map[Set[Int],Int])
(push) ; 3
(assert (not (Set_in (Set_unionone (Set_unionone (Set_singleton 1) 2) 3) (Map_domain (f<Map<Set<Int>~Int>> 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in (Set_unionone (Set_unionone (Set_singleton 1) 2) 3) (Map_domain (f<Map<Set<Int>~Int>> 2))))
; [exec]
; s := Set(1, 2, 3)
; [eval] Set(1, 2, 3)
(declare-const s@5@01 Set<Int>)
(assert (= s@5@01 (Set_unionone (Set_unionone (Set_singleton 1) 2) 3)))
; [exec]
; assert (f(2): Map[Set[Int],Int])[s] == 2
; [eval] (f(2): Map[Set[Int],Int])[s] == 2
; [eval] (f(2): Map[Set[Int],Int])[s]
; [eval] (f(2): Map[Set[Int],Int])
(push) ; 3
(assert (not (Set_in s@5@01 (Map_domain (f<Map<Set<Int>~Int>> 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= (Map_apply (f<Map<Set<Int>~Int>> 2) s@5@01) 2)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= (Map_apply (f<Map<Set<Int>~Int>> 2) s@5@01) 2))
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
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
; var m: Map[Int,Bool]
(declare-const m@6@01 Map<Int~_Bool>)
; [exec]
; var k: Int
(declare-const k@7@01 Int)
; [exec]
; inhale domain(m[4 := true]) == Set(4)
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] domain(m[4 := true]) == Set(4)
; [eval] domain(m[4 := true])
; [eval] m[4 := true]
; [eval] Set(4)
(assert (Set_equal (Map_domain (Map_update m@6@01 4 true)) (Set_singleton 4)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (k in domain(m)) ==> k == 4
; [eval] (k in domain(m)) ==> k == 4
; [eval] (k in domain(m))
; [eval] domain(m)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (Set_in k@7@01 (Map_domain m@6@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (Set_in k@7@01 (Map_domain m@6@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | k@7@01 in domain(m@6@01) | live]
; [else-branch: 0 | !(k@7@01 in domain(m@6@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 0 | k@7@01 in domain(m@6@01)]
(assert (Set_in k@7@01 (Map_domain m@6@01)))
; [eval] k == 4
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(k@7@01 in domain(m@6@01))]
(assert (not (Set_in k@7@01 (Map_domain m@6@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in k@7@01 (Map_domain m@6@01)))
  (Set_in k@7@01 (Map_domain m@6@01))))
(push) ; 3
(assert (not (=> (Set_in k@7@01 (Map_domain m@6@01)) (= k@7@01 4))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (Set_in k@7@01 (Map_domain m@6@01)) (= k@7@01 4)))
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
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
; var m: Map[Int,Bool]
(declare-const m@9@01 Map<Int~_Bool>)
; [exec]
; var k: Int
(declare-const k@10@01 Int)
; [exec]
; inhale m[4 := true] == Map(4 := false, 5 := true)
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 $Snap.unit))
; [eval] m[4 := true] == Map(4 := false, 5 := true)
; [eval] m[4 := true]
; [eval] Map(4 := false, 5 := true)
; [eval] Map[Int,Bool]()[4 := false][5 := true]
; [eval] Map[Int,Bool]()[4 := false]
; [eval] Map[Int,Bool]()
(assert (Map_equal (Map_update m@9@01 4 true) (Map_update (Map_update (as Map_empty  Map<Int~_Bool>) 4 false) 5 true)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (k in domain(m)) ==> m[k]
; [eval] (k in domain(m)) ==> m[k]
; [eval] (k in domain(m))
; [eval] domain(m)
(set-option :timeout 0)
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (Set_in k@10@01 (Map_domain m@9@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (Set_in k@10@01 (Map_domain m@9@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 1 | k@10@01 in domain(m@9@01) | live]
; [else-branch: 1 | !(k@10@01 in domain(m@9@01)) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | k@10@01 in domain(m@9@01)]
(assert (Set_in k@10@01 (Map_domain m@9@01)))
; [eval] m[k]
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(k@10@01 in domain(m@9@01))]
(assert (not (Set_in k@10@01 (Map_domain m@9@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in k@10@01 (Map_domain m@9@01)))
  (Set_in k@10@01 (Map_domain m@9@01))))
(push) ; 3
(assert (not (=> (Set_in k@10@01 (Map_domain m@9@01)) (Map_apply m@9@01 k@10@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=> (Set_in k@10@01 (Map_domain m@9@01)) (Map_apply m@9@01 k@10@01)))
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
; var m: Map[Int,Bool]
(declare-const m@12@01 Map<Int~_Bool>)
; [exec]
; var k: Int
(declare-const k@13@01 Int)
; [exec]
; inhale (k in domain(m))
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] (k in domain(m))
; [eval] domain(m)
(assert (Set_in k@13@01 (Map_domain m@12@01)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert range(m) != Set[Bool]()
; [eval] range(m) != Set[Bool]()
; [eval] range(m)
; [eval] Set[Bool]()
(set-option :timeout 0)
(push) ; 3
(assert (not (not (Set_equal (Map_values m@12@01) (as Set_empty  Set<Bool>)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (Set_equal (Map_values m@12@01) (as Set_empty  Set<Bool>))))
(pop) ; 2
(pop) ; 1
