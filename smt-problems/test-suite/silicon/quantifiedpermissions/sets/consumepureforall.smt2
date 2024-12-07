(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr
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
; ---------- m ----------
(declare-const S@0@01 Set<$Ref>)
(declare-const b@1@01 $Ref)
(declare-const S@2@01 Set<$Ref>)
(declare-const b@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const s@5@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@5@01 S@2@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@5@01 $Ref) (s2@5@01 $Ref)) (!
  (=>
    (and (Set_in s1@5@01 S@2@01) (Set_in s2@5@01 S@2@01) (= s1@5@01 s2@5@01))
    (= s1@5@01 s2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@5@01 $Ref)) (!
  (=>
    (Set_in s@5@01 S@2@01)
    (and (= (inv@6@01 s@5@01) s@5@01) (img@7@01 s@5@01)))
  :pattern ((Set_in s@5@01 S@2@01))
  :pattern ((inv@6@01 s@5@01))
  :pattern ((img@7@01 s@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) S@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@5@01 $Ref)) (!
  (=> (Set_in s@5@01 S@2@01) (not (= s@5@01 $Ref.null)))
  :pattern ((Set_in s@5@01 S@2@01))
  :pattern ((inv@6@01 s@5@01))
  :pattern ((img@7@01 s@5@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (forall p: Ref :: { (p in S) } (p in S) ==> p.f > 0)
(declare-const p@8@01 $Ref)
(push) ; 2
; [eval] (p in S) ==> p.f > 0
; [eval] (p in S)
(push) ; 3
; [then-branch: 0 | p@8@01 in S@2@01 | live]
; [else-branch: 0 | !(p@8@01 in S@2@01) | live]
(push) ; 4
; [then-branch: 0 | p@8@01 in S@2@01]
(assert (Set_in p@8@01 S@2@01))
; [eval] p.f > 0
(push) ; 5
(assert (not (and (img@7@01 p@8@01) (Set_in (inv@6@01 p@8@01) S@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(p@8@01 in S@2@01)]
(assert (not (Set_in p@8@01 S@2@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in p@8@01 S@2@01)) (Set_in p@8@01 S@2@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@8@01 $Ref)) (!
  (or (not (Set_in p@8@01 S@2@01)) (Set_in p@8@01 S@2@01))
  :pattern ((Set_in p@8@01 S@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@8@11@8@45-aux|)))
(assert (forall ((p@8@01 $Ref)) (!
  (=>
    (Set_in p@8@01 S@2@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) p@8@01)
      0))
  :pattern ((Set_in p@8@01 S@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@8@11@8@45|)))
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@3@01 S@2@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 ($Snap.combine ($Snap.first $t@9@01) ($Snap.second $t@9@01))))
(declare-const sm@10@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@10@01  $FVF<f>) b@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@9@01))))
(assert (not (= b@3@01 $Ref.null)))
(assert (= ($Snap.second $t@9@01) $Snap.unit))
; [eval] b.f > 0
(assert (> ($FVF.lookup_f (as sm@10@01  $FVF<f>) b@3@01) 0))
(pop) ; 2
(push) ; 2
; Precomputing data for removing quantified permissions
(define-fun pTaken@11@01 ((r $Ref)) $Perm
  (ite
    (= r b@3@01)
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) S@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) S@2@01)) $Perm.Write $Perm.No)
      (pTaken@11@01 r))
    $Perm.No)
  
  :qid |quant-u-3|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@11@01 r) $Perm.No)
  
  :qid |quant-u-4|))))
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
  (=> (= r b@3@01) (= (- $Perm.Write (pTaken@11@01 r)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@12@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@7@01 b@3@01) (Set_in (inv@6@01 b@3@01) S@2@01))
  (=
    ($FVF.lookup_f (as sm@12@01  $FVF<f>) b@3@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) b@3@01))))
