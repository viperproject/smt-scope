(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:41
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/snapshots2.vpr
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
(declare-fun fun ($Snap Set<$Ref> $Ref Int) Int)
(declare-fun fun%limited ($Snap Set<$Ref> $Ref Int) Int)
(declare-fun fun%stateless (Set<$Ref> $Ref Int) Bool)
(declare-fun fun%precondition ($Snap Set<$Ref> $Ref Int) Bool)
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
(declare-fun inv@5@00 ($Snap Set<$Ref> $Ref Int $Ref) $Ref)
(declare-fun img@6@00 ($Snap Set<$Ref> $Ref Int $Ref) Bool)
(declare-fun inv@8@00 ($Snap Set<$Ref> $Ref Int $Ref) $Ref)
(declare-fun img@9@00 ($Snap Set<$Ref> $Ref Int $Ref) Bool)
(declare-fun sm@10@00 ($Snap Set<$Ref> $Ref Int) $FVF<f>)
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref) (n@2@00 Int)) (!
  (= (fun%limited s@$ xs@0@00 x@1@00 n@2@00) (fun s@$ xs@0@00 x@1@00 n@2@00))
  :pattern ((fun s@$ xs@0@00 x@1@00 n@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref) (n@2@00 Int)) (!
  (fun%stateless xs@0@00 x@1@00 n@2@00)
  :pattern ((fun%limited s@$ xs@0@00 x@1@00 n@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref) (n@2@00 Int)) (!
  (and
    (forall ((z@4@00 $Ref)) (!
      (=>
        (Set_in z@4@00 xs@0@00)
        (and
          (= (inv@5@00 s@$ xs@0@00 x@1@00 n@2@00 z@4@00) z@4@00)
          (img@6@00 s@$ xs@0@00 x@1@00 n@2@00 z@4@00)))
      :pattern ((Set_in z@4@00 xs@0@00))
      :pattern ((inv@5@00 s@$ xs@0@00 x@1@00 n@2@00 z@4@00))
      :pattern ((img@6@00 s@$ xs@0@00 x@1@00 n@2@00 z@4@00))
      :qid |quant-u-3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@6@00 s@$ xs@0@00 x@1@00 n@2@00 r)
          (Set_in (inv@5@00 s@$ xs@0@00 x@1@00 n@2@00 r) xs@0@00))
        (= (inv@5@00 s@$ xs@0@00 x@1@00 n@2@00 r) r))
      :pattern ((inv@5@00 s@$ xs@0@00 x@1@00 n@2@00 r))
      :qid |f-fctOfInv|))
    (forall ((z@7@00 $Ref)) (!
      (=>
        (Set_in z@7@00 xs@0@00)
        (and
          (= (inv@8@00 s@$ xs@0@00 x@1@00 n@2@00 z@7@00) z@7@00)
          (img@9@00 s@$ xs@0@00 x@1@00 n@2@00 z@7@00)))
      :pattern ((Set_in z@7@00 xs@0@00))
      :pattern ((inv@8@00 s@$ xs@0@00 x@1@00 n@2@00 z@7@00))
      :pattern ((img@9@00 s@$ xs@0@00 x@1@00 n@2@00 z@7@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@9@00 s@$ xs@0@00 x@1@00 n@2@00 r)
          (Set_in (inv@8@00 s@$ xs@0@00 x@1@00 n@2@00 r) xs@0@00))
        (= (inv@8@00 s@$ xs@0@00 x@1@00 n@2@00 r) r))
      :pattern ((inv@8@00 s@$ xs@0@00 x@1@00 n@2@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@10@00 s@$ xs@0@00 x@1@00 n@2@00)))
          (and
            (Set_in (inv@8@00 s@$ xs@0@00 x@1@00 n@2@00 r) xs@0@00)
            (img@9@00 s@$ xs@0@00 x@1@00 n@2@00 r)))
        (=>
          (and
            (Set_in (inv@8@00 s@$ xs@0@00 x@1@00 n@2@00 r) xs@0@00)
            (img@9@00 s@$ xs@0@00 x@1@00 n@2@00 r))
          (Set_in r ($FVF.domain_f (sm@10@00 s@$ xs@0@00 x@1@00 n@2@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@10@00 s@$ xs@0@00 x@1@00 n@2@00))))
      :qid |qp.fvfDomDef1|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (Set_in (inv@8@00 s@$ xs@0@00 x@1@00 n@2@00 r) xs@0@00)
            (img@9@00 s@$ xs@0@00 x@1@00 n@2@00 r))
          (and
            (img@6@00 s@$ xs@0@00 x@1@00 n@2@00 r)
            (Set_in (inv@5@00 s@$ xs@0@00 x@1@00 n@2@00 r) xs@0@00)))
        (=
          ($FVF.lookup_f (sm@10@00 s@$ xs@0@00 x@1@00 n@2@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) r)))
      :pattern (($FVF.lookup_f (sm@10@00 s@$ xs@0@00 x@1@00 n@2@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) r))
      :qid |qp.fvfValDef0|))
    (=>
      (fun%precondition s@$ xs@0@00 x@1@00 n@2@00)
      (=
        (fun s@$ xs@0@00 x@1@00 n@2@00)
        (ite
          (= n@2@00 0)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) x@1@00)
          (fun%limited ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (sm@10@00 s@$ xs@0@00 x@1@00 n@2@00))
            ($Snap.combine $Snap.unit $Snap.unit)) xs@0@00 x@1@00 (- n@2@00 1))))))
  :pattern ((fun s@$ xs@0@00 x@1@00 n@2@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (x@1@00 $Ref) (n@2@00 Int)) (!
  (=>
    (fun%precondition s@$ xs@0@00 x@1@00 n@2@00)
    (ite
      (= n@2@00 0)
      true
      (fun%precondition ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (sm@10@00 s@$ xs@0@00 x@1@00 n@2@00))
        ($Snap.combine $Snap.unit $Snap.unit)) xs@0@00 x@1@00 (- n@2@00 1))))
  :pattern ((fun s@$ xs@0@00 x@1@00 n@2@00))
  :qid |quant-u-9|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const x@1@01 $Ref)
(declare-const n@2@01 Int)
(declare-const xs@3@01 Set<$Ref>)
(declare-const x@4@01 $Ref)
(declare-const n@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(declare-const z@7@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@7@01 xs@3@01))
(pop) ; 2
(declare-fun inv@8@01 ($Ref) $Ref)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@7@01 $Ref) (z2@7@01 $Ref)) (!
  (=>
    (and (Set_in z1@7@01 xs@3@01) (Set_in z2@7@01 xs@3@01) (= z1@7@01 z2@7@01))
    (= z1@7@01 z2@7@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@7@01 $Ref)) (!
  (=>
    (Set_in z@7@01 xs@3@01)
    (and (= (inv@8@01 z@7@01) z@7@01) (img@9@01 z@7@01)))
  :pattern ((Set_in z@7@01 xs@3@01))
  :pattern ((inv@8@01 z@7@01))
  :pattern ((img@9@01 z@7@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)) (= (inv@8@01 r) r))
  :pattern ((inv@8@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@7@01 $Ref)) (!
  (=> (Set_in z@7@01 xs@3@01) (not (= z@7@01 $Ref.null)))
  :pattern ((Set_in z@7@01 xs@3@01))
  :pattern ((inv@8@01 z@7@01))
  :pattern ((img@9@01 z@7@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@4@01 xs@3@01))
(assert (= ($Snap.second ($Snap.second $t@6@01)) $Snap.unit))
; [eval] n >= 0
(assert (>= n@5@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var v: Int
(declare-const v@10@01 Int)
; [exec]
; v := fun(xs, x, n)
; [eval] fun(xs, x, n)
(push) ; 3
(declare-const z@11@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@11@01 xs@3@01))
(pop) ; 4
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@11@01 $Ref) (z2@11@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@11@01 xs@3@01)
      (Set_in z2@11@01 xs@3@01)
      (= z1@11@01 z2@11@01))
    (= z1@11@01 z2@11@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@11@01 $Ref)) (!
  (=>
    (Set_in z@11@01 xs@3@01)
    (and (= (inv@12@01 z@11@01) z@11@01) (img@13@01 z@11@01)))
  :pattern ((Set_in z@11@01 xs@3@01))
  :pattern ((inv@12@01 z@11@01))
  :pattern ((img@13@01 z@11@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@13@01 r) (Set_in (inv@12@01 r) xs@3@01)) (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@14@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@12@01 r) xs@3@01) (img@13@01 r) (= r (inv@12@01 r)))
    ($Perm.min
      (ite (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)) $Perm.Write $Perm.No)
      (pTaken@14@01 r))
    $Perm.No)
  
  :qid |quant-u-14|))))
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
    (and (Set_in (inv@12@01 r) xs@3@01) (img@13@01 r) (= r (inv@12@01 r)))
    (= (- $Perm.Write (pTaken@14@01 r)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@15@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))
      (and (Set_in (inv@12@01 r) xs@3@01) (img@13@01 r)))
    (=>
      (and (Set_in (inv@12@01 r) xs@3@01) (img@13@01 r))
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@12@01 r) xs@3@01) (img@13@01 r))
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)))
    (=
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef0|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@3@01 x@4@01 n@5@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@11@01 $Ref)) (!
  (=>
    (Set_in z@11@01 xs@3@01)
    (and (= (inv@12@01 z@11@01) z@11@01) (img@13@01 z@11@01)))
  :pattern ((Set_in z@11@01 xs@3@01))
  :pattern ((inv@12@01 z@11@01))
  :pattern ((img@13@01 z@11@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@13@01 r) (Set_in (inv@12@01 r) xs@3@01)) (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))
      (and (Set_in (inv@12@01 r) xs@3@01) (img@13@01 r)))
    (=>
      (and (Set_in (inv@12@01 r) xs@3@01) (img@13@01 r))
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@12@01 r) xs@3@01) (img@13@01 r))
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)))
    (=
      ($FVF.lookup_f (as sm@15@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef0|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@3@01 x@4@01 n@5@01))
(declare-const v@16@01 Int)
(assert (=
  v@16@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@3@01 x@4@01 n@5@01)))
