(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:57:09
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0502.vpr
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
; ---------- foo0 ----------
(declare-const r1@0@01 $Ref)
(declare-const r2@1@01 $Ref)
(declare-const s@2@01 Set<$Ref>)
(declare-const r1@3@01 $Ref)
(declare-const r2@4@01 $Ref)
(declare-const s@5@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(declare-const sm@7@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@7@01  $FVF<f>) r1@3@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@6@01))))
(assert (not (= r1@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(declare-const sm@8@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@8@01  $FVF<f>) r2@4@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@6@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r2@4@01 r1@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@4@01 $Ref.null)))
(declare-const x@9@01 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (x in s)
(assert (Set_in x@9@01 s@5@01))
(pop) ; 2
(declare-fun inv@10@01 ($Ref) $Ref)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@9@01 $Ref) (x2@9@01 $Ref)) (!
  (=>
    (and (Set_in x1@9@01 s@5@01) (Set_in x2@9@01 s@5@01) (= x1@9@01 x2@9@01))
    (= x1@9@01 x2@9@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@9@01 $Ref)) (!
  (=>
    (Set_in x@9@01 s@5@01)
    (and (= (inv@10@01 x@9@01) x@9@01) (img@11@01 x@9@01)))
  :pattern ((Set_in x@9@01 s@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@11@01 r) (Set_in (inv@10@01 r) s@5@01)) (= (inv@10@01 r) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@9@01 $Ref)) (!
  (=> (Set_in x@9@01 s@5@01) (not (= x@9@01 $Ref.null)))
  :pattern ((Set_in x@9@01 s@5@01))
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
; assert r1 != r2
; [eval] r1 != r2
(push) ; 3
(assert (not (not (= r1@3@01 r2@4@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@3@01 r2@4@01)))
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
    ($FVF.lookup_f (as sm@7@01  $FVF<f>) r1@3@01)
    ($FVF.lookup_f (as sm@8@01  $FVF<f>) r2@4@01)))))
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
    ($FVF.lookup_f (as sm@8@01  $FVF<f>) r2@4@01)
    ($FVF.lookup_f (as sm@7@01  $FVF<f>) r1@3@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@3@01 r2@4@01)) (not (= r2@4@01 r1@3@01))))
(declare-const sm@12@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r1@3@01)
    (=
      ($FVF.lookup_f (as sm@12@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@7@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@7@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@4@01)
    (=
      ($FVF.lookup_f (as sm@12@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@8@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@8@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@11@01 r) (Set_in (inv@10@01 r) s@5@01))
    (=
      ($FVF.lookup_f (as sm@12@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@6@01))) r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@6@01))) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@13@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@13@01  $FPM) r)
    (+
      (+
        (ite (= r r1@3@01) $Perm.Write $Perm.No)
        (ite (= r r2@4@01) $Perm.Write $Perm.No))
      (ite
        (and (img@11@01 r) (Set_in (inv@10@01 r) s@5@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@13@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(assert (<= ($FVF.perm_f (as pm@13@01  $FPM) r1@3@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@13@01  $FPM) r2@4@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@13@01  $FPM) r) $Perm.Write)
  :pattern ((inv@10@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] r1 != r2
(pop) ; 2
(pop) ; 1
; ---------- foo1 ----------
(declare-const r1@14@01 $Ref)
(declare-const r2@15@01 $Ref)
(declare-const s@16@01 Set<$Ref>)
(declare-const r1@17@01 $Ref)
(declare-const r2@18@01 $Ref)
(declare-const s@19@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@20@01 $Snap)
(assert (= $t@20@01 ($Snap.combine ($Snap.first $t@20@01) ($Snap.second $t@20@01))))
(declare-const sm@21@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@21@01  $FVF<f>) r1@17@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@20@01))))
(assert (not (= r1@17@01 $Ref.null)))
(declare-const sm@22@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r1@17@01)
    (=
      ($FVF.lookup_f (as sm@22@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@22@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) r)
  :pattern (($FVF.lookup_f (as sm@22@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@22@01  $FVF<f>) r1@17@01) r1@17@01))
(assert (=
  ($Snap.second $t@20@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@20@01))
    ($Snap.second ($Snap.second $t@20@01)))))
