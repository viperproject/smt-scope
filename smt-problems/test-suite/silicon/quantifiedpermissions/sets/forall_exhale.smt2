(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:20:17
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sets/forall_exhale.vpr
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
(declare-const xs@1@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const y@2@01 $Ref)
(push) ; 2
; [eval] (y in xs)
(assert (Set_in y@2@01 xs@1@01))
(pop) ; 2
(declare-const $t@3@01 $FVF<f>)
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y1@2@01 $Ref) (y2@2@01 $Ref)) (!
  (=>
    (and (Set_in y1@2@01 xs@1@01) (Set_in y2@2@01 xs@1@01) (= y1@2@01 y2@2@01))
    (= y1@2@01 y2@2@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@2@01 $Ref)) (!
  (=>
    (Set_in y@2@01 xs@1@01)
    (and (= (inv@4@01 y@2@01) y@2@01) (img@5@01 y@2@01)))
  :pattern ((Set_in y@2@01 xs@1@01))
  :pattern ((inv@4@01 y@2@01))
  :pattern ((img@5@01 y@2@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) (= (inv@4@01 r) r))
  :pattern ((inv@4@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@2@01 $Ref)) (!
  (=> (Set_in y@2@01 xs@1@01) (not (= y@2@01 $Ref.null)))
  :pattern ((Set_in y@2@01 xs@1@01))
  :pattern ((inv@4@01 y@2@01))
  :pattern ((img@5@01 y@2@01))
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
; exhale (forall z: Ref ::(z in xs) ==> acc(z.f, write))
(declare-const z@6@01 $Ref)
(push) ; 3
; [eval] (z in xs)
(assert (Set_in z@6@01 xs@1@01))
(pop) ; 3
(declare-fun inv@7@01 ($Ref) $Ref)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@6@01 $Ref) (z2@6@01 $Ref)) (!
  (=>
    (and (Set_in z1@6@01 xs@1@01) (Set_in z2@6@01 xs@1@01) (= z1@6@01 z2@6@01))
    (= z1@6@01 z2@6@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@6@01 $Ref)) (!
  (=>
    (Set_in z@6@01 xs@1@01)
    (and (= (inv@7@01 z@6@01) z@6@01) (img@8@01 z@6@01)))
  :pattern ((Set_in z@6@01 xs@1@01))
  :pattern ((inv@7@01 z@6@01))
  :pattern ((img@8@01 z@6@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01)) (= (inv@7@01 r) r))
  :pattern ((inv@7@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@9@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@7@01 r) xs@1@01) (img@8@01 r) (= r (inv@7@01 r)))
    ($Perm.min
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) $Perm.Write $Perm.No)
      (pTaken@9@01 r))
    $Perm.No)
  
  :qid |quant-u-4|))))
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
    (and (Set_in (inv@7@01 r) xs@1@01) (img@8@01 r) (= r (inv@7@01 r)))
    (= (- $Perm.Write (pTaken@9@01 r)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@10@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01))
    (= ($FVF.lookup_f (as sm@10@01  $FVF<f>) r) ($FVF.lookup_f $t@3@01 r)))
  :pattern (($FVF.lookup_f (as sm@10@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@3@01 r))
  :qid |qp.fvfValDef0|)))