; [exec]
; assert v == fun(xs, x, n)
; [eval] v == fun(xs, x, n)
; [eval] fun(xs, x, n)
(set-option :timeout 0)
(push) ; 3
(declare-const z@17@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@17@01 xs@3@01))
(pop) ; 4
(declare-fun inv@18@01 ($Ref) $Ref)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@17@01 $Ref) (z2@17@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@17@01 xs@3@01)
      (Set_in z2@17@01 xs@3@01)
      (= z1@17@01 z2@17@01))
    (= z1@17@01 z2@17@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@17@01 $Ref)) (!
  (=>
    (Set_in z@17@01 xs@3@01)
    (and (= (inv@18@01 z@17@01) z@17@01) (img@19@01 z@17@01)))
  :pattern ((Set_in z@17@01 xs@3@01))
  :pattern ((inv@18@01 z@17@01))
  :pattern ((img@19@01 z@17@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@19@01 r) (Set_in (inv@18@01 r) xs@3@01)) (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@18@01 r) xs@3@01) (img@19@01 r) (= r (inv@18@01 r)))
    ($Perm.min
      (ite (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)) $Perm.Write $Perm.No)
      (pTaken@20@01 r))
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
    (and (Set_in (inv@18@01 r) xs@3@01) (img@19@01 r) (= r (inv@18@01 r)))
    (= (- $Perm.Write (pTaken@20@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@21@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))
      (and (Set_in (inv@18@01 r) xs@3@01) (img@19@01 r)))
    (=>
      (and (Set_in (inv@18@01 r) xs@3@01) (img@19@01 r))
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@18@01 r) xs@3@01) (img@19@01 r))
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef2|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@3@01 x@4@01 n@5@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@17@01 $Ref)) (!
  (=>
    (Set_in z@17@01 xs@3@01)
    (and (= (inv@18@01 z@17@01) z@17@01) (img@19@01 z@17@01)))
  :pattern ((Set_in z@17@01 xs@3@01))
  :pattern ((inv@18@01 z@17@01))
  :pattern ((img@19@01 z@17@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@19@01 r) (Set_in (inv@18@01 r) xs@3@01)) (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))
      (and (Set_in (inv@18@01 r) xs@3@01) (img@19@01 r)))
    (=>
      (and (Set_in (inv@18@01 r) xs@3@01) (img@19@01 r))
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@18@01 r) xs@3@01) (img@19@01 r))
      (and (img@9@01 r) (Set_in (inv@8@01 r) xs@3@01)))
    (=
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@3@01 x@4@01 n@5@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@16@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@3@01 x@4@01 n@5@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v@16@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@3@01 x@4@01 n@5@01)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@22@01 Set<$Ref>)
(declare-const x@23@01 $Ref)
(declare-const y@24@01 $Ref)
(declare-const n@25@01 Int)
(declare-const xs@26@01 Set<$Ref>)
(declare-const x@27@01 $Ref)
(declare-const y@28@01 $Ref)
(declare-const n@29@01 Int)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(declare-const z@31@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@31@01 xs@26@01))
(pop) ; 2
(declare-fun inv@32@01 ($Ref) $Ref)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@31@01 $Ref) (z2@31@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@31@01 xs@26@01)
      (Set_in z2@31@01 xs@26@01)
      (= z1@31@01 z2@31@01))
    (= z1@31@01 z2@31@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@31@01 $Ref)) (!
  (=>
    (Set_in z@31@01 xs@26@01)
    (and (= (inv@32@01 z@31@01) z@31@01) (img@33@01 z@31@01)))
  :pattern ((Set_in z@31@01 xs@26@01))
  :pattern ((inv@32@01 z@31@01))
  :pattern ((img@33@01 z@31@01))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01)) (= (inv@32@01 r) r))
  :pattern ((inv@32@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@31@01 $Ref)) (!
  (=> (Set_in z@31@01 xs@26@01) (not (= z@31@01 $Ref.null)))
  :pattern ((Set_in z@31@01 xs@26@01))
  :pattern ((inv@32@01 z@31@01))
  :pattern ((img@33@01 z@31@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(assert (= ($Snap.first ($Snap.second $t@30@01)) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@27@01 xs@26@01))
(assert (=
  ($Snap.second ($Snap.second $t@30@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@30@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@30@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@30@01))) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@28@01 xs@26@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@30@01))) $Snap.unit))
; [eval] n >= 0
(assert (>= n@29@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var v: Int
(declare-const v@34@01 Int)
; [exec]
; v := fun(xs, x, n)
; [eval] fun(xs, x, n)
(push) ; 3
(declare-const z@35@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@35@01 xs@26@01))
(pop) ; 4
(declare-fun inv@36@01 ($Ref) $Ref)
(declare-fun img@37@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@35@01 $Ref) (z2@35@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@35@01 xs@26@01)
      (Set_in z2@35@01 xs@26@01)
      (= z1@35@01 z2@35@01))
    (= z1@35@01 z2@35@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@35@01 $Ref)) (!
  (=>
    (Set_in z@35@01 xs@26@01)
    (and (= (inv@36@01 z@35@01) z@35@01) (img@37@01 z@35@01)))
  :pattern ((Set_in z@35@01 xs@26@01))
  :pattern ((inv@36@01 z@35@01))
  :pattern ((img@37@01 z@35@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@37@01 r) (Set_in (inv@36@01 r) xs@26@01)) (= (inv@36@01 r) r))
  :pattern ((inv@36@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@38@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@36@01 r) xs@26@01) (img@37@01 r) (= r (inv@36@01 r)))
    ($Perm.min
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
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
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        $Perm.Write
        $Perm.No)
      (pTaken@38@01 r))
    $Perm.No)
  
  :qid |quant-u-24|))))
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
    (and (Set_in (inv@36@01 r) xs@26@01) (img@37@01 r) (= r (inv@36@01 r)))
    (= (- $Perm.Write (pTaken@38@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@39@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@39@01  $FVF<f>)))
      (and (Set_in (inv@36@01 r) xs@26@01) (img@37@01 r)))
    (=>
      (and (Set_in (inv@36@01 r) xs@26@01) (img@37@01 r))
      (Set_in r ($FVF.domain_f (as sm@39@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@39@01  $FVF<f>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@36@01 r) xs@26@01) (img@37@01 r))
      (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01)))
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef4|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@39@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@35@01 $Ref)) (!
  (=>
    (Set_in z@35@01 xs@26@01)
    (and (= (inv@36@01 z@35@01) z@35@01) (img@37@01 z@35@01)))
  :pattern ((Set_in z@35@01 xs@26@01))
  :pattern ((inv@36@01 z@35@01))
  :pattern ((img@37@01 z@35@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@37@01 r) (Set_in (inv@36@01 r) xs@26@01)) (= (inv@36@01 r) r))
  :pattern ((inv@36@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@39@01  $FVF<f>)))
      (and (Set_in (inv@36@01 r) xs@26@01) (img@37@01 r)))
    (=>
      (and (Set_in (inv@36@01 r) xs@26@01) (img@37@01 r))
      (Set_in r ($FVF.domain_f (as sm@39@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@39@01  $FVF<f>))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@36@01 r) xs@26@01) (img@37@01 r))
      (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01)))
    (=
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@39@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(declare-const v@40@01 Int)
(assert (=
  v@40@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@39@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01)))
; [exec]
; y.f := 0
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (= r y@28@01)
    ($Perm.min
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
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
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        $Perm.Write
        $Perm.No)
      (pTaken@41@01 r))
    $Perm.No)
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@41@01 r) $Perm.No)
  
  :qid |quant-u-28|))))
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
  (=> (= r y@28@01) (= (- $Perm.Write (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@42@01  $FVF<f>) y@28@01) 0))
