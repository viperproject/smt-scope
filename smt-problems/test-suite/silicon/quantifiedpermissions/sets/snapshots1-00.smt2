(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:37
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/snapshots1.vpr
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
(declare-fun fun2 ($Snap Set<$Ref> $Ref) Int)
(declare-fun fun2%limited ($Snap Set<$Ref> $Ref) Int)
(declare-fun fun2%stateless (Set<$Ref> $Ref) Bool)
(declare-fun fun2%precondition ($Snap Set<$Ref> $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P%trigger ($Snap Set<$Ref> $Ref) Bool)
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
(declare-fun inv@7@00 ($Snap Set<$Ref> $Ref $Ref) $Ref)
(declare-fun img@8@00 ($Snap Set<$Ref> $Ref $Ref) Bool)
(declare-fun inv@10@00 ($Snap Set<$Ref> $Ref $Ref) $Ref)
(declare-fun img@11@00 ($Snap Set<$Ref> $Ref $Ref) Bool)
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref)) (!
  (= (fun1%limited s@$ xs@0@00 x@1@00) (fun1 s@$ xs@0@00 x@1@00))
  :pattern ((fun1 s@$ xs@0@00 x@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref)) (!
  (fun1%stateless xs@0@00 x@1@00)
  :pattern ((fun1%limited s@$ xs@0@00 x@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref)) (!
  (and
    (forall ((z@6@00 $Ref)) (!
      (=>
        (Set_in z@6@00 xs@0@00)
        (and
          (= (inv@7@00 s@$ xs@0@00 x@1@00 z@6@00) z@6@00)
          (img@8@00 s@$ xs@0@00 x@1@00 z@6@00)))
      :pattern ((Set_in z@6@00 xs@0@00))
      :pattern ((inv@7@00 s@$ xs@0@00 x@1@00 z@6@00))
      :pattern ((img@8@00 s@$ xs@0@00 x@1@00 z@6@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@8@00 s@$ xs@0@00 x@1@00 r)
          (Set_in (inv@7@00 s@$ xs@0@00 x@1@00 r) xs@0@00))
        (= (inv@7@00 s@$ xs@0@00 x@1@00 r) r))
      :pattern ((inv@7@00 s@$ xs@0@00 x@1@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun1%precondition s@$ xs@0@00 x@1@00)
      (=
        (fun1 s@$ xs@0@00 x@1@00)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) x@1@00))))
  :pattern ((fun1 s@$ xs@0@00 x@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref)) (!
  true
  :pattern ((fun1 s@$ xs@0@00 x@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (x@4@00 $Ref)) (!
  (= (fun2%limited s@$ xs@3@00 x@4@00) (fun2 s@$ xs@3@00 x@4@00))
  :pattern ((fun2 s@$ xs@3@00 x@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (x@4@00 $Ref)) (!
  (fun2%stateless xs@3@00 x@4@00)
  :pattern ((fun2%limited s@$ xs@3@00 x@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (x@4@00 $Ref)) (!
  (and
    (forall ((z@9@00 $Ref)) (!
      (=>
        (Set_in z@9@00 xs@3@00)
        (and
          (= (inv@10@00 s@$ xs@3@00 x@4@00 z@9@00) z@9@00)
          (img@11@00 s@$ xs@3@00 x@4@00 z@9@00)))
      :pattern ((Set_in z@9@00 xs@3@00))
      :pattern ((inv@10@00 s@$ xs@3@00 x@4@00 z@9@00))
      :pattern ((img@11@00 s@$ xs@3@00 x@4@00 z@9@00))
      :qid |quant-u-9|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@11@00 s@$ xs@3@00 x@4@00 r)
          (Set_in (inv@10@00 s@$ xs@3@00 x@4@00 r) xs@3@00))
        (= (inv@10@00 s@$ xs@3@00 x@4@00 r) r))
      :pattern ((inv@10@00 s@$ xs@3@00 x@4@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun2%precondition s@$ xs@3@00 x@4@00)
      (=
        (fun2 s@$ xs@3@00 x@4@00)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) x@4@00))))
  :pattern ((fun2 s@$ xs@3@00 x@4@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (x@4@00 $Ref)) (!
  true
  :pattern ((fun2 s@$ xs@3@00 x@4@00))
  :qid |quant-u-11|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test1 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const x@1@01 $Ref)
(declare-const xs@2@01 Set<$Ref>)
(declare-const x@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@3@01 xs@2@01))
(declare-const z@5@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@5@01 xs@2@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@5@01 $Ref) (z2@5@01 $Ref)) (!
  (=>
    (and (Set_in z1@5@01 xs@2@01) (Set_in z2@5@01 xs@2@01) (= z1@5@01 z2@5@01))
    (= z1@5@01 z2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@5@01 $Ref)) (!
  (=>
    (Set_in z@5@01 xs@2@01)
    (and (= (inv@6@01 z@5@01) z@5@01) (img@7@01 z@5@01)))
  :pattern ((Set_in z@5@01 xs@2@01))
  :pattern ((inv@6@01 z@5@01))
  :pattern ((img@7@01 z@5@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@5@01 $Ref)) (!
  (=> (Set_in z@5@01 xs@2@01) (not (= z@5@01 $Ref.null)))
  :pattern ((Set_in z@5@01 xs@2@01))
  :pattern ((inv@6@01 z@5@01))
  :pattern ((img@7@01 z@5@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@8@01 Int)
; [exec]
; var b: Int
(declare-const b@9@01 Int)
; [exec]
; a := fun1(xs, x)
; [eval] fun1(xs, x)
(push) ; 3
; [eval] (x in xs)
(declare-const z@10@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@10@01 xs@2@01))
(pop) ; 4
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@10@01 $Ref) (z2@10@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@10@01 xs@2@01)
      (Set_in z2@10@01 xs@2@01)
      (= z1@10@01 z2@10@01))
    (= z1@10@01 z2@10@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@10@01 $Ref)) (!
  (=>
    (Set_in z@10@01 xs@2@01)
    (and (= (inv@11@01 z@10@01) z@10@01) (img@12@01 z@10@01)))
  :pattern ((Set_in z@10@01 xs@2@01))
  :pattern ((inv@11@01 z@10@01))
  :pattern ((img@12@01 z@10@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@12@01 r) (Set_in (inv@11@01 r) xs@2@01)) (= (inv@11@01 r) r))
  :pattern ((inv@11@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@13@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r) (= r (inv@11@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@13@01 r))
    $Perm.No)
  
  :qid |quant-u-18|))))
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
    (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r) (= r (inv@11@01 r)))
    (= (- $Perm.Write (pTaken@13@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@14@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@14@01  $FVF<f>)))
      (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r)))
    (=>
      (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r))
      (Set_in r ($FVF.domain_f (as sm@14@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@14@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@14@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@14@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@14@01  $FVF<f>))) xs@2@01 x@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@10@01 $Ref)) (!
  (=>
    (Set_in z@10@01 xs@2@01)
    (and (= (inv@11@01 z@10@01) z@10@01) (img@12@01 z@10@01)))
  :pattern ((Set_in z@10@01 xs@2@01))
  :pattern ((inv@11@01 z@10@01))
  :pattern ((img@12@01 z@10@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@12@01 r) (Set_in (inv@11@01 r) xs@2@01)) (= (inv@11@01 r) r))
  :pattern ((inv@11@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@14@01  $FVF<f>)))
      (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r)))
    (=>
      (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r))
      (Set_in r ($FVF.domain_f (as sm@14@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@14@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@14@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@14@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@14@01  $FVF<f>))) xs@2@01 x@3@01))