; [exec]
; exhale (forall w: Ref ::(w in xs) ==> acc(w.f, write))
(declare-const w@11@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (w in xs)
(assert (Set_in w@11@01 xs@1@01))
(pop) ; 3
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((w1@11@01 $Ref) (w2@11@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@11@01 xs@1@01)
      (Set_in w2@11@01 xs@1@01)
      (= w1@11@01 w2@11@01))
    (= w1@11@01 w2@11@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@11@01 $Ref)) (!
  (=>
    (Set_in w@11@01 xs@1@01)
    (and (= (inv@12@01 w@11@01) w@11@01) (img@13@01 w@11@01)))
  :pattern ((Set_in w@11@01 xs@1@01))
  :pattern ((inv@12@01 w@11@01))
  :pattern ((img@13@01 w@11@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@13@01 r) (Set_in (inv@12@01 r) xs@1@01)) (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |f-fctOfInv|)))
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
  (=>
    (and (Set_in (inv@12@01 r) xs@1@01) (img@13@01 r) (= r (inv@12@01 r)))
    false)
  
  :qid |quant-u-7|))))
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
(declare-const w@14@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (w in xs)
(assert (Set_in w@14@01 xs@1@01))
(pop) ; 3
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((w1@14@01 $Ref) (w2@14@01 $Ref)) (!
  (=>
    (and
      (Set_in w1@14@01 xs@1@01)
      (Set_in w2@14@01 xs@1@01)
      (= w1@14@01 w2@14@01))
    (= w1@14@01 w2@14@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((w@14@01 $Ref)) (!
  (=>
    (Set_in w@14@01 xs@1@01)
    (and (= (inv@15@01 w@14@01) w@14@01) (img@16@01 w@14@01)))
  :pattern ((Set_in w@14@01 xs@1@01))
  :pattern ((inv@15@01 w@14@01))
  :pattern ((img@16@01 w@14@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
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
  (=>
    (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r) (= r (inv@15@01 r)))
    false)
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t2 ----------
(declare-const zs@17@01 Set<$Ref>)
(declare-const ys@18@01 Set<$Ref>)
(declare-const zs@19@01 Set<$Ref>)
(declare-const ys@20@01 Set<$Ref>)
(push) ; 1
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(declare-const x@22@01 $Ref)
(push) ; 2
; [eval] (x in zs)
(assert (Set_in x@22@01 zs@19@01))
(pop) ; 2
(declare-fun inv@23@01 ($Ref) $Ref)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@22@01 $Ref) (x2@22@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@22@01 zs@19@01)
      (Set_in x2@22@01 zs@19@01)
      (= x1@22@01 x2@22@01))
    (= x1@22@01 x2@22@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@22@01 $Ref)) (!
  (=>
    (Set_in x@22@01 zs@19@01)
    (and (= (inv@23@01 x@22@01) x@22@01) (img@24@01 x@22@01)))
  :pattern ((Set_in x@22@01 zs@19@01))
  :pattern ((inv@23@01 x@22@01))
  :pattern ((img@24@01 x@22@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01)) (= (inv@23@01 r) r))
  :pattern ((inv@23@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@22@01 $Ref)) (!
  (=> (Set_in x@22@01 zs@19@01) (not (= x@22@01 $Ref.null)))
  :pattern ((Set_in x@22@01 zs@19@01))
  :pattern ((inv@23@01 x@22@01))
  :pattern ((img@24@01 x@22@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@21@01) $Snap.unit))
; [eval] (ys subset zs)
(assert (Set_subset ys@20@01 zs@19@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall u: Ref ::(u in ys) ==> acc(u.f, write))
(declare-const u@25@01 $Ref)
(push) ; 3
; [eval] (u in ys)
(assert (Set_in u@25@01 ys@20@01))
(pop) ; 3
(declare-fun inv@26@01 ($Ref) $Ref)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((u1@25@01 $Ref) (u2@25@01 $Ref)) (!
  (=>
    (and
      (Set_in u1@25@01 ys@20@01)
      (Set_in u2@25@01 ys@20@01)
      (= u1@25@01 u2@25@01))
    (= u1@25@01 u2@25@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((u@25@01 $Ref)) (!
  (=>
    (Set_in u@25@01 ys@20@01)
    (and (= (inv@26@01 u@25@01) u@25@01) (img@27@01 u@25@01)))
  :pattern ((Set_in u@25@01 ys@20@01))
  :pattern ((inv@26@01 u@25@01))
  :pattern ((img@27@01 u@25@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@27@01 r) (Set_in (inv@26@01 r) ys@20@01)) (= (inv@26@01 r) r))
  :pattern ((inv@26@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@28@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@26@01 r) ys@20@01) (img@27@01 r) (= r (inv@26@01 r)))
    ($Perm.min
      (ite
        (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
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
        (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
        $Perm.Write
        $Perm.No)
      (pTaken@28@01 r))
    $Perm.No)
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@28@01 r) $Perm.No)
  
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
    (and (Set_in (inv@26@01 r) ys@20@01) (img@27@01 r) (= r (inv@26@01 r)))
    (= (- $Perm.Write (pTaken@28@01 r)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@29@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
    (=
      ($FVF.lookup_f (as sm@29@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef1|)))
; [exec]
; exhale (forall q: Ref ::(q in zs) ==> acc(q.f, write))
(declare-const q@30@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (q in zs)
(assert (Set_in q@30@01 zs@19@01))
(pop) ; 3
(declare-fun inv@31@01 ($Ref) $Ref)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((q1@30@01 $Ref) (q2@30@01 $Ref)) (!
  (=>
    (and
      (Set_in q1@30@01 zs@19@01)
      (Set_in q2@30@01 zs@19@01)
      (= q1@30@01 q2@30@01))
    (= q1@30@01 q2@30@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((q@30@01 $Ref)) (!
  (=>
    (Set_in q@30@01 zs@19@01)
    (and (= (inv@31@01 q@30@01) q@30@01) (img@32@01 q@30@01)))
  :pattern ((Set_in q@30@01 zs@19@01))
  :pattern ((inv@31@01 q@30@01))
  :pattern ((img@32@01 q@30@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@32@01 r) (Set_in (inv@31@01 r) zs@19@01)) (= (inv@31@01 r) r))
  :pattern ((inv@31@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@31@01 r) zs@19@01) (img@32@01 r) (= r (inv@31@01 r)))
    ($Perm.min
      (ite
        (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
        (- $Perm.Write (pTaken@28@01 r))
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
        (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
        (- $Perm.Write (pTaken@28@01 r))
        $Perm.No)
      (pTaken@33@01 r))
    $Perm.No)
  
  :qid |quant-u-19|))))
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
    (and (Set_in (inv@31@01 r) zs@19@01) (img@32@01 r) (= r (inv@31@01 r)))
    (= (- $Perm.Write (pTaken@33@01 r)) $Perm.No))
  
  :qid |quant-u-20|))))
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
    (and (Set_in (inv@31@01 r) zs@19@01) (img@32@01 r) (= r (inv@31@01 r)))
    (= (- $Perm.Write (pTaken@33@01 r)) $Perm.No))
  
  :qid |quant-u-20|))))
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
(declare-const sm@34@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
      (< $Perm.No (- $Perm.Write (pTaken@28@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@34@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@21@01)) r)))
  :pattern (($FVF.lookup_f (as sm@34@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@21@01)) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@35@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@35@01  $FPM) r)
    (ite
      (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
      (- $Perm.Write (pTaken@28@01 r))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@35@01  $FPM) r) $Perm.Write)
  :pattern ((inv@23@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const q@36@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (q in zs)
(assert (Set_in q@36@01 zs@19@01))
(pop) ; 3
(declare-fun inv@37@01 ($Ref) $Ref)
(declare-fun img@38@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((q1@36@01 $Ref) (q2@36@01 $Ref)) (!
  (=>
    (and
      (Set_in q1@36@01 zs@19@01)
      (Set_in q2@36@01 zs@19@01)
      (= q1@36@01 q2@36@01))
    (= q1@36@01 q2@36@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((q@36@01 $Ref)) (!
  (=>
    (Set_in q@36@01 zs@19@01)
    (and (= (inv@37@01 q@36@01) q@36@01) (img@38@01 q@36@01)))
  :pattern ((Set_in q@36@01 zs@19@01))
  :pattern ((inv@37@01 q@36@01))
  :pattern ((img@38@01 q@36@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@38@01 r) (Set_in (inv@37@01 r) zs@19@01)) (= (inv@37@01 r) r))
  :pattern ((inv@37@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@39@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@37@01 r) zs@19@01) (img@38@01 r) (= r (inv@37@01 r)))
    ($Perm.min
      (ite
        (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
        (- $Perm.Write (pTaken@28@01 r))
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
        (and (img@24@01 r) (Set_in (inv@23@01 r) zs@19@01))
        (- $Perm.Write (pTaken@28@01 r))
        $Perm.No)
      (pTaken@39@01 r))
    $Perm.No)
  
  :qid |quant-u-23|))))
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
    (and (Set_in (inv@37@01 r) zs@19@01) (img@38@01 r) (= r (inv@37@01 r)))
    (= (- $Perm.Write (pTaken@39@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
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
    (and (Set_in (inv@37@01 r) zs@19@01) (img@38@01 r) (= r (inv@37@01 r)))
    (= (- $Perm.Write (pTaken@39@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t3 ----------
(declare-const xs@40@01 Set<$Ref>)
(declare-const ys@41@01 Set<$Ref>)
(declare-const zs@42@01 Set<$Ref>)
(declare-const xs@43@01 Set<$Ref>)
(declare-const ys@44@01 Set<$Ref>)
(declare-const zs@45@01 Set<$Ref>)
(push) ; 1
(declare-const $t@46@01 $Snap)
(assert (= $t@46@01 ($Snap.combine ($Snap.first $t@46@01) ($Snap.second $t@46@01))))
(declare-const x@47@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@47@01 xs@43@01))
(pop) ; 2
(declare-fun inv@48@01 ($Ref) $Ref)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@47@01 $Ref) (x2@47@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@47@01 xs@43@01)
      (Set_in x2@47@01 xs@43@01)
      (= x1@47@01 x2@47@01))
    (= x1@47@01 x2@47@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@47@01 $Ref)) (!
  (=>
    (Set_in x@47@01 xs@43@01)
    (and (= (inv@48@01 x@47@01) x@47@01) (img@49@01 x@47@01)))
  :pattern ((Set_in x@47@01 xs@43@01))
  :pattern ((inv@48@01 x@47@01))
  :pattern ((img@49@01 x@47@01))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01)) (= (inv@48@01 r) r))
  :pattern ((inv@48@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@47@01 $Ref)) (!
  (=> (Set_in x@47@01 xs@43@01) (not (= x@47@01 $Ref.null)))
  :pattern ((Set_in x@47@01 xs@43@01))
  :pattern ((inv@48@01 x@47@01))
  :pattern ((img@49@01 x@47@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@46@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@46@01))
    ($Snap.second ($Snap.second $t@46@01)))))