; [exec]
; assert v == fun(xs, x, n)
; [eval] v == fun(xs, x, n)
; [eval] fun(xs, x, n)
(set-option :timeout 0)
(push) ; 3
(declare-const z@43@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@43@01 xs@26@01))
(pop) ; 4
(declare-fun inv@44@01 ($Ref) $Ref)
(declare-fun img@45@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@43@01 $Ref) (z2@43@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@43@01 xs@26@01)
      (Set_in z2@43@01 xs@26@01)
      (= z1@43@01 z2@43@01))
    (= z1@43@01 z2@43@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@43@01 $Ref)) (!
  (=>
    (Set_in z@43@01 xs@26@01)
    (and (= (inv@44@01 z@43@01) z@43@01) (img@45@01 z@43@01)))
  :pattern ((Set_in z@43@01 xs@26@01))
  :pattern ((inv@44@01 z@43@01))
  :pattern ((img@45@01 z@43@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@45@01 r) (Set_in (inv@44@01 r) xs@26@01)) (= (inv@44@01 r) r))
  :pattern ((inv@44@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r) (= r (inv@44@01 r)))
    ($Perm.min
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@47@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r) (= r (inv@44@01 r)))
    ($Perm.min
      (ite (= r y@28@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@46@01 r)))
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
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (pTaken@46@01 r))
    $Perm.No)
  
  :qid |quant-u-32|))))
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
    (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r) (= r (inv@44@01 r)))
    (= (- $Perm.Write (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@47@01 y@28@01)) $Perm.No)))
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
    (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r) (= r (inv@44@01 r)))
    (= (- (- $Perm.Write (pTaken@46@01 r)) (pTaken@47@01 r)) $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@48@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>)))
      (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r)))
    (=>
      (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r))
      (Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>))))
  :qid |qp.fvfDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r)) (= r y@28@01))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r))
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef7|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@48@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@43@01 $Ref)) (!
  (=>
    (Set_in z@43@01 xs@26@01)
    (and (= (inv@44@01 z@43@01) z@43@01) (img@45@01 z@43@01)))
  :pattern ((Set_in z@43@01 xs@26@01))
  :pattern ((inv@44@01 z@43@01))
  :pattern ((img@45@01 z@43@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@45@01 r) (Set_in (inv@44@01 r) xs@26@01)) (= (inv@44@01 r) r))
  :pattern ((inv@44@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>)))
      (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r)))
    (=>
      (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r))
      (Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@48@01  $FVF<f>))))
  :qid |qp.fvfDomDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r)) (= r y@28@01))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@44@01 r) xs@26@01) (img@45@01 r))
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@48@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@48@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@48@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@40@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@48@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))))
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
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@28@01)
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@50@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@50@01  $FPM) r)
    (+
      (ite (= r y@28@01) $Perm.Write $Perm.No)
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
(assert (<= ($FVF.perm_f (as pm@50@01  $FPM) y@28@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@50@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] v == fun(xs, x, n)
; [eval] fun(xs, x, n)
(set-option :timeout 0)
(push) ; 3
(declare-const z@51@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@51@01 xs@26@01))
(pop) ; 4
(declare-fun inv@52@01 ($Ref) $Ref)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@51@01 $Ref) (z2@51@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@51@01 xs@26@01)
      (Set_in z2@51@01 xs@26@01)
      (= z1@51@01 z2@51@01))
    (= z1@51@01 z2@51@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@51@01 $Ref)) (!
  (=>
    (Set_in z@51@01 xs@26@01)
    (and (= (inv@52@01 z@51@01) z@51@01) (img@53@01 z@51@01)))
  :pattern ((Set_in z@51@01 xs@26@01))
  :pattern ((inv@52@01 z@51@01))
  :pattern ((img@53@01 z@51@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@53@01 r) (Set_in (inv@52@01 r) xs@26@01)) (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r) (= r (inv@52@01 r)))
    ($Perm.min
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r) (= r (inv@52@01 r)))
    ($Perm.min
      (ite (= r y@28@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@54@01 r)))
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
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (pTaken@54@01 r))
    $Perm.No)
  
  :qid |quant-u-38|))))
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
    (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r) (= r (inv@52@01 r)))
    (= (- $Perm.Write (pTaken@54@01 r)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@55@01 y@28@01)) $Perm.No)))
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
    (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r) (= r (inv@52@01 r)))
    (= (- (- $Perm.Write (pTaken@54@01 r)) (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@56@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@56@01  $FVF<f>)))
      (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r)))
    (=>
      (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r))
      (Set_in r ($FVF.domain_f (as sm@56@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@56@01  $FVF<f>))))
  :qid |qp.fvfDomDef14|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r))
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r)) (= r y@28@01))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef13|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@56@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@51@01 $Ref)) (!
  (=>
    (Set_in z@51@01 xs@26@01)
    (and (= (inv@52@01 z@51@01) z@51@01) (img@53@01 z@51@01)))
  :pattern ((Set_in z@51@01 xs@26@01))
  :pattern ((inv@52@01 z@51@01))
  :pattern ((img@53@01 z@51@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@53@01 r) (Set_in (inv@52@01 r) xs@26@01)) (= (inv@52@01 r) r))
  :pattern ((inv@52@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@56@01  $FVF<f>)))
      (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r)))
    (=>
      (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r))
      (Set_in r ($FVF.domain_f (as sm@56@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@56@01  $FVF<f>))))
  :qid |qp.fvfDomDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r))
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@52@01 r) xs@26@01) (img@53@01 r)) (= r y@28@01))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef13|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@56@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@40@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@56@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))))
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
(declare-const sm@57@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@28@01)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef16|)))
(declare-const pm@58@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@58@01  $FPM) r)
    (+
      (ite (= r y@28@01) $Perm.Write $Perm.No)
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@58@01  $FPM) r))
  :qid |qp.resPrmSumDef17|)))
(assert (<= ($FVF.perm_f (as pm@58@01  $FPM) y@28@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@58@01  $FPM) r) $Perm.Write)
  :pattern ((inv@32@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] v == fun(xs, x, n)
; [eval] fun(xs, x, n)
(set-option :timeout 0)
(push) ; 3
(declare-const z@59@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@59@01 xs@26@01))
(pop) ; 4
(declare-fun inv@60@01 ($Ref) $Ref)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@59@01 $Ref) (z2@59@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@59@01 xs@26@01)
      (Set_in z2@59@01 xs@26@01)
      (= z1@59@01 z2@59@01))
    (= z1@59@01 z2@59@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@59@01 $Ref)) (!
  (=>
    (Set_in z@59@01 xs@26@01)
    (and (= (inv@60@01 z@59@01) z@59@01) (img@61@01 z@59@01)))
  :pattern ((Set_in z@59@01 xs@26@01))
  :pattern ((inv@60@01 z@59@01))
  :pattern ((img@61@01 z@59@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@61@01 r) (Set_in (inv@60@01 r) xs@26@01)) (= (inv@60@01 r) r))
  :pattern ((inv@60@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r) (= r (inv@60@01 r)))
    ($Perm.min
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r) (= r (inv@60@01 r)))
    ($Perm.min
      (ite (= r y@28@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@62@01 r)))
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
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (pTaken@62@01 r))
    $Perm.No)
  
  :qid |quant-u-44|))))
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
    (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r) (= r (inv@60@01 r)))
    (= (- $Perm.Write (pTaken@62@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@63@01 y@28@01)) $Perm.No)))
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
    (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r) (= r (inv@60@01 r)))
    (= (- (- $Perm.Write (pTaken@62@01 r)) (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@64@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>)))
      (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r)))
    (=>
      (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r))
      (Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>))))
  :qid |qp.fvfDomDef20|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r)) (= r y@28@01))
    (=
      ($FVF.lookup_f (as sm@64@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r))
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@64@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef19|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@64@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@59@01 $Ref)) (!
  (=>
    (Set_in z@59@01 xs@26@01)
    (and (= (inv@60@01 z@59@01) z@59@01) (img@61@01 z@59@01)))
  :pattern ((Set_in z@59@01 xs@26@01))
  :pattern ((inv@60@01 z@59@01))
  :pattern ((img@61@01 z@59@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@61@01 r) (Set_in (inv@60@01 r) xs@26@01)) (= (inv@60@01 r) r))
  :pattern ((inv@60@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>)))
      (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r)))
    (=>
      (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r))
      (Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>))))
  :qid |qp.fvfDomDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r)) (= r y@28@01))
    (=
      ($FVF.lookup_f (as sm@64@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@60@01 r) xs@26@01) (img@61@01 r))
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@64@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef19|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@64@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@40@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@64@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))))
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
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] v == fun(xs, x, n)
; [eval] fun(xs, x, n)
(set-option :timeout 0)
(push) ; 3
(declare-const z@65@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@65@01 xs@26@01))
(pop) ; 4
(declare-fun inv@66@01 ($Ref) $Ref)
(declare-fun img@67@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@65@01 $Ref) (z2@65@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@65@01 xs@26@01)
      (Set_in z2@65@01 xs@26@01)
      (= z1@65@01 z2@65@01))
    (= z1@65@01 z2@65@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@65@01 $Ref)) (!
  (=>
    (Set_in z@65@01 xs@26@01)
    (and (= (inv@66@01 z@65@01) z@65@01) (img@67@01 z@65@01)))
  :pattern ((Set_in z@65@01 xs@26@01))
  :pattern ((inv@66@01 z@65@01))
  :pattern ((img@67@01 z@65@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@67@01 r) (Set_in (inv@66@01 r) xs@26@01)) (= (inv@66@01 r) r))
  :pattern ((inv@66@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r) (= r (inv@66@01 r)))
    ($Perm.min
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r) (= r (inv@66@01 r)))
    ($Perm.min
      (ite (= r y@28@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@68@01 r)))
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
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (pTaken@68@01 r))
    $Perm.No)
  
  :qid |quant-u-50|))))
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
    (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r) (= r (inv@66@01 r)))
    (= (- $Perm.Write (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@69@01 y@28@01)) $Perm.No)))
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
    (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r) (= r (inv@66@01 r)))
    (= (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@70@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>)))
      (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r)))
    (=>
      (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r))
      (Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r))
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r)) (= r y@28@01))
    (=
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef22|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@70@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@65@01 $Ref)) (!
  (=>
    (Set_in z@65@01 xs@26@01)
    (and (= (inv@66@01 z@65@01) z@65@01) (img@67@01 z@65@01)))
  :pattern ((Set_in z@65@01 xs@26@01))
  :pattern ((inv@66@01 z@65@01))
  :pattern ((img@67@01 z@65@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@67@01 r) (Set_in (inv@66@01 r) xs@26@01)) (= (inv@66@01 r) r))
  :pattern ((inv@66@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>)))
      (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r)))
    (=>
      (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r))
      (Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@70@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r))
      (ite
        (and (img@33@01 r) (Set_in (inv@32@01 r) xs@26@01))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r)))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@30@01)) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@66@01 r) xs@26@01) (img@67@01 r)) (= r y@28@01))
    (=
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef22|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@70@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@40@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@70@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@26@01 x@27@01 n@29@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const xs@71@01 Set<$Ref>)
(declare-const x@72@01 $Ref)
(declare-const y@73@01 $Ref)
(declare-const n@74@01 Int)
(declare-const xs@75@01 Set<$Ref>)
(declare-const x@76@01 $Ref)
(declare-const y@77@01 $Ref)
(declare-const n@78@01 Int)
(push) ; 1
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 ($Snap.combine ($Snap.first $t@79@01) ($Snap.second $t@79@01))))
(declare-const z@80@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@80@01 xs@75@01))
(pop) ; 2
(declare-fun inv@81@01 ($Ref) $Ref)
(declare-fun img@82@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@80@01 $Ref) (z2@80@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@80@01 xs@75@01)
      (Set_in z2@80@01 xs@75@01)
      (= z1@80@01 z2@80@01))
    (= z1@80@01 z2@80@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@80@01 $Ref)) (!
  (=>
    (Set_in z@80@01 xs@75@01)
    (and (= (inv@81@01 z@80@01) z@80@01) (img@82@01 z@80@01)))
  :pattern ((Set_in z@80@01 xs@75@01))
  :pattern ((inv@81@01 z@80@01))
  :pattern ((img@82@01 z@80@01))
  :qid |quant-u-55|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01)) (= (inv@81@01 r) r))
  :pattern ((inv@81@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@80@01 $Ref)) (!
  (=> (Set_in z@80@01 xs@75@01) (not (= z@80@01 $Ref.null)))
  :pattern ((Set_in z@80@01 xs@75@01))
  :pattern ((inv@81@01 z@80@01))
  :pattern ((img@82@01 z@80@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@79@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@79@01))
    ($Snap.second ($Snap.second $t@79@01)))))
