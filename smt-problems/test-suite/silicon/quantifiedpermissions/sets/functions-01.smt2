(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:23
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/functions.vpr
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
(declare-fun fun1 ($Snap Set<$Ref> $Ref) Int)
(declare-fun fun1%limited ($Snap Set<$Ref> $Ref) Int)
(declare-fun fun1%stateless (Set<$Ref> $Ref) Bool)
(declare-fun fun1%precondition ($Snap Set<$Ref> $Ref) Bool)
(declare-fun fun2 ($Snap Set<$Ref> $Ref $Ref) Int)
(declare-fun fun2%limited ($Snap Set<$Ref> $Ref $Ref) Int)
(declare-fun fun2%stateless (Set<$Ref> $Ref $Ref) Bool)
(declare-fun fun2%precondition ($Snap Set<$Ref> $Ref $Ref) Bool)
(declare-fun fun4 ($Snap $Ref $Ref $Ref) Int)
(declare-fun fun4%limited ($Snap $Ref $Ref $Ref) Int)
(declare-fun fun4%stateless ($Ref $Ref $Ref) Bool)
(declare-fun fun4%precondition ($Snap $Ref $Ref $Ref) Bool)
(declare-fun fun6 ($Snap $Ref $Ref $Ref) Int)
(declare-fun fun6%limited ($Snap $Ref $Ref $Ref) Int)
(declare-fun fun6%stateless ($Ref $Ref $Ref) Bool)
(declare-fun fun6%precondition ($Snap $Ref $Ref $Ref) Bool)
(declare-fun fun5 ($Snap $Ref $Ref $Ref) Int)
(declare-fun fun5%limited ($Snap $Ref $Ref $Ref) Int)
(declare-fun fun5%stateless ($Ref $Ref $Ref) Bool)
(declare-fun fun5%precondition ($Snap $Ref $Ref $Ref) Bool)
(declare-fun fun3 ($Snap $Ref $Ref $Ref) Int)
(declare-fun fun3%limited ($Snap $Ref $Ref $Ref) Int)
(declare-fun fun3%stateless ($Ref $Ref $Ref) Bool)
(declare-fun fun3%precondition ($Snap $Ref $Ref $Ref) Bool)
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
; ---------- FUNCTION fun1----------
(declare-fun xs@0@00 () Set<$Ref>)
(declare-fun x@1@00 () $Ref)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@1@00 xs@0@00))
(declare-const r@23@00 $Ref)
(push) ; 2
; [eval] (r in xs)
(assert (Set_in r@23@00 xs@0@00))
(pop) ; 2
(declare-fun inv@24@00 ($Snap Set<$Ref> $Ref $Ref) $Ref)
(declare-fun img@25@00 ($Snap Set<$Ref> $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@23@00 $Ref) (r2@23@00 $Ref)) (!
  (=>
    (and
      (Set_in r1@23@00 xs@0@00)
      (Set_in r2@23@00 xs@0@00)
      (= r1@23@00 r2@23@00))
    (= r1@23@00 r2@23@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@23@00 $Ref)) (!
  (=>
    (Set_in r@23@00 xs@0@00)
    (and
      (= (inv@24@00 s@$ xs@0@00 x@1@00 r@23@00) r@23@00)
      (img@25@00 s@$ xs@0@00 x@1@00 r@23@00)))
  :pattern ((Set_in r@23@00 xs@0@00))
  :pattern ((inv@24@00 s@$ xs@0@00 x@1@00 r@23@00))
  :pattern ((img@25@00 s@$ xs@0@00 x@1@00 r@23@00))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ xs@0@00 x@1@00 r)
      (Set_in (inv@24@00 s@$ xs@0@00 x@1@00 r) xs@0@00))
    (= (inv@24@00 s@$ xs@0@00 x@1@00 r) r))
  :pattern ((inv@24@00 s@$ xs@0@00 x@1@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@23@00 $Ref)) (!
  (=> (Set_in r@23@00 xs@0@00) (not (= r@23@00 $Ref.null)))
  :pattern ((Set_in r@23@00 xs@0@00))
  :pattern ((inv@24@00 s@$ xs@0@00 x@1@00 r@23@00))
  :pattern ((img@25@00 s@$ xs@0@00 x@1@00 r@23@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref)) (!
  (= (fun1%limited s@$ xs@0@00 x@1@00) (fun1 s@$ xs@0@00 x@1@00))
  :pattern ((fun1 s@$ xs@0@00 x@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref)) (!
  (fun1%stateless xs@0@00 x@1@00)
  :pattern ((fun1%limited s@$ xs@0@00 x@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ xs@0@00 x@1@00 r)
      (Set_in (inv@24@00 s@$ xs@0@00 x@1@00 r) xs@0@00))
    (= (inv@24@00 s@$ xs@0@00 x@1@00 r) r))
  :pattern ((inv@24@00 s@$ xs@0@00 x@1@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r@23@00 $Ref)) (!
  (=>
    (Set_in r@23@00 xs@0@00)
    (and
      (= (inv@24@00 s@$ xs@0@00 x@1@00 r@23@00) r@23@00)
      (img@25@00 s@$ xs@0@00 x@1@00 r@23@00)))
  :pattern ((Set_in r@23@00 xs@0@00))
  :pattern ((inv@24@00 s@$ xs@0@00 x@1@00 r@23@00))
  :pattern ((img@25@00 s@$ xs@0@00 x@1@00 r@23@00))
  :qid |quant-u-13|)))