(declare-const y@50@01 $Ref)
(push) ; 2
; [eval] (y in ys)
(assert (Set_in y@50@01 ys@44@01))
(pop) ; 2
(declare-fun inv@51@01 ($Ref) $Ref)
(declare-fun img@52@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y1@50@01 $Ref) (y2@50@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@50@01 ys@44@01)
      (Set_in y2@50@01 ys@44@01)
      (= y1@50@01 y2@50@01))
    (= y1@50@01 y2@50@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@50@01 $Ref)) (!
  (=>
    (Set_in y@50@01 ys@44@01)
    (and (= (inv@51@01 y@50@01) y@50@01) (img@52@01 y@50@01)))
  :pattern ((Set_in y@50@01 ys@44@01))
  :pattern ((inv@51@01 y@50@01))
  :pattern ((img@52@01 y@50@01))
  :qid |quant-u-28|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01)) (= (inv@51@01 r) r))
  :pattern ((inv@51@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@50@01 $Ref)) (!
  (=> (Set_in y@50@01 ys@44@01) (not (= y@50@01 $Ref.null)))
  :pattern ((Set_in y@50@01 ys@44@01))
  :pattern ((inv@51@01 y@50@01))
  :pattern ((img@52@01 y@50@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= y@50@01 x@47@01)
    (=
      (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
      (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))))
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@46@01)) $Snap.unit))
; [eval] (zs subset (xs union ys))
; [eval] (xs union ys)
(assert (Set_subset zs@45@01 (Set_union xs@43@01 ys@44@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall z: Ref ::(z in zs) ==> acc(z.f, write))
(declare-const z@53@01 $Ref)
(push) ; 3
; [eval] (z in zs)
(assert (Set_in z@53@01 zs@45@01))
(pop) ; 3
(declare-fun inv@54@01 ($Ref) $Ref)
(declare-fun img@55@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@53@01 $Ref) (z2@53@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@53@01 zs@45@01)
      (Set_in z2@53@01 zs@45@01)
      (= z1@53@01 z2@53@01))
    (= z1@53@01 z2@53@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@53@01 $Ref)) (!
  (=>
    (Set_in z@53@01 zs@45@01)
    (and (= (inv@54@01 z@53@01) z@53@01) (img@55@01 z@53@01)))
  :pattern ((Set_in z@53@01 zs@45@01))
  :pattern ((inv@54@01 z@53@01))
  :pattern ((img@55@01 z@53@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@55@01 r) (Set_in (inv@54@01 r) zs@45@01)) (= (inv@54@01 r) r))
  :pattern ((inv@54@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@54@01 r) zs@45@01) (img@55@01 r) (= r (inv@54@01 r)))
    ($Perm.min
      (ite
        (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@57@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@54@01 r) zs@45@01) (img@55@01 r) (= r (inv@54@01 r)))
    ($Perm.min
      (ite
        (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@56@01 r)))
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
        (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
        $Perm.Write
        $Perm.No)
      (pTaken@56@01 r))
    $Perm.No)
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@56@01 r) $Perm.No)
  
  :qid |quant-u-33|))))
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
    (and (Set_in (inv@54@01 r) zs@45@01) (img@55@01 r) (= r (inv@54@01 r)))
    (= (- $Perm.Write (pTaken@56@01 r)) $Perm.No))
  
  :qid |quant-u-34|))))
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
        (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
        $Perm.Write
        $Perm.No)
      (pTaken@57@01 r))
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
  (= (pTaken@57@01 r) $Perm.No)
  
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
  (=>
    (and (Set_in (inv@54@01 r) zs@45@01) (img@55@01 r) (= r (inv@54@01 r)))
    (= (- (- $Perm.Write (pTaken@56@01 r)) (pTaken@57@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@58@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
    (=
      ($FVF.lookup_f (as sm@58@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@46@01)) r)))
  :pattern (($FVF.lookup_f (as sm@58@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@46@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
    (=
      ($FVF.lookup_f (as sm@58@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@46@01))) r)))
  :pattern (($FVF.lookup_f (as sm@58@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@46@01))) r))
  :qid |qp.fvfValDef5|)))
; [exec]
; exhale (forall a: Ref ::(a in ys) ==> acc(a.f, write))
(declare-const a@59@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (a in ys)
(assert (Set_in a@59@01 ys@44@01))
(pop) ; 3
(declare-fun inv@60@01 ($Ref) $Ref)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@59@01 $Ref) (a2@59@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@59@01 ys@44@01)
      (Set_in a2@59@01 ys@44@01)
      (= a1@59@01 a2@59@01))
    (= a1@59@01 a2@59@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@59@01 $Ref)) (!
  (=>
    (Set_in a@59@01 ys@44@01)
    (and (= (inv@60@01 a@59@01) a@59@01) (img@61@01 a@59@01)))
  :pattern ((Set_in a@59@01 ys@44@01))
  :pattern ((inv@60@01 a@59@01))
  :pattern ((img@61@01 a@59@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@61@01 r) (Set_in (inv@60@01 r) ys@44@01)) (= (inv@60@01 r) r))
  :pattern ((inv@60@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@60@01 r) ys@44@01) (img@61@01 r) (= r (inv@60@01 r)))
    ($Perm.min
      (ite
        (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
        (- $Perm.Write (pTaken@57@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@60@01 r) ys@44@01) (img@61@01 r) (= r (inv@60@01 r)))
    ($Perm.min
      (ite
        (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
        (- $Perm.Write (pTaken@56@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@62@01 r)))
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
        (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
        (- $Perm.Write (pTaken@57@01 r))
        $Perm.No)
      (pTaken@62@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
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
    (and (Set_in (inv@60@01 r) ys@44@01) (img@61@01 r) (= r (inv@60@01 r)))
    (= (- $Perm.Write (pTaken@62@01 r)) $Perm.No))
  
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
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
        (- $Perm.Write (pTaken@56@01 r))
        $Perm.No)
      (pTaken@63@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@63@01 r) $Perm.No)
  
  :qid |quant-u-43|))))
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
    (and (Set_in (inv@60@01 r) ys@44@01) (img@61@01 r) (= r (inv@60@01 r)))
    (= (- (- $Perm.Write (pTaken@62@01 r)) (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-44|))))
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
    (and (Set_in (inv@60@01 r) ys@44@01) (img@61@01 r) (= r (inv@60@01 r)))
    (= (- (- $Perm.Write (pTaken@62@01 r)) (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-44|))))
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
(assert (not (forall ((r $Ref)) (!
  (and
    (= y@50@01 x@47@01)
    (=
      (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
      (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@64@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
      (< $Perm.No (- $Perm.Write (pTaken@57@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@64@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@46@01))) r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@46@01))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
      (< $Perm.No (- $Perm.Write (pTaken@56@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@64@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@46@01)) r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@46@01)) r))
  :qid |qp.fvfValDef7|)))
(declare-const pm@65@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@65@01  $FPM) r)
    (+
      (ite
        (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
        (- $Perm.Write (pTaken@57@01 r))
        $Perm.No)
      (ite
        (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
        (- $Perm.Write (pTaken@56@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@65@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@65@01  $FPM) r) $Perm.Write)
  :pattern ((inv@51@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@65@01  $FPM) r) $Perm.Write)
  :pattern ((inv@48@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const a@66@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (a in ys)
(assert (Set_in a@66@01 ys@44@01))
(pop) ; 3
(declare-fun inv@67@01 ($Ref) $Ref)
(declare-fun img@68@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@66@01 $Ref) (a2@66@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@66@01 ys@44@01)
      (Set_in a2@66@01 ys@44@01)
      (= a1@66@01 a2@66@01))
    (= a1@66@01 a2@66@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@66@01 $Ref)) (!
  (=>
    (Set_in a@66@01 ys@44@01)
    (and (= (inv@67@01 a@66@01) a@66@01) (img@68@01 a@66@01)))
  :pattern ((Set_in a@66@01 ys@44@01))
  :pattern ((inv@67@01 a@66@01))
  :pattern ((img@68@01 a@66@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@68@01 r) (Set_in (inv@67@01 r) ys@44@01)) (= (inv@67@01 r) r))
  :pattern ((inv@67@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@67@01 r) ys@44@01) (img@68@01 r) (= r (inv@67@01 r)))
    ($Perm.min
      (ite
        (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
        (- $Perm.Write (pTaken@56@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@70@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@67@01 r) ys@44@01) (img@68@01 r) (= r (inv@67@01 r)))
    ($Perm.min
      (ite
        (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
        (- $Perm.Write (pTaken@57@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@69@01 r)))
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
        (and (img@49@01 r) (Set_in (inv@48@01 r) xs@43@01))
        (- $Perm.Write (pTaken@56@01 r))
        $Perm.No)
      (pTaken@69@01 r))
    $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@69@01 r) $Perm.No)
  
  :qid |quant-u-49|))))
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
    (and (Set_in (inv@67@01 r) ys@44@01) (img@68@01 r) (= r (inv@67@01 r)))
    (= (- $Perm.Write (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-50|))))
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
        (and (img@52@01 r) (Set_in (inv@51@01 r) ys@44@01))
        (- $Perm.Write (pTaken@57@01 r))
        $Perm.No)
      (pTaken@70@01 r))
    $Perm.No)
  
  :qid |quant-u-51|))))
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
    (and (Set_in (inv@67@01 r) ys@44@01) (img@68@01 r) (= r (inv@67@01 r)))
    (= (- (- $Perm.Write (pTaken@69@01 r)) (pTaken@70@01 r)) $Perm.No))
  
  :qid |quant-u-52|))))
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
    (and (Set_in (inv@67@01 r) ys@44@01) (img@68@01 r) (= r (inv@67@01 r)))
    (= (- (- $Perm.Write (pTaken@69@01 r)) (pTaken@70@01 r)) $Perm.No))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t4 ----------
