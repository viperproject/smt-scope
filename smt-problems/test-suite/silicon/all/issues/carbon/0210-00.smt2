(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:45
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0210.vpr
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
(declare-sort Foobar 0)
(declare-sort $FVF<next> 0)
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
(declare-fun $SortWrappers.FoobarTo$Snap (Foobar) $Snap)
(declare-fun $SortWrappers.$SnapToFoobar ($Snap) Foobar)
(assert (forall ((x Foobar)) (!
    (= x ($SortWrappers.$SnapToFoobar($SortWrappers.FoobarTo$Snap x)))
    :pattern (($SortWrappers.FoobarTo$Snap x))
    :qid |$Snap.$SnapToFoobarTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FoobarTo$Snap($SortWrappers.$SnapToFoobar x)))
    :pattern (($SortWrappers.$SnapToFoobar x))
    :qid |$Snap.FoobarTo$SnapToFoobar|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<next>To$Snap ($FVF<next>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<next> ($Snap) $FVF<next>)
(assert (forall ((x $FVF<next>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<next>($SortWrappers.$FVF<next>To$Snap x)))
    :pattern (($SortWrappers.$FVF<next>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<next>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<next>To$Snap($SortWrappers.$SnapTo$FVF<next> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<next> x))
    :qid |$Snap.$FVF<next>To$SnapTo$FVF<next>|
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
(declare-fun foo<Bool> (Set<Int> $Ref $Ref) Bool)
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun hfun ($Snap Set<$Ref>) Set<Int>)
(declare-fun hfun%limited ($Snap Set<$Ref>) Set<Int>)
(declare-fun hfun%stateless (Set<$Ref>) Bool)
(declare-fun hfun%precondition ($Snap Set<$Ref>) Bool)
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
; /field_value_functions_axioms.smt2 [next: Ref]
(assert (forall ((vs $FVF<next>) (ws $FVF<next>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_next vs) ($FVF.domain_next ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_next vs))
            (= ($FVF.lookup_next vs x) ($FVF.lookup_next ws x)))
          :pattern (($FVF.lookup_next vs x) ($FVF.lookup_next ws x))
          :qid |qp.$FVF<next>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<next>To$Snap vs)
              ($SortWrappers.$FVF<next>To$Snap ws)
              )
    :qid |qp.$FVF<next>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_next pm r))
    :pattern (($FVF.perm_next pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_next f r) true)
    :pattern (($FVF.loc_next f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@4@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@5@00 ($Snap Set<$Ref> $Ref) Bool)
(declare-fun sm@3@00 ($Snap Set<$Ref>) $FVF<next>)
(declare-fun sm@6@00 ($Snap Set<$Ref>) $FVF<next>)
(assert (forall ((s@$ $Snap) (g@0@00 Set<$Ref>)) (!
  (= (hfun%limited s@$ g@0@00) (hfun s@$ g@0@00))
  :pattern ((hfun s@$ g@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (g@0@00 Set<$Ref>)) (!
  (hfun%stateless g@0@00)
  :pattern ((hfun%limited s@$ g@0@00))
  :qid |quant-u-1|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- reverse_impl ----------
(declare-const g@0@01 Set<$Ref>)
(declare-const g@1@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (not (Set_in $Ref.null g@1@01)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(declare-const n@3@01 $Ref)
(push) ; 2
; [eval] (n in g)
(assert (Set_in n@3@01 g@1@01))
(declare-const sm@4@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@5@01 ($Ref) $Ref)
(declare-fun img@6@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@3@01 $Ref) (n2@3@01 $Ref)) (!
  (=>
    (and (Set_in n1@3@01 g@1@01) (Set_in n2@3@01 g@1@01) (= n1@3@01 n2@3@01))
    (= n1@3@01 n2@3@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@3@01 $Ref)) (!
  (=>
    (Set_in n@3@01 g@1@01)
    (and (= (inv@5@01 n@3@01) n@3@01) (img@6@01 n@3@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n@3@01) n@3@01))
  :qid |quant-u-6|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) (= (inv@5@01 r) r))
  :pattern ((inv@5@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@3@01 $Ref)) (!
  (=> (Set_in n@3@01 g@1@01) (not (= n@3@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n@3@01) n@3@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@7@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@5@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r))
  :pattern ((inv@5@01 r))
  :qid |quant-u-7|)))
(assert (= ($Snap.second ($Snap.second $t@2@01)) $Snap.unit))
; [eval] (forall n$0: Ref :: { (n$0.next in g) } { (n$0 in g), n$0.next } (n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@8@01 $Ref)
(push) ; 2
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 3
; [then-branch: 0 | !(n$0@8@01 in g@1@01) | live]
; [else-branch: 0 | n$0@8@01 in g@1@01 | live]
(push) ; 4
; [then-branch: 0 | !(n$0@8@01 in g@1@01)]
(assert (not (Set_in n$0@8@01 g@1@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | n$0@8@01 in g@1@01]
(assert (Set_in n$0@8@01 g@1@01))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
      (=
        ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
    :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01))
(push) ; 5
(assert (not (and (img@6@01 n$0@8@01) (Set_in (inv@5@01 n$0@8@01) g@1@01))))
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
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (Set_in n$0@8@01 g@1@01)
  (and
    (Set_in n$0@8@01 g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01))))
(assert (or (Set_in n$0@8@01 g@1@01) (not (Set_in n$0@8@01 g@1@01))))
(push) ; 3
; [then-branch: 1 | n$0@8@01 in g@1@01 && Lookup(next, sm@7@01, n$0@8@01) != Null | live]
; [else-branch: 1 | !(n$0@8@01 in g@1@01 && Lookup(next, sm@7@01, n$0@8@01) != Null) | live]
(push) ; 4
; [then-branch: 1 | n$0@8@01 in g@1@01 && Lookup(next, sm@7@01, n$0@8@01) != Null]
(assert (and
  (Set_in n$0@8@01 g@1@01)
  (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null))))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
      (=
        ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
    :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01))
(push) ; 5
(assert (not (and (img@6@01 n$0@8@01) (Set_in (inv@5@01 n$0@8@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(n$0@8@01 in g@1@01 && Lookup(next, sm@7@01, n$0@8@01) != Null)]
(assert (not
  (and
    (Set_in n$0@8@01 g@1@01)
    (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and
    (Set_in n$0@8@01 g@1@01)
    (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null)))
  (and
    (Set_in n$0@8@01 g@1@01)
    (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@8@01 g@1@01)
      (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null))))
  (and
    (Set_in n$0@8@01 g@1@01)
    (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@7@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@7@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$0@8@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@8@01 g@1@01)
      (and
        (Set_in n$0@8@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01)))
    (or (Set_in n$0@8@01 g@1@01) (not (Set_in n$0@8@01 g@1@01)))
    (=>
      (and
        (Set_in n$0@8@01 g@1@01)
        (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null)))
      (and
        (Set_in n$0@8@01 g@1@01)
        (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01)))
    (or
      (not
        (and
          (Set_in n$0@8@01 g@1@01)
          (not
            (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null))))
      (and
        (Set_in n$0@8@01 g@1@01)
        (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) g@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@24@14@24@22-aux|)))
(assert (forall ((n$0@8@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@8@01 g@1@01)
      (and
        (Set_in n$0@8@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01)))
    (or (Set_in n$0@8@01 g@1@01) (not (Set_in n$0@8@01 g@1@01)))
    (=>
      (and
        (Set_in n$0@8@01 g@1@01)
        (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null)))
      (and
        (Set_in n$0@8@01 g@1@01)
        (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01)))
    (or
      (not
        (and
          (Set_in n$0@8@01 g@1@01)
          (not
            (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null))))
      (and
        (Set_in n$0@8@01 g@1@01)
        (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null)))))
  :pattern ((Set_in n$0@8@01 g@1@01) ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@24@14@24@22-aux|)))
(assert (forall ((n$0@8@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@8@01 g@1@01)
      (not (= ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) g@1@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) g@1@01))
  :pattern ((Set_in n$0@8@01 g@1@01) ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n$0@8@01) n$0@8@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@24@14@24@22|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(assert (= ($Snap.first $t@9@01) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (=
  ($Snap.second $t@9@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@9@01))
    ($Snap.second ($Snap.second $t@9@01)))))
(declare-const n$1@10@01 $Ref)
(push) ; 3
; [eval] (n$1 in g)
(assert (Set_in n$1@10@01 g@1@01))
(declare-const sm@11@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n$11@10@01 $Ref) (n$12@10@01 $Ref)) (!
  (=>
    (and
      (Set_in n$11@10@01 g@1@01)
      (Set_in n$12@10@01 g@1@01)
      (= n$11@10@01 n$12@10@01))
    (= n$11@10@01 n$12@10@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$1@10@01 $Ref)) (!
  (=>
    (Set_in n$1@10@01 g@1@01)
    (and (= (inv@12@01 n$1@10@01) n$1@10@01) (img@13@01 n$1@10@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$1@10@01) n$1@10@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)) (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n$1@10@01 $Ref)) (!
  (=> (Set_in n$1@10@01 g@1@01) (not (= n$1@10@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$1@10@01) n$1@10@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@14@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@14@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@12@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) r) r))
  :pattern ((inv@12@01 r))
  :qid |quant-u-10|)))
(assert (=
  ($Snap.second ($Snap.second $t@9@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@9@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@9@01))) $Snap.unit))
; [eval] (forall n$2: Ref :: { (n$2.next in g) } { (n$2 in g), n$2.next } (n$2 in g) && n$2.next != null ==> (n$2.next in g))
(declare-const n$2@15@01 $Ref)
(push) ; 3
; [eval] (n$2 in g) && n$2.next != null ==> (n$2.next in g)
; [eval] (n$2 in g) && n$2.next != null
; [eval] (n$2 in g)
(push) ; 4
; [then-branch: 2 | !(n$2@15@01 in g@1@01) | live]
; [else-branch: 2 | n$2@15@01 in g@1@01 | live]
(push) ; 5
; [then-branch: 2 | !(n$2@15@01 in g@1@01)]
(assert (not (Set_in n$2@15@01 g@1@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | n$2@15@01 in g@1@01]
(assert (Set_in n$2@15@01 g@1@01))
; [eval] n$2.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
      (=
        ($FVF.lookup_next (as sm@14@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
    :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01))
(push) ; 6
(assert (not (and (img@13@01 n$2@15@01) (Set_in (inv@12@01 n$2@15@01) g@1@01))))
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
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@14@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (Set_in n$2@15@01 g@1@01)
  (and
    (Set_in n$2@15@01 g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01))))
(assert (or (Set_in n$2@15@01 g@1@01) (not (Set_in n$2@15@01 g@1@01))))
(push) ; 4
; [then-branch: 3 | n$2@15@01 in g@1@01 && Lookup(next, sm@14@01, n$2@15@01) != Null | live]
; [else-branch: 3 | !(n$2@15@01 in g@1@01 && Lookup(next, sm@14@01, n$2@15@01) != Null) | live]
(push) ; 5
; [then-branch: 3 | n$2@15@01 in g@1@01 && Lookup(next, sm@14@01, n$2@15@01) != Null]
(assert (and
  (Set_in n$2@15@01 g@1@01)
  (not (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null))))
; [eval] (n$2.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
      (=
        ($FVF.lookup_next (as sm@14@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
    :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01))
(push) ; 6
(assert (not (and (img@13@01 n$2@15@01) (Set_in (inv@12@01 n$2@15@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(n$2@15@01 in g@1@01 && Lookup(next, sm@14@01, n$2@15@01) != Null)]
(assert (not
  (and
    (Set_in n$2@15@01 g@1@01)
    (not (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@14@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (and
    (Set_in n$2@15@01 g@1@01)
    (not (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null)))
  (and
    (Set_in n$2@15@01 g@1@01)
    (not (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$2@15@01 g@1@01)
      (not (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null))))
  (and
    (Set_in n$2@15@01 g@1@01)
    (not (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@14@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$2@15@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@15@01 g@1@01)
      (and
        (Set_in n$2@15@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01)))
    (or (Set_in n$2@15@01 g@1@01) (not (Set_in n$2@15@01 g@1@01)))
    (=>
      (and
        (Set_in n$2@15@01 g@1@01)
        (not
          (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null)))
      (and
        (Set_in n$2@15@01 g@1@01)
        (not
          (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01)))
    (or
      (not
        (and
          (Set_in n$2@15@01 g@1@01)
          (not
            (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null))))
      (and
        (Set_in n$2@15@01 g@1@01)
        (not
          (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) g@1@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@25@13@25@21-aux|)))
(assert (forall ((n$2@15@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@15@01 g@1@01)
      (and
        (Set_in n$2@15@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01)))
    (or (Set_in n$2@15@01 g@1@01) (not (Set_in n$2@15@01 g@1@01)))
    (=>
      (and
        (Set_in n$2@15@01 g@1@01)
        (not
          (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null)))
      (and
        (Set_in n$2@15@01 g@1@01)
        (not
          (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01)))
    (or
      (not
        (and
          (Set_in n$2@15@01 g@1@01)
          (not
            (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null))))
      (and
        (Set_in n$2@15@01 g@1@01)
        (not
          (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null)))))
  :pattern ((Set_in n$2@15@01 g@1@01) ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@25@13@25@21-aux|)))
(assert (forall ((n$2@15@01 $Ref)) (!
  (=>
    (and
      (Set_in n$2@15@01 g@1@01)
      (not (= ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) g@1@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) g@1@01))
  :pattern ((Set_in n$2@15@01 g@1@01) ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n$2@15@01) n$2@15@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@25@13@25@21|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@9@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@9@01)))) $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), y, x) } foo(hfun(g), x, y) == foo(old(hfun(g)), y, x))
(declare-const x@16@01 $Ref)
(declare-const y@17@01 $Ref)
(push) ; 3
; [eval] foo(hfun(g), x, y) == foo(old(hfun(g)), y, x)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 4
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@18@01 $Ref)
(push) ; 5
; [eval] (n in g)
(assert (Set_in n@18@01 g@1@01))
(pop) ; 5
(declare-fun inv@19@01 ($Ref) $Ref)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@18@01 $Ref) (n2@18@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@18@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n1@18@01) n1@18@01))
      (and
        (Set_in n2@18@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) n2@18@01) n2@18@01))
      (= n1@18@01 n2@18@01))
    (= n1@18@01 n2@18@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@18@01 $Ref)) (!
  (=>
    (Set_in n@18@01 g@1@01)
    (and (= (inv@19@01 n@18@01) n@18@01) (img@20@01 n@18@01)))
  :pattern ((Set_in n@18@01 g@1@01))
  :pattern ((inv@19@01 n@18@01))
  :pattern ((img@20@01 n@18@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@20@01 r) (Set_in (inv@19@01 r) g@1@01)) (= (inv@19@01 r) r))
  :pattern ((inv@19@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@19@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) r) r))
  :pattern ((inv@19@01 r))
  :qid |quant-u-12|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref) (x@16@01 $Ref) (y@17@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r) (= r (inv@19@01 r)))
    ($Perm.min
      (ite
        (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 r x@16@01 y@17@01))
    $Perm.No)
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r) (= r (inv@19@01 r)))
    (= (- $Perm.Write (pTaken@21@01 r x@16@01 y@17@01)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>)))
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r)))
    (=>
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r))
      (Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>))))
  :qid |qp.fvfDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@22@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@22@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@22@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef7|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@23@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 6
; [then-branch: 4 | !(n$0@23@01 in g@1@01) | live]
; [else-branch: 4 | n$0@23@01 in g@1@01 | live]
(push) ; 7
; [then-branch: 4 | !(n$0@23@01 in g@1@01)]
(assert (not (Set_in n$0@23@01 g@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | n$0@23@01 in g@1@01]
(assert (Set_in n$0@23@01 g@1@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01) n$0@23@01))
(push) ; 8
(assert (not (and (img@13@01 n$0@23@01) (Set_in (inv@12@01 n$0@23@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@23@01 g@1@01)
  (and
    (Set_in n$0@23@01 g@1@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01) n$0@23@01))))
(assert (or (Set_in n$0@23@01 g@1@01) (not (Set_in n$0@23@01 g@1@01))))
(push) ; 6
; [then-branch: 5 | n$0@23@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@23@01) != Null | live]
; [else-branch: 5 | !(n$0@23@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@23@01) != Null) | live]
(push) ; 7
; [then-branch: 5 | n$0@23@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@23@01) != Null]
(assert (and
  (Set_in n$0@23@01 g@1@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01) n$0@23@01))
(push) ; 8
(assert (not (and (img@13@01 n$0@23@01) (Set_in (inv@12@01 n$0@23@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 5 | !(n$0@23@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@23@01) != Null)]
(assert (not
  (and
    (Set_in n$0@23@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
        $Ref.null)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@23@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
        $Ref.null)))
  (and
    (Set_in n$0@23@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01) n$0@23@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@23@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
          $Ref.null))))
  (and
    (Set_in n$0@23@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
        $Ref.null)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((n$0@23@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@23@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@23@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@23@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@22@01  $FVF<next>))
    $Snap.unit)) g@1@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((n@18@01 $Ref)) (!
  (=>
    (Set_in n@18@01 g@1@01)
    (and (= (inv@19@01 n@18@01) n@18@01) (img@20@01 n@18@01)))
  :pattern ((Set_in n@18@01 g@1@01))
  :pattern ((inv@19@01 n@18@01))
  :pattern ((img@20@01 n@18@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@20@01 r) (Set_in (inv@19@01 r) g@1@01)) (= (inv@19@01 r) r))
  :pattern ((inv@19@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>)))
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r)))
    (=>
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r))
      (Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>))))
  :qid |qp.fvfDomDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@22@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@22@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@22@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@19@01 r) g@1@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) r) r))
    :pattern ((inv@19@01 r))
    :qid |quant-u-12|))
  (forall ((n$0@23@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@23@01 g@1@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01) g@1@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@22@01  $FVF<next>))
      $Snap.unit)) g@1@01)))
; [eval] foo(old(hfun(g)), y, x)
; [eval] old(hfun(g))
; [eval] hfun(g)
(push) ; 4
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@24@01 $Ref)
(push) ; 5
; [eval] (n in g)
(assert (Set_in n@24@01 g@1@01))
(pop) ; 5
(declare-fun inv@25@01 ($Ref) $Ref)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@24@01 $Ref) (n2@24@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@24@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n1@24@01) n1@24@01))
      (and
        (Set_in n2@24@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) n2@24@01) n2@24@01))
      (= n1@24@01 n2@24@01))
    (= n1@24@01 n2@24@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@24@01 $Ref)) (!
  (=>
    (Set_in n@24@01 g@1@01)
    (and (= (inv@25@01 n@24@01) n@24@01) (img@26@01 n@24@01)))
  :pattern ((Set_in n@24@01 g@1@01))
  :pattern ((inv@25@01 n@24@01))
  :pattern ((img@26@01 n@24@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@26@01 r) (Set_in (inv@25@01 r) g@1@01)) (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@25@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r))
  :pattern ((inv@25@01 r))
  :qid |quant-u-17|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@27@01 ((r $Ref) (x@16@01 $Ref) (y@17@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r) (= r (inv@25@01 r)))
    ($Perm.min
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) $Perm.Write $Perm.No)
      (pTaken@27@01 r x@16@01 y@17@01))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r) (= r (inv@25@01 r)))
    (= (- $Perm.Write (pTaken@27@01 r x@16@01 y@17@01)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@28@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>)))
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r)))
    (=>
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r))
      (Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>))))
  :qid |qp.fvfDomDef11|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@28@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef10|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@29@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 6
; [then-branch: 6 | !(n$0@29@01 in g@1@01) | live]
; [else-branch: 6 | n$0@29@01 in g@1@01 | live]
(push) ; 7
; [then-branch: 6 | !(n$0@29@01 in g@1@01)]
(assert (not (Set_in n$0@29@01 g@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | n$0@29@01 in g@1@01]
(assert (Set_in n$0@29@01 g@1@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01) n$0@29@01))
(push) ; 8
(assert (not (and (img@6@01 n$0@29@01) (Set_in (inv@5@01 n$0@29@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@29@01 g@1@01)
  (and
    (Set_in n$0@29@01 g@1@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01) n$0@29@01))))
(assert (or (Set_in n$0@29@01 g@1@01) (not (Set_in n$0@29@01 g@1@01))))
(push) ; 6
; [then-branch: 7 | n$0@29@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@29@01) != Null | live]
; [else-branch: 7 | !(n$0@29@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@29@01) != Null) | live]
(push) ; 7
; [then-branch: 7 | n$0@29@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@29@01) != Null]
(assert (and
  (Set_in n$0@29@01 g@1@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01) n$0@29@01))