(assert (= ($Snap.first ($Snap.second $t@79@01)) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@76@01 xs@75@01))
(assert (=
  ($Snap.second ($Snap.second $t@79@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@79@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@79@01))) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@77@01 xs@75@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@79@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
  $Snap.unit))
; [eval] x != y
(assert (not (= x@76@01 y@77@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
  $Snap.unit))
; [eval] n >= 0
(assert (>= n@78@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var v: Int
(declare-const v@83@01 Int)
; [exec]
; v := fun(xs, x, n)
; [eval] fun(xs, x, n)
(push) ; 3
(declare-const z@84@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@84@01 xs@75@01))
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
      (Set_in z1@84@01 xs@75@01)
      (Set_in z2@84@01 xs@75@01)
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
    (Set_in z@84@01 xs@75@01)
    (and (= (inv@85@01 z@84@01) z@84@01) (img@86@01 z@84@01)))
  :pattern ((Set_in z@84@01 xs@75@01))
  :pattern ((inv@85@01 z@84@01))
  :pattern ((img@86@01 z@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@86@01 r) (Set_in (inv@85@01 r) xs@75@01)) (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@87@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@85@01 r) xs@75@01) (img@86@01 r) (= r (inv@85@01 r)))
    ($Perm.min
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01))
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
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01))
        $Perm.Write
        $Perm.No)
      (pTaken@87@01 r))
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
    (and (Set_in (inv@85@01 r) xs@75@01) (img@86@01 r) (= r (inv@85@01 r)))
    (= (- $Perm.Write (pTaken@87@01 r)) $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@88@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@88@01  $FVF<f>)))
      (and (Set_in (inv@85@01 r) xs@75@01) (img@86@01 r)))
    (=>
      (and (Set_in (inv@85@01 r) xs@75@01) (img@86@01 r))
      (Set_in r ($FVF.domain_f (as sm@88@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@88@01  $FVF<f>))))
  :qid |qp.fvfDomDef25|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) xs@75@01) (img@86@01 r))
      (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01)))
    (=
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) r))
  :qid |qp.fvfValDef24|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@88@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@75@01 x@76@01 n@78@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@84@01 $Ref)) (!
  (=>
    (Set_in z@84@01 xs@75@01)
    (and (= (inv@85@01 z@84@01) z@84@01) (img@86@01 z@84@01)))
  :pattern ((Set_in z@84@01 xs@75@01))
  :pattern ((inv@85@01 z@84@01))
  :pattern ((img@86@01 z@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@86@01 r) (Set_in (inv@85@01 r) xs@75@01)) (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@88@01  $FVF<f>)))
      (and (Set_in (inv@85@01 r) xs@75@01) (img@86@01 r)))
    (=>
      (and (Set_in (inv@85@01 r) xs@75@01) (img@86@01 r))
      (Set_in r ($FVF.domain_f (as sm@88@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@88@01  $FVF<f>))))
  :qid |qp.fvfDomDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) xs@75@01) (img@86@01 r))
      (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01)))
    (=
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) r))
  :qid |qp.fvfValDef24|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@88@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@75@01 x@76@01 n@78@01))
(declare-const v@89@01 Int)
(assert (=
  v@89@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@88@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@75@01 x@76@01 n@78@01)))
; [exec]
; y.f := y.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@82@01 y@77@01) (Set_in (inv@81@01 y@77@01) xs@75@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@90@01 ((r $Ref)) $Perm
  (ite
    (= r y@77@01)
    ($Perm.min
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01))
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
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01))
        $Perm.Write
        $Perm.No)
      (pTaken@90@01 r))
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
  (= (pTaken@90@01 r) $Perm.No)
  
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
  (=> (= r y@77@01) (= (- $Perm.Write (pTaken@90@01 r)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@91@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@91@01  $FVF<f>) y@77@01)
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) y@77@01)))
; [exec]
; assert v == fun(xs, x, n)
; [eval] v == fun(xs, x, n)
; [eval] fun(xs, x, n)
(set-option :timeout 0)
(push) ; 3
(declare-const z@92@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@92@01 xs@75@01))
(pop) ; 4
(declare-fun inv@93@01 ($Ref) $Ref)
(declare-fun img@94@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@92@01 $Ref) (z2@92@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@92@01 xs@75@01)
      (Set_in z2@92@01 xs@75@01)
      (= z1@92@01 z2@92@01))
    (= z1@92@01 z2@92@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@92@01 $Ref)) (!
  (=>
    (Set_in z@92@01 xs@75@01)
    (and (= (inv@93@01 z@92@01) z@92@01) (img@94@01 z@92@01)))
  :pattern ((Set_in z@92@01 xs@75@01))
  :pattern ((inv@93@01 z@92@01))
  :pattern ((img@94@01 z@92@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@94@01 r) (Set_in (inv@93@01 r) xs@75@01)) (= (inv@93@01 r) r))
  :pattern ((inv@93@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@95@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r) (= r (inv@93@01 r)))
    ($Perm.min
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@96@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r) (= r (inv@93@01 r)))
    ($Perm.min
      (ite (= r y@77@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@95@01 r)))
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
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01))
        (- $Perm.Write (pTaken@90@01 r))
        $Perm.No)
      (pTaken@95@01 r))
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
    (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r) (= r (inv@93@01 r)))
    (= (- $Perm.Write (pTaken@95@01 r)) $Perm.No))
  
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
(assert (not (= (- $Perm.Write (pTaken@96@01 y@77@01)) $Perm.No)))
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
    (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r) (= r (inv@93@01 r)))
    (= (- (- $Perm.Write (pTaken@95@01 r)) (pTaken@96@01 r)) $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@97@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@97@01  $FVF<f>)))
      (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r)))
    (=>
      (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r))
      (Set_in r ($FVF.domain_f (as sm@97@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@97@01  $FVF<f>))))
  :qid |qp.fvfDomDef28|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r)) (= r y@77@01))
    (=
      ($FVF.lookup_f (as sm@97@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@97@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r))
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01))
        (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@97@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) r)))
  :pattern (($FVF.lookup_f (as sm@97@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) r))
  :qid |qp.fvfValDef27|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@97@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@75@01 x@76@01 n@78@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@92@01 $Ref)) (!
  (=>
    (Set_in z@92@01 xs@75@01)
    (and (= (inv@93@01 z@92@01) z@92@01) (img@94@01 z@92@01)))
  :pattern ((Set_in z@92@01 xs@75@01))
  :pattern ((inv@93@01 z@92@01))
  :pattern ((img@94@01 z@92@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@94@01 r) (Set_in (inv@93@01 r) xs@75@01)) (= (inv@93@01 r) r))
  :pattern ((inv@93@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@97@01  $FVF<f>)))
      (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r)))
    (=>
      (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r))
      (Set_in r ($FVF.domain_f (as sm@97@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@97@01  $FVF<f>))))
  :qid |qp.fvfDomDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r)) (= r y@77@01))
    (=
      ($FVF.lookup_f (as sm@97@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@97@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@93@01 r) xs@75@01) (img@94@01 r))
      (ite
        (and (img@82@01 r) (Set_in (inv@81@01 r) xs@75@01))
        (< $Perm.No (- $Perm.Write (pTaken@90@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@97@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) r)))
  :pattern (($FVF.lookup_f (as sm@97@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@79@01)) r))
  :qid |qp.fvfValDef27|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@97@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@75@01 x@76@01 n@78@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@89@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@97@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@75@01 x@76@01 n@78@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v@89@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@97@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@75@01 x@76@01 n@78@01)))
(pop) ; 2
(pop) ; 1
; ---------- test06 ----------
(declare-const xs@98@01 Set<$Ref>)
(declare-const x@99@01 $Ref)
(declare-const y@100@01 $Ref)
(declare-const n@101@01 Int)
(declare-const xs@102@01 Set<$Ref>)
(declare-const x@103@01 $Ref)
(declare-const y@104@01 $Ref)
(declare-const n@105@01 Int)
(push) ; 1
(declare-const $t@106@01 $Snap)
(assert (= $t@106@01 ($Snap.combine ($Snap.first $t@106@01) ($Snap.second $t@106@01))))
(declare-const z@107@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@107@01 xs@102@01))
(pop) ; 2
(declare-fun inv@108@01 ($Ref) $Ref)
(declare-fun img@109@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@107@01 $Ref) (z2@107@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@107@01 xs@102@01)
      (Set_in z2@107@01 xs@102@01)
      (= z1@107@01 z2@107@01))
    (= z1@107@01 z2@107@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@107@01 $Ref)) (!
  (=>
    (Set_in z@107@01 xs@102@01)
    (and (= (inv@108@01 z@107@01) z@107@01) (img@109@01 z@107@01)))
  :pattern ((Set_in z@107@01 xs@102@01))
  :pattern ((inv@108@01 z@107@01))
  :pattern ((img@109@01 z@107@01))
  :qid |quant-u-71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
    (= (inv@108@01 r) r))
  :pattern ((inv@108@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@107@01 $Ref)) (!
  (=> (Set_in z@107@01 xs@102@01) (not (= z@107@01 $Ref.null)))
  :pattern ((Set_in z@107@01 xs@102@01))
  :pattern ((inv@108@01 z@107@01))
  :pattern ((img@109@01 z@107@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@106@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@106@01))
    ($Snap.second ($Snap.second $t@106@01)))))
(assert (= ($Snap.first ($Snap.second $t@106@01)) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@103@01 xs@102@01))
(assert (=
  ($Snap.second ($Snap.second $t@106@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@106@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@106@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@106@01))) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@104@01 xs@102@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@106@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@106@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@106@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@106@01))))
  $Snap.unit))
