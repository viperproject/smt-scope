(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:44:08
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersNested.vpr
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
(declare-sort $FVF<r> 0)
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
(declare-fun $SortWrappers.$FVF<r>To$Snap ($FVF<r>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<r> ($Snap) $FVF<r>)
(assert (forall ((x $FVF<r>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<r>($SortWrappers.$FVF<r>To$Snap x)))
    :pattern (($SortWrappers.$FVF<r>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<r>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<r>To$Snap($SortWrappers.$SnapTo$FVF<r> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<r> x))
    :qid |$Snap.$FVF<r>To$SnapTo$FVF<r>|
    )))
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
; /field_value_functions_declarations.smt2 [r: Ref]
(declare-fun $FVF.domain_r ($FVF<r>) Set<$Ref>)
(declare-fun $FVF.lookup_r ($FVF<r> $Ref) $Ref)
(declare-fun $FVF.after_r ($FVF<r> $FVF<r>) Bool)
(declare-fun $FVF.loc_r ($Ref $Ref) Bool)
(declare-fun $FVF.perm_r ($FPM $Ref) $Perm)
(declare-const $fvfTOP_r $FVF<r>)
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
; /field_value_functions_axioms.smt2 [r: Ref]
(assert (forall ((vs $FVF<r>) (ws $FVF<r>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_r vs) ($FVF.domain_r ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_r vs))
            (= ($FVF.lookup_r vs x) ($FVF.lookup_r ws x)))
          :pattern (($FVF.lookup_r vs x) ($FVF.lookup_r ws x))
          :qid |qp.$FVF<r>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<r>To$Snap vs)
              ($SortWrappers.$FVF<r>To$Snap ws)
              )
    :qid |qp.$FVF<r>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_r pm r))
    :pattern (($FVF.perm_r pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_r f r) true)
    :pattern (($FVF.loc_r f r)))))
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
; ---------- m1 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const xs@1@01 Set<$Ref>)
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
; var a: Ref
(declare-const a@2@01 $Ref)
; [exec]
; var v: Ref
(declare-const v@3@01 $Ref)
; [exec]
; inhale (forall x: Ref :: { x.r } (x in xs) ==> acc(x.r, write))
(declare-const x@4@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@4@01 xs@1@01))
(declare-const sm@5@01 $FVF<r>)
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@6@01 $FVF<r>)
(declare-fun inv@7@01 ($Ref) $Ref)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@4@01 $Ref) (x2@4@01 $Ref)) (!
  (=>
    (and (Set_in x1@4@01 xs@1@01) (Set_in x2@4@01 xs@1@01) (= x1@4@01 x2@4@01))
    (= x1@4@01 x2@4@01))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@4@01 $Ref)) (!
  (=>
    (Set_in x@4@01 xs@1@01)
    (and (= (inv@7@01 x@4@01) x@4@01) (img@8@01 x@4@01)))
  :pattern (($FVF.loc_r ($FVF.lookup_r $t@6@01 x@4@01) x@4@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01)) (= (inv@7@01 r) r))
  :pattern ((inv@7@01 r))
  :qid |r-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@4@01 $Ref)) (!
  (=> (Set_in x@4@01 xs@1@01) (not (= x@4@01 $Ref.null)))
  :pattern (($FVF.loc_r ($FVF.lookup_r $t@6@01 x@4@01) x@4@01))
  :qid |r-permImpliesNonNull|)))
(declare-const sm@9@01 $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@7@01 r) xs@1@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) r))
  :pattern ((inv@7@01 r))
  :qid |quant-u-2|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref ::