(push) ; 8
(assert (not (and (img@6@01 n$0@29@01) (Set_in (inv@5@01 n$0@29@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 7 | !(n$0@29@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@29@01) != Null)]
(assert (not
  (and
    (Set_in n$0@29@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
        $Ref.null)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@29@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
        $Ref.null)))
  (and
    (Set_in n$0@29@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01) n$0@29@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@29@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
          $Ref.null))))
  (and
    (Set_in n$0@29@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
        $Ref.null)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((n$0@29@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@29@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@29@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@29@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@28@01  $FVF<next>))
    $Snap.unit)) g@1@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((n@24@01 $Ref)) (!
  (=>
    (Set_in n@24@01 g@1@01)
    (and (= (inv@25@01 n@24@01) n@24@01) (img@26@01 n@24@01)))
  :pattern ((Set_in n@24@01 g@1@01))
  :pattern ((inv@25@01 n@24@01))
  :pattern ((img@26@01 n@24@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@26@01 r) (Set_in (inv@25@01 r) g@1@01)) (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>)))
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r)))
    (=>
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r))
      (Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>))))
  :qid |qp.fvfDomDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@28@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@25@01 r) g@1@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r))
    :pattern ((inv@25@01 r))
    :qid |quant-u-17|))
  (forall ((n$0@29@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@29@01 g@1@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01) g@1@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@28@01  $FVF<next>))
      $Snap.unit)) g@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@18@01 $Ref)) (!
  (=>
    (Set_in n@18@01 g@1@01)
    (and (= (inv@19@01 n@18@01) n@18@01) (img@20@01 n@18@01)))
  :pattern ((Set_in n@18@01 g@1@01))
  :pattern ((inv@19@01 n@18@01))
  :pattern ((img@20@01 n@18@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@20@01 r) (Set_in (inv@19@01 r) g@1@01)) (= (inv@19@01 r) r))
  :pattern ((inv@19@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>)))
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r)))
    (=>
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r))
      (Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@22@01  $FVF<next>))))
  :qid |qp.fvfDomDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@19@01 r) g@1@01) (img@20@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@22@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@22@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@22@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (forall ((n@24@01 $Ref)) (!
  (=>
    (Set_in n@24@01 g@1@01)
    (and (= (inv@25@01 n@24@01) n@24@01) (img@26@01 n@24@01)))
  :pattern ((Set_in n@24@01 g@1@01))
  :pattern ((inv@25@01 n@24@01))
  :pattern ((img@26@01 n@24@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@26@01 r) (Set_in (inv@25@01 r) g@1@01)) (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>)))
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r)))
    (=>
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r))
      (Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>))))
  :qid |qp.fvfDomDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@25@01 r) g@1@01) (img@26@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@28@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@19@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) r) r))
  :pattern ((inv@19@01 r))
  :qid |quant-u-12|)))
(assert (forall ((n$0@23@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@23@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@23@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@22@01  $FVF<next>))
    $Snap.unit)) g@1@01))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@25@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@7@01  $FVF<next>) r) r))
  :pattern ((inv@25@01 r))
  :qid |quant-u-17|)))
(assert (forall ((n$0@29@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@29@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@29@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@28@01  $FVF<next>))
    $Snap.unit)) g@1@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@16@01 $Ref) (y@17@01 $Ref)) (!
  (=
    (foo<Bool> (hfun ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@22@01  $FVF<next>))
        $Snap.unit)) g@1@01) x@16@01 y@17@01)
    (foo<Bool> (hfun ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@28@01  $FVF<next>))
        $Snap.unit)) g@1@01) y@17@01 x@16@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@22@01  $FVF<next>))
      $Snap.unit)) g@1@01) x@16@01 y@17@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@28@01  $FVF<next>))
      $Snap.unit)) g@1@01) y@17@01 x@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@26@13@26@77|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
  $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), x, y) } foo(hfun(g), x, y) != foo(old(hfun(g)), x, y))
(declare-const x@30@01 $Ref)
(declare-const y@31@01 $Ref)
(push) ; 3
; [eval] foo(hfun(g), x, y) != foo(old(hfun(g)), x, y)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 4
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@32@01 $Ref)
(push) ; 5
; [eval] (n in g)
(assert (Set_in n@32@01 g@1@01))
(pop) ; 5
(declare-fun inv@33@01 ($Ref) $Ref)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@35@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@35@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@35@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@35@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef13|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@32@01 $Ref) (n2@32@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@32@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) n1@32@01) n1@32@01))
      (and
        (Set_in n2@32@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) n2@32@01) n2@32@01))
      (= n1@32@01 n2@32@01))
    (= n1@32@01 n2@32@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@32@01 $Ref)) (!
  (=>
    (Set_in n@32@01 g@1@01)
    (and (= (inv@33@01 n@32@01) n@32@01) (img@34@01 n@32@01)))
  :pattern ((Set_in n@32@01 g@1@01))
  :pattern ((inv@33@01 n@32@01))
  :pattern ((img@34@01 n@32@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (Set_in (inv@33@01 r) g@1@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@33@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) r) r))
  :pattern ((inv@33@01 r))
  :qid |quant-u-22|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref) (x@30@01 $Ref) (y@31@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r) (= r (inv@33@01 r)))
    ($Perm.min
      (ite
        (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@36@01 r x@30@01 y@31@01))
    $Perm.No)
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r) (= r (inv@33@01 r)))
    (= (- $Perm.Write (pTaken@36@01 r x@30@01 y@31@01)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@37@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>)))
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r)))
    (=>
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r))
      (Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>))))
  :qid |qp.fvfDomDef16|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@37@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef15|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@38@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 6
; [then-branch: 8 | !(n$0@38@01 in g@1@01) | live]
; [else-branch: 8 | n$0@38@01 in g@1@01 | live]
(push) ; 7
; [then-branch: 8 | !(n$0@38@01 in g@1@01)]
(assert (not (Set_in n$0@38@01 g@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | n$0@38@01 in g@1@01]
(assert (Set_in n$0@38@01 g@1@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01) n$0@38@01))
(push) ; 8
(assert (not (and (img@13@01 n$0@38@01) (Set_in (inv@12@01 n$0@38@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@38@01 g@1@01)
  (and
    (Set_in n$0@38@01 g@1@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01) n$0@38@01))))
(assert (or (Set_in n$0@38@01 g@1@01) (not (Set_in n$0@38@01 g@1@01))))
(push) ; 6
; [then-branch: 9 | n$0@38@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@38@01) != Null | live]
; [else-branch: 9 | !(n$0@38@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@38@01) != Null) | live]
(push) ; 7
; [then-branch: 9 | n$0@38@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@38@01) != Null]
(assert (and
  (Set_in n$0@38@01 g@1@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01) n$0@38@01))
(push) ; 8
(assert (not (and (img@13@01 n$0@38@01) (Set_in (inv@12@01 n$0@38@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 9 | !(n$0@38@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@38@01) != Null)]
(assert (not
  (and
    (Set_in n$0@38@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
        $Ref.null)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@38@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
        $Ref.null)))
  (and
    (Set_in n$0@38@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01) n$0@38@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@38@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
          $Ref.null))))
  (and
    (Set_in n$0@38@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
        $Ref.null)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((n$0@38@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@38@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@38@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@38@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@37@01  $FVF<next>))
    $Snap.unit)) g@1@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@35@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@35@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@35@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (forall ((n@32@01 $Ref)) (!
  (=>
    (Set_in n@32@01 g@1@01)
    (and (= (inv@33@01 n@32@01) n@32@01) (img@34@01 n@32@01)))
  :pattern ((Set_in n@32@01 g@1@01))
  :pattern ((inv@33@01 n@32@01))
  :pattern ((img@34@01 n@32@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (Set_in (inv@33@01 r) g@1@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>)))
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r)))
    (=>
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r))
      (Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>))))
  :qid |qp.fvfDomDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@37@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@33@01 r) g@1@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) r) r))
    :pattern ((inv@33@01 r))
    :qid |quant-u-22|))
  (forall ((n$0@38@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@38@01 g@1@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01) g@1@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@37@01  $FVF<next>))
      $Snap.unit)) g@1@01)))
; [eval] foo(old(hfun(g)), x, y)
; [eval] old(hfun(g))
; [eval] hfun(g)
(push) ; 4
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@39@01 $Ref)
(push) ; 5
; [eval] (n in g)
(assert (Set_in n@39@01 g@1@01))
(pop) ; 5
(declare-fun inv@40@01 ($Ref) $Ref)
(declare-fun img@41@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@42@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@42@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef18|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@39@01 $Ref) (n2@39@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@39@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@42@01  $FVF<next>) n1@39@01) n1@39@01))
      (and
        (Set_in n2@39@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@42@01  $FVF<next>) n2@39@01) n2@39@01))
      (= n1@39@01 n2@39@01))
    (= n1@39@01 n2@39@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@39@01 $Ref)) (!
  (=>
    (Set_in n@39@01 g@1@01)
    (and (= (inv@40@01 n@39@01) n@39@01) (img@41@01 n@39@01)))
  :pattern ((Set_in n@39@01 g@1@01))
  :pattern ((inv@40@01 n@39@01))
  :pattern ((img@41@01 n@39@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@41@01 r) (Set_in (inv@40@01 r) g@1@01)) (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@40@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@42@01  $FVF<next>) r) r))
  :pattern ((inv@40@01 r))
  :qid |quant-u-27|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((r $Ref) (x@30@01 $Ref) (y@31@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r) (= r (inv@40@01 r)))
    ($Perm.min
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) $Perm.Write $Perm.No)
      (pTaken@43@01 r x@30@01 y@31@01))
    $Perm.No)
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r) (= r (inv@40@01 r)))
    (= (- $Perm.Write (pTaken@43@01 r x@30@01 y@31@01)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@44@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>)))
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r)))
    (=>
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r))
      (Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>))))
  :qid |qp.fvfDomDef21|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@44@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@44@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@44@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef20|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@45@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 6
; [then-branch: 10 | !(n$0@45@01 in g@1@01) | live]
; [else-branch: 10 | n$0@45@01 in g@1@01 | live]
(push) ; 7
; [then-branch: 10 | !(n$0@45@01 in g@1@01)]
(assert (not (Set_in n$0@45@01 g@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | n$0@45@01 in g@1@01]
(assert (Set_in n$0@45@01 g@1@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01) n$0@45@01))
(push) ; 8
(assert (not (and (img@6@01 n$0@45@01) (Set_in (inv@5@01 n$0@45@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@45@01 g@1@01)
  (and
    (Set_in n$0@45@01 g@1@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01) n$0@45@01))))
(assert (or (Set_in n$0@45@01 g@1@01) (not (Set_in n$0@45@01 g@1@01))))
(push) ; 6
; [then-branch: 11 | n$0@45@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@45@01) != Null | live]
; [else-branch: 11 | !(n$0@45@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@45@01) != Null) | live]
(push) ; 7
; [then-branch: 11 | n$0@45@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@45@01) != Null]
(assert (and
  (Set_in n$0@45@01 g@1@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01) n$0@45@01))
(push) ; 8
(assert (not (and (img@6@01 n$0@45@01) (Set_in (inv@5@01 n$0@45@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 11 | !(n$0@45@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@45@01) != Null)]
(assert (not
  (and
    (Set_in n$0@45@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
        $Ref.null)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@45@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
        $Ref.null)))
  (and
    (Set_in n$0@45@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01) n$0@45@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@45@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
          $Ref.null))))
  (and
    (Set_in n$0@45@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
        $Ref.null)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((n$0@45@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@45@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@45@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@45@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@44@01  $FVF<next>))
    $Snap.unit)) g@1@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@42@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (forall ((n@39@01 $Ref)) (!
  (=>
    (Set_in n@39@01 g@1@01)
    (and (= (inv@40@01 n@39@01) n@39@01) (img@41@01 n@39@01)))
  :pattern ((Set_in n@39@01 g@1@01))
  :pattern ((inv@40@01 n@39@01))
  :pattern ((img@41@01 n@39@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@41@01 r) (Set_in (inv@40@01 r) g@1@01)) (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>)))
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r)))
    (=>
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r))
      (Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@44@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@44@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@44@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@40@01 r) g@1@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@42@01  $FVF<next>) r) r))
    :pattern ((inv@40@01 r))
    :qid |quant-u-27|))
  (forall ((n$0@45@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@45@01 g@1@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01) g@1@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@44@01  $FVF<next>))
      $Snap.unit)) g@1@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@35@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@35@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@35@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (forall ((n@32@01 $Ref)) (!
  (=>
    (Set_in n@32@01 g@1@01)
    (and (= (inv@33@01 n@32@01) n@32@01) (img@34@01 n@32@01)))
  :pattern ((Set_in n@32@01 g@1@01))
  :pattern ((inv@33@01 n@32@01))
  :pattern ((img@34@01 n@32@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@34@01 r) (Set_in (inv@33@01 r) g@1@01)) (= (inv@33@01 r) r))
  :pattern ((inv@33@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>)))
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r)))
    (=>
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r))
      (Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@37@01  $FVF<next>))))
  :qid |qp.fvfDomDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@33@01 r) g@1@01) (img@34@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@37@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@37@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@42@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (forall ((n@39@01 $Ref)) (!
  (=>
    (Set_in n@39@01 g@1@01)
    (and (= (inv@40@01 n@39@01) n@39@01) (img@41@01 n@39@01)))
  :pattern ((Set_in n@39@01 g@1@01))
  :pattern ((inv@40@01 n@39@01))
  :pattern ((img@41@01 n@39@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@41@01 r) (Set_in (inv@40@01 r) g@1@01)) (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>)))
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r)))
    (=>
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r))
      (Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@44@01  $FVF<next>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) g@1@01) (img@41@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@44@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@44@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@44@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@33@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@35@01  $FVF<next>) r) r))
  :pattern ((inv@33@01 r))
  :qid |quant-u-22|)))
(assert (forall ((n$0@38@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@38@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@38@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@37@01  $FVF<next>))
    $Snap.unit)) g@1@01))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@40@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@42@01  $FVF<next>) r) r))
  :pattern ((inv@40@01 r))
  :qid |quant-u-27|)))
(assert (forall ((n$0@45@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@45@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@45@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@44@01  $FVF<next>))
    $Snap.unit)) g@1@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@30@01 $Ref) (y@31@01 $Ref)) (!
  (not
    (=
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@37@01  $FVF<next>))
          $Snap.unit)) g@1@01) x@30@01 y@31@01)
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@44@01  $FVF<next>))
          $Snap.unit)) g@1@01) x@30@01 y@31@01)))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@37@01  $FVF<next>))
      $Snap.unit)) g@1@01) x@30@01 y@31@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@44@01  $FVF<next>))
      $Snap.unit)) g@1@01) x@30@01 y@31@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@27@13@27@77|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@9@01)))))
  $Snap.unit))
; [eval] hfun(g) != old(hfun(g))
; [eval] hfun(g)
(push) ; 3
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@46@01 $Ref)
(push) ; 4
; [eval] (n in g)
(assert (Set_in n@46@01 g@1@01))
(pop) ; 4
(declare-fun inv@47@01 ($Ref) $Ref)
(declare-fun img@48@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@49@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@49@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@49@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@49@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef23|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n1@46@01 $Ref) (n2@46@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@46@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@49@01  $FVF<next>) n1@46@01) n1@46@01))
      (and
        (Set_in n2@46@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@49@01  $FVF<next>) n2@46@01) n2@46@01))
      (= n1@46@01 n2@46@01))
    (= n1@46@01 n2@46@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@46@01 $Ref)) (!
  (=>
    (Set_in n@46@01 g@1@01)
    (and (= (inv@47@01 n@46@01) n@46@01) (img@48@01 n@46@01)))
  :pattern ((Set_in n@46@01 g@1@01))
  :pattern ((inv@47@01 n@46@01))
  :pattern ((img@48@01 n@46@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@48@01 r) (Set_in (inv@47@01 r) g@1@01)) (= (inv@47@01 r) r))
  :pattern ((inv@47@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@47@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@49@01  $FVF<next>) r) r))
  :pattern ((inv@47@01 r))
  :qid |quant-u-32|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@47@01 r) g@1@01) (img@48@01 r) (= r (inv@47@01 r)))
    ($Perm.min
      (ite
        (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
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
        (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
        $Perm.Write
        $Perm.No)
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-34|))))
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
    (and (Set_in (inv@47@01 r) g@1@01) (img@48@01 r) (= r (inv@47@01 r)))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@51@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@51@01  $FVF<next>)))
      (and (Set_in (inv@47@01 r) g@1@01) (img@48@01 r)))
    (=>
      (and (Set_in (inv@47@01 r) g@1@01) (img@48@01 r))
      (Set_in r ($FVF.domain_next (as sm@51@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@51@01  $FVF<next>))))
  :qid |qp.fvfDomDef26|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@47@01 r) g@1@01) (img@48@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@51@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@51@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@51@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef25|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@52@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 5
; [then-branch: 12 | !(n$0@52@01 in g@1@01) | live]
; [else-branch: 12 | n$0@52@01 in g@1@01 | live]
(push) ; 6
; [then-branch: 12 | !(n$0@52@01 in g@1@01)]
(assert (not (Set_in n$0@52@01 g@1@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | n$0@52@01 in g@1@01]
(assert (Set_in n$0@52@01 g@1@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01) n$0@52@01))
(push) ; 7
(assert (not (and (img@13@01 n$0@52@01) (Set_in (inv@12@01 n$0@52@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@52@01 g@1@01)
  (and
    (Set_in n$0@52@01 g@1@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01) n$0@52@01))))
(assert (or (Set_in n$0@52@01 g@1@01) (not (Set_in n$0@52@01 g@1@01))))
(push) ; 5
; [then-branch: 13 | n$0@52@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@52@01) != Null | live]
; [else-branch: 13 | !(n$0@52@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@52@01) != Null) | live]
(push) ; 6
; [then-branch: 13 | n$0@52@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@52@01) != Null]
(assert (and
  (Set_in n$0@52@01 g@1@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01) n$0@52@01))
(push) ; 7
(assert (not (and (img@13@01 n$0@52@01) (Set_in (inv@12@01 n$0@52@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 13 | !(n$0@52@01 in g@1@01 && Lookup(next, First:(Second:($t@9@01)), n$0@52@01) != Null)]
(assert (not
  (and
    (Set_in n$0@52@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
        $Ref.null)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@52@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
        $Ref.null)))
  (and
    (Set_in n$0@52@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01) n$0@52@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@52@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
          $Ref.null))))
  (and
    (Set_in n$0@52@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
        $Ref.null)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((n$0@52@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@52@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@52@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@52@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@51@01  $FVF<next>))
    $Snap.unit)) g@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@49@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@49@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@49@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef23|)))
(assert (forall ((n@46@01 $Ref)) (!
  (=>
    (Set_in n@46@01 g@1@01)
    (and (= (inv@47@01 n@46@01) n@46@01) (img@48@01 n@46@01)))
  :pattern ((Set_in n@46@01 g@1@01))
  :pattern ((inv@47@01 n@46@01))
  :pattern ((img@48@01 n@46@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@48@01 r) (Set_in (inv@47@01 r) g@1@01)) (= (inv@47@01 r) r))
  :pattern ((inv@47@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@51@01  $FVF<next>)))
      (and (Set_in (inv@47@01 r) g@1@01) (img@48@01 r)))
    (=>
      (and (Set_in (inv@47@01 r) g@1@01) (img@48@01 r))
      (Set_in r ($FVF.domain_next (as sm@51@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@51@01  $FVF<next>))))
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@47@01 r) g@1@01) (img@48@01 r))
      (and (img@13@01 r) (Set_in (inv@12@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@51@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r)))
  :pattern (($FVF.lookup_next (as sm@51@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@51@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef25|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@47@01 r) g@1@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@49@01  $FVF<next>) r) r))
    :pattern ((inv@47@01 r))
    :qid |quant-u-32|))
  (forall ((n$0@52@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@52@01 g@1@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@9@01))) n$0@52@01) g@1@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@51@01  $FVF<next>))
      $Snap.unit)) g@1@01)))