(declare-const a@15@01 Int)
(assert (=
  a@15@01
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@14@01  $FVF<f>))) xs@2@01 x@3@01)))
; [exec]
; assert a == fun1(xs, x)
; [eval] a == fun1(xs, x)
; [eval] fun1(xs, x)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(declare-const z@16@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@16@01 xs@2@01))
(pop) ; 4
(declare-fun inv@17@01 ($Ref) $Ref)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@16@01 $Ref) (z2@16@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@16@01 xs@2@01)
      (Set_in z2@16@01 xs@2@01)
      (= z1@16@01 z2@16@01))
    (= z1@16@01 z2@16@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@16@01 $Ref)) (!
  (=>
    (Set_in z@16@01 xs@2@01)
    (and (= (inv@17@01 z@16@01) z@16@01) (img@18@01 z@16@01)))
  :pattern ((Set_in z@16@01 xs@2@01))
  :pattern ((inv@17@01 z@16@01))
  :pattern ((img@18@01 z@16@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@18@01 r) (Set_in (inv@17@01 r) xs@2@01)) (= (inv@17@01 r) r))
  :pattern ((inv@17@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@17@01 r) xs@2@01) (img@18@01 r) (= r (inv@17@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@19@01 r))
    $Perm.No)
  
  :qid |quant-u-22|))))
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
    (and (Set_in (inv@17@01 r) xs@2@01) (img@18@01 r) (= r (inv@17@01 r)))
    (= (- $Perm.Write (pTaken@19@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@20@01  $FVF<f>)))
      (and (Set_in (inv@17@01 r) xs@2@01) (img@18@01 r)))
    (=>
      (and (Set_in (inv@17@01 r) xs@2@01) (img@18@01 r))
      (Set_in r ($FVF.domain_f (as sm@20@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@20@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@17@01 r) xs@2@01) (img@18@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@20@01  $FVF<f>))) xs@2@01 x@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@16@01 $Ref)) (!
  (=>
    (Set_in z@16@01 xs@2@01)
    (and (= (inv@17@01 z@16@01) z@16@01) (img@18@01 z@16@01)))
  :pattern ((Set_in z@16@01 xs@2@01))
  :pattern ((inv@17@01 z@16@01))
  :pattern ((img@18@01 z@16@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@18@01 r) (Set_in (inv@17@01 r) xs@2@01)) (= (inv@17@01 r) r))
  :pattern ((inv@17@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@20@01  $FVF<f>)))
      (and (Set_in (inv@17@01 r) xs@2@01) (img@18@01 r)))
    (=>
      (and (Set_in (inv@17@01 r) xs@2@01) (img@18@01 r))
      (Set_in r ($FVF.domain_f (as sm@20@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@20@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@17@01 r) xs@2@01) (img@18@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@20@01  $FVF<f>))) xs@2@01 x@3@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  a@15@01
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@20@01  $FVF<f>))) xs@2@01 x@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  a@15@01
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@20@01  $FVF<f>))) xs@2@01 x@3@01)))
; [exec]
; b := fun1(xs, x)
; [eval] fun1(xs, x)
(push) ; 3
; [eval] (x in xs)
(declare-const z@21@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@21@01 xs@2@01))
(pop) ; 4
(declare-fun inv@22@01 ($Ref) $Ref)
(declare-fun img@23@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@21@01 $Ref) (z2@21@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@21@01 xs@2@01)
      (Set_in z2@21@01 xs@2@01)
      (= z1@21@01 z2@21@01))
    (= z1@21@01 z2@21@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@21@01 $Ref)) (!
  (=>
    (Set_in z@21@01 xs@2@01)
    (and (= (inv@22@01 z@21@01) z@21@01) (img@23@01 z@21@01)))
  :pattern ((Set_in z@21@01 xs@2@01))
  :pattern ((inv@22@01 z@21@01))
  :pattern ((img@23@01 z@21@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@23@01 r) (Set_in (inv@22@01 r) xs@2@01)) (= (inv@22@01 r) r))
  :pattern ((inv@22@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@22@01 r) xs@2@01) (img@23@01 r) (= r (inv@22@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@24@01 r))
    $Perm.No)
  
  :qid |quant-u-26|))))
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
    (and (Set_in (inv@22@01 r) xs@2@01) (img@23@01 r) (= r (inv@22@01 r)))
    (= (- $Perm.Write (pTaken@24@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@25@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@25@01  $FVF<f>)))
      (and (Set_in (inv@22@01 r) xs@2@01) (img@23@01 r)))
    (=>
      (and (Set_in (inv@22@01 r) xs@2@01) (img@23@01 r))
      (Set_in r ($FVF.domain_f (as sm@25@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@25@01  $FVF<f>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@22@01 r) xs@2@01) (img@23@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@25@01  $FVF<f>))) xs@2@01 x@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@21@01 $Ref)) (!
  (=>
    (Set_in z@21@01 xs@2@01)
    (and (= (inv@22@01 z@21@01) z@21@01) (img@23@01 z@21@01)))
  :pattern ((Set_in z@21@01 xs@2@01))
  :pattern ((inv@22@01 z@21@01))
  :pattern ((img@23@01 z@21@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@23@01 r) (Set_in (inv@22@01 r) xs@2@01)) (= (inv@22@01 r) r))
  :pattern ((inv@22@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@25@01  $FVF<f>)))
      (and (Set_in (inv@22@01 r) xs@2@01) (img@23@01 r)))
    (=>
      (and (Set_in (inv@22@01 r) xs@2@01) (img@23@01 r))
      (Set_in r ($FVF.domain_f (as sm@25@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@25@01  $FVF<f>))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@22@01 r) xs@2@01) (img@23@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@25@01  $FVF<f>))) xs@2@01 x@3@01))
(declare-const b@26@01 Int)
(assert (=
  b@26@01
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@25@01  $FVF<f>))) xs@2@01 x@3@01)))
; [exec]
; assert b == fun1(xs, x)
; [eval] b == fun1(xs, x)
; [eval] fun1(xs, x)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(declare-const z@27@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@27@01 xs@2@01))
(pop) ; 4
(declare-fun inv@28@01 ($Ref) $Ref)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@27@01 $Ref) (z2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@27@01 xs@2@01)
      (Set_in z2@27@01 xs@2@01)
      (= z1@27@01 z2@27@01))
    (= z1@27@01 z2@27@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@27@01 $Ref)) (!
  (=>
    (Set_in z@27@01 xs@2@01)
    (and (= (inv@28@01 z@27@01) z@27@01) (img@29@01 z@27@01)))
  :pattern ((Set_in z@27@01 xs@2@01))
  :pattern ((inv@28@01 z@27@01))
  :pattern ((img@29@01 z@27@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@29@01 r) (Set_in (inv@28@01 r) xs@2@01)) (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@28@01 r) xs@2@01) (img@29@01 r) (= r (inv@28@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@30@01 r))
    $Perm.No)
  
  :qid |quant-u-30|))))
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
    (and (Set_in (inv@28@01 r) xs@2@01) (img@29@01 r) (= r (inv@28@01 r)))
    (= (- $Perm.Write (pTaken@30@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@31@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@31@01  $FVF<f>)))
      (and (Set_in (inv@28@01 r) xs@2@01) (img@29@01 r)))
    (=>
      (and (Set_in (inv@28@01 r) xs@2@01) (img@29@01 r))
      (Set_in r ($FVF.domain_f (as sm@31@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@31@01  $FVF<f>))))
  :qid |qp.fvfDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@28@01 r) xs@2@01) (img@29@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@31@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@31@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@31@01  $FVF<f>))) xs@2@01 x@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@27@01 $Ref)) (!
  (=>
    (Set_in z@27@01 xs@2@01)
    (and (= (inv@28@01 z@27@01) z@27@01) (img@29@01 z@27@01)))
  :pattern ((Set_in z@27@01 xs@2@01))
  :pattern ((inv@28@01 z@27@01))
  :pattern ((img@29@01 z@27@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@29@01 r) (Set_in (inv@28@01 r) xs@2@01)) (= (inv@28@01 r) r))
  :pattern ((inv@28@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@31@01  $FVF<f>)))
      (and (Set_in (inv@28@01 r) xs@2@01) (img@29@01 r)))
    (=>
      (and (Set_in (inv@28@01 r) xs@2@01) (img@29@01 r))
      (Set_in r ($FVF.domain_f (as sm@31@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@31@01  $FVF<f>))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@28@01 r) xs@2@01) (img@29@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (=
      ($FVF.lookup_f (as sm@31@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@31@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@4@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@31@01  $FVF<f>))) xs@2@01 x@3@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  b@26@01
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@31@01  $FVF<f>))) xs@2@01 x@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  b@26@01
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@31@01  $FVF<f>))) xs@2@01 x@3@01)))
; [exec]
; assert a == b
; [eval] a == b
(push) ; 3
(assert (not (= a@15@01 b@26@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= a@15@01 b@26@01))
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const xs@32@01 Set<$Ref>)
(declare-const x@33@01 $Ref)
(declare-const y@34@01 $Ref)
(declare-const xs@35@01 Set<$Ref>)
(declare-const x@36@01 $Ref)
(declare-const y@37@01 $Ref)
(push) ; 1
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 ($Snap.combine ($Snap.first $t@38@01) ($Snap.second $t@38@01))))
(assert (= ($Snap.first $t@38@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@36@01 xs@35@01))
(assert (=
  ($Snap.second $t@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@38@01))
    ($Snap.second ($Snap.second $t@38@01)))))
(assert (= ($Snap.first ($Snap.second $t@38@01)) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@37@01 xs@35@01))
(assert (=
  ($Snap.second ($Snap.second $t@38@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@38@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@38@01))))))
(declare-const z@39@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@39@01 xs@35@01))
(pop) ; 2
(declare-fun inv@40@01 ($Ref) $Ref)
(declare-fun img@41@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@39@01 $Ref) (z2@39@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@39@01 xs@35@01)
      (Set_in z2@39@01 xs@35@01)
      (= z1@39@01 z2@39@01))
    (= z1@39@01 z2@39@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@39@01 $Ref)) (!
  (=>
    (Set_in z@39@01 xs@35@01)
    (and (= (inv@40@01 z@39@01) z@39@01) (img@41@01 z@39@01)))
  :pattern ((Set_in z@39@01 xs@35@01))
  :pattern ((inv@40@01 z@39@01))
  :pattern ((img@41@01 z@39@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01)) (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@39@01 $Ref)) (!
  (=> (Set_in z@39@01 xs@35@01) (not (= z@39@01 $Ref.null)))
  :pattern ((Set_in z@39@01 xs@35@01))
  :pattern ((inv@40@01 z@39@01))
  :pattern ((img@41@01 z@39@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@38@01))) $Snap.unit))