;     { x.r, y.r }
;     (x in xs) && ((y in xs) && x != y) ==> x.r != y.r)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { x.r, y.r } (x in xs) && ((y in xs) && x != y) ==> x.r != y.r)
(declare-const x@11@01 $Ref)
(declare-const y@12@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && ((y in xs) && x != y) ==> x.r != y.r
; [eval] (x in xs) && ((y in xs) && x != y)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 0 | !(x@11@01 in xs@1@01) | live]
; [else-branch: 0 | x@11@01 in xs@1@01 | live]
(push) ; 5
; [then-branch: 0 | !(x@11@01 in xs@1@01)]
(assert (not (Set_in x@11@01 xs@1@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | x@11@01 in xs@1@01]
(assert (Set_in x@11@01 xs@1@01))
; [eval] (y in xs)
(push) ; 6
; [then-branch: 1 | !(y@12@01 in xs@1@01) | live]
; [else-branch: 1 | y@12@01 in xs@1@01 | live]
(push) ; 7
; [then-branch: 1 | !(y@12@01 in xs@1@01)]
(assert (not (Set_in y@12@01 xs@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | y@12@01 in xs@1@01]
(assert (Set_in y@12@01 xs@1@01))
; [eval] x != y
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y@12@01 xs@1@01) (not (Set_in y@12@01 xs@1@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@11@01 xs@1@01)
  (and
    (Set_in x@11@01 xs@1@01)
    (or (Set_in y@12@01 xs@1@01) (not (Set_in y@12@01 xs@1@01))))))
(assert (or (Set_in x@11@01 xs@1@01) (not (Set_in x@11@01 xs@1@01))))
(push) ; 4
; [then-branch: 2 | x@11@01 in xs@1@01 && y@12@01 in xs@1@01 && x@11@01 != y@12@01 | live]
; [else-branch: 2 | !(x@11@01 in xs@1@01 && y@12@01 in xs@1@01 && x@11@01 != y@12@01) | live]
(push) ; 5
; [then-branch: 2 | x@11@01 in xs@1@01 && y@12@01 in xs@1@01 && x@11@01 != y@12@01]
(assert (and
  (Set_in x@11@01 xs@1@01)
  (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01)))))
; [eval] x.r != y.r
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@11@01) x@11@01))
(push) ; 6
(assert (not (and (img@8@01 x@11@01) (Set_in (inv@7@01 x@11@01) xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) y@12@01) y@12@01))
(push) ; 6
(assert (not (and (img@8@01 y@12@01) (Set_in (inv@7@01 y@12@01) xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(x@11@01 in xs@1@01 && y@12@01 in xs@1@01 && x@11@01 != y@12@01)]
(assert (not
  (and
    (Set_in x@11@01 xs@1@01)
    (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and
    (Set_in x@11@01 xs@1@01)
    (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01))))
  (and
    (Set_in x@11@01 xs@1@01)
    (Set_in y@12@01 xs@1@01)
    (not (= x@11@01 y@12@01))
    ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@11@01) x@11@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) y@12@01) y@12@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x@11@01 xs@1@01)
      (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01)))))
  (and
    (Set_in x@11@01 xs@1@01)
    (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01))))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@11@01 $Ref) (y@12@01 $Ref)) (!
  (and
    (=>
      (Set_in x@11@01 xs@1@01)
      (and
        (Set_in x@11@01 xs@1@01)
        (or (Set_in y@12@01 xs@1@01) (not (Set_in y@12@01 xs@1@01)))))
    (or (Set_in x@11@01 xs@1@01) (not (Set_in x@11@01 xs@1@01)))
    (=>
      (and
        (Set_in x@11@01 xs@1@01)
        (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01))))
      (and
        (Set_in x@11@01 xs@1@01)
        (Set_in y@12@01 xs@1@01)
        (not (= x@11@01 y@12@01))
        ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@11@01) x@11@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) y@12@01) y@12@01)))
    (or
      (not
        (and
          (Set_in x@11@01 xs@1@01)
          (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01)))))
      (and
        (Set_in x@11@01 xs@1@01)
        (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01))))))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@11@01) x@11@01) ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) y@12@01) y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersNested.vpr@11@12@11@91-aux|)))
(assert (forall ((x@11@01 $Ref) (y@12@01 $Ref)) (!
  (=>
    (and
      (Set_in x@11@01 xs@1@01)
      (and (Set_in y@12@01 xs@1@01) (not (= x@11@01 y@12@01))))
    (not
      (=
        ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@11@01)
        ($FVF.lookup_r (as sm@9@01  $FVF<r>) y@12@01))))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@11@01) x@11@01) ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) y@12@01) y@12@01))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersNested.vpr@11@12@11@91|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref :: { x.r.r } (x in xs) ==> acc(x.r.r, write))