; [eval] b.f > 0
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) S@2@01))
    (=
      ($FVF.lookup_f (as sm@12@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef0|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (and (img@7@01 b@3@01) (Set_in (inv@6@01 b@3@01) S@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (> ($FVF.lookup_f (as sm@12@01  $FVF<f>) b@3@01) 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (> ($FVF.lookup_f (as sm@12@01  $FVF<f>) b@3@01) 0))
(pop) ; 2
(pop) ; 1
; ---------- m4 ----------
(declare-const S@13@01 Set<$Ref>)
(declare-const T@14@01 Set<$Ref>)
(declare-const S@15@01 Set<$Ref>)
(declare-const T@16@01 Set<$Ref>)
(push) ; 1
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(declare-const s@18@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@18@01 S@15@01))
(pop) ; 2
(declare-fun inv@19@01 ($Ref) $Ref)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@18@01 $Ref) (s2@18@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@18@01 S@15@01)
      (Set_in s2@18@01 S@15@01)
      (= s1@18@01 s2@18@01))
    (= s1@18@01 s2@18@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@18@01 $Ref)) (!
  (=>
    (Set_in s@18@01 S@15@01)
    (and (= (inv@19@01 s@18@01) s@18@01) (img@20@01 s@18@01)))
  :pattern ((Set_in s@18@01 S@15@01))
  :pattern ((inv@19@01 s@18@01))
  :pattern ((img@20@01 s@18@01))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01)) (= (inv@19@01 r) r))
  :pattern ((inv@19@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@18@01 $Ref)) (!
  (=> (Set_in s@18@01 S@15@01) (not (= s@18@01 $Ref.null)))
  :pattern ((Set_in s@18@01 S@15@01))
  :pattern ((inv@19@01 s@18@01))
  :pattern ((img@20@01 s@18@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(declare-const t@21@01 $Ref)
(push) ; 2
; [eval] (t in T)
(assert (Set_in t@21@01 T@16@01))
(pop) ; 2
(declare-fun inv@22@01 ($Ref) $Ref)
(declare-fun img@23@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((t1@21@01 $Ref) (t2@21@01 $Ref)) (!
  (=>
    (and
      (Set_in t1@21@01 T@16@01)
      (Set_in t2@21@01 T@16@01)
      (= t1@21@01 t2@21@01))
    (= t1@21@01 t2@21@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((t@21@01 $Ref)) (!
  (=>
    (Set_in t@21@01 T@16@01)
    (and (= (inv@22@01 t@21@01) t@21@01) (img@23@01 t@21@01)))
  :pattern ((Set_in t@21@01 T@16@01))
  :pattern ((inv@22@01 t@21@01))
  :pattern ((img@23@01 t@21@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01)) (= (inv@22@01 r) r))
  :pattern ((inv@22@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((t@21@01 $Ref)) (!
  (=> (Set_in t@21@01 T@16@01) (not (= t@21@01 $Ref.null)))
  :pattern ((Set_in t@21@01 T@16@01))
  :pattern ((inv@22@01 t@21@01))
  :pattern ((img@23@01 t@21@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= t@21@01 s@18@01)
    (=
      (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
      (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))))
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@17@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@17@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@17@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@17@01))) $Snap.unit))
; [eval] (forall u: Ref :: { (u in S) } (u in S) ==> u.f > 0)
(declare-const u@24@01 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (u in S) ==> u.f > 0
; [eval] (u in S)
(push) ; 3
; [then-branch: 1 | u@24@01 in S@15@01 | live]
; [else-branch: 1 | !(u@24@01 in S@15@01) | live]
(push) ; 4
; [then-branch: 1 | u@24@01 in S@15@01]
(assert (Set_in u@24@01 S@15@01))
; [eval] u.f > 0
(declare-const sm@25@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@26@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@26@01  $FPM) r)
    (+
      (ite
        (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@26@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(push) ; 5
(assert (not (< $Perm.No ($FVF.perm_f (as pm@26@01  $FPM) u@24@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 1 | !(u@24@01 in S@15@01)]
(assert (not (Set_in u@24@01 S@15@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@26@01  $FPM) r)
    (+
      (ite
        (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@26@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Joined path conditions
(assert (or (not (Set_in u@24@01 S@15@01)) (Set_in u@24@01 S@15@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@26@01  $FPM) r)
    (+
      (ite
        (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@26@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((u@24@01 $Ref)) (!
  (or (not (Set_in u@24@01 S@15@01)) (Set_in u@24@01 S@15@01))
  :pattern ((Set_in u@24@01 S@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@18@11@18@47-aux|)))
(assert (forall ((u@24@01 $Ref)) (!
  (=>
    (Set_in u@24@01 S@15@01)
    (> ($FVF.lookup_f (as sm@25@01  $FVF<f>) u@24@01) 0))
  :pattern ((Set_in u@24@01 S@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@18@11@18@47|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@17@01))) $Snap.unit))
; [eval] (forall v: Ref :: { (v in T) } (v in T) ==> v.f > 0)
(declare-const v@27@01 $Ref)
(push) ; 2
; [eval] (v in T) ==> v.f > 0
; [eval] (v in T)
(push) ; 3
; [then-branch: 2 | v@27@01 in T@16@01 | live]
; [else-branch: 2 | !(v@27@01 in T@16@01) | live]
(push) ; 4
; [then-branch: 2 | v@27@01 in T@16@01]
(assert (Set_in v@27@01 T@16@01))
; [eval] v.f > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
      (=
        ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
    :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
      (=
        ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
    :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 5
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@20@01 v@27@01) (Set_in (inv@19@01 v@27@01) S@15@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@23@01 v@27@01) (Set_in (inv@22@01 v@27@01) T@16@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(v@27@01 in T@16@01)]
(assert (not (Set_in v@27@01 T@16@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef2|)))
; Joined path conditions
(assert (or (not (Set_in v@27@01 T@16@01)) (Set_in v@27@01 T@16@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((v@27@01 $Ref)) (!
  (or (not (Set_in v@27@01 T@16@01)) (Set_in v@27@01 T@16@01))
  :pattern ((Set_in v@27@01 T@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@19@11@19@46-aux|)))
(assert (forall ((v@27@01 $Ref)) (!
  (=>
    (Set_in v@27@01 T@16@01)
    (> ($FVF.lookup_f (as sm@25@01  $FVF<f>) v@27@01) 0))
  :pattern ((Set_in v@27@01 T@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@19@11@19@46|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(declare-const x@29@01 $Ref)
(push) ; 3
; [eval] (x in (T union S))
; [eval] (T union S)
(assert (Set_in x@29@01 (Set_union T@16@01 S@15@01)))
(pop) ; 3
(declare-fun inv@30@01 ($Ref) $Ref)
(declare-fun img@31@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@29@01 $Ref) (x2@29@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@29@01 (Set_union T@16@01 S@15@01))
      (Set_in x2@29@01 (Set_union T@16@01 S@15@01))
      (= x1@29@01 x2@29@01))
    (= x1@29@01 x2@29@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@29@01 $Ref)) (!
  (=>
    (Set_in x@29@01 (Set_union T@16@01 S@15@01))
    (and (= (inv@30@01 x@29@01) x@29@01) (img@31@01 x@29@01)))
  :pattern ((Set_in x@29@01 (Set_union T@16@01 S@15@01)))
  :pattern ((inv@30@01 x@29@01))
  :pattern ((img@31@01 x@29@01))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (Set_in (inv@30@01 r) (Set_union T@16@01 S@15@01)))
    (= (inv@30@01 r) r))
  :pattern ((inv@30@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@29@01 $Ref)) (!
  (=> (Set_in x@29@01 (Set_union T@16@01 S@15@01)) (not (= x@29@01 $Ref.null)))
  :pattern ((Set_in x@29@01 (Set_union T@16@01 S@15@01)))
  :pattern ((inv@30@01 x@29@01))
  :pattern ((img@31@01 x@29@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@28@01) $Snap.unit))
; [eval] (forall y: Ref :: { (y in (T union S)) } (y in (T union S)) ==> y.f > 0)
(declare-const y@32@01 $Ref)
(push) ; 3
; [eval] (y in (T union S)) ==> y.f > 0
; [eval] (y in (T union S))
; [eval] (T union S)
(push) ; 4
; [then-branch: 3 | y@32@01 in T@16@01 ∪ S@15@01 | live]
; [else-branch: 3 | !(y@32@01 in T@16@01 ∪ S@15@01) | live]
(push) ; 5
; [then-branch: 3 | y@32@01 in T@16@01 ∪ S@15@01]
(assert (Set_in y@32@01 (Set_union T@16@01 S@15@01)))
; [eval] y.f > 0
(push) ; 6
(assert (not (and
  (img@31@01 y@32@01)
  (Set_in (inv@30@01 y@32@01) (Set_union T@16@01 S@15@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(y@32@01 in T@16@01 ∪ S@15@01)]
(assert (not (Set_in y@32@01 (Set_union T@16@01 S@15@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Set_in y@32@01 (Set_union T@16@01 S@15@01)))
  (Set_in y@32@01 (Set_union T@16@01 S@15@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@32@01 $Ref)) (!
  (or
    (not (Set_in y@32@01 (Set_union T@16@01 S@15@01)))
    (Set_in y@32@01 (Set_union T@16@01 S@15@01)))
  :pattern ((Set_in y@32@01 (Set_union T@16@01 S@15@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@21@10@21@55-aux|)))
(assert (forall ((y@32@01 $Ref)) (!
  (=>
    (Set_in y@32@01 (Set_union T@16@01 S@15@01))
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@28@01)) y@32@01)
      0))
  :pattern ((Set_in y@32@01 (Set_union T@16@01 S@15@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@21@10@21@55|)))
(pop) ; 2
(push) ; 2
(declare-const x@33@01 $Ref)
(push) ; 3
; [eval] (x in (T union S))
; [eval] (T union S)
(assert (Set_in x@33@01 (Set_union T@16@01 S@15@01)))
(pop) ; 3
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@33@01 $Ref) (x2@33@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@33@01 (Set_union T@16@01 S@15@01))
      (Set_in x2@33@01 (Set_union T@16@01 S@15@01))
      (= x1@33@01 x2@33@01))
    (= x1@33@01 x2@33@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (Set_in x@33@01 (Set_union T@16@01 S@15@01))
    (and (= (inv@34@01 x@33@01) x@33@01) (img@35@01 x@33@01)))
  :pattern ((Set_in x@33@01 (Set_union T@16@01 S@15@01)))
  :pattern ((inv@34@01 x@33@01))
  :pattern ((img@35@01 x@33@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@35@01 r) (Set_in (inv@34@01 r) (Set_union T@16@01 S@15@01)))
    (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@34@01 r) (Set_union T@16@01 S@15@01))
      (img@35@01 r)
      (= r (inv@34@01 r)))
    ($Perm.min
      (ite
        (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@34@01 r) (Set_union T@16@01 S@15@01))
      (img@35@01 r)
      (= r (inv@34@01 r)))
    ($Perm.min
      (ite
        (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@36@01 r)))
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
        (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
        $Perm.Write
        $Perm.No)
      (pTaken@36@01 r))
    $Perm.No)
  
  :qid |quant-u-15|))))
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
      (Set_in (inv@34@01 r) (Set_union T@16@01 S@15@01))
      (img@35@01 r)
      (= r (inv@34@01 r)))
    (= (- $Perm.Write (pTaken@36@01 r)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
        $Perm.Write
        $Perm.No)
      (pTaken@37@01 r))
    $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@37@01 r) $Perm.No)
  
  :qid |quant-u-18|))))
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
      (Set_in (inv@34@01 r) (Set_union T@16@01 S@15@01))
      (img@35@01 r)
      (= r (inv@34@01 r)))
    (= (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@37@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall y: Ref :: { (y in (T union S)) } (y in (T union S)) ==> y.f > 0)
(declare-const y@38@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (y in (T union S)) ==> y.f > 0
; [eval] (y in (T union S))
; [eval] (T union S)
(push) ; 4
; [then-branch: 4 | y@38@01 in T@16@01 ∪ S@15@01 | live]
; [else-branch: 4 | !(y@38@01 in T@16@01 ∪ S@15@01) | live]
(push) ; 5
; [then-branch: 4 | y@38@01 in T@16@01 ∪ S@15@01]
(assert (Set_in y@38@01 (Set_union T@16@01 S@15@01)))
; [eval] y.f > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
      (=
        ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
    :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
      (=
        ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
    :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@20@01 y@38@01) (Set_in (inv@19@01 y@38@01) S@15@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@23@01 y@38@01) (Set_in (inv@22@01 y@38@01) T@16@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(y@38@01 in T@16@01 ∪ S@15@01)]
(assert (not (Set_in y@38@01 (Set_union T@16@01 S@15@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef2|)))
; Joined path conditions
(assert (or
  (not (Set_in y@38@01 (Set_union T@16@01 S@15@01)))
  (Set_in y@38@01 (Set_union T@16@01 S@15@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@20@01 r) (Set_in (inv@19@01 r) S@15@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@17@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (Set_in (inv@22@01 r) T@16@01))
    (=
      ($FVF.lookup_f (as sm@25@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r)))
  :pattern (($FVF.lookup_f (as sm@25@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@17@01))) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((y@38@01 $Ref)) (!
  (or
    (not (Set_in y@38@01 (Set_union T@16@01 S@15@01)))
    (Set_in y@38@01 (Set_union T@16@01 S@15@01)))
  :pattern ((Set_in y@38@01 (Set_union T@16@01 S@15@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@21@10@21@55-aux|)))
(push) ; 3
(assert (not (forall ((y@38@01 $Ref)) (!
  (=>
    (Set_in y@38@01 (Set_union T@16@01 S@15@01))
    (> ($FVF.lookup_f (as sm@25@01  $FVF<f>) y@38@01) 0))
  :pattern ((Set_in y@38@01 (Set_union T@16@01 S@15@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@21@10@21@55|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((y@38@01 $Ref)) (!
  (=>
    (Set_in y@38@01 (Set_union T@16@01 S@15@01))
    (> ($FVF.lookup_f (as sm@25@01  $FVF<f>) y@38@01) 0))
  :pattern ((Set_in y@38@01 (Set_union T@16@01 S@15@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@21@10@21@55|)))
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const S@39@01 Set<$Ref>)
(declare-const b@40@01 $Ref)
(declare-const S@41@01 Set<$Ref>)
(declare-const b@42@01 $Ref)
(push) ; 1
(declare-const $t@43@01 $Snap)
(assert (= $t@43@01 ($Snap.combine ($Snap.first $t@43@01) ($Snap.second $t@43@01))))
(declare-const s@44@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@44@01 S@41@01))
(pop) ; 2
(declare-fun inv@45@01 ($Ref) $Ref)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@44@01 $Ref) (s2@44@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@44@01 S@41@01)
      (Set_in s2@44@01 S@41@01)
      (= s1@44@01 s2@44@01))
    (= s1@44@01 s2@44@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@44@01 $Ref)) (!
  (=>
    (Set_in s@44@01 S@41@01)
    (and (= (inv@45@01 s@44@01) s@44@01) (img@46@01 s@44@01)))
  :pattern ((Set_in s@44@01 S@41@01))
  :pattern ((inv@45@01 s@44@01))
  :pattern ((img@46@01 s@44@01))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01)) (= (inv@45@01 r) r))
  :pattern ((inv@45@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@44@01 $Ref)) (!
  (=> (Set_in s@44@01 S@41@01) (not (= s@44@01 $Ref.null)))
  :pattern ((Set_in s@44@01 S@41@01))
  :pattern ((inv@45@01 s@44@01))
  :pattern ((img@46@01 s@44@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@43@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@43@01))
    ($Snap.second ($Snap.second $t@43@01)))))
(assert (= ($Snap.first ($Snap.second $t@43@01)) $Snap.unit))
; [eval] (forall p: Ref :: { (p in S) } (p in S) ==> p.f > 0)
(declare-const p@47@01 $Ref)
(push) ; 2
; [eval] (p in S) ==> p.f > 0
; [eval] (p in S)
(push) ; 3
; [then-branch: 5 | p@47@01 in S@41@01 | live]
; [else-branch: 5 | !(p@47@01 in S@41@01) | live]
(push) ; 4
; [then-branch: 5 | p@47@01 in S@41@01]
(assert (Set_in p@47@01 S@41@01))
; [eval] p.f > 0
(push) ; 5
(assert (not (and (img@46@01 p@47@01) (Set_in (inv@45@01 p@47@01) S@41@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(p@47@01 in S@41@01)]
(assert (not (Set_in p@47@01 S@41@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in p@47@01 S@41@01)) (Set_in p@47@01 S@41@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((p@47@01 $Ref)) (!
  (or (not (Set_in p@47@01 S@41@01)) (Set_in p@47@01 S@41@01))
  :pattern ((Set_in p@47@01 S@41@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@29@11@29@46-aux|)))
(assert (forall ((p@47@01 $Ref)) (!
  (=>
    (Set_in p@47@01 S@41@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) p@47@01)
      0))
  :pattern ((Set_in p@47@01 S@41@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@29@11@29@46|)))
(assert (= ($Snap.second ($Snap.second $t@43@01)) $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@42@01 S@41@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(declare-const r@49@01 $Ref)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@49@01 S@41@01))
(pop) ; 3
(declare-fun inv@50@01 ($Ref) $Ref)
(declare-fun img@51@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@49@01 $Ref) (r2@49@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@49@01 S@41@01)
      (Set_in r2@49@01 S@41@01)
      (= r1@49@01 r2@49@01))
    (= r1@49@01 r2@49@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@49@01 $Ref)) (!
  (=>
    (Set_in r@49@01 S@41@01)
    (and (= (inv@50@01 r@49@01) r@49@01) (img@51@01 r@49@01)))
  :pattern ((Set_in r@49@01 S@41@01))
  :pattern ((inv@50@01 r@49@01))
  :pattern ((img@51@01 r@49@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@51@01 r) (Set_in (inv@50@01 r) S@41@01)) (= (inv@50@01 r) r))
  :pattern ((inv@50@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@49@01 $Ref)) (!
  (=> (Set_in r@49@01 S@41@01) (not (= r@49@01 $Ref.null)))
  :pattern ((Set_in r@49@01 S@41@01))
  :pattern ((inv@50@01 r@49@01))
  :pattern ((img@51@01 r@49@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@48@01) $Snap.unit))
; [eval] (forall q: Ref :: { (q in S) } (q in S) ==> q.f > 0)
(declare-const q@52@01 $Ref)
(push) ; 3
; [eval] (q in S) ==> q.f > 0
; [eval] (q in S)
(push) ; 4
; [then-branch: 6 | q@52@01 in S@41@01 | live]
; [else-branch: 6 | !(q@52@01 in S@41@01) | live]
(push) ; 5
; [then-branch: 6 | q@52@01 in S@41@01]
(assert (Set_in q@52@01 S@41@01))
; [eval] q.f > 0
(push) ; 6
(assert (not (and (img@51@01 q@52@01) (Set_in (inv@50@01 q@52@01) S@41@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(q@52@01 in S@41@01)]
(assert (not (Set_in q@52@01 S@41@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in q@52@01 S@41@01)) (Set_in q@52@01 S@41@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((q@52@01 $Ref)) (!
  (or (not (Set_in q@52@01 S@41@01)) (Set_in q@52@01 S@41@01))
  :pattern ((Set_in q@52@01 S@41@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@32@10@32@46-aux|)))
(assert (forall ((q@52@01 $Ref)) (!
  (=>
    (Set_in q@52@01 S@41@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@48@01)) q@52@01)
      0))
  :pattern ((Set_in q@52@01 S@41@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@32@10@32@46|)))
(pop) ; 2
(push) ; 2
; [exec]
; b.f := 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@53@01 ((r $Ref)) $Perm
  (ite
    (= r b@42@01)
    ($Perm.min
      (ite
        (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01))
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
        (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01))
        $Perm.Write
        $Perm.No)
      (pTaken@53@01 r))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@53@01 r) $Perm.No)
  
  :qid |quant-u-26|))))
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
  (=> (= r b@42@01) (= (- $Perm.Write (pTaken@53@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@54@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@54@01  $FVF<f>) b@42@01) 3))
(declare-const r@55@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@55@01 S@41@01))
(pop) ; 3
(declare-fun inv@56@01 ($Ref) $Ref)
(declare-fun img@57@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@55@01 $Ref) (r2@55@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@55@01 S@41@01)
      (Set_in r2@55@01 S@41@01)
      (= r1@55@01 r2@55@01))
    (= r1@55@01 r2@55@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@55@01 $Ref)) (!
  (=>
    (Set_in r@55@01 S@41@01)
    (and (= (inv@56@01 r@55@01) r@55@01) (img@57@01 r@55@01)))
  :pattern ((Set_in r@55@01 S@41@01))
  :pattern ((inv@56@01 r@55@01))
  :pattern ((img@57@01 r@55@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@57@01 r) (Set_in (inv@56@01 r) S@41@01)) (= (inv@56@01 r) r))
  :pattern ((inv@56@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@56@01 r) S@41@01) (img@57@01 r) (= r (inv@56@01 r)))
    ($Perm.min
      (ite
        (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01))
        (- $Perm.Write (pTaken@53@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@59@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@56@01 r) S@41@01) (img@57@01 r) (= r (inv@56@01 r)))
    ($Perm.min
      (ite (= r b@42@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@58@01 r)))
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
        (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01))
        (- $Perm.Write (pTaken@53@01 r))
        $Perm.No)
      (pTaken@58@01 r))
    $Perm.No)
  
  :qid |quant-u-30|))))
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
    (and (Set_in (inv@56@01 r) S@41@01) (img@57@01 r) (= r (inv@56@01 r)))
    (= (- $Perm.Write (pTaken@58@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@59@01 b@42@01)) $Perm.No)))
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
    (and (Set_in (inv@56@01 r) S@41@01) (img@57@01 r) (= r (inv@56@01 r)))
    (= (- (- $Perm.Write (pTaken@58@01 r)) (pTaken@59@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@60@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@42@01)
    (=
      ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@54@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@54@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) r))
  :qid |qp.fvfValDef5|)))
; [eval] (forall q: Ref :: { (q in S) } (q in S) ==> q.f > 0)
(declare-const q@61@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (q in S) ==> q.f > 0
; [eval] (q in S)
(push) ; 4
; [then-branch: 7 | q@61@01 in S@41@01 | live]
; [else-branch: 7 | !(q@61@01 in S@41@01) | live]
(push) ; 5
; [then-branch: 7 | q@61@01 in S@41@01]
(assert (Set_in q@61@01 S@41@01))
; [eval] q.f > 0
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r b@42@01)
      (=
        ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@54@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@54@01  $FVF<f>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01))
        (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) r)))
    :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) r))
    :qid |qp.fvfValDef5|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= q@61@01 b@42@01) $Perm.Write $Perm.No)
    (ite
      (and (img@46@01 q@61@01) (Set_in (inv@45@01 q@61@01) S@41@01))
      (- $Perm.Write (pTaken@53@01 q@61@01))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(q@61@01 in S@41@01)]