(declare-const xs@71@01 Set<$Ref>)
(declare-const ys@72@01 Set<$Ref>)
(declare-const zs@73@01 Set<$Ref>)
(declare-const xs@74@01 Set<$Ref>)
(declare-const ys@75@01 Set<$Ref>)
(declare-const zs@76@01 Set<$Ref>)
(push) ; 1
(declare-const $t@77@01 $Snap)
(assert (= $t@77@01 ($Snap.combine ($Snap.first $t@77@01) ($Snap.second $t@77@01))))
(declare-const x@78@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@78@01 xs@74@01))
(pop) ; 2
(declare-fun inv@79@01 ($Ref) $Ref)
(declare-fun img@80@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@78@01 $Ref) (x2@78@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@78@01 xs@74@01)
      (Set_in x2@78@01 xs@74@01)
      (= x1@78@01 x2@78@01))
    (= x1@78@01 x2@78@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@78@01 $Ref)) (!
  (=>
    (Set_in x@78@01 xs@74@01)
    (and (= (inv@79@01 x@78@01) x@78@01) (img@80@01 x@78@01)))
  :pattern ((Set_in x@78@01 xs@74@01))
  :pattern ((inv@79@01 x@78@01))
  :pattern ((img@80@01 x@78@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01)) (= (inv@79@01 r) r))
  :pattern ((inv@79@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@78@01 $Ref)) (!
  (=> (Set_in x@78@01 xs@74@01) (not (= x@78@01 $Ref.null)))
  :pattern ((Set_in x@78@01 xs@74@01))
  :pattern ((inv@79@01 x@78@01))
  :pattern ((img@80@01 x@78@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@77@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@77@01))
    ($Snap.second ($Snap.second $t@77@01)))))
(declare-const y@81@01 $Ref)
(push) ; 2
; [eval] (y in ys)
(assert (Set_in y@81@01 ys@75@01))
(pop) ; 2
(declare-fun inv@82@01 ($Ref) $Ref)
(declare-fun img@83@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y1@81@01 $Ref) (y2@81@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@81@01 ys@75@01)
      (Set_in y2@81@01 ys@75@01)
      (= y1@81@01 y2@81@01))
    (= y1@81@01 y2@81@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@81@01 $Ref)) (!
  (=>
    (Set_in y@81@01 ys@75@01)
    (and (= (inv@82@01 y@81@01) y@81@01) (img@83@01 y@81@01)))
  :pattern ((Set_in y@81@01 ys@75@01))
  :pattern ((inv@82@01 y@81@01))
  :pattern ((img@83@01 y@81@01))
  :qid |quant-u-56|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01)) (= (inv@82@01 r) r))
  :pattern ((inv@82@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@81@01 $Ref)) (!
  (=> (Set_in y@81@01 ys@75@01) (not (= y@81@01 $Ref.null)))
  :pattern ((Set_in y@81@01 ys@75@01))
  :pattern ((inv@82@01 y@81@01))
  :pattern ((img@83@01 y@81@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= y@81@01 x@78@01)
    (=
      (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
      (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))))
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@77@01)) $Snap.unit))
; [eval] (zs subset (xs union ys))
; [eval] (xs union ys)
(assert (Set_subset zs@76@01 (Set_union xs@74@01 ys@75@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall z: Ref ::(z in zs) ==> acc(z.f, write))
(declare-const z@84@01 $Ref)
(push) ; 3
; [eval] (z in zs)
(assert (Set_in z@84@01 zs@76@01))
(pop) ; 3
(declare-fun inv@85@01 ($Ref) $Ref)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@84@01 $Ref) (z2@84@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@84@01 zs@76@01)
      (Set_in z2@84@01 zs@76@01)
      (= z1@84@01 z2@84@01))
    (= z1@84@01 z2@84@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@84@01 $Ref)) (!
  (=>
    (Set_in z@84@01 zs@76@01)
    (and (= (inv@85@01 z@84@01) z@84@01) (img@86@01 z@84@01)))
  :pattern ((Set_in z@84@01 zs@76@01))
  :pattern ((inv@85@01 z@84@01))
  :pattern ((img@86@01 z@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@86@01 r) (Set_in (inv@85@01 r) zs@76@01)) (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@87@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@85@01 r) zs@76@01) (img@86@01 r) (= r (inv@85@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@88@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@85@01 r) zs@76@01) (img@86@01 r) (= r (inv@85@01 r)))
    ($Perm.min
      (ite
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@87@01 r)))
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
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        $Perm.Write
        $Perm.No)
      (pTaken@87@01 r))
    $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@87@01 r) $Perm.No)
  
  :qid |quant-u-61|))))
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
    (and (Set_in (inv@85@01 r) zs@76@01) (img@86@01 r) (= r (inv@85@01 r)))
    (= (- $Perm.Write (pTaken@87@01 r)) $Perm.No))
  
  :qid |quant-u-62|))))
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
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        $Perm.Write
        $Perm.No)
      (pTaken@88@01 r))
    $Perm.No)
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@88@01 r) $Perm.No)
  
  :qid |quant-u-64|))))
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
    (and (Set_in (inv@85@01 r) zs@76@01) (img@86@01 r) (= r (inv@85@01 r)))
    (= (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@88@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@89@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@77@01)) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@77@01)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@77@01))) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@77@01))) r))
  :qid |qp.fvfValDef10|)))
; [exec]
; exhale (forall b: Ref ::(b in (xs setminus zs)) ==> acc(b.f, write))
(declare-const b@90@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (b in (xs setminus zs))
; [eval] (xs setminus zs)
(assert (Set_in b@90@01 (Set_difference xs@74@01 zs@76@01)))
(pop) ; 3
(declare-fun inv@91@01 ($Ref) $Ref)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((b1@90@01 $Ref) (b2@90@01 $Ref)) (!
  (=>
    (and
      (Set_in b1@90@01 (Set_difference xs@74@01 zs@76@01))
      (Set_in b2@90@01 (Set_difference xs@74@01 zs@76@01))
      (= b1@90@01 b2@90@01))
    (= b1@90@01 b2@90@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((b@90@01 $Ref)) (!
  (=>
    (Set_in b@90@01 (Set_difference xs@74@01 zs@76@01))
    (and (= (inv@91@01 b@90@01) b@90@01) (img@92@01 b@90@01)))
  :pattern ((Set_in b@90@01 (Set_difference xs@74@01 zs@76@01)))
  :pattern ((inv@91@01 b@90@01))
  :pattern ((img@92@01 b@90@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@92@01 r) (Set_in (inv@91@01 r) (Set_difference xs@74@01 zs@76@01)))
    (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@91@01 r) (Set_difference xs@74@01 zs@76@01))
      (img@92@01 r)
      (= r (inv@91@01 r)))
    ($Perm.min
      (ite
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        (- $Perm.Write (pTaken@88@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@94@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@91@01 r) (Set_difference xs@74@01 zs@76@01))
      (img@92@01 r)
      (= r (inv@91@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        (- $Perm.Write (pTaken@87@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@93@01 r)))
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
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        (- $Perm.Write (pTaken@88@01 r))
        $Perm.No)
      (pTaken@93@01 r))
    $Perm.No)
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@93@01 r) $Perm.No)
  
  :qid |quant-u-69|))))
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
      (Set_in (inv@91@01 r) (Set_difference xs@74@01 zs@76@01))
      (img@92@01 r)
      (= r (inv@91@01 r)))
    (= (- $Perm.Write (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-70|))))
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
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        (- $Perm.Write (pTaken@87@01 r))
        $Perm.No)
      (pTaken@94@01 r))
    $Perm.No)
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@94@01 r) $Perm.No)
  
  :qid |quant-u-72|))))
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
      (Set_in (inv@91@01 r) (Set_difference xs@74@01 zs@76@01))
      (img@92@01 r)
      (= r (inv@91@01 r)))
    (= (- (- $Perm.Write (pTaken@93@01 r)) (pTaken@94@01 r)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@95@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
      (< $Perm.No (- $Perm.Write (pTaken@88@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@77@01))) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@77@01))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
      (< $Perm.No (- $Perm.Write (pTaken@87@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@95@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@77@01)) r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@77@01)) r))
  :qid |qp.fvfValDef12|)))