; [eval] x != y
(assert (not (= x@36@01 y@37@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var yf: Int
(declare-const yf@42@01 Int)
; [exec]
; yf := y.f
(push) ; 3
(assert (not (and (img@41@01 y@37@01) (Set_in (inv@40@01 y@37@01) xs@35@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const yf@43@01 Int)
(assert (=
  yf@43@01
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@38@01)))) y@37@01)))
; [exec]
; x.f := 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@44@01 ((r $Ref)) $Perm
  (ite
    (= r x@36@01)
    ($Perm.min
      (ite
        (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
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
        (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
        $Perm.Write
        $Perm.No)
      (pTaken@44@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@44@01 r) $Perm.No)
  
  :qid |quant-u-36|))))
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
  (=> (= r x@36@01) (= (- $Perm.Write (pTaken@44@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@45@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@45@01  $FVF<f>) x@36@01) 1))
; [exec]
; assert y.f == yf
; [eval] y.f == yf
(declare-const sm@46@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@36@01)
    (=
      ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
      (< $Perm.No (- $Perm.Write (pTaken@44@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@38@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@38@01)))) r))
  :qid |qp.fvfValDef9|)))
(declare-const pm@47@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@47@01  $FPM) r)
    (+
      (ite (= r x@36@01) $Perm.Write $Perm.No)
      (ite
        (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
        (- $Perm.Write (pTaken@44@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@47@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@47@01  $FPM) y@37@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (= ($FVF.lookup_f (as sm@46@01  $FVF<f>) y@37@01) yf@43@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($FVF.lookup_f (as sm@46@01  $FVF<f>) y@37@01) yf@43@01))
; [exec]
; y.f := yf + 1
; [eval] yf + 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@36@01 y@37@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (= r y@37@01)
    ($Perm.min
      (ite
        (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
        (- $Perm.Write (pTaken@44@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@49@01 ((r $Ref)) $Perm
  (ite
    (= r y@37@01)
    ($Perm.min
      (ite (= r x@36@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@48@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
        (- $Perm.Write (pTaken@44@01 r))
        $Perm.No)
      (pTaken@48@01 r))
    $Perm.No)
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@48@01 r) $Perm.No)
  
  :qid |quant-u-40|))))
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
  (=> (= r y@37@01) (= (- $Perm.Write (pTaken@48@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@50@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) y@37@01) (+ yf@43@01 1)))
; [exec]
; exhale (forall z: Ref ::(z in xs) ==> acc(z.f, write))
(declare-const z@51@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@51@01 xs@35@01))
(pop) ; 3
(declare-fun inv@52@01 ($Ref) $Ref)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@51@01 $Ref) (z2@51@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@51@01 xs@35@01)
      (Set_in z2@51@01 xs@35@01)
      (= z1@51@01 z2@51@01))
    (= z1@51@01 z2@51@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@51@01 $Ref)) (!
  (=>
    (Set_in z@51@01 xs@35@01)
    (and (= (inv@52@01 z@51@01) z@51@01) (img@53@01 z@51@01)))
  :pattern ((Set_in z@51@01 xs@35@01))
  :pattern ((inv@52@01 z@51@01))
  :pattern ((img@53@01 z@51@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@53@01 r) (Set_in (inv@52@01 r) xs@35@01)) (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@52@01 r) xs@35@01) (img@53@01 r) (= r (inv@52@01 r)))
    ($Perm.min
      (ite
        (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
        (- (- $Perm.Write (pTaken@44@01 r)) (pTaken@48@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@52@01 r) xs@35@01) (img@53@01 r) (= r (inv@52@01 r)))
    ($Perm.min
      (ite (= r y@37@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@54@01 r)))
    $Perm.No))
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@52@01 r) xs@35@01) (img@53@01 r) (= r (inv@52@01 r)))
    ($Perm.min
      (ite (= r x@36@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@54@01 r)) (pTaken@55@01 r)))
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
        (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
        (- (- $Perm.Write (pTaken@44@01 r)) (pTaken@48@01 r))
        $Perm.No)
      (pTaken@54@01 r))
    $Perm.No)
  
  :qid |quant-u-44|))))
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
    (and (Set_in (inv@52@01 r) xs@35@01) (img@53@01 r) (= r (inv@52@01 r)))
    (= (- $Perm.Write (pTaken@54@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@55@01 y@37@01)) $Perm.No)))
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
    (and (Set_in (inv@52@01 r) xs@35@01) (img@53@01 r) (= r (inv@52@01 r)))
    (= (- (- $Perm.Write (pTaken@54@01 r)) (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@56@01 x@36@01)) $Perm.No)))
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
    (and (Set_in (inv@52@01 r) xs@35@01) (img@53@01 r) (= r (inv@52@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@54@01 r)) (pTaken@55@01 r)) (pTaken@56@01 r))
      $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@57@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@37@01)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@50@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@36@01)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@41@01 r) (Set_in (inv@40@01 r) xs@35@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@44@01 r)) (pTaken@48@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@38@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@38@01)))) r))
  :qid |qp.fvfValDef13|)))
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const xs@58@01 Set<$Ref>)
(declare-const x@59@01 $Ref)
(declare-const y@60@01 $Ref)
(declare-const xs@61@01 Set<$Ref>)
(declare-const x@62@01 $Ref)
(declare-const y@63@01 $Ref)
(push) ; 1
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 ($Snap.combine ($Snap.first $t@64@01) ($Snap.second $t@64@01))))
(assert (= ($Snap.first $t@64@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@62@01 xs@61@01))
(assert (=
  ($Snap.second $t@64@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@64@01))
    ($Snap.second ($Snap.second $t@64@01)))))
(assert (= ($Snap.first ($Snap.second $t@64@01)) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@63@01 xs@61@01))
(assert (=
  ($Snap.second ($Snap.second $t@64@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@64@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@64@01))))))
(declare-const z@65@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@65@01 xs@61@01))
(pop) ; 2
(declare-fun inv@66@01 ($Ref) $Ref)
(declare-fun img@67@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@65@01 $Ref) (z2@65@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@65@01 xs@61@01)
      (Set_in z2@65@01 xs@61@01)
      (= z1@65@01 z2@65@01))
    (= z1@65@01 z2@65@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@65@01 $Ref)) (!
  (=>
    (Set_in z@65@01 xs@61@01)
    (and (= (inv@66@01 z@65@01) z@65@01) (img@67@01 z@65@01)))
  :pattern ((Set_in z@65@01 xs@61@01))
  :pattern ((inv@66@01 z@65@01))
  :pattern ((img@67@01 z@65@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01)) (= (inv@66@01 r) r))
  :pattern ((inv@66@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@65@01 $Ref)) (!
  (=> (Set_in z@65@01 xs@61@01) (not (= z@65@01 $Ref.null)))
  :pattern ((Set_in z@65@01 xs@61@01))
  :pattern ((inv@66@01 z@65@01))
  :pattern ((img@67@01 z@65@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@64@01))) $Snap.unit))
; [eval] x != y
(assert (not (= x@62@01 y@63@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var xf: Int
(declare-const xf@68@01 Int)
; [exec]
; var yf: Int
(declare-const yf@69@01 Int)
; [exec]
; xf := fun1(xs, x)
; [eval] fun1(xs, x)
(push) ; 3
; [eval] (x in xs)
(declare-const z@70@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@70@01 xs@61@01))
(pop) ; 4
(declare-fun inv@71@01 ($Ref) $Ref)
(declare-fun img@72@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@70@01 $Ref) (z2@70@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@70@01 xs@61@01)
      (Set_in z2@70@01 xs@61@01)
      (= z1@70@01 z2@70@01))
    (= z1@70@01 z2@70@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@70@01 $Ref)) (!
  (=>
    (Set_in z@70@01 xs@61@01)
    (and (= (inv@71@01 z@70@01) z@70@01) (img@72@01 z@70@01)))
  :pattern ((Set_in z@70@01 xs@61@01))
  :pattern ((inv@71@01 z@70@01))
  :pattern ((img@72@01 z@70@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@72@01 r) (Set_in (inv@71@01 r) xs@61@01)) (= (inv@71@01 r) r))
  :pattern ((inv@71@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@73@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@71@01 r) xs@61@01) (img@72@01 r) (= r (inv@71@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@73@01 r))
    $Perm.No)
  
  :qid |quant-u-54|))))
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
    (and (Set_in (inv@71@01 r) xs@61@01) (img@72@01 r) (= r (inv@71@01 r)))
    (= (- $Perm.Write (pTaken@73@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@74@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>)))
      (and (Set_in (inv@71@01 r) xs@61@01) (img@72@01 r)))
    (=>
      (and (Set_in (inv@71@01 r) xs@61@01) (img@72@01 r))
      (Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@71@01 r) xs@61@01) (img@72@01 r))
      (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01)))
    (=
      ($FVF.lookup_f (as sm@74@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@74@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef14|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@74@01  $FVF<f>))) xs@61@01 x@62@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@70@01 $Ref)) (!
  (=>
    (Set_in z@70@01 xs@61@01)
    (and (= (inv@71@01 z@70@01) z@70@01) (img@72@01 z@70@01)))
  :pattern ((Set_in z@70@01 xs@61@01))
  :pattern ((inv@71@01 z@70@01))
  :pattern ((img@72@01 z@70@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@72@01 r) (Set_in (inv@71@01 r) xs@61@01)) (= (inv@71@01 r) r))
  :pattern ((inv@71@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>)))
      (and (Set_in (inv@71@01 r) xs@61@01) (img@72@01 r)))
    (=>
      (and (Set_in (inv@71@01 r) xs@61@01) (img@72@01 r))
      (Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@74@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@71@01 r) xs@61@01) (img@72@01 r))
      (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01)))
    (=
      ($FVF.lookup_f (as sm@74@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@74@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef14|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@74@01  $FVF<f>))) xs@61@01 x@62@01))