(assert (forall ((r@23@00 $Ref)) (!
  (=> (Set_in r@23@00 xs@0@00) (not (= r@23@00 $Ref.null)))
  :pattern ((Set_in r@23@00 xs@0@00))
  :pattern ((inv@24@00 s@$ xs@0@00 x@1@00 r@23@00))
  :pattern ((img@25@00 s@$ xs@0@00 x@1@00 r@23@00))
  :qid |f-permImpliesNonNull|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (Set_in x@1@00 xs@0@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(assert (not (and
  (img@25@00 s@$ xs@0@00 x@1@00 x@1@00)
  (Set_in (inv@24@00 s@$ xs@0@00 x@1@00 x@1@00) xs@0@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@2@00
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) x@1@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref)) (!
  (and
    (forall ((r@23@00 $Ref)) (!
      (=>
        (Set_in r@23@00 xs@0@00)
        (and
          (= (inv@24@00 s@$ xs@0@00 x@1@00 r@23@00) r@23@00)
          (img@25@00 s@$ xs@0@00 x@1@00 r@23@00)))
      :pattern ((Set_in r@23@00 xs@0@00))
      :pattern ((inv@24@00 s@$ xs@0@00 x@1@00 r@23@00))
      :pattern ((img@25@00 s@$ xs@0@00 x@1@00 r@23@00))
      :qid |quant-u-13|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@25@00 s@$ xs@0@00 x@1@00 r)
          (Set_in (inv@24@00 s@$ xs@0@00 x@1@00 r) xs@0@00))
        (= (inv@24@00 s@$ xs@0@00 x@1@00 r) r))
      :pattern ((inv@24@00 s@$ xs@0@00 x@1@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun1%precondition s@$ xs@0@00 x@1@00)
      (=
        (fun1 s@$ xs@0@00 x@1@00)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) x@1@00))))
  :pattern ((fun1 s@$ xs@0@00 x@1@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref)) (!
  true
  :pattern ((fun1 s@$ xs@0@00 x@1@00))
  :qid |quant-u-15|)))
; ---------- FUNCTION fun2----------
(declare-fun xs@3@00 () Set<$Ref>)
(declare-fun x@4@00 () $Ref)
(declare-fun y@5@00 () $Ref)
(declare-fun result@6@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@4@00 xs@3@00))
(declare-const r@26@00 $Ref)
(push) ; 2
; [eval] (r in xs)
(assert (Set_in r@26@00 xs@3@00))
(pop) ; 2
(declare-fun inv@27@00 ($Snap Set<$Ref> $Ref $Ref $Ref) $Ref)
(declare-fun img@28@00 ($Snap Set<$Ref> $Ref $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@26@00 $Ref) (r2@26@00 $Ref)) (!
  (=>
    (and
      (Set_in r1@26@00 xs@3@00)
      (Set_in r2@26@00 xs@3@00)
      (= r1@26@00 r2@26@00))
    (= r1@26@00 r2@26@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@26@00 $Ref)) (!
  (=>
    (Set_in r@26@00 xs@3@00)
    (and
      (= (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00) r@26@00)
      (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00)))
  :pattern ((Set_in r@26@00 xs@3@00))
  :pattern ((inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
  :pattern ((img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r)
      (Set_in (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r) xs@3@00))
    (= (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r) r))
  :pattern ((inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@26@00 $Ref)) (!
  (=> (Set_in r@26@00 xs@3@00) (not (= r@26@00 $Ref.null)))
  :pattern ((Set_in r@26@00 xs@3@00))
  :pattern ((inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
  :pattern ((img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (x@4@00 $Ref) (y@5@00 $Ref)) (!
  (= (fun2%limited s@$ xs@3@00 x@4@00 y@5@00) (fun2 s@$ xs@3@00 x@4@00 y@5@00))
  :pattern ((fun2 s@$ xs@3@00 x@4@00 y@5@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (x@4@00 $Ref) (y@5@00 $Ref)) (!
  (fun2%stateless xs@3@00 x@4@00 y@5@00)
  :pattern ((fun2%limited s@$ xs@3@00 x@4@00 y@5@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r)
      (Set_in (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r) xs@3@00))
    (= (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r) r))
  :pattern ((inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r@26@00 $Ref)) (!
  (=>
    (Set_in r@26@00 xs@3@00)
    (and
      (= (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00) r@26@00)
      (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00)))
  :pattern ((Set_in r@26@00 xs@3@00))
  :pattern ((inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
  :pattern ((img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
  :qid |quant-u-17|)))
(assert (forall ((r@26@00 $Ref)) (!
  (=> (Set_in r@26@00 xs@3@00) (not (= r@26@00 $Ref.null)))
  :pattern ((Set_in r@26@00 xs@3@00))
  :pattern ((inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
  :pattern ((img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
  :qid |f-permImpliesNonNull|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (Set_in x@4@00 xs@3@00))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] x.f + ((y in xs) ? y.f : x.f)
(set-option :timeout 0)
(push) ; 2
(assert (not (and
  (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 x@4@00)
  (Set_in (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 x@4@00) xs@3@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] ((y in xs) ? y.f : x.f)
; [eval] (y in xs)
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (Set_in y@5@00 xs@3@00))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (Set_in y@5@00 xs@3@00)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 0 | y@5@00 in xs@3@00 | live]
; [else-branch: 0 | !(y@5@00 in xs@3@00) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | y@5@00 in xs@3@00]
(assert (Set_in y@5@00 xs@3@00))
(push) ; 4
(assert (not (and
  (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 y@5@00)
  (Set_in (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 y@5@00) xs@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(y@5@00 in xs@3@00)]
(assert (not (Set_in y@5@00 xs@3@00)))
(push) ; 4
(assert (not (and
  (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 x@4@00)
  (Set_in (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 x@4@00) xs@3@00))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in y@5@00 xs@3@00)) (Set_in y@5@00 xs@3@00)))
(assert (=
  result@6@00
  (+
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) x@4@00)
    (ite
      (Set_in y@5@00 xs@3@00)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) y@5@00)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) x@4@00)))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (x@4@00 $Ref) (y@5@00 $Ref)) (!
  (and
    (forall ((r@26@00 $Ref)) (!
      (=>
        (Set_in r@26@00 xs@3@00)
        (and
          (= (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00) r@26@00)
          (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00)))
      :pattern ((Set_in r@26@00 xs@3@00))
      :pattern ((inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
      :pattern ((img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r@26@00))
      :qid |quant-u-17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@28@00 s@$ xs@3@00 x@4@00 y@5@00 r)
          (Set_in (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r) xs@3@00))
        (= (inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r) r))
      :pattern ((inv@27@00 s@$ xs@3@00 x@4@00 y@5@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun2%precondition s@$ xs@3@00 x@4@00 y@5@00)
      (=
        (fun2 s@$ xs@3@00 x@4@00 y@5@00)
        (+
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) x@4@00)
          (ite
            (Set_in y@5@00 xs@3@00)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) y@5@00)
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) x@4@00))))))
  :pattern ((fun2 s@$ xs@3@00 x@4@00 y@5@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (x@4@00 $Ref) (y@5@00 $Ref)) (!
  true
  :pattern ((fun2 s@$ xs@3@00 x@4@00 y@5@00))
  :qid |quant-u-19|)))
; ---------- FUNCTION fun4----------
(declare-fun x@7@00 () $Ref)
(declare-fun y@8@00 () $Ref)
(declare-fun z@9@00 () $Ref)
(declare-fun result@10@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-fun sm@29@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) x@7@00)
  ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(assert (not (= x@7@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-fun sm@30@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) y@8@00)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@8@00 x@7@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@8@00 $Ref.null)))
(declare-fun sm@31@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) z@9@00)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@9@00 y@8@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@9@00 x@7@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@9@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@7@00 $Ref) (y@8@00 $Ref) (z@9@00 $Ref)) (!
  (= (fun4%limited s@$ x@7@00 y@8@00 z@9@00) (fun4 s@$ x@7@00 y@8@00 z@9@00))
  :pattern ((fun4 s@$ x@7@00 y@8@00 z@9@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@7@00 $Ref) (y@8@00 $Ref) (z@9@00 $Ref)) (!
  (fun4%stateless x@7@00 y@8@00 z@9@00)
  :pattern ((fun4%limited s@$ x@7@00 y@8@00 z@9@00))
  :qid |quant-u-5|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert (=
  ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) z@9@00)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))
(assert (not (= z@9@00 $Ref.null)))
(assert (=
  ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) y@8@00)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (not (= y@8@00 $Ref.null)))