; [eval] old(hfun(g))
; [eval] hfun(g)
(push) ; 3
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@53@01 $Ref)
(push) ; 4
; [eval] (n in g)
(assert (Set_in n@53@01 g@1@01))
(pop) ; 4
(declare-fun inv@54@01 ($Ref) $Ref)
(declare-fun img@55@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@56@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@56@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@56@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@56@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef28|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n1@53@01 $Ref) (n2@53@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@53@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@56@01  $FVF<next>) n1@53@01) n1@53@01))
      (and
        (Set_in n2@53@01 g@1@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@56@01  $FVF<next>) n2@53@01) n2@53@01))
      (= n1@53@01 n2@53@01))
    (= n1@53@01 n2@53@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@53@01 $Ref)) (!
  (=>
    (Set_in n@53@01 g@1@01)
    (and (= (inv@54@01 n@53@01) n@53@01) (img@55@01 n@53@01)))
  :pattern ((Set_in n@53@01 g@1@01))
  :pattern ((inv@54@01 n@53@01))
  :pattern ((img@55@01 n@53@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@55@01 r) (Set_in (inv@54@01 r) g@1@01)) (= (inv@54@01 r) r))
  :pattern ((inv@54@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@54@01 r) g@1@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@56@01  $FVF<next>) r) r))
  :pattern ((inv@54@01 r))
  :qid |quant-u-37|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@57@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@54@01 r) g@1@01) (img@55@01 r) (= r (inv@54@01 r)))
    ($Perm.min
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)) $Perm.Write $Perm.No)
      (pTaken@57@01 r))
    $Perm.No)
  
  :qid |quant-u-39|))))
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
    (and (Set_in (inv@54@01 r) g@1@01) (img@55@01 r) (= r (inv@54@01 r)))
    (= (- $Perm.Write (pTaken@57@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@58@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@58@01  $FVF<next>)))
      (and (Set_in (inv@54@01 r) g@1@01) (img@55@01 r)))
    (=>
      (and (Set_in (inv@54@01 r) g@1@01) (img@55@01 r))
      (Set_in r ($FVF.domain_next (as sm@58@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@58@01  $FVF<next>))))
  :qid |qp.fvfDomDef31|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@54@01 r) g@1@01) (img@55@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@58@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@58@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@58@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef30|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@59@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 5
; [then-branch: 14 | !(n$0@59@01 in g@1@01) | live]
; [else-branch: 14 | n$0@59@01 in g@1@01 | live]
(push) ; 6
; [then-branch: 14 | !(n$0@59@01 in g@1@01)]
(assert (not (Set_in n$0@59@01 g@1@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | n$0@59@01 in g@1@01]
(assert (Set_in n$0@59@01 g@1@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01) n$0@59@01))
(push) ; 7
(assert (not (and (img@6@01 n$0@59@01) (Set_in (inv@5@01 n$0@59@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@59@01 g@1@01)
  (and
    (Set_in n$0@59@01 g@1@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01) n$0@59@01))))
(assert (or (Set_in n$0@59@01 g@1@01) (not (Set_in n$0@59@01 g@1@01))))
(push) ; 5
; [then-branch: 15 | n$0@59@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@59@01) != Null | live]
; [else-branch: 15 | !(n$0@59@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@59@01) != Null) | live]
(push) ; 6
; [then-branch: 15 | n$0@59@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@59@01) != Null]
(assert (and
  (Set_in n$0@59@01 g@1@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01) n$0@59@01))
(push) ; 7
(assert (not (and (img@6@01 n$0@59@01) (Set_in (inv@5@01 n$0@59@01) g@1@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(n$0@59@01 in g@1@01 && Lookup(next, First:(Second:($t@2@01)), n$0@59@01) != Null)]
(assert (not
  (and
    (Set_in n$0@59@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
        $Ref.null)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@59@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
        $Ref.null)))
  (and
    (Set_in n$0@59@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01) n$0@59@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@59@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
          $Ref.null))))
  (and
    (Set_in n$0@59@01 g@1@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
        $Ref.null)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((n$0@59@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@59@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@59@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@59@01 g@1@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01) g@1@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@58@01  $FVF<next>))
    $Snap.unit)) g@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01))
    (=
      ($FVF.lookup_next (as sm@56@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@56@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@56@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef28|)))
(assert (forall ((n@53@01 $Ref)) (!
  (=>
    (Set_in n@53@01 g@1@01)
    (and (= (inv@54@01 n@53@01) n@53@01) (img@55@01 n@53@01)))
  :pattern ((Set_in n@53@01 g@1@01))
  :pattern ((inv@54@01 n@53@01))
  :pattern ((img@55@01 n@53@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@55@01 r) (Set_in (inv@54@01 r) g@1@01)) (= (inv@54@01 r) r))
  :pattern ((inv@54@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@58@01  $FVF<next>)))
      (and (Set_in (inv@54@01 r) g@1@01) (img@55@01 r)))
    (=>
      (and (Set_in (inv@54@01 r) g@1@01) (img@55@01 r))
      (Set_in r ($FVF.domain_next (as sm@58@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@58@01  $FVF<next>))))
  :qid |qp.fvfDomDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@54@01 r) g@1@01) (img@55@01 r))
      (and (img@6@01 r) (Set_in (inv@5@01 r) g@1@01)))
    (=
      ($FVF.lookup_next (as sm@58@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r)))
  :pattern (($FVF.lookup_next (as sm@58@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@58@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef30|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@54@01 r) g@1@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@56@01  $FVF<next>) r) r))
    :pattern ((inv@54@01 r))
    :qid |quant-u-37|))
  (forall ((n$0@59@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@59@01 g@1@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@2@01))) n$0@59@01) g@1@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@58@01  $FVF<next>))
      $Snap.unit)) g@1@01)))
(assert (not
  (Set_equal (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@51@01  $FVF<next>))
      $Snap.unit)) g@1@01) (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@58@01  $FVF<next>))
      $Snap.unit)) g@1@01))))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- reverse ----------
(declare-const g@60@01 Set<$Ref>)
(declare-const g@61@01 Set<$Ref>)
(push) ; 1
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 ($Snap.combine ($Snap.first $t@62@01) ($Snap.second $t@62@01))))
(assert (= ($Snap.first $t@62@01) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (not (Set_in $Ref.null g@61@01)))
(assert (=
  ($Snap.second $t@62@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@62@01))
    ($Snap.second ($Snap.second $t@62@01)))))
(declare-const n@63@01 $Ref)
(push) ; 2
; [eval] (n in g)
(assert (Set_in n@63@01 g@61@01))
(declare-const sm@64@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@65@01 ($Ref) $Ref)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((n1@63@01 $Ref) (n2@63@01 $Ref)) (!
  (=>
    (and
      (Set_in n1@63@01 g@61@01)
      (Set_in n2@63@01 g@61@01)
      (= n1@63@01 n2@63@01))
    (= n1@63@01 n2@63@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@63@01 $Ref)) (!
  (=>
    (Set_in n@63@01 g@61@01)
    (and (= (inv@65@01 n@63@01) n@63@01) (img@66@01 n@63@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n@63@01) n@63@01))
  :qid |quant-u-42|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n@63@01 $Ref)) (!
  (=> (Set_in n@63@01 g@61@01) (not (= n@63@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n@63@01) n@63@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@67@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@65@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) r) r))
  :pattern ((inv@65@01 r))
  :qid |quant-u-43|)))
(assert (= ($Snap.second ($Snap.second $t@62@01)) $Snap.unit))
; [eval] (forall n$0: Ref :: { (n$0.next in g) } { (n$0 in g), n$0.next } (n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@68@01 $Ref)
(push) ; 2
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 3
; [then-branch: 16 | !(n$0@68@01 in g@61@01) | live]
; [else-branch: 16 | n$0@68@01 in g@61@01 | live]
(push) ; 4
; [then-branch: 16 | !(n$0@68@01 in g@61@01)]
(assert (not (Set_in n$0@68@01 g@61@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | n$0@68@01 in g@61@01]
(assert (Set_in n$0@68@01 g@61@01))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef34|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01))
(push) ; 5
(assert (not (and (img@66@01 n$0@68@01) (Set_in (inv@65@01 n$0@68@01) g@61@01))))
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
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (=>
  (Set_in n$0@68@01 g@61@01)
  (and
    (Set_in n$0@68@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01))))
(assert (or (Set_in n$0@68@01 g@61@01) (not (Set_in n$0@68@01 g@61@01))))
(push) ; 3
; [then-branch: 17 | n$0@68@01 in g@61@01 && Lookup(next, sm@67@01, n$0@68@01) != Null | live]
; [else-branch: 17 | !(n$0@68@01 in g@61@01 && Lookup(next, sm@67@01, n$0@68@01) != Null) | live]
(push) ; 4
; [then-branch: 17 | n$0@68@01 in g@61@01 && Lookup(next, sm@67@01, n$0@68@01) != Null]
(assert (and
  (Set_in n$0@68@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null))))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef34|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01))
(push) ; 5
(assert (not (and (img@66@01 n$0@68@01) (Set_in (inv@65@01 n$0@68@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 17 | !(n$0@68@01 in g@61@01 && Lookup(next, sm@67@01, n$0@68@01) != Null)]
(assert (not
  (and
    (Set_in n$0@68@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (=>
  (and
    (Set_in n$0@68@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null)))
  (and
    (Set_in n$0@68@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@68@01 g@61@01)
      (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null))))
  (and
    (Set_in n$0@68@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef34|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$0@68@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@68@01 g@61@01)
      (and
        (Set_in n$0@68@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01)))
    (or (Set_in n$0@68@01 g@61@01) (not (Set_in n$0@68@01 g@61@01)))
    (=>
      (and
        (Set_in n$0@68@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null)))
      (and
        (Set_in n$0@68@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01)))
    (or
      (not
        (and
          (Set_in n$0@68@01 g@61@01)
          (not
            (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null))))
      (and
        (Set_in n$0@68@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) g@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@31@14@31@22-aux|)))
(assert (forall ((n$0@68@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@68@01 g@61@01)
      (and
        (Set_in n$0@68@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01)))
    (or (Set_in n$0@68@01 g@61@01) (not (Set_in n$0@68@01 g@61@01)))
    (=>
      (and
        (Set_in n$0@68@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null)))
      (and
        (Set_in n$0@68@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01)))
    (or
      (not
        (and
          (Set_in n$0@68@01 g@61@01)
          (not
            (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null))))
      (and
        (Set_in n$0@68@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null)))))
  :pattern ((Set_in n$0@68@01 g@61@01) ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@31@14@31@22-aux|)))
(assert (forall ((n$0@68@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@68@01 g@61@01)
      (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) g@61@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) g@61@01))
  :pattern ((Set_in n$0@68@01 g@61@01) ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@68@01) n$0@68@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@31@14@31@22|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var b1: Bool
(declare-const b1@69@01 Bool)
; [exec]
; var b2: Bool
(declare-const b2@70@01 Bool)
; [exec]
; reverse_impl(g)
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@71@01 $Ref)
(push) ; 3
; [eval] (n in g)
(assert (Set_in n@71@01 g@61@01))
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@72@01 ($Ref) $Ref)
(declare-fun img@73@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n1@71@01 $Ref) (n2@71@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@71@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n1@71@01) n1@71@01))
      (and
        (Set_in n2@71@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n2@71@01) n2@71@01))
      (= n1@71@01 n2@71@01))
    (= n1@71@01 n2@71@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@71@01 $Ref)) (!
  (=>
    (Set_in n@71@01 g@61@01)
    (and (= (inv@72@01 n@71@01) n@71@01) (img@73@01 n@71@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n@71@01) n@71@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@73@01 r) (Set_in (inv@72@01 r) g@61@01)) (= (inv@72@01 r) r))
  :pattern ((inv@72@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@72@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) r) r))
  :pattern ((inv@72@01 r))
  :qid |quant-u-45|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@74@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@72@01 r) g@61@01) (img@73@01 r) (= r (inv@72@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@74@01 r))
    $Perm.No)
  
  :qid |quant-u-47|))))
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
    (and (Set_in (inv@72@01 r) g@61@01) (img@73@01 r) (= r (inv@72@01 r)))
    (= (- $Perm.Write (pTaken@74@01 r)) $Perm.No))
  
  :qid |quant-u-48|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall n$0: Ref :: { (n$0.next in g) } { (n$0 in g), n$0.next } (n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@75@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 4
; [then-branch: 18 | !(n$0@75@01 in g@61@01) | live]
; [else-branch: 18 | n$0@75@01 in g@61@01 | live]
(push) ; 5
; [then-branch: 18 | !(n$0@75@01 in g@61@01)]
(assert (not (Set_in n$0@75@01 g@61@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | n$0@75@01 in g@61@01]
(assert (Set_in n$0@75@01 g@61@01))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef34|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01))
(push) ; 6
(assert (not (and (img@66@01 n$0@75@01) (Set_in (inv@65@01 n$0@75@01) g@61@01))))
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
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (=>
  (Set_in n$0@75@01 g@61@01)
  (and
    (Set_in n$0@75@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01))))
(assert (or (Set_in n$0@75@01 g@61@01) (not (Set_in n$0@75@01 g@61@01))))
(push) ; 4
; [then-branch: 19 | n$0@75@01 in g@61@01 && Lookup(next, sm@67@01, n$0@75@01) != Null | live]
; [else-branch: 19 | !(n$0@75@01 in g@61@01 && Lookup(next, sm@67@01, n$0@75@01) != Null) | live]
(push) ; 5
; [then-branch: 19 | n$0@75@01 in g@61@01 && Lookup(next, sm@67@01, n$0@75@01) != Null]
(assert (and
  (Set_in n$0@75@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null))))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef33|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef34|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01))
(push) ; 6
(assert (not (and (img@66@01 n$0@75@01) (Set_in (inv@65@01 n$0@75@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 19 | !(n$0@75@01 in g@61@01 && Lookup(next, sm@67@01, n$0@75@01) != Null)]
(assert (not
  (and
    (Set_in n$0@75@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef34|)))
(assert (=>
  (and
    (Set_in n$0@75@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))
  (and
    (Set_in n$0@75@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@75@01 g@61@01)
      (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null))))
  (and
    (Set_in n$0@75@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef34|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$0@75@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@75@01 g@61@01)
      (and
        (Set_in n$0@75@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01)))
    (or (Set_in n$0@75@01 g@61@01) (not (Set_in n$0@75@01 g@61@01)))
    (=>
      (and
        (Set_in n$0@75@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))
      (and
        (Set_in n$0@75@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01)))
    (or
      (not
        (and
          (Set_in n$0@75@01 g@61@01)
          (not
            (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null))))
      (and
        (Set_in n$0@75@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) g@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@24@14@24@22-aux|)))
(assert (forall ((n$0@75@01 $Ref)) (!
  (and
    (=>
      (Set_in n$0@75@01 g@61@01)
      (and
        (Set_in n$0@75@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01)))
    (or (Set_in n$0@75@01 g@61@01) (not (Set_in n$0@75@01 g@61@01)))
    (=>
      (and
        (Set_in n$0@75@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))
      (and
        (Set_in n$0@75@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01)))
    (or
      (not
        (and
          (Set_in n$0@75@01 g@61@01)
          (not
            (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null))))
      (and
        (Set_in n$0@75@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))))
  :pattern ((Set_in n$0@75@01 g@61@01) ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@24@14@24@22-aux|)))
(push) ; 3
(assert (not (forall ((n$0@75@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@75@01 g@61@01)
      (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) g@61@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) g@61@01))
  :pattern ((Set_in n$0@75@01 g@61@01) ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@24@14@24@22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@75@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@75@01 g@61@01)
      (not (= ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) g@61@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) g@61@01))
  :pattern ((Set_in n$0@75@01 g@61@01) ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n$0@75@01) n$0@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@24@14@24@22|)))
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (= ($Snap.first $t@76@01) $Snap.unit))
; [eval] !((null in g))
; [eval] (null in g)
(assert (=
  ($Snap.second $t@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@76@01))
    ($Snap.second ($Snap.second $t@76@01)))))
(declare-const n$1@77@01 $Ref)
(push) ; 3
; [eval] (n$1 in g)
(assert (Set_in n$1@77@01 g@61@01))
(declare-const sm@78@01 $FVF<next>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-fun inv@79@01 ($Ref) $Ref)
(declare-fun img@80@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((n$11@77@01 $Ref) (n$12@77@01 $Ref)) (!
  (=>
    (and
      (Set_in n$11@77@01 g@61@01)
      (Set_in n$12@77@01 g@61@01)
      (= n$11@77@01 n$12@77@01))
    (= n$11@77@01 n$12@77@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n$1@77@01 $Ref)) (!
  (=>
    (Set_in n$1@77@01 g@61@01)
    (and (= (inv@79@01 n$1@77@01) n$1@77@01) (img@80@01 n$1@77@01)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$1@77@01) n$1@77@01))
  :qid |quant-u-50|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)) (= (inv@79@01 r) r))
  :pattern ((inv@79@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((n$1@77@01 $Ref)) (!
  (=> (Set_in n$1@77@01 g@61@01) (not (= n$1@77@01 $Ref.null)))
  :pattern (($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$1@77@01) n$1@77@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@81@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@79@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r))
  :pattern ((inv@79@01 r))
  :qid |quant-u-51|)))
(assert (=
  ($Snap.second ($Snap.second $t@76@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@76@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@76@01))) $Snap.unit))
; [eval] (forall n$2: Ref :: { (n$2.next in g) } { (n$2 in g), n$2.next } (n$2 in g) && n$2.next != null ==> (n$2.next in g))
(declare-const n$2@82@01 $Ref)
(push) ; 3
; [eval] (n$2 in g) && n$2.next != null ==> (n$2.next in g)
; [eval] (n$2 in g) && n$2.next != null
; [eval] (n$2 in g)
(push) ; 4
; [then-branch: 20 | !(n$2@82@01 in g@61@01) | live]
; [else-branch: 20 | n$2@82@01 in g@61@01 | live]
(push) ; 5
; [then-branch: 20 | !(n$2@82@01 in g@61@01)]
(assert (not (Set_in n$2@82@01 g@61@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | n$2@82@01 in g@61@01]
(assert (Set_in n$2@82@01 g@61@01))
; [eval] n$2.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef37|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01))
(push) ; 6
(assert (not (and (img@80@01 n$2@82@01) (Set_in (inv@79@01 n$2@82@01) g@61@01))))
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
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (=>
  (Set_in n$2@82@01 g@61@01)
  (and
    (Set_in n$2@82@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01))))
(assert (or (Set_in n$2@82@01 g@61@01) (not (Set_in n$2@82@01 g@61@01))))
(push) ; 4
; [then-branch: 21 | n$2@82@01 in g@61@01 && Lookup(next, sm@81@01, n$2@82@01) != Null | live]
; [else-branch: 21 | !(n$2@82@01 in g@61@01 && Lookup(next, sm@81@01, n$2@82@01) != Null) | live]
(push) ; 5
; [then-branch: 21 | n$2@82@01 in g@61@01 && Lookup(next, sm@81@01, n$2@82@01) != Null]
(assert (and
  (Set_in n$2@82@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null))))
; [eval] (n$2.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
    :qid |qp.fvfValDef36|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef37|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01))
(push) ; 6
(assert (not (and (img@80@01 n$2@82@01) (Set_in (inv@79@01 n$2@82@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(n$2@82@01 in g@61@01 && Lookup(next, sm@81@01, n$2@82@01) != Null)]
(assert (not
  (and
    (Set_in n$2@82@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef37|)))
(assert (=>
  (and
    (Set_in n$2@82@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null)))
  (and
    (Set_in n$2@82@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$2@82@01 g@61@01)
      (not (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null))))
  (and
    (Set_in n$2@82@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null)))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@81@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@81@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef37|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((n$2@82@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@82@01 g@61@01)
      (and
        (Set_in n$2@82@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01)))
    (or (Set_in n$2@82@01 g@61@01) (not (Set_in n$2@82@01 g@61@01)))
    (=>
      (and
        (Set_in n$2@82@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null)))
      (and
        (Set_in n$2@82@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01)))
    (or
      (not
        (and
          (Set_in n$2@82@01 g@61@01)
          (not
            (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null))))
      (and
        (Set_in n$2@82@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null)))))
  :pattern ((Set_in ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) g@61@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@25@13@25@21-aux|)))
