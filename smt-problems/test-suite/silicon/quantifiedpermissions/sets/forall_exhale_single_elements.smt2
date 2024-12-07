(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:20
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/forall_exhale_single_elements.vpr
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
; ---------- t1 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const x@1@01 $Ref)
(declare-const xs@2@01 Set<$Ref>)
(declare-const x@3@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(declare-const y@5@01 $Ref)
(push) ; 2
; [eval] (y in xs)
(assert (Set_in y@5@01 xs@2@01))
(pop) ; 2
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y1@5@01 $Ref) (y2@5@01 $Ref)) (!
  (=>
    (and (Set_in y1@5@01 xs@2@01) (Set_in y2@5@01 xs@2@01) (= y1@5@01 y2@5@01))
    (= y1@5@01 y2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@5@01 $Ref)) (!
  (=>
    (Set_in y@5@01 xs@2@01)
    (and (= (inv@6@01 y@5@01) y@5@01) (img@7@01 y@5@01)))
  :pattern ((Set_in y@5@01 xs@2@01))
  :pattern ((inv@6@01 y@5@01))
  :pattern ((img@7@01 y@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@5@01 $Ref)) (!
  (=> (Set_in y@5@01 xs@2@01) (not (= y@5@01 $Ref.null)))
  :pattern ((Set_in y@5@01 xs@2@01))
  :pattern ((inv@6@01 y@5@01))
  :pattern ((img@7@01 y@5@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@3@01 xs@2@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert acc(x.f, write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@8@01 ((r $Ref)) $Perm
  (ite
    (= r x@3@01)
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@8@01 r))
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
  (= (pTaken@8@01 r) $Perm.No)
  
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
  (=> (= r x@3@01) (= (- $Perm.Write (pTaken@8@01 r)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@9@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@7@01 x@3@01) (Set_in (inv@6@01 x@3@01) xs@2@01))
  (=
    ($FVF.lookup_f (as sm@9@01  $FVF<f>) x@3@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) x@3@01))))
; [exec]
; exhale (forall z: Ref ::(z in xs) ==> acc(z.f, write))
(declare-const z@10@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@10@01 xs@2@01))
(pop) ; 3
(declare-fun inv@11@01 ($Ref) $Ref)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
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
(pop) ; 3
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
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@13@01 r))
    $Perm.No)
  
  :qid |quant-u-8|))))
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
    (and (Set_in (inv@11@01 r) xs@2@01) (img@12@01 r) (= r (inv@11@01 r)))
    (= (- $Perm.Write (pTaken@13@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
    (=
      ($FVF.lookup_f (as sm@9@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r)))
  :pattern (($FVF.lookup_f (as sm@9@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@4@01)) r))
  :qid |qp.fvfValDef0|)))