(assert (not (Set_in q@61@01 S@41@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@42@01)
    (=
      ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@54@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@54@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) r))
  :qid |qp.fvfValDef5|)))
; Joined path conditions
(assert (or (not (Set_in q@61@01 S@41@01)) (Set_in q@61@01 S@41@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@42@01)
    (=
      ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@54@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@54@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@46@01 r) (Set_in (inv@45@01 r) S@41@01))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@43@01)) r))
  :qid |qp.fvfValDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((q@61@01 $Ref)) (!
  (or (not (Set_in q@61@01 S@41@01)) (Set_in q@61@01 S@41@01))
  :pattern ((Set_in q@61@01 S@41@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@32@10@32@46-aux|)))
(push) ; 3
(assert (not (forall ((q@61@01 $Ref)) (!
  (=>
    (Set_in q@61@01 S@41@01)
    (> ($FVF.lookup_f (as sm@60@01  $FVF<f>) q@61@01) 0))
  :pattern ((Set_in q@61@01 S@41@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@32@10@32@46|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((q@61@01 $Ref)) (!
  (=>
    (Set_in q@61@01 S@41@01)
    (> ($FVF.lookup_f (as sm@60@01  $FVF<f>) q@61@01) 0))
  :pattern ((Set_in q@61@01 S@41@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@32@10@32@46|)))
(pop) ; 2
(pop) ; 1
; ---------- m13 ----------
(declare-const S@62@01 Set<$Ref>)
(declare-const b@63@01 $Ref)
(declare-const a@64@01 Int)
(declare-const S@65@01 Set<$Ref>)
(declare-const b@66@01 $Ref)
(declare-const a@67@01 Int)
(push) ; 1
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 ($Snap.combine ($Snap.first $t@68@01) ($Snap.second $t@68@01))))
(declare-const s@69@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@69@01 S@65@01))
(pop) ; 2
(declare-fun inv@70@01 ($Ref) $Ref)
(declare-fun img@71@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@69@01 $Ref) (s2@69@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@69@01 S@65@01)
      (Set_in s2@69@01 S@65@01)
      (= s1@69@01 s2@69@01))
    (= s1@69@01 s2@69@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@69@01 $Ref)) (!
  (=>
    (Set_in s@69@01 S@65@01)
    (and (= (inv@70@01 s@69@01) s@69@01) (img@71@01 s@69@01)))
  :pattern ((Set_in s@69@01 S@65@01))
  :pattern ((inv@70@01 s@69@01))
  :pattern ((img@71@01 s@69@01))
  :qid |quant-u-35|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@71@01 r) (Set_in (inv@70@01 r) S@65@01)) (= (inv@70@01 r) r))
  :pattern ((inv@70@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@69@01 $Ref)) (!
  (=> (Set_in s@69@01 S@65@01) (not (= s@69@01 $Ref.null)))
  :pattern ((Set_in s@69@01 S@65@01))
  :pattern ((inv@70@01 s@69@01))
  :pattern ((img@71@01 s@69@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@68@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@68@01))
    ($Snap.second ($Snap.second $t@68@01)))))
(assert (= ($Snap.first ($Snap.second $t@68@01)) $Snap.unit))
; [eval] S == Set(b)
; [eval] Set(b)
(assert (Set_equal S@65@01 (Set_singleton b@66@01)))
(assert (= ($Snap.second ($Snap.second $t@68@01)) $Snap.unit))
; [eval] b.f == a
(push) ; 2
(assert (not (and (img@71@01 b@66@01) (Set_in (inv@70@01 b@66@01) S@65@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@68@01)) b@66@01)
  a@67@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 ($Snap.combine ($Snap.first $t@72@01) ($Snap.second $t@72@01))))
(declare-const r@73@01 $Ref)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@73@01 S@65@01))
(pop) ; 3
(declare-fun inv@74@01 ($Ref) $Ref)
(declare-fun img@75@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@73@01 $Ref) (r2@73@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@73@01 S@65@01)
      (Set_in r2@73@01 S@65@01)
      (= r1@73@01 r2@73@01))
    (= r1@73@01 r2@73@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@73@01 $Ref)) (!
  (=>
    (Set_in r@73@01 S@65@01)
    (and (= (inv@74@01 r@73@01) r@73@01) (img@75@01 r@73@01)))
  :pattern ((Set_in r@73@01 S@65@01))
  :pattern ((inv@74@01 r@73@01))
  :pattern ((img@75@01 r@73@01))
  :qid |quant-u-37|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@75@01 r) (Set_in (inv@74@01 r) S@65@01)) (= (inv@74@01 r) r))
  :pattern ((inv@74@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@73@01 $Ref)) (!
  (=> (Set_in r@73@01 S@65@01) (not (= r@73@01 $Ref.null)))
  :pattern ((Set_in r@73@01 S@65@01))
  :pattern ((inv@74@01 r@73@01))
  :pattern ((img@75@01 r@73@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@72@01) $Snap.unit))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
(declare-const t@76@01 $Ref)
(push) ; 3
; [eval] (t in S) ==> t.f > 2 * a
; [eval] (t in S)
(push) ; 4
; [then-branch: 8 | t@76@01 in S@65@01 | live]
; [else-branch: 8 | !(t@76@01 in S@65@01) | live]
(push) ; 5
; [then-branch: 8 | t@76@01 in S@65@01]
(assert (Set_in t@76@01 S@65@01))
; [eval] t.f > 2 * a
(push) ; 6
(assert (not (and (img@75@01 t@76@01) (Set_in (inv@74@01 t@76@01) S@65@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 2 * a
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(t@76@01 in S@65@01)]
(assert (not (Set_in t@76@01 S@65@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@76@01 S@65@01)) (Set_in t@76@01 S@65@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@76@01 $Ref)) (!
  (or (not (Set_in t@76@01 S@65@01)) (Set_in t@76@01 S@65@01))
  :pattern ((Set_in t@76@01 S@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@42@10@42@54-aux|)))
(assert (forall ((t@76@01 $Ref)) (!
  (=>
    (Set_in t@76@01 S@65@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@72@01)) t@76@01)
      (* 2 a@67@01)))
  :pattern ((Set_in t@76@01 S@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@42@10@42@54|)))
(pop) ; 2
(push) ; 2
; [exec]
; b.f := 2 * a + 1
; [eval] 2 * a + 1
; [eval] 2 * a
; Precomputing data for removing quantified permissions
(define-fun pTaken@77@01 ((r $Ref)) $Perm
  (ite
    (= r b@66@01)
    ($Perm.min
      (ite
        (and (img@71@01 r) (Set_in (inv@70@01 r) S@65@01))
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
        (and (img@71@01 r) (Set_in (inv@70@01 r) S@65@01))
        $Perm.Write
        $Perm.No)
      (pTaken@77@01 r))
    $Perm.No)
  
  :qid |quant-u-39|))))
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
  (=> (= r b@66@01) (= (- $Perm.Write (pTaken@77@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@78@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@78@01  $FVF<f>) b@66@01) (+ (* 2 a@67@01) 1)))