(declare-const sm@23@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@23@01  $FVF<f>) r2@18@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@20@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r2@18@01 r1@17@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@18@01 $Ref.null)))
(declare-const sm@24@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r1@17@01)
    (=
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@18@01)
    (=
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@23@01  $FVF<f>) r) r))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@24@01  $FVF<f>) r2@18@01) r2@18@01))
(declare-const x@25@01 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (x in s)
(assert (Set_in x@25@01 s@19@01))
; Definitional axioms for snapshot map values
(pop) ; 2
(declare-fun inv@26@01 ($Ref) $Ref)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@25@01 $Ref) (x2@25@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@25@01 s@19@01)
      (Set_in x2@25@01 s@19@01)
      (= x1@25@01 x2@25@01))
    (= x1@25@01 x2@25@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@25@01 $Ref)) (!
  (=>
    (Set_in x@25@01 s@19@01)
    (and (= (inv@26@01 x@25@01) x@25@01) (img@27@01 x@25@01)))
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@20@01))) x@25@01) x@25@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@27@01 r) (Set_in (inv@26@01 r) s@19@01)) (= (inv@26@01 r) r))
  :pattern ((inv@26@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@25@01 $Ref)) (!
  (=> (Set_in x@25@01 s@19@01) (not (= x@25@01 $Ref.null)))
  :pattern (($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@20@01))) x@25@01) x@25@01))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@28@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r1@17@01)
    (=
      ($FVF.lookup_f (as sm@28@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@21@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@28@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@18@01)
    (=
      ($FVF.lookup_f (as sm@28@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@28@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (Set_in (inv@26@01 r) s@19@01))
    (=
      ($FVF.lookup_f (as sm@28@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@20@01))) r)))
  :pattern (($FVF.lookup_f (as sm@28@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@20@01))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@23@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@20@01))) r) r))
  :pattern (($FVF.lookup_f (as sm@28@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@26@01 r) s@19@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :pattern ((inv@26@01 r))
  :qid |quant-u-4|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert r1 != r2
; [eval] r1 != r2
(push) ; 3
(assert (not (not (= r1@17@01 r2@18@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@17@01 r2@18@01)))
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
    ($FVF.lookup_f (as sm@21@01  $FVF<f>) r1@17@01)
    ($FVF.lookup_f (as sm@23@01  $FVF<f>) r2@18@01)))))
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
    ($FVF.lookup_f (as sm@23@01  $FVF<f>) r2@18@01)
    ($FVF.lookup_f (as sm@21@01  $FVF<f>) r1@17@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@17@01 r2@18@01)) (not (= r2@18@01 r1@17@01))))
; Definitional axioms for snapshot map values
(declare-const pm@29@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@29@01  $FPM) r)
    (+
      (+
        (ite (= r r1@17@01) $Perm.Write $Perm.No)
        (ite (= r r2@18@01) $Perm.Write $Perm.No))
      (ite
        (and (img@27@01 r) (Set_in (inv@26@01 r) s@19@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@29@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f (as sm@23@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@20@01))) r) r))
  :pattern (($FVF.perm_f (as pm@29@01  $FPM) r))
  :qid |qp.resTrgDef14|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@29@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_f ($FVF.lookup_f (as sm@28@01  $FVF<f>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] r1 != r2
(pop) ; 2
(pop) ; 1
; ---------- foo2 ----------
(declare-const r1@30@01 $Ref)
(declare-const r2@31@01 $Ref)
(declare-const s@32@01 Set<$Ref>)
(declare-const r1@33@01 $Ref)
(declare-const r2@34@01 $Ref)
(declare-const s@35@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(declare-const sm@37@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@37@01  $FVF<f>) r1@33@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@36@01))))
(assert (not (= r1@33@01 $Ref.null)))
(assert (=
  ($Snap.second $t@36@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@36@01))
    ($Snap.second ($Snap.second $t@36@01)))))