; [exec]
; assert acc(x.f, write)
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=> (= r x@3@01) false)
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=> (= r x@3@01) false)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t4 ----------
(declare-const x@14@01 $Ref)
(declare-const y@15@01 $Ref)
(declare-const x@16@01 $Ref)
(declare-const y@17@01 $Ref)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(declare-const sm@19@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@19@01  $FVF<f>) x@16@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@18@01))))
(assert (not (= x@16@01 $Ref.null)))
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@17@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@18@01))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@17@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall z: Ref ::(z in Set(y)) ==> acc(z.f, write))
(declare-const z@21@01 $Ref)
(push) ; 3
; [eval] (z in Set(y))
; [eval] Set(y)
(assert (Set_in z@21@01 (Set_singleton y@17@01)))
(pop) ; 3
(declare-fun inv@22@01 ($Ref) $Ref)
(declare-fun img@23@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@21@01 $Ref) (z2@21@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@21@01 (Set_singleton y@17@01))
      (Set_in z2@21@01 (Set_singleton y@17@01))
      (= z1@21@01 z2@21@01))
    (= z1@21@01 z2@21@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@21@01 $Ref)) (!
  (=>
    (Set_in z@21@01 (Set_singleton y@17@01))
    (and (= (inv@22@01 z@21@01) z@21@01) (img@23@01 z@21@01)))
  :pattern ((Set_in z@21@01 (Set_singleton y@17@01)))
  :pattern ((inv@22@01 z@21@01))
  :pattern ((img@23@01 z@21@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@23@01 r) (Set_in (inv@22@01 r) (Set_singleton y@17@01)))
    (= (inv@22@01 r) r))
  :pattern ((inv@22@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@22@01 r) (Set_singleton y@17@01))
      (img@23@01 r)
      (= r (inv@22@01 r)))
    ($Perm.min (ite (= r x@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@25@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@22@01 r) (Set_singleton y@17@01))
      (img@23@01 r)
      (= r (inv@22@01 r)))
    ($Perm.min
      (ite (= r y@17@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@24@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@24@01 x@16@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@24@01 r) $Perm.No)
  
  :qid |quant-u-15|))))
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
      (Set_in (inv@22@01 r) (Set_singleton y@17@01))
      (img@23@01 r)
      (= r (inv@22@01 r)))
    (= (- $Perm.Write (pTaken@24@01 r)) $Perm.No))
  
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
(assert (not (= (- $Perm.Write (pTaken@25@01 y@17@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@25@01 r) $Perm.No)
  
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
      (Set_in (inv@22@01 r) (Set_singleton y@17@01))
      (img@23@01 r)
      (= r (inv@22@01 r)))
    (= (- (- $Perm.Write (pTaken@24@01 r)) (pTaken@25@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@26@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@16@01)
    (=
      ($FVF.lookup_f (as sm@26@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@19@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@26@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@17@01)
    (=
      ($FVF.lookup_f (as sm@26@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@26@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
; [exec]
; assert acc(x.f, write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@27@01 ((r $Ref)) $Perm
  (ite
    (= r x@16@01)
    ($Perm.min
      (ite (= r x@16@01) (- $Perm.Write (pTaken@24@01 r)) $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@28@01 ((r $Ref)) $Perm
  (ite
    (= r x@16@01)
    ($Perm.min
      (ite (= r y@17@01) (- $Perm.Write (pTaken@25@01 r)) $Perm.No)
      (- $Perm.Write (pTaken@27@01 r)))
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
(assert (not (= (- (- $Perm.Write (pTaken@24@01 x@16@01)) (pTaken@27@01 x@16@01)) $Perm.No)))
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
  (=> (= r x@16@01) (= (- $Perm.Write (pTaken@27@01 r)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (- $Perm.Write (pTaken@25@01 y@17@01)) (pTaken@28@01 y@17@01)) $Perm.No)))
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
    (= r x@16@01)
    (= (- (- $Perm.Write (pTaken@27@01 r)) (pTaken@28@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@29@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (= x@16@01 y@17@01)
    (< $Perm.No (- $Perm.Write (pTaken@25@01 x@16@01)))
    false)
  (=
    ($FVF.lookup_f (as sm@29@01  $FVF<f>) x@16@01)
    ($FVF.lookup_f (as sm@20@01  $FVF<f>) x@16@01))))
(assert (=>
  (< $Perm.No (- $Perm.Write (pTaken@24@01 x@16@01)))
  (=
    ($FVF.lookup_f (as sm@29@01  $FVF<f>) x@16@01)
    ($FVF.lookup_f (as sm@19@01  $FVF<f>) x@16@01))))
; [exec]
; assert acc(y.f, write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (= r y@17@01)
    ($Perm.min
      (ite (= r y@17@01) (- $Perm.Write (pTaken@25@01 r)) $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (= r y@17@01)
    ($Perm.min
      (ite (= r x@16@01) (- $Perm.Write (pTaken@24@01 r)) $Perm.No)
      (- $Perm.Write (pTaken@30@01 r)))
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
(assert (not (= (- (- $Perm.Write (pTaken@25@01 y@17@01)) (pTaken@30@01 y@17@01)) $Perm.No)))
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
  (=> (= r y@17@01) (= (- $Perm.Write (pTaken@30@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (- $Perm.Write (pTaken@24@01 x@16@01)) (pTaken@31@01 x@16@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@31@01 r) $Perm.No)
  
  :qid |quant-u-29|))))
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
    (= r y@17@01)
    (= (- (- $Perm.Write (pTaken@30@01 r)) (pTaken@31@01 r)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r y@17@01)
    (= (- (- $Perm.Write (pTaken@30@01 r)) (pTaken@31@01 r)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@17@01 x@16@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (- $Perm.Write (pTaken@25@01 y@17@01))
    (- $Perm.Write (pTaken@24@01 x@16@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (- $Perm.Write (pTaken@24@01 x@16@01))
    (- $Perm.Write (pTaken@25@01 y@17@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write (pTaken@25@01 y@17@01)))
    (< $Perm.No (- $Perm.Write (pTaken@24@01 x@16@01))))
  (not
    (=
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@17@01)
      ($FVF.lookup_f (as sm@19@01  $FVF<f>) x@16@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (- $Perm.Write (pTaken@24@01 x@16@01)))
    (< $Perm.No (- $Perm.Write (pTaken@25@01 y@17@01))))
  (not
    (=
      ($FVF.lookup_f (as sm@19@01  $FVF<f>) x@16@01)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) y@17@01))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r y@17@01) (< $Perm.No (- $Perm.Write (pTaken@25@01 r))) false)
    (=
      ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r x@16@01) (< $Perm.No (- $Perm.Write (pTaken@24@01 r))) false)
    (=
      ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@19@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@19@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@32@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@32@01  $FPM) r)
    (+
      (ite (= r y@17@01) (- $Perm.Write (pTaken@25@01 r)) $Perm.No)
      (ite (= r x@16@01) (- $Perm.Write (pTaken@24@01 r)) $Perm.No)))
  :pattern (($FVF.perm_f (as pm@32@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(assert (<= ($FVF.perm_f (as pm@32@01  $FPM) y@17@01) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@32@01  $FPM) x@16@01) $Perm.Write))
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (= r y@17@01)
    ($Perm.min
      (ite (= r y@17@01) (- $Perm.Write (pTaken@25@01 r)) $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (= r y@17@01)
    ($Perm.min
      (ite (= r x@16@01) (- $Perm.Write (pTaken@24@01 r)) $Perm.No)
      (- $Perm.Write (pTaken@33@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (- $Perm.Write (pTaken@25@01 y@17@01)) (pTaken@33@01 y@17@01)) $Perm.No)))
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
  (=> (= r y@17@01) (= (- $Perm.Write (pTaken@33@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (- $Perm.Write (pTaken@24@01 x@16@01)) (pTaken@34@01 x@16@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@34@01 r) $Perm.No)
  
  :qid |quant-u-35|))))
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
    (= r y@17@01)
    (= (- (- $Perm.Write (pTaken@33@01 r)) (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r y@17@01)
    (= (- (- $Perm.Write (pTaken@33@01 r)) (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(declare-const x@35@01 $Ref)
(declare-const y@36@01 $Ref)
(declare-const x@37@01 $Ref)
(declare-const y@38@01 $Ref)
(push) ; 1
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
(declare-const sm@40@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@40@01  $FVF<f>) x@37@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@39@01))))
(assert (not (= x@37@01 $Ref.null)))
(declare-const sm@41@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@41@01  $FVF<f>) y@38@01)
  ($SortWrappers.$SnapToInt ($Snap.second $t@39@01))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@38@01 x@37@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@38@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall z: Ref ::(z in Set(x, y)) ==> acc(z.f, write))
(declare-const z@42@01 $Ref)
(push) ; 3
; [eval] (z in Set(x, y))
; [eval] Set(x, y)
(assert (Set_in z@42@01 (Set_unionone (Set_singleton x@37@01) y@38@01)))
(pop) ; 3
(declare-fun inv@43@01 ($Ref) $Ref)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@42@01 $Ref) (z2@42@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@42@01 (Set_unionone (Set_singleton x@37@01) y@38@01))
      (Set_in z2@42@01 (Set_unionone (Set_singleton x@37@01) y@38@01))
      (= z1@42@01 z2@42@01))
    (= z1@42@01 z2@42@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@42@01 $Ref)) (!
  (=>
    (Set_in z@42@01 (Set_unionone (Set_singleton x@37@01) y@38@01))
    (and (= (inv@43@01 z@42@01) z@42@01) (img@44@01 z@42@01)))
  :pattern ((Set_in z@42@01 (Set_unionone (Set_singleton x@37@01) y@38@01)))
  :pattern ((inv@43@01 z@42@01))
  :pattern ((img@44@01 z@42@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@44@01 r)
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@37@01) y@38@01)))
    (= (inv@43@01 r) r))
  :pattern ((inv@43@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@37@01) y@38@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    ($Perm.min (ite (= r x@37@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@37@01) y@38@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    ($Perm.min
      (ite (= r y@38@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@45@01 r)))
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
(assert (not (= (- $Perm.Write (pTaken@45@01 x@37@01)) $Perm.No)))
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
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@37@01) y@38@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    (= (- $Perm.Write (pTaken@45@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@46@01 y@38@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@46@01 r) $Perm.No)
  
  :qid |quant-u-42|))))
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
      (Set_in (inv@43@01 r) (Set_unionone (Set_singleton x@37@01) y@38@01))
      (img@44@01 r)
      (= r (inv@43@01 r)))
    (= (- (- $Perm.Write (pTaken@45@01 r)) (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@47@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@37@01)
    (=
      ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@40@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@40@01  $FVF<f>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@38@01)
    (=
      ($FVF.lookup_f (as sm@47@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@41@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@47@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
  :qid |qp.fvfValDef7|)))
; [exec]
; assert acc(x.f, 1 / 8)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@38@01 x@37@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (= r x@37@01)
    ($Perm.min
      (ite (= r y@38@01) (- $Perm.Write (pTaken@46@01 r)) $Perm.No)
      (/ (to_real 1) (to_real 8)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (- $Perm.Write (pTaken@46@01 y@38@01)) (pTaken@48@01 y@38@01)) $Perm.No)))
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
  
  :qid |quant-u-46|))))
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
    (= r x@37@01)
    (= (- (/ (to_real 1) (to_real 8)) (pTaken@48@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r x@37@01)
    (= (- (/ (to_real 1) (to_real 8)) (pTaken@48@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite (= r y@38@01) (< $Perm.No (- $Perm.Write (pTaken@46@01 r))) false)
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@41@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@41@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@50@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@50@01  $FPM) r)
    (ite (= r y@38@01) (- $Perm.Write (pTaken@46@01 r)) $Perm.No))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(assert (<= ($FVF.perm_f (as pm@50@01  $FPM) y@38@01) $Perm.Write))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@38@01 x@37@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (= r x@37@01)
    ($Perm.min
      (ite (= r y@38@01) (- $Perm.Write (pTaken@46@01 r)) $Perm.No)
      (/ (to_real 1) (to_real 8)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (- $Perm.Write (pTaken@46@01 y@38@01)) (pTaken@51@01 y@38@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@51@01 r) $Perm.No)
  
  :qid |quant-u-50|))))
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
    (= r x@37@01)
    (= (- (/ (to_real 1) (to_real 8)) (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r x@37@01)
    (= (- (/ (to_real 1) (to_real 8)) (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t3 ----------
(declare-const xs@52@01 Set<$Ref>)
(declare-const ys@53@01 Set<$Ref>)
(declare-const x@54@01 $Ref)
(declare-const xs@55@01 Set<$Ref>)
(declare-const ys@56@01 Set<$Ref>)
(declare-const x@57@01 $Ref)
(push) ; 1
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 ($Snap.combine ($Snap.first $t@58@01) ($Snap.second $t@58@01))))
(declare-const z@59@01 $Ref)
(push) ; 2
; [eval] (z in xs)
(assert (Set_in z@59@01 xs@55@01))
(pop) ; 2
(declare-fun inv@60@01 ($Ref) $Ref)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((z1@59@01 $Ref) (z2@59@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@59@01 xs@55@01)
      (Set_in z2@59@01 xs@55@01)
      (= z1@59@01 z2@59@01))
    (= z1@59@01 z2@59@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@59@01 $Ref)) (!
  (=>
    (Set_in z@59@01 xs@55@01)
    (and (= (inv@60@01 z@59@01) z@59@01) (img@61@01 z@59@01)))
  :pattern ((Set_in z@59@01 xs@55@01))
  :pattern ((inv@60@01 z@59@01))
  :pattern ((img@61@01 z@59@01))
  :qid |quant-u-53|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@61@01 r) (Set_in (inv@60@01 r) xs@55@01)) (= (inv@60@01 r) r))
  :pattern ((inv@60@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((z@59@01 $Ref)) (!
  (=> (Set_in z@59@01 xs@55@01) (not (= z@59@01 $Ref.null)))
  :pattern ((Set_in z@59@01 xs@55@01))
  :pattern ((inv@60@01 z@59@01))
  :pattern ((img@61@01 z@59@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@58@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@58@01))
    ($Snap.second ($Snap.second $t@58@01)))))