(declare-const x@13@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@13@01 xs@1@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01) x@13@01))
(push) ; 4
(assert (not (and (img@8@01 x@13@01) (Set_in (inv@7@01 x@13@01) xs@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@14@01 $FVF<r>)
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
  :pattern (($FVF.lookup_r (as sm@9@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@13@01 $Ref)) (!
  (=>
    (Set_in x@13@01 xs@1@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01) x@13@01))
  :pattern (($FVF.loc_r ($FVF.lookup_r $t@14@01 x@13@01) x@13@01) ($FVF.loc_r ($FVF.lookup_r $t@14@01 ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01)) ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01)))
  :qid |r-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@13@01 $Ref) (x2@13@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@13@01 xs@1@01)
      (Set_in x2@13@01 xs@1@01)
      (=
        ($FVF.lookup_r (as sm@9@01  $FVF<r>) x1@13@01)
        ($FVF.lookup_r (as sm@9@01  $FVF<r>) x2@13@01)))
    (= x1@13@01 x2@13@01))
  
  :qid |r-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@13@01 $Ref)) (!
  (=>
    (Set_in x@13@01 xs@1@01)
    (and
      (= (inv@15@01 ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01)) x@13@01)
      (img@16@01 ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01))))
  :pattern (($FVF.loc_r ($FVF.lookup_r $t@14@01 x@13@01) x@13@01) ($FVF.loc_r ($FVF.lookup_r $t@14@01 ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01)) ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01)))
  :qid |quant-u-4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) (inv@15@01 r)) r))
  :pattern ((inv@15@01 r))
  :qid |r-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@13@01 $Ref)) (!
  (=>
    (Set_in x@13@01 xs@1@01)
    (not (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01) $Ref.null)))
  :pattern (($FVF.loc_r ($FVF.lookup_r $t@14@01 x@13@01) x@13@01) ($FVF.loc_r ($FVF.lookup_r $t@14@01 ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01)) ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01)))
  :qid |r-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= ($FVF.lookup_r (as sm@9@01  $FVF<r>) x@13@01) x@4@01)
    (=
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))))
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@17@01 $FVF<r>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@14@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@15@01 r) xs@1@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) r))
  :pattern ((inv@15@01 r))
  :qid |quant-u-6|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref :: { x.r.f } (x in xs) ==> acc(x.r.f, write))
(declare-const x@18@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@18@01 xs@1@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01) x@18@01))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 x@18@01) (Set_in (inv@7@01 x@18@01) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@16@01 x@18@01) (Set_in (inv@15@01 x@18@01) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const sm@19@01 $FVF<f>)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@20@01 $FVF<f>)
(declare-fun inv@21@01 ($Ref) $Ref)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@14@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@18@01 $Ref)) (!
  (=>
    (Set_in x@18@01 xs@1@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01) x@18@01))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01) x@18@01) ($FVF.loc_f ($FVF.lookup_f $t@20@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01)))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@18@01 $Ref) (x2@18@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@18@01 xs@1@01)
      (Set_in x2@18@01 xs@1@01)
      (=
        ($FVF.lookup_r (as sm@17@01  $FVF<r>) x1@18@01)
        ($FVF.lookup_r (as sm@17@01  $FVF<r>) x2@18@01)))
    (= x1@18@01 x2@18@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@18@01 $Ref)) (!
  (=>
    (Set_in x@18@01 xs@1@01)
    (and
      (= (inv@21@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01)) x@18@01)
      (img@22@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01))))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01) x@18@01) ($FVF.loc_f ($FVF.lookup_f $t@20@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01)))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (Set_in (inv@21@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@18@01 $Ref)) (!
  (=>
    (Set_in x@18@01 xs@1@01)
    (not (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01) $Ref.null)))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01) x@18@01) ($FVF.loc_f ($FVF.lookup_f $t@20@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01)))
  :qid |f-permImpliesNonNull|)))
(declare-const sm@23@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (Set_in (inv@21@01 r) xs@1@01))
    (= ($FVF.lookup_f (as sm@23@01  $FVF<f>) r) ($FVF.lookup_f $t@20@01 r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@20@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_f ($FVF.lookup_f $t@20@01 r) r)
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@21@01 r) xs@1@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@23@01  $FVF<f>) r) r))
  :pattern ((inv@21@01 r))
  :qid |quant-u-9|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref, y: Ref ::