(assert (=
  ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) x@7@00)
  ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(assert (not (= x@7@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] x.f + y.f + z.f + fun1(Set(x), x)
; [eval] x.f + y.f + z.f
; [eval] x.f + y.f
(declare-fun sm@32@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@7@00)
    (=
      ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@8@00)
    (=
      ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@9@00)
    (=
      ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@33@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@33@00  $FPM) r)
    (+
      (+
        (ite (= r x@7@00) $Perm.Write $Perm.No)
        (ite (= r y@8@00) $Perm.Write $Perm.No))
      (ite (= r z@9@00) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@33@00  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_f (as pm@33@00  $FPM) x@7@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@7@00)
      (=
        ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
        ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r)))
    :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :pattern (($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@8@00)
      (=
        ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
        ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r)))
    :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :pattern (($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@9@00)
      (=
        ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
        ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r)))
    :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :pattern (($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :qid |qp.fvfValDef2|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (+ (ite (= y@8@00 x@7@00) $Perm.Write $Perm.No) $Perm.Write)
    (ite (= y@8@00 z@9@00) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@7@00)
      (=
        ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
        ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r)))
    :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :pattern (($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@8@00)
      (=
        ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
        ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r)))
    :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :pattern (($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@9@00)
      (=
        ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
        ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r)))
    :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :pattern (($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r))
    :qid |qp.fvfValDef2|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= z@9@00 x@7@00) $Perm.Write $Perm.No)
      (ite (= z@9@00 y@8@00) $Perm.Write $Perm.No))
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] fun1(Set(x), x)
; [eval] Set(x)
(push) ; 2
; [eval] (x in xs)
(push) ; 3
(assert (not (Set_in x@7@00 (Set_singleton x@7@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@7@00 (Set_singleton x@7@00)))
(declare-const r@34@00 $Ref)
(push) ; 3
; [eval] (r in xs)
(assert (Set_in r@34@00 (Set_singleton x@7@00)))
(pop) ; 3
(declare-fun inv@35@00 ($Snap $Ref $Ref $Ref $Ref) $Ref)
(declare-fun img@36@00 ($Snap $Ref $Ref $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@34@00 $Ref) (r2@34@00 $Ref)) (!
  (=>
    (and
      (Set_in r1@34@00 (Set_singleton x@7@00))
      (Set_in r2@34@00 (Set_singleton x@7@00))
      (= r1@34@00 r2@34@00))
    (= r1@34@00 r2@34@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@34@00 $Ref)) (!
  (=>
    (Set_in r@34@00 (Set_singleton x@7@00))
    (and
      (= (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00) r@34@00)
      (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00)))
  :pattern ((Set_in r@34@00 (Set_singleton x@7@00)))
  :pattern ((inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00))
  :pattern ((img@36@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r)
      (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00)))
    (= (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) r))
  :pattern ((inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (ite
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 x@7@00) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 x@7@00)
        (= x@7@00 (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 x@7@00)))
      $Perm.Write
      $Perm.No))
  $Perm.No)))
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
    (and
      (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
      (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r)
      (= r (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
            (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r)
            (= r (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r)))
          ($Perm.min (ite (= r x@7@00) $Perm.Write $Perm.No) $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@37@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00)))
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r)))
    (=>
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
      (Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00)))))
  :pattern ((Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00))))
  :qid |qp.fvfDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
      (= r x@7@00))
    (=
      ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
      (= r y@8@00))
    (=
      ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
      (= r z@9@00))
    (=
      ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef6|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (sm@37@00 s@$ x@7@00 y@8@00 z@9@00))) (Set_singleton x@7@00) x@7@00))
(pop) ; 2
; Joined path conditions
(assert (forall ((r@34@00 $Ref)) (!
  (=>
    (Set_in r@34@00 (Set_singleton x@7@00))
    (and
      (= (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00) r@34@00)
      (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00)))
  :pattern ((Set_in r@34@00 (Set_singleton x@7@00)))
  :pattern ((inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00))
  :pattern ((img@36@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r)
      (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00)))
    (= (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) r))
  :pattern ((inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00)))
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r)))
    (=>
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
      (Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00)))))
  :pattern ((Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
      (= r x@7@00))
    (=
      ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
      (= r y@8@00))
    (=
      ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
        (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
      (= r z@9@00))
    (=
      ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
      ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r)))
  :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :pattern (($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r))
  :qid |qp.fvfValDef6|)))
(assert (and
  (Set_in x@7@00 (Set_singleton x@7@00))
  (fun1%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (sm@37@00 s@$ x@7@00 y@8@00 z@9@00))) (Set_singleton x@7@00) x@7@00)))
(assert (=
  result@10@00
  (+
    (+
      (+
        ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) x@7@00)
        ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) y@8@00))
      ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) z@9@00))
    (fun1 ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@37@00 s@$ x@7@00 y@8@00 z@9@00))) (Set_singleton x@7@00) x@7@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@7@00 $Ref) (y@8@00 $Ref) (z@9@00 $Ref)) (!
  (and
    (forall ((r@34@00 $Ref)) (!
      (=>
        (Set_in r@34@00 (Set_singleton x@7@00))
        (and
          (= (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00) r@34@00)
          (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00)))
      :pattern ((Set_in r@34@00 (Set_singleton x@7@00)))
      :pattern ((inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00))
      :pattern ((img@36@00 s@$ x@7@00 y@8@00 z@9@00 r@34@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r)
          (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00)))
        (= (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) r))
      :pattern ((inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r))
      :qid |f-fctOfInv|))
    (=
      ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) x@7@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$)))
    (=
      ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) y@8@00)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (=
      ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) z@9@00)
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$))))
    (forall ((r $Ref)) (!
      (=>
        (= r x@7@00)
        (=
          ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
          ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r)))
      :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :pattern (($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (=>
        (= r y@8@00)
        (=
          ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
          ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r)))
      :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :pattern (($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :qid |qp.fvfValDef1|))
    (forall ((r $Ref)) (!
      (=>
        (= r z@9@00)
        (=
          ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r)
          ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r)))
      :pattern (($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :pattern (($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :qid |qp.fvfValDef2|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00)))
          (and
            (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
            (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r)))
        (=>
          (and
            (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
            (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
          (Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00))))
      :qid |qp.fvfDomDef7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
            (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
          (= r x@7@00))
        (=
          ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
          ($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r)))
      :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :pattern (($FVF.lookup_f (sm@29@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
            (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
          (= r y@8@00))
        (=
          ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
          ($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r)))
      :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :pattern (($FVF.lookup_f (sm@30@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :qid |qp.fvfValDef5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@35@00 s@$ x@7@00 y@8@00 z@9@00 r) (Set_singleton x@7@00))
            (img@36@00 s@$ x@7@00 y@8@00 z@9@00 r))
          (= r z@9@00))
        (=
          ($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r)
          ($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r)))
      :pattern (($FVF.lookup_f (sm@37@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :pattern (($FVF.lookup_f (sm@31@00 s@$ x@7@00 y@8@00 z@9@00) r))
      :qid |qp.fvfValDef6|))
    (=>
      (fun4%precondition s@$ x@7@00 y@8@00 z@9@00)
      (=
        (fun4 s@$ x@7@00 y@8@00 z@9@00)
        (+
          (+
            (+
              ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) x@7@00)
              ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) y@8@00))
            ($FVF.lookup_f (sm@32@00 s@$ x@7@00 y@8@00 z@9@00) z@9@00))
          (fun1 ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<f>To$Snap (sm@37@00 s@$ x@7@00 y@8@00 z@9@00))) (Set_singleton x@7@00) x@7@00)))))
  :pattern ((fun4 s@$ x@7@00 y@8@00 z@9@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (x@7@00 $Ref) (y@8@00 $Ref) (z@9@00 $Ref)) (!
  (=>
    (fun4%precondition s@$ x@7@00 y@8@00 z@9@00)
    (fun1%precondition ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@37@00 s@$ x@7@00 y@8@00 z@9@00))) (Set_singleton x@7@00) x@7@00))
  :pattern ((fun4 s@$ x@7@00 y@8@00 z@9@00))
  :qid |quant-u-25|)))