(declare-const y@62@01 $Ref)
(push) ; 2
; [eval] (y in ys)
(assert (Set_in y@62@01 ys@56@01))
(pop) ; 2
(declare-fun inv@63@01 ($Ref) $Ref)
(declare-fun img@64@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y1@62@01 $Ref) (y2@62@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@62@01 ys@56@01)
      (Set_in y2@62@01 ys@56@01)
      (= y1@62@01 y2@62@01))
    (= y1@62@01 y2@62@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@62@01 $Ref)) (!
  (=>
    (Set_in y@62@01 ys@56@01)
    (and (= (inv@63@01 y@62@01) y@62@01) (img@64@01 y@62@01)))
  :pattern ((Set_in y@62@01 ys@56@01))
  :pattern ((inv@63@01 y@62@01))
  :pattern ((img@64@01 y@62@01))
  :qid |quant-u-55|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@64@01 r) (Set_in (inv@63@01 r) ys@56@01)) (= (inv@63@01 r) r))
  :pattern ((inv@63@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@62@01 $Ref)) (!
  (=> (Set_in y@62@01 ys@56@01) (not (= y@62@01 $Ref.null)))
  :pattern ((Set_in y@62@01 ys@56@01))
  :pattern ((inv@63@01 y@62@01))
  :pattern ((img@64@01 y@62@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= y@62@01 z@59@01)
    (=
      (and (img@64@01 r) (Set_in (inv@63@01 r) ys@56@01))
      (and (img@61@01 r) (Set_in (inv@60@01 r) xs@55@01))))
  
  :qid |quant-u-56|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@58@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@58@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@58@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@58@01))) $Snap.unit))