; [eval] x != y
(assert (not (= x@103@01 y@104@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@106@01))))
  $Snap.unit))
; [eval] n >= 0
(assert (>= n@105@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var v: Int
(declare-const v@110@01 Int)
; [exec]
; var yf: Int
(declare-const yf@111@01 Int)
; [exec]
; v := fun(xs, x, n)
; [eval] fun(xs, x, n)
(push) ; 3
(declare-const z@112@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@112@01 xs@102@01))
(pop) ; 4
(declare-fun inv@113@01 ($Ref) $Ref)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@112@01 $Ref) (z2@112@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@112@01 xs@102@01)
      (Set_in z2@112@01 xs@102@01)
      (= z1@112@01 z2@112@01))
    (= z1@112@01 z2@112@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@112@01 $Ref)) (!
  (=>
    (Set_in z@112@01 xs@102@01)
    (and (= (inv@113@01 z@112@01) z@112@01) (img@114@01 z@112@01)))
  :pattern ((Set_in z@112@01 xs@102@01))
  :pattern ((inv@113@01 z@112@01))
  :pattern ((img@114@01 z@112@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@114@01 r) (Set_in (inv@113@01 r) xs@102@01))
    (= (inv@113@01 r) r))
  :pattern ((inv@113@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@113@01 r) xs@102@01) (img@114@01 r) (= r (inv@113@01 r)))
    ($Perm.min
      (ite
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
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
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
        $Perm.Write
        $Perm.No)
      (pTaken@115@01 r))
    $Perm.No)
  
  :qid |quant-u-74|))))
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
    (and (Set_in (inv@113@01 r) xs@102@01) (img@114@01 r) (= r (inv@113@01 r)))
    (= (- $Perm.Write (pTaken@115@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@116@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@116@01  $FVF<f>)))
      (and (Set_in (inv@113@01 r) xs@102@01) (img@114@01 r)))
    (=>
      (and (Set_in (inv@113@01 r) xs@102@01) (img@114@01 r))
      (Set_in r ($FVF.domain_f (as sm@116@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@116@01  $FVF<f>))))
  :qid |qp.fvfDomDef30|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@113@01 r) xs@102@01) (img@114@01 r))
      (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01)))
    (=
      ($FVF.lookup_f (as sm@116@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) r)))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) r))
  :qid |qp.fvfValDef29|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@116@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@102@01 x@103@01 n@105@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@112@01 $Ref)) (!
  (=>
    (Set_in z@112@01 xs@102@01)
    (and (= (inv@113@01 z@112@01) z@112@01) (img@114@01 z@112@01)))
  :pattern ((Set_in z@112@01 xs@102@01))
  :pattern ((inv@113@01 z@112@01))
  :pattern ((img@114@01 z@112@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@114@01 r) (Set_in (inv@113@01 r) xs@102@01))
    (= (inv@113@01 r) r))
  :pattern ((inv@113@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@116@01  $FVF<f>)))
      (and (Set_in (inv@113@01 r) xs@102@01) (img@114@01 r)))
    (=>
      (and (Set_in (inv@113@01 r) xs@102@01) (img@114@01 r))
      (Set_in r ($FVF.domain_f (as sm@116@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@116@01  $FVF<f>))))
  :qid |qp.fvfDomDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@113@01 r) xs@102@01) (img@114@01 r))
      (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01)))
    (=
      ($FVF.lookup_f (as sm@116@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) r)))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) r))
  :qid |qp.fvfValDef29|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@116@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@102@01 x@103@01 n@105@01))
(declare-const v@117@01 Int)
(assert (=
  v@117@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@116@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@102@01 x@103@01 n@105@01)))
; [exec]
; yf := y.f
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@109@01 y@104@01) (Set_in (inv@108@01 y@104@01) xs@102@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const yf@118@01 Int)
(assert (=
  yf@118@01
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) y@104@01)))
; [exec]
; y.f := 0
; Precomputing data for removing quantified permissions
(define-fun pTaken@119@01 ((r $Ref)) $Perm
  (ite
    (= r y@104@01)
    ($Perm.min
      (ite
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
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
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
        $Perm.Write
        $Perm.No)
      (pTaken@119@01 r))
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
  (= (pTaken@119@01 r) $Perm.No)
  
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
  (=> (= r y@104@01) (= (- $Perm.Write (pTaken@119@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@120@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@120@01  $FVF<f>) y@104@01) 0))
; [exec]
; y.f := yf
; Precomputing data for removing quantified permissions
(define-fun pTaken@121@01 ((r $Ref)) $Perm
  (ite
    (= r y@104@01)
    ($Perm.min (ite (= r y@104@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (= r y@104@01)
    ($Perm.min
      (ite
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
        (- $Perm.Write (pTaken@119@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@121@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@121@01 y@104@01)) $Perm.No)))
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
  (=> (= r y@104@01) (= (- $Perm.Write (pTaken@121@01 r)) $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@123@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) y@104@01) yf@118@01))
; [exec]
; assert v == fun(xs, x, n)
; [eval] v == fun(xs, x, n)
; [eval] fun(xs, x, n)
(set-option :timeout 0)
(push) ; 3
(declare-const z@124@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@124@01 xs@102@01))
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
      (Set_in z1@124@01 xs@102@01)
      (Set_in z2@124@01 xs@102@01)
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
    (Set_in z@124@01 xs@102@01)
    (and (= (inv@125@01 z@124@01) z@124@01) (img@126@01 z@124@01)))
  :pattern ((Set_in z@124@01 xs@102@01))
  :pattern ((inv@125@01 z@124@01))
  :pattern ((img@126@01 z@124@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@126@01 r) (Set_in (inv@125@01 r) xs@102@01))
    (= (inv@125@01 r) r))
  :pattern ((inv@125@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@127@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r) (= r (inv@125@01 r)))
    ($Perm.min
      (ite
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
        (- $Perm.Write (pTaken@119@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@128@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r) (= r (inv@125@01 r)))
    ($Perm.min
      (ite (= r y@104@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@127@01 r)))
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
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
        (- $Perm.Write (pTaken@119@01 r))
        $Perm.No)
      (pTaken@127@01 r))
    $Perm.No)
  
  :qid |quant-u-85|))))
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
    (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r) (= r (inv@125@01 r)))
    (= (- $Perm.Write (pTaken@127@01 r)) $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@128@01 y@104@01)) $Perm.No)))
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
    (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r) (= r (inv@125@01 r)))
    (= (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@128@01 r)) $Perm.No))
  
  :qid |quant-u-88|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@129@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@129@01  $FVF<f>)))
      (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r)))
    (=>
      (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r))
      (Set_in r ($FVF.domain_f (as sm@129@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@129@01  $FVF<f>))))
  :qid |qp.fvfDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r)) (= r y@104@01))
    (=
      ($FVF.lookup_f (as sm@129@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@123@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@129@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r))
      (ite
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
        (< $Perm.No (- $Perm.Write (pTaken@119@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@129@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) r)))
  :pattern (($FVF.lookup_f (as sm@129@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) r))
  :qid |qp.fvfValDef32|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@129@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@102@01 x@103@01 n@105@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@124@01 $Ref)) (!
  (=>
    (Set_in z@124@01 xs@102@01)
    (and (= (inv@125@01 z@124@01) z@124@01) (img@126@01 z@124@01)))
  :pattern ((Set_in z@124@01 xs@102@01))
  :pattern ((inv@125@01 z@124@01))
  :pattern ((img@126@01 z@124@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@126@01 r) (Set_in (inv@125@01 r) xs@102@01))
    (= (inv@125@01 r) r))
  :pattern ((inv@125@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@129@01  $FVF<f>)))
      (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r)))
    (=>
      (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r))
      (Set_in r ($FVF.domain_f (as sm@129@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@129@01  $FVF<f>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r)) (= r y@104@01))
    (=
      ($FVF.lookup_f (as sm@129@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@123@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@129@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@125@01 r) xs@102@01) (img@126@01 r))
      (ite
        (and (img@109@01 r) (Set_in (inv@108@01 r) xs@102@01))
        (< $Perm.No (- $Perm.Write (pTaken@119@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@129@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) r)))
  :pattern (($FVF.lookup_f (as sm@129@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@106@01)) r))
  :qid |qp.fvfValDef32|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@129@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@102@01 x@103@01 n@105@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@117@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@129@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@102@01 x@103@01 n@105@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v@117@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@129@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@102@01 x@103@01 n@105@01)))
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const xs@130@01 Set<$Ref>)
(declare-const x@131@01 $Ref)
(declare-const y@132@01 $Ref)
(declare-const n@133@01 Int)
(declare-const xs@134@01 Set<$Ref>)
(declare-const x@135@01 $Ref)
(declare-const y@136@01 $Ref)
(declare-const n@137@01 Int)
(push) ; 1
(declare-const $t@138@01 $Snap)
(assert (= $t@138@01 ($Snap.combine ($Snap.first $t@138@01) ($Snap.second $t@138@01))))
(declare-const z@139@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@139@01 xs@134@01))
(pop) ; 2
(declare-fun inv@140@01 ($Ref) $Ref)
(declare-fun img@141@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@139@01 $Ref) (z2@139@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@139@01 xs@134@01)
      (Set_in z2@139@01 xs@134@01)
      (= z1@139@01 z2@139@01))
    (= z1@139@01 z2@139@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@139@01 $Ref)) (!
  (=>
    (Set_in z@139@01 xs@134@01)
    (and (= (inv@140@01 z@139@01) z@139@01) (img@141@01 z@139@01)))
  :pattern ((Set_in z@139@01 xs@134@01))
  :pattern ((inv@140@01 z@139@01))
  :pattern ((img@141@01 z@139@01))
  :qid |quant-u-90|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
    (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@139@01 $Ref)) (!
  (=> (Set_in z@139@01 xs@134@01) (not (= z@139@01 $Ref.null)))
  :pattern ((Set_in z@139@01 xs@134@01))
  :pattern ((inv@140@01 z@139@01))
  :pattern ((img@141@01 z@139@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@138@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@138@01))
    ($Snap.second ($Snap.second $t@138@01)))))