(declare-const xf@75@01 Int)
(assert (=
  xf@75@01
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@74@01  $FVF<f>))) xs@61@01 x@62@01)))
; [exec]
; yf := fun1(xs, y)
; [eval] fun1(xs, y)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(declare-const z@76@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@76@01 xs@61@01))
(pop) ; 4
(declare-fun inv@77@01 ($Ref) $Ref)
(declare-fun img@78@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@76@01 $Ref) (z2@76@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@76@01 xs@61@01)
      (Set_in z2@76@01 xs@61@01)
      (= z1@76@01 z2@76@01))
    (= z1@76@01 z2@76@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@76@01 $Ref)) (!
  (=>
    (Set_in z@76@01 xs@61@01)
    (and (= (inv@77@01 z@76@01) z@76@01) (img@78@01 z@76@01)))
  :pattern ((Set_in z@76@01 xs@61@01))
  :pattern ((inv@77@01 z@76@01))
  :pattern ((img@78@01 z@76@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@78@01 r) (Set_in (inv@77@01 r) xs@61@01)) (= (inv@77@01 r) r))
  :pattern ((inv@77@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@77@01 r) xs@61@01) (img@78@01 r) (= r (inv@77@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@79@01 r))
    $Perm.No)
  
  :qid |quant-u-58|))))
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
    (and (Set_in (inv@77@01 r) xs@61@01) (img@78@01 r) (= r (inv@77@01 r)))
    (= (- $Perm.Write (pTaken@79@01 r)) $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@80@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>)))
      (and (Set_in (inv@77@01 r) xs@61@01) (img@78@01 r)))
    (=>
      (and (Set_in (inv@77@01 r) xs@61@01) (img@78@01 r))
      (Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>))))
  :qid |qp.fvfDomDef17|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@77@01 r) xs@61@01) (img@78@01 r))
      (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01)))
    (=
      ($FVF.lookup_f (as sm@80@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@80@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef16|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@80@01  $FVF<f>))) xs@61@01 y@63@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@76@01 $Ref)) (!
  (=>
    (Set_in z@76@01 xs@61@01)
    (and (= (inv@77@01 z@76@01) z@76@01) (img@78@01 z@76@01)))
  :pattern ((Set_in z@76@01 xs@61@01))
  :pattern ((inv@77@01 z@76@01))
  :pattern ((img@78@01 z@76@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@78@01 r) (Set_in (inv@77@01 r) xs@61@01)) (= (inv@77@01 r) r))
  :pattern ((inv@77@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>)))
      (and (Set_in (inv@77@01 r) xs@61@01) (img@78@01 r)))
    (=>
      (and (Set_in (inv@77@01 r) xs@61@01) (img@78@01 r))
      (Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>))))
  :qid |qp.fvfDomDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@77@01 r) xs@61@01) (img@78@01 r))
      (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01)))
    (=
      ($FVF.lookup_f (as sm@80@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@80@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef16|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@80@01  $FVF<f>))) xs@61@01 y@63@01))
(declare-const yf@81@01 Int)
(assert (=
  yf@81@01
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@80@01  $FVF<f>))) xs@61@01 y@63@01)))
; [exec]
; x.f := xf + 1
; [eval] xf + 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@82@01 ((r $Ref)) $Perm
  (ite
    (= r x@62@01)
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        $Perm.Write
        $Perm.No)
      (pTaken@82@01 r))
    $Perm.No)
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@82@01 r) $Perm.No)
  
  :qid |quant-u-62|))))
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
  (=> (= r x@62@01) (= (- $Perm.Write (pTaken@82@01 r)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@83@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) x@62@01) (+ xf@75@01 1)))
; [exec]
; assert fun1(xs, x) == xf + 1
; [eval] fun1(xs, x) == xf + 1
; [eval] fun1(xs, x)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(declare-const z@84@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@84@01 xs@61@01))
(pop) ; 4
(declare-fun inv@85@01 ($Ref) $Ref)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@84@01 $Ref) (z2@84@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@84@01 xs@61@01)
      (Set_in z2@84@01 xs@61@01)
      (= z1@84@01 z2@84@01))
    (= z1@84@01 z2@84@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@84@01 $Ref)) (!
  (=>
    (Set_in z@84@01 xs@61@01)
    (and (= (inv@85@01 z@84@01) z@84@01) (img@86@01 z@84@01)))
  :pattern ((Set_in z@84@01 xs@61@01))
  :pattern ((inv@85@01 z@84@01))
  :pattern ((img@86@01 z@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@86@01 r) (Set_in (inv@85@01 r) xs@61@01)) (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@87@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r) (= r (inv@85@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- $Perm.Write (pTaken@82@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@88@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r) (= r (inv@85@01 r)))
    ($Perm.min
      (ite (= r x@62@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@87@01 r)))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- $Perm.Write (pTaken@82@01 r))
        $Perm.No)
      (pTaken@87@01 r))
    $Perm.No)
  
  :qid |quant-u-66|))))
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
    (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r) (= r (inv@85@01 r)))
    (= (- $Perm.Write (pTaken@87@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@88@01 x@62@01)) $Perm.No)))
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
    (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r) (= r (inv@85@01 r)))
    (= (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@88@01 r)) $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@89@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))
      (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r)))
    (=>
      (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r))
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>))))
  :qid |qp.fvfDomDef20|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- $Perm.Write (pTaken@82@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef19|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>))) xs@61@01 x@62@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@84@01 $Ref)) (!
  (=>
    (Set_in z@84@01 xs@61@01)
    (and (= (inv@85@01 z@84@01) z@84@01) (img@86@01 z@84@01)))
  :pattern ((Set_in z@84@01 xs@61@01))
  :pattern ((inv@85@01 z@84@01))
  :pattern ((img@86@01 z@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@86@01 r) (Set_in (inv@85@01 r) xs@61@01)) (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))
      (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r)))
    (=>
      (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r))
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>))))
  :qid |qp.fvfDomDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) xs@61@01) (img@86@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- $Perm.Write (pTaken@82@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef19|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>))) xs@61@01 x@62@01))
; [eval] xf + 1
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>))) xs@61@01 x@62@01)
  (+ xf@75@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>))) xs@61@01 x@62@01)
  (+ xf@75@01 1)))
; [exec]
; assert fun1(xs, y) == yf
; [eval] fun1(xs, y) == yf
; [eval] fun1(xs, y)
(push) ; 3
; [eval] (x in xs)
(declare-const z@90@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@90@01 xs@61@01))
(pop) ; 4
(declare-fun inv@91@01 ($Ref) $Ref)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@90@01 $Ref) (z2@90@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@90@01 xs@61@01)
      (Set_in z2@90@01 xs@61@01)
      (= z1@90@01 z2@90@01))
    (= z1@90@01 z2@90@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@90@01 $Ref)) (!
  (=>
    (Set_in z@90@01 xs@61@01)
    (and (= (inv@91@01 z@90@01) z@90@01) (img@92@01 z@90@01)))
  :pattern ((Set_in z@90@01 xs@61@01))
  :pattern ((inv@91@01 z@90@01))
  :pattern ((img@92@01 z@90@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@92@01 r) (Set_in (inv@91@01 r) xs@61@01)) (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r) (= r (inv@91@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- $Perm.Write (pTaken@82@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@94@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r) (= r (inv@91@01 r)))
    ($Perm.min
      (ite (= r x@62@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@93@01 r)))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- $Perm.Write (pTaken@82@01 r))
        $Perm.No)
      (pTaken@93@01 r))
    $Perm.No)
  
  :qid |quant-u-72|))))
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
    (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r) (= r (inv@91@01 r)))
    (= (- $Perm.Write (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@94@01 x@62@01)) $Perm.No)))
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
    (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r) (= r (inv@91@01 r)))
    (= (- (- $Perm.Write (pTaken@93@01 r)) (pTaken@94@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@95@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))
      (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r)))
    (=>
      (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r))
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- $Perm.Write (pTaken@82@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef22|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>))) xs@61@01 y@63@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@90@01 $Ref)) (!
  (=>
    (Set_in z@90@01 xs@61@01)
    (and (= (inv@91@01 z@90@01) z@90@01) (img@92@01 z@90@01)))
  :pattern ((Set_in z@90@01 xs@61@01))
  :pattern ((inv@91@01 z@90@01))
  :pattern ((img@92@01 z@90@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@92@01 r) (Set_in (inv@91@01 r) xs@61@01)) (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))
      (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r)))
    (=>
      (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r))
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@91@01 r) xs@61@01) (img@92@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- $Perm.Write (pTaken@82@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef22|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>))) xs@61@01 y@63@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>))) xs@61@01 y@63@01)
  yf@81@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>))) xs@61@01 y@63@01)
  yf@81@01))