(declare-const r@79@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@79@01 S@65@01))
(pop) ; 3
(declare-fun inv@80@01 ($Ref) $Ref)
(declare-fun img@81@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@79@01 $Ref) (r2@79@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@79@01 S@65@01)
      (Set_in r2@79@01 S@65@01)
      (= r1@79@01 r2@79@01))
    (= r1@79@01 r2@79@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@79@01 $Ref)) (!
  (=>
    (Set_in r@79@01 S@65@01)
    (and (= (inv@80@01 r@79@01) r@79@01) (img@81@01 r@79@01)))
  :pattern ((Set_in r@79@01 S@65@01))
  :pattern ((inv@80@01 r@79@01))
  :pattern ((img@81@01 r@79@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@81@01 r) (Set_in (inv@80@01 r) S@65@01)) (= (inv@80@01 r) r))
  :pattern ((inv@80@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@82@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@80@01 r) S@65@01) (img@81@01 r) (= r (inv@80@01 r)))
    ($Perm.min (ite (= r b@66@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@82@01 b@66@01)) $Perm.No)))
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
    (and (Set_in (inv@80@01 r) S@65@01) (img@81@01 r) (= r (inv@80@01 r)))
    (= (- $Perm.Write (pTaken@82@01 r)) $Perm.No))
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@83@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@66@01)
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :qid |qp.fvfValDef6|)))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
(declare-const t@84@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f > 2 * a
; [eval] (t in S)
(push) ; 4
; [then-branch: 9 | t@84@01 in S@65@01 | live]
; [else-branch: 9 | !(t@84@01 in S@65@01) | live]
(push) ; 5
; [then-branch: 9 | t@84@01 in S@65@01]
(assert (Set_in t@84@01 S@65@01))
; [eval] t.f > 2 * a
(push) ; 6
(assert (not (= t@84@01 b@66@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 2 * a
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(t@84@01 in S@65@01)]
(assert (not (Set_in t@84@01 S@65@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@84@01 S@65@01)) (Set_in t@84@01 S@65@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@84@01 $Ref)) (!
  (or (not (Set_in t@84@01 S@65@01)) (Set_in t@84@01 S@65@01))
  :pattern ((Set_in t@84@01 S@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@42@10@42@54-aux|)))
(push) ; 3
(assert (not (forall ((t@84@01 $Ref)) (!
  (=>
    (Set_in t@84@01 S@65@01)
    (> ($FVF.lookup_f (as sm@83@01  $FVF<f>) t@84@01) (* 2 a@67@01)))
  :pattern ((Set_in t@84@01 S@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@42@10@42@54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((t@84@01 $Ref)) (!
  (=>
    (Set_in t@84@01 S@65@01)
    (> ($FVF.lookup_f (as sm@83@01  $FVF<f>) t@84@01) (* 2 a@67@01)))
  :pattern ((Set_in t@84@01 S@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@42@10@42@54|)))
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const S@85@01 Set<$Ref>)
(declare-const b@86@01 $Ref)
(declare-const a@87@01 Int)
(declare-const S@88@01 Set<$Ref>)
(declare-const b@89@01 $Ref)
(declare-const a@90@01 Int)
(push) ; 1
(declare-const $t@91@01 $Snap)
(assert (= $t@91@01 ($Snap.combine ($Snap.first $t@91@01) ($Snap.second $t@91@01))))
(declare-const s@92@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@92@01 S@88@01))
(pop) ; 2
(declare-fun inv@93@01 ($Ref) $Ref)
(declare-fun img@94@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@92@01 $Ref) (s2@92@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@92@01 S@88@01)
      (Set_in s2@92@01 S@88@01)
      (= s1@92@01 s2@92@01))
    (= s1@92@01 s2@92@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@92@01 $Ref)) (!
  (=>
    (Set_in s@92@01 S@88@01)
    (and (= (inv@93@01 s@92@01) s@92@01) (img@94@01 s@92@01)))
  :pattern ((Set_in s@92@01 S@88@01))
  :pattern ((inv@93@01 s@92@01))
  :pattern ((img@94@01 s@92@01))
  :qid |quant-u-46|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@94@01 r) (Set_in (inv@93@01 r) S@88@01)) (= (inv@93@01 r) r))
  :pattern ((inv@93@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@92@01 $Ref)) (!
  (=> (Set_in s@92@01 S@88@01) (not (= s@92@01 $Ref.null)))
  :pattern ((Set_in s@92@01 S@88@01))
  :pattern ((inv@93@01 s@92@01))
  :pattern ((img@94@01 s@92@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@91@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@91@01))
    ($Snap.second ($Snap.second $t@91@01)))))
(assert (= ($Snap.first ($Snap.second $t@91@01)) $Snap.unit))
; [eval] S == Set(b)
; [eval] Set(b)
(assert (Set_equal S@88@01 (Set_singleton b@89@01)))
(assert (= ($Snap.second ($Snap.second $t@91@01)) $Snap.unit))
; [eval] b.f == a
(push) ; 2
(assert (not (and (img@94@01 b@89@01) (Set_in (inv@93@01 b@89@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@91@01)) b@89@01)
  a@90@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@95@01 $Snap)
(assert (= $t@95@01 ($Snap.combine ($Snap.first $t@95@01) ($Snap.second $t@95@01))))
(declare-const r@96@01 $Ref)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@96@01 S@88@01))
(pop) ; 3
(declare-fun inv@97@01 ($Ref) $Ref)
(declare-fun img@98@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@96@01 $Ref) (r2@96@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@96@01 S@88@01)
      (Set_in r2@96@01 S@88@01)
      (= r1@96@01 r2@96@01))
    (= r1@96@01 r2@96@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@96@01 $Ref)) (!
  (=>
    (Set_in r@96@01 S@88@01)
    (and (= (inv@97@01 r@96@01) r@96@01) (img@98@01 r@96@01)))
  :pattern ((Set_in r@96@01 S@88@01))
  :pattern ((inv@97@01 r@96@01))
  :pattern ((img@98@01 r@96@01))
  :qid |quant-u-48|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@98@01 r) (Set_in (inv@97@01 r) S@88@01)) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@96@01 $Ref)) (!
  (=> (Set_in r@96@01 S@88@01) (not (= r@96@01 $Ref.null)))
  :pattern ((Set_in r@96@01 S@88@01))
  :pattern ((inv@97@01 r@96@01))
  :pattern ((img@98@01 r@96@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@95@01) $Snap.unit))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
(declare-const t@99@01 $Ref)
(push) ; 3
; [eval] (t in S) ==> t.f > 2 * a
; [eval] (t in S)
(push) ; 4
; [then-branch: 10 | t@99@01 in S@88@01 | live]
; [else-branch: 10 | !(t@99@01 in S@88@01) | live]
(push) ; 5
; [then-branch: 10 | t@99@01 in S@88@01]
(assert (Set_in t@99@01 S@88@01))
; [eval] t.f > 2 * a
(push) ; 6
(assert (not (and (img@98@01 t@99@01) (Set_in (inv@97@01 t@99@01) S@88@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 2 * a
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(t@99@01 in S@88@01)]
(assert (not (Set_in t@99@01 S@88@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@99@01 S@88@01)) (Set_in t@99@01 S@88@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@99@01 $Ref)) (!
  (or (not (Set_in t@99@01 S@88@01)) (Set_in t@99@01 S@88@01))
  :pattern ((Set_in t@99@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@53@10@53@54-aux|)))
(assert (forall ((t@99@01 $Ref)) (!
  (=>
    (Set_in t@99@01 S@88@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@95@01)) t@99@01)
      (* 2 a@90@01)))
  :pattern ((Set_in t@99@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@53@10@53@54|)))
(pop) ; 2
(push) ; 2
; [exec]
; b.f := 2 * a + 1
; [eval] 2 * a + 1
; [eval] 2 * a
; Precomputing data for removing quantified permissions
(define-fun pTaken@100@01 ((r $Ref)) $Perm
  (ite
    (= r b@89@01)
    ($Perm.min
      (ite
        (and (img@94@01 r) (Set_in (inv@93@01 r) S@88@01))
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
        (and (img@94@01 r) (Set_in (inv@93@01 r) S@88@01))
        $Perm.Write
        $Perm.No)
      (pTaken@100@01 r))
    $Perm.No)
  
  :qid |quant-u-50|))))
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
  (=> (= r b@89@01) (= (- $Perm.Write (pTaken@100@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@101@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) b@89@01) (+ (* 2 a@90@01) 1)))
(declare-const r@102@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@102@01 S@88@01))
(pop) ; 3
(declare-fun inv@103@01 ($Ref) $Ref)
(declare-fun img@104@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@102@01 $Ref) (r2@102@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@102@01 S@88@01)
      (Set_in r2@102@01 S@88@01)
      (= r1@102@01 r2@102@01))
    (= r1@102@01 r2@102@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@102@01 $Ref)) (!
  (=>
    (Set_in r@102@01 S@88@01)
    (and (= (inv@103@01 r@102@01) r@102@01) (img@104@01 r@102@01)))
  :pattern ((Set_in r@102@01 S@88@01))
  :pattern ((inv@103@01 r@102@01))
  :pattern ((img@104@01 r@102@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@104@01 r) (Set_in (inv@103@01 r) S@88@01)) (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@103@01 r) S@88@01) (img@104@01 r) (= r (inv@103@01 r)))
    ($Perm.min (ite (= r b@89@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@105@01 b@89@01)) $Perm.No)))
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
    (and (Set_in (inv@103@01 r) S@88@01) (img@104@01 r) (= r (inv@103@01 r)))
    (= (- $Perm.Write (pTaken@105@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@106@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@89@01)
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :qid |qp.fvfValDef7|)))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
(declare-const t@107@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f > 2 * a
; [eval] (t in S)
(push) ; 4
; [then-branch: 11 | t@107@01 in S@88@01 | live]
; [else-branch: 11 | !(t@107@01 in S@88@01) | live]
(push) ; 5
; [then-branch: 11 | t@107@01 in S@88@01]
(assert (Set_in t@107@01 S@88@01))
; [eval] t.f > 2 * a
(push) ; 6
(assert (not (= t@107@01 b@89@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 2 * a
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(t@107@01 in S@88@01)]
(assert (not (Set_in t@107@01 S@88@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@107@01 S@88@01)) (Set_in t@107@01 S@88@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@107@01 $Ref)) (!
  (or (not (Set_in t@107@01 S@88@01)) (Set_in t@107@01 S@88@01))
  :pattern ((Set_in t@107@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@53@10@53@54-aux|)))
(push) ; 3
(assert (not (forall ((t@107@01 $Ref)) (!
  (=>
    (Set_in t@107@01 S@88@01)
    (> ($FVF.lookup_f (as sm@106@01  $FVF<f>) t@107@01) (* 2 a@90@01)))
  :pattern ((Set_in t@107@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@53@10@53@54|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((t@107@01 $Ref)) (!
  (=>
    (Set_in t@107@01 S@88@01)
    (> ($FVF.lookup_f (as sm@106@01  $FVF<f>) t@107@01) (* 2 a@90@01)))
  :pattern ((Set_in t@107@01 S@88@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@53@10@53@54|)))
(pop) ; 2
(pop) ; 1
; ---------- m7 ----------
(declare-const S@108@01 Set<$Ref>)
(declare-const b@109@01 $Ref)
(declare-const a@110@01 Int)
(declare-const S@111@01 Set<$Ref>)
(declare-const b@112@01 $Ref)
(declare-const a@113@01 Int)
(push) ; 1
(declare-const $t@114@01 $Snap)
(assert (= $t@114@01 ($Snap.combine ($Snap.first $t@114@01) ($Snap.second $t@114@01))))
(declare-const s@115@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@115@01 S@111@01))
(pop) ; 2
(declare-fun inv@116@01 ($Ref) $Ref)
(declare-fun img@117@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@115@01 $Ref) (s2@115@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@115@01 S@111@01)
      (Set_in s2@115@01 S@111@01)
      (= s1@115@01 s2@115@01))
    (= s1@115@01 s2@115@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@115@01 $Ref)) (!
  (=>
    (Set_in s@115@01 S@111@01)
    (and (= (inv@116@01 s@115@01) s@115@01) (img@117@01 s@115@01)))
  :pattern ((Set_in s@115@01 S@111@01))
  :pattern ((inv@116@01 s@115@01))
  :pattern ((img@117@01 s@115@01))
  :qid |quant-u-57|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@117@01 r) (Set_in (inv@116@01 r) S@111@01)) (= (inv@116@01 r) r))
  :pattern ((inv@116@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@115@01 $Ref)) (!
  (=> (Set_in s@115@01 S@111@01) (not (= s@115@01 $Ref.null)))
  :pattern ((Set_in s@115@01 S@111@01))
  :pattern ((inv@116@01 s@115@01))
  :pattern ((img@117@01 s@115@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@114@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@114@01))
    ($Snap.second ($Snap.second $t@114@01)))))
(assert (= ($Snap.first ($Snap.second $t@114@01)) $Snap.unit))
; [eval] S == Set(b)
; [eval] Set(b)
(assert (Set_equal S@111@01 (Set_singleton b@112@01)))
(assert (= ($Snap.second ($Snap.second $t@114@01)) $Snap.unit))
; [eval] b.f == a
(push) ; 2
(assert (not (and (img@117@01 b@112@01) (Set_in (inv@116@01 b@112@01) S@111@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@114@01)) b@112@01)
  a@113@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const r@118@01 $Ref)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@118@01 S@111@01))