(assert (forall ((n$2@82@01 $Ref)) (!
  (and
    (=>
      (Set_in n$2@82@01 g@61@01)
      (and
        (Set_in n$2@82@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01)))
    (or (Set_in n$2@82@01 g@61@01) (not (Set_in n$2@82@01 g@61@01)))
    (=>
      (and
        (Set_in n$2@82@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null)))
      (and
        (Set_in n$2@82@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null))
        ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01)))
    (or
      (not
        (and
          (Set_in n$2@82@01 g@61@01)
          (not
            (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null))))
      (and
        (Set_in n$2@82@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null)))))
  :pattern ((Set_in n$2@82@01 g@61@01) ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@25@13@25@21-aux|)))
(assert (forall ((n$2@82@01 $Ref)) (!
  (=>
    (and
      (Set_in n$2@82@01 g@61@01)
      (not (= ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) g@61@01))
  :pattern ((Set_in ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) g@61@01))
  :pattern ((Set_in n$2@82@01 g@61@01) ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n$2@82@01) n$2@82@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@25@13@25@21|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@76@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
  $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), y, x) } foo(hfun(g), x, y) == foo(old(hfun(g)), y, x))
(declare-const x@83@01 $Ref)
(declare-const y@84@01 $Ref)
(push) ; 3
; [eval] foo(hfun(g), x, y) == foo(old(hfun(g)), y, x)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 4
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@85@01 $Ref)
(push) ; 5
; [eval] (n in g)
(assert (Set_in n@85@01 g@61@01))
(pop) ; 5
(declare-fun inv@86@01 ($Ref) $Ref)
(declare-fun img@87@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@85@01 $Ref) (n2@85@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@85@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n1@85@01) n1@85@01))
      (and
        (Set_in n2@85@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) n2@85@01) n2@85@01))
      (= n1@85@01 n2@85@01))
    (= n1@85@01 n2@85@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@85@01 $Ref)) (!
  (=>
    (Set_in n@85@01 g@61@01)
    (and (= (inv@86@01 n@85@01) n@85@01) (img@87@01 n@85@01)))
  :pattern ((Set_in n@85@01 g@61@01))
  :pattern ((inv@86@01 n@85@01))
  :pattern ((img@87@01 n@85@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@87@01 r) (Set_in (inv@86@01 r) g@61@01)) (= (inv@86@01 r) r))
  :pattern ((inv@86@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@86@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r))
  :pattern ((inv@86@01 r))
  :qid |quant-u-53|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@88@01 ((r $Ref) (x@83@01 $Ref) (y@84@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r) (= r (inv@86@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@88@01 r x@83@01 y@84@01))
    $Perm.No)
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r) (= r (inv@86@01 r)))
    (= (- $Perm.Write (pTaken@88@01 r x@83@01 y@84@01)) $Perm.No))
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@89@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>)))
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r)))
    (=>
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r))
      (Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@90@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 6
; [then-branch: 22 | !(n$0@90@01 in g@61@01) | live]
; [else-branch: 22 | n$0@90@01 in g@61@01 | live]
(push) ; 7
; [then-branch: 22 | !(n$0@90@01 in g@61@01)]
(assert (not (Set_in n$0@90@01 g@61@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | n$0@90@01 in g@61@01]
(assert (Set_in n$0@90@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01) n$0@90@01))
(push) ; 8
(assert (not (and (img@80@01 n$0@90@01) (Set_in (inv@79@01 n$0@90@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@90@01 g@61@01)
  (and
    (Set_in n$0@90@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01) n$0@90@01))))
(assert (or (Set_in n$0@90@01 g@61@01) (not (Set_in n$0@90@01 g@61@01))))
(push) ; 6
; [then-branch: 23 | n$0@90@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@90@01) != Null | live]
; [else-branch: 23 | !(n$0@90@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@90@01) != Null) | live]
(push) ; 7
; [then-branch: 23 | n$0@90@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@90@01) != Null]
(assert (and
  (Set_in n$0@90@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01) n$0@90@01))
(push) ; 8
(assert (not (and (img@80@01 n$0@90@01) (Set_in (inv@79@01 n$0@90@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 23 | !(n$0@90@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@90@01) != Null)]
(assert (not
  (and
    (Set_in n$0@90@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
        $Ref.null)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@90@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
        $Ref.null)))
  (and
    (Set_in n$0@90@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01) n$0@90@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@90@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
          $Ref.null))))
  (and
    (Set_in n$0@90@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
        $Ref.null)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((n$0@90@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@90@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@90@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@90@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@89@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((n@85@01 $Ref)) (!
  (=>
    (Set_in n@85@01 g@61@01)
    (and (= (inv@86@01 n@85@01) n@85@01) (img@87@01 n@85@01)))
  :pattern ((Set_in n@85@01 g@61@01))
  :pattern ((inv@86@01 n@85@01))
  :pattern ((img@87@01 n@85@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@87@01 r) (Set_in (inv@86@01 r) g@61@01)) (= (inv@86@01 r) r))
  :pattern ((inv@86@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>)))
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r)))
    (=>
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r))
      (Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@86@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r))
    :pattern ((inv@86@01 r))
    :qid |quant-u-53|))
  (forall ((n$0@90@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@90@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@89@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
; [eval] foo(old(hfun(g)), y, x)
; [eval] old(hfun(g))
; [eval] hfun(g)
(push) ; 4
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@91@01 $Ref)
(push) ; 5
; [eval] (n in g)
(assert (Set_in n@91@01 g@61@01))
(pop) ; 5
(declare-fun inv@92@01 ($Ref) $Ref)
(declare-fun img@93@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@91@01 $Ref) (n2@91@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@91@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n1@91@01) n1@91@01))
      (and
        (Set_in n2@91@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) n2@91@01) n2@91@01))
      (= n1@91@01 n2@91@01))
    (= n1@91@01 n2@91@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@91@01 $Ref)) (!
  (=>
    (Set_in n@91@01 g@61@01)
    (and (= (inv@92@01 n@91@01) n@91@01) (img@93@01 n@91@01)))
  :pattern ((Set_in n@91@01 g@61@01))
  :pattern ((inv@92@01 n@91@01))
  :pattern ((img@93@01 n@91@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@93@01 r) (Set_in (inv@92@01 r) g@61@01)) (= (inv@92@01 r) r))
  :pattern ((inv@92@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@92@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) r) r))
  :pattern ((inv@92@01 r))
  :qid |quant-u-58|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@94@01 ((r $Ref) (x@83@01 $Ref) (y@84@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r) (= r (inv@92@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@94@01 r x@83@01 y@84@01))
    $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r) (= r (inv@92@01 r)))
    (= (- $Perm.Write (pTaken@94@01 r x@83@01 y@84@01)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@95@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>)))
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r)))
    (=>
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r))
      (Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>))))
  :qid |qp.fvfDomDef43|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@95@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@95@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@95@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef42|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@96@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 6
; [then-branch: 24 | !(n$0@96@01 in g@61@01) | live]
; [else-branch: 24 | n$0@96@01 in g@61@01 | live]
(push) ; 7
; [then-branch: 24 | !(n$0@96@01 in g@61@01)]
(assert (not (Set_in n$0@96@01 g@61@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | n$0@96@01 in g@61@01]
(assert (Set_in n$0@96@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01) n$0@96@01))
(push) ; 8
(assert (not (and (img@66@01 n$0@96@01) (Set_in (inv@65@01 n$0@96@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@96@01 g@61@01)
  (and
    (Set_in n$0@96@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01) n$0@96@01))))
(assert (or (Set_in n$0@96@01 g@61@01) (not (Set_in n$0@96@01 g@61@01))))
(push) ; 6
; [then-branch: 25 | n$0@96@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@96@01) != Null | live]
; [else-branch: 25 | !(n$0@96@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@96@01) != Null) | live]
(push) ; 7
; [then-branch: 25 | n$0@96@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@96@01) != Null]
(assert (and
  (Set_in n$0@96@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01) n$0@96@01))
(push) ; 8
(assert (not (and (img@66@01 n$0@96@01) (Set_in (inv@65@01 n$0@96@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 25 | !(n$0@96@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@96@01) != Null)]
(assert (not
  (and
    (Set_in n$0@96@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
        $Ref.null)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@96@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
        $Ref.null)))
  (and
    (Set_in n$0@96@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01) n$0@96@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@96@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
          $Ref.null))))
  (and
    (Set_in n$0@96@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
        $Ref.null)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((n$0@96@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@96@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@96@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@96@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@95@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((n@91@01 $Ref)) (!
  (=>
    (Set_in n@91@01 g@61@01)
    (and (= (inv@92@01 n@91@01) n@91@01) (img@93@01 n@91@01)))
  :pattern ((Set_in n@91@01 g@61@01))
  :pattern ((inv@92@01 n@91@01))
  :pattern ((img@93@01 n@91@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@93@01 r) (Set_in (inv@92@01 r) g@61@01)) (= (inv@92@01 r) r))
  :pattern ((inv@92@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>)))
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r)))
    (=>
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r))
      (Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>))))
  :qid |qp.fvfDomDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@95@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@95@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@95@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef42|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@92@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) r) r))
    :pattern ((inv@92@01 r))
    :qid |quant-u-58|))
  (forall ((n$0@96@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@96@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@95@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@85@01 $Ref)) (!
  (=>
    (Set_in n@85@01 g@61@01)
    (and (= (inv@86@01 n@85@01) n@85@01) (img@87@01 n@85@01)))
  :pattern ((Set_in n@85@01 g@61@01))
  :pattern ((inv@86@01 n@85@01))
  :pattern ((img@87@01 n@85@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@87@01 r) (Set_in (inv@86@01 r) g@61@01)) (= (inv@86@01 r) r))
  :pattern ((inv@86@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>)))
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r)))
    (=>
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r))
      (Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@89@01  $FVF<next>))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@86@01 r) g@61@01) (img@87@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@89@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@89@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef39|)))
(assert (forall ((n@91@01 $Ref)) (!
  (=>
    (Set_in n@91@01 g@61@01)
    (and (= (inv@92@01 n@91@01) n@91@01) (img@93@01 n@91@01)))
  :pattern ((Set_in n@91@01 g@61@01))
  :pattern ((inv@92@01 n@91@01))
  :pattern ((img@93@01 n@91@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@93@01 r) (Set_in (inv@92@01 r) g@61@01)) (= (inv@92@01 r) r))
  :pattern ((inv@92@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>)))
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r)))
    (=>
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r))
      (Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@95@01  $FVF<next>))))
  :qid |qp.fvfDomDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@92@01 r) g@61@01) (img@93@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@95@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@95@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@95@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@86@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@81@01  $FVF<next>) r) r))
  :pattern ((inv@86@01 r))
  :qid |quant-u-53|)))
(assert (forall ((n$0@90@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@90@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@90@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@89@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@92@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@67@01  $FVF<next>) r) r))
  :pattern ((inv@92@01 r))
  :qid |quant-u-58|)))
(assert (forall ((n$0@96@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@96@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@96@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@95@01  $FVF<next>))
    $Snap.unit)) g@61@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@83@01 $Ref) (y@84@01 $Ref)) (!
  (=
    (foo<Bool> (hfun ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@89@01  $FVF<next>))
        $Snap.unit)) g@61@01) x@83@01 y@84@01)
    (foo<Bool> (hfun ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@95@01  $FVF<next>))
        $Snap.unit)) g@61@01) y@84@01 x@83@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@89@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@83@01 y@84@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@95@01  $FVF<next>))
      $Snap.unit)) g@61@01) y@84@01 x@83@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@26@13@26@77|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), x, y) } foo(hfun(g), x, y) != foo(old(hfun(g)), x, y))
(declare-const x@97@01 $Ref)
(declare-const y@98@01 $Ref)
(push) ; 3
; [eval] foo(hfun(g), x, y) != foo(old(hfun(g)), x, y)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 4
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@99@01 $Ref)
(push) ; 5
; [eval] (n in g)
(assert (Set_in n@99@01 g@61@01))
(pop) ; 5
(declare-fun inv@100@01 ($Ref) $Ref)
(declare-fun img@101@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@102@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@102@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@102@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@102@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef45|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@99@01 $Ref) (n2@99@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@99@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@102@01  $FVF<next>) n1@99@01) n1@99@01))
      (and
        (Set_in n2@99@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@102@01  $FVF<next>) n2@99@01) n2@99@01))
      (= n1@99@01 n2@99@01))
    (= n1@99@01 n2@99@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@99@01 $Ref)) (!
  (=>
    (Set_in n@99@01 g@61@01)
    (and (= (inv@100@01 n@99@01) n@99@01) (img@101@01 n@99@01)))
  :pattern ((Set_in n@99@01 g@61@01))
  :pattern ((inv@100@01 n@99@01))
  :pattern ((img@101@01 n@99@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@101@01 r) (Set_in (inv@100@01 r) g@61@01)) (= (inv@100@01 r) r))
  :pattern ((inv@100@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@100@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@102@01  $FVF<next>) r) r))
  :pattern ((inv@100@01 r))
  :qid |quant-u-63|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@103@01 ((r $Ref) (x@97@01 $Ref) (y@98@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r) (= r (inv@100@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@103@01 r x@97@01 y@98@01))
    $Perm.No)
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r) (= r (inv@100@01 r)))
    (= (- $Perm.Write (pTaken@103@01 r x@97@01 y@98@01)) $Perm.No))
  
  :qid |quant-u-66|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@104@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>)))
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r)))
    (=>
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r))
      (Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>))))
  :qid |qp.fvfDomDef48|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@104@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@104@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@104@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef47|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@105@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 6
; [then-branch: 26 | !(n$0@105@01 in g@61@01) | live]
; [else-branch: 26 | n$0@105@01 in g@61@01 | live]
(push) ; 7
; [then-branch: 26 | !(n$0@105@01 in g@61@01)]
(assert (not (Set_in n$0@105@01 g@61@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | n$0@105@01 in g@61@01]
(assert (Set_in n$0@105@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01) n$0@105@01))
(push) ; 8
(assert (not (and (img@80@01 n$0@105@01) (Set_in (inv@79@01 n$0@105@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@105@01 g@61@01)
  (and
    (Set_in n$0@105@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01) n$0@105@01))))
(assert (or (Set_in n$0@105@01 g@61@01) (not (Set_in n$0@105@01 g@61@01))))
(push) ; 6
; [then-branch: 27 | n$0@105@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@105@01) != Null | live]
; [else-branch: 27 | !(n$0@105@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@105@01) != Null) | live]
(push) ; 7
; [then-branch: 27 | n$0@105@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@105@01) != Null]
(assert (and
  (Set_in n$0@105@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01) n$0@105@01))
(push) ; 8
(assert (not (and (img@80@01 n$0@105@01) (Set_in (inv@79@01 n$0@105@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 27 | !(n$0@105@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@105@01) != Null)]
(assert (not
  (and
    (Set_in n$0@105@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
        $Ref.null)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@105@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
        $Ref.null)))
  (and
    (Set_in n$0@105@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01) n$0@105@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@105@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
          $Ref.null))))
  (and
    (Set_in n$0@105@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
        $Ref.null)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((n$0@105@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@105@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@105@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@105@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@104@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@102@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@102@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@102@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef45|)))
(assert (forall ((n@99@01 $Ref)) (!
  (=>
    (Set_in n@99@01 g@61@01)
    (and (= (inv@100@01 n@99@01) n@99@01) (img@101@01 n@99@01)))
  :pattern ((Set_in n@99@01 g@61@01))
  :pattern ((inv@100@01 n@99@01))
  :pattern ((img@101@01 n@99@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@101@01 r) (Set_in (inv@100@01 r) g@61@01)) (= (inv@100@01 r) r))
  :pattern ((inv@100@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>)))
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r)))
    (=>
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r))
      (Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@104@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@104@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@104@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef47|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@100@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@102@01  $FVF<next>) r) r))
    :pattern ((inv@100@01 r))
    :qid |quant-u-63|))
  (forall ((n$0@105@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@105@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@104@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
; [eval] foo(old(hfun(g)), x, y)
; [eval] old(hfun(g))
; [eval] hfun(g)
(push) ; 4
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@106@01 $Ref)
(push) ; 5
; [eval] (n in g)
(assert (Set_in n@106@01 g@61@01))
(pop) ; 5
(declare-fun inv@107@01 ($Ref) $Ref)
(declare-fun img@108@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@109@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@109@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@109@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@109@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef50|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((n1@106@01 $Ref) (n2@106@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@106@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@109@01  $FVF<next>) n1@106@01) n1@106@01))
      (and
        (Set_in n2@106@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@109@01  $FVF<next>) n2@106@01) n2@106@01))
      (= n1@106@01 n2@106@01))
    (= n1@106@01 n2@106@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@106@01 $Ref)) (!
  (=>
    (Set_in n@106@01 g@61@01)
    (and (= (inv@107@01 n@106@01) n@106@01) (img@108@01 n@106@01)))
  :pattern ((Set_in n@106@01 g@61@01))
  :pattern ((inv@107@01 n@106@01))
  :pattern ((img@108@01 n@106@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@108@01 r) (Set_in (inv@107@01 r) g@61@01)) (= (inv@107@01 r) r))
  :pattern ((inv@107@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@107@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@109@01  $FVF<next>) r) r))
  :pattern ((inv@107@01 r))
  :qid |quant-u-68|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@110@01 ((r $Ref) (x@97@01 $Ref) (y@98@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r) (= r (inv@107@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@110@01 r x@97@01 y@98@01))
    $Perm.No)
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r) (= r (inv@107@01 r)))
    (= (- $Perm.Write (pTaken@110@01 r x@97@01 y@98@01)) $Perm.No))
  
  :qid |quant-u-71|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@111@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>)))
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r)))
    (=>
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r))
      (Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>))))
  :qid |qp.fvfDomDef53|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef52|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@112@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 6
; [then-branch: 28 | !(n$0@112@01 in g@61@01) | live]
; [else-branch: 28 | n$0@112@01 in g@61@01 | live]
(push) ; 7
; [then-branch: 28 | !(n$0@112@01 in g@61@01)]
(assert (not (Set_in n$0@112@01 g@61@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | n$0@112@01 in g@61@01]
(assert (Set_in n$0@112@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01) n$0@112@01))
(push) ; 8
(assert (not (and (img@66@01 n$0@112@01) (Set_in (inv@65@01 n$0@112@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@112@01 g@61@01)
  (and
    (Set_in n$0@112@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01) n$0@112@01))))
(assert (or (Set_in n$0@112@01 g@61@01) (not (Set_in n$0@112@01 g@61@01))))
(push) ; 6
; [then-branch: 29 | n$0@112@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@112@01) != Null | live]
; [else-branch: 29 | !(n$0@112@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@112@01) != Null) | live]
(push) ; 7
; [then-branch: 29 | n$0@112@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@112@01) != Null]
(assert (and
  (Set_in n$0@112@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01) n$0@112@01))
(push) ; 8
(assert (not (and (img@66@01 n$0@112@01) (Set_in (inv@65@01 n$0@112@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 29 | !(n$0@112@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@112@01) != Null)]
(assert (not
  (and
    (Set_in n$0@112@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
        $Ref.null)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@112@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
        $Ref.null)))
  (and
    (Set_in n$0@112@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01) n$0@112@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@112@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
          $Ref.null))))
  (and
    (Set_in n$0@112@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
        $Ref.null)))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 5