; [exec]
; y.f := yf + 1
; [eval] yf + 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@62@01 y@63@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@96@01 ((r $Ref)) $Perm
  (ite
    (= r y@63@01)
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- $Perm.Write (pTaken@82@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@97@01 ((r $Ref)) $Perm
  (ite
    (= r y@63@01)
    ($Perm.min
      (ite (= r x@62@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@96@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- $Perm.Write (pTaken@82@01 r))
        $Perm.No)
      (pTaken@96@01 r))
    $Perm.No)
  
  :qid |quant-u-77|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@96@01 r) $Perm.No)
  
  :qid |quant-u-78|))))
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
  (=> (= r y@63@01) (= (- $Perm.Write (pTaken@96@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@98@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) y@63@01) (+ yf@81@01 1)))
; [exec]
; assert fun1(xs, x) == xf + 1
; [eval] fun1(xs, x) == xf + 1
; [eval] fun1(xs, x)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(declare-const z@99@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@99@01 xs@61@01))
(pop) ; 4
(declare-fun inv@100@01 ($Ref) $Ref)
(declare-fun img@101@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@99@01 $Ref) (z2@99@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@99@01 xs@61@01)
      (Set_in z2@99@01 xs@61@01)
      (= z1@99@01 z2@99@01))
    (= z1@99@01 z2@99@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@99@01 $Ref)) (!
  (=>
    (Set_in z@99@01 xs@61@01)
    (and (= (inv@100@01 z@99@01) z@99@01) (img@101@01 z@99@01)))
  :pattern ((Set_in z@99@01 xs@61@01))
  :pattern ((inv@100@01 z@99@01))
  :pattern ((img@101@01 z@99@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@101@01 r) (Set_in (inv@100@01 r) xs@61@01)) (= (inv@100@01 r) r))
  :pattern ((inv@100@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@102@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r) (= r (inv@100@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@103@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r) (= r (inv@100@01 r)))
    ($Perm.min
      (ite (= r y@63@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@102@01 r)))
    $Perm.No))
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r) (= r (inv@100@01 r)))
    ($Perm.min
      (ite (= r x@62@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@102@01 r)) (pTaken@103@01 r)))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      (pTaken@102@01 r))
    $Perm.No)
  
  :qid |quant-u-82|))))
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
    (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r) (= r (inv@100@01 r)))
    (= (- $Perm.Write (pTaken@102@01 r)) $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@103@01 y@63@01)) $Perm.No)))
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
    (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r) (= r (inv@100@01 r)))
    (= (- (- $Perm.Write (pTaken@102@01 r)) (pTaken@103@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@104@01 x@62@01)) $Perm.No)))
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
    (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r) (= r (inv@100@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@102@01 r)) (pTaken@103@01 r))
        (pTaken@104@01 r))
      $Perm.No))
  
  :qid |quant-u-87|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@105@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@105@01  $FVF<f>)))
      (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r)))
    (=>
      (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r))
      (Set_in r ($FVF.domain_f (as sm@105@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@105@01  $FVF<f>))))
  :qid |qp.fvfDomDef27|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@105@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@105@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@105@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@105@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@105@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@105@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef26|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@105@01  $FVF<f>))) xs@61@01 x@62@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@99@01 $Ref)) (!
  (=>
    (Set_in z@99@01 xs@61@01)
    (and (= (inv@100@01 z@99@01) z@99@01) (img@101@01 z@99@01)))
  :pattern ((Set_in z@99@01 xs@61@01))
  :pattern ((inv@100@01 z@99@01))
  :pattern ((img@101@01 z@99@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@101@01 r) (Set_in (inv@100@01 r) xs@61@01)) (= (inv@100@01 r) r))
  :pattern ((inv@100@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@105@01  $FVF<f>)))
      (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r)))
    (=>
      (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r))
      (Set_in r ($FVF.domain_f (as sm@105@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@105@01  $FVF<f>))))
  :qid |qp.fvfDomDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@105@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@105@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@105@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@105@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@100@01 r) xs@61@01) (img@101@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@105@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@105@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef26|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@105@01  $FVF<f>))) xs@61@01 x@62@01))
; [eval] xf + 1
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@105@01  $FVF<f>))) xs@61@01 x@62@01)
  (+ xf@75@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@105@01  $FVF<f>))) xs@61@01 x@62@01)
  (+ xf@75@01 1)))
; [exec]
; assert fun1(xs, y) == yf
; [eval] fun1(xs, y) == yf
; [eval] fun1(xs, y)
(push) ; 3
; [eval] (x in xs)
(declare-const z@106@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@106@01 xs@61@01))
(pop) ; 4
(declare-fun inv@107@01 ($Ref) $Ref)
(declare-fun img@108@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@106@01 $Ref) (z2@106@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@106@01 xs@61@01)
      (Set_in z2@106@01 xs@61@01)
      (= z1@106@01 z2@106@01))
    (= z1@106@01 z2@106@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@106@01 $Ref)) (!
  (=>
    (Set_in z@106@01 xs@61@01)
    (and (= (inv@107@01 z@106@01) z@106@01) (img@108@01 z@106@01)))
  :pattern ((Set_in z@106@01 xs@61@01))
  :pattern ((inv@107@01 z@106@01))
  :pattern ((img@108@01 z@106@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@108@01 r) (Set_in (inv@107@01 r) xs@61@01)) (= (inv@107@01 r) r))
  :pattern ((inv@107@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@109@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r) (= r (inv@107@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@110@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r) (= r (inv@107@01 r)))
    ($Perm.min
      (ite (= r y@63@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@109@01 r)))
    $Perm.No))
(define-fun pTaken@111@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r) (= r (inv@107@01 r)))
    ($Perm.min
      (ite (= r x@62@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@109@01 r)) (pTaken@110@01 r)))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      (pTaken@109@01 r))
    $Perm.No)
  
  :qid |quant-u-90|))))
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
    (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r) (= r (inv@107@01 r)))
    (= (- $Perm.Write (pTaken@109@01 r)) $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@110@01 y@63@01)) $Perm.No)))
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
    (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r) (= r (inv@107@01 r)))
    (= (- (- $Perm.Write (pTaken@109@01 r)) (pTaken@110@01 r)) $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@111@01 x@62@01)) $Perm.No)))
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
    (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r) (= r (inv@107@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@109@01 r)) (pTaken@110@01 r))
        (pTaken@111@01 r))
      $Perm.No))
  
  :qid |quant-u-95|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@112@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@112@01  $FVF<f>)))
      (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r)))
    (=>
      (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r))
      (Set_in r ($FVF.domain_f (as sm@112@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@112@01  $FVF<f>))))
  :qid |qp.fvfDomDef31|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@112@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@112@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@112@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@112@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@112@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@112@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef30|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@112@01  $FVF<f>))) xs@61@01 y@63@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@106@01 $Ref)) (!
  (=>
    (Set_in z@106@01 xs@61@01)
    (and (= (inv@107@01 z@106@01) z@106@01) (img@108@01 z@106@01)))
  :pattern ((Set_in z@106@01 xs@61@01))
  :pattern ((inv@107@01 z@106@01))
  :pattern ((img@108@01 z@106@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@108@01 r) (Set_in (inv@107@01 r) xs@61@01)) (= (inv@107@01 r) r))
  :pattern ((inv@107@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@112@01  $FVF<f>)))
      (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r)))
    (=>
      (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r))
      (Set_in r ($FVF.domain_f (as sm@112@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@112@01  $FVF<f>))))
  :qid |qp.fvfDomDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@112@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@112@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@112@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@112@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@107@01 r) xs@61@01) (img@108@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@112@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@112@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef30|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@112@01  $FVF<f>))) xs@61@01 y@63@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@112@01  $FVF<f>))) xs@61@01 y@63@01)
  yf@81@01)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@63@01 x@62@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@98@01  $FVF<f>) y@63@01)
    ($FVF.lookup_f (as sm@83@01  $FVF<f>) x@62@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@83@01  $FVF<f>) x@62@01)
    ($FVF.lookup_f (as sm@98@01  $FVF<f>) y@63@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@63@01 x@62@01)) (not (= x@62@01 y@63@01))))