(pop) ; 3
(declare-const $t@119@01 $FVF<f>)
(declare-fun inv@120@01 ($Ref) $Ref)
(declare-fun img@121@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@118@01 $Ref) (r2@118@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@118@01 S@111@01)
      (Set_in r2@118@01 S@111@01)
      (= r1@118@01 r2@118@01))
    (= r1@118@01 r2@118@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@118@01 $Ref)) (!
  (=>
    (Set_in r@118@01 S@111@01)
    (and (= (inv@120@01 r@118@01) r@118@01) (img@121@01 r@118@01)))
  :pattern ((Set_in r@118@01 S@111@01))
  :pattern ((inv@120@01 r@118@01))
  :pattern ((img@121@01 r@118@01))
  :qid |quant-u-59|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@121@01 r) (Set_in (inv@120@01 r) S@111@01)) (= (inv@120@01 r) r))
  :pattern ((inv@120@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@118@01 $Ref)) (!
  (=> (Set_in r@118@01 S@111@01) (not (= r@118@01 $Ref.null)))
  :pattern ((Set_in r@118@01 S@111@01))
  :pattern ((inv@120@01 r@118@01))
  :pattern ((img@121@01 r@118@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
; [exec]
; b.f := 2 * a
; [eval] 2 * a
; Precomputing data for removing quantified permissions
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (= r b@112@01)
    ($Perm.min
      (ite
        (and (img@117@01 r) (Set_in (inv@116@01 r) S@111@01))
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
        (and (img@117@01 r) (Set_in (inv@116@01 r) S@111@01))
        $Perm.Write
        $Perm.No)
      (pTaken@122@01 r))
    $Perm.No)
  
  :qid |quant-u-61|))))
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
  (=> (= r b@112@01) (= (- $Perm.Write (pTaken@122@01 r)) $Perm.No))
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@123@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) b@112@01) (* 2 a@113@01)))
; [exec]
; exhale (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
(declare-const t@124@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f > 2 * a
; [eval] (t in S)
(push) ; 4
; [then-branch: 12 | t@124@01 in S@111@01 | live]
; [else-branch: 12 | !(t@124@01 in S@111@01) | live]
(push) ; 5
; [then-branch: 12 | t@124@01 in S@111@01]
(assert (Set_in t@124@01 S@111@01))
; [eval] t.f > 2 * a
(push) ; 6
(assert (not (= t@124@01 b@112@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 2 * a
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(t@124@01 in S@111@01)]
(assert (not (Set_in t@124@01 S@111@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@124@01 S@111@01)) (Set_in t@124@01 S@111@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@124@01 $Ref)) (!
  (or (not (Set_in t@124@01 S@111@01)) (Set_in t@124@01 S@111@01))
  :pattern ((Set_in t@124@01 S@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@66@13@66@55-aux|)))
(push) ; 3
(assert (not (forall ((t@124@01 $Ref)) (!
  (=>
    (Set_in t@124@01 S@111@01)
    (> ($FVF.lookup_f (as sm@123@01  $FVF<f>) t@124@01) (* 2 a@113@01)))
  :pattern ((Set_in t@124@01 S@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@66@13@66@55|))))
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
(declare-const sm@125@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@112@01)
    (=
      ($FVF.lookup_f (as sm@125@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@123@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@125@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@126@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@126@01  $FPM) r)
    (ite (= r b@112@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@126@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(assert (<= ($FVF.perm_f (as pm@126@01  $FPM) b@112@01) $Perm.Write))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
(declare-const t@127@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f > 2 * a
; [eval] (t in S)
(push) ; 4
; [then-branch: 13 | t@127@01 in S@111@01 | live]
; [else-branch: 13 | !(t@127@01 in S@111@01) | live]
(push) ; 5
; [then-branch: 13 | t@127@01 in S@111@01]
(assert (Set_in t@127@01 S@111@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; [eval] t.f > 2 * a
(set-option :timeout 0)
(push) ; 6
(assert (not (= t@127@01 b@112@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 2 * a
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(t@127@01 in S@111@01)]
(assert (not (Set_in t@127@01 S@111@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@127@01 S@111@01)) (Set_in t@127@01 S@111@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@127@01 $Ref)) (!
  (or (not (Set_in t@127@01 S@111@01)) (Set_in t@127@01 S@111@01))
  :pattern ((Set_in t@127@01 S@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@66@13@66@55-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((t@127@01 $Ref)) (!
  (=>
    (Set_in t@127@01 S@111@01)
    (> ($FVF.lookup_f (as sm@125@01  $FVF<f>) t@127@01) (* 2 a@113@01)))
  :pattern ((Set_in t@127@01 S@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@66@13@66@55|))))
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
(declare-const sm@128@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@112@01)
    (=
      ($FVF.lookup_f (as sm@128@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@123@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@128@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@129@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@129@01  $FPM) r)
    (ite (= r b@112@01) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@129@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
(assert (<= ($FVF.perm_f (as pm@129@01  $FPM) b@112@01) $Perm.Write))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
(declare-const t@130@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f > 2 * a
; [eval] (t in S)
(push) ; 4
; [then-branch: 14 | t@130@01 in S@111@01 | live]
; [else-branch: 14 | !(t@130@01 in S@111@01) | live]
(push) ; 5
; [then-branch: 14 | t@130@01 in S@111@01]
(assert (Set_in t@130@01 S@111@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; [eval] t.f > 2 * a
(set-option :timeout 0)
(push) ; 6
(assert (not (= t@130@01 b@112@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 2 * a
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(t@130@01 in S@111@01)]
(assert (not (Set_in t@130@01 S@111@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@130@01 S@111@01)) (Set_in t@130@01 S@111@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@130@01 $Ref)) (!
  (or (not (Set_in t@130@01 S@111@01)) (Set_in t@130@01 S@111@01))
  :pattern ((Set_in t@130@01 S@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@66@13@66@55-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((t@130@01 $Ref)) (!
  (=>
    (Set_in t@130@01 S@111@01)
    (> ($FVF.lookup_f (as sm@128@01  $FVF<f>) t@130@01) (* 2 a@113@01)))
  :pattern ((Set_in t@130@01 S@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@66@13@66@55|))))
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
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > 2 * a)
(declare-const t@131@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f > 2 * a
; [eval] (t in S)
(push) ; 4
; [then-branch: 15 | t@131@01 in S@111@01 | live]
; [else-branch: 15 | !(t@131@01 in S@111@01) | live]
(push) ; 5
; [then-branch: 15 | t@131@01 in S@111@01]
(assert (Set_in t@131@01 S@111@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; [eval] t.f > 2 * a
(set-option :timeout 0)
(push) ; 6
(assert (not (= t@131@01 b@112@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] 2 * a
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(t@131@01 in S@111@01)]
(assert (not (Set_in t@131@01 S@111@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@131@01 S@111@01)) (Set_in t@131@01 S@111@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@131@01 $Ref)) (!
  (or (not (Set_in t@131@01 S@111@01)) (Set_in t@131@01 S@111@01))
  :pattern ((Set_in t@131@01 S@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@66@13@66@55-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((t@131@01 $Ref)) (!
  (=>
    (Set_in t@131@01 S@111@01)
    (> ($FVF.lookup_f (as sm@128@01  $FVF<f>) t@131@01) (* 2 a@113@01)))
  :pattern ((Set_in t@131@01 S@111@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@66@13@66@55|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m5 ----------
(declare-const S@132@01 Set<$Ref>)
(declare-const b@133@01 $Ref)
(declare-const S@134@01 Set<$Ref>)
(declare-const b@135@01 $Ref)
(push) ; 1
(declare-const $t@136@01 $Snap)
(assert (= $t@136@01 ($Snap.combine ($Snap.first $t@136@01) ($Snap.second $t@136@01))))
(declare-const s@137@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@137@01 S@134@01))
(pop) ; 2
(declare-fun inv@138@01 ($Ref) $Ref)
(declare-fun img@139@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@137@01 $Ref) (s2@137@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@137@01 S@134@01)
      (Set_in s2@137@01 S@134@01)
      (= s1@137@01 s2@137@01))
    (= s1@137@01 s2@137@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@137@01 $Ref)) (!
  (=>
    (Set_in s@137@01 S@134@01)
    (and (= (inv@138@01 s@137@01) s@137@01) (img@139@01 s@137@01)))
  :pattern ((Set_in s@137@01 S@134@01))
  :pattern ((inv@138@01 s@137@01))
  :pattern ((img@139@01 s@137@01))
  :qid |quant-u-64|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@139@01 r) (Set_in (inv@138@01 r) S@134@01)) (= (inv@138@01 r) r))
  :pattern ((inv@138@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@137@01 $Ref)) (!
  (=> (Set_in s@137@01 S@134@01) (not (= s@137@01 $Ref.null)))
  :pattern ((Set_in s@137@01 S@134@01))
  :pattern ((inv@138@01 s@137@01))
  :pattern ((img@139@01 s@137@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@136@01) $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@135@01 S@134@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale b.f > 0
(declare-const $t@140@01 $Snap)
(assert (= $t@140@01 $Snap.unit))
; [eval] b.f > 0
(push) ; 3
(assert (not (and (img@139@01 b@135@01) (Set_in (inv@138@01 b@135@01) S@134@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@136@01)) b@135@01)
  0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- m8 ----------
(declare-const S@141@01 Set<$Ref>)
(declare-const b@142@01 $Ref)
(declare-const a@143@01 Int)
(declare-const c@144@01 $Ref)
(declare-const S@145@01 Set<$Ref>)
(declare-const b@146@01 $Ref)
(declare-const a@147@01 Int)
(declare-const c@148@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@149@01 $Snap)
(assert (= $t@149@01 ($Snap.combine ($Snap.first $t@149@01) ($Snap.second $t@149@01))))
(declare-const s@150@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@150@01 S@145@01))
(pop) ; 2
(declare-fun inv@151@01 ($Ref) $Ref)
(declare-fun img@152@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@150@01 $Ref) (s2@150@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@150@01 S@145@01)
      (Set_in s2@150@01 S@145@01)
      (= s1@150@01 s2@150@01))
    (= s1@150@01 s2@150@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@150@01 $Ref)) (!
  (=>
    (Set_in s@150@01 S@145@01)
    (and (= (inv@151@01 s@150@01) s@150@01) (img@152@01 s@150@01)))
  :pattern ((Set_in s@150@01 S@145@01))
  :pattern ((inv@151@01 s@150@01))
  :pattern ((img@152@01 s@150@01))
  :qid |quant-u-66|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01)) (= (inv@151@01 r) r))
  :pattern ((inv@151@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@150@01 $Ref)) (!
  (=> (Set_in s@150@01 S@145@01) (not (= s@150@01 $Ref.null)))
  :pattern ((Set_in s@150@01 S@145@01))
  :pattern ((inv@151@01 s@150@01))
  :pattern ((img@152@01 s@150@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@149@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@149@01))
    ($Snap.second ($Snap.second $t@149@01)))))
(assert (= ($Snap.first ($Snap.second $t@149@01)) $Snap.unit))
; [eval] (forall s: Ref :: { (s in S) } (s in S) ==> s.f == a)
(declare-const s@153@01 $Ref)
(push) ; 2
; [eval] (s in S) ==> s.f == a
; [eval] (s in S)
(push) ; 3
; [then-branch: 16 | s@153@01 in S@145@01 | live]
; [else-branch: 16 | !(s@153@01 in S@145@01) | live]
(push) ; 4
; [then-branch: 16 | s@153@01 in S@145@01]
(assert (Set_in s@153@01 S@145@01))
; [eval] s.f == a
(push) ; 5
(assert (not (and (img@152@01 s@153@01) (Set_in (inv@151@01 s@153@01) S@145@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 16 | !(s@153@01 in S@145@01)]
(assert (not (Set_in s@153@01 S@145@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in s@153@01 S@145@01)) (Set_in s@153@01 S@145@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((s@153@01 $Ref)) (!
  (or (not (Set_in s@153@01 S@145@01)) (Set_in s@153@01 S@145@01))
  :pattern ((Set_in s@153@01 S@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@78@12@78@48-aux|)))
(assert (forall ((s@153@01 $Ref)) (!
  (=>
    (Set_in s@153@01 S@145@01)
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) s@153@01)
      a@147@01))
  :pattern ((Set_in s@153@01 S@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@78@12@78@48|)))
(assert (=
  ($Snap.second ($Snap.second $t@149@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@149@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@149@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@149@01))) $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@146@01 S@145@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@149@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@149@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@149@01)))))))
(declare-const sm@154@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@154@01  $FVF<f>) c@148@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@149@01)))))))
(assert (not (= c@148@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@149@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@149@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@149@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@149@01)))))
  $Snap.unit))
; [eval] c.f < 0
(declare-const sm@155@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
    (=
      ($FVF.lookup_f (as sm@155@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r)))
  :pattern (($FVF.lookup_f (as sm@155@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r c@148@01)
    (=
      ($FVF.lookup_f (as sm@155@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@154@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@155@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :qid |qp.fvfValDef13|)))
(declare-const pm@156@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@156@01  $FPM) r)
    (+
      (ite
        (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
        $Perm.Write
        $Perm.No)
      (ite (= r c@148@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@156@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_f (as pm@156@01  $FPM) c@148@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (< ($FVF.lookup_f (as sm@155@01  $FVF<f>) c@148@01) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@149@01)))))
  $Snap.unit))
; [eval] a > 0
(assert (> a@147@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@157@01 $Snap)
(assert (= $t@157@01 ($Snap.combine ($Snap.first $t@157@01) ($Snap.second $t@157@01))))
(declare-const r@158@01 $Ref)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@158@01 S@145@01))
(pop) ; 3
(declare-fun inv@159@01 ($Ref) $Ref)
(declare-fun img@160@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@158@01 $Ref) (r2@158@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@158@01 S@145@01)
      (Set_in r2@158@01 S@145@01)
      (= r1@158@01 r2@158@01))
    (= r1@158@01 r2@158@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@158@01 $Ref)) (!
  (=>
    (Set_in r@158@01 S@145@01)
    (and (= (inv@159@01 r@158@01) r@158@01) (img@160@01 r@158@01)))
  :pattern ((Set_in r@158@01 S@145@01))
  :pattern ((inv@159@01 r@158@01))
  :pattern ((img@160@01 r@158@01))
  :qid |quant-u-68|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@160@01 r) (Set_in (inv@159@01 r) S@145@01)) (= (inv@159@01 r) r))
  :pattern ((inv@159@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@158@01 $Ref)) (!
  (=> (Set_in r@158@01 S@145@01) (not (= r@158@01 $Ref.null)))
  :pattern ((Set_in r@158@01 S@145@01))
  :pattern ((inv@159@01 r@158@01))
  :pattern ((img@160@01 r@158@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@157@01) $Snap.unit))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f == (t == b ? 2 * a + 1 : a))
(declare-const t@161@01 $Ref)
(push) ; 3
; [eval] (t in S) ==> t.f == (t == b ? 2 * a + 1 : a)
; [eval] (t in S)
(push) ; 4
; [then-branch: 17 | t@161@01 in S@145@01 | live]
; [else-branch: 17 | !(t@161@01 in S@145@01) | live]
(push) ; 5
; [then-branch: 17 | t@161@01 in S@145@01]
(assert (Set_in t@161@01 S@145@01))
; [eval] t.f == (t == b ? 2 * a + 1 : a)
(push) ; 6
(assert (not (and (img@160@01 t@161@01) (Set_in (inv@159@01 t@161@01) S@145@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] (t == b ? 2 * a + 1 : a)
; [eval] t == b
(push) ; 6
; [then-branch: 18 | t@161@01 == b@146@01 | live]
; [else-branch: 18 | t@161@01 != b@146@01 | live]
(push) ; 7
; [then-branch: 18 | t@161@01 == b@146@01]
(assert (= t@161@01 b@146@01))
; [eval] 2 * a + 1
; [eval] 2 * a
(pop) ; 7
(push) ; 7
; [else-branch: 18 | t@161@01 != b@146@01]
(assert (not (= t@161@01 b@146@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= t@161@01 b@146@01)) (= t@161@01 b@146@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(t@161@01 in S@145@01)]
(assert (not (Set_in t@161@01 S@145@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Set_in t@161@01 S@145@01)
  (and
    (Set_in t@161@01 S@145@01)
    (or (not (= t@161@01 b@146@01)) (= t@161@01 b@146@01)))))
; Joined path conditions
(assert (or (not (Set_in t@161@01 S@145@01)) (Set_in t@161@01 S@145@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@161@01 $Ref)) (!
  (and
    (=>
      (Set_in t@161@01 S@145@01)
      (and
        (Set_in t@161@01 S@145@01)
        (or (not (= t@161@01 b@146@01)) (= t@161@01 b@146@01))))
    (or (not (Set_in t@161@01 S@145@01)) (Set_in t@161@01 S@145@01)))
  :pattern ((Set_in t@161@01 S@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@84@11@84@71-aux|)))
(assert (forall ((t@161@01 $Ref)) (!
  (=>
    (Set_in t@161@01 S@145@01)
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@157@01)) t@161@01)
      (ite (= t@161@01 b@146@01) (+ (* 2 a@147@01) 1) a@147@01)))
  :pattern ((Set_in t@161@01 S@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@84@11@84@71|)))
(pop) ; 2
(push) ; 2
; [exec]
; b.f := 2 * a + 1
; [eval] 2 * a + 1
; [eval] 2 * a
(push) ; 3
(set-option :timeout 10)
(assert (not (= c@148@01 b@146@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@162@01 ((r $Ref)) $Perm
  (ite
    (= r b@146@01)
    ($Perm.min
      (ite
        (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@163@01 ((r $Ref)) $Perm
  (ite
    (= r b@146@01)
    ($Perm.min
      (ite (= r c@148@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@162@01 r)))
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
        (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
        $Perm.Write
        $Perm.No)
      (pTaken@162@01 r))
    $Perm.No)
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@162@01 r) $Perm.No)
  
  :qid |quant-u-71|))))
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
  (=> (= r b@146@01) (= (- $Perm.Write (pTaken@162@01 r)) $Perm.No))
  
  :qid |quant-u-72|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@164@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@164@01  $FVF<f>) b@146@01) (+ (* 2 a@147@01) 1)))
(declare-const r@165@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@165@01 S@145@01))
(pop) ; 3
(declare-fun inv@166@01 ($Ref) $Ref)
(declare-fun img@167@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@165@01 $Ref) (r2@165@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@165@01 S@145@01)
      (Set_in r2@165@01 S@145@01)
      (= r1@165@01 r2@165@01))
    (= r1@165@01 r2@165@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@165@01 $Ref)) (!
  (=>
    (Set_in r@165@01 S@145@01)
    (and (= (inv@166@01 r@165@01) r@165@01) (img@167@01 r@165@01)))
  :pattern ((Set_in r@165@01 S@145@01))
  :pattern ((inv@166@01 r@165@01))
  :pattern ((img@167@01 r@165@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@167@01 r) (Set_in (inv@166@01 r) S@145@01)) (= (inv@166@01 r) r))
  :pattern ((inv@166@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@168@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@166@01 r) S@145@01) (img@167@01 r) (= r (inv@166@01 r)))
    ($Perm.min
      (ite
        (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
        (- $Perm.Write (pTaken@162@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@169@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@166@01 r) S@145@01) (img@167@01 r) (= r (inv@166@01 r)))
    ($Perm.min
      (ite (= r b@146@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@168@01 r)))
    $Perm.No))
(define-fun pTaken@170@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@166@01 r) S@145@01) (img@167@01 r) (= r (inv@166@01 r)))
    ($Perm.min
      (ite (= r c@148@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@168@01 r)) (pTaken@169@01 r)))
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
        (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
        (- $Perm.Write (pTaken@162@01 r))
        $Perm.No)
      (pTaken@168@01 r))
    $Perm.No)
  
  :qid |quant-u-75|))))
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
    (and (Set_in (inv@166@01 r) S@145@01) (img@167@01 r) (= r (inv@166@01 r)))
    (= (- $Perm.Write (pTaken@168@01 r)) $Perm.No))
  
  :qid |quant-u-76|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@169@01 b@146@01)) $Perm.No)))
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
    (and (Set_in (inv@166@01 r) S@145@01) (img@167@01 r) (= r (inv@166@01 r)))
    (= (- (- $Perm.Write (pTaken@168@01 r)) (pTaken@169@01 r)) $Perm.No))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@171@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@146@01)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@164@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@164@01  $FVF<f>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r c@148@01)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@154@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
      (< $Perm.No (- $Perm.Write (pTaken@162@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r))
  :qid |qp.fvfValDef17|)))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f == (t == b ? 2 * a + 1 : a))