; ---------- FUNCTION fun6----------
(declare-fun x@11@00 () $Ref)
(declare-fun y@12@00 () $Ref)
(declare-fun z@13@00 () $Ref)
(declare-fun result@14@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-fun sm@38@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) x@11@00)
  ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(assert (not (= x@11@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-fun sm@39@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) y@12@00)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@12@00 x@11@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@12@00 $Ref.null)))
(declare-fun sm@40@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) z@13@00)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@13@00 y@12@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@13@00 x@11@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@13@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@11@00 $Ref) (y@12@00 $Ref) (z@13@00 $Ref)) (!
  (=
    (fun6%limited s@$ x@11@00 y@12@00 z@13@00)
    (fun6 s@$ x@11@00 y@12@00 z@13@00))
  :pattern ((fun6 s@$ x@11@00 y@12@00 z@13@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref) (y@12@00 $Ref) (z@13@00 $Ref)) (!
  (fun6%stateless x@11@00 y@12@00 z@13@00)
  :pattern ((fun6%limited s@$ x@11@00 y@12@00 z@13@00))
  :qid |quant-u-7|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert (=
  ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) z@13@00)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))
(assert (not (= z@13@00 $Ref.null)))
(assert (=
  ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) y@12@00)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (not (= y@12@00 $Ref.null)))