(declare-const sm@38@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@38@01  $FVF<f>) r2@34@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@36@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r2@34@01 r1@33@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@34@01 $Ref.null)))
(declare-const x@39@01 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (x in s)
(assert (Set_in x@39@01 s@35@01))
(pop) ; 2
(declare-fun inv@40@01 ($Ref) $Ref)
(declare-fun img@41@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@39@01 $Ref) (x2@39@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@39@01 s@35@01)
      (Set_in x2@39@01 s@35@01)
      (= x1@39@01 x2@39@01))
    (= x1@39@01 x2@39@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@39@01 $Ref)) (!
  (=>
    (Set_in x@39@01 s@35@01)
    (and (= (inv@40@01 x@39@01) x@39@01) (img@41@01 x@39@01)))
  :pattern ((Set_in x@39@01 s@35@01))
  :qid |quant-u-6|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@41@01 r) (Set_in (inv@40@01 r) s@35@01)) (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@39@01 $Ref)) (!
  (=> (Set_in x@39@01 s@35@01) (not (= x@39@01 $Ref.null)))
  :pattern ((Set_in x@39@01 s@35@01))
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
; assert r1 != r2
; [eval] r1 != r2
(push) ; 3
(assert (not (not (= r1@33@01 r2@34@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@33@01 r2@34@01)))
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
    ($FVF.lookup_f (as sm@37@01  $FVF<f>) r1@33@01)
    ($FVF.lookup_f (as sm@38@01  $FVF<f>) r2@34@01)))))
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
    ($FVF.lookup_f (as sm@38@01  $FVF<f>) r2@34@01)
    ($FVF.lookup_f (as sm@37@01  $FVF<f>) r1@33@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@33@01 r2@34@01)) (not (= r2@34@01 r1@33@01))))
(declare-const sm@42@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r1@33@01)
    (=
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@37@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@34@01)
    (=
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@38@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@41@01 r) (Set_in (inv@40@01 r) s@35@01))
    (=
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@36@01))) r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@36@01))) r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@43@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@43@01  $FPM) r)
    (+
      (+
        (ite (= r r1@33@01) $Perm.Write $Perm.No)
        (ite (= r r2@34@01) $Perm.Write $Perm.No))
      (ite
        (and (img@41@01 r) (Set_in (inv@40@01 r) s@35@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@43@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (<= ($FVF.perm_f (as pm@43@01  $FPM) r1@33@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@43@01  $FPM) r2@34@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@43@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] r1 != r2
; [exec]
; r1.f := 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@44@01 ((r $Ref)) $Perm
  (ite
    (= r r1@33@01)
    ($Perm.min (ite (= r r1@33@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (= r r1@33@01)
    ($Perm.min
      (ite (= r r2@34@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@44@01 r)))
    $Perm.No))
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (= r r1@33@01)
    ($Perm.min
      (ite
        (and (img@41@01 r) (Set_in (inv@40@01 r) s@35@01))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@44@01 r)) (pTaken@45@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@44@01 r1@33@01)) $Perm.No)))
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
  (=> (= r r1@33@01) (= (- $Perm.Write (pTaken@44@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@47@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@47@01  $FVF<f>) r1@33@01) 3))
; [exec]
; assert r1 != r2
; [eval] r1 != r2
(pop) ; 2
(pop) ; 1
; ---------- foo3 ----------
(declare-const r1@48@01 $Ref)
(declare-const r2@49@01 $Ref)
(declare-const s@50@01 Set<$Ref>)
(declare-const r1@51@01 $Ref)
(declare-const r2@52@01 $Ref)
(declare-const s@53@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 ($Snap.combine ($Snap.first $t@54@01) ($Snap.second $t@54@01))))
(declare-const sm@55@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@55@01  $FVF<f>) r1@51@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@54@01))))
(assert (not (= r1@51@01 $Ref.null)))
(assert (=
  ($Snap.second $t@54@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@54@01))
    ($Snap.second ($Snap.second $t@54@01)))))