(assert (not (forall ((n$0@112@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@112@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@112@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@112@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@111@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@109@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@109@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@109@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@106@01 $Ref)) (!
  (=>
    (Set_in n@106@01 g@61@01)
    (and (= (inv@107@01 n@106@01) n@106@01) (img@108@01 n@106@01)))
  :pattern ((Set_in n@106@01 g@61@01))
  :pattern ((inv@107@01 n@106@01))
  :pattern ((img@108@01 n@106@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@108@01 r) (Set_in (inv@107@01 r) g@61@01)) (= (inv@107@01 r) r))
  :pattern ((inv@107@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>)))
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r)))
    (=>
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r))
      (Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>))))
  :qid |qp.fvfDomDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@107@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@109@01  $FVF<next>) r) r))
    :pattern ((inv@107@01 r))
    :qid |quant-u-68|))
  (forall ((n$0@112@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@112@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@111@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@102@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@102@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@102@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef45|)))
(assert (forall ((n@99@01 $Ref)) (!
  (=>
    (Set_in n@99@01 g@61@01)
    (and (= (inv@100@01 n@99@01) n@99@01) (img@101@01 n@99@01)))
  :pattern ((Set_in n@99@01 g@61@01))
  :pattern ((inv@100@01 n@99@01))
  :pattern ((img@101@01 n@99@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@101@01 r) (Set_in (inv@100@01 r) g@61@01)) (= (inv@100@01 r) r))
  :pattern ((inv@100@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>)))
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r)))
    (=>
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r))
      (Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@104@01  $FVF<next>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@100@01 r) g@61@01) (img@101@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@104@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@104@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@104@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@109@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@109@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@109@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef50|)))
(assert (forall ((n@106@01 $Ref)) (!
  (=>
    (Set_in n@106@01 g@61@01)
    (and (= (inv@107@01 n@106@01) n@106@01) (img@108@01 n@106@01)))
  :pattern ((Set_in n@106@01 g@61@01))
  :pattern ((inv@107@01 n@106@01))
  :pattern ((img@108@01 n@106@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@108@01 r) (Set_in (inv@107@01 r) g@61@01)) (= (inv@107@01 r) r))
  :pattern ((inv@107@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>)))
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r)))
    (=>
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r))
      (Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@111@01  $FVF<next>))))
  :qid |qp.fvfDomDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@107@01 r) g@61@01) (img@108@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@111@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@111@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@100@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@102@01  $FVF<next>) r) r))
  :pattern ((inv@100@01 r))
  :qid |quant-u-63|)))
(assert (forall ((n$0@105@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@105@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@105@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@104@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@107@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@109@01  $FVF<next>) r) r))
  :pattern ((inv@107@01 r))
  :qid |quant-u-68|)))
(assert (forall ((n$0@112@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@112@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@112@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@111@01  $FVF<next>))
    $Snap.unit)) g@61@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@97@01 $Ref) (y@98@01 $Ref)) (!
  (not
    (=
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@104@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@97@01 y@98@01)
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@111@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@97@01 y@98@01)))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@104@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@97@01 y@98@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@111@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@97@01 y@98@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@27@13@27@77|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))
  $Snap.unit))
; [eval] hfun(g) != old(hfun(g))
; [eval] hfun(g)
(push) ; 3
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@113@01 $Ref)
(push) ; 4
; [eval] (n in g)
(assert (Set_in n@113@01 g@61@01))
(pop) ; 4
(declare-fun inv@114@01 ($Ref) $Ref)
(declare-fun img@115@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@116@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@116@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@116@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@116@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef55|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n1@113@01 $Ref) (n2@113@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@113@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@116@01  $FVF<next>) n1@113@01) n1@113@01))
      (and
        (Set_in n2@113@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@116@01  $FVF<next>) n2@113@01) n2@113@01))
      (= n1@113@01 n2@113@01))
    (= n1@113@01 n2@113@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@113@01 $Ref)) (!
  (=>
    (Set_in n@113@01 g@61@01)
    (and (= (inv@114@01 n@113@01) n@113@01) (img@115@01 n@113@01)))
  :pattern ((Set_in n@113@01 g@61@01))
  :pattern ((inv@114@01 n@113@01))
  :pattern ((img@115@01 n@113@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@115@01 r) (Set_in (inv@114@01 r) g@61@01)) (= (inv@114@01 r) r))
  :pattern ((inv@114@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@114@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@116@01  $FVF<next>) r) r))
  :pattern ((inv@114@01 r))
  :qid |quant-u-73|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@117@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@114@01 r) g@61@01) (img@115@01 r) (= r (inv@114@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
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
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@117@01 r))
    $Perm.No)
  
  :qid |quant-u-75|))))
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
    (and (Set_in (inv@114@01 r) g@61@01) (img@115@01 r) (= r (inv@114@01 r)))
    (= (- $Perm.Write (pTaken@117@01 r)) $Perm.No))
  
  :qid |quant-u-76|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@118@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@118@01  $FVF<next>)))
      (and (Set_in (inv@114@01 r) g@61@01) (img@115@01 r)))
    (=>
      (and (Set_in (inv@114@01 r) g@61@01) (img@115@01 r))
      (Set_in r ($FVF.domain_next (as sm@118@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@118@01  $FVF<next>))))
  :qid |qp.fvfDomDef58|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@114@01 r) g@61@01) (img@115@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@118@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@118@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@118@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef57|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@119@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 5
; [then-branch: 30 | !(n$0@119@01 in g@61@01) | live]
; [else-branch: 30 | n$0@119@01 in g@61@01 | live]
(push) ; 6
; [then-branch: 30 | !(n$0@119@01 in g@61@01)]
(assert (not (Set_in n$0@119@01 g@61@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 30 | n$0@119@01 in g@61@01]
(assert (Set_in n$0@119@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01) n$0@119@01))
(push) ; 7
(assert (not (and (img@80@01 n$0@119@01) (Set_in (inv@79@01 n$0@119@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@119@01 g@61@01)
  (and
    (Set_in n$0@119@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01) n$0@119@01))))
(assert (or (Set_in n$0@119@01 g@61@01) (not (Set_in n$0@119@01 g@61@01))))
(push) ; 5
; [then-branch: 31 | n$0@119@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@119@01) != Null | live]
; [else-branch: 31 | !(n$0@119@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@119@01) != Null) | live]
(push) ; 6
; [then-branch: 31 | n$0@119@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@119@01) != Null]
(assert (and
  (Set_in n$0@119@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01) n$0@119@01))
(push) ; 7
(assert (not (and (img@80@01 n$0@119@01) (Set_in (inv@79@01 n$0@119@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 31 | !(n$0@119@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@119@01) != Null)]
(assert (not
  (and
    (Set_in n$0@119@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
        $Ref.null)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@119@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
        $Ref.null)))
  (and
    (Set_in n$0@119@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01) n$0@119@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@119@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
          $Ref.null))))
  (and
    (Set_in n$0@119@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
        $Ref.null)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((n$0@119@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@119@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@119@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@119@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@118@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@116@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@116@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@116@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (forall ((n@113@01 $Ref)) (!
  (=>
    (Set_in n@113@01 g@61@01)
    (and (= (inv@114@01 n@113@01) n@113@01) (img@115@01 n@113@01)))
  :pattern ((Set_in n@113@01 g@61@01))
  :pattern ((inv@114@01 n@113@01))
  :pattern ((img@115@01 n@113@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@115@01 r) (Set_in (inv@114@01 r) g@61@01)) (= (inv@114@01 r) r))
  :pattern ((inv@114@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@118@01  $FVF<next>)))
      (and (Set_in (inv@114@01 r) g@61@01) (img@115@01 r)))
    (=>
      (and (Set_in (inv@114@01 r) g@61@01) (img@115@01 r))
      (Set_in r ($FVF.domain_next (as sm@118@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@118@01  $FVF<next>))))
  :qid |qp.fvfDomDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@114@01 r) g@61@01) (img@115@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@118@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@118@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@118@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@114@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@116@01  $FVF<next>) r) r))
    :pattern ((inv@114@01 r))
    :qid |quant-u-73|))
  (forall ((n$0@119@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@119@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@119@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@118@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
; [eval] old(hfun(g))
; [eval] hfun(g)
(push) ; 3
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@120@01 $Ref)
(push) ; 4
; [eval] (n in g)
(assert (Set_in n@120@01 g@61@01))
(pop) ; 4
(declare-fun inv@121@01 ($Ref) $Ref)
(declare-fun img@122@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@123@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@123@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@123@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@123@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef60|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((n1@120@01 $Ref) (n2@120@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@120@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@123@01  $FVF<next>) n1@120@01) n1@120@01))
      (and
        (Set_in n2@120@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@123@01  $FVF<next>) n2@120@01) n2@120@01))
      (= n1@120@01 n2@120@01))
    (= n1@120@01 n2@120@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@120@01 $Ref)) (!
  (=>
    (Set_in n@120@01 g@61@01)
    (and (= (inv@121@01 n@120@01) n@120@01) (img@122@01 n@120@01)))
  :pattern ((Set_in n@120@01 g@61@01))
  :pattern ((inv@121@01 n@120@01))
  :pattern ((img@122@01 n@120@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@122@01 r) (Set_in (inv@121@01 r) g@61@01)) (= (inv@121@01 r) r))
  :pattern ((inv@121@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@121@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@123@01  $FVF<next>) r) r))
  :pattern ((inv@121@01 r))
  :qid |quant-u-78|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@124@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@121@01 r) g@61@01) (img@122@01 r) (= r (inv@121@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@124@01 r))
    $Perm.No)
  
  :qid |quant-u-80|))))
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
    (and (Set_in (inv@121@01 r) g@61@01) (img@122@01 r) (= r (inv@121@01 r)))
    (= (- $Perm.Write (pTaken@124@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@125@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@125@01  $FVF<next>)))
      (and (Set_in (inv@121@01 r) g@61@01) (img@122@01 r)))
    (=>
      (and (Set_in (inv@121@01 r) g@61@01) (img@122@01 r))
      (Set_in r ($FVF.domain_next (as sm@125@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@125@01  $FVF<next>))))
  :qid |qp.fvfDomDef63|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@121@01 r) g@61@01) (img@122@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@125@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@125@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@125@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef62|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@126@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 5
; [then-branch: 32 | !(n$0@126@01 in g@61@01) | live]
; [else-branch: 32 | n$0@126@01 in g@61@01 | live]
(push) ; 6
; [then-branch: 32 | !(n$0@126@01 in g@61@01)]
(assert (not (Set_in n$0@126@01 g@61@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | n$0@126@01 in g@61@01]
(assert (Set_in n$0@126@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01) n$0@126@01))
(push) ; 7
(assert (not (and (img@66@01 n$0@126@01) (Set_in (inv@65@01 n$0@126@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@126@01 g@61@01)
  (and
    (Set_in n$0@126@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01) n$0@126@01))))
(assert (or (Set_in n$0@126@01 g@61@01) (not (Set_in n$0@126@01 g@61@01))))
(push) ; 5
; [then-branch: 33 | n$0@126@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@126@01) != Null | live]
; [else-branch: 33 | !(n$0@126@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@126@01) != Null) | live]
(push) ; 6
; [then-branch: 33 | n$0@126@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@126@01) != Null]
(assert (and
  (Set_in n$0@126@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01) n$0@126@01))
(push) ; 7
(assert (not (and (img@66@01 n$0@126@01) (Set_in (inv@65@01 n$0@126@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 33 | !(n$0@126@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@126@01) != Null)]
(assert (not
  (and
    (Set_in n$0@126@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
        $Ref.null)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@126@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
        $Ref.null)))
  (and
    (Set_in n$0@126@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01) n$0@126@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@126@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
          $Ref.null))))
  (and
    (Set_in n$0@126@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
        $Ref.null)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((n$0@126@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@126@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@126@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@126@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@125@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@123@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@123@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@123@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (forall ((n@120@01 $Ref)) (!
  (=>
    (Set_in n@120@01 g@61@01)
    (and (= (inv@121@01 n@120@01) n@120@01) (img@122@01 n@120@01)))
  :pattern ((Set_in n@120@01 g@61@01))
  :pattern ((inv@121@01 n@120@01))
  :pattern ((img@122@01 n@120@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@122@01 r) (Set_in (inv@121@01 r) g@61@01)) (= (inv@121@01 r) r))
  :pattern ((inv@121@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@125@01  $FVF<next>)))
      (and (Set_in (inv@121@01 r) g@61@01) (img@122@01 r)))
    (=>
      (and (Set_in (inv@121@01 r) g@61@01) (img@122@01 r))
      (Set_in r ($FVF.domain_next (as sm@125@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@125@01  $FVF<next>))))
  :qid |qp.fvfDomDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@121@01 r) g@61@01) (img@122@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@125@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@125@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@125@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef62|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@121@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@123@01  $FVF<next>) r) r))
    :pattern ((inv@121@01 r))
    :qid |quant-u-78|))
  (forall ((n$0@126@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@126@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@126@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@125@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
(assert (not
  (Set_equal (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@118@01  $FVF<next>))
      $Snap.unit)) g@61@01) (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@125@01  $FVF<next>))
      $Snap.unit)) g@61@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@69@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not b1@69@01))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [then-branch: 34 | b1@69@01 | live]
; [else-branch: 34 | !(b1@69@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 34 | b1@69@01]
(assert b1@69@01)
; [exec]
; assert (forall x: Ref, y: Ref ::
;     { foo(hfun(g), x, y) }
;     { foo(old(hfun(g)), y, x) }
;     foo(hfun(g), x, y) == foo(old(hfun(g)), y, x))
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), y, x) } foo(hfun(g), x, y) == foo(old(hfun(g)), y, x))
(declare-const x@127@01 $Ref)
(declare-const y@128@01 $Ref)
(push) ; 4
; [eval] foo(hfun(g), x, y) == foo(old(hfun(g)), y, x)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 5
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@129@01 $Ref)
(push) ; 6
; [eval] (n in g)
(assert (Set_in n@129@01 g@61@01))
(pop) ; 6
(declare-fun inv@130@01 ($Ref) $Ref)
(declare-fun img@131@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@132@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@132@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@132@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@132@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef65|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@129@01 $Ref) (n2@129@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@129@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@132@01  $FVF<next>) n1@129@01) n1@129@01))
      (and
        (Set_in n2@129@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@132@01  $FVF<next>) n2@129@01) n2@129@01))
      (= n1@129@01 n2@129@01))
    (= n1@129@01 n2@129@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@129@01 $Ref)) (!
  (=>
    (Set_in n@129@01 g@61@01)
    (and (= (inv@130@01 n@129@01) n@129@01) (img@131@01 n@129@01)))
  :pattern ((Set_in n@129@01 g@61@01))
  :pattern ((inv@130@01 n@129@01))
  :pattern ((img@131@01 n@129@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@131@01 r) (Set_in (inv@130@01 r) g@61@01)) (= (inv@130@01 r) r))
  :pattern ((inv@130@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@130@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@132@01  $FVF<next>) r) r))
  :pattern ((inv@130@01 r))
  :qid |quant-u-83|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@133@01 ((r $Ref) (x@127@01 $Ref) (y@128@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r) (= r (inv@130@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@133@01 r x@127@01 y@128@01))
    $Perm.No)
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r) (= r (inv@130@01 r)))
    (= (- $Perm.Write (pTaken@133@01 r x@127@01 y@128@01)) $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@134@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>)))
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r)))
    (=>
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r))
      (Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>))))
  :qid |qp.fvfDomDef68|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@134@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@134@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@134@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef67|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@135@01 $Ref)
(set-option :timeout 0)
(push) ; 6
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 7
; [then-branch: 35 | !(n$0@135@01 in g@61@01) | live]
; [else-branch: 35 | n$0@135@01 in g@61@01 | live]
(push) ; 8
; [then-branch: 35 | !(n$0@135@01 in g@61@01)]
(assert (not (Set_in n$0@135@01 g@61@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | n$0@135@01 in g@61@01]
(assert (Set_in n$0@135@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01) n$0@135@01))
(push) ; 9
(assert (not (and (img@80@01 n$0@135@01) (Set_in (inv@79@01 n$0@135@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@135@01 g@61@01)
  (and
    (Set_in n$0@135@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01) n$0@135@01))))
(assert (or (Set_in n$0@135@01 g@61@01) (not (Set_in n$0@135@01 g@61@01))))
(push) ; 7
; [then-branch: 36 | n$0@135@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@135@01) != Null | live]
; [else-branch: 36 | !(n$0@135@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@135@01) != Null) | live]
(push) ; 8
; [then-branch: 36 | n$0@135@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@135@01) != Null]
(assert (and
  (Set_in n$0@135@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01) n$0@135@01))
(push) ; 9
(assert (not (and (img@80@01 n$0@135@01) (Set_in (inv@79@01 n$0@135@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 36 | !(n$0@135@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@135@01) != Null)]
(assert (not
  (and
    (Set_in n$0@135@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@135@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
        $Ref.null)))
  (and
    (Set_in n$0@135@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01) n$0@135@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@135@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
          $Ref.null))))
  (and
    (Set_in n$0@135@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
        $Ref.null)))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 6
(assert (not (forall ((n$0@135@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@135@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@135@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@135@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@132@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@132@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@132@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef65|)))
(assert (forall ((n@129@01 $Ref)) (!
  (=>
    (Set_in n@129@01 g@61@01)
    (and (= (inv@130@01 n@129@01) n@129@01) (img@131@01 n@129@01)))
  :pattern ((Set_in n@129@01 g@61@01))
  :pattern ((inv@130@01 n@129@01))
  :pattern ((img@131@01 n@129@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@131@01 r) (Set_in (inv@130@01 r) g@61@01)) (= (inv@130@01 r) r))
  :pattern ((inv@130@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>)))
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r)))
    (=>
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r))
      (Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>))))
  :qid |qp.fvfDomDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@134@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@134@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@134@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef67|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@130@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@132@01  $FVF<next>) r) r))
    :pattern ((inv@130@01 r))
    :qid |quant-u-83|))
  (forall ((n$0@135@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@135@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
; [eval] foo(old(hfun(g)), y, x)
; [eval] old(hfun(g))
; [eval] hfun(g)
(push) ; 5
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@136@01 $Ref)
(push) ; 6
; [eval] (n in g)
(assert (Set_in n@136@01 g@61@01))
(pop) ; 6
(declare-fun inv@137@01 ($Ref) $Ref)
(declare-fun img@138@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@139@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@139@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@139@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@139@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef70|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((n1@136@01 $Ref) (n2@136@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@136@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@139@01  $FVF<next>) n1@136@01) n1@136@01))
      (and
        (Set_in n2@136@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@139@01  $FVF<next>) n2@136@01) n2@136@01))
      (= n1@136@01 n2@136@01))
    (= n1@136@01 n2@136@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@136@01 $Ref)) (!
  (=>
    (Set_in n@136@01 g@61@01)
    (and (= (inv@137@01 n@136@01) n@136@01) (img@138@01 n@136@01)))
  :pattern ((Set_in n@136@01 g@61@01))
  :pattern ((inv@137@01 n@136@01))
  :pattern ((img@138@01 n@136@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@138@01 r) (Set_in (inv@137@01 r) g@61@01)) (= (inv@137@01 r) r))
  :pattern ((inv@137@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@137@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@139@01  $FVF<next>) r) r))
  :pattern ((inv@137@01 r))
  :qid |quant-u-88|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@140@01 ((r $Ref) (x@127@01 $Ref) (y@128@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r) (= r (inv@137@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@140@01 r x@127@01 y@128@01))
    $Perm.No)
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r) (= r (inv@137@01 r)))
    (= (- $Perm.Write (pTaken@140@01 r x@127@01 y@128@01)) $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@141@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>)))
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r)))
    (=>
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r))
      (Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>))))
  :qid |qp.fvfDomDef73|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef72|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@142@01 $Ref)
(set-option :timeout 0)
(push) ; 6
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 7
; [then-branch: 37 | !(n$0@142@01 in g@61@01) | live]
; [else-branch: 37 | n$0@142@01 in g@61@01 | live]
(push) ; 8
; [then-branch: 37 | !(n$0@142@01 in g@61@01)]
(assert (not (Set_in n$0@142@01 g@61@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 37 | n$0@142@01 in g@61@01]
(assert (Set_in n$0@142@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01) n$0@142@01))
(push) ; 9
(assert (not (and (img@66@01 n$0@142@01) (Set_in (inv@65@01 n$0@142@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@142@01 g@61@01)
  (and
    (Set_in n$0@142@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01) n$0@142@01))))
(assert (or (Set_in n$0@142@01 g@61@01) (not (Set_in n$0@142@01 g@61@01))))
(push) ; 7
; [then-branch: 38 | n$0@142@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@142@01) != Null | live]
; [else-branch: 38 | !(n$0@142@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@142@01) != Null) | live]
(push) ; 8
; [then-branch: 38 | n$0@142@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@142@01) != Null]
(assert (and
  (Set_in n$0@142@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01) n$0@142@01))