; [exec]
; exhale (forall c: Ref ::(c in (ys setminus xs)) ==> acc(c.f, write))
(declare-const c@96@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (c in (ys setminus xs))
; [eval] (ys setminus xs)
(assert (Set_in c@96@01 (Set_difference ys@75@01 xs@74@01)))
(pop) ; 3
(declare-fun inv@97@01 ($Ref) $Ref)
(declare-fun img@98@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((c1@96@01 $Ref) (c2@96@01 $Ref)) (!
  (=>
    (and
      (Set_in c1@96@01 (Set_difference ys@75@01 xs@74@01))
      (Set_in c2@96@01 (Set_difference ys@75@01 xs@74@01))
      (= c1@96@01 c2@96@01))
    (= c1@96@01 c2@96@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((c@96@01 $Ref)) (!
  (=>
    (Set_in c@96@01 (Set_difference ys@75@01 xs@74@01))
    (and (= (inv@97@01 c@96@01) c@96@01) (img@98@01 c@96@01)))
  :pattern ((Set_in c@96@01 (Set_difference ys@75@01 xs@74@01)))
  :pattern ((inv@97@01 c@96@01))
  :pattern ((img@98@01 c@96@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@98@01 r) (Set_in (inv@97@01 r) (Set_difference ys@75@01 xs@74@01)))
    (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@99@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@97@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@98@01 r)
      (= r (inv@97@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@94@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@100@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@97@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@98@01 r)
      (= r (inv@97@01 r)))
    ($Perm.min
      (ite
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        (- (- $Perm.Write (pTaken@88@01 r)) (pTaken@93@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@99@01 r)))
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
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@94@01 r))
        $Perm.No)
      (pTaken@99@01 r))
    $Perm.No)
  
  :qid |quant-u-76|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@99@01 r) $Perm.No)
  
  :qid |quant-u-77|))))
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
      (Set_in (inv@97@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@98@01 r)
      (= r (inv@97@01 r)))
    (= (- $Perm.Write (pTaken@99@01 r)) $Perm.No))
  
  :qid |quant-u-78|))))
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
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        (- (- $Perm.Write (pTaken@88@01 r)) (pTaken@93@01 r))
        $Perm.No)
      (pTaken@100@01 r))
    $Perm.No)
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@100@01 r) $Perm.No)
  
  :qid |quant-u-80|))))
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
      (Set_in (inv@97@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@98@01 r)
      (= r (inv@97@01 r)))
    (= (- (- $Perm.Write (pTaken@99@01 r)) (pTaken@100@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
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
    (and
      (Set_in (inv@97@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@98@01 r)
      (= r (inv@97@01 r)))
    (= (- (- $Perm.Write (pTaken@99@01 r)) (pTaken@100@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
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
(assert (not (forall ((r $Ref)) (!
  (and
    (= x@78@01 y@81@01)
    (=
      (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
      (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))))
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@101@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@94@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@77@01)) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@77@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
      (< $Perm.No (- (- $Perm.Write (pTaken@88@01 r)) (pTaken@93@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@77@01))) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@77@01))) r))
  :qid |qp.fvfValDef14|)))
(declare-const pm@102@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@102@01  $FPM) r)
    (+
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@94@01 r))
        $Perm.No)
      (ite
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        (- (- $Perm.Write (pTaken@88@01 r)) (pTaken@93@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@102@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@102@01  $FPM) r) $Perm.Write)
  :pattern ((inv@79@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@102@01  $FPM) r) $Perm.Write)
  :pattern ((inv@82@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const c@103@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (c in (ys setminus xs))
; [eval] (ys setminus xs)
(assert (Set_in c@103@01 (Set_difference ys@75@01 xs@74@01)))
(pop) ; 3
(declare-fun inv@104@01 ($Ref) $Ref)
(declare-fun img@105@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((c1@103@01 $Ref) (c2@103@01 $Ref)) (!
  (=>
    (and
      (Set_in c1@103@01 (Set_difference ys@75@01 xs@74@01))
      (Set_in c2@103@01 (Set_difference ys@75@01 xs@74@01))
      (= c1@103@01 c2@103@01))
    (= c1@103@01 c2@103@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((c@103@01 $Ref)) (!
  (=>
    (Set_in c@103@01 (Set_difference ys@75@01 xs@74@01))
    (and (= (inv@104@01 c@103@01) c@103@01) (img@105@01 c@103@01)))
  :pattern ((Set_in c@103@01 (Set_difference ys@75@01 xs@74@01)))
  :pattern ((inv@104@01 c@103@01))
  :pattern ((img@105@01 c@103@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@105@01 r)
      (Set_in (inv@104@01 r) (Set_difference ys@75@01 xs@74@01)))
    (= (inv@104@01 r) r))
  :pattern ((inv@104@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@106@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@104@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@105@01 r)
      (= r (inv@104@01 r)))
    ($Perm.min
      (ite
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        (- (- $Perm.Write (pTaken@88@01 r)) (pTaken@93@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@107@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@104@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@105@01 r)
      (= r (inv@104@01 r)))
    ($Perm.min
      (ite
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@94@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@106@01 r)))
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
        (and (img@83@01 r) (Set_in (inv@82@01 r) ys@75@01))
        (- (- $Perm.Write (pTaken@88@01 r)) (pTaken@93@01 r))
        $Perm.No)
      (pTaken@106@01 r))
    $Perm.No)
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@106@01 r) $Perm.No)
  
  :qid |quant-u-86|))))
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
      (Set_in (inv@104@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@105@01 r)
      (= r (inv@104@01 r)))
    (= (- $Perm.Write (pTaken@106@01 r)) $Perm.No))
  
  :qid |quant-u-87|))))
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
        (and (img@80@01 r) (Set_in (inv@79@01 r) xs@74@01))
        (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@94@01 r))
        $Perm.No)
      (pTaken@107@01 r))
    $Perm.No)
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@107@01 r) $Perm.No)
  
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
    (and
      (Set_in (inv@104@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@105@01 r)
      (= r (inv@104@01 r)))
    (= (- (- $Perm.Write (pTaken@106@01 r)) (pTaken@107@01 r)) $Perm.No))
  
  :qid |quant-u-90|))))
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
    (and
      (Set_in (inv@104@01 r) (Set_difference ys@75@01 xs@74@01))
      (img@105@01 r)
      (= r (inv@104@01 r)))
    (= (- (- $Perm.Write (pTaken@106@01 r)) (pTaken@107@01 r)) $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
; ---------- t5 ----------
(declare-const xs@108@01 Set<$Ref>)
(declare-const ys@109@01 Set<$Ref>)
(declare-const xs@110@01 Set<$Ref>)
(declare-const ys@111@01 Set<$Ref>)
(push) ; 1
(declare-const $t@112@01 $Snap)
(assert (= $t@112@01 ($Snap.combine ($Snap.first $t@112@01) ($Snap.second $t@112@01))))
(declare-const x@113@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@113@01 xs@110@01))
(pop) ; 2
(declare-fun inv@114@01 ($Ref) $Ref)
(declare-fun img@115@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@113@01 $Ref) (x2@113@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@113@01 xs@110@01)
      (Set_in x2@113@01 xs@110@01)
      (= x1@113@01 x2@113@01))
    (= x1@113@01 x2@113@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@113@01 $Ref)) (!
  (=>
    (Set_in x@113@01 xs@110@01)
    (and (= (inv@114@01 x@113@01) x@113@01) (img@115@01 x@113@01)))
  :pattern ((Set_in x@113@01 xs@110@01))
  :pattern ((inv@114@01 x@113@01))
  :pattern ((img@115@01 x@113@01))
  :qid |quant-u-92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@115@01 r) (Set_in (inv@114@01 r) xs@110@01))
    (= (inv@114@01 r) r))
  :pattern ((inv@114@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@113@01 $Ref)) (!
  (=> (Set_in x@113@01 xs@110@01) (not (= x@113@01 $Ref.null)))
  :pattern ((Set_in x@113@01 xs@110@01))
  :pattern ((inv@114@01 x@113@01))
  :pattern ((img@115@01 x@113@01))
  :qid |f-permImpliesNonNull|)))