(assert (= ($Snap.first ($Snap.second $t@138@01)) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@135@01 xs@134@01))
(assert (=
  ($Snap.second ($Snap.second $t@138@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@138@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@138@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@138@01))) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@136@01 xs@134@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@138@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@138@01))))
  $Snap.unit))
; [eval] x != y
(assert (not (= x@135@01 y@136@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@138@01))))
  $Snap.unit))
; [eval] n >= 0
(assert (>= n@137@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var v: Int
(declare-const v@142@01 Int)
; [exec]
; v := fun(xs, x, n)
; [eval] fun(xs, x, n)
(push) ; 3
(declare-const z@143@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@143@01 xs@134@01))
(pop) ; 4
(declare-fun inv@144@01 ($Ref) $Ref)
(declare-fun img@145@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@143@01 $Ref) (z2@143@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@143@01 xs@134@01)
      (Set_in z2@143@01 xs@134@01)
      (= z1@143@01 z2@143@01))
    (= z1@143@01 z2@143@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@143@01 $Ref)) (!
  (=>
    (Set_in z@143@01 xs@134@01)
    (and (= (inv@144@01 z@143@01) z@143@01) (img@145@01 z@143@01)))
  :pattern ((Set_in z@143@01 xs@134@01))
  :pattern ((inv@144@01 z@143@01))
  :pattern ((img@145@01 z@143@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@145@01 r) (Set_in (inv@144@01 r) xs@134@01))
    (= (inv@144@01 r) r))
  :pattern ((inv@144@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@146@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@144@01 r) xs@134@01) (img@145@01 r) (= r (inv@144@01 r)))
    ($Perm.min
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
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
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
        $Perm.Write
        $Perm.No)
      (pTaken@146@01 r))
    $Perm.No)
  
  :qid |quant-u-93|))))
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
    (and (Set_in (inv@144@01 r) xs@134@01) (img@145@01 r) (= r (inv@144@01 r)))
    (= (- $Perm.Write (pTaken@146@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@147@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@147@01  $FVF<f>)))
      (and (Set_in (inv@144@01 r) xs@134@01) (img@145@01 r)))
    (=>
      (and (Set_in (inv@144@01 r) xs@134@01) (img@145@01 r))
      (Set_in r ($FVF.domain_f (as sm@147@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@147@01  $FVF<f>))))
  :qid |qp.fvfDomDef35|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@144@01 r) xs@134@01) (img@145@01 r))
      (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01)))
    (=
      ($FVF.lookup_f (as sm@147@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) r)))
  :pattern (($FVF.lookup_f (as sm@147@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) r))
  :qid |qp.fvfValDef34|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@147@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@134@01 x@135@01 n@137@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@143@01 $Ref)) (!
  (=>
    (Set_in z@143@01 xs@134@01)
    (and (= (inv@144@01 z@143@01) z@143@01) (img@145@01 z@143@01)))
  :pattern ((Set_in z@143@01 xs@134@01))
  :pattern ((inv@144@01 z@143@01))
  :pattern ((img@145@01 z@143@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@145@01 r) (Set_in (inv@144@01 r) xs@134@01))
    (= (inv@144@01 r) r))
  :pattern ((inv@144@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@147@01  $FVF<f>)))
      (and (Set_in (inv@144@01 r) xs@134@01) (img@145@01 r)))
    (=>
      (and (Set_in (inv@144@01 r) xs@134@01) (img@145@01 r))
      (Set_in r ($FVF.domain_f (as sm@147@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@147@01  $FVF<f>))))
  :qid |qp.fvfDomDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@144@01 r) xs@134@01) (img@145@01 r))
      (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01)))
    (=
      ($FVF.lookup_f (as sm@147@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) r)))
  :pattern (($FVF.lookup_f (as sm@147@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) r))
  :qid |qp.fvfValDef34|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@147@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@134@01 x@135@01 n@137@01))
(declare-const v@148@01 Int)
(assert (=
  v@148@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@147@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@134@01 x@135@01 n@137@01)))
; [exec]
; y.f := 0
; Precomputing data for removing quantified permissions
(define-fun pTaken@149@01 ((r $Ref)) $Perm
  (ite
    (= r y@136@01)
    ($Perm.min
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
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
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
        $Perm.Write
        $Perm.No)
      (pTaken@149@01 r))
    $Perm.No)
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@149@01 r) $Perm.No)
  
  :qid |quant-u-97|))))
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
  (=> (= r y@136@01) (= (- $Perm.Write (pTaken@149@01 r)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@150@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) y@136@01) 0))
; [exec]
; y.f := old(y.f)
; [eval] old(y.f)
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@141@01 y@136@01) (Set_in (inv@140@01 y@136@01) xs@134@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@151@01 ((r $Ref)) $Perm
  (ite
    (= r y@136@01)
    ($Perm.min (ite (= r y@136@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@152@01 ((r $Ref)) $Perm
  (ite
    (= r y@136@01)
    ($Perm.min
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
        (- $Perm.Write (pTaken@149@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@151@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@151@01 y@136@01)) $Perm.No)))
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
  (=> (= r y@136@01) (= (- $Perm.Write (pTaken@151@01 r)) $Perm.No))
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@153@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@153@01  $FVF<f>) y@136@01)
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) y@136@01)))
; [exec]
; assert v == fun(xs, x, n)
; [eval] v == fun(xs, x, n)
; [eval] fun(xs, x, n)
(set-option :timeout 0)
(push) ; 3
(declare-const z@154@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@154@01 xs@134@01))
(pop) ; 4
(declare-fun inv@155@01 ($Ref) $Ref)
(declare-fun img@156@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@154@01 $Ref) (z2@154@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@154@01 xs@134@01)
      (Set_in z2@154@01 xs@134@01)
      (= z1@154@01 z2@154@01))
    (= z1@154@01 z2@154@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@154@01 $Ref)) (!
  (=>
    (Set_in z@154@01 xs@134@01)
    (and (= (inv@155@01 z@154@01) z@154@01) (img@156@01 z@154@01)))
  :pattern ((Set_in z@154@01 xs@134@01))
  :pattern ((inv@155@01 z@154@01))
  :pattern ((img@156@01 z@154@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@156@01 r) (Set_in (inv@155@01 r) xs@134@01))
    (= (inv@155@01 r) r))
  :pattern ((inv@155@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@157@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r) (= r (inv@155@01 r)))
    ($Perm.min
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
        (- $Perm.Write (pTaken@149@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@158@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r) (= r (inv@155@01 r)))
    ($Perm.min
      (ite (= r y@136@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@157@01 r)))
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
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
        (- $Perm.Write (pTaken@149@01 r))
        $Perm.No)
      (pTaken@157@01 r))
    $Perm.No)
  
  :qid |quant-u-104|))))
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
    (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r) (= r (inv@155@01 r)))
    (= (- $Perm.Write (pTaken@157@01 r)) $Perm.No))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@158@01 y@136@01)) $Perm.No)))
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
    (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r) (= r (inv@155@01 r)))
    (= (- (- $Perm.Write (pTaken@157@01 r)) (pTaken@158@01 r)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@159@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@159@01  $FVF<f>)))
      (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r)))
    (=>
      (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r))
      (Set_in r ($FVF.domain_f (as sm@159@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@159@01  $FVF<f>))))
  :qid |qp.fvfDomDef38|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r)) (= r y@136@01))
    (=
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@153@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@153@01  $FVF<f>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r))
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
        (< $Perm.No (- $Perm.Write (pTaken@149@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) r)))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) r))
  :qid |qp.fvfValDef37|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@159@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@134@01 x@135@01 n@137@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@154@01 $Ref)) (!
  (=>
    (Set_in z@154@01 xs@134@01)
    (and (= (inv@155@01 z@154@01) z@154@01) (img@156@01 z@154@01)))
  :pattern ((Set_in z@154@01 xs@134@01))
  :pattern ((inv@155@01 z@154@01))
  :pattern ((img@156@01 z@154@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@156@01 r) (Set_in (inv@155@01 r) xs@134@01))
    (= (inv@155@01 r) r))
  :pattern ((inv@155@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@159@01  $FVF<f>)))
      (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r)))
    (=>
      (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r))
      (Set_in r ($FVF.domain_f (as sm@159@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@159@01  $FVF<f>))))
  :qid |qp.fvfDomDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r)) (= r y@136@01))
    (=
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@153@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@153@01  $FVF<f>) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@155@01 r) xs@134@01) (img@156@01 r))
      (ite
        (and (img@141@01 r) (Set_in (inv@140@01 r) xs@134@01))
        (< $Perm.No (- $Perm.Write (pTaken@149@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@159@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) r)))
  :pattern (($FVF.lookup_f (as sm@159@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@138@01)) r))
  :qid |qp.fvfValDef37|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@159@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@134@01 x@135@01 n@137@01))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@148@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@159@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@134@01 x@135@01 n@137@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v@148@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@159@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@134@01 x@135@01 n@137@01)))
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const xs@160@01 Set<$Ref>)
(declare-const x@161@01 $Ref)
(declare-const y@162@01 $Ref)
(declare-const n@163@01 Int)
(declare-const xs@164@01 Set<$Ref>)
(declare-const x@165@01 $Ref)
(declare-const y@166@01 $Ref)
(declare-const n@167@01 Int)
(push) ; 1
(declare-const $t@168@01 $Snap)
(assert (= $t@168@01 ($Snap.combine ($Snap.first $t@168@01) ($Snap.second $t@168@01))))
(declare-const z@169@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@169@01 xs@164@01))
(pop) ; 2
(declare-fun inv@170@01 ($Ref) $Ref)
(declare-fun img@171@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@169@01 $Ref) (z2@169@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@169@01 xs@164@01)
      (Set_in z2@169@01 xs@164@01)
      (= z1@169@01 z2@169@01))
    (= z1@169@01 z2@169@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@169@01 $Ref)) (!
  (=>
    (Set_in z@169@01 xs@164@01)
    (and (= (inv@170@01 z@169@01) z@169@01) (img@171@01 z@169@01)))
  :pattern ((Set_in z@169@01 xs@164@01))
  :pattern ((inv@170@01 z@169@01))
  :pattern ((img@171@01 z@169@01))
  :qid |quant-u-109|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
    (= (inv@170@01 r) r))
  :pattern ((inv@170@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@169@01 $Ref)) (!
  (=> (Set_in z@169@01 xs@164@01) (not (= z@169@01 $Ref.null)))
  :pattern ((Set_in z@169@01 xs@164@01))
  :pattern ((inv@170@01 z@169@01))
  :pattern ((img@171@01 z@169@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@168@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@168@01))
    ($Snap.second ($Snap.second $t@168@01)))))
