(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:09:45
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr
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
(declare-fun function2 ($Snap Int Int) Bool)
(declare-fun function2%limited ($Snap Int Int) Bool)
(declare-fun function2%stateless (Int Int) Bool)
(declare-fun function2%precondition ($Snap Int Int) Bool)
(declare-fun function7 ($Snap Bool Int) Bool)
(declare-fun function7%limited ($Snap Bool Int) Bool)
(declare-fun function7%stateless (Bool Int) Bool)
(declare-fun function7%precondition ($Snap Bool Int) Bool)
(declare-fun function4 ($Snap Bool Bool) Bool)
(declare-fun function4%limited ($Snap Bool Bool) Bool)
(declare-fun function4%stateless (Bool Bool) Bool)
(declare-fun function4%precondition ($Snap Bool Bool) Bool)
(declare-fun function5 ($Snap Int Int) Bool)
(declare-fun function5%limited ($Snap Int Int) Bool)
(declare-fun function5%stateless (Int Int) Bool)
(declare-fun function5%precondition ($Snap Int Int) Bool)
(declare-fun function10 ($Snap Int) Bool)
(declare-fun function10%limited ($Snap Int) Bool)
(declare-fun function10%stateless (Int) Bool)
(declare-fun function10%precondition ($Snap Int) Bool)
(declare-fun function11 ($Snap Set<$Ref>) Bool)
(declare-fun function11%limited ($Snap Set<$Ref>) Bool)
(declare-fun function11%stateless (Set<$Ref>) Bool)
(declare-fun function11%precondition ($Snap Set<$Ref>) Bool)
(declare-fun function1 ($Snap Int) Bool)
(declare-fun function1%limited ($Snap Int) Bool)
(declare-fun function1%stateless (Int) Bool)
(declare-fun function1%precondition ($Snap Int) Bool)
(declare-fun function6 ($Snap Int Int) Bool)
(declare-fun function6%limited ($Snap Int Int) Bool)
(declare-fun function6%stateless (Int Int) Bool)
(declare-fun function6%precondition ($Snap Int Int) Bool)
(declare-fun function0 ($Snap) Bool)
(declare-fun function0%limited ($Snap) Bool)
(declare-const function0%stateless Bool)
(declare-fun function0%precondition ($Snap) Bool)
(declare-fun function8 ($Snap Bool Int) Bool)
(declare-fun function8%limited ($Snap Bool Int) Bool)
(declare-fun function8%stateless (Bool Int) Bool)
(declare-fun function8%precondition ($Snap Bool Int) Bool)
(declare-fun function9 ($Snap) Bool)
(declare-fun function9%limited ($Snap) Bool)
(declare-const function9%stateless Bool)
(declare-fun function9%precondition ($Snap) Bool)
(declare-fun function3 ($Snap Bool) Bool)
(declare-fun function3%limited ($Snap Bool) Bool)
(declare-fun function3%stateless (Bool) Bool)
(declare-fun function3%precondition ($Snap Bool) Bool)
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
(declare-fun inv@32@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@33@00 ($Snap Set<$Ref> $Ref) Bool)
(assert (forall ((s@$ $Snap) (y@0@00 Int) (z@1@00 Int)) (!
  (= (function2%limited s@$ y@0@00 z@1@00) (function2 s@$ y@0@00 z@1@00))
  :pattern ((function2 s@$ y@0@00 z@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int) (z@1@00 Int)) (!
  (function2%stateless y@0@00 z@1@00)
  :pattern ((function2%limited s@$ y@0@00 z@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (b@3@00 Bool) (z@4@00 Int)) (!
  (= (function7%limited s@$ b@3@00 z@4@00) (function7 s@$ b@3@00 z@4@00))
  :pattern ((function7 s@$ b@3@00 z@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (b@3@00 Bool) (z@4@00 Int)) (!
  (function7%stateless b@3@00 z@4@00)
  :pattern ((function7%limited s@$ b@3@00 z@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (b@6@00 Bool) (c@7@00 Bool)) (!
  (= (function4%limited s@$ b@6@00 c@7@00) (function4 s@$ b@6@00 c@7@00))
  :pattern ((function4 s@$ b@6@00 c@7@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (b@6@00 Bool) (c@7@00 Bool)) (!
  (function4%stateless b@6@00 c@7@00)
  :pattern ((function4%limited s@$ b@6@00 c@7@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@9@00 Int) (y@10@00 Int)) (!
  (= (function5%limited s@$ x@9@00 y@10@00) (function5 s@$ x@9@00 y@10@00))
  :pattern ((function5 s@$ x@9@00 y@10@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@9@00 Int) (y@10@00 Int)) (!
  (function5%stateless x@9@00 y@10@00)
  :pattern ((function5%limited s@$ x@9@00 y@10@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (z@12@00 Int)) (!
  (= (function10%limited s@$ z@12@00) (function10 s@$ z@12@00))
  :pattern ((function10 s@$ z@12@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (z@12@00 Int)) (!
  (function10%stateless z@12@00)
  :pattern ((function10%limited s@$ z@12@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (s@14@00 Set<$Ref>)) (!
  (= (function11%limited s@$ s@14@00) (function11 s@$ s@14@00))
  :pattern ((function11 s@$ s@14@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (s@14@00 Set<$Ref>)) (!
  (function11%stateless s@14@00)
  :pattern ((function11%limited s@$ s@14@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (s@14@00 Set<$Ref>)) (!
  (and
    (forall ((e@31@00 $Ref)) (!
      (=>
        (Set_in e@31@00 s@14@00)
        (and
          (= (inv@32@00 s@$ s@14@00 e@31@00) e@31@00)
          (img@33@00 s@$ s@14@00 e@31@00)))
      :pattern ((Set_in e@31@00 s@14@00))
      :pattern ((inv@32@00 s@$ s@14@00 e@31@00))
      :pattern ((img@33@00 s@$ s@14@00 e@31@00))
      :qid |quant-u-25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@33@00 s@$ s@14@00 r)
          (Set_in (inv@32@00 s@$ s@14@00 r) s@14@00))
        (= (inv@32@00 s@$ s@14@00 r) r))
      :pattern ((inv@32@00 s@$ s@14@00 r))
      :qid |f-fctOfInv|))
    (=> (function11%precondition s@$ s@14@00) (= (function11 s@$ s@14@00) true)))
  :pattern ((function11 s@$ s@14@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (s@14@00 Set<$Ref>)) (!
  true
  :pattern ((function11 s@$ s@14@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (z@16@00 Int)) (!
  (= (function1%limited s@$ z@16@00) (function1 s@$ z@16@00))
  :pattern ((function1 s@$ z@16@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (z@16@00 Int)) (!
  (function1%stateless z@16@00)
  :pattern ((function1%limited s@$ z@16@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (z@18@00 Int) (w@19@00 Int)) (!
  (= (function6%limited s@$ z@18@00 w@19@00) (function6 s@$ z@18@00 w@19@00))
  :pattern ((function6 s@$ z@18@00 w@19@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (z@18@00 Int) (w@19@00 Int)) (!
  (function6%stateless z@18@00 w@19@00)
  :pattern ((function6%limited s@$ z@18@00 w@19@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap)) (!
  (= (function0%limited s@$) (function0 s@$))
  :pattern ((function0 s@$))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap)) (!
  (as function0%stateless  Bool)
  :pattern ((function0%limited s@$))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (b@22@00 Bool) (z@23@00 Int)) (!
  (= (function8%limited s@$ b@22@00 z@23@00) (function8 s@$ b@22@00 z@23@00))
  :pattern ((function8 s@$ b@22@00 z@23@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (b@22@00 Bool) (z@23@00 Int)) (!
  (function8%stateless b@22@00 z@23@00)
  :pattern ((function8%limited s@$ b@22@00 z@23@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap)) (!
  (= (function9%limited s@$) (function9 s@$))
  :pattern ((function9 s@$))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap)) (!
  (as function9%stateless  Bool)
  :pattern ((function9%limited s@$))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (b@26@00 Bool)) (!
  (= (function3%limited s@$ b@26@00) (function3 s@$ b@26@00))
  :pattern ((function3 s@$ b@26@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (b@26@00 Bool)) (!
  (function3%stateless b@26@00)
  :pattern ((function3%limited s@$ b@26@00))
  :qid |quant-u-23|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- client1 ----------
(declare-const x@0@01 Int)
(declare-const y@1@01 Int)
(declare-const x@2@01 Int)
(declare-const y@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] x == 0
(assert (= x@2@01 0))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] y == 0
(assert (= y@3@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var res: Bool
(declare-const res@5@01 Bool)
; [exec]
; res := function0()
; [eval] function0()
(push) ; 3
; [eval] (forall x: Int ::x == x)
(declare-const x@6@01 Int)
(push) ; 4
; [eval] x == x
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (function0%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (function0%precondition $Snap.unit))
(declare-const res@7@01 Bool)
(assert (= res@7@01 (function0 $Snap.unit)))
; [exec]
; res := function1(x)
; [eval] function1(x)
(push) ; 3
; [eval] (forall x: Int ::x == x && z == 0)
(declare-const x@8@01 Int)
(push) ; 4
; [eval] x == x && z == 0
; [eval] x == x
(push) ; 5
; [then-branch: 0 | False | live]
; [else-branch: 0 | True | live]
(push) ; 6
; [then-branch: 0 | False]
(assert false)
(pop) ; 6
(push) ; 6
; [else-branch: 0 | True]
; [eval] z == 0
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((x@8@01 Int)) (!
  (= x@2@01 0)
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@33@12@33@45|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@8@01 Int)) (!
  (= x@2@01 0)
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@33@12@33@45|)))
(assert (function1%precondition $Snap.unit x@2@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (forall ((x@8@01 Int)) (!
    (= x@2@01 0)
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@33@12@33@45|))
  (function1%precondition $Snap.unit x@2@01)))
(declare-const res@9@01 Bool)
(assert (= res@9@01 (function1 $Snap.unit x@2@01)))
; [exec]
; res := function2(x, y)
; [eval] function2(x, y)
(push) ; 3
; [eval] (forall x: Int ::x == x && y == z)
(declare-const x@10@01 Int)
(push) ; 4
; [eval] x == x && y == z
; [eval] x == x
(push) ; 5
; [then-branch: 1 | False | live]
; [else-branch: 1 | True | live]
(push) ; 6
; [then-branch: 1 | False]
(assert false)
(pop) ; 6
(push) ; 6
; [else-branch: 1 | True]
; [eval] y == z
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((x@10@01 Int)) (!
  (= x@2@01 y@3@01)
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@37@12@37@45|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@10@01 Int)) (!
  (= x@2@01 y@3@01)
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@37@12@37@45|)))
(assert (function2%precondition $Snap.unit x@2@01 y@3@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (forall ((x@10@01 Int)) (!
    (= x@2@01 y@3@01)
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@37@12@37@45|))
  (function2%precondition $Snap.unit x@2@01 y@3@01)))
(declare-const res@11@01 Bool)
(assert (= res@11@01 (function2 $Snap.unit x@2@01 y@3@01)))
; [exec]
; res := function3((forall z: Int ::z == z))
; [eval] function3((forall z: Int ::z == z))
; [eval] (forall z: Int ::z == z)
(declare-const z@12@01 Int)
(push) ; 3
; [eval] z == z
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
; [eval] (forall z: Int ::b)
(declare-const z@13@01 Int)
(push) ; 4
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((z@13@01 Int)) (!
  (forall ((z@12@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@81@20@81@43|))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@41@12@41@30|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((z@13@01 Int)) (!
  (forall ((z@12@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@81@20@81@43|))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@41@12@41@30|)))
(assert (function3%precondition $Snap.unit (forall ((z@12@01 Int)) (!
  true
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@81@20@81@43|))))
(pop) ; 3
; Joined path conditions
(assert (and
  (forall ((z@13@01 Int)) (!
    (forall ((z@12@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@81@20@81@43|))
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@41@12@41@30|))
  (function3%precondition $Snap.unit (forall ((z@12@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@81@20@81@43|)))))
(declare-const res@14@01 Bool)
(assert (=
  res@14@01
  (function3 $Snap.unit (forall ((z@12@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@81@20@81@43|)))))
; [exec]
; res := function4((forall z: Int ::z == z), (forall z: Int ::z == z))
; [eval] function4((forall z: Int ::z == z), (forall z: Int ::z == z))
; [eval] (forall z: Int ::z == z)
(declare-const z@15@01 Int)
(push) ; 3
; [eval] z == z
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
; [eval] (forall z: Int ::z == z)
(declare-const z@16@01 Int)
(push) ; 3
; [eval] z == z
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
; [eval] (forall z: Int ::b && c)
(declare-const z@17@01 Int)
(push) ; 4
; [eval] b && c
(push) ; 5
; [then-branch: 2 | !(QA z@15@01 :: True) | live]
; [else-branch: 2 | QA z@15@01 :: True | live]
(push) ; 6
; [then-branch: 2 | !(QA z@15@01 :: True)]
(assert (not
  (forall ((z@15@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | QA z@15@01 :: True]
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (forall ((z@15@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|))
  (not
    (forall ((z@15@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (or
  (forall ((z@15@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|))
  (not
    (forall ((z@15@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|)))))
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((z@17@01 Int)) (!
  (and
    (forall ((z@15@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|))
    (forall ((z@16@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@45@82@68|)))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@45@12@45@35|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((z@17@01 Int)) (!
  (and
    (forall ((z@15@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|))
    (forall ((z@16@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@45@82@68|)))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@45@12@45@35|)))
(assert (function4%precondition $Snap.unit (forall ((z@15@01 Int)) (!
  true
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|)) (forall ((z@16@01 Int)) (!
  true
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@45@82@68|))))
(pop) ; 3
; Joined path conditions
(assert (and
  (or
    (forall ((z@15@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|))
    (not
      (forall ((z@15@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|))))
  (forall ((z@17@01 Int)) (!
    (and
      (forall ((z@15@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|))
      (forall ((z@16@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@45@82@68|)))
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@45@12@45@35|))
  (function4%precondition $Snap.unit (forall ((z@15@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|)) (forall ((z@16@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@45@82@68|)))))
(declare-const res@18@01 Bool)
(assert (=
  res@18@01
  (function4 $Snap.unit (forall ((z@15@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@20@82@43|)) (forall ((z@16@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@82@45@82@68|)))))
; [exec]
; res := function4(x == 0 && (forall z: Int ::z == z), y == 0 &&
;   (forall z: Int ::z == z))
; [eval] function4(x == 0 && (forall z: Int ::z == z), y == 0 && (forall z: Int ::z == z))
; [eval] x == 0 && (forall z: Int ::z == z)
; [eval] x == 0
(push) ; 3
; [then-branch: 3 | x@2@01 != 0 | live]
; [else-branch: 3 | x@2@01 == 0 | live]
(push) ; 4
; [then-branch: 3 | x@2@01 != 0]
(assert (not (= x@2@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | x@2@01 == 0]
; [eval] (forall z: Int ::z == z)
(declare-const z@19@01 Int)
(push) ; 5
; [eval] z == z
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= x@2@01 0) (not (= x@2@01 0))))
; [eval] y == 0 && (forall z: Int ::z == z)
; [eval] y == 0
(push) ; 3
; [then-branch: 4 | y@3@01 != 0 | live]
; [else-branch: 4 | y@3@01 == 0 | live]
(push) ; 4
; [then-branch: 4 | y@3@01 != 0]
(assert (not (= y@3@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | y@3@01 == 0]
; [eval] (forall z: Int ::z == z)
(declare-const z@20@01 Int)
(push) ; 5
; [eval] z == z
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (= y@3@01 0) (not (= y@3@01 0))))
(push) ; 3
; [eval] (forall z: Int ::b && c)
(declare-const z@21@01 Int)
(push) ; 4
; [eval] b && c
(push) ; 5
; [then-branch: 5 | !(x@2@01 == 0 && QA z@19@01 :: True) | live]
; [else-branch: 5 | x@2@01 == 0 && QA z@19@01 :: True | live]
(push) ; 6
; [then-branch: 5 | !(x@2@01 == 0 && QA z@19@01 :: True)]
(assert (not
  (and
    (= x@2@01 0)
    (forall ((z@19@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|)))))
(pop) ; 6
(push) ; 6
; [else-branch: 5 | x@2@01 == 0 && QA z@19@01 :: True]
(assert (and
  (= x@2@01 0)
  (forall ((z@19@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (and
    (= x@2@01 0)
    (forall ((z@19@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|)))
  (not
    (and
      (= x@2@01 0)
      (forall ((z@19@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (or
  (and
    (= x@2@01 0)
    (forall ((z@19@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|)))
  (not
    (and
      (= x@2@01 0)
      (forall ((z@19@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|))))))
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((z@21@01 Int)) (!
  (and
    (and
      (= x@2@01 0)
      (forall ((z@19@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|)))
    (and
      (= y@3@01 0)
      (forall ((z@20@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@65@83@88|))))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@45@12@45@35|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((z@21@01 Int)) (!
  (and
    (and
      (= x@2@01 0)
      (forall ((z@19@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|)))
    (and
      (= y@3@01 0)
      (forall ((z@20@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@65@83@88|))))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@45@12@45@35|)))
(assert (function4%precondition $Snap.unit (and
  (= x@2@01 0)
  (forall ((z@19@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|))) (and
  (= y@3@01 0)
  (forall ((z@20@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@65@83@88|)))))
(pop) ; 3
; Joined path conditions
(assert (and
  (or
    (and
      (= x@2@01 0)
      (forall ((z@19@01 Int)) (!
        true
        
        :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|)))
    (not
      (and
        (= x@2@01 0)
        (forall ((z@19@01 Int)) (!
          true
          
          :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|)))))
  (forall ((z@21@01 Int)) (!
    (and
      (and
        (= x@2@01 0)
        (forall ((z@19@01 Int)) (!
          true
          
          :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|)))
      (and
        (= y@3@01 0)
        (forall ((z@20@01 Int)) (!
          true
          
          :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@65@83@88|))))
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@45@12@45@35|))
  (function4%precondition $Snap.unit (and
    (= x@2@01 0)
    (forall ((z@19@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|))) (and
    (= y@3@01 0)
    (forall ((z@20@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@65@83@88|))))))
(declare-const res@22@01 Bool)
(assert (=
  res@22@01
  (function4 $Snap.unit (and
    (= x@2@01 0)
    (forall ((z@19@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@30@83@53|))) (and
    (= y@3@01 0)
    (forall ((z@20@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@83@65@83@88|))))))
; [exec]
; res := function5(y, x)
; [eval] function5(y, x)
(push) ; 3
; [eval] x == 0 || y == 0
; [eval] x == 0
(push) ; 4
; [then-branch: 6 | y@3@01 == 0 | live]
; [else-branch: 6 | y@3@01 != 0 | live]
(push) ; 5
; [then-branch: 6 | y@3@01 == 0]
(pop) ; 5
(push) ; 5
; [else-branch: 6 | y@3@01 != 0]
(assert (not (= y@3@01 0)))
; [eval] y == 0
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (= y@3@01 0)) (= y@3@01 0)))
(push) ; 4
(assert (not (or (= y@3@01 0) (= x@2@01 0))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (or (= y@3@01 0) (= x@2@01 0)))
(assert (function5%precondition $Snap.unit y@3@01 x@2@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (or (not (= y@3@01 0)) (= y@3@01 0))
  (or (= y@3@01 0) (= x@2@01 0))
  (function5%precondition $Snap.unit y@3@01 x@2@01)))
(declare-const res@23@01 Bool)
(assert (= res@23@01 (function5 $Snap.unit y@3@01 x@2@01)))
; [exec]
; res := function6(x, y)
; [eval] function6(x, y)
(push) ; 3
; [eval] (forall x: Int ::x == x && (forall y: Int ::y == y && z == w))
(declare-const x@24@01 Int)
(push) ; 4
; [eval] x == x && (forall y: Int ::y == y && z == w)
; [eval] x == x
(push) ; 5
; [then-branch: 7 | False | live]
; [else-branch: 7 | True | live]
(push) ; 6
; [then-branch: 7 | False]
(assert false)
(pop) ; 6
(push) ; 6
; [else-branch: 7 | True]
; [eval] (forall y: Int ::y == y && z == w)
(declare-const y@25@01 Int)
(push) ; 7
; [eval] y == y && z == w
; [eval] y == y
(push) ; 8
; [then-branch: 8 | False | live]
; [else-branch: 8 | True | live]
(push) ; 9
; [then-branch: 8 | False]
(assert false)
(pop) ; 9
(push) ; 9
; [else-branch: 8 | True]
; [eval] z == w
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((x@24@01 Int)) (!
  (forall ((y@25@01 Int)) (!
    (= x@2@01 y@3@01)
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@54@39@54@72|))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@54@12@54@72|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@24@01 Int)) (!
  (forall ((y@25@01 Int)) (!
    (= x@2@01 y@3@01)
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@54@39@54@72|))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@54@12@54@72|)))
(assert (function6%precondition $Snap.unit x@2@01 y@3@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (forall ((x@24@01 Int)) (!
    (forall ((y@25@01 Int)) (!
      (= x@2@01 y@3@01)
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@54@39@54@72|))
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@54@12@54@72|))
  (function6%precondition $Snap.unit x@2@01 y@3@01)))
(declare-const res@26@01 Bool)
(assert (= res@26@01 (function6 $Snap.unit x@2@01 y@3@01)))
; [exec]
; res := function7((forall z: Int ::z == z), 5)
; [eval] function7((forall z: Int ::z == z), 5)
; [eval] (forall z: Int ::z == z)
(declare-const z@27@01 Int)
(push) ; 3
; [eval] z == z
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
; [eval] z == 5
(assert (function7%precondition ($Snap.combine $Snap.unit $Snap.unit) (forall ((z@27@01 Int)) (!
  true
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@86@20@86@43|)) 5))
(pop) ; 3
; Joined path conditions
(assert (function7%precondition ($Snap.combine $Snap.unit $Snap.unit) (forall ((z@27@01 Int)) (!
  true
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@86@20@86@43|)) 5))
(declare-const res@28@01 Bool)
(assert (=
  res@28@01
  (function7 ($Snap.combine $Snap.unit $Snap.unit) (forall ((z@27@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@86@20@86@43|)) 5)))
; [exec]
; res := function8((forall z: Int ::z == z), 5)
; [eval] function8((forall z: Int ::z == z), 5)
; [eval] (forall z: Int ::z == z)
(declare-const z@29@01 Int)
(push) ; 3
; [eval] z == z
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 3
; [eval] (forall x: Int ::b)
(declare-const x@30@01 Int)
(push) ; 4
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((x@30@01 Int)) (!
  (forall ((z@29@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@87@20@87@43|))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@62@12@62@30|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@30@01 Int)) (!
  (forall ((z@29@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@87@20@87@43|))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@62@12@62@30|)))
(assert (function8%precondition $Snap.unit (forall ((z@29@01 Int)) (!
  true
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@87@20@87@43|)) 5))
(pop) ; 3
; Joined path conditions
(assert (and
  (forall ((x@30@01 Int)) (!
    (forall ((z@29@01 Int)) (!
      true
      
      :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@87@20@87@43|))
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@62@12@62@30|))
  (function8%precondition $Snap.unit (forall ((z@29@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@87@20@87@43|)) 5)))
(declare-const res@31@01 Bool)
(assert (=
  res@31@01
  (function8 $Snap.unit (forall ((z@29@01 Int)) (!
    true
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@87@20@87@43|)) 5)))
; [exec]
; res := function9()
; [eval] function9()
(push) ; 3
; [eval] (exists x: Int :: x == x)
(declare-const x@32@01 Int)
(push) ; 4
; [eval] x == x
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (function9%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (function9%precondition $Snap.unit))
(declare-const res@33@01 Bool)
(assert (= res@33@01 (function9 $Snap.unit)))
; [exec]
; res := function10(x)
; [eval] function10(x)
(push) ; 3
; [eval] (exists x: Int :: x == z ==> x == 0)
(declare-const x@34@01 Int)
(push) ; 4
; [eval] x == z ==> x == 0
; [eval] x == z
(push) ; 5
; [then-branch: 9 | x@34@01 == x@2@01 | live]
; [else-branch: 9 | x@34@01 != x@2@01 | live]
(push) ; 6
; [then-branch: 9 | x@34@01 == x@2@01]
(assert (= x@34@01 x@2@01))
; [eval] x == 0
(pop) ; 6
(push) ; 6
; [else-branch: 9 | x@34@01 != x@2@01]
(assert (not (= x@34@01 x@2@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (= x@34@01 x@2@01)) (= x@34@01 x@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (exists ((x@34@01 Int)) (!
  (=> (= x@34@01 x@2@01) (= x@34@01 0))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@70@12@70@46|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (exists ((x@34@01 Int)) (!
  (=> (= x@34@01 x@2@01) (= x@34@01 0))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@70@12@70@46|)))
(assert (function10%precondition $Snap.unit x@2@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (exists ((x@34@01 Int)) (!
    (=> (= x@34@01 x@2@01) (= x@34@01 0))
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@70@12@70@46|))
  (function10%precondition $Snap.unit x@2@01)))
(declare-const res@35@01 Bool)
(assert (= res@35@01 (function10 $Snap.unit x@2@01)))
(pop) ; 2
(pop) ; 1
; ---------- client2 ----------
(declare-const e@36@01 $Ref)
(declare-const e@37@01 $Ref)
(push) ; 1
(declare-const $t@38@01 Int)
(declare-const sm@39@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (= ($FVF.lookup_f (as sm@39@01  $FVF<f>) e@37@01) $t@38@01))
(assert (not (= e@37@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert function11(Set(e))
; [eval] function11(Set(e))
; [eval] Set(e)
(push) ; 3
(declare-const e@40@01 $Ref)
(push) ; 4
; [eval] (e in s)
(assert (Set_in e@40@01 (Set_singleton e@37@01)))
(pop) ; 4
(declare-fun inv@41@01 ($Ref) $Ref)
(declare-fun img@42@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((e1@40@01 $Ref) (e2@40@01 $Ref)) (!
  (=>
    (and
      (Set_in e1@40@01 (Set_singleton e@37@01))
      (Set_in e2@40@01 (Set_singleton e@37@01))
      (= e1@40@01 e2@40@01))
    (= e1@40@01 e2@40@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@40@01 $Ref)) (!
  (=>
    (Set_in e@40@01 (Set_singleton e@37@01))
    (and (= (inv@41@01 e@40@01) e@40@01) (img@42@01 e@40@01)))
  :pattern ((Set_in e@40@01 (Set_singleton e@37@01)))
  :pattern ((inv@41@01 e@40@01))
  :pattern ((img@42@01 e@40@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (Set_in (inv@41@01 r) (Set_singleton e@37@01)))
    (= (inv@41@01 r) r))
  :pattern ((inv@41@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((r $Ref)) $Perm
  (ite
    (and
      (Set_in (inv@41@01 r) (Set_singleton e@37@01))
      (img@42@01 r)
      (= r (inv@41@01 r)))
    ($Perm.min (ite (= r e@37@01) $Perm.Write $Perm.No) $Perm.Write)
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
(assert (not (= (- $Perm.Write (pTaken@43@01 e@37@01)) $Perm.No)))
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
    (and
      (Set_in (inv@41@01 r) (Set_singleton e@37@01))
      (img@42@01 r)
      (= r (inv@41@01 r)))
    (= (- $Perm.Write (pTaken@43@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@44@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))
      (and (Set_in (inv@41@01 r) (Set_singleton e@37@01)) (img@42@01 r)))
    (=>
      (and (Set_in (inv@41@01 r) (Set_singleton e@37@01)) (img@42@01 r))
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@41@01 r) (Set_singleton e@37@01)) (img@42@01 r))
      (= r e@37@01))
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (function11%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) (Set_singleton e@37@01)))
(pop) ; 3
; Joined path conditions
(assert (forall ((e@40@01 $Ref)) (!
  (=>
    (Set_in e@40@01 (Set_singleton e@37@01))
    (and (= (inv@41@01 e@40@01) e@40@01) (img@42@01 e@40@01)))
  :pattern ((Set_in e@40@01 (Set_singleton e@37@01)))
  :pattern ((inv@41@01 e@40@01))
  :pattern ((img@42@01 e@40@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@42@01 r) (Set_in (inv@41@01 r) (Set_singleton e@37@01)))
    (= (inv@41@01 r) r))
  :pattern ((inv@41@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))
      (and (Set_in (inv@41@01 r) (Set_singleton e@37@01)) (img@42@01 r)))
    (=>
      (and (Set_in (inv@41@01 r) (Set_singleton e@37@01)) (img@42@01 r))
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@41@01 r) (Set_singleton e@37@01)) (img@42@01 r))
      (= r e@37@01))
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@39@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@39@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (function11%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) (Set_singleton e@37@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (function11 ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) (Set_singleton e@37@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (function11 ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) (Set_singleton e@37@01)))
(pop) ; 2
(pop) ; 1