(declare-const sm@113@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@63@01)
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@62@01)
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef34|)))
(declare-const pm@114@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@114@01  $FPM) r)
    (+
      (+
        (ite (= r y@63@01) $Perm.Write $Perm.No)
        (ite (= r x@62@01) $Perm.Write $Perm.No))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (<= ($FVF.perm_f (as pm@114@01  $FPM) y@63@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@114@01  $FPM) x@62@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@114@01  $FPM) r) $Perm.Write)
  :pattern ((inv@66@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun1(xs, y) == yf
; [eval] fun1(xs, y)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(declare-const z@115@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@115@01 xs@61@01))
(pop) ; 4
(declare-fun inv@116@01 ($Ref) $Ref)
(declare-fun img@117@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@115@01 $Ref) (z2@115@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@115@01 xs@61@01)
      (Set_in z2@115@01 xs@61@01)
      (= z1@115@01 z2@115@01))
    (= z1@115@01 z2@115@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@115@01 $Ref)) (!
  (=>
    (Set_in z@115@01 xs@61@01)
    (and (= (inv@116@01 z@115@01) z@115@01) (img@117@01 z@115@01)))
  :pattern ((Set_in z@115@01 xs@61@01))
  :pattern ((inv@116@01 z@115@01))
  :pattern ((img@117@01 z@115@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@117@01 r) (Set_in (inv@116@01 r) xs@61@01)) (= (inv@116@01 r) r))
  :pattern ((inv@116@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@118@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r) (= r (inv@116@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@119@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r) (= r (inv@116@01 r)))
    ($Perm.min
      (ite (= r x@62@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@118@01 r)))
    $Perm.No))
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r) (= r (inv@116@01 r)))
    ($Perm.min
      (ite (= r y@63@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@118@01 r)) (pTaken@119@01 r)))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      (pTaken@118@01 r))
    $Perm.No)
  
  :qid |quant-u-98|))))
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
    (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r) (= r (inv@116@01 r)))
    (= (- $Perm.Write (pTaken@118@01 r)) $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@119@01 x@62@01)) $Perm.No)))
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
    (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r) (= r (inv@116@01 r)))
    (= (- (- $Perm.Write (pTaken@118@01 r)) (pTaken@119@01 r)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@120@01 y@63@01)) $Perm.No)))
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
    (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r) (= r (inv@116@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@118@01 r)) (pTaken@119@01 r))
        (pTaken@120@01 r))
      $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@121@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@121@01  $FVF<f>)))
      (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r)))
    (=>
      (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r))
      (Set_in r ($FVF.domain_f (as sm@121@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@121@01  $FVF<f>))))
  :qid |qp.fvfDomDef39|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef38|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@121@01  $FVF<f>))) xs@61@01 y@63@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@115@01 $Ref)) (!
  (=>
    (Set_in z@115@01 xs@61@01)
    (and (= (inv@116@01 z@115@01) z@115@01) (img@117@01 z@115@01)))
  :pattern ((Set_in z@115@01 xs@61@01))
  :pattern ((inv@116@01 z@115@01))
  :pattern ((img@117@01 z@115@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@117@01 r) (Set_in (inv@116@01 r) xs@61@01)) (= (inv@116@01 r) r))
  :pattern ((inv@116@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@121@01  $FVF<f>)))
      (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r)))
    (=>
      (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r))
      (Set_in r ($FVF.domain_f (as sm@121@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@121@01  $FVF<f>))))
  :qid |qp.fvfDomDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@116@01 r) xs@61@01) (img@117@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@121@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef38|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@121@01  $FVF<f>))) xs@61@01 y@63@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@121@01  $FVF<f>))) xs@61@01 y@63@01)
  yf@81@01)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@63@01 x@62@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@98@01  $FVF<f>) y@63@01)
    ($FVF.lookup_f (as sm@83@01  $FVF<f>) x@62@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@83@01  $FVF<f>) x@62@01)
    ($FVF.lookup_f (as sm@98@01  $FVF<f>) y@63@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@63@01 x@62@01)) (not (= x@62@01 y@63@01))))
(declare-const sm@122@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@63@01)
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@62@01)
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef42|)))
(declare-const pm@123@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@123@01  $FPM) r)
    (+
      (+
        (ite (= r y@63@01) $Perm.Write $Perm.No)
        (ite (= r x@62@01) $Perm.Write $Perm.No))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef43|)))
(assert (<= ($FVF.perm_f (as pm@123@01  $FPM) y@63@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@123@01  $FPM) x@62@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@123@01  $FPM) r) $Perm.Write)
  :pattern ((inv@66@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun1(xs, y) == yf
; [eval] fun1(xs, y)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(declare-const z@124@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@124@01 xs@61@01))
(pop) ; 4
(declare-fun inv@125@01 ($Ref) $Ref)
(declare-fun img@126@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@124@01 $Ref) (z2@124@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@124@01 xs@61@01)
      (Set_in z2@124@01 xs@61@01)
      (= z1@124@01 z2@124@01))
    (= z1@124@01 z2@124@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@124@01 $Ref)) (!
  (=>
    (Set_in z@124@01 xs@61@01)
    (and (= (inv@125@01 z@124@01) z@124@01) (img@126@01 z@124@01)))
  :pattern ((Set_in z@124@01 xs@61@01))
  :pattern ((inv@125@01 z@124@01))
  :pattern ((img@126@01 z@124@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@126@01 r) (Set_in (inv@125@01 r) xs@61@01)) (= (inv@125@01 r) r))
  :pattern ((inv@125@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@127@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r) (= r (inv@125@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@128@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r) (= r (inv@125@01 r)))
    ($Perm.min
      (ite (= r y@63@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@127@01 r)))
    $Perm.No))
(define-fun pTaken@129@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r) (= r (inv@125@01 r)))
    ($Perm.min
      (ite (= r x@62@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@128@01 r)))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      (pTaken@127@01 r))
    $Perm.No)
  
  :qid |quant-u-106|))))
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
    (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r) (= r (inv@125@01 r)))
    (= (- $Perm.Write (pTaken@127@01 r)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@128@01 y@63@01)) $Perm.No)))
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
    (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r) (= r (inv@125@01 r)))
    (= (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@128@01 r)) $Perm.No))
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@129@01 x@62@01)) $Perm.No)))
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
    (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r) (= r (inv@125@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@128@01 r))
        (pTaken@129@01 r))
      $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@130@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@130@01  $FVF<f>)))
      (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r)))
    (=>
      (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r))
      (Set_in r ($FVF.domain_f (as sm@130@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@130@01  $FVF<f>))))
  :qid |qp.fvfDomDef47|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@130@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@130@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@130@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@130@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@130@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@130@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef46|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@130@01  $FVF<f>))) xs@61@01 y@63@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@124@01 $Ref)) (!
  (=>
    (Set_in z@124@01 xs@61@01)
    (and (= (inv@125@01 z@124@01) z@124@01) (img@126@01 z@124@01)))
  :pattern ((Set_in z@124@01 xs@61@01))
  :pattern ((inv@125@01 z@124@01))
  :pattern ((img@126@01 z@124@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@126@01 r) (Set_in (inv@125@01 r) xs@61@01)) (= (inv@125@01 r) r))
  :pattern ((inv@125@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@130@01  $FVF<f>)))
      (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r)))
    (=>
      (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r))
      (Set_in r ($FVF.domain_f (as sm@130@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@130@01  $FVF<f>))))
  :qid |qp.fvfDomDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@130@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@130@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@130@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@130@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@125@01 r) xs@61@01) (img@126@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@130@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@130@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef46|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@130@01  $FVF<f>))) xs@61@01 y@63@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@130@01  $FVF<f>))) xs@61@01 y@63@01)
  yf@81@01)))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@63@01 x@62@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@98@01  $FVF<f>) y@63@01)
    ($FVF.lookup_f (as sm@83@01  $FVF<f>) x@62@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($FVF.lookup_f (as sm@83@01  $FVF<f>) x@62@01)
    ($FVF.lookup_f (as sm@98@01  $FVF<f>) y@63@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= y@63@01 x@62@01)) (not (= x@62@01 y@63@01))))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] fun1(xs, y) == yf
; [eval] fun1(xs, y)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(declare-const z@131@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@131@01 xs@61@01))
(pop) ; 4
(declare-fun inv@132@01 ($Ref) $Ref)
(declare-fun img@133@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@131@01 $Ref) (z2@131@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@131@01 xs@61@01)
      (Set_in z2@131@01 xs@61@01)
      (= z1@131@01 z2@131@01))
    (= z1@131@01 z2@131@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@131@01 $Ref)) (!
  (=>
    (Set_in z@131@01 xs@61@01)
    (and (= (inv@132@01 z@131@01) z@131@01) (img@133@01 z@131@01)))
  :pattern ((Set_in z@131@01 xs@61@01))
  :pattern ((inv@132@01 z@131@01))
  :pattern ((img@133@01 z@131@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@133@01 r) (Set_in (inv@132@01 r) xs@61@01)) (= (inv@132@01 r) r))
  :pattern ((inv@132@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@134@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r) (= r (inv@132@01 r)))
    ($Perm.min
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@135@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r) (= r (inv@132@01 r)))
    ($Perm.min
      (ite (= r x@62@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@134@01 r)))
    $Perm.No))