(declare-const sm@56@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@56@01  $FVF<f>) r2@52@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@54@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r2@52@01 r1@51@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@52@01 $Ref.null)))
(declare-const x@57@01 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (x in s)
(assert (Set_in x@57@01 s@53@01))
(pop) ; 2
(declare-fun inv@58@01 ($Ref) $Ref)
(declare-fun img@59@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@57@01 $Ref) (x2@57@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@57@01 s@53@01)
      (Set_in x2@57@01 s@53@01)
      (= x1@57@01 x2@57@01))
    (= x1@57@01 x2@57@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@57@01 $Ref)) (!
  (=>
    (Set_in x@57@01 s@53@01)
    (and (= (inv@58@01 x@57@01) x@57@01) (img@59@01 x@57@01)))
  :pattern ((Set_in x@57@01 s@53@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@59@01 r) (Set_in (inv@58@01 r) s@53@01)) (= (inv@58@01 r) r))
  :pattern ((inv@58@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@57@01 $Ref)) (!
  (=> (Set_in x@57@01 s@53@01) (not (= x@57@01 $Ref.null)))
  :pattern ((Set_in x@57@01 s@53@01))
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
; r1.f := 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (= r r1@51@01)
    ($Perm.min (ite (= r r1@51@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (= r r1@51@01)
    ($Perm.min
      (ite (= r r2@52@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@60@01 r)))
    $Perm.No))
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (= r r1@51@01)
    ($Perm.min
      (ite
        (and (img@59@01 r) (Set_in (inv@58@01 r) s@53@01))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@60@01 r1@51@01)) $Perm.No)))
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
  (=> (= r r1@51@01) (= (- $Perm.Write (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r1@51@01) 3))
; [exec]
; assert perm(r1.f) <= write
; [eval] perm(r1.f) <= write
; [eval] perm(r1.f)
(declare-const pm@64@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@64@01  $FPM) r)
    (+
      (+
        (ite (= r r1@51@01) $Perm.Write $Perm.No)
        (ite
          (and (img@59@01 r) (Set_in (inv@58@01 r) s@53@01))
          $Perm.Write
          $Perm.No))
      (ite (= r r2@52@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@64@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
; perm(r1.f)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_f (as pm@64@01  $FPM) r1@51@01) $Perm.Write))
(set-option :timeout 0)
(push) ; 3
(assert (not (<= ($FVF.perm_f (as pm@64@01  $FPM) r1@51@01) $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= ($FVF.perm_f (as pm@64@01  $FPM) r1@51@01) $Perm.Write))
; [exec]
; assert r1 != r2
; [eval] r1 != r2
(push) ; 3
(assert (not (not (= r1@51@01 r2@52@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= r1@51@01 r2@52@01)))
(pop) ; 2
(pop) ; 1
; ---------- foo4 ----------
(declare-const r1@65@01 $Ref)
(declare-const r2@66@01 $Ref)
(declare-const s@67@01 Set<$Ref>)
(declare-const r1@68@01 $Ref)
(declare-const r2@69@01 $Ref)
(declare-const s@70@01 Set<$Ref>)
(push) ; 1
(declare-const $t@71@01 $Snap)
(assert (= $t@71@01 ($Snap.combine ($Snap.first $t@71@01) ($Snap.second $t@71@01))))
(declare-const sm@72@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@72@01  $FVF<f>) r1@68@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@71@01))))
(assert (not (= r1@68@01 $Ref.null)))
(assert (=
  ($Snap.second $t@71@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@71@01))
    ($Snap.second ($Snap.second $t@71@01)))))
(declare-const sm@73@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@73@01  $FVF<f>) r2@69@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@71@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r2@69@01 r1@68@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@69@01 $Ref.null)))
(declare-const x@74@01 $Ref)
(set-option :timeout 0)
(push) ; 2
; [eval] (x in s)
(assert (Set_in x@74@01 s@70@01))
(pop) ; 2
(declare-fun inv@75@01 ($Ref) $Ref)
(declare-fun img@76@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@74@01 $Ref) (x2@74@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@74@01 s@70@01)
      (Set_in x2@74@01 s@70@01)
      (= x1@74@01 x2@74@01))
    (= x1@74@01 x2@74@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@74@01 $Ref)) (!
  (=>
    (Set_in x@74@01 s@70@01)
    (and (= (inv@75@01 x@74@01) x@74@01) (img@76@01 x@74@01)))
  :pattern ((Set_in x@74@01 s@70@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@76@01 r) (Set_in (inv@75@01 r) s@70@01)) (= (inv@75@01 r) r))
  :pattern ((inv@75@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@74@01 $Ref)) (!
  (=> (Set_in x@74@01 s@70@01) (not (= x@74@01 $Ref.null)))
  :pattern ((Set_in x@74@01 s@70@01))
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
; assert true
; [exec]
; r1.f := 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@77@01 ((r $Ref)) $Perm
  (ite
    (= r r1@68@01)
    ($Perm.min (ite (= r r1@68@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (= r r1@68@01)
    ($Perm.min
      (ite (= r r2@69@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@77@01 r)))
    $Perm.No))
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (= r r1@68@01)
    ($Perm.min
      (ite
        (and (img@76@01 r) (Set_in (inv@75@01 r) s@70@01))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@77@01 r)) (pTaken@78@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@77@01 r1@68@01)) $Perm.No)))
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
  (=> (= r r1@68@01) (= (- $Perm.Write (pTaken@77@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@80@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@80@01  $FVF<f>) r1@68@01) 3))