(declare-const t@172@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f == (t == b ? 2 * a + 1 : a)
; [eval] (t in S)
(push) ; 4
; [then-branch: 19 | t@172@01 in S@145@01 | live]
; [else-branch: 19 | !(t@172@01 in S@145@01) | live]
(push) ; 5
; [then-branch: 19 | t@172@01 in S@145@01]
(assert (Set_in t@172@01 S@145@01))
; [eval] t.f == (t == b ? 2 * a + 1 : a)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r b@146@01)
      (=
        ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@164@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@164@01  $FVF<f>) r))
    :qid |qp.fvfValDef15|))
  (forall ((r $Ref)) (!
    (=>
      (= r c@148@01)
      (=
        ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@154@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
        (< $Perm.No (- $Perm.Write (pTaken@162@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r)))
    :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r))
    :qid |qp.fvfValDef17|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= t@172@01 b@146@01) $Perm.Write $Perm.No)
      (ite (= t@172@01 c@148@01) $Perm.Write $Perm.No))
    (ite
      (and (img@152@01 t@172@01) (Set_in (inv@151@01 t@172@01) S@145@01))
      (- $Perm.Write (pTaken@162@01 t@172@01))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] (t == b ? 2 * a + 1 : a)
; [eval] t == b
(push) ; 6
; [then-branch: 20 | t@172@01 == b@146@01 | live]
; [else-branch: 20 | t@172@01 != b@146@01 | live]
(push) ; 7
; [then-branch: 20 | t@172@01 == b@146@01]
(assert (= t@172@01 b@146@01))
; [eval] 2 * a + 1
; [eval] 2 * a
(pop) ; 7
(push) ; 7
; [else-branch: 20 | t@172@01 != b@146@01]
(assert (not (= t@172@01 b@146@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (= t@172@01 b@146@01)) (= t@172@01 b@146@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | !(t@172@01 in S@145@01)]
(assert (not (Set_in t@172@01 S@145@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@146@01)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@164@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@164@01  $FVF<f>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r c@148@01)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@154@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
      (< $Perm.No (- $Perm.Write (pTaken@162@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (=>
  (Set_in t@172@01 S@145@01)
  (and
    (Set_in t@172@01 S@145@01)
    (or (not (= t@172@01 b@146@01)) (= t@172@01 b@146@01)))))
; Joined path conditions
(assert (or (not (Set_in t@172@01 S@145@01)) (Set_in t@172@01 S@145@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@146@01)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@164@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@164@01  $FVF<f>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r c@148@01)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@154@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@152@01 r) (Set_in (inv@151@01 r) S@145@01))
      (< $Perm.No (- $Perm.Write (pTaken@162@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r)))
  :pattern (($FVF.lookup_f (as sm@171@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@149@01)) r))
  :qid |qp.fvfValDef17|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@172@01 $Ref)) (!
  (and
    (=>
      (Set_in t@172@01 S@145@01)
      (and
        (Set_in t@172@01 S@145@01)
        (or (not (= t@172@01 b@146@01)) (= t@172@01 b@146@01))))
    (or (not (Set_in t@172@01 S@145@01)) (Set_in t@172@01 S@145@01)))
  :pattern ((Set_in t@172@01 S@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@84@11@84@71-aux|)))
(push) ; 3
(assert (not (forall ((t@172@01 $Ref)) (!
  (=>
    (Set_in t@172@01 S@145@01)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) t@172@01)
      (ite (= t@172@01 b@146@01) (+ (* 2 a@147@01) 1) a@147@01)))
  :pattern ((Set_in t@172@01 S@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@84@11@84@71|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((t@172@01 $Ref)) (!
  (=>
    (Set_in t@172@01 S@145@01)
    (=
      ($FVF.lookup_f (as sm@171@01  $FVF<f>) t@172@01)
      (ite (= t@172@01 b@146@01) (+ (* 2 a@147@01) 1) a@147@01)))
  :pattern ((Set_in t@172@01 S@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@84@11@84@71|)))
(pop) ; 2
(pop) ; 1
; ---------- m9 ----------
(declare-const S@173@01 Set<$Ref>)
(declare-const b@174@01 $Ref)
(declare-const a@175@01 Int)
(declare-const S@176@01 Set<$Ref>)
(declare-const b@177@01 $Ref)
(declare-const a@178@01 Int)
(push) ; 1
(declare-const $t@179@01 $Snap)
(assert (= $t@179@01 ($Snap.combine ($Snap.first $t@179@01) ($Snap.second $t@179@01))))
(declare-const s@180@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@180@01 S@176@01))
(pop) ; 2
(declare-fun inv@181@01 ($Ref) $Ref)
(declare-fun img@182@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@180@01 $Ref) (s2@180@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@180@01 S@176@01)
      (Set_in s2@180@01 S@176@01)
      (= s1@180@01 s2@180@01))
    (= s1@180@01 s2@180@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@180@01 $Ref)) (!
  (=>
    (Set_in s@180@01 S@176@01)
    (and (= (inv@181@01 s@180@01) s@180@01) (img@182@01 s@180@01)))
  :pattern ((Set_in s@180@01 S@176@01))
  :pattern ((inv@181@01 s@180@01))
  :pattern ((img@182@01 s@180@01))
  :qid |quant-u-80|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01)) (= (inv@181@01 r) r))
  :pattern ((inv@181@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@180@01 $Ref)) (!
  (=> (Set_in s@180@01 S@176@01) (not (= s@180@01 $Ref.null)))
  :pattern ((Set_in s@180@01 S@176@01))
  :pattern ((inv@181@01 s@180@01))
  :pattern ((img@182@01 s@180@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@179@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@179@01))
    ($Snap.second ($Snap.second $t@179@01)))))