(define-fun pTaken@136@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r) (= r (inv@132@01 r)))
    ($Perm.min
      (ite (= r y@63@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@134@01 r)) (pTaken@135@01 r)))
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
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r))
        $Perm.No)
      (pTaken@134@01 r))
    $Perm.No)
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r) (= r (inv@132@01 r)))
    (= (- $Perm.Write (pTaken@134@01 r)) $Perm.No))
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@135@01 x@62@01)) $Perm.No)))
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
    (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r) (= r (inv@132@01 r)))
    (= (- (- $Perm.Write (pTaken@134@01 r)) (pTaken@135@01 r)) $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@136@01 y@63@01)) $Perm.No)))
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
    (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r) (= r (inv@132@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@134@01 r)) (pTaken@135@01 r))
        (pTaken@136@01 r))
      $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unsat
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@137@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@137@01  $FVF<f>)))
      (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r)))
    (=>
      (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r))
      (Set_in r ($FVF.domain_f (as sm@137@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@137@01  $FVF<f>))))
  :qid |qp.fvfDomDef51|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@137@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@137@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@137@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef50|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@137@01  $FVF<f>))) xs@61@01 y@63@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@131@01 $Ref)) (!
  (=>
    (Set_in z@131@01 xs@61@01)
    (and (= (inv@132@01 z@131@01) z@131@01) (img@133@01 z@131@01)))
  :pattern ((Set_in z@131@01 xs@61@01))
  :pattern ((inv@132@01 z@131@01))
  :pattern ((img@133@01 z@131@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@133@01 r) (Set_in (inv@132@01 r) xs@61@01)) (= (inv@132@01 r) r))
  :pattern ((inv@132@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@137@01  $FVF<f>)))
      (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r)))
    (=>
      (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r))
      (Set_in r ($FVF.domain_f (as sm@137@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@137@01  $FVF<f>))))
  :qid |qp.fvfDomDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r))
      (ite
        (and (img@67@01 r) (Set_in (inv@66@01 r) xs@61@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@82@01 r)) (pTaken@96@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@137@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@64@01)))) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r)) (= r x@62@01))
    (=
      ($FVF.lookup_f (as sm@137@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@132@01 r) xs@61@01) (img@133@01 r)) (= r y@63@01))
    (=
      ($FVF.lookup_f (as sm@137@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef50|)))
(assert (fun1%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@137@01  $FVF<f>))) xs@61@01 y@63@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun1 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@137@01  $FVF<f>))) xs@61@01 y@63@01)
  yf@81@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const xs@138@01 Set<$Ref>)
(declare-const x@139@01 $Ref)
(declare-const xs@140@01 Set<$Ref>)
(declare-const x@141@01 $Ref)
(push) ; 1
(declare-const $t@142@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@143@01 Int)
; [exec]
; var b: Int
(declare-const b@144@01 Int)
; [exec]
; a := fun2(xs, x)
; [eval] fun2(xs, x)
(push) ; 3
(assert (fun2%precondition $t@142@01 xs@140@01 x@141@01))
(pop) ; 3
; Joined path conditions
(assert (fun2%precondition $t@142@01 xs@140@01 x@141@01))
(declare-const a@145@01 Int)
(assert (= a@145@01 (fun2 $t@142@01 xs@140@01 x@141@01)))
; [exec]
; assert a == fun2(xs, x)
; [eval] a == fun2(xs, x)
; [eval] fun2(xs, x)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [exec]
; unfold acc(P(xs, x), write)
(assert (= $t@142@01 ($Snap.combine ($Snap.first $t@142@01) ($Snap.second $t@142@01))))
(assert (= ($Snap.first $t@142@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@141@01 xs@140@01))
(declare-const z@146@01 $Ref)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@146@01 xs@140@01))
(pop) ; 3
(declare-fun inv@147@01 ($Ref) $Ref)
(declare-fun img@148@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@146@01 $Ref) (z2@146@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@146@01 xs@140@01)
      (Set_in z2@146@01 xs@140@01)
      (= z1@146@01 z2@146@01))
    (= z1@146@01 z2@146@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@146@01 $Ref)) (!
  (=>
    (Set_in z@146@01 xs@140@01)
    (and (= (inv@147@01 z@146@01) z@146@01) (img@148@01 z@146@01)))
  :pattern ((Set_in z@146@01 xs@140@01))
  :pattern ((inv@147@01 z@146@01))
  :pattern ((img@148@01 z@146@01))
  :qid |quant-u-121|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@148@01 r) (Set_in (inv@147@01 r) xs@140@01))
    (= (inv@147@01 r) r))
  :pattern ((inv@147@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@146@01 $Ref)) (!
  (=> (Set_in z@146@01 xs@140@01) (not (= z@146@01 $Ref.null)))
  :pattern ((Set_in z@146@01 xs@140@01))
  :pattern ((inv@147@01 z@146@01))
  :pattern ((img@148@01 z@146@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P%trigger $t@142@01 xs@140@01 x@141@01))
; [exec]
; fold acc(P(xs, x), write)
; [eval] (x in xs)
(declare-const z@149@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@149@01 xs@140@01))
(pop) ; 3
(declare-fun inv@150@01 ($Ref) $Ref)
(declare-fun img@151@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@149@01 $Ref) (z2@149@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@149@01 xs@140@01)
      (Set_in z2@149@01 xs@140@01)
      (= z1@149@01 z2@149@01))
    (= z1@149@01 z2@149@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@149@01 $Ref)) (!
  (=>
    (Set_in z@149@01 xs@140@01)
    (and (= (inv@150@01 z@149@01) z@149@01) (img@151@01 z@149@01)))
  :pattern ((Set_in z@149@01 xs@140@01))
  :pattern ((inv@150@01 z@149@01))
  :pattern ((img@151@01 z@149@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@151@01 r) (Set_in (inv@150@01 r) xs@140@01))
    (= (inv@150@01 r) r))
  :pattern ((inv@150@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@152@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@150@01 r) xs@140@01) (img@151@01 r) (= r (inv@150@01 r)))
    ($Perm.min
      (ite
        (and (img@148@01 r) (Set_in (inv@147@01 r) xs@140@01))
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
        (and (img@148@01 r) (Set_in (inv@147@01 r) xs@140@01))
        $Perm.Write
        $Perm.No)
      (pTaken@152@01 r))
    $Perm.No)
  
  :qid |quant-u-124|))))
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
    (and (Set_in (inv@150@01 r) xs@140@01) (img@151@01 r) (= r (inv@150@01 r)))
    (= (- $Perm.Write (pTaken@152@01 r)) $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@153@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@153@01  $FVF<f>)))
      (and (Set_in (inv@150@01 r) xs@140@01) (img@151@01 r)))
    (=>
      (and (Set_in (inv@150@01 r) xs@140@01) (img@151@01 r))
      (Set_in r ($FVF.domain_f (as sm@153@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@153@01  $FVF<f>))))
  :qid |qp.fvfDomDef53|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@150@01 r) xs@140@01) (img@151@01 r))
      (and (img@148@01 r) (Set_in (inv@147@01 r) xs@140@01)))
    (=
      ($FVF.lookup_f (as sm@153@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@142@01)) r)))
  :pattern (($FVF.lookup_f (as sm@153@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@142@01)) r))
  :qid |qp.fvfValDef52|)))
(assert (P%trigger ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@153@01  $FVF<f>))) xs@140@01 x@141@01))
; [exec]
; b := fun2(xs, x)
; [eval] fun2(xs, x)
(set-option :timeout 0)
(push) ; 3
(assert (fun2%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@153@01  $FVF<f>))) xs@140@01 x@141@01))
(pop) ; 3
; Joined path conditions
(assert (fun2%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@153@01  $FVF<f>))) xs@140@01 x@141@01))
(declare-const b@154@01 Int)
(assert (=
  b@154@01
  (fun2 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@153@01  $FVF<f>))) xs@140@01 x@141@01)))