;     { x.r.r, y.r.r }
;     (x in xs) && ((y in xs) && x != y) ==> x.r.r != y.r.r)
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] (forall x: Ref, y: Ref :: { x.r.r, y.r.r } (x in xs) && ((y in xs) && x != y) ==> x.r.r != y.r.r)
(declare-const x@25@01 $Ref)
(declare-const y@26@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) && ((y in xs) && x != y) ==> x.r.r != y.r.r
; [eval] (x in xs) && ((y in xs) && x != y)
; [eval] (x in xs)
(push) ; 4
; [then-branch: 3 | !(x@25@01 in xs@1@01) | live]
; [else-branch: 3 | x@25@01 in xs@1@01 | live]
(push) ; 5
; [then-branch: 3 | !(x@25@01 in xs@1@01)]
(assert (not (Set_in x@25@01 xs@1@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | x@25@01 in xs@1@01]
(assert (Set_in x@25@01 xs@1@01))
; [eval] (y in xs)
(push) ; 6
; [then-branch: 4 | !(y@26@01 in xs@1@01) | live]
; [else-branch: 4 | y@26@01 in xs@1@01 | live]
(push) ; 7
; [then-branch: 4 | !(y@26@01 in xs@1@01)]
(assert (not (Set_in y@26@01 xs@1@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | y@26@01 in xs@1@01]
(assert (Set_in y@26@01 xs@1@01))
; [eval] x != y
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (Set_in y@26@01 xs@1@01) (not (Set_in y@26@01 xs@1@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Set_in x@25@01 xs@1@01)
  (and
    (Set_in x@25@01 xs@1@01)
    (or (Set_in y@26@01 xs@1@01) (not (Set_in y@26@01 xs@1@01))))))
(assert (or (Set_in x@25@01 xs@1@01) (not (Set_in x@25@01 xs@1@01))))
(push) ; 4
; [then-branch: 5 | x@25@01 in xs@1@01 && y@26@01 in xs@1@01 && x@25@01 != y@26@01 | live]
; [else-branch: 5 | !(x@25@01 in xs@1@01 && y@26@01 in xs@1@01 && x@25@01 != y@26@01) | live]
(push) ; 5
; [then-branch: 5 | x@25@01 in xs@1@01 && y@26@01 in xs@1@01 && x@25@01 != y@26@01]
(assert (and
  (Set_in x@25@01 xs@1@01)
  (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01)))))
; [eval] x.r.r != y.r.r
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01) x@25@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 x@25@01) (Set_in (inv@7@01 x@25@01) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@16@01 x@25@01) (Set_in (inv@15@01 x@25@01) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@8@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01))
        (Set_in (inv@7@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@16@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01))
        (Set_in (inv@15@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01) y@26@01))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 y@26@01) (Set_in (inv@7@01 y@26@01) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@16@01 y@26@01) (Set_in (inv@15@01 y@26@01) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@8@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01))
        (Set_in (inv@7@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@16@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01))
        (Set_in (inv@15@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(x@25@01 in xs@1@01 && y@26@01 in xs@1@01 && x@25@01 != y@26@01)]
(assert (not
  (and
    (Set_in x@25@01 xs@1@01)
    (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@14@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (and
    (Set_in x@25@01 xs@1@01)
    (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01))))
  (and
    (Set_in x@25@01 xs@1@01)
    (Set_in y@26@01 xs@1@01)
    (not (= x@25@01 y@26@01))
    ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01) x@25@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01))
    ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01) y@26@01)
    ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Set_in x@25@01 xs@1@01)
      (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01)))))
  (and
    (Set_in x@25@01 xs@1@01)
    (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01))))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@14@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@25@01 $Ref) (y@26@01 $Ref)) (!
  (and
    (=>
      (Set_in x@25@01 xs@1@01)
      (and
        (Set_in x@25@01 xs@1@01)
        (or (Set_in y@26@01 xs@1@01) (not (Set_in y@26@01 xs@1@01)))))
    (or (Set_in x@25@01 xs@1@01) (not (Set_in x@25@01 xs@1@01)))
    (=>
      (and
        (Set_in x@25@01 xs@1@01)
        (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01))))
      (and
        (Set_in x@25@01 xs@1@01)
        (Set_in y@26@01 xs@1@01)
        (not (= x@25@01 y@26@01))
        ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01) x@25@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01))
        ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01) y@26@01)
        ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01))))
    (or
      (not
        (and
          (Set_in x@25@01 xs@1@01)
          (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01)))))
      (and
        (Set_in x@25@01 xs@1@01)
        (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01))))))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01) x@25@01) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01) y@26@01) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersNested.vpr@16@12@16@99-aux|)))