; [exec]
; assert r1 != r2
; [eval] r1 != r2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= r1@68@01 r2@69@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@68@01 r2@69@01)))
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
    ($FVF.lookup_f (as sm@80@01  $FVF<f>) r1@68@01)
    ($FVF.lookup_f (as sm@73@01  $FVF<f>) r2@69@01)))))
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
    ($FVF.lookup_f (as sm@73@01  $FVF<f>) r2@69@01)
    ($FVF.lookup_f (as sm@80@01  $FVF<f>) r1@68@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@68@01 r2@69@01)) (not (= r2@69@01 r1@68@01))))
(declare-const sm@81@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r1@68@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@80@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@80@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@76@01 r) (Set_in (inv@75@01 r) s@70@01))
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@71@01))) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second $t@71@01))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@69@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@73@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@73@01  $FVF<f>) r))
  :qid |qp.fvfValDef22|)))
(declare-const pm@82@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (+
        (ite (= r r1@68@01) $Perm.Write $Perm.No)
        (ite
          (and (img@76@01 r) (Set_in (inv@75@01 r) s@70@01))
          $Perm.Write
          $Perm.No))
      (ite (= r r2@69@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (<= ($FVF.perm_f (as pm@82@01  $FPM) r1@68@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@82@01  $FPM) r) $Perm.Write)
  :pattern ((inv@75@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@82@01  $FPM) r2@69@01) $Perm.Write))
; [eval] r1 != r2
(pop) ; 2
(pop) ; 1
; ---------- foo5 ----------
(declare-const r1@83@01 $Ref)
(declare-const r2@84@01 $Ref)
(declare-const s@85@01 Set<$Ref>)
(declare-const r1@86@01 $Ref)
(declare-const r2@87@01 $Ref)
(declare-const s@88@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@89@01 $Snap)
(assert (= $t@89@01 ($Snap.combine ($Snap.first $t@89@01) ($Snap.second $t@89@01))))
(declare-const sm@90@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@90@01  $FVF<f>) r1@86@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@89@01))))
(assert (not (= r1@86@01 $Ref.null)))
(assert (=
  ($Snap.second $t@89@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@89@01))
    ($Snap.second ($Snap.second $t@89@01)))))
(declare-const sm@91@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@91@01  $FVF<f>) r2@87@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@89@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r2@87@01 r1@86@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@87@01 $Ref.null)))
(declare-const x@92@01 $Ref)
(set-option :timeout 0)
(push) ; 2
(assert false)
(pop) ; 2
(declare-fun inv@93@01 ($Ref) $Ref)
(declare-fun img@94@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r1.f := 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@95@01 ((r $Ref)) $Perm
  (ite
    (= r r1@86@01)
    ($Perm.min (ite (= r r1@86@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@96@01 ((r $Ref)) $Perm
  (ite
    (= r r1@86@01)
    ($Perm.min
      (ite (= r r2@87@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@95@01 r)))
    $Perm.No))
(define-fun pTaken@97@01 ((r $Ref)) $Perm
  (ite
    (= r r1@86@01)
    ($Perm.min $Perm.No (- (- $Perm.Write (pTaken@95@01 r)) (pTaken@96@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@95@01 r1@86@01)) $Perm.No)))
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
  (=> (= r r1@86@01) (= (- $Perm.Write (pTaken@95@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@98@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r1@86@01) 3))
; [exec]
; assert r1 != r2
; [eval] r1 != r2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= r1@86@01 r2@87@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@86@01 r2@87@01)))
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
    ($FVF.lookup_f (as sm@98@01  $FVF<f>) r1@86@01)
    ($FVF.lookup_f (as sm@91@01  $FVF<f>) r2@87@01)))))
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
    ($FVF.lookup_f (as sm@91@01  $FVF<f>) r2@87@01)
    ($FVF.lookup_f (as sm@98@01  $FVF<f>) r1@86@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@86@01 r2@87@01)) (not (= r2@87@01 r1@86@01))))