(declare-const y@116@01 $Ref)
(push) ; 2
; [eval] (y in ys)
(assert (Set_in y@116@01 ys@111@01))
(pop) ; 2
(declare-fun inv@117@01 ($Ref) $Ref)
(declare-fun img@118@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y1@116@01 $Ref) (y2@116@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@116@01 ys@111@01)
      (Set_in y2@116@01 ys@111@01)
      (= y1@116@01 y2@116@01))
    (= y1@116@01 y2@116@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@116@01 $Ref)) (!
  (=>
    (Set_in y@116@01 ys@111@01)
    (and (= (inv@117@01 y@116@01) y@116@01) (img@118@01 y@116@01)))
  :pattern ((Set_in y@116@01 ys@111@01))
  :pattern ((inv@117@01 y@116@01))
  :pattern ((img@118@01 y@116@01))
  :qid |quant-u-94|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
    (= (inv@117@01 r) r))
  :pattern ((inv@117@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@116@01 $Ref)) (!
  (=> (Set_in y@116@01 ys@111@01) (not (= y@116@01 $Ref.null)))
  :pattern ((Set_in y@116@01 ys@111@01))
  :pattern ((inv@117@01 y@116@01))
  :pattern ((img@118@01 y@116@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= y@116@01 x@113@01)
    (=
      (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
      (and (img@115@01 r) (Set_in (inv@114@01 r) xs@110@01))))
  
  :qid |quant-u-95|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall z: Ref ::(z in (xs intersection ys)) ==> acc(z.f, write))
(declare-const z@119@01 $Ref)
(push) ; 3
; [eval] (z in (xs intersection ys))
; [eval] (xs intersection ys)
(assert (Set_in z@119@01 (Set_intersection xs@110@01 ys@111@01)))
(pop) ; 3
(declare-fun inv@120@01 ($Ref) $Ref)
(declare-fun img@121@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@119@01 $Ref) (z2@119@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@119@01 (Set_intersection xs@110@01 ys@111@01))
      (Set_in z2@119@01 (Set_intersection xs@110@01 ys@111@01))
      (= z1@119@01 z2@119@01))
    (= z1@119@01 z2@119@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@119@01 $Ref)) (!
  (=>
    (Set_in z@119@01 (Set_intersection xs@110@01 ys@111@01))
    (and (= (inv@120@01 z@119@01) z@119@01) (img@121@01 z@119@01)))
  :pattern ((Set_in z@119@01 (Set_intersection xs@110@01 ys@111@01)))
  :pattern ((inv@120@01 z@119@01))
  :pattern ((img@121@01 z@119@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@121@01 r)
      (Set_in (inv@120@01 r) (Set_intersection xs@110@01 ys@111@01)))
    (= (inv@120@01 r) r))
  :pattern ((inv@120@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@120@01 r) (Set_intersection xs@110@01 ys@111@01))
      (img@121@01 r)
      (= r (inv@120@01 r)))
    ($Perm.min
      (ite
        (and (img@115@01 r) (Set_in (inv@114@01 r) xs@110@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@120@01 r) (Set_intersection xs@110@01 ys@111@01))
      (img@121@01 r)
      (= r (inv@120@01 r)))
    ($Perm.min
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@122@01 r)))
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
        (and (img@115@01 r) (Set_in (inv@114@01 r) xs@110@01))
        $Perm.Write
        $Perm.No)
      (pTaken@122@01 r))
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
  (= (pTaken@122@01 r) $Perm.No)
  
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
  (=>
    (and
      (Set_in (inv@120@01 r) (Set_intersection xs@110@01 ys@111@01))
      (img@121@01 r)
      (= r (inv@120@01 r)))
    (= (- $Perm.Write (pTaken@122@01 r)) $Perm.No))
  
  :qid |quant-u-100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@124@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@115@01 r) (Set_in (inv@114@01 r) xs@110@01))
    (=
      ($FVF.lookup_f (as sm@124@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@112@01)) r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@112@01)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
    (=
      ($FVF.lookup_f (as sm@124@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@112@01)) r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@112@01)) r))
  :qid |qp.fvfValDef17|)))
; [exec]
; exhale (forall a: Ref ::(a in (xs setminus (xs intersection ys))) ==>
;     acc(a.f, write))
(declare-const a@125@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (a in (xs setminus (xs intersection ys)))
; [eval] (xs setminus (xs intersection ys))
; [eval] (xs intersection ys)
(assert (Set_in a@125@01 (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01))))
(pop) ; 3
(declare-fun inv@126@01 ($Ref) $Ref)
(declare-fun img@127@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((a1@125@01 $Ref) (a2@125@01 $Ref)) (!
  (=>
    (and
      (Set_in a1@125@01 (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01)))
      (Set_in a2@125@01 (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01)))
      (= a1@125@01 a2@125@01))
    (= a1@125@01 a2@125@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((a@125@01 $Ref)) (!
  (=>
    (Set_in a@125@01 (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01)))
    (and (= (inv@126@01 a@125@01) a@125@01) (img@127@01 a@125@01)))
  :pattern ((Set_in a@125@01 (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01))))
  :pattern ((inv@126@01 a@125@01))
  :pattern ((img@127@01 a@125@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@127@01 r)
      (Set_in (inv@126@01 r) (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01))))
    (= (inv@126@01 r) r))
  :pattern ((inv@126@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@128@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@126@01 r) (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01)))
      (img@127@01 r)
      (= r (inv@126@01 r)))
    ($Perm.min
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@129@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@126@01 r) (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01)))
      (img@127@01 r)
      (= r (inv@126@01 r)))
    ($Perm.min
      (ite
        (and (img@115@01 r) (Set_in (inv@114@01 r) xs@110@01))
        (- $Perm.Write (pTaken@122@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@128@01 r)))
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
        (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
        $Perm.Write
        $Perm.No)
      (pTaken@128@01 r))
    $Perm.No)
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@128@01 r) $Perm.No)
  
  :qid |quant-u-104|))))
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
      (Set_in (inv@126@01 r) (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01)))
      (img@127@01 r)
      (= r (inv@126@01 r)))
    (= (- $Perm.Write (pTaken@128@01 r)) $Perm.No))
  
  :qid |quant-u-105|))))
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
        (and (img@115@01 r) (Set_in (inv@114@01 r) xs@110@01))
        (- $Perm.Write (pTaken@122@01 r))
        $Perm.No)
      (pTaken@129@01 r))
    $Perm.No)
  
  :qid |quant-u-106|))))
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
      (Set_in (inv@126@01 r) (Set_difference xs@110@01 (Set_intersection xs@110@01 ys@111@01)))
      (img@127@01 r)
      (= r (inv@126@01 r)))
    (= (- (- $Perm.Write (pTaken@128@01 r)) (pTaken@129@01 r)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@130@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
    (=
      ($FVF.lookup_f (as sm@130@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@112@01)) r)))
  :pattern (($FVF.lookup_f (as sm@130@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@112@01)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@115@01 r) (Set_in (inv@114@01 r) xs@110@01))
      (< $Perm.No (- $Perm.Write (pTaken@122@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@130@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@112@01)) r)))
  :pattern (($FVF.lookup_f (as sm@130@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@112@01)) r))
  :qid |qp.fvfValDef19|)))