(assert (= ($Snap.first ($Snap.second $t@168@01)) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@165@01 xs@164@01))
(assert (=
  ($Snap.second ($Snap.second $t@168@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@168@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@168@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@168@01))) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@166@01 xs@164@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@168@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@168@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@168@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@168@01))))
  $Snap.unit))
; [eval] x != y
(assert (not (= x@165@01 y@166@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@168@01))))
  $Snap.unit))
; [eval] n >= 0
(assert (>= n@167@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var v: Int
(declare-const v@172@01 Int)
; [exec]
; v := fun(xs, x, 0)
; [eval] fun(xs, x, 0)
(push) ; 3
(declare-const z@173@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@173@01 xs@164@01))
(pop) ; 4
(declare-fun inv@174@01 ($Ref) $Ref)
(declare-fun img@175@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@173@01 $Ref) (z2@173@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@173@01 xs@164@01)
      (Set_in z2@173@01 xs@164@01)
      (= z1@173@01 z2@173@01))
    (= z1@173@01 z2@173@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@173@01 $Ref)) (!
  (=>
    (Set_in z@173@01 xs@164@01)
    (and (= (inv@174@01 z@173@01) z@173@01) (img@175@01 z@173@01)))
  :pattern ((Set_in z@173@01 xs@164@01))
  :pattern ((inv@174@01 z@173@01))
  :pattern ((img@175@01 z@173@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@175@01 r) (Set_in (inv@174@01 r) xs@164@01))
    (= (inv@174@01 r) r))
  :pattern ((inv@174@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@176@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@174@01 r) xs@164@01) (img@175@01 r) (= r (inv@174@01 r)))
    ($Perm.min
      (ite
        (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
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
        (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
        $Perm.Write
        $Perm.No)
      (pTaken@176@01 r))
    $Perm.No)
  
  :qid |quant-u-112|))))
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
    (and (Set_in (inv@174@01 r) xs@164@01) (img@175@01 r) (= r (inv@174@01 r)))
    (= (- $Perm.Write (pTaken@176@01 r)) $Perm.No))
  
  :qid |quant-u-113|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@177@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@177@01  $FVF<f>)))
      (and (Set_in (inv@174@01 r) xs@164@01) (img@175@01 r)))
    (=>
      (and (Set_in (inv@174@01 r) xs@164@01) (img@175@01 r))
      (Set_in r ($FVF.domain_f (as sm@177@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@177@01  $FVF<f>))))
  :qid |qp.fvfDomDef40|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@174@01 r) xs@164@01) (img@175@01 r))
      (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01)))
    (=
      ($FVF.lookup_f (as sm@177@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@168@01)) r)))
  :pattern (($FVF.lookup_f (as sm@177@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@168@01)) r))
  :qid |qp.fvfValDef39|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@177@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@164@01 x@165@01 0))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@173@01 $Ref)) (!
  (=>
    (Set_in z@173@01 xs@164@01)
    (and (= (inv@174@01 z@173@01) z@173@01) (img@175@01 z@173@01)))
  :pattern ((Set_in z@173@01 xs@164@01))
  :pattern ((inv@174@01 z@173@01))
  :pattern ((img@175@01 z@173@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@175@01 r) (Set_in (inv@174@01 r) xs@164@01))
    (= (inv@174@01 r) r))
  :pattern ((inv@174@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@177@01  $FVF<f>)))
      (and (Set_in (inv@174@01 r) xs@164@01) (img@175@01 r)))
    (=>
      (and (Set_in (inv@174@01 r) xs@164@01) (img@175@01 r))
      (Set_in r ($FVF.domain_f (as sm@177@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@177@01  $FVF<f>))))
  :qid |qp.fvfDomDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@174@01 r) xs@164@01) (img@175@01 r))
      (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01)))
    (=
      ($FVF.lookup_f (as sm@177@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@168@01)) r)))
  :pattern (($FVF.lookup_f (as sm@177@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@168@01)) r))
  :qid |qp.fvfValDef39|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@177@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@164@01 x@165@01 0))
(declare-const v@178@01 Int)
(assert (=
  v@178@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@177@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@164@01 x@165@01 0)))
; [exec]
; y.f := 0
; Precomputing data for removing quantified permissions
(define-fun pTaken@179@01 ((r $Ref)) $Perm
  (ite
    (= r y@166@01)
    ($Perm.min
      (ite
        (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
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
        (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
        $Perm.Write
        $Perm.No)
      (pTaken@179@01 r))
    $Perm.No)
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@179@01 r) $Perm.No)
  
  :qid |quant-u-116|))))
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
  (=> (= r y@166@01) (= (- $Perm.Write (pTaken@179@01 r)) $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@180@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@180@01  $FVF<f>) y@166@01) 0))
; [exec]
; assert v == fun(xs, x, 0)
; [eval] v == fun(xs, x, 0)
; [eval] fun(xs, x, 0)
(set-option :timeout 0)
(push) ; 3
(declare-const z@181@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@181@01 xs@164@01))
(pop) ; 4
(declare-fun inv@182@01 ($Ref) $Ref)
(declare-fun img@183@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@181@01 $Ref) (z2@181@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@181@01 xs@164@01)
      (Set_in z2@181@01 xs@164@01)
      (= z1@181@01 z2@181@01))
    (= z1@181@01 z2@181@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@181@01 $Ref)) (!
  (=>
    (Set_in z@181@01 xs@164@01)
    (and (= (inv@182@01 z@181@01) z@181@01) (img@183@01 z@181@01)))
  :pattern ((Set_in z@181@01 xs@164@01))
  :pattern ((inv@182@01 z@181@01))
  :pattern ((img@183@01 z@181@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@183@01 r) (Set_in (inv@182@01 r) xs@164@01))
    (= (inv@182@01 r) r))
  :pattern ((inv@182@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@184@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r) (= r (inv@182@01 r)))
    ($Perm.min
      (ite
        (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
        (- $Perm.Write (pTaken@179@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@185@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r) (= r (inv@182@01 r)))
    ($Perm.min
      (ite (= r y@166@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@184@01 r)))
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
        (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
        (- $Perm.Write (pTaken@179@01 r))
        $Perm.No)
      (pTaken@184@01 r))
    $Perm.No)
  
  :qid |quant-u-120|))))
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
    (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r) (= r (inv@182@01 r)))
    (= (- $Perm.Write (pTaken@184@01 r)) $Perm.No))
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@185@01 y@166@01)) $Perm.No)))
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
    (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r) (= r (inv@182@01 r)))
    (= (- (- $Perm.Write (pTaken@184@01 r)) (pTaken@185@01 r)) $Perm.No))
  
  :qid |quant-u-123|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@186@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@186@01  $FVF<f>)))
      (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r)))
    (=>
      (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r))
      (Set_in r ($FVF.domain_f (as sm@186@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@186@01  $FVF<f>))))
  :qid |qp.fvfDomDef43|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r)) (= r y@166@01))
    (=
      ($FVF.lookup_f (as sm@186@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@180@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@186@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r))
      (ite
        (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
        (< $Perm.No (- $Perm.Write (pTaken@179@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@186@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@168@01)) r)))
  :pattern (($FVF.lookup_f (as sm@186@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@168@01)) r))
  :qid |qp.fvfValDef42|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@186@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@164@01 x@165@01 0))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@181@01 $Ref)) (!
  (=>
    (Set_in z@181@01 xs@164@01)
    (and (= (inv@182@01 z@181@01) z@181@01) (img@183@01 z@181@01)))
  :pattern ((Set_in z@181@01 xs@164@01))
  :pattern ((inv@182@01 z@181@01))
  :pattern ((img@183@01 z@181@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@183@01 r) (Set_in (inv@182@01 r) xs@164@01))
    (= (inv@182@01 r) r))
  :pattern ((inv@182@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@186@01  $FVF<f>)))
      (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r)))
    (=>
      (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r))
      (Set_in r ($FVF.domain_f (as sm@186@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@186@01  $FVF<f>))))
  :qid |qp.fvfDomDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r)) (= r y@166@01))
    (=
      ($FVF.lookup_f (as sm@186@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@180@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@186@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@182@01 r) xs@164@01) (img@183@01 r))
      (ite
        (and (img@171@01 r) (Set_in (inv@170@01 r) xs@164@01))
        (< $Perm.No (- $Perm.Write (pTaken@179@01 r)))
        false))
    (=
      ($FVF.lookup_f (as sm@186@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@168@01)) r)))
  :pattern (($FVF.lookup_f (as sm@186@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@168@01)) r))
  :qid |qp.fvfValDef42|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@186@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@164@01 x@165@01 0))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  v@178@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@186@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@164@01 x@165@01 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  v@178@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@186@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@164@01 x@165@01 0)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const xs@187@01 Set<$Ref>)