(declare-const sm@99@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r1@86@01)
    (=
      ($FVF.lookup_f (as sm@99@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@98@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@99@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@87@01)
    (=
      ($FVF.lookup_f (as sm@99@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@91@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@99@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@91@01  $FVF<f>) r))
  :qid |qp.fvfValDef26|)))
(declare-const pm@100@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@100@01  $FPM) r)
    (+
      (ite (= r r1@86@01) $Perm.Write $Perm.No)
      (ite (= r r2@87@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@100@01  $FPM) r))
  :qid |qp.resPrmSumDef27|)))
(assert (<= ($FVF.perm_f (as pm@100@01  $FPM) r1@86@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@100@01  $FPM) r) $Perm.Write)
  :pattern ((inv@93@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@100@01  $FPM) r2@87@01) $Perm.Write))
; [eval] r1 != r2
(pop) ; 2
(pop) ; 1
; ---------- foo6 ----------
(declare-const r1@101@01 $Ref)
(declare-const r2@102@01 $Ref)
(declare-const s@103@01 Set<$Ref>)
(declare-const r1@104@01 $Ref)
(declare-const r2@105@01 $Ref)
(declare-const s@106@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@107@01 $Snap)
(assert (= $t@107@01 ($Snap.combine ($Snap.first $t@107@01) ($Snap.second $t@107@01))))
(declare-const sm@108@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@108@01  $FVF<f>) r1@104@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@107@01))))
(assert (not (= r1@104@01 $Ref.null)))
(assert (=
  ($Snap.second $t@107@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@107@01))
    ($Snap.second ($Snap.second $t@107@01)))))
(declare-const sm@109@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@109@01  $FVF<f>) r2@105@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@107@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= r2@105@01 r1@104@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= r2@105@01 $Ref.null)))
(declare-const x@110@01 $Ref)
(set-option :timeout 0)
(push) ; 2
(assert false)
(pop) ; 2
(declare-fun inv@111@01 ($Ref) $Ref)
(declare-fun img@112@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
; Definitional axioms for inverse functions
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; r1.f := 3
; Precomputing data for removing quantified permissions
(define-fun pTaken@113@01 ((r $Ref)) $Perm
  (ite
    (= r r1@104@01)
    ($Perm.min (ite (= r r1@104@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@114@01 ((r $Ref)) $Perm
  (ite
    (= r r1@104@01)
    ($Perm.min
      (ite (= r r2@105@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@113@01 r)))
    $Perm.No))
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (= r r1@104@01)
    ($Perm.min $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@114@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@113@01 r1@104@01)) $Perm.No)))
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
  (=> (= r r1@104@01) (= (- $Perm.Write (pTaken@113@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@116@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@116@01  $FVF<f>) r1@104@01) 3))
; [exec]
; assert r1 != r2
; [eval] r1 != r2
(set-option :timeout 0)
(push) ; 3
(assert (not (not (= r1@104@01 r2@105@01))))
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= r1@104@01 r2@105@01)))
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
    ($FVF.lookup_f (as sm@116@01  $FVF<f>) r1@104@01)
    ($FVF.lookup_f (as sm@109@01  $FVF<f>) r2@105@01)))))
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
    ($FVF.lookup_f (as sm@109@01  $FVF<f>) r2@105@01)
    ($FVF.lookup_f (as sm@116@01  $FVF<f>) r1@104@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and (not (= r1@104@01 r2@105@01)) (not (= r2@105@01 r1@104@01))))
(declare-const sm@117@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r r1@104@01)
    (=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@116@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@116@01  $FVF<f>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r r2@105@01)
    (=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@109@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@109@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(declare-const pm@118@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@118@01  $FPM) r)
    (+
      (ite (= r r1@104@01) $Perm.Write $Perm.No)
      (ite (= r r2@105@01) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (<= ($FVF.perm_f (as pm@118@01  $FPM) r1@104@01) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@118@01  $FPM) r) $Perm.Write)
  :pattern ((inv@111@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@118@01  $FPM) r2@105@01) $Perm.Write))
; [eval] r1 != r2
(pop) ; 2
(pop) ; 1