(push) ; 9
(assert (not (and (img@66@01 n$0@142@01) (Set_in (inv@65@01 n$0@142@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 38 | !(n$0@142@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@142@01) != Null)]
(assert (not
  (and
    (Set_in n$0@142@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
        $Ref.null)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@142@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
        $Ref.null)))
  (and
    (Set_in n$0@142@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01) n$0@142@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@142@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
          $Ref.null))))
  (and
    (Set_in n$0@142@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
        $Ref.null)))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 6
(assert (not (forall ((n$0@142@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@142@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@142@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@142@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@139@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@139@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@139@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef70|)))
(assert (forall ((n@136@01 $Ref)) (!
  (=>
    (Set_in n@136@01 g@61@01)
    (and (= (inv@137@01 n@136@01) n@136@01) (img@138@01 n@136@01)))
  :pattern ((Set_in n@136@01 g@61@01))
  :pattern ((inv@137@01 n@136@01))
  :pattern ((img@138@01 n@136@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@138@01 r) (Set_in (inv@137@01 r) g@61@01)) (= (inv@137@01 r) r))
  :pattern ((inv@137@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>)))
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r)))
    (=>
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r))
      (Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>))))
  :qid |qp.fvfDomDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef72|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@137@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@139@01  $FVF<next>) r) r))
    :pattern ((inv@137@01 r))
    :qid |quant-u-88|))
  (forall ((n$0@142@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@142@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@132@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@132@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@132@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef65|)))
(assert (forall ((n@129@01 $Ref)) (!
  (=>
    (Set_in n@129@01 g@61@01)
    (and (= (inv@130@01 n@129@01) n@129@01) (img@131@01 n@129@01)))
  :pattern ((Set_in n@129@01 g@61@01))
  :pattern ((inv@130@01 n@129@01))
  :pattern ((img@131@01 n@129@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@131@01 r) (Set_in (inv@130@01 r) g@61@01)) (= (inv@130@01 r) r))
  :pattern ((inv@130@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>)))
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r)))
    (=>
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r))
      (Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@134@01  $FVF<next>))))
  :qid |qp.fvfDomDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@130@01 r) g@61@01) (img@131@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@134@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@134@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@134@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@139@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@139@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@139@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef70|)))
(assert (forall ((n@136@01 $Ref)) (!
  (=>
    (Set_in n@136@01 g@61@01)
    (and (= (inv@137@01 n@136@01) n@136@01) (img@138@01 n@136@01)))
  :pattern ((Set_in n@136@01 g@61@01))
  :pattern ((inv@137@01 n@136@01))
  :pattern ((img@138@01 n@136@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@138@01 r) (Set_in (inv@137@01 r) g@61@01)) (= (inv@137@01 r) r))
  :pattern ((inv@137@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>)))
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r)))
    (=>
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r))
      (Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@141@01  $FVF<next>))))
  :qid |qp.fvfDomDef73|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@137@01 r) g@61@01) (img@138@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@141@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@141@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@130@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@132@01  $FVF<next>) r) r))
  :pattern ((inv@130@01 r))
  :qid |quant-u-83|)))
(assert (forall ((n$0@135@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@135@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@135@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@137@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@139@01  $FVF<next>) r) r))
  :pattern ((inv@137@01 r))
  :qid |quant-u-88|)))
(assert (forall ((n$0@142@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@142@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@142@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
    $Snap.unit)) g@61@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@127@01 $Ref) (y@128@01 $Ref)) (!
  (and
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
        $Snap.unit)) g@61@01)
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
        $Snap.unit)) g@61@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@127@01 y@128@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
      $Snap.unit)) g@61@01) y@128@01 x@127@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@42@16@42@80_precondition|)))
(push) ; 4
(assert (not (forall ((x@127@01 $Ref) (y@128@01 $Ref)) (!
  (=>
    (and
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
          $Snap.unit)) g@61@01)
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
          $Snap.unit)) g@61@01))
    (=
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@127@01 y@128@01)
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
          $Snap.unit)) g@61@01) y@128@01 x@127@01)))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@127@01 y@128@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
      $Snap.unit)) g@61@01) y@128@01 x@127@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@42@16@42@80|))))
(check-sat)
; unsat
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(assert (forall ((x@127@01 $Ref) (y@128@01 $Ref)) (!
  (=
    (foo<Bool> (hfun ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
        $Snap.unit)) g@61@01) x@127@01 y@128@01)
    (foo<Bool> (hfun ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
        $Snap.unit)) g@61@01) y@128@01 x@127@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@134@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@127@01 y@128@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@141@01  $FVF<next>))
      $Snap.unit)) g@61@01) y@128@01 x@127@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@42@16@42@80|)))
; [exec]
; inhale false
(pop) ; 3
(push) ; 3
; [else-branch: 34 | !(b1@69@01)]
(assert (not b1@69@01))
(pop) ; 3
; [eval] !b1
(push) ; 3
(set-option :timeout 10)
(assert (not b1@69@01))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not b1@69@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [then-branch: 39 | !(b1@69@01) | live]
; [else-branch: 39 | b1@69@01 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 39 | !(b1@69@01)]
(assert (not b1@69@01))
(push) ; 4
(set-option :timeout 10)
(assert (not (not b2@70@01)))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not b2@70@01))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; [then-branch: 40 | b2@70@01 | live]
; [else-branch: 40 | !(b2@70@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 40 | b2@70@01]
(assert b2@70@01)
; [exec]
; assert (forall x: Ref, y: Ref ::
;     { foo(hfun(g), x, y) }
;     { foo(old(hfun(g)), x, y) }
;     foo(hfun(g), x, y) == foo(old(hfun(g)), x, y))
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), x, y) } foo(hfun(g), x, y) == foo(old(hfun(g)), x, y))
(declare-const x@143@01 $Ref)
(declare-const y@144@01 $Ref)
(push) ; 5
; [eval] foo(hfun(g), x, y) == foo(old(hfun(g)), x, y)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 6
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@145@01 $Ref)
(push) ; 7
; [eval] (n in g)
(assert (Set_in n@145@01 g@61@01))
(pop) ; 7
(declare-fun inv@146@01 ($Ref) $Ref)
(declare-fun img@147@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@148@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef75|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@145@01 $Ref) (n2@145@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@145@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) n1@145@01) n1@145@01))
      (and
        (Set_in n2@145@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) n2@145@01) n2@145@01))
      (= n1@145@01 n2@145@01))
    (= n1@145@01 n2@145@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@61@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@61@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@61@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@146@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
  :pattern ((inv@146@01 r))
  :qid |quant-u-93|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@149@01 ((r $Ref) (x@143@01 $Ref) (y@144@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r) (= r (inv@146@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@149@01 r x@143@01 y@144@01))
    $Perm.No)
  
  :qid |quant-u-95|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r) (= r (inv@146@01 r)))
    (= (- $Perm.Write (pTaken@149@01 r x@143@01 y@144@01)) $Perm.No))
  
  :qid |quant-u-96|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@150@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>))))
  :qid |qp.fvfDomDef78|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@150@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef77|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@151@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 8
; [then-branch: 41 | !(n$0@151@01 in g@61@01) | live]
; [else-branch: 41 | n$0@151@01 in g@61@01 | live]
(push) ; 9
; [then-branch: 41 | !(n$0@151@01 in g@61@01)]
(assert (not (Set_in n$0@151@01 g@61@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 41 | n$0@151@01 in g@61@01]
(assert (Set_in n$0@151@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01) n$0@151@01))
(push) ; 10
(assert (not (and (img@80@01 n$0@151@01) (Set_in (inv@79@01 n$0@151@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@151@01 g@61@01)
  (and
    (Set_in n$0@151@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01) n$0@151@01))))
(assert (or (Set_in n$0@151@01 g@61@01) (not (Set_in n$0@151@01 g@61@01))))
(push) ; 8
; [then-branch: 42 | n$0@151@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@151@01) != Null | live]
; [else-branch: 42 | !(n$0@151@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@151@01) != Null) | live]
(push) ; 9
; [then-branch: 42 | n$0@151@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@151@01) != Null]
(assert (and
  (Set_in n$0@151@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01) n$0@151@01))
(push) ; 10
(assert (not (and (img@80@01 n$0@151@01) (Set_in (inv@79@01 n$0@151@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 42 | !(n$0@151@01 in g@61@01 && Lookup(next, First:(Second:($t@76@01)), n$0@151@01) != Null)]
(assert (not
  (and
    (Set_in n$0@151@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
        $Ref.null)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@151@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
        $Ref.null)))
  (and
    (Set_in n$0@151@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01) n$0@151@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@151@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
          $Ref.null))))
  (and
    (Set_in n$0@151@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
        $Ref.null)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 7
(assert (not (forall ((n$0@151@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@151@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@151@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@151@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@150@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef75|)))
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@61@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@61@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@61@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>))))
  :qid |qp.fvfDomDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@150@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef77|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@146@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
    :pattern ((inv@146@01 r))
    :qid |quant-u-93|))
  (forall ((n$0@151@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@151@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@150@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
; [eval] foo(old(hfun(g)), x, y)
; [eval] old(hfun(g))
; [eval] hfun(g)
(push) ; 6
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@152@01 $Ref)
(push) ; 7
; [eval] (n in g)
(assert (Set_in n@152@01 g@61@01))
(pop) ; 7
(declare-fun inv@153@01 ($Ref) $Ref)
(declare-fun img@154@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@155@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@155@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef80|)))
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@152@01 $Ref) (n2@152@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@152@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@155@01  $FVF<next>) n1@152@01) n1@152@01))
      (and
        (Set_in n2@152@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@155@01  $FVF<next>) n2@152@01) n2@152@01))
      (= n1@152@01 n2@152@01))
    (= n1@152@01 n2@152@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@152@01 $Ref)) (!
  (=>
    (Set_in n@152@01 g@61@01)
    (and (= (inv@153@01 n@152@01) n@152@01) (img@154@01 n@152@01)))
  :pattern ((Set_in n@152@01 g@61@01))
  :pattern ((inv@153@01 n@152@01))
  :pattern ((img@154@01 n@152@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@154@01 r) (Set_in (inv@153@01 r) g@61@01)) (= (inv@153@01 r) r))
  :pattern ((inv@153@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@153@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@155@01  $FVF<next>) r) r))
  :pattern ((inv@153@01 r))
  :qid |quant-u-98|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@156@01 ((r $Ref) (x@143@01 $Ref) (y@144@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r) (= r (inv@153@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@156@01 r x@143@01 y@144@01))
    $Perm.No)
  
  :qid |quant-u-100|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r) (= r (inv@153@01 r)))
    (= (- $Perm.Write (pTaken@156@01 r x@143@01 y@144@01)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@157@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>)))
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r)))
    (=>
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r))
      (Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>))))
  :qid |qp.fvfDomDef83|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@157@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@157@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@157@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef82|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@158@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 8
; [then-branch: 43 | !(n$0@158@01 in g@61@01) | live]
; [else-branch: 43 | n$0@158@01 in g@61@01 | live]
(push) ; 9
; [then-branch: 43 | !(n$0@158@01 in g@61@01)]
(assert (not (Set_in n$0@158@01 g@61@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 43 | n$0@158@01 in g@61@01]
(assert (Set_in n$0@158@01 g@61@01))
; [eval] n$0.next != null
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01) n$0@158@01))
(push) ; 10
(assert (not (and (img@66@01 n$0@158@01) (Set_in (inv@65@01 n$0@158@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in n$0@158@01 g@61@01)
  (and
    (Set_in n$0@158@01 g@61@01)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01) n$0@158@01))))
(assert (or (Set_in n$0@158@01 g@61@01) (not (Set_in n$0@158@01 g@61@01))))
(push) ; 8
; [then-branch: 44 | n$0@158@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@158@01) != Null | live]
; [else-branch: 44 | !(n$0@158@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@158@01) != Null) | live]
(push) ; 9
; [then-branch: 44 | n$0@158@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@158@01) != Null]
(assert (and
  (Set_in n$0@158@01 g@61@01)
  (not
    (=
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
      $Ref.null))))
; [eval] (n$0.next in g)
(assert ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01) n$0@158@01))
(push) ; 10
(assert (not (and (img@66@01 n$0@158@01) (Set_in (inv@65@01 n$0@158@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 44 | !(n$0@158@01 in g@61@01 && Lookup(next, First:(Second:($t@62@01)), n$0@158@01) != Null)]
(assert (not
  (and
    (Set_in n$0@158@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
        $Ref.null)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and
    (Set_in n$0@158@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
        $Ref.null)))
  (and
    (Set_in n$0@158@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
        $Ref.null))
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01) n$0@158@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in n$0@158@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
          $Ref.null))))
  (and
    (Set_in n$0@158@01 g@61@01)
    (not
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
        $Ref.null)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 7
(assert (not (forall ((n$0@158@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@158@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@158@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@158@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@157@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@155@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (forall ((n@152@01 $Ref)) (!
  (=>
    (Set_in n@152@01 g@61@01)
    (and (= (inv@153@01 n@152@01) n@152@01) (img@154@01 n@152@01)))
  :pattern ((Set_in n@152@01 g@61@01))
  :pattern ((inv@153@01 n@152@01))
  :pattern ((img@154@01 n@152@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@154@01 r) (Set_in (inv@153@01 r) g@61@01)) (= (inv@153@01 r) r))
  :pattern ((inv@153@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>)))
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r)))
    (=>
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r))
      (Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>))))
  :qid |qp.fvfDomDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@157@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@157@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@157@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef82|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@153@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@155@01  $FVF<next>) r) r))
    :pattern ((inv@153@01 r))
    :qid |quant-u-98|))
  (forall ((n$0@158@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@158@01 g@61@01)
        (not
          (=
            ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
            $Ref.null)))
      (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@157@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@148@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@148@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef75|)))
(assert (forall ((n@145@01 $Ref)) (!
  (=>
    (Set_in n@145@01 g@61@01)
    (and (= (inv@146@01 n@145@01) n@145@01) (img@147@01 n@145@01)))
  :pattern ((Set_in n@145@01 g@61@01))
  :pattern ((inv@146@01 n@145@01))
  :pattern ((img@147@01 n@145@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@147@01 r) (Set_in (inv@146@01 r) g@61@01)) (= (inv@146@01 r) r))
  :pattern ((inv@146@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>)))
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r)))
    (=>
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r))
      (Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@150@01  $FVF<next>))))
  :qid |qp.fvfDomDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@146@01 r) g@61@01) (img@147@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@150@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@150@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@155@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@155@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef80|)))
(assert (forall ((n@152@01 $Ref)) (!
  (=>
    (Set_in n@152@01 g@61@01)
    (and (= (inv@153@01 n@152@01) n@152@01) (img@154@01 n@152@01)))
  :pattern ((Set_in n@152@01 g@61@01))
  :pattern ((inv@153@01 n@152@01))
  :pattern ((img@154@01 n@152@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@154@01 r) (Set_in (inv@153@01 r) g@61@01)) (= (inv@153@01 r) r))
  :pattern ((inv@153@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>)))
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r)))
    (=>
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r))
      (Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@157@01  $FVF<next>))))
  :qid |qp.fvfDomDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@153@01 r) g@61@01) (img@154@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@157@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@157@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@157@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@146@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@148@01  $FVF<next>) r) r))
  :pattern ((inv@146@01 r))
  :qid |quant-u-93|)))
(assert (forall ((n$0@151@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@151@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) n$0@151@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@150@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@153@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@155@01  $FVF<next>) r) r))
  :pattern ((inv@153@01 r))
  :qid |quant-u-98|)))
(assert (forall ((n$0@158@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@158@01 g@61@01)
      (not
        (=
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01)
          $Ref.null)))
    (Set_in ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) n$0@158@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@157@01  $FVF<next>))
    $Snap.unit)) g@61@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@143@01 $Ref) (y@144@01 $Ref)) (!
  (and
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@150@01  $FVF<next>))
        $Snap.unit)) g@61@01)
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@157@01  $FVF<next>))
        $Snap.unit)) g@61@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@150@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@143@01 y@144@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@157@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@143@01 y@144@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@51@16@51@80_precondition|)))
(push) ; 5
(assert (not (forall ((x@143@01 $Ref) (y@144@01 $Ref)) (!
  (=>
    (and
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@150@01  $FVF<next>))
          $Snap.unit)) g@61@01)
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@157@01  $FVF<next>))
          $Snap.unit)) g@61@01))
    (=
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@150@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@143@01 y@144@01)
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@157@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@143@01 y@144@01)))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@150@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@143@01 y@144@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@157@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@143@01 y@144@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@51@16@51@80|))))
(check-sat)
; unknown
(pop) ; 5
; 0,20s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@159@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@159@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@159@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@159@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef85|)))
(declare-const pm@160@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@160@01  $FPM) r)
    (ite (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@160@01  $FPM) r))
  :qid |qp.resPrmSumDef86|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@159@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r))
  :pattern (($FVF.perm_next (as pm@160@01  $FPM) r))
  :qid |qp.resTrgDef87|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@159@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), x, y) } foo(hfun(g), x, y) == foo(old(hfun(g)), x, y))
(declare-const x@161@01 $Ref)
(declare-const y@162@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] foo(hfun(g), x, y) == foo(old(hfun(g)), x, y)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 6
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@163@01 $Ref)
(push) ; 7
; [eval] (n in g)
(assert (Set_in n@163@01 g@61@01))
(pop) ; 7
(declare-fun inv@164@01 ($Ref) $Ref)
(declare-fun img@165@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@163@01 $Ref) (n2@163@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@163@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@159@01  $FVF<next>) n1@163@01) n1@163@01))
      (and
        (Set_in n2@163@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@159@01  $FVF<next>) n2@163@01) n2@163@01))
      (= n1@163@01 n2@163@01))
    (= n1@163@01 n2@163@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@163@01 $Ref)) (!
  (=>
    (Set_in n@163@01 g@61@01)
    (and (= (inv@164@01 n@163@01) n@163@01) (img@165@01 n@163@01)))
  :pattern ((Set_in n@163@01 g@61@01))
  :pattern ((inv@164@01 n@163@01))
  :pattern ((img@165@01 n@163@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@165@01 r) (Set_in (inv@164@01 r) g@61@01)) (= (inv@164@01 r) r))
  :pattern ((inv@164@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@164@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@159@01  $FVF<next>) r) r))
  :pattern ((inv@164@01 r))
  :qid |quant-u-103|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@166@01 ((r $Ref) (x@161@01 $Ref) (y@162@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r) (= r (inv@164@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@166@01 r x@161@01 y@162@01))
    $Perm.No)
  
  :qid |quant-u-105|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r) (= r (inv@164@01 r)))
    (= (- $Perm.Write (pTaken@166@01 r x@161@01 y@162@01)) $Perm.No))
  
  :qid |quant-u-106|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@167@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>)))
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r)))
    (=>
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r))
      (Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>))))
  :qid |qp.fvfDomDef90|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@168@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 8