; [exec]
; exhale (forall b: Ref ::(b in (ys setminus (ys intersection xs))) ==>
;     acc(b.f, write))
(declare-const b@131@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (b in (ys setminus (ys intersection xs)))
; [eval] (ys setminus (ys intersection xs))
; [eval] (ys intersection xs)
(assert (Set_in b@131@01 (Set_difference ys@111@01 (Set_intersection ys@111@01 xs@110@01))))
(pop) ; 3
(declare-fun inv@132@01 ($Ref) $Ref)
(declare-fun img@133@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((b1@131@01 $Ref) (b2@131@01 $Ref)) (!
  (=>
    (and
      (Set_in b1@131@01 (Set_difference ys@111@01 (Set_intersection ys@111@01 xs@110@01)))
      (Set_in b2@131@01 (Set_difference ys@111@01 (Set_intersection ys@111@01 xs@110@01)))
      (= b1@131@01 b2@131@01))
    (= b1@131@01 b2@131@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((b@131@01 $Ref)) (!
  (=>
    (Set_in b@131@01 (Set_difference ys@111@01 (Set_intersection ys@111@01 xs@110@01)))
    (and (= (inv@132@01 b@131@01) b@131@01) (img@133@01 b@131@01)))
  :pattern ((Set_in b@131@01 (Set_difference ys@111@01 (Set_intersection ys@111@01 xs@110@01))))
  :pattern ((inv@132@01 b@131@01))
  :pattern ((img@133@01 b@131@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@133@01 r)
      (Set_in (inv@132@01 r) (Set_difference ys@111@01 (Set_intersection ys@111@01 xs@110@01))))
    (= (inv@132@01 r) r))
  :pattern ((inv@132@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@134@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@132@01 r) (Set_difference ys@111@01 (Set_intersection ys@111@01 xs@110@01)))
      (img@133@01 r)
      (= r (inv@132@01 r)))
    ($Perm.min
      (ite
        (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
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
        (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
        $Perm.Write
        $Perm.No)
      (pTaken@134@01 r))
    $Perm.No)
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@134@01 r) $Perm.No)
  
  :qid |quant-u-111|))))
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
      (Set_in (inv@132@01 r) (Set_difference ys@111@01 (Set_intersection ys@111@01 xs@110@01)))
      (img@133@01 r)
      (= r (inv@132@01 r)))
    (= (- $Perm.Write (pTaken@134@01 r)) $Perm.No))
  
  :qid |quant-u-112|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@135@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@118@01 r) (Set_in (inv@117@01 r) ys@111@01))
    (=
      ($FVF.lookup_f (as sm@135@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@112@01)) r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@112@01)) r))
  :qid |qp.fvfValDef20|)))
(pop) ; 2
(pop) ; 1
; ---------- t6 ----------
(declare-const xs@136@01 Set<$Ref>)
(declare-const ys@137@01 Set<$Ref>)
(declare-const xs@138@01 Set<$Ref>)
(declare-const ys@139@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@140@01 $Snap)
(assert (= $t@140@01 ($Snap.combine ($Snap.first $t@140@01) ($Snap.second $t@140@01))))
(declare-const x@141@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@141@01 xs@138@01))
(pop) ; 2
(declare-fun inv@142@01 ($Ref) $Ref)
(declare-fun img@143@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@141@01 $Ref) (x2@141@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@141@01 xs@138@01)
      (Set_in x2@141@01 xs@138@01)
      (= x1@141@01 x2@141@01))
    (= x1@141@01 x2@141@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@141@01 $Ref)) (!
  (=>
    (Set_in x@141@01 xs@138@01)
    (and (= (inv@142@01 x@141@01) x@141@01) (img@143@01 x@141@01)))
  :pattern ((Set_in x@141@01 xs@138@01))
  :pattern ((inv@142@01 x@141@01))
  :pattern ((img@143@01 x@141@01))
  :qid |quant-u-114|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@143@01 r) (Set_in (inv@142@01 r) xs@138@01))
    (= (inv@142@01 r) r))
  :pattern ((inv@142@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@141@01 $Ref)) (!
  (=> (Set_in x@141@01 xs@138@01) (not (= x@141@01 $Ref.null)))
  :pattern ((Set_in x@141@01 xs@138@01))
  :pattern ((inv@142@01 x@141@01))
  :pattern ((img@143@01 x@141@01))
  :qid |f-permImpliesNonNull|)))