(assert (=
  ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) x@11@00)
  ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(assert (not (= x@11@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] x.f + y.f + z.f + fun2(Set(x, z), x, y)
; [eval] x.f + y.f + z.f
; [eval] x.f + y.f
(declare-fun sm@41@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@11@00)
    (=
      ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@12@00)
    (=
      ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@13@00)
    (=
      ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@42@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@42@00  $FPM) r)
    (+
      (+
        (ite (= r x@11@00) $Perm.Write $Perm.No)
        (ite (= r y@12@00) $Perm.Write $Perm.No))
      (ite (= r z@13@00) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@42@00  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_f (as pm@42@00  $FPM) x@11@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@11@00)
      (=
        ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
        ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r)))
    :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :pattern (($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@12@00)
      (=
        ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
        ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r)))
    :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :pattern (($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@13@00)
      (=
        ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
        ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r)))
    :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :pattern (($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :qid |qp.fvfValDef10|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (+ (ite (= y@12@00 x@11@00) $Perm.Write $Perm.No) $Perm.Write)
    (ite (= y@12@00 z@13@00) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@11@00)
      (=
        ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
        ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r)))
    :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :pattern (($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@12@00)
      (=
        ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
        ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r)))
    :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :pattern (($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@13@00)
      (=
        ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
        ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r)))
    :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :pattern (($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r))
    :qid |qp.fvfValDef10|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= z@13@00 x@11@00) $Perm.Write $Perm.No)
      (ite (= z@13@00 y@12@00) $Perm.Write $Perm.No))
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] fun2(Set(x, z), x, y)
; [eval] Set(x, z)
(push) ; 2
; [eval] (x in xs)
(push) ; 3
(assert (not (Set_in x@11@00 (Set_unionone (Set_singleton x@11@00) z@13@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@11@00 (Set_unionone (Set_singleton x@11@00) z@13@00)))
(declare-const r@43@00 $Ref)
(push) ; 3
; [eval] (r in xs)
(assert (Set_in r@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00)))
(pop) ; 3
(declare-fun inv@44@00 ($Snap $Ref $Ref $Ref $Ref) $Ref)
(declare-fun img@45@00 ($Snap $Ref $Ref $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@43@00 $Ref) (r2@43@00 $Ref)) (!
  (=>
    (and
      (Set_in r1@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00))
      (Set_in r2@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00))
      (= r1@43@00 r2@43@00))
    (= r1@43@00 r2@43@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@43@00 $Ref)) (!
  (=>
    (Set_in r@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00))
    (and
      (= (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00) r@43@00)
      (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00)))
  :pattern ((Set_in r@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00)))
  :pattern ((inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00))
  :pattern ((img@45@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
      (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00)))
    (= (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) r))
  :pattern ((inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (ite
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 x@11@00) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 x@11@00)
        (= x@11@00 (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 x@11@00)))
      $Perm.Write
      $Perm.No))
  $Perm.No)))
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
    (and
      (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
      (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
      (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
            (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
            (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
          ($Perm.min (ite (= r x@11@00) $Perm.Write $Perm.No) $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (ite
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 y@12@00) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 y@12@00)
        (= y@12@00 (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 y@12@00)))
      ($Perm.min
        $Perm.Write
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 y@12@00) (Set_unionone (Set_singleton x@11@00) z@13@00))
              (img@45@00 s@$ x@11@00 y@12@00 z@13@00 y@12@00)
              (= y@12@00 (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 y@12@00)))
            ($Perm.min
              (ite (= y@12@00 x@11@00) $Perm.Write $Perm.No)
              $Perm.Write)
            $Perm.No)))
      $Perm.No))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
        (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
      ($Perm.min
        (ite (= r y@12@00) $Perm.Write $Perm.No)
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
              (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
              (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
            ($Perm.min (ite (= r x@11@00) $Perm.Write $Perm.No) $Perm.Write)
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-31|))))
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
      (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
      (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
      (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
    (=
      (-
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
              (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
              (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
            ($Perm.min (ite (= r x@11@00) $Perm.Write $Perm.No) $Perm.Write)
            $Perm.No))
        (ite
          (and
            (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
            (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
            (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
          ($Perm.min
            (ite (= r y@12@00) $Perm.Write $Perm.No)
            (-
              $Perm.Write
              (ite
                (and
                  (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
                  (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
                  (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
                ($Perm.min (ite (= r x@11@00) $Perm.Write $Perm.No) $Perm.Write)
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (ite
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00)
        (= z@13@00 (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00)))
      ($Perm.min
        $Perm.Write
        (-
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00) (Set_unionone (Set_singleton x@11@00) z@13@00))
                (img@45@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00)
                (= z@13@00 (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00)))
              ($Perm.min
                (ite (= z@13@00 x@11@00) $Perm.Write $Perm.No)
                $Perm.Write)
              $Perm.No))
          (ite
            (and
              (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00) (Set_unionone (Set_singleton x@11@00) z@13@00))
              (img@45@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00)
              (= z@13@00 (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00)))
            ($Perm.min
              (ite (= z@13@00 y@12@00) $Perm.Write $Perm.No)
              (-
                $Perm.Write
                (ite
                  (and
                    (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00) (Set_unionone (Set_singleton x@11@00) z@13@00))
                    (img@45@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00)
                    (= z@13@00 (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 z@13@00)))
                  ($Perm.min
                    (ite (= z@13@00 x@11@00) $Perm.Write $Perm.No)
                    $Perm.Write)
                  $Perm.No)))
            $Perm.No)))
      $Perm.No))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
        (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
      ($Perm.min
        (ite (= r z@13@00) $Perm.Write $Perm.No)
        (-
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
                (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
                (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
              ($Perm.min (ite (= r x@11@00) $Perm.Write $Perm.No) $Perm.Write)
              $Perm.No))
          (ite
            (and
              (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
              (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
              (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
            ($Perm.min
              (ite (= r y@12@00) $Perm.Write $Perm.No)
              (-
                $Perm.Write
                (ite
                  (and
                    (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
                    (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
                    (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
                  ($Perm.min
                    (ite (= r x@11@00) $Perm.Write $Perm.No)
                    $Perm.Write)
                  $Perm.No)))
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-34|))))
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
      (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
      (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
      (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
    (=
      (-
        (-
          (-
            $Perm.Write
            (ite
              (and
                (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
                (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
                (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
              ($Perm.min (ite (= r x@11@00) $Perm.Write $Perm.No) $Perm.Write)
              $Perm.No))
          (ite
            (and
              (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
              (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
              (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
            ($Perm.min
              (ite (= r y@12@00) $Perm.Write $Perm.No)
              (-
                $Perm.Write
                (ite
                  (and
                    (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
                    (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
                    (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
                  ($Perm.min
                    (ite (= r x@11@00) $Perm.Write $Perm.No)
                    $Perm.Write)
                  $Perm.No)))
            $Perm.No))
        (ite
          (and
            (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
            (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
            (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
          ($Perm.min
            (ite (= r z@13@00) $Perm.Write $Perm.No)
            (-
              (-
                $Perm.Write
                (ite
                  (and
                    (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
                    (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
                    (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
                  ($Perm.min
                    (ite (= r x@11@00) $Perm.Write $Perm.No)
                    $Perm.Write)
                  $Perm.No))
              (ite
                (and
                  (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
                  (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
                  (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
                ($Perm.min
                  (ite (= r y@12@00) $Perm.Write $Perm.No)
                  (-
                    $Perm.Write
                    (ite
                      (and
                        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
                        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
                        (= r (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r)))
                      ($Perm.min
                        (ite (= r x@11@00) $Perm.Write $Perm.No)
                        $Perm.Write)
                      $Perm.No)))
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@46@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00)))
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)))
    (=>
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
      (Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00)))))
  :pattern ((Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00))))
  :qid |qp.fvfDomDef15|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
      (= r x@11@00))
    (=
      ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
      (= r y@12@00))
    (=
      ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
      (= r z@13@00))
    (=
      ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef14|)))
(assert (fun2%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (sm@46@00 s@$ x@11@00 y@12@00 z@13@00))) (Set_unionone (Set_singleton x@11@00) z@13@00) x@11@00 y@12@00))
(pop) ; 2
; Joined path conditions
(assert (forall ((r@43@00 $Ref)) (!
  (=>
    (Set_in r@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00))
    (and
      (= (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00) r@43@00)
      (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00)))
  :pattern ((Set_in r@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00)))
  :pattern ((inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00))
  :pattern ((img@45@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
      (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00)))
    (= (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) r))
  :pattern ((inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00)))
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)))
    (=>
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
      (Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00)))))
  :pattern ((Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00))))
  :qid |qp.fvfDomDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
      (= r x@11@00))
    (=
      ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
      (= r y@12@00))
    (=
      ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
        (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
      (= r z@13@00))
    (=
      ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
      ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r)))
  :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :pattern (($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r))
  :qid |qp.fvfValDef14|)))
(assert (and
  (Set_in x@11@00 (Set_unionone (Set_singleton x@11@00) z@13@00))
  (fun2%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (sm@46@00 s@$ x@11@00 y@12@00 z@13@00))) (Set_unionone (Set_singleton x@11@00) z@13@00) x@11@00 y@12@00)))
(assert (=
  result@14@00
  (+
    (+
      (+
        ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) x@11@00)
        ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) y@12@00))
      ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) z@13@00))
    (fun2 ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@46@00 s@$ x@11@00 y@12@00 z@13@00))) (Set_unionone (Set_singleton x@11@00) z@13@00) x@11@00 y@12@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@11@00 $Ref) (y@12@00 $Ref) (z@13@00 $Ref)) (!
  (and
    (forall ((r@43@00 $Ref)) (!
      (=>
        (Set_in r@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00))
        (and
          (= (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00) r@43@00)
          (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00)))
      :pattern ((Set_in r@43@00 (Set_unionone (Set_singleton x@11@00) z@13@00)))
      :pattern ((inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00))
      :pattern ((img@45@00 s@$ x@11@00 y@12@00 z@13@00 r@43@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)
          (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00)))
        (= (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) r))
      :pattern ((inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r))
      :qid |f-fctOfInv|))
    (=
      ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) x@11@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$)))
    (=
      ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) y@12@00)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (=
      ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) z@13@00)
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$))))
    (forall ((r $Ref)) (!
      (=>
        (= r x@11@00)
        (=
          ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
          ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r)))
      :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :pattern (($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :qid |qp.fvfValDef8|))
    (forall ((r $Ref)) (!
      (=>
        (= r y@12@00)
        (=
          ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
          ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r)))
      :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :pattern (($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :qid |qp.fvfValDef9|))
    (forall ((r $Ref)) (!
      (=>
        (= r z@13@00)
        (=
          ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r)
          ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r)))
      :pattern (($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :pattern (($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :qid |qp.fvfValDef10|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00)))
          (and
            (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
            (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r)))
        (=>
          (and
            (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
            (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
          (Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00))))
      :qid |qp.fvfDomDef15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
            (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
          (= r x@11@00))
        (=
          ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
          ($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r)))
      :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :pattern (($FVF.lookup_f (sm@38@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :qid |qp.fvfValDef12|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
            (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
          (= r y@12@00))
        (=
          ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
          ($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r)))
      :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :pattern (($FVF.lookup_f (sm@39@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :qid |qp.fvfValDef13|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@44@00 s@$ x@11@00 y@12@00 z@13@00 r) (Set_unionone (Set_singleton x@11@00) z@13@00))
            (img@45@00 s@$ x@11@00 y@12@00 z@13@00 r))
          (= r z@13@00))
        (=
          ($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r)
          ($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r)))
      :pattern (($FVF.lookup_f (sm@46@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :pattern (($FVF.lookup_f (sm@40@00 s@$ x@11@00 y@12@00 z@13@00) r))
      :qid |qp.fvfValDef14|))
    (=>
      (fun6%precondition s@$ x@11@00 y@12@00 z@13@00)
      (=
        (fun6 s@$ x@11@00 y@12@00 z@13@00)
        (+
          (+
            (+
              ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) x@11@00)
              ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) y@12@00))
            ($FVF.lookup_f (sm@41@00 s@$ x@11@00 y@12@00 z@13@00) z@13@00))
          (fun2 ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<f>To$Snap (sm@46@00 s@$ x@11@00 y@12@00 z@13@00))) (Set_unionone (Set_singleton x@11@00) z@13@00) x@11@00 y@12@00)))))
  :pattern ((fun6 s@$ x@11@00 y@12@00 z@13@00))
  :qid |quant-u-36|)))
(assert (forall ((s@$ $Snap) (x@11@00 $Ref) (y@12@00 $Ref) (z@13@00 $Ref)) (!
  (=>
    (fun6%precondition s@$ x@11@00 y@12@00 z@13@00)
    (fun2%precondition ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@46@00 s@$ x@11@00 y@12@00 z@13@00))) (Set_unionone (Set_singleton x@11@00) z@13@00) x@11@00 y@12@00))
  :pattern ((fun6 s@$ x@11@00 y@12@00 z@13@00))
  :qid |quant-u-37|)))