(assert (forall ((x@25@01 $Ref) (y@26@01 $Ref)) (!
  (=>
    (and
      (Set_in x@25@01 xs@1@01)
      (and (Set_in y@26@01 xs@1@01) (not (= x@25@01 y@26@01))))
    (not
      (=
        ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01))
        ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)))))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01) x@25@01) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@25@01)) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01) y@26@01) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) y@26@01)))
  :qid |prog./silicon/silver/src/test/resources/all/heap-dependent_triggers/heapTriggersNested.vpr@16@12@16@99|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref :: { x.r.r.f } (x in xs) ==> acc(x.r.r.f, write))
(declare-const x@27@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@27@01 xs@1@01))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01) x@27@01))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 x@27@01) (Set_in (inv@7@01 x@27@01) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@16@01 x@27@01) (Set_in (inv@15@01 x@27@01) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)))
(push) ; 4
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@8@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))
        (Set_in (inv@7@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@16@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))
        (Set_in (inv@15@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
(declare-const $t@28@01 $FVF<f>)
(declare-fun inv@29@01 ($Ref) $Ref)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@6@01 r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
    (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :pattern (($FVF.lookup_r $t@14@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
  :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Set_in x@27@01 xs@1@01)
    (and
      ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01) x@27@01)
      ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01) x@27@01) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) ($FVF.loc_f ($FVF.lookup_f $t@28@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))) ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@27@01 $Ref) (x2@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@27@01 xs@1@01)
      (Set_in x2@27@01 xs@1@01)
      (=
        ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x1@27@01))
        ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x2@27@01))))
    (= x1@27@01 x2@27@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Set_in x@27@01 xs@1@01)
    (and
      (=
        (inv@29@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)))
        x@27@01)
      (img@30@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)))))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01) x@27@01) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) ($FVF.loc_f ($FVF.lookup_f $t@28@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))) ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) xs@1@01))
    (=
      ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) (inv@29@01 r)))
      r))
  :pattern ((inv@29@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@27@01 $Ref)) (!
  (=>
    (Set_in x@27@01 xs@1@01)
    (not
      (=
        ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))
        $Ref.null)))
  :pattern (($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01) x@27@01) ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01)) ($FVF.loc_f ($FVF.lookup_f $t@28@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))) ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@27@01))
      ($FVF.lookup_r (as sm@17@01  $FVF<r>) x@18@01))
    (=
      (and (img@30@01 r) (Set_in (inv@29@01 r) xs@1@01))
      (and (img@22@01 r) (Set_in (inv@21@01 r) xs@1@01))))
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@31@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@22@01 r) (Set_in (inv@21@01 r) xs@1@01))
    (= ($FVF.lookup_f (as sm@31@01  $FVF<f>) r) ($FVF.lookup_f $t@20@01 r)))
  :pattern (($FVF.lookup_f (as sm@31@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@20@01 r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@30@01 r) (Set_in (inv@29@01 r) xs@1@01))
    (= ($FVF.lookup_f (as sm@31@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@31@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f $t@20@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@28@01 r) r))
  :pattern (($FVF.lookup_f (as sm@31@01  $FVF<f>) r))
  :qid |qp.fvfResTrgDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@29@01 r) xs@1@01)
    ($FVF.loc_f ($FVF.lookup_f (as sm@31@01  $FVF<f>) r) r))
  :pattern ((inv@29@01 r))
  :qid |quant-u-13|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (a in xs)
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 $Snap.unit))
; [eval] (a in xs)
(assert (Set_in a@2@01 xs@1@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert perm(a.r) >= write
; [eval] perm(a.r) >= write
; [eval] perm(a.r)
; Definitional axioms for snapshot map values
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_r (as pm@33@01  $FPM) r)
    (+
      (ite (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01)) $Perm.Write $Perm.No)
      (ite
        (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_r (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) r)
    ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
    ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
  :pattern (($FVF.perm_r (as pm@33@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01) a@2@01))
; perm(a.r)  ~~>  assume upper permission bound
(assert (<= ($FVF.perm_r (as pm@33@01  $FPM) a@2@01) $Perm.Write))
(set-option :timeout 0)
(push) ; 3
(assert (not (>= ($FVF.perm_r (as pm@33@01  $FPM) a@2@01) $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>= ($FVF.perm_r (as pm@33@01  $FPM) a@2@01) $Perm.Write))
; [exec]
; v := a.r
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 a@2@01) (Set_in (inv@7@01 a@2@01) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@16@01 a@2@01) (Set_in (inv@15@01 a@2@01) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const v@34@01 $Ref)
(assert (= v@34@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)))
; [exec]
; assert perm(a.r.f) >= write
; [eval] perm(a.r.f) >= write
; [eval] perm(a.r.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 a@2@01) (Set_in (inv@7@01 a@2@01) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@16@01 a@2@01) (Set_in (inv@15@01 a@2@01) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(declare-const pm@35@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@35@01  $FPM) r)
    (+
      (ite
        (and (img@22@01 r) (Set_in (inv@21@01 r) xs@1@01))
        $Perm.Write
        $Perm.No)
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) xs@1@01))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef14|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_f ($FVF.lookup_f (as sm@31@01  $FVF<f>) r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@20@01 r) r)
    ($FVF.loc_f ($FVF.lookup_f $t@28@01 r) r))
  :pattern (($FVF.perm_f (as pm@35@01  $FPM) r))
  :qid |qp.resTrgDef15|)))
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@31@01  $FVF<f>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)))
; perm(a.r.f)  ~~>  assume upper permission bound
(assert (<=
  ($FVF.perm_f (as pm@35@01  $FPM) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01))
  $Perm.Write))