; [exec]
; assert b == fun2(xs, x)
; [eval] b == fun2(xs, x)
; [eval] fun2(xs, x)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [exec]
; assert a == b
; [eval] a == b
(push) ; 3
(assert (not (= a@145@01 b@154@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= a@145@01 b@154@01))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const xs@155@01 Set<$Ref>)
(declare-const x@156@01 $Ref)
(declare-const xs@157@01 Set<$Ref>)
(declare-const x@158@01 $Ref)
(push) ; 1
(declare-const $t@159@01 $Snap)
(assert (= $t@159@01 ($Snap.combine ($Snap.first $t@159@01) ($Snap.second $t@159@01))))
(assert (= ($Snap.first $t@159@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@158@01 xs@157@01))
(declare-const z@160@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@160@01 xs@157@01))
(pop) ; 2
(declare-fun inv@161@01 ($Ref) $Ref)
(declare-fun img@162@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@160@01 $Ref) (z2@160@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@160@01 xs@157@01)
      (Set_in z2@160@01 xs@157@01)
      (= z1@160@01 z2@160@01))
    (= z1@160@01 z2@160@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@160@01 $Ref)) (!
  (=>
    (Set_in z@160@01 xs@157@01)
    (and (= (inv@161@01 z@160@01) z@160@01) (img@162@01 z@160@01)))
  :pattern ((Set_in z@160@01 xs@157@01))
  :pattern ((inv@161@01 z@160@01))
  :pattern ((img@162@01 z@160@01))
  :qid |quant-u-127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@162@01 r) (Set_in (inv@161@01 r) xs@157@01))
    (= (inv@161@01 r) r))
  :pattern ((inv@161@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@160@01 $Ref)) (!
  (=> (Set_in z@160@01 xs@157@01) (not (= z@160@01 $Ref.null)))
  :pattern ((Set_in z@160@01 xs@157@01))
  :pattern ((inv@161@01 z@160@01))
  :pattern ((img@162@01 z@160@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var a: Int
(declare-const a@163@01 Int)
; [exec]
; var b: Int
(declare-const b@164@01 Int)
; [exec]
; fold acc(P(xs, x), write)
; [eval] (x in xs)
(declare-const z@165@01 $Ref)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@165@01 xs@157@01))
(pop) ; 3
(declare-fun inv@166@01 ($Ref) $Ref)
(declare-fun img@167@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@165@01 $Ref) (z2@165@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@165@01 xs@157@01)
      (Set_in z2@165@01 xs@157@01)
      (= z1@165@01 z2@165@01))
    (= z1@165@01 z2@165@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@165@01 $Ref)) (!
  (=>
    (Set_in z@165@01 xs@157@01)
    (and (= (inv@166@01 z@165@01) z@165@01) (img@167@01 z@165@01)))
  :pattern ((Set_in z@165@01 xs@157@01))
  :pattern ((inv@166@01 z@165@01))
  :pattern ((img@167@01 z@165@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@167@01 r) (Set_in (inv@166@01 r) xs@157@01))
    (= (inv@166@01 r) r))
  :pattern ((inv@166@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@168@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@166@01 r) xs@157@01) (img@167@01 r) (= r (inv@166@01 r)))
    ($Perm.min
      (ite
        (and (img@162@01 r) (Set_in (inv@161@01 r) xs@157@01))
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
        (and (img@162@01 r) (Set_in (inv@161@01 r) xs@157@01))
        $Perm.Write
        $Perm.No)
      (pTaken@168@01 r))
    $Perm.No)
  
  :qid |quant-u-130|))))
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
    (and (Set_in (inv@166@01 r) xs@157@01) (img@167@01 r) (= r (inv@166@01 r)))
    (= (- $Perm.Write (pTaken@168@01 r)) $Perm.No))
  
  :qid |quant-u-131|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@169@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@169@01  $FVF<f>)))
      (and (Set_in (inv@166@01 r) xs@157@01) (img@167@01 r)))
    (=>
      (and (Set_in (inv@166@01 r) xs@157@01) (img@167@01 r))
      (Set_in r ($FVF.domain_f (as sm@169@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@169@01  $FVF<f>))))
  :qid |qp.fvfDomDef55|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@166@01 r) xs@157@01) (img@167@01 r))
      (and (img@162@01 r) (Set_in (inv@161@01 r) xs@157@01)))
    (=
      ($FVF.lookup_f (as sm@169@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@159@01)) r)))
  :pattern (($FVF.lookup_f (as sm@169@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@159@01)) r))
  :qid |qp.fvfValDef54|)))
(assert (P%trigger ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@169@01  $FVF<f>))) xs@157@01 x@158@01))
; [exec]
; a := fun2(xs, x)
; [eval] fun2(xs, x)
(set-option :timeout 0)
(push) ; 3
(assert (fun2%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@169@01  $FVF<f>))) xs@157@01 x@158@01))
(pop) ; 3
; Joined path conditions
(assert (fun2%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@169@01  $FVF<f>))) xs@157@01 x@158@01))
(declare-const a@170@01 Int)
(assert (=
  a@170@01
  (fun2 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@169@01  $FVF<f>))) xs@157@01 x@158@01)))
; [exec]
; assert a == fun2(xs, x)
; [eval] a == fun2(xs, x)
; [eval] fun2(xs, x)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [exec]
; unfold acc(P(xs, x), write)
; [eval] (x in xs)
(declare-const z@171@01 $Ref)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@171@01 xs@157@01))
(pop) ; 3
(declare-fun inv@172@01 ($Ref) $Ref)
(declare-fun img@173@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@171@01 $Ref) (z2@171@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@171@01 xs@157@01)
      (Set_in z2@171@01 xs@157@01)
      (= z1@171@01 z2@171@01))
    (= z1@171@01 z2@171@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@171@01 $Ref)) (!
  (=>
    (Set_in z@171@01 xs@157@01)
    (and (= (inv@172@01 z@171@01) z@171@01) (img@173@01 z@171@01)))
  :pattern ((Set_in z@171@01 xs@157@01))
  :pattern ((inv@172@01 z@171@01))
  :pattern ((img@173@01 z@171@01))
  :qid |quant-u-133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@173@01 r) (Set_in (inv@172@01 r) xs@157@01))
    (= (inv@172@01 r) r))
  :pattern ((inv@172@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@171@01 $Ref)) (!
  (=> (Set_in z@171@01 xs@157@01) (not (= z@171@01 $Ref.null)))
  :pattern ((Set_in z@171@01 xs@157@01))
  :pattern ((inv@172@01 z@171@01))
  :pattern ((img@173@01 z@171@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; fold acc(P(xs, x), write)
; [eval] (x in xs)
(declare-const z@174@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@174@01 xs@157@01))
(pop) ; 3
(declare-fun inv@175@01 ($Ref) $Ref)
(declare-fun img@176@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@174@01 $Ref) (z2@174@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@174@01 xs@157@01)
      (Set_in z2@174@01 xs@157@01)
      (= z1@174@01 z2@174@01))
    (= z1@174@01 z2@174@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@174@01 $Ref)) (!
  (=>
    (Set_in z@174@01 xs@157@01)
    (and (= (inv@175@01 z@174@01) z@174@01) (img@176@01 z@174@01)))
  :pattern ((Set_in z@174@01 xs@157@01))
  :pattern ((inv@175@01 z@174@01))
  :pattern ((img@176@01 z@174@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@176@01 r) (Set_in (inv@175@01 r) xs@157@01))
    (= (inv@175@01 r) r))
  :pattern ((inv@175@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@177@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@175@01 r) xs@157@01) (img@176@01 r) (= r (inv@175@01 r)))
    ($Perm.min
      (ite
        (and (img@173@01 r) (Set_in (inv@172@01 r) xs@157@01))
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
        (and (img@173@01 r) (Set_in (inv@172@01 r) xs@157@01))
        $Perm.Write
        $Perm.No)
      (pTaken@177@01 r))
    $Perm.No)
  
  :qid |quant-u-136|))))
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
    (and (Set_in (inv@175@01 r) xs@157@01) (img@176@01 r) (= r (inv@175@01 r)))
    (= (- $Perm.Write (pTaken@177@01 r)) $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@178@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@178@01  $FVF<f>)))
      (and (Set_in (inv@175@01 r) xs@157@01) (img@176@01 r)))
    (=>
      (and (Set_in (inv@175@01 r) xs@157@01) (img@176@01 r))
      (Set_in r ($FVF.domain_f (as sm@178@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@178@01  $FVF<f>))))
  :qid |qp.fvfDomDef57|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@175@01 r) xs@157@01) (img@176@01 r))
      (and (img@173@01 r) (Set_in (inv@172@01 r) xs@157@01)))
    (=
      ($FVF.lookup_f (as sm@178@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@169@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@178@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@169@01  $FVF<f>) r))
  :qid |qp.fvfValDef56|)))
(assert (P%trigger ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@178@01  $FVF<f>))) xs@157@01 x@158@01))
; [exec]
; b := fun2(xs, x)
; [eval] fun2(xs, x)
(set-option :timeout 0)
(push) ; 3
(assert (fun2%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@178@01  $FVF<f>))) xs@157@01 x@158@01))
(pop) ; 3
; Joined path conditions
(assert (fun2%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@178@01  $FVF<f>))) xs@157@01 x@158@01))
(declare-const b@179@01 Int)
(assert (=
  b@179@01
  (fun2 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@178@01  $FVF<f>))) xs@157@01 x@158@01)))
; [exec]
; assert b == fun2(xs, x)
; [eval] b == fun2(xs, x)
; [eval] fun2(xs, x)
(push) ; 3
(pop) ; 3
; Joined path conditions
; [exec]
; assert a == b
; [eval] a == b
(push) ; 3
(assert (not (= a@170@01 b@179@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= a@170@01 b@179@01))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