; [then-branch: 45 | !(n$0@168@01 in g@61@01) | live]
; [else-branch: 45 | n$0@168@01 in g@61@01 | live]
(push) ; 9
; [then-branch: 45 | !(n$0@168@01 in g@61@01)]
(assert (not (Set_in n$0@168@01 g@61@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@169@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@169@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@169@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 45 | n$0@168@01 in g@61@01]
(assert (Set_in n$0@168@01 g@61@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@170@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef94|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
    :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
    :qid |qp.fvfValDef93|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef94|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) n$0@168@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@80@01 n$0@168@01) (Set_in (inv@79@01 n$0@168@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@169@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (=>
  (not (Set_in n$0@168@01 g@61@01))
  (and
    (not (Set_in n$0@168@01 g@61@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@169@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (=>
  (Set_in n$0@168@01 g@61@01)
  (and
    (Set_in n$0@168@01 g@61@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) n$0@168@01))))
(assert (or (Set_in n$0@168@01 g@61@01) (not (Set_in n$0@168@01 g@61@01))))
(push) ; 8
; [then-branch: 46 | n$0@168@01 in g@61@01 && Lookup(next, sm@170@01, n$0@168@01) != Null | live]
; [else-branch: 46 | !(n$0@168@01 in g@61@01 && Lookup(next, sm@170@01, n$0@168@01) != Null) | live]
(push) ; 9
; [then-branch: 46 | n$0@168@01 in g@61@01 && Lookup(next, sm@170@01, n$0@168@01) != Null]
(assert (and
  (Set_in n$0@168@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
    :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
    :qid |qp.fvfValDef93|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef94|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) n$0@168@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@80@01 n$0@168@01) (Set_in (inv@79@01 n$0@168@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 46 | !(n$0@168@01 in g@61@01 && Lookup(next, sm@170@01, n$0@168@01) != Null)]
(assert (not
  (and
    (Set_in n$0@168@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef94|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (=>
  (and
    (Set_in n$0@168@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null)))
  (and
    (Set_in n$0@168@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) n$0@168@01))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in n$0@168@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in n$0@168@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@160@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@170@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in n$0@168@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null))))
  (and
    (Set_in n$0@168@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@169@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef94|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((n$0@168@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@168@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@168@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@168@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@167@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@163@01 $Ref)) (!
  (=>
    (Set_in n@163@01 g@61@01)
    (and (= (inv@164@01 n@163@01) n@163@01) (img@165@01 n@163@01)))
  :pattern ((Set_in n@163@01 g@61@01))
  :pattern ((inv@164@01 n@163@01))
  :pattern ((img@165@01 n@163@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@165@01 r) (Set_in (inv@164@01 r) g@61@01)) (= (inv@164@01 r) r))
  :pattern ((inv@164@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>)))
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r)))
    (=>
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r))
      (Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>))))
  :qid |qp.fvfDomDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@169@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@164@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@159@01  $FVF<next>) r) r))
    :pattern ((inv@164@01 r))
    :qid |quant-u-103|))
  (forall ((n$0@168@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@168@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null)))
      (Set_in ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@167@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
; [eval] foo(old(hfun(g)), x, y)
; [eval] old(hfun(g))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@171@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@171@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@171@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@171@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
(declare-const pm@172@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@172@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@172@01  $FPM) r))
  :qid |qp.resPrmSumDef97|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r))
  :pattern (($FVF.perm_next (as pm@172@01  $FPM) r))
  :qid |qp.resTrgDef98|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] hfun(g)
(set-option :timeout 0)
(push) ; 6
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@173@01 $Ref)
(push) ; 7
; [eval] (n in g)
(assert (Set_in n@173@01 g@61@01))
(pop) ; 7
(declare-fun inv@174@01 ($Ref) $Ref)
(declare-fun img@175@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@173@01 $Ref) (n2@173@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@173@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) n1@173@01) n1@173@01))
      (and
        (Set_in n2@173@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) n2@173@01) n2@173@01))
      (= n1@173@01 n2@173@01))
    (= n1@173@01 n2@173@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@173@01 $Ref)) (!
  (=>
    (Set_in n@173@01 g@61@01)
    (and (= (inv@174@01 n@173@01) n@173@01) (img@175@01 n@173@01)))
  :pattern ((Set_in n@173@01 g@61@01))
  :pattern ((inv@174@01 n@173@01))
  :pattern ((img@175@01 n@173@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@175@01 r) (Set_in (inv@174@01 r) g@61@01)) (= (inv@174@01 r) r))
  :pattern ((inv@174@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@174@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) r) r))
  :pattern ((inv@174@01 r))
  :qid |quant-u-108|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@176@01 ((r $Ref) (x@161@01 $Ref) (y@162@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r) (= r (inv@174@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@176@01 r x@161@01 y@162@01))
    $Perm.No)
  
  :qid |quant-u-110|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r) (= r (inv@174@01 r)))
    (= (- $Perm.Write (pTaken@176@01 r x@161@01 y@162@01)) $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@177@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>)))
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r)))
    (=>
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r))
      (Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>))))
  :qid |qp.fvfDomDef101|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@177@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef100|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@178@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 8
; [then-branch: 47 | !(n$0@178@01 in g@61@01) | live]
; [else-branch: 47 | n$0@178@01 in g@61@01 | live]
(push) ; 9
; [then-branch: 47 | !(n$0@178@01 in g@61@01)]
(assert (not (Set_in n$0@178@01 g@61@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@179@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@179@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@179@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 47 | n$0@178@01 in g@61@01]
(assert (Set_in n$0@178@01 g@61@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@180@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef105|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef104|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef105|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) n$0@178@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@66@01 n$0@178@01) (Set_in (inv@65@01 n$0@178@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@179@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (=>
  (not (Set_in n$0@178@01 g@61@01))
  (and
    (not (Set_in n$0@178@01 g@61@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@179@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef105|)))
(assert (=>
  (Set_in n$0@178@01 g@61@01)
  (and
    (Set_in n$0@178@01 g@61@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) n$0@178@01))))
(assert (or (Set_in n$0@178@01 g@61@01) (not (Set_in n$0@178@01 g@61@01))))
(push) ; 8
; [then-branch: 48 | n$0@178@01 in g@61@01 && Lookup(next, sm@180@01, n$0@178@01) != Null | live]
; [else-branch: 48 | !(n$0@178@01 in g@61@01 && Lookup(next, sm@180@01, n$0@178@01) != Null) | live]
(push) ; 9
; [then-branch: 48 | n$0@178@01 in g@61@01 && Lookup(next, sm@180@01, n$0@178@01) != Null]
(assert (and
  (Set_in n$0@178@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef104|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef105|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) n$0@178@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@66@01 n$0@178@01) (Set_in (inv@65@01 n$0@178@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 48 | !(n$0@178@01 in g@61@01 && Lookup(next, sm@180@01, n$0@178@01) != Null)]
(assert (not
  (and
    (Set_in n$0@178@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef105|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef105|)))
(assert (=>
  (and
    (Set_in n$0@178@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null)))
  (and
    (Set_in n$0@178@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) n$0@178@01))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in n$0@178@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in n$0@178@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@180@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in n$0@178@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null))))
  (and
    (Set_in n$0@178@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@179@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef105|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((n$0@178@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@178@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@178@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@178@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@177@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@173@01 $Ref)) (!
  (=>
    (Set_in n@173@01 g@61@01)
    (and (= (inv@174@01 n@173@01) n@173@01) (img@175@01 n@173@01)))
  :pattern ((Set_in n@173@01 g@61@01))
  :pattern ((inv@174@01 n@173@01))
  :pattern ((img@175@01 n@173@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@175@01 r) (Set_in (inv@174@01 r) g@61@01)) (= (inv@174@01 r) r))
  :pattern ((inv@174@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>)))
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r)))
    (=>
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r))
      (Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>))))
  :qid |qp.fvfDomDef101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@177@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@179@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef105|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@174@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) r) r))
    :pattern ((inv@174@01 r))
    :qid |quant-u-108|))
  (forall ((n$0@178@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@178@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null)))
      (Set_in ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@177@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@163@01 $Ref)) (!
  (=>
    (Set_in n@163@01 g@61@01)
    (and (= (inv@164@01 n@163@01) n@163@01) (img@165@01 n@163@01)))
  :pattern ((Set_in n@163@01 g@61@01))
  :pattern ((inv@164@01 n@163@01))
  :pattern ((img@165@01 n@163@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@165@01 r) (Set_in (inv@164@01 r) g@61@01)) (= (inv@164@01 r) r))
  :pattern ((inv@164@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>)))
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r)))
    (=>
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r))
      (Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@167@01  $FVF<next>))))
  :qid |qp.fvfDomDef90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@164@01 r) g@61@01) (img@165@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@167@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@167@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@169@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@169@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@170@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@170@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@171@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@171@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef95|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@171@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef96|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@172@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@172@01  $FPM) r))
  :qid |qp.resPrmSumDef97|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r))
  :pattern (($FVF.perm_next (as pm@172@01  $FPM) r))
  :qid |qp.resTrgDef98|)))
(assert (forall ((n@173@01 $Ref)) (!
  (=>
    (Set_in n@173@01 g@61@01)
    (and (= (inv@174@01 n@173@01) n@173@01) (img@175@01 n@173@01)))
  :pattern ((Set_in n@173@01 g@61@01))
  :pattern ((inv@174@01 n@173@01))
  :pattern ((img@175@01 n@173@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@175@01 r) (Set_in (inv@174@01 r) g@61@01)) (= (inv@174@01 r) r))
  :pattern ((inv@174@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>)))
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r)))
    (=>
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r))
      (Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@177@01  $FVF<next>))))
  :qid |qp.fvfDomDef101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@174@01 r) g@61@01) (img@175@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@177@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@177@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@179@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@179@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef103|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@180@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@180@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@164@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@159@01  $FVF<next>) r) r))
  :pattern ((inv@164@01 r))
  :qid |quant-u-103|)))
(assert (forall ((n$0@168@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@168@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@170@01  $FVF<next>) n$0@168@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@167@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@172@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@174@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@171@01  $FVF<next>) r) r))
  :pattern ((inv@174@01 r))
  :qid |quant-u-108|)))
(assert (forall ((n$0@178@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@178@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@180@01  $FVF<next>) n$0@178@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@177@01  $FVF<next>))
    $Snap.unit)) g@61@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@161@01 $Ref) (y@162@01 $Ref)) (!
  (and
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@167@01  $FVF<next>))
        $Snap.unit)) g@61@01)
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@177@01  $FVF<next>))
        $Snap.unit)) g@61@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@167@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@161@01 y@162@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@177@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@161@01 y@162@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@51@16@51@80_precondition|)))
(push) ; 5
(assert (not (forall ((x@161@01 $Ref) (y@162@01 $Ref)) (!
  (=>
    (and
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@167@01  $FVF<next>))
          $Snap.unit)) g@61@01)
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@177@01  $FVF<next>))
          $Snap.unit)) g@61@01))
    (=
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@167@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@161@01 y@162@01)
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@177@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@161@01 y@162@01)))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@167@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@161@01 y@162@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@177@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@161@01 y@162@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@51@16@51@80|))))
(check-sat)
; unknown
(pop) ; 5
; 0,32s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@181@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@181@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@181@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@181@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef107|)))
(declare-const pm@182@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@182@01  $FPM) r)
    (ite (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@182@01  $FPM) r))
  :qid |qp.resPrmSumDef108|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r))
  :pattern (($FVF.perm_next (as pm@182@01  $FPM) r))
  :qid |qp.resTrgDef109|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), x, y) } foo(hfun(g), x, y) == foo(old(hfun(g)), x, y))
(declare-const x@183@01 $Ref)
(declare-const y@184@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] foo(hfun(g), x, y) == foo(old(hfun(g)), x, y)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 6
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@185@01 $Ref)
(push) ; 7
; [eval] (n in g)
(assert (Set_in n@185@01 g@61@01))
(pop) ; 7
(declare-fun inv@186@01 ($Ref) $Ref)
(declare-fun img@187@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@185@01 $Ref) (n2@185@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@185@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) n1@185@01) n1@185@01))
      (and
        (Set_in n2@185@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) n2@185@01) n2@185@01))
      (= n1@185@01 n2@185@01))
    (= n1@185@01 n2@185@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@185@01 $Ref)) (!
  (=>
    (Set_in n@185@01 g@61@01)
    (and (= (inv@186@01 n@185@01) n@185@01) (img@187@01 n@185@01)))
  :pattern ((Set_in n@185@01 g@61@01))
  :pattern ((inv@186@01 n@185@01))
  :pattern ((img@187@01 n@185@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@187@01 r) (Set_in (inv@186@01 r) g@61@01)) (= (inv@186@01 r) r))
  :pattern ((inv@186@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@186@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) r) r))
  :pattern ((inv@186@01 r))
  :qid |quant-u-113|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@188@01 ((r $Ref) (x@183@01 $Ref) (y@184@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r) (= r (inv@186@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@188@01 r x@183@01 y@184@01))
    $Perm.No)
  
  :qid |quant-u-115|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r) (= r (inv@186@01 r)))
    (= (- $Perm.Write (pTaken@188@01 r x@183@01 y@184@01)) $Perm.No))
  
  :qid |quant-u-116|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@189@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>)))
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r)))
    (=>
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r))
      (Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>))))
  :qid |qp.fvfDomDef112|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@189@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@189@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@189@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef111|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@190@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 8
; [then-branch: 49 | !(n$0@190@01 in g@61@01) | live]
; [else-branch: 49 | n$0@190@01 in g@61@01 | live]
(push) ; 9
; [then-branch: 49 | !(n$0@190@01 in g@61@01)]
(assert (not (Set_in n$0@190@01 g@61@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@191@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@191@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef114|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@191@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 49 | n$0@190@01 in g@61@01]
(assert (Set_in n$0@190@01 g@61@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@192@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef116|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
    :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
    :qid |qp.fvfValDef115|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef116|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) n$0@190@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@80@01 n$0@190@01) (Set_in (inv@79@01 n$0@190@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@191@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef114|)))
(assert (=>
  (not (Set_in n$0@190@01 g@61@01))
  (and
    (not (Set_in n$0@190@01 g@61@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@191@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef116|)))
(assert (=>
  (Set_in n$0@190@01 g@61@01)
  (and
    (Set_in n$0@190@01 g@61@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) n$0@190@01))))
(assert (or (Set_in n$0@190@01 g@61@01) (not (Set_in n$0@190@01 g@61@01))))
(push) ; 8
; [then-branch: 50 | n$0@190@01 in g@61@01 && Lookup(next, sm@192@01, n$0@190@01) != Null | live]
; [else-branch: 50 | !(n$0@190@01 in g@61@01 && Lookup(next, sm@192@01, n$0@190@01) != Null) | live]
(push) ; 9
; [then-branch: 50 | n$0@190@01 in g@61@01 && Lookup(next, sm@192@01, n$0@190@01) != Null]
(assert (and
  (Set_in n$0@190@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
    :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
    :qid |qp.fvfValDef115|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef116|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) n$0@190@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@80@01 n$0@190@01) (Set_in (inv@79@01 n$0@190@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 50 | !(n$0@190@01 in g@61@01 && Lookup(next, sm@192@01, n$0@190@01) != Null)]
(assert (not
  (and
    (Set_in n$0@190@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef116|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef116|)))
(assert (=>
  (and
    (Set_in n$0@190@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null)))
  (and
    (Set_in n$0@190@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) n$0@190@01))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in n$0@190@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in n$0@190@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@192@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in n$0@190@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null))))
  (and
    (Set_in n$0@190@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@191@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef114|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef116|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((n$0@190@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@190@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@190@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@190@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@189@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@185@01 $Ref)) (!
  (=>
    (Set_in n@185@01 g@61@01)
    (and (= (inv@186@01 n@185@01) n@185@01) (img@187@01 n@185@01)))
  :pattern ((Set_in n@185@01 g@61@01))
  :pattern ((inv@186@01 n@185@01))
  :pattern ((img@187@01 n@185@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@187@01 r) (Set_in (inv@186@01 r) g@61@01)) (= (inv@186@01 r) r))
  :pattern ((inv@186@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>)))
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r)))
    (=>
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r))
      (Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>))))
  :qid |qp.fvfDomDef112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@189@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@189@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@189@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef111|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@191@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef114|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef116|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@186@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) r) r))
    :pattern ((inv@186@01 r))
    :qid |quant-u-113|))
  (forall ((n$0@190@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@190@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null)))
      (Set_in ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@189@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
; [eval] foo(old(hfun(g)), x, y)
; [eval] old(hfun(g))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@193@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@193@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@193@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@193@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef118|)))
(declare-const pm@194@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@194@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@194@01  $FPM) r))
  :qid |qp.resPrmSumDef119|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r))
  :pattern (($FVF.perm_next (as pm@194@01  $FPM) r))
  :qid |qp.resTrgDef120|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] hfun(g)
(set-option :timeout 0)
(push) ; 6
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@195@01 $Ref)
(push) ; 7
; [eval] (n in g)
(assert (Set_in n@195@01 g@61@01))
(pop) ; 7
(declare-fun inv@196@01 ($Ref) $Ref)
(declare-fun img@197@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@195@01 $Ref) (n2@195@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@195@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) n1@195@01) n1@195@01))
      (and
        (Set_in n2@195@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) n2@195@01) n2@195@01))
      (= n1@195@01 n2@195@01))
    (= n1@195@01 n2@195@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@195@01 $Ref)) (!
  (=>
    (Set_in n@195@01 g@61@01)
    (and (= (inv@196@01 n@195@01) n@195@01) (img@197@01 n@195@01)))
  :pattern ((Set_in n@195@01 g@61@01))
  :pattern ((inv@196@01 n@195@01))
  :pattern ((img@197@01 n@195@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@197@01 r) (Set_in (inv@196@01 r) g@61@01)) (= (inv@196@01 r) r))
  :pattern ((inv@196@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@196@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) r) r))
  :pattern ((inv@196@01 r))
  :qid |quant-u-118|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@198@01 ((r $Ref) (x@183@01 $Ref) (y@184@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r) (= r (inv@196@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@198@01 r x@183@01 y@184@01))
    $Perm.No)
  
  :qid |quant-u-120|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r) (= r (inv@196@01 r)))
    (= (- $Perm.Write (pTaken@198@01 r x@183@01 y@184@01)) $Perm.No))
  
  :qid |quant-u-121|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@199@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>)))
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r)))
    (=>
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r))
      (Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>))))
  :qid |qp.fvfDomDef123|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@199@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@199@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@199@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef122|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@200@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 8
; [then-branch: 51 | !(n$0@200@01 in g@61@01) | live]
; [else-branch: 51 | n$0@200@01 in g@61@01 | live]
(push) ; 9
; [then-branch: 51 | !(n$0@200@01 in g@61@01)]
(assert (not (Set_in n$0@200@01 g@61@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@201@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@201@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@201@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 51 | n$0@200@01 in g@61@01]
(assert (Set_in n$0@200@01 g@61@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@202@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef127|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef126|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef127|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) n$0@200@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@66@01 n$0@200@01) (Set_in (inv@65@01 n$0@200@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@201@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (=>
  (not (Set_in n$0@200@01 g@61@01))
  (and
    (not (Set_in n$0@200@01 g@61@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@201@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef127|)))
(assert (=>
  (Set_in n$0@200@01 g@61@01)
  (and
    (Set_in n$0@200@01 g@61@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) n$0@200@01))))
(assert (or (Set_in n$0@200@01 g@61@01) (not (Set_in n$0@200@01 g@61@01))))
(push) ; 8
; [then-branch: 52 | n$0@200@01 in g@61@01 && Lookup(next, sm@202@01, n$0@200@01) != Null | live]
; [else-branch: 52 | !(n$0@200@01 in g@61@01 && Lookup(next, sm@202@01, n$0@200@01) != Null) | live]
(push) ; 9
; [then-branch: 52 | n$0@200@01 in g@61@01 && Lookup(next, sm@202@01, n$0@200@01) != Null]
(assert (and
  (Set_in n$0@200@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef126|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef127|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) n$0@200@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@66@01 n$0@200@01) (Set_in (inv@65@01 n$0@200@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 52 | !(n$0@200@01 in g@61@01 && Lookup(next, sm@202@01, n$0@200@01) != Null)]
(assert (not
  (and
    (Set_in n$0@200@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef127|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef127|)))
(assert (=>
  (and
    (Set_in n$0@200@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null)))
  (and
    (Set_in n$0@200@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) n$0@200@01))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in n$0@200@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in n$0@200@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@202@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in n$0@200@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null))))
  (and
    (Set_in n$0@200@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@201@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef127|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((n$0@200@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@200@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@200@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@200@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@199@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@195@01 $Ref)) (!
  (=>
    (Set_in n@195@01 g@61@01)
    (and (= (inv@196@01 n@195@01) n@195@01) (img@197@01 n@195@01)))
  :pattern ((Set_in n@195@01 g@61@01))
  :pattern ((inv@196@01 n@195@01))
  :pattern ((img@197@01 n@195@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@197@01 r) (Set_in (inv@196@01 r) g@61@01)) (= (inv@196@01 r) r))
  :pattern ((inv@196@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>)))
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r)))
    (=>
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r))
      (Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>))))
  :qid |qp.fvfDomDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@199@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@199@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@199@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef122|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@201@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef127|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@196@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) r) r))
    :pattern ((inv@196@01 r))
    :qid |quant-u-118|))
  (forall ((n$0@200@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@200@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null)))
      (Set_in ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@199@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@185@01 $Ref)) (!
  (=>
    (Set_in n@185@01 g@61@01)
    (and (= (inv@186@01 n@185@01) n@185@01) (img@187@01 n@185@01)))
  :pattern ((Set_in n@185@01 g@61@01))
  :pattern ((inv@186@01 n@185@01))
  :pattern ((img@187@01 n@185@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@187@01 r) (Set_in (inv@186@01 r) g@61@01)) (= (inv@186@01 r) r))
  :pattern ((inv@186@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>)))
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r)))
    (=>
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r))
      (Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@189@01  $FVF<next>))))
  :qid |qp.fvfDomDef112|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@186@01 r) g@61@01) (img@187@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@189@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@189@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@189@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef111|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@191@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@191@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef114|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@192@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef115|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@192@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@193@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@193@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@193@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef118|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@194@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@194@01  $FPM) r))
  :qid |qp.resPrmSumDef119|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r))
  :pattern (($FVF.perm_next (as pm@194@01  $FPM) r))
  :qid |qp.resTrgDef120|)))