; ---------- FUNCTION fun5----------
(declare-fun x@15@00 () $Ref)
(declare-fun y@16@00 () $Ref)
(declare-fun z@17@00 () $Ref)
(declare-fun result@18@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-fun sm@47@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) x@15@00)
  ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(assert (not (= x@15@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-fun sm@48@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) y@16@00)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@16@00 x@15@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@16@00 $Ref.null)))
(declare-fun sm@49@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) z@17@00)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@17@00 y@16@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= z@17@00 x@15@00)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= z@17@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@15@00 $Ref) (y@16@00 $Ref) (z@17@00 $Ref)) (!
  (=
    (fun5%limited s@$ x@15@00 y@16@00 z@17@00)
    (fun5 s@$ x@15@00 y@16@00 z@17@00))
  :pattern ((fun5 s@$ x@15@00 y@16@00 z@17@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (x@15@00 $Ref) (y@16@00 $Ref) (z@17@00 $Ref)) (!
  (fun5%stateless x@15@00 y@16@00 z@17@00)
  :pattern ((fun5%limited s@$ x@15@00 y@16@00 z@17@00))
  :qid |quant-u-9|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert (=
  ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) z@17@00)
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$)))))
(assert (not (= z@17@00 $Ref.null)))
(assert (=
  ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) y@16@00)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$)))))
(assert (not (= y@16@00 $Ref.null)))
(assert (=
  ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) x@15@00)
  ($SortWrappers.$SnapToInt ($Snap.first s@$))))
(assert (not (= x@15@00 $Ref.null)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] x.f + y.f + z.f + fun1(Set(x, y), x)
; [eval] x.f + y.f + z.f
; [eval] x.f + y.f
(declare-fun sm@50@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@15@00)
    (=
      ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@16@00)
    (=
      ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r z@17@00)
    (=
      ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef18|)))
(declare-const pm@51@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@51@00  $FPM) r)
    (+
      (+
        (ite (= r x@15@00) $Perm.Write $Perm.No)
        (ite (= r y@16@00) $Perm.Write $Perm.No))
      (ite (= r z@17@00) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@51@00  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
(set-option :timeout 0)
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_f (as pm@51@00  $FPM) x@15@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@15@00)
      (=
        ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
        ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r)))
    :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :pattern (($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@16@00)
      (=
        ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
        ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r)))
    :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :pattern (($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@17@00)
      (=
        ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
        ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r)))
    :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :pattern (($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :qid |qp.fvfValDef18|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (+ (ite (= y@16@00 x@15@00) $Perm.Write $Perm.No) $Perm.Write)
    (ite (= y@16@00 z@17@00) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@15@00)
      (=
        ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
        ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r)))
    :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :pattern (($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@16@00)
      (=
        ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
        ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r)))
    :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :pattern (($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (= r z@17@00)
      (=
        ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
        ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r)))
    :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :pattern (($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r))
    :qid |qp.fvfValDef18|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= z@17@00 x@15@00) $Perm.Write $Perm.No)
      (ite (= z@17@00 y@16@00) $Perm.Write $Perm.No))
    $Perm.Write))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] fun1(Set(x, y), x)
; [eval] Set(x, y)
(push) ; 2
; [eval] (x in xs)
(push) ; 3
(assert (not (Set_in x@15@00 (Set_unionone (Set_singleton x@15@00) y@16@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@15@00 (Set_unionone (Set_singleton x@15@00) y@16@00)))
(declare-const r@52@00 $Ref)
(push) ; 3
; [eval] (r in xs)
(assert (Set_in r@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00)))
(pop) ; 3
(declare-fun inv@53@00 ($Snap $Ref $Ref $Ref $Ref) $Ref)
(declare-fun img@54@00 ($Snap $Ref $Ref $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@52@00 $Ref) (r2@52@00 $Ref)) (!
  (=>
    (and
      (Set_in r1@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00))
      (Set_in r2@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00))
      (= r1@52@00 r2@52@00))
    (= r1@52@00 r2@52@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@52@00 $Ref)) (!
  (=>
    (Set_in r@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00))
    (and
      (= (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00) r@52@00)
      (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00)))
  :pattern ((Set_in r@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00)))
  :pattern ((inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00))
  :pattern ((img@54@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
      (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00)))
    (= (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) r))
  :pattern ((inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (ite
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 x@15@00) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 x@15@00)
        (= x@15@00 (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 x@15@00)))
      $Perm.Write
      $Perm.No))
  $Perm.No)))
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
    (and
      (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
      (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
      (= r (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
            (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
            (= r (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r)))
          ($Perm.min (ite (= r x@15@00) $Perm.Write $Perm.No) $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    $Perm.Write
    (ite
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 y@16@00) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 y@16@00)
        (= y@16@00 (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 y@16@00)))
      ($Perm.min
        $Perm.Write
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 y@16@00) (Set_unionone (Set_singleton x@15@00) y@16@00))
              (img@54@00 s@$ x@15@00 y@16@00 z@17@00 y@16@00)
              (= y@16@00 (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 y@16@00)))
            ($Perm.min
              (ite (= y@16@00 x@15@00) $Perm.Write $Perm.No)
              $Perm.Write)
            $Perm.No)))
      $Perm.No))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
        (= r (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r)))
      ($Perm.min
        (ite (= r y@16@00) $Perm.Write $Perm.No)
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
              (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
              (= r (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r)))
            ($Perm.min (ite (= r x@15@00) $Perm.Write $Perm.No) $Perm.Write)
            $Perm.No)))
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-43|))))
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
      (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
      (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
      (= r (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r)))
    (=
      (-
        (-
          $Perm.Write
          (ite
            (and
              (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
              (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
              (= r (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r)))
            ($Perm.min (ite (= r x@15@00) $Perm.Write $Perm.No) $Perm.Write)
            $Perm.No))
        (ite
          (and
            (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
            (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
            (= r (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r)))
          ($Perm.min
            (ite (= r y@16@00) $Perm.Write $Perm.No)
            (-
              $Perm.Write
              (ite
                (and
                  (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
                  (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
                  (= r (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r)))
                ($Perm.min (ite (= r x@15@00) $Perm.Write $Perm.No) $Perm.Write)
                $Perm.No)))
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@55@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00)))
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)))
    (=>
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
      (Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00)))))
  :pattern ((Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00))))
  :qid |qp.fvfDomDef23|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
      (= r x@15@00))
    (=
      ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
      (= r y@16@00))
    (=
      ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
      (= r z@17@00))
    (=
      ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef22|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (sm@55@00 s@$ x@15@00 y@16@00 z@17@00))) (Set_unionone (Set_singleton x@15@00) y@16@00) x@15@00))
(pop) ; 2
; Joined path conditions
(assert (forall ((r@52@00 $Ref)) (!
  (=>
    (Set_in r@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00))
    (and
      (= (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00) r@52@00)
      (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00)))
  :pattern ((Set_in r@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00)))
  :pattern ((inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00))
  :pattern ((img@54@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
      (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00)))
    (= (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) r))
  :pattern ((inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00)))
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)))
    (=>
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
      (Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00)))))
  :pattern ((Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00))))
  :qid |qp.fvfDomDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
      (= r x@15@00))
    (=
      ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
      (= r y@16@00))
    (=
      ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
        (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
      (= r z@17@00))
    (=
      ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
      ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r)))
  :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :pattern (($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r))
  :qid |qp.fvfValDef22|)))