(declare-const y@144@01 $Ref)
(push) ; 2
; [eval] (y in ys)
(assert (Set_in y@144@01 ys@139@01))
(pop) ; 2
(declare-fun inv@145@01 ($Ref) $Ref)
(declare-fun img@146@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((y1@144@01 $Ref) (y2@144@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@144@01 ys@139@01)
      (Set_in y2@144@01 ys@139@01)
      (= y1@144@01 y2@144@01))
    (= y1@144@01 y2@144@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@144@01 $Ref)) (!
  (=>
    (Set_in y@144@01 ys@139@01)
    (and (= (inv@145@01 y@144@01) y@144@01) (img@146@01 y@144@01)))
  :pattern ((Set_in y@144@01 ys@139@01))
  :pattern ((inv@145@01 y@144@01))
  :pattern ((img@146@01 y@144@01))
  :qid |quant-u-116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@146@01 r) (Set_in (inv@145@01 r) ys@139@01))
    (= (inv@145@01 r) r))
  :pattern ((inv@145@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@144@01 $Ref)) (!
  (=> (Set_in y@144@01 ys@139@01) (not (= y@144@01 $Ref.null)))
  :pattern ((Set_in y@144@01 ys@139@01))
  :pattern ((inv@145@01 y@144@01))
  :pattern ((img@146@01 y@144@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= y@144@01 x@141@01)
    (=
      (and (img@146@01 r) (Set_in (inv@145@01 r) ys@139@01))
      (and (img@143@01 r) (Set_in (inv@142@01 r) xs@138@01))))
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall z: Ref ::(z in (xs intersection ys)) ==> acc(z.f, write))
(declare-const z@147@01 $Ref)
(push) ; 3
; [eval] (z in (xs intersection ys))
; [eval] (xs intersection ys)
(assert (Set_in z@147@01 (Set_intersection xs@138@01 ys@139@01)))
(pop) ; 3
(declare-fun inv@148@01 ($Ref) $Ref)
(declare-fun img@149@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((z1@147@01 $Ref) (z2@147@01 $Ref)) (!
  (=>
    (and
      (Set_in z1@147@01 (Set_intersection xs@138@01 ys@139@01))
      (Set_in z2@147@01 (Set_intersection xs@138@01 ys@139@01))
      (= z1@147@01 z2@147@01))
    (= z1@147@01 z2@147@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((z@147@01 $Ref)) (!
  (=>
    (Set_in z@147@01 (Set_intersection xs@138@01 ys@139@01))
    (and (= (inv@148@01 z@147@01) z@147@01) (img@149@01 z@147@01)))
  :pattern ((Set_in z@147@01 (Set_intersection xs@138@01 ys@139@01)))
  :pattern ((inv@148@01 z@147@01))
  :pattern ((img@149@01 z@147@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@149@01 r)
      (Set_in (inv@148@01 r) (Set_intersection xs@138@01 ys@139@01)))
    (= (inv@148@01 r) r))
  :pattern ((inv@148@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@150@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@148@01 r) (Set_intersection xs@138@01 ys@139@01))
      (img@149@01 r)
      (= r (inv@148@01 r)))
    ($Perm.min
      (ite
        (and (img@143@01 r) (Set_in (inv@142@01 r) xs@138@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@151@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@148@01 r) (Set_intersection xs@138@01 ys@139@01))
      (img@149@01 r)
      (= r (inv@148@01 r)))
    ($Perm.min
      (ite
        (and (img@146@01 r) (Set_in (inv@145@01 r) ys@139@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@150@01 r)))
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
        (and (img@143@01 r) (Set_in (inv@142@01 r) xs@138@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@150@01 r))
    $Perm.No)
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@150@01 r) $Perm.No)
  
  :qid |quant-u-121|))))
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
      (Set_in (inv@148@01 r) (Set_intersection xs@138@01 ys@139@01))
      (img@149@01 r)
      (= r (inv@148@01 r)))
    (= (- $Perm.Write (pTaken@150@01 r)) $Perm.No))
  
  :qid |quant-u-122|))))
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
        (and (img@146@01 r) (Set_in (inv@145@01 r) ys@139@01))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@151@01 r))
    $Perm.No)
  
  :qid |quant-u-123|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@151@01 r) $Perm.No)
  
  :qid |quant-u-124|))))
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
      (Set_in (inv@148@01 r) (Set_intersection xs@138@01 ys@139@01))
      (img@149@01 r)
      (= r (inv@148@01 r)))
    (= (- (- $Perm.Write (pTaken@150@01 r)) (pTaken@151@01 r)) $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@152@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@143@01 r) (Set_in (inv@142@01 r) xs@138@01))
    (=
      ($FVF.lookup_f (as sm@152@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@140@01)) r)))
  :pattern (($FVF.lookup_f (as sm@152@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@140@01)) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@146@01 r) (Set_in (inv@145@01 r) ys@139@01))
    (=
      ($FVF.lookup_f (as sm@152@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@140@01)) r)))
  :pattern (($FVF.lookup_f (as sm@152@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@140@01)) r))
  :qid |qp.fvfValDef22|)))
(pop) ; 2
(pop) ; 1
; ---------- t7 ----------
(declare-const xs@153@01 Set<$Ref>)
(declare-const xs@154@01 Set<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const x@155@01 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@155@01 xs@154@01))
(pop) ; 2
(declare-const $t@156@01 $FVF<f>)
(declare-fun inv@157@01 ($Ref) $Ref)
(declare-fun img@158@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@155@01 $Ref) (x2@155@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@155@01 xs@154@01)
      (Set_in x2@155@01 xs@154@01)
      (= x1@155@01 x2@155@01))
    (= x1@155@01 x2@155@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@155@01 $Ref)) (!
  (=>
    (Set_in x@155@01 xs@154@01)
    (and (= (inv@157@01 x@155@01) x@155@01) (img@158@01 x@155@01)))
  :pattern ((Set_in x@155@01 xs@154@01))
  :pattern ((inv@157@01 x@155@01))
  :pattern ((img@158@01 x@155@01))
  :qid |quant-u-127|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@158@01 r) (Set_in (inv@157@01 r) xs@154@01))
    (= (inv@157@01 r) r))
  :pattern ((inv@157@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@155@01 $Ref)) (!
  (=> (Set_in x@155@01 xs@154@01) (not (= x@155@01 $Ref.null)))
  :pattern ((Set_in x@155@01 xs@154@01))
  :pattern ((inv@157@01 x@155@01))
  :pattern ((img@158@01 x@155@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const y@159@01 $Ref)
(push) ; 3
; [eval] (y in xs)
(assert (Set_in y@159@01 xs@154@01))
(pop) ; 3
(declare-const $t@160@01 $FVF<f>)
(declare-fun inv@161@01 ($Ref) $Ref)
(declare-fun img@162@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((y1@159@01 $Ref) (y2@159@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@159@01 xs@154@01)
      (Set_in y2@159@01 xs@154@01)
      (= y1@159@01 y2@159@01))
    (= y1@159@01 y2@159@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@159@01 $Ref)) (!
  (=>
    (Set_in y@159@01 xs@154@01)
    (and (= (inv@161@01 y@159@01) y@159@01) (img@162@01 y@159@01)))
  :pattern ((Set_in y@159@01 xs@154@01))
  :pattern ((inv@161@01 y@159@01))
  :pattern ((img@162@01 y@159@01))
  :qid |quant-u-129|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@162@01 r) (Set_in (inv@161@01 r) xs@154@01))
    (= (inv@161@01 r) r))
  :pattern ((inv@161@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((y@159@01 $Ref)) (!
  (=> (Set_in y@159@01 xs@154@01) (not (= y@159@01 $Ref.null)))
  :pattern ((Set_in y@159@01 xs@154@01))
  :pattern ((inv@161@01 y@159@01))
  :pattern ((img@162@01 y@159@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
(declare-const y@163@01 $Ref)
(push) ; 3
; [eval] (y in xs)
(assert (Set_in y@163@01 xs@154@01))
(pop) ; 3
(declare-fun inv@164@01 ($Ref) $Ref)
(declare-fun img@165@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((y1@163@01 $Ref) (y2@163@01 $Ref)) (!
  (=>
    (and
      (Set_in y1@163@01 xs@154@01)
      (Set_in y2@163@01 xs@154@01)
      (= y1@163@01 y2@163@01))
    (= y1@163@01 y2@163@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((y@163@01 $Ref)) (!
  (=>
    (Set_in y@163@01 xs@154@01)
    (and (= (inv@164@01 y@163@01) y@163@01) (img@165@01 y@163@01)))
  :pattern ((Set_in y@163@01 xs@154@01))
  :pattern ((inv@164@01 y@163@01))
  :pattern ((img@165@01 y@163@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@165@01 r) (Set_in (inv@164@01 r) xs@154@01))
    (= (inv@164@01 r) r))
  :pattern ((inv@164@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@166@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@164@01 r) xs@154@01) (img@165@01 r) (= r (inv@164@01 r)))
    ($Perm.min
      (ite
        (and (img@158@01 r) (Set_in (inv@157@01 r) xs@154@01))
        (/ (to_real 1) (to_real 3))
        $Perm.No)
      (/ (to_real 1) (to_real 3)))
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
        (and (img@158@01 r) (Set_in (inv@157@01 r) xs@154@01))
        (/ (to_real 1) (to_real 3))
        $Perm.No)
      (pTaken@166@01 r))
    $Perm.No)
  
  :qid |quant-u-132|))))
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
    (and (Set_in (inv@164@01 r) xs@154@01) (img@165@01 r) (= r (inv@164@01 r)))
    (= (- (/ (to_real 1) (to_real 3)) (pTaken@166@01 r)) $Perm.No))
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@167@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@158@01 r) (Set_in (inv@157@01 r) xs@154@01))
    (= ($FVF.lookup_f (as sm@167@01  $FVF<f>) r) ($FVF.lookup_f $t@156@01 r)))
  :pattern (($FVF.lookup_f (as sm@167@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@156@01 r))
  :qid |qp.fvfValDef23|)))
(pop) ; 2
(pop) ; 1