(assert (forall ((n@195@01 $Ref)) (!
  (=>
    (Set_in n@195@01 g@61@01)
    (and (= (inv@196@01 n@195@01) n@195@01) (img@197@01 n@195@01)))
  :pattern ((Set_in n@195@01 g@61@01))
  :pattern ((inv@196@01 n@195@01))
  :pattern ((img@197@01 n@195@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@197@01 r) (Set_in (inv@196@01 r) g@61@01)) (= (inv@196@01 r) r))
  :pattern ((inv@196@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>)))
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r)))
    (=>
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r))
      (Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@199@01  $FVF<next>))))
  :qid |qp.fvfDomDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@196@01 r) g@61@01) (img@197@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@199@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@199@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@199@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef122|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@201@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@201@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@202@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef126|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@202@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@186@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) r) r))
  :pattern ((inv@186@01 r))
  :qid |quant-u-113|)))
(assert (forall ((n$0@190@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@190@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@192@01  $FVF<next>) n$0@190@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@189@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@194@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@196@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@193@01  $FVF<next>) r) r))
  :pattern ((inv@196@01 r))
  :qid |quant-u-118|)))
(assert (forall ((n$0@200@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@200@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@202@01  $FVF<next>) n$0@200@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@199@01  $FVF<next>))
    $Snap.unit)) g@61@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@183@01 $Ref) (y@184@01 $Ref)) (!
  (and
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@189@01  $FVF<next>))
        $Snap.unit)) g@61@01)
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@199@01  $FVF<next>))
        $Snap.unit)) g@61@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@189@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@183@01 y@184@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@199@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@183@01 y@184@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@51@16@51@80_precondition|)))
(push) ; 5
(assert (not (forall ((x@183@01 $Ref) (y@184@01 $Ref)) (!
  (=>
    (and
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@189@01  $FVF<next>))
          $Snap.unit)) g@61@01)
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@199@01  $FVF<next>))
          $Snap.unit)) g@61@01))
    (=
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@189@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@183@01 y@184@01)
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@199@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@183@01 y@184@01)))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@189@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@183@01 y@184@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@199@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@183@01 y@184@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@51@16@51@80|))))
(check-sat)
; unknown
(pop) ; 5
; 0,44s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field next
; [eval] (forall x: Ref, y: Ref :: { foo(hfun(g), x, y) } { foo(old(hfun(g)), x, y) } foo(hfun(g), x, y) == foo(old(hfun(g)), x, y))
(declare-const x@203@01 $Ref)
(declare-const y@204@01 $Ref)
(set-option :timeout 0)
(push) ; 5
; [eval] foo(hfun(g), x, y) == foo(old(hfun(g)), x, y)
; [eval] foo(hfun(g), x, y)
; [eval] hfun(g)
(push) ; 6
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@205@01 $Ref)
(push) ; 7
; [eval] (n in g)
(assert (Set_in n@205@01 g@61@01))
(pop) ; 7
(declare-fun inv@206@01 ($Ref) $Ref)
(declare-fun img@207@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@205@01 $Ref) (n2@205@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@205@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) n1@205@01) n1@205@01))
      (and
        (Set_in n2@205@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) n2@205@01) n2@205@01))
      (= n1@205@01 n2@205@01))
    (= n1@205@01 n2@205@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@205@01 $Ref)) (!
  (=>
    (Set_in n@205@01 g@61@01)
    (and (= (inv@206@01 n@205@01) n@205@01) (img@207@01 n@205@01)))
  :pattern ((Set_in n@205@01 g@61@01))
  :pattern ((inv@206@01 n@205@01))
  :pattern ((img@207@01 n@205@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@207@01 r) (Set_in (inv@206@01 r) g@61@01)) (= (inv@206@01 r) r))
  :pattern ((inv@206@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@206@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) r) r))
  :pattern ((inv@206@01 r))
  :qid |quant-u-123|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@208@01 ((r $Ref) (x@203@01 $Ref) (y@204@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r) (= r (inv@206@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@208@01 r x@203@01 y@204@01))
    $Perm.No)
  
  :qid |quant-u-125|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r) (= r (inv@206@01 r)))
    (= (- $Perm.Write (pTaken@208@01 r x@203@01 y@204@01)) $Perm.No))
  
  :qid |quant-u-126|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@209@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>)))
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r)))
    (=>
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r))
      (Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>))))
  :qid |qp.fvfDomDef130|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@209@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@209@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@209@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@210@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 8
; [then-branch: 53 | !(n$0@210@01 in g@61@01) | live]
; [else-branch: 53 | n$0@210@01 in g@61@01 | live]
(push) ; 9
; [then-branch: 53 | !(n$0@210@01 in g@61@01)]
(assert (not (Set_in n$0@210@01 g@61@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@211@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@211@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef132|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@211@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 53 | n$0@210@01 in g@61@01]
(assert (Set_in n$0@210@01 g@61@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@212@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
    :qid |qp.fvfValDef133|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef134|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) n$0@210@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@80@01 n$0@210@01) (Set_in (inv@79@01 n$0@210@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@211@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef132|)))
(assert (=>
  (not (Set_in n$0@210@01 g@61@01))
  (and
    (not (Set_in n$0@210@01 g@61@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@211@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
(assert (=>
  (Set_in n$0@210@01 g@61@01)
  (and
    (Set_in n$0@210@01 g@61@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) n$0@210@01))))
(assert (or (Set_in n$0@210@01 g@61@01) (not (Set_in n$0@210@01 g@61@01))))
(push) ; 8
; [then-branch: 54 | n$0@210@01 in g@61@01 && Lookup(next, sm@212@01, n$0@210@01) != Null | live]
; [else-branch: 54 | !(n$0@210@01 in g@61@01 && Lookup(next, sm@212@01, n$0@210@01) != Null) | live]
(push) ; 9
; [then-branch: 54 | n$0@210@01 in g@61@01 && Lookup(next, sm@212@01, n$0@210@01) != Null]
(assert (and
  (Set_in n$0@210@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
    :qid |qp.fvfValDef133|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef134|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) n$0@210@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@80@01 n$0@210@01) (Set_in (inv@79@01 n$0@210@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 54 | !(n$0@210@01 in g@61@01 && Lookup(next, sm@212@01, n$0@210@01) != Null)]
(assert (not
  (and
    (Set_in n$0@210@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
(assert (=>
  (and
    (Set_in n$0@210@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null)))
  (and
    (Set_in n$0@210@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) n$0@210@01))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in n$0@210@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in n$0@210@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@182@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@212@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in n$0@210@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null))))
  (and
    (Set_in n$0@210@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@211@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((n$0@210@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@210@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@210@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@210@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@209@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@205@01 $Ref)) (!
  (=>
    (Set_in n@205@01 g@61@01)
    (and (= (inv@206@01 n@205@01) n@205@01) (img@207@01 n@205@01)))
  :pattern ((Set_in n@205@01 g@61@01))
  :pattern ((inv@206@01 n@205@01))
  :pattern ((img@207@01 n@205@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@207@01 r) (Set_in (inv@206@01 r) g@61@01)) (= (inv@206@01 r) r))
  :pattern ((inv@206@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>)))
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r)))
    (=>
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r))
      (Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>))))
  :qid |qp.fvfDomDef130|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@209@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@209@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@209@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@211@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@206@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) r) r))
    :pattern ((inv@206@01 r))
    :qid |quant-u-123|))
  (forall ((n$0@210@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@210@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null)))
      (Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@209@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
; [eval] foo(old(hfun(g)), x, y)
; [eval] old(hfun(g))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@213@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@213@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@213@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@213@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef136|)))
(declare-const pm@214@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@214@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@214@01  $FPM) r))
  :qid |qp.resPrmSumDef137|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r))
  :pattern (($FVF.perm_next (as pm@214@01  $FPM) r))
  :qid |qp.resTrgDef138|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] hfun(g)
(set-option :timeout 0)
(push) ; 6
; [eval] !((null in g))
; [eval] (null in g)
(declare-const n@215@01 $Ref)
(push) ; 7
; [eval] (n in g)
(assert (Set_in n@215@01 g@61@01))
(pop) ; 7
(declare-fun inv@216@01 ($Ref) $Ref)
(declare-fun img@217@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((n1@215@01 $Ref) (n2@215@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in n1@215@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) n1@215@01) n1@215@01))
      (and
        (Set_in n2@215@01 g@61@01)
        ($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) n2@215@01) n2@215@01))
      (= n1@215@01 n2@215@01))
    (= n1@215@01 n2@215@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((n@215@01 $Ref)) (!
  (=>
    (Set_in n@215@01 g@61@01)
    (and (= (inv@216@01 n@215@01) n@215@01) (img@217@01 n@215@01)))
  :pattern ((Set_in n@215@01 g@61@01))
  :pattern ((inv@216@01 n@215@01))
  :pattern ((img@217@01 n@215@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@217@01 r) (Set_in (inv@216@01 r) g@61@01)) (= (inv@216@01 r) r))
  :pattern ((inv@216@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@216@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) r) r))
  :pattern ((inv@216@01 r))
  :qid |quant-u-128|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@218@01 ((r $Ref) (x@203@01 $Ref) (y@204@01 $Ref)) $Perm
  (ite
    (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r) (= r (inv@216@01 r)))
    ($Perm.min
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@218@01 r x@203@01 y@204@01))
    $Perm.No)
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r) (= r (inv@216@01 r)))
    (= (- $Perm.Write (pTaken@218@01 r x@203@01 y@204@01)) $Perm.No))
  
  :qid |quant-u-131|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@219@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>)))
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r)))
    (=>
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r))
      (Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>))))
  :qid |qp.fvfDomDef141|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@219@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@219@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef139|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@219@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef140|)))
; [eval] (forall n$0: Ref ::(n$0 in g) && n$0.next != null ==> (n$0.next in g))
(declare-const n$0@220@01 $Ref)
(set-option :timeout 0)
(push) ; 7
; [eval] (n$0 in g) && n$0.next != null ==> (n$0.next in g)
; [eval] (n$0 in g) && n$0.next != null
; [eval] (n$0 in g)
(push) ; 8
; [then-branch: 55 | !(n$0@220@01 in g@61@01) | live]
; [else-branch: 55 | n$0@220@01 in g@61@01 | live]
(push) ; 9
; [then-branch: 55 | !(n$0@220@01 in g@61@01)]
(assert (not (Set_in n$0@220@01 g@61@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@221@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@221@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef142|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef143|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@221@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 55 | n$0@220@01 in g@61@01]
(assert (Set_in n$0@220@01 g@61@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@222@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef144|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef145|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] n$0.next != null
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef144|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef145|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) n$0@220@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@66@01 n$0@220@01) (Set_in (inv@65@01 n$0@220@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@221@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef142|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef143|)))
(assert (=>
  (not (Set_in n$0@220@01 g@61@01))
  (and
    (not (Set_in n$0@220@01 g@61@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@221@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef144|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef145|)))
(assert (=>
  (Set_in n$0@220@01 g@61@01)
  (and
    (Set_in n$0@220@01 g@61@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) n$0@220@01))))
(assert (or (Set_in n$0@220@01 g@61@01) (not (Set_in n$0@220@01 g@61@01))))
(push) ; 8
; [then-branch: 56 | n$0@220@01 in g@61@01 && Lookup(next, sm@222@01, n$0@220@01) != Null | live]
; [else-branch: 56 | !(n$0@220@01 in g@61@01 && Lookup(next, sm@222@01, n$0@220@01) != Null) | live]
(push) ; 9
; [then-branch: 56 | n$0@220@01 in g@61@01 && Lookup(next, sm@222@01, n$0@220@01) != Null]
(assert (and
  (Set_in n$0@220@01 g@61@01)
  (not (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (n$0.next in g)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
      (=
        ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
    :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
    :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
    :qid |qp.fvfValDef144|))
  (forall ((r $Ref)) (!
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
    :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
    :qid |qp.fvfResTrgDef145|))))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) n$0@220@01))
(set-option :timeout 0)
(push) ; 10
(assert (not (and (img@66@01 n$0@220@01) (Set_in (inv@65@01 n$0@220@01) g@61@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 56 | !(n$0@220@01 in g@61@01 && Lookup(next, sm@222@01, n$0@220@01) != Null)]
(assert (not
  (and
    (Set_in n$0@220@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef144|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef145|)))
; Assume upper permission bound for field next
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef144|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef145|)))
(assert (=>
  (and
    (Set_in n$0@220@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null)))
  (and
    (Set_in n$0@220@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) n$0@220@01))))
; Joined path conditions
(assert (=>
  (not
    (and
      (Set_in n$0@220@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null))))
  (and
    (not
      (and
        (Set_in n$0@220@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@222@01  $FVF<next>) r) r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (Set_in n$0@220@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null))))
  (and
    (Set_in n$0@220@01 g@61@01)
    (not (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null)))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@221@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef142|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef143|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef144|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef145|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 7
(assert (not (forall ((n$0@220@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@220@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((n$0@220@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@220@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@219@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((n@215@01 $Ref)) (!
  (=>
    (Set_in n@215@01 g@61@01)
    (and (= (inv@216@01 n@215@01) n@215@01) (img@217@01 n@215@01)))
  :pattern ((Set_in n@215@01 g@61@01))
  :pattern ((inv@216@01 n@215@01))
  :pattern ((img@217@01 n@215@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@217@01 r) (Set_in (inv@216@01 r) g@61@01)) (= (inv@216@01 r) r))
  :pattern ((inv@216@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>)))
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r)))
    (=>
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r))
      (Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>))))
  :qid |qp.fvfDomDef141|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@219@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@219@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef139|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@219@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@221@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef142|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef143|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef144|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef145|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@216@01 r) g@61@01)
      ($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) r) r))
    :pattern ((inv@216@01 r))
    :qid |quant-u-128|))
  (forall ((n$0@220@01 $Ref)) (!
    (=>
      (and
        (Set_in n$0@220@01 g@61@01)
        (not
          (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null)))
      (Set_in ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) g@61@01))
    
    :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|))
  (hfun%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@219@01  $FVF<next>))
      $Snap.unit)) g@61@01)))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
(assert (forall ((n@205@01 $Ref)) (!
  (=>
    (Set_in n@205@01 g@61@01)
    (and (= (inv@206@01 n@205@01) n@205@01) (img@207@01 n@205@01)))
  :pattern ((Set_in n@205@01 g@61@01))
  :pattern ((inv@206@01 n@205@01))
  :pattern ((img@207@01 n@205@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@207@01 r) (Set_in (inv@206@01 r) g@61@01)) (= (inv@206@01 r) r))
  :pattern ((inv@206@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>)))
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r)))
    (=>
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r))
      (Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@209@01  $FVF<next>))))
  :qid |qp.fvfDomDef130|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@206@01 r) g@61@01) (img@207@01 r))
      (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@209@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@209@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@209@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@211@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@211@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@212@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r)))
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@76@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@212@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef134|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@213@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@213@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef135|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@213@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef136|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@214@01  $FPM) r)
    (ite (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_next (as pm@214@01  $FPM) r))
  :qid |qp.resPrmSumDef137|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r))
  :pattern (($FVF.perm_next (as pm@214@01  $FPM) r))
  :qid |qp.resTrgDef138|)))
(assert (forall ((n@215@01 $Ref)) (!
  (=>
    (Set_in n@215@01 g@61@01)
    (and (= (inv@216@01 n@215@01) n@215@01) (img@217@01 n@215@01)))
  :pattern ((Set_in n@215@01 g@61@01))
  :pattern ((inv@216@01 n@215@01))
  :pattern ((img@217@01 n@215@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@217@01 r) (Set_in (inv@216@01 r) g@61@01)) (= (inv@216@01 r) r))
  :pattern ((inv@216@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>)))
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r)))
    (=>
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r))
      (Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@219@01  $FVF<next>))))
  :qid |qp.fvfDomDef141|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@216@01 r) g@61@01) (img@217@01 r))
      (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01)))
    (=
      ($FVF.lookup_next (as sm@219@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@219@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef139|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@219@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@221@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef142|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@221@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef143|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@66@01 r) (Set_in (inv@65@01 r) g@61@01))
    (=
      ($FVF.lookup_next (as sm@222@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r)))
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r))
  :qid |qp.fvfValDef144|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second $t@62@01))) r) r)
  :pattern (($FVF.lookup_next (as sm@222@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef145|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@206@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@181@01  $FVF<next>) r) r))
  :pattern ((inv@206@01 r))
  :qid |quant-u-123|)))
(assert (forall ((n$0@210@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@210@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@212@01  $FVF<next>) n$0@210@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@209@01  $FVF<next>))
    $Snap.unit)) g@61@01))
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_next (as pm@214@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) r) r))
  :qid |qp-fld-prm-bnd|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@216@01 r) g@61@01)
    ($FVF.loc_next ($FVF.lookup_next (as sm@213@01  $FVF<next>) r) r))
  :pattern ((inv@216@01 r))
  :qid |quant-u-128|)))
(assert (forall ((n$0@220@01 $Ref)) (!
  (=>
    (and
      (Set_in n$0@220@01 g@61@01)
      (not
        (= ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) $Ref.null)))
    (Set_in ($FVF.lookup_next (as sm@222@01  $FVF<next>) n$0@220@01) g@61@01))
  
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@21@14@21@22|)))
(assert (hfun%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<next>To$Snap (as sm@219@01  $FVF<next>))
    $Snap.unit)) g@61@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@203@01 $Ref) (y@204@01 $Ref)) (!
  (and
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@209@01  $FVF<next>))
        $Snap.unit)) g@61@01)
    (hfun%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@219@01  $FVF<next>))
        $Snap.unit)) g@61@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@209@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@203@01 y@204@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@219@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@203@01 y@204@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@51@16@51@80_precondition|)))
(push) ; 5
(assert (not (forall ((x@203@01 $Ref) (y@204@01 $Ref)) (!
  (=>
    (and
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@209@01  $FVF<next>))
          $Snap.unit)) g@61@01)
      (hfun%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@219@01  $FVF<next>))
          $Snap.unit)) g@61@01))
    (=
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@209@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@203@01 y@204@01)
      (foo<Bool> (hfun ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@219@01  $FVF<next>))
          $Snap.unit)) g@61@01) x@203@01 y@204@01)))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@209@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@203@01 y@204@01))
  :pattern ((foo<Bool> (hfun ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<next>To$Snap (as sm@219@01  $FVF<next>))
      $Snap.unit)) g@61@01) x@203@01 y@204@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0210.vpr@51@16@51@80|))))
(check-sat)
; unknown
(pop) ; 5
; 0,54s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