; [eval] (x in xs)
(assert (Set_in x@57@01 xs@55@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@58@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
  $Snap.unit))
; [eval] (x in ys)
(assert (Set_in x@57@01 ys@56@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@58@01))))
  $Snap.unit))
; [eval] x != null
(assert (not (= x@57@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert acc(x.f, write)
; Precomputing data for removing quantified permissions
(define-fun pTaken@65@01 ((r $Ref)) $Perm
  (ite
    (= r x@57@01)
    ($Perm.min
      (ite
        (and (img@61@01 r) (Set_in (inv@60@01 r) xs@55@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@66@01 ((r $Ref)) $Perm
  (ite
    (= r x@57@01)
    ($Perm.min
      (ite
        (and (img@64@01 r) (Set_in (inv@63@01 r) ys@56@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@65@01 r)))
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
        (and (img@61@01 r) (Set_in (inv@60@01 r) xs@55@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@65@01 r))
    $Perm.No)
  
  :qid |quant-u-58|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@65@01 r) $Perm.No)
  
  :qid |quant-u-59|))))
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
  (=> (= r x@57@01) (= (- $Perm.Write (pTaken@65@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
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
        (and (img@64@01 r) (Set_in (inv@63@01 r) ys@56@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@66@01 r))
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
  (= (pTaken@66@01 r) $Perm.No)
  
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
  (=>
    (= r x@57@01)
    (= (- (- $Perm.Write (pTaken@65@01 r)) (pTaken@66@01 r)) $Perm.No))
  
  :qid |quant-u-63|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@67@01 $FVF<f>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (and (img@61@01 x@57@01) (Set_in (inv@60@01 x@57@01) xs@55@01))
  (=
    ($FVF.lookup_f (as sm@67@01  $FVF<f>) x@57@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@58@01)) x@57@01))))
(assert (=>
  (and (img@64@01 x@57@01) (Set_in (inv@63@01 x@57@01) ys@56@01))
  (=
    ($FVF.lookup_f (as sm@67@01  $FVF<f>) x@57@01)
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@58@01))) x@57@01))))
(pop) ; 2
(pop) ; 1