(assert (= ($Snap.first ($Snap.second $t@179@01)) $Snap.unit))
; [eval] (forall q: Ref :: { (q in S) } (q in S) ==> q.f > a)
(declare-const q@183@01 $Ref)
(push) ; 2
; [eval] (q in S) ==> q.f > a
; [eval] (q in S)
(push) ; 3
; [then-branch: 21 | q@183@01 in S@176@01 | live]
; [else-branch: 21 | !(q@183@01 in S@176@01) | live]
(push) ; 4
; [then-branch: 21 | q@183@01 in S@176@01]
(assert (Set_in q@183@01 S@176@01))
; [eval] q.f > a
(push) ; 5
(assert (not (and (img@182@01 q@183@01) (Set_in (inv@181@01 q@183@01) S@176@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 21 | !(q@183@01 in S@176@01)]
(assert (not (Set_in q@183@01 S@176@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in q@183@01 S@176@01)) (Set_in q@183@01 S@176@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((q@183@01 $Ref)) (!
  (or (not (Set_in q@183@01 S@176@01)) (Set_in q@183@01 S@176@01))
  :pattern ((Set_in q@183@01 S@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@91@11@91@46-aux|)))
(assert (forall ((q@183@01 $Ref)) (!
  (=>
    (Set_in q@183@01 S@176@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) q@183@01)
      a@178@01))
  :pattern ((Set_in q@183@01 S@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@91@11@91@46|)))
(assert (=
  ($Snap.second ($Snap.second $t@179@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@179@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@179@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@179@01))) $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@177@01 S@176@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@179@01))) $Snap.unit))
; [eval] a > 0
(assert (> a@178@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@184@01 $Snap)
(assert (= $t@184@01 ($Snap.combine ($Snap.first $t@184@01) ($Snap.second $t@184@01))))
(declare-const r@185@01 $Ref)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@185@01 S@176@01))
(pop) ; 3
(declare-fun inv@186@01 ($Ref) $Ref)
(declare-fun img@187@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@185@01 $Ref) (r2@185@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@185@01 S@176@01)
      (Set_in r2@185@01 S@176@01)
      (= r1@185@01 r2@185@01))
    (= r1@185@01 r2@185@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@185@01 $Ref)) (!
  (=>
    (Set_in r@185@01 S@176@01)
    (and (= (inv@186@01 r@185@01) r@185@01) (img@187@01 r@185@01)))
  :pattern ((Set_in r@185@01 S@176@01))
  :pattern ((inv@186@01 r@185@01))
  :pattern ((img@187@01 r@185@01))
  :qid |quant-u-82|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@187@01 r) (Set_in (inv@186@01 r) S@176@01)) (= (inv@186@01 r) r))
  :pattern ((inv@186@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@185@01 $Ref)) (!
  (=> (Set_in r@185@01 S@176@01) (not (= r@185@01 $Ref.null)))
  :pattern ((Set_in r@185@01 S@176@01))
  :pattern ((inv@186@01 r@185@01))
  :pattern ((img@187@01 r@185@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@184@01) $Snap.unit))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > a)
(declare-const t@188@01 $Ref)
(push) ; 3
; [eval] (t in S) ==> t.f > a
; [eval] (t in S)
(push) ; 4
; [then-branch: 22 | t@188@01 in S@176@01 | live]
; [else-branch: 22 | !(t@188@01 in S@176@01) | live]
(push) ; 5
; [then-branch: 22 | t@188@01 in S@176@01]
(assert (Set_in t@188@01 S@176@01))
; [eval] t.f > a
(push) ; 6
(assert (not (and (img@187@01 t@188@01) (Set_in (inv@186@01 t@188@01) S@176@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(t@188@01 in S@176@01)]
(assert (not (Set_in t@188@01 S@176@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@188@01 S@176@01)) (Set_in t@188@01 S@176@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@188@01 $Ref)) (!
  (or (not (Set_in t@188@01 S@176@01)) (Set_in t@188@01 S@176@01))
  :pattern ((Set_in t@188@01 S@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@95@10@95@48-aux|)))
(assert (forall ((t@188@01 $Ref)) (!
  (=>
    (Set_in t@188@01 S@176@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@184@01)) t@188@01)
      a@178@01))
  :pattern ((Set_in t@188@01 S@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@95@10@95@48|)))
(pop) ; 2
(push) ; 2
; [exec]
; b.f := 2 * a + 1
; [eval] 2 * a + 1
; [eval] 2 * a
; Precomputing data for removing quantified permissions
(define-fun pTaken@189@01 ((r $Ref)) $Perm
  (ite
    (= r b@177@01)
    ($Perm.min
      (ite
        (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01))
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
        (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01))
        $Perm.Write
        $Perm.No)
      (pTaken@189@01 r))
    $Perm.No)
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@189@01 r) $Perm.No)
  
  :qid |quant-u-85|))))
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
  (=> (= r b@177@01) (= (- $Perm.Write (pTaken@189@01 r)) $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@190@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@190@01  $FVF<f>) b@177@01) (+ (* 2 a@178@01) 1)))
(declare-const r@191@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@191@01 S@176@01))
(pop) ; 3
(declare-fun inv@192@01 ($Ref) $Ref)
(declare-fun img@193@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@191@01 $Ref) (r2@191@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@191@01 S@176@01)
      (Set_in r2@191@01 S@176@01)
      (= r1@191@01 r2@191@01))
    (= r1@191@01 r2@191@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@191@01 $Ref)) (!
  (=>
    (Set_in r@191@01 S@176@01)
    (and (= (inv@192@01 r@191@01) r@191@01) (img@193@01 r@191@01)))
  :pattern ((Set_in r@191@01 S@176@01))
  :pattern ((inv@192@01 r@191@01))
  :pattern ((img@193@01 r@191@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@193@01 r) (Set_in (inv@192@01 r) S@176@01)) (= (inv@192@01 r) r))
  :pattern ((inv@192@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@194@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@192@01 r) S@176@01) (img@193@01 r) (= r (inv@192@01 r)))
    ($Perm.min
      (ite
        (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01))
        (- $Perm.Write (pTaken@189@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@195@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@192@01 r) S@176@01) (img@193@01 r) (= r (inv@192@01 r)))
    ($Perm.min
      (ite (= r b@177@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@194@01 r)))
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
        (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01))
        (- $Perm.Write (pTaken@189@01 r))
        $Perm.No)
      (pTaken@194@01 r))
    $Perm.No)
  
  :qid |quant-u-89|))))
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
    (and (Set_in (inv@192@01 r) S@176@01) (img@193@01 r) (= r (inv@192@01 r)))
    (= (- $Perm.Write (pTaken@194@01 r)) $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@195@01 b@177@01)) $Perm.No)))
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
    (and (Set_in (inv@192@01 r) S@176@01) (img@193@01 r) (= r (inv@192@01 r)))
    (= (- (- $Perm.Write (pTaken@194@01 r)) (pTaken@195@01 r)) $Perm.No))
  
  :qid |quant-u-92|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@196@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@177@01)
    (=
      ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01))
      (< $Perm.No (- $Perm.Write (pTaken@189@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) r)))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) r))
  :qid |qp.fvfValDef19|)))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > a)
(declare-const t@197@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f > a
; [eval] (t in S)
(push) ; 4
; [then-branch: 23 | t@197@01 in S@176@01 | live]
; [else-branch: 23 | !(t@197@01 in S@176@01) | live]
(push) ; 5
; [then-branch: 23 | t@197@01 in S@176@01]
(assert (Set_in t@197@01 S@176@01))
; [eval] t.f > a
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r b@177@01)
      (=
        ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
    :qid |qp.fvfValDef18|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01))
        (< $Perm.No (- $Perm.Write (pTaken@189@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) r)))
    :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) r))
    :qid |qp.fvfValDef19|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite (= t@197@01 b@177@01) $Perm.Write $Perm.No)
    (ite
      (and (img@182@01 t@197@01) (Set_in (inv@181@01 t@197@01) S@176@01))
      (- $Perm.Write (pTaken@189@01 t@197@01))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(t@197@01 in S@176@01)]
(assert (not (Set_in t@197@01 S@176@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@177@01)
    (=
      ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01))
      (< $Perm.No (- $Perm.Write (pTaken@189@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) r)))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) r))
  :qid |qp.fvfValDef19|)))
; Joined path conditions
(assert (or (not (Set_in t@197@01 S@176@01)) (Set_in t@197@01 S@176@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r b@177@01)
    (=
      ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@182@01 r) (Set_in (inv@181@01 r) S@176@01))
      (< $Perm.No (- $Perm.Write (pTaken@189@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@196@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) r)))
  :pattern (($FVF.lookup_f (as sm@196@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@179@01)) r))
  :qid |qp.fvfValDef19|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@197@01 $Ref)) (!
  (or (not (Set_in t@197@01 S@176@01)) (Set_in t@197@01 S@176@01))
  :pattern ((Set_in t@197@01 S@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@95@10@95@48-aux|)))