(declare-const ys@188@01 Set<$Ref>)
(declare-const x@189@01 $Ref)
(declare-const y@190@01 $Ref)
(declare-const n@191@01 Int)
(declare-const xs@192@01 Set<$Ref>)
(declare-const ys@193@01 Set<$Ref>)
(declare-const x@194@01 $Ref)
(declare-const y@195@01 $Ref)
(declare-const n@196@01 Int)
(push) ; 1
(declare-const $t@197@01 $Snap)
(assert (= $t@197@01 ($Snap.combine ($Snap.first $t@197@01) ($Snap.second $t@197@01))))
(declare-const z@198@01 $Ref)
(push) ; 2
; [eval] (z in (xs union ys))
; [eval] (xs union ys)
(assert (Set_in z@198@01 (Set_union xs@192@01 ys@193@01)))
(pop) ; 2
(declare-fun inv@199@01 ($Ref) $Ref)
(declare-fun img@200@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@198@01 $Ref) (z2@198@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@198@01 (Set_union xs@192@01 ys@193@01))
      (Set_in z2@198@01 (Set_union xs@192@01 ys@193@01))
      (= z1@198@01 z2@198@01))
    (= z1@198@01 z2@198@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@198@01 $Ref)) (!
  (=>
    (Set_in z@198@01 (Set_union xs@192@01 ys@193@01))
    (and (= (inv@199@01 z@198@01) z@198@01) (img@200@01 z@198@01)))
  :pattern ((Set_in z@198@01 (Set_union xs@192@01 ys@193@01)))
  :pattern ((inv@199@01 z@198@01))
  :pattern ((img@200@01 z@198@01))
  :qid |quant-u-125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@200@01 r) (Set_in (inv@199@01 r) (Set_union xs@192@01 ys@193@01)))
    (= (inv@199@01 r) r))
  :pattern ((inv@199@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@198@01 $Ref)) (!
  (=>
    (Set_in z@198@01 (Set_union xs@192@01 ys@193@01))
    (not (= z@198@01 $Ref.null)))
  :pattern ((Set_in z@198@01 (Set_union xs@192@01 ys@193@01)))
  :pattern ((inv@199@01 z@198@01))
  :pattern ((img@200@01 z@198@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@197@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@197@01))
    ($Snap.second ($Snap.second $t@197@01)))))
(assert (= ($Snap.first ($Snap.second $t@197@01)) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@194@01 xs@192@01))
(assert (=
  ($Snap.second ($Snap.second $t@197@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@197@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@197@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@197@01))) $Snap.unit))
; [eval] (y in ys)
(assert (Set_in y@195@01 ys@193@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@197@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@197@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@197@01))))
  $Snap.unit))
; [eval] !((x in ys))
; [eval] (x in ys)
(assert (not (Set_in x@194@01 ys@193@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01)))))
  $Snap.unit))
; [eval] !((y in xs))
; [eval] (y in xs)
(assert (not (Set_in y@195@01 xs@192@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01))))))
  $Snap.unit))
; [eval] x != null
(assert (not (= x@194@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01)))))))
  $Snap.unit))
; [eval] y != null
(assert (not (= y@195@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@197@01)))))))
  $Snap.unit))
; [eval] n >= 0
(assert (>= n@196@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var v: Int
(declare-const v@201@01 Int)
; [exec]
; assert (forall z: Ref ::
;     { (z in (xs union ys)) }
;     { (z in xs) }
;     (z in (xs union ys)) ==> z != null)
; [eval] (forall z: Ref :: { (z in (xs union ys)) } { (z in xs) } (z in (xs union ys)) ==> z != null)
(declare-const z@202@01 $Ref)
(push) ; 3
; [eval] (z in (xs union ys)) ==> z != null
; [eval] (z in (xs union ys))
; [eval] (xs union ys)
(push) ; 4
; [then-branch: 0 | z@202@01 in xs@192@01 ∪ ys@193@01 | live]
; [else-branch: 0 | !(z@202@01 in xs@192@01 ∪ ys@193@01) | live]
(push) ; 5
; [then-branch: 0 | z@202@01 in xs@192@01 ∪ ys@193@01]
(assert (Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
; [eval] z != null
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(z@202@01 in xs@192@01 ∪ ys@193@01)]
(assert (not (Set_in z@202@01 (Set_union xs@192@01 ys@193@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
  (Set_in z@202@01 (Set_union xs@192@01 ys@193@01))))
; [eval] (z in xs)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@202@01 $Ref)) (!
  (or
    (not (Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
    (Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
  :pattern ((Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/snapshots2.vpr@94@10@94@89-aux|)))
(assert (forall ((z@202@01 $Ref)) (!
  (or
    (not (Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
    (Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
  :pattern ((Set_in z@202@01 xs@192@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/snapshots2.vpr@94@10@94@89-aux|)))
(push) ; 3
(assert (not (forall ((z@202@01 $Ref)) (!
  (=>
    (Set_in z@202@01 (Set_union xs@192@01 ys@193@01))
    (not (= z@202@01 $Ref.null)))
  :pattern ((Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
  :pattern ((Set_in z@202@01 xs@192@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/snapshots2.vpr@94@10@94@89|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((z@202@01 $Ref)) (!
  (=>
    (Set_in z@202@01 (Set_union xs@192@01 ys@193@01))
    (not (= z@202@01 $Ref.null)))
  :pattern ((Set_in z@202@01 (Set_union xs@192@01 ys@193@01)))
  :pattern ((Set_in z@202@01 xs@192@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/snapshots2.vpr@94@10@94@89|)))
; [exec]
; v := fun(xs, x, n)
; [eval] fun(xs, x, n)
(push) ; 3
(declare-const z@203@01 $Ref)
(push) ; 4
; [eval] (z in xs)
(assert (Set_in z@203@01 xs@192@01))
(pop) ; 4
(declare-fun inv@204@01 ($Ref) $Ref)
(declare-fun img@205@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((z1@203@01 $Ref) (z2@203@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@203@01 xs@192@01)
      (Set_in z2@203@01 xs@192@01)
      (= z1@203@01 z2@203@01))
    (= z1@203@01 z2@203@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@203@01 $Ref)) (!
  (=>
    (Set_in z@203@01 xs@192@01)
    (and (= (inv@204@01 z@203@01) z@203@01) (img@205@01 z@203@01)))
  :pattern ((Set_in z@203@01 xs@192@01))
  :pattern ((inv@204@01 z@203@01))
  :pattern ((img@205@01 z@203@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@205@01 r) (Set_in (inv@204@01 r) xs@192@01))
    (= (inv@204@01 r) r))
  :pattern ((inv@204@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@206@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@204@01 r) xs@192@01) (img@205@01 r) (= r (inv@204@01 r)))
    ($Perm.min
      (ite
        (and
          (img@200@01 r)
          (Set_in (inv@199@01 r) (Set_union xs@192@01 ys@193@01)))
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
        (and
          (img@200@01 r)
          (Set_in (inv@199@01 r) (Set_union xs@192@01 ys@193@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@206@01 r))
    $Perm.No)
  
  :qid |quant-u-128|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@206@01 r) $Perm.No)
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@204@01 r) xs@192@01) (img@205@01 r) (= r (inv@204@01 r)))
    (= (- $Perm.Write (pTaken@206@01 r)) $Perm.No))
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@207@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@207@01  $FVF<f>)))
      (and (Set_in (inv@204@01 r) xs@192@01) (img@205@01 r)))
    (=>
      (and (Set_in (inv@204@01 r) xs@192@01) (img@205@01 r))
      (Set_in r ($FVF.domain_f (as sm@207@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@207@01  $FVF<f>))))
  :qid |qp.fvfDomDef45|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@204@01 r) xs@192@01) (img@205@01 r))
      (and
        (img@200@01 r)
        (Set_in (inv@199@01 r) (Set_union xs@192@01 ys@193@01))))
    (=
      ($FVF.lookup_f (as sm@207@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@197@01)) r)))
  :pattern (($FVF.lookup_f (as sm@207@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@197@01)) r))
  :qid |qp.fvfValDef44|)))
; [eval] (x in xs)
; [eval] n >= 0
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@207@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@192@01 x@194@01 n@196@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((z@203@01 $Ref)) (!
  (=>
    (Set_in z@203@01 xs@192@01)
    (and (= (inv@204@01 z@203@01) z@203@01) (img@205@01 z@203@01)))
  :pattern ((Set_in z@203@01 xs@192@01))
  :pattern ((inv@204@01 z@203@01))
  :pattern ((img@205@01 z@203@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@205@01 r) (Set_in (inv@204@01 r) xs@192@01))
    (= (inv@204@01 r) r))
  :pattern ((inv@204@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@207@01  $FVF<f>)))
      (and (Set_in (inv@204@01 r) xs@192@01) (img@205@01 r)))
    (=>
      (and (Set_in (inv@204@01 r) xs@192@01) (img@205@01 r))
      (Set_in r ($FVF.domain_f (as sm@207@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@207@01  $FVF<f>))))
  :qid |qp.fvfDomDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@204@01 r) xs@192@01) (img@205@01 r))
      (and
        (img@200@01 r)
        (Set_in (inv@199@01 r) (Set_union xs@192@01 ys@193@01))))
    (=
      ($FVF.lookup_f (as sm@207@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@197@01)) r)))
  :pattern (($FVF.lookup_f (as sm@207@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@197@01)) r))
  :qid |qp.fvfValDef44|)))
(assert (fun%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@207@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@192@01 x@194@01 n@196@01))
(declare-const v@208@01 Int)
(assert (=
  v@208@01
  (fun ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@207@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@192@01 x@194@01 n@196@01)))
; [exec]
; y.f := 0
; Precomputing data for removing quantified permissions
(define-fun pTaken@209@01 ((r $Ref)) $Perm
  (ite
    (= r y@195@01)
    ($Perm.min
      (ite
        (and
          (img@200@01 r)
          (Set_in (inv@199@01 r) (Set_union xs@192@01 ys@193@01)))
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
        (and
          (img@200@01 r)
          (Set_in (inv@199@01 r) (Set_union xs@192@01 ys@193@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@209@01 r))
    $Perm.No)
  
  :qid |quant-u-132|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@209@01 r) $Perm.No)
  
  :qid |quant-u-133|))))
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
  (=> (= r y@195@01) (= (- $Perm.Write (pTaken@209@01 r)) $Perm.No))
  
  :qid |quant-u-134|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@210@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@210@01  $FVF<f>) y@195@01) 0))
(pop) ; 2
(pop) ; 1