(assert (and
  (Set_in x@15@00 (Set_unionone (Set_singleton x@15@00) y@16@00))
  (fun1%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (sm@55@00 s@$ x@15@00 y@16@00 z@17@00))) (Set_unionone (Set_singleton x@15@00) y@16@00) x@15@00)))
(assert (=
  result@18@00
  (+
    (+
      (+
        ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) x@15@00)
        ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) y@16@00))
      ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) z@17@00))
    (fun1 ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@55@00 s@$ x@15@00 y@16@00 z@17@00))) (Set_unionone (Set_singleton x@15@00) y@16@00) x@15@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@15@00 $Ref) (y@16@00 $Ref) (z@17@00 $Ref)) (!
  (and
    (forall ((r@52@00 $Ref)) (!
      (=>
        (Set_in r@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00))
        (and
          (= (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00) r@52@00)
          (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00)))
      :pattern ((Set_in r@52@00 (Set_unionone (Set_singleton x@15@00) y@16@00)))
      :pattern ((inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00))
      :pattern ((img@54@00 s@$ x@15@00 y@16@00 z@17@00 r@52@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)
          (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00)))
        (= (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) r))
      :pattern ((inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r))
      :qid |f-fctOfInv|))
    (=
      ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) x@15@00)
      ($SortWrappers.$SnapToInt ($Snap.first s@$)))
    (=
      ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) y@16@00)
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
    (=
      ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) z@17@00)
      ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second s@$))))
    (forall ((r $Ref)) (!
      (=>
        (= r x@15@00)
        (=
          ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
          ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r)))
      :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :pattern (($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :qid |qp.fvfValDef16|))
    (forall ((r $Ref)) (!
      (=>
        (= r y@16@00)
        (=
          ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
          ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r)))
      :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :pattern (($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :qid |qp.fvfValDef17|))
    (forall ((r $Ref)) (!
      (=>
        (= r z@17@00)
        (=
          ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r)
          ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r)))
      :pattern (($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :pattern (($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :qid |qp.fvfValDef18|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00)))
          (and
            (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
            (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r)))
        (=>
          (and
            (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
            (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
          (Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00))))
      :qid |qp.fvfDomDef23|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
            (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
          (= r x@15@00))
        (=
          ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
          ($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r)))
      :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :pattern (($FVF.lookup_f (sm@47@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :qid |qp.fvfValDef20|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
            (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
          (= r y@16@00))
        (=
          ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
          ($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r)))
      :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :pattern (($FVF.lookup_f (sm@48@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :qid |qp.fvfValDef21|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@53@00 s@$ x@15@00 y@16@00 z@17@00 r) (Set_unionone (Set_singleton x@15@00) y@16@00))
            (img@54@00 s@$ x@15@00 y@16@00 z@17@00 r))
          (= r z@17@00))
        (=
          ($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r)
          ($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r)))
      :pattern (($FVF.lookup_f (sm@55@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :pattern (($FVF.lookup_f (sm@49@00 s@$ x@15@00 y@16@00 z@17@00) r))
      :qid |qp.fvfValDef22|))
    (=>
      (fun5%precondition s@$ x@15@00 y@16@00 z@17@00)
      (=
        (fun5 s@$ x@15@00 y@16@00 z@17@00)
        (+
          (+
            (+
              ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) x@15@00)
              ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) y@16@00))
            ($FVF.lookup_f (sm@50@00 s@$ x@15@00 y@16@00 z@17@00) z@17@00))
          (fun1 ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<f>To$Snap (sm@55@00 s@$ x@15@00 y@16@00 z@17@00))) (Set_unionone (Set_singleton x@15@00) y@16@00) x@15@00)))))
  :pattern ((fun5 s@$ x@15@00 y@16@00 z@17@00))
  :qid |quant-u-45|)))
(assert (forall ((s@$ $Snap) (x@15@00 $Ref) (y@16@00 $Ref) (z@17@00 $Ref)) (!
  (=>
    (fun5%precondition s@$ x@15@00 y@16@00 z@17@00)
    (fun1%precondition ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@55@00 s@$ x@15@00 y@16@00 z@17@00))) (Set_unionone (Set_singleton x@15@00) y@16@00) x@15@00))
  :pattern ((fun5 s@$ x@15@00 y@16@00 z@17@00))
  :qid |quant-u-46|)))