(push) ; 3
(assert (not (forall ((t@197@01 $Ref)) (!
  (=>
    (Set_in t@197@01 S@176@01)
    (> ($FVF.lookup_f (as sm@196@01  $FVF<f>) t@197@01) a@178@01))
  :pattern ((Set_in t@197@01 S@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@95@10@95@48|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((t@197@01 $Ref)) (!
  (=>
    (Set_in t@197@01 S@176@01)
    (> ($FVF.lookup_f (as sm@196@01  $FVF<f>) t@197@01) a@178@01))
  :pattern ((Set_in t@197@01 S@176@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@95@10@95@48|)))
(pop) ; 2
(pop) ; 1
; ---------- m10 ----------
(declare-const S@198@01 Set<$Ref>)
(declare-const b@199@01 $Ref)
(declare-const a@200@01 Int)
(declare-const c@201@01 $Ref)
(declare-const S@202@01 Set<$Ref>)
(declare-const b@203@01 $Ref)
(declare-const a@204@01 Int)
(declare-const c@205@01 $Ref)
(push) ; 1
(declare-const $t@206@01 $Snap)
(assert (= $t@206@01 ($Snap.combine ($Snap.first $t@206@01) ($Snap.second $t@206@01))))
(declare-const s@207@01 $Ref)
(push) ; 2
; [eval] (s in S)
(assert (Set_in s@207@01 S@202@01))
(pop) ; 2
(declare-fun inv@208@01 ($Ref) $Ref)
(declare-fun img@209@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((s1@207@01 $Ref) (s2@207@01 $Ref)) (!
  (=>
    (and
      (Set_in s1@207@01 S@202@01)
      (Set_in s2@207@01 S@202@01)
      (= s1@207@01 s2@207@01))
    (= s1@207@01 s2@207@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((s@207@01 $Ref)) (!
  (=>
    (Set_in s@207@01 S@202@01)
    (and (= (inv@208@01 s@207@01) s@207@01) (img@209@01 s@207@01)))
  :pattern ((Set_in s@207@01 S@202@01))
  :pattern ((inv@208@01 s@207@01))
  :pattern ((img@209@01 s@207@01))
  :qid |quant-u-94|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01)) (= (inv@208@01 r) r))
  :pattern ((inv@208@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((s@207@01 $Ref)) (!
  (=> (Set_in s@207@01 S@202@01) (not (= s@207@01 $Ref.null)))
  :pattern ((Set_in s@207@01 S@202@01))
  :pattern ((inv@208@01 s@207@01))
  :pattern ((img@209@01 s@207@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@206@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@206@01))
    ($Snap.second ($Snap.second $t@206@01)))))
(assert (= ($Snap.first ($Snap.second $t@206@01)) $Snap.unit))
; [eval] (forall q: Ref :: { (q in S) } (q in S) ==> q.f > a)
(declare-const q@210@01 $Ref)
(push) ; 2
; [eval] (q in S) ==> q.f > a
; [eval] (q in S)
(push) ; 3
; [then-branch: 24 | q@210@01 in S@202@01 | live]
; [else-branch: 24 | !(q@210@01 in S@202@01) | live]
(push) ; 4
; [then-branch: 24 | q@210@01 in S@202@01]
(assert (Set_in q@210@01 S@202@01))
; [eval] q.f > a
(push) ; 5
(assert (not (and (img@209@01 q@210@01) (Set_in (inv@208@01 q@210@01) S@202@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 24 | !(q@210@01 in S@202@01)]
(assert (not (Set_in q@210@01 S@202@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in q@210@01 S@202@01)) (Set_in q@210@01 S@202@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((q@210@01 $Ref)) (!
  (or (not (Set_in q@210@01 S@202@01)) (Set_in q@210@01 S@202@01))
  :pattern ((Set_in q@210@01 S@202@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@102@11@102@46-aux|)))
(assert (forall ((q@210@01 $Ref)) (!
  (=>
    (Set_in q@210@01 S@202@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) q@210@01)
      a@204@01))
  :pattern ((Set_in q@210@01 S@202@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@102@11@102@46|)))
(assert (=
  ($Snap.second ($Snap.second $t@206@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@206@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@206@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@206@01))) $Snap.unit))
; [eval] (b in S)
(assert (Set_in b@203@01 S@202@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@206@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@206@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@206@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@206@01))))
  $Snap.unit))
; [eval] (c in S)
(assert (Set_in c@205@01 S@202@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@206@01))))
  $Snap.unit))
; [eval] a > 0
(assert (> a@204@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@211@01 $Snap)
(assert (= $t@211@01 ($Snap.combine ($Snap.first $t@211@01) ($Snap.second $t@211@01))))
(declare-const r@212@01 $Ref)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@212@01 S@202@01))
(pop) ; 3
(declare-fun inv@213@01 ($Ref) $Ref)
(declare-fun img@214@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@212@01 $Ref) (r2@212@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@212@01 S@202@01)
      (Set_in r2@212@01 S@202@01)
      (= r1@212@01 r2@212@01))
    (= r1@212@01 r2@212@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@212@01 $Ref)) (!
  (=>
    (Set_in r@212@01 S@202@01)
    (and (= (inv@213@01 r@212@01) r@212@01) (img@214@01 r@212@01)))
  :pattern ((Set_in r@212@01 S@202@01))
  :pattern ((inv@213@01 r@212@01))
  :pattern ((img@214@01 r@212@01))
  :qid |quant-u-96|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@214@01 r) (Set_in (inv@213@01 r) S@202@01)) (= (inv@213@01 r) r))
  :pattern ((inv@213@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((r@212@01 $Ref)) (!
  (=> (Set_in r@212@01 S@202@01) (not (= r@212@01 $Ref.null)))
  :pattern ((Set_in r@212@01 S@202@01))
  :pattern ((inv@213@01 r@212@01))
  :pattern ((img@214@01 r@212@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@211@01) $Snap.unit))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > a)
(declare-const t@215@01 $Ref)
(push) ; 3
; [eval] (t in S) ==> t.f > a
; [eval] (t in S)
(push) ; 4
; [then-branch: 25 | t@215@01 in S@202@01 | live]
; [else-branch: 25 | !(t@215@01 in S@202@01) | live]
(push) ; 5
; [then-branch: 25 | t@215@01 in S@202@01]
(assert (Set_in t@215@01 S@202@01))
; [eval] t.f > a
(push) ; 6
(assert (not (and (img@214@01 t@215@01) (Set_in (inv@213@01 t@215@01) S@202@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 25 | !(t@215@01 in S@202@01)]
(assert (not (Set_in t@215@01 S@202@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in t@215@01 S@202@01)) (Set_in t@215@01 S@202@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@215@01 $Ref)) (!
  (or (not (Set_in t@215@01 S@202@01)) (Set_in t@215@01 S@202@01))
  :pattern ((Set_in t@215@01 S@202@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@107@10@107@48-aux|)))
(assert (forall ((t@215@01 $Ref)) (!
  (=>
    (Set_in t@215@01 S@202@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@211@01)) t@215@01)
      a@204@01))
  :pattern ((Set_in t@215@01 S@202@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@107@10@107@48|)))
(pop) ; 2
(push) ; 2
; [exec]
; b.f := 2 * a + 1
; [eval] 2 * a + 1
; [eval] 2 * a
; Precomputing data for removing quantified permissions
(define-fun pTaken@216@01 ((r $Ref)) $Perm
  (ite
    (= r b@203@01)
    ($Perm.min
      (ite
        (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
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
        (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
        $Perm.Write
        $Perm.No)
      (pTaken@216@01 r))
    $Perm.No)
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@216@01 r) $Perm.No)
  
  :qid |quant-u-99|))))
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
  (=> (= r b@203@01) (= (- $Perm.Write (pTaken@216@01 r)) $Perm.No))
  
  :qid |quant-u-100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@217@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@217@01  $FVF<f>) b@203@01) (+ (* 2 a@204@01) 1)))
; [exec]
; c.f := a + 1
; [eval] a + 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= b@203@01 c@205@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@218@01 ((r $Ref)) $Perm
  (ite
    (= r c@205@01)
    ($Perm.min
      (ite
        (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
        (- $Perm.Write (pTaken@216@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@219@01 ((r $Ref)) $Perm
  (ite
    (= r c@205@01)
    ($Perm.min
      (ite (= r b@203@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@218@01 r)))
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
        (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
        (- $Perm.Write (pTaken@216@01 r))
        $Perm.No)
      (pTaken@218@01 r))
    $Perm.No)
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@218@01 r) $Perm.No)
  
  :qid |quant-u-103|))))
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
  (=> (= r c@205@01) (= (- $Perm.Write (pTaken@218@01 r)) $Perm.No))
  
  :qid |quant-u-104|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@219@01 b@203@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@219@01 r) $Perm.No)
  
  :qid |quant-u-106|))))
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
    (= r c@205@01)
    (= (- (- $Perm.Write (pTaken@218@01 r)) (pTaken@219@01 r)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@220@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@220@01  $FVF<f>) c@205@01) (+ a@204@01 1)))
(declare-const r@221@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (r in S)
(assert (Set_in r@221@01 S@202@01))
(pop) ; 3
(declare-fun inv@222@01 ($Ref) $Ref)
(declare-fun img@223@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((r1@221@01 $Ref) (r2@221@01 $Ref)) (!
  (=>
    (and
      (Set_in r1@221@01 S@202@01)
      (Set_in r2@221@01 S@202@01)
      (= r1@221@01 r2@221@01))
    (= r1@221@01 r2@221@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((r@221@01 $Ref)) (!
  (=>
    (Set_in r@221@01 S@202@01)
    (and (= (inv@222@01 r@221@01) r@221@01) (img@223@01 r@221@01)))
  :pattern ((Set_in r@221@01 S@202@01))
  :pattern ((inv@222@01 r@221@01))
  :pattern ((img@223@01 r@221@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@223@01 r) (Set_in (inv@222@01 r) S@202@01)) (= (inv@222@01 r) r))
  :pattern ((inv@222@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@224@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@222@01 r) S@202@01) (img@223@01 r) (= r (inv@222@01 r)))
    ($Perm.min
      (ite
        (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
        (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@218@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@225@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@222@01 r) S@202@01) (img@223@01 r) (= r (inv@222@01 r)))
    ($Perm.min
      (ite (= r c@205@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@224@01 r)))
    $Perm.No))
(define-fun pTaken@226@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@222@01 r) S@202@01) (img@223@01 r) (= r (inv@222@01 r)))
    ($Perm.min
      (ite (= r b@203@01) (- $Perm.Write (pTaken@219@01 r)) $Perm.No)
      (- (- $Perm.Write (pTaken@224@01 r)) (pTaken@225@01 r)))
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
        (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
        (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@218@01 r))
        $Perm.No)
      (pTaken@224@01 r))
    $Perm.No)
  
  :qid |quant-u-110|))))
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
    (and (Set_in (inv@222@01 r) S@202@01) (img@223@01 r) (= r (inv@222@01 r)))
    (= (- $Perm.Write (pTaken@224@01 r)) $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@225@01 c@205@01)) $Perm.No)))
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
    (and (Set_in (inv@222@01 r) S@202@01) (img@223@01 r) (= r (inv@222@01 r)))
    (= (- (- $Perm.Write (pTaken@224@01 r)) (pTaken@225@01 r)) $Perm.No))
  
  :qid |quant-u-113|))))
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
  (- (- $Perm.Write (pTaken@219@01 b@203@01)) (pTaken@226@01 b@203@01))
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
    (and (Set_in (inv@222@01 r) S@202@01) (img@223@01 r) (= r (inv@222@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@224@01 r)) (pTaken@225@01 r))
        (pTaken@226@01 r))
      $Perm.No))
  
  :qid |quant-u-115|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@227@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r c@205@01)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@220@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@220@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r b@203@01) (< $Perm.No (- $Perm.Write (pTaken@219@01 r))) false)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@217@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@217@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@218@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) r))
  :qid |qp.fvfValDef22|)))
; [eval] (forall t: Ref :: { (t in S) } (t in S) ==> t.f > a)
(declare-const t@228@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (t in S) ==> t.f > a
; [eval] (t in S)
(push) ; 4
; [then-branch: 26 | t@228@01 in S@202@01 | live]
; [else-branch: 26 | !(t@228@01 in S@202@01) | live]
(push) ; 5
; [then-branch: 26 | t@228@01 in S@202@01]
(assert (Set_in t@228@01 S@202@01))
; [eval] t.f > a
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r c@205@01)
      (=
        ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@220@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@220@01  $FVF<f>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite (= r b@203@01) (< $Perm.No (- $Perm.Write (pTaken@219@01 r))) false)
      (=
        ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@217@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@217@01  $FVF<f>) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
        (< $Perm.No (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@218@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) r)))
    :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) r))
    :qid |qp.fvfValDef22|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= t@228@01 c@205@01) $Perm.Write $Perm.No)
      (ite
        (= t@228@01 b@203@01)
        (- $Perm.Write (pTaken@219@01 t@228@01))
        $Perm.No))
    (ite
      (and (img@209@01 t@228@01) (Set_in (inv@208@01 t@228@01) S@202@01))
      (- (- $Perm.Write (pTaken@216@01 t@228@01)) (pTaken@218@01 t@228@01))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(t@228@01 in S@202@01)]
(assert (not (Set_in t@228@01 S@202@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r c@205@01)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@220@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@220@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r b@203@01) (< $Perm.No (- $Perm.Write (pTaken@219@01 r))) false)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@217@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@217@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@218@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) r))
  :qid |qp.fvfValDef22|)))
; Joined path conditions
(assert (or (not (Set_in t@228@01 S@202@01)) (Set_in t@228@01 S@202@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r c@205@01)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@220@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@220@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r b@203@01) (< $Perm.No (- $Perm.Write (pTaken@219@01 r))) false)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@217@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@217@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@209@01 r) (Set_in (inv@208@01 r) S@202@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@218@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@227@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) r)))
  :pattern (($FVF.lookup_f (as sm@227@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@206@01)) r))
  :qid |qp.fvfValDef22|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((t@228@01 $Ref)) (!
  (or (not (Set_in t@228@01 S@202@01)) (Set_in t@228@01 S@202@01))
  :pattern ((Set_in t@228@01 S@202@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@107@10@107@48-aux|)))
(push) ; 3
(assert (not (forall ((t@228@01 $Ref)) (!
  (=>
    (Set_in t@228@01 S@202@01)
    (> ($FVF.lookup_f (as sm@227@01  $FVF<f>) t@228@01) a@204@01))
  :pattern ((Set_in t@228@01 S@202@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@107@10@107@48|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((t@228@01 $Ref)) (!
  (=>
    (Set_in t@228@01 S@202@01)
    (> ($FVF.lookup_f (as sm@227@01  $FVF<f>) t@228@01) a@204@01))
  :pattern ((Set_in t@228@01 S@202@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sets/consumepureforall.vpr@107@10@107@48|)))
(pop) ; 2
(pop) ; 1