(push) ; 3
(assert (not (>=
  ($FVF.perm_f (as pm@35@01  $FPM) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>=
  ($FVF.perm_f (as pm@35@01  $FPM) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01))
  $Perm.Write))
; [exec]
; assert perm(a.r.r.f) >= write
; [eval] perm(a.r.r.f) >= write
; [eval] perm(a.r.r.f)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and (img@8@01 a@2@01) (Set_in (inv@7@01 a@2@01) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and (img@16@01 a@2@01) (Set_in (inv@15@01 a@2@01) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and (img@8@01 r) (Set_in (inv@7@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@6@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@6@01 r))
    :qid |qp.fvfValDef3|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01))
      (= ($FVF.lookup_r (as sm@17@01  $FVF<r>) r) ($FVF.lookup_r $t@14@01 r)))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :pattern (($FVF.lookup_r $t@14@01 r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (and
      ($FVF.loc_r ($FVF.lookup_r $t@6@01 r) r)
      ($FVF.loc_r ($FVF.lookup_r $t@14@01 r) r))
    :pattern (($FVF.lookup_r (as sm@17@01  $FVF<r>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_r ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@8@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01))
        (Set_in (inv@7@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)) xs@1@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@16@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01))
        (Set_in (inv@15@01 ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)) xs@1@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
(assert ($FVF.loc_f ($FVF.lookup_f (as sm@31@01  $FVF<f>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01))) ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01))))
; perm(a.r.r.f)  ~~>  assume upper permission bound
(assert (<=
  ($FVF.perm_f (as pm@35@01  $FPM) ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)))
  $Perm.Write))
(push) ; 3
(assert (not (>=
  ($FVF.perm_f (as pm@35@01  $FPM) ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)))
  $Perm.Write)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (>=
  ($FVF.perm_f (as pm@35@01  $FPM) ($FVF.lookup_r (as sm@17@01  $FVF<r>) ($FVF.lookup_r (as sm@17@01  $FVF<r>) a@2@01)))
  $Perm.Write))
(pop) ; 2
(pop) ; 1