; ---------- FUNCTION fun3----------
(declare-fun x@19@00 () $Ref)
(declare-fun y@20@00 () $Ref)
(declare-fun z@21@00 () $Ref)
(declare-fun result@22@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const r@56@00 $Ref)
(push) ; 2
; [eval] (r in Set(x, y, z))
; [eval] Set(x, y, z)
(assert (Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
(pop) ; 2
(declare-fun inv@57@00 ($Snap $Ref $Ref $Ref $Ref) $Ref)
(declare-fun img@58@00 ($Snap $Ref $Ref $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((r1@56@00 $Ref) (r2@56@00 $Ref)) (!
  (=>
    (and
      (Set_in r1@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))
      (Set_in r2@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))
      (= r1@56@00 r2@56@00))
    (= r1@56@00 r2@56@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@56@00 $Ref)) (!
  (=>
    (Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))
    (and
      (= (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00) r@56@00)
      (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00)))
  :pattern ((Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
  :pattern ((inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
  :pattern ((img@58@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
  :qid |quant-u-48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
      (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
    (= (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) r))
  :pattern ((inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@56@00 $Ref)) (!
  (=>
    (Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))
    (not (= r@56@00 $Ref.null)))
  :pattern ((Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
  :pattern ((inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
  :pattern ((img@58@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] x != null
(assert (not (= x@19@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] y != null
(assert (not (= y@20@00 $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] z != null
(assert (not (= z@21@00 $Ref.null)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@19@00 $Ref) (y@20@00 $Ref) (z@21@00 $Ref)) (!
  (=
    (fun3%limited s@$ x@19@00 y@20@00 z@21@00)
    (fun3 s@$ x@19@00 y@20@00 z@21@00))
  :pattern ((fun3 s@$ x@19@00 y@20@00 z@21@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (x@19@00 $Ref) (y@20@00 $Ref) (z@21@00 $Ref)) (!
  (fun3%stateless x@19@00 y@20@00 z@21@00)
  :pattern ((fun3%limited s@$ x@19@00 y@20@00 z@21@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
      (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
    (= (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) r))
  :pattern ((inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r@56@00 $Ref)) (!
  (=>
    (Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))
    (and
      (= (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00) r@56@00)
      (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00)))
  :pattern ((Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
  :pattern ((inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
  :pattern ((img@58@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
  :qid |quant-u-48|)))
(assert (forall ((r@56@00 $Ref)) (!
  (=>
    (Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))
    (not (= r@56@00 $Ref.null)))
  :pattern ((Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
  :pattern ((inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
  :pattern ((img@58@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (not (= x@19@00 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (not (= y@20@00 $Ref.null)))
(assert (= ($Snap.second ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (not (= z@21@00 $Ref.null)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] x.f + y.f + z.f + fun2(Set(x, z), x, y)
; [eval] x.f + y.f + z.f
; [eval] x.f + y.f
(set-option :timeout 0)
(push) ; 2
(assert (not (and
  (img@58@00 s@$ x@19@00 y@20@00 z@21@00 x@19@00)
  (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 x@19@00) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@58@00 s@$ x@19@00 y@20@00 z@21@00 y@20@00)
  (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 y@20@00) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (and
  (img@58@00 s@$ x@19@00 y@20@00 z@21@00 z@21@00)
  (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 z@21@00) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] fun2(Set(x, z), x, y)
; [eval] Set(x, z)
(push) ; 2
; [eval] (x in xs)
(push) ; 3
(assert (not (Set_in x@19@00 (Set_unionone (Set_singleton x@19@00) z@21@00))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Set_in x@19@00 (Set_unionone (Set_singleton x@19@00) z@21@00)))
(declare-const r@59@00 $Ref)
(push) ; 3
; [eval] (r in xs)
(assert (Set_in r@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00)))
(pop) ; 3
(declare-fun inv@60@00 ($Snap $Ref $Ref $Ref $Ref) $Ref)
(declare-fun img@61@00 ($Snap $Ref $Ref $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@59@00 $Ref) (r2@59@00 $Ref)) (!
  (=>
    (and
      (Set_in r1@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00))
      (Set_in r2@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00))
      (= r1@59@00 r2@59@00))
    (= r1@59@00 r2@59@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@59@00 $Ref)) (!
  (=>
    (Set_in r@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00))
    (and
      (= (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00) r@59@00)
      (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00)))
  :pattern ((Set_in r@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00)))
  :pattern ((inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00))
  :pattern ((img@61@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)
      (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00)))
    (= (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) r))
  :pattern ((inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
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
        (and
          (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
          (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
          (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)
          (= r (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r)))
        ($Perm.min
          (ite
            (and
              (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
              (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
            $Perm.Write
            $Perm.No)
          $Perm.Write)
        $Perm.No))
    $Perm.No)
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (=
    (ite
      (and
        (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
        (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)
        (= r (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r)))
      ($Perm.min
        (ite
          (and
            (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
            (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
          $Perm.Write
          $Perm.No)
        $Perm.Write)
      $Perm.No)
    $Perm.No)
  
  :qid |quant-u-52|))))
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
      (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
      (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)
      (= r (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r)))
    (=
      (-
        $Perm.Write
        (ite
          (and
            (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
            (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)
            (= r (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r)))
          ($Perm.min
            (ite
              (and
                (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
                (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
              $Perm.Write
              $Perm.No)
            $Perm.Write)
          $Perm.No))
      $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-fun sm@62@00 ($Snap $Ref $Ref $Ref) $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00)))
      (and
        (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
        (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)))
    (=>
      (and
        (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
        (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r))
      (Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00)))))
  :pattern ((Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00))))
  :qid |qp.fvfDomDef25|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
        (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r))
      (and
        (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
        (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))))
    (=
      ($FVF.lookup_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef24|)))
(assert (fun2%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (sm@62@00 s@$ x@19@00 y@20@00 z@21@00))) (Set_unionone (Set_singleton x@19@00) z@21@00) x@19@00 y@20@00))
(pop) ; 2
; Joined path conditions
(assert (forall ((r@59@00 $Ref)) (!
  (=>
    (Set_in r@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00))
    (and
      (= (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00) r@59@00)
      (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00)))
  :pattern ((Set_in r@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00)))
  :pattern ((inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00))
  :pattern ((img@61@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)
      (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00)))
    (= (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) r))
  :pattern ((inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00)))
      (and
        (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
        (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)))
    (=>
      (and
        (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
        (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r))
      (Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00)))))
  :pattern ((Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00))))
  :qid |qp.fvfDomDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
        (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r))
      (and
        (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
        (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))))
    (=
      ($FVF.lookup_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) r)))
  :pattern (($FVF.lookup_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) r))
  :qid |qp.fvfValDef24|)))
(assert (and
  (Set_in x@19@00 (Set_unionone (Set_singleton x@19@00) z@21@00))
  (fun2%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (sm@62@00 s@$ x@19@00 y@20@00 z@21@00))) (Set_unionone (Set_singleton x@19@00) z@21@00) x@19@00 y@20@00)))
(assert (=
  result@22@00
  (+
    (+
      (+
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) x@19@00)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) y@20@00))
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) z@21@00))
    (fun2 ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@62@00 s@$ x@19@00 y@20@00 z@21@00))) (Set_unionone (Set_singleton x@19@00) z@21@00) x@19@00 y@20@00))))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@19@00 $Ref) (y@20@00 $Ref) (z@21@00 $Ref)) (!
  (and
    (forall ((r@56@00 $Ref)) (!
      (=>
        (Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))
        (and
          (= (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00) r@56@00)
          (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00)))
      :pattern ((Set_in r@56@00 (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
      :pattern ((inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
      :pattern ((img@58@00 s@$ x@19@00 y@20@00 z@21@00 r@56@00))
      :qid |quant-u-48|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
          (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00)))
        (= (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) r))
      :pattern ((inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r))
      :qid |f-fctOfInv|))
    (forall ((r@59@00 $Ref)) (!
      (=>
        (Set_in r@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00))
        (and
          (= (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00) r@59@00)
          (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00)))
      :pattern ((Set_in r@59@00 (Set_unionone (Set_singleton x@19@00) z@21@00)))
      :pattern ((inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00))
      :pattern ((img@61@00 s@$ x@19@00 y@20@00 z@21@00 r@59@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)
          (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00)))
        (= (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) r))
      :pattern ((inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00)))
          (and
            (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
            (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r)))
        (=>
          (and
            (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
            (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r))
          (Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00))))
      :qid |qp.fvfDomDef25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@60@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_singleton x@19@00) z@21@00))
            (img@61@00 s@$ x@19@00 y@20@00 z@21@00 r))
          (and
            (img@58@00 s@$ x@19@00 y@20@00 z@21@00 r)
            (Set_in (inv@57@00 s@$ x@19@00 y@20@00 z@21@00 r) (Set_unionone (Set_unionone (Set_singleton x@19@00) y@20@00) z@21@00))))
        (=
          ($FVF.lookup_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_f (sm@62@00 s@$ x@19@00 y@20@00 z@21@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef24|))
    (=>
      (fun3%precondition s@$ x@19@00 y@20@00 z@21@00)
      (=
        (fun3 s@$ x@19@00 y@20@00 z@21@00)
        (+
          (+
            (+
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) x@19@00)
              ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) y@20@00))
            ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) z@21@00))
          (fun2 ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<f>To$Snap (sm@62@00 s@$ x@19@00 y@20@00 z@21@00))) (Set_unionone (Set_singleton x@19@00) z@21@00) x@19@00 y@20@00)))))
  :pattern ((fun3 s@$ x@19@00 y@20@00 z@21@00))
  :qid |quant-u-54|)))
(assert (forall ((s@$ $Snap) (x@19@00 $Ref) (y@20@00 $Ref) (z@21@00 $Ref)) (!
  (=>
    (fun3%precondition s@$ x@19@00 y@20@00 z@21@00)
    (fun2%precondition ($Snap.combine
      $Snap.unit
      ($SortWrappers.$FVF<f>To$Snap (sm@62@00 s@$ x@19@00 y@20@00 z@21@00))) (Set_unionone (Set_singleton x@19@00) z@21@00) x@19@00 y@20@00))
  :pattern ((fun3 s@$ x@19@00 y@20@00 z@21@00))
  :qid |quant-u-55|)))
