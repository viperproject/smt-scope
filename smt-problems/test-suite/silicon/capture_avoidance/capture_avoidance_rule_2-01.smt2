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
; ---------- FUNCTION function2----------
(declare-fun y@0@00 () Int)
(declare-fun z@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall x: Int ::x == x && y == z)
(declare-const x@28@00 Int)
(push) ; 2
; [eval] x == x && y == z
; [eval] x == x
(push) ; 3
; [then-branch: 0 | False | live]
; [else-branch: 0 | True | live]
(push) ; 4
; [then-branch: 0 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | True]
; [eval] y == z
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@28@00 Int)) (!
  (= y@0@00 z@1@00)
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@37@12@37@45|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (y@0@00 Int) (z@1@00 Int)) (!
  (= (function2%limited s@$ y@0@00 z@1@00) (function2 s@$ y@0@00 z@1@00))
  :pattern ((function2 s@$ y@0@00 z@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (y@0@00 Int) (z@1@00 Int)) (!
  (function2%stateless y@0@00 z@1@00)
  :pattern ((function2%limited s@$ y@0@00 z@1@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION function7----------
(declare-fun b@3@00 () Bool)
(declare-fun z@4@00 () Int)
(declare-fun result@5@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert b@3@00)
(assert (= ($Snap.second s@$) $Snap.unit))
; [eval] z == 5
(assert (= z@4@00 5))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@3@00 Bool) (z@4@00 Int)) (!
  (= (function7%limited s@$ b@3@00 z@4@00) (function7 s@$ b@3@00 z@4@00))
  :pattern ((function7 s@$ b@3@00 z@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (b@3@00 Bool) (z@4@00 Int)) (!
  (function7%stateless b@3@00 z@4@00)
  :pattern ((function7%limited s@$ b@3@00 z@4@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION function4----------
(declare-fun b@6@00 () Bool)
(declare-fun c@7@00 () Bool)
(declare-fun result@8@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall z: Int ::b && c)
(declare-const z@29@00 Int)
(push) ; 2
; [eval] b && c
(push) ; 3
; [then-branch: 1 | !(b@6@00) | live]
; [else-branch: 1 | b@6@00 | live]
(push) ; 4
; [then-branch: 1 | !(b@6@00)]
(assert (not b@6@00))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | b@6@00]
(assert b@6@00)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or b@6@00 (not b@6@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (or b@6@00 (not b@6@00)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@29@00 Int)) (!
  (and b@6@00 c@7@00)
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@45@12@45@35|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@6@00 Bool) (c@7@00 Bool)) (!
  (= (function4%limited s@$ b@6@00 c@7@00) (function4 s@$ b@6@00 c@7@00))
  :pattern ((function4 s@$ b@6@00 c@7@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (b@6@00 Bool) (c@7@00 Bool)) (!
  (function4%stateless b@6@00 c@7@00)
  :pattern ((function4%limited s@$ b@6@00 c@7@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION function5----------
(declare-fun x@9@00 () Int)
(declare-fun y@10@00 () Int)
(declare-fun result@11@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] x == 0 || y == 0
; [eval] x == 0
(push) ; 2
; [then-branch: 2 | x@9@00 == 0 | live]
; [else-branch: 2 | x@9@00 != 0 | live]
(push) ; 3
; [then-branch: 2 | x@9@00 == 0]
(assert (= x@9@00 0))
(pop) ; 3
(push) ; 3
; [else-branch: 2 | x@9@00 != 0]
(assert (not (= x@9@00 0)))
; [eval] y == 0
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (or (not (= x@9@00 0)) (= x@9@00 0)))
(assert (or (= x@9@00 0) (= y@10@00 0)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (x@9@00 Int) (y@10@00 Int)) (!
  (= (function5%limited s@$ x@9@00 y@10@00) (function5 s@$ x@9@00 y@10@00))
  :pattern ((function5 s@$ x@9@00 y@10@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (x@9@00 Int) (y@10@00 Int)) (!
  (function5%stateless x@9@00 y@10@00)
  :pattern ((function5%limited s@$ x@9@00 y@10@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION function10----------
(declare-fun z@12@00 () Int)
(declare-fun result@13@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (exists x: Int :: x == z ==> x == 0)
(declare-const x@30@00 Int)
(push) ; 2
; [eval] x == z ==> x == 0
; [eval] x == z
(push) ; 3
; [then-branch: 3 | x@30@00 == z@12@00 | live]
; [else-branch: 3 | x@30@00 != z@12@00 | live]
(push) ; 4
; [then-branch: 3 | x@30@00 == z@12@00]
(assert (= x@30@00 z@12@00))
; [eval] x == 0
(pop) ; 4
(push) ; 4
; [else-branch: 3 | x@30@00 != z@12@00]
(assert (not (= x@30@00 z@12@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (= x@30@00 z@12@00)) (= x@30@00 z@12@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (exists ((x@30@00 Int)) (!
  (=> (= x@30@00 z@12@00) (= x@30@00 0))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@70@12@70@46|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (z@12@00 Int)) (!
  (= (function10%limited s@$ z@12@00) (function10 s@$ z@12@00))
  :pattern ((function10 s@$ z@12@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (z@12@00 Int)) (!
  (function10%stateless z@12@00)
  :pattern ((function10%limited s@$ z@12@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION function11----------
(declare-fun s@14@00 () Set<$Ref>)
(declare-fun result@15@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const e@31@00 $Ref)
(push) ; 2
; [eval] (e in s)
(assert (Set_in e@31@00 s@14@00))
(pop) ; 2
(declare-fun inv@32@00 ($Snap Set<$Ref> $Ref) $Ref)
(declare-fun img@33@00 ($Snap Set<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((e1@31@00 $Ref) (e2@31@00 $Ref)) (!
  (=>
    (and
      (Set_in e1@31@00 s@14@00)
      (Set_in e2@31@00 s@14@00)
      (= e1@31@00 e2@31@00))
    (= e1@31@00 e2@31@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((e@31@00 $Ref)) (!
  (=>
    (Set_in e@31@00 s@14@00)
    (and
      (= (inv@32@00 s@$ s@14@00 e@31@00) e@31@00)
      (img@33@00 s@$ s@14@00 e@31@00)))
  :pattern ((Set_in e@31@00 s@14@00))
  :pattern ((inv@32@00 s@$ s@14@00 e@31@00))
  :pattern ((img@33@00 s@$ s@14@00 e@31@00))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@00 s@$ s@14@00 r) (Set_in (inv@32@00 s@$ s@14@00 r) s@14@00))
    (= (inv@32@00 s@$ s@14@00 r) r))
  :pattern ((inv@32@00 s@$ s@14@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((e@31@00 $Ref)) (!
  (=> (Set_in e@31@00 s@14@00) (not (= e@31@00 $Ref.null)))
  :pattern ((Set_in e@31@00 s@14@00))
  :pattern ((inv@32@00 s@$ s@14@00 e@31@00))
  :pattern ((img@33@00 s@$ s@14@00 e@31@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (s@14@00 Set<$Ref>)) (!
  (= (function11%limited s@$ s@14@00) (function11 s@$ s@14@00))
  :pattern ((function11 s@$ s@14@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (s@14@00 Set<$Ref>)) (!
  (function11%stateless s@14@00)
  :pattern ((function11%limited s@$ s@14@00))
  :qid |quant-u-11|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@33@00 s@$ s@14@00 r) (Set_in (inv@32@00 s@$ s@14@00 r) s@14@00))
    (= (inv@32@00 s@$ s@14@00 r) r))
  :pattern ((inv@32@00 s@$ s@14@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((e@31@00 $Ref)) (!
  (=>
    (Set_in e@31@00 s@14@00)
    (and
      (= (inv@32@00 s@$ s@14@00 e@31@00) e@31@00)
      (img@33@00 s@$ s@14@00 e@31@00)))
  :pattern ((Set_in e@31@00 s@14@00))
  :pattern ((inv@32@00 s@$ s@14@00 e@31@00))
  :pattern ((img@33@00 s@$ s@14@00 e@31@00))
  :qid |quant-u-25|)))
(assert (forall ((e@31@00 $Ref)) (!
  (=> (Set_in e@31@00 s@14@00) (not (= e@31@00 $Ref.null)))
  :pattern ((Set_in e@31@00 s@14@00))
  :pattern ((inv@32@00 s@$ s@14@00 e@31@00))
  :pattern ((img@33@00 s@$ s@14@00 e@31@00))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(assert (= result@15@00 true))
(pop) ; 1
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
; ---------- FUNCTION function1----------
(declare-fun z@16@00 () Int)
(declare-fun result@17@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall x: Int ::x == x && z == 0)
(declare-const x@34@00 Int)
(push) ; 2
; [eval] x == x && z == 0
; [eval] x == x
(push) ; 3
; [then-branch: 4 | False | live]
; [else-branch: 4 | True | live]
(push) ; 4
; [then-branch: 4 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | True]
; [eval] z == 0
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@34@00 Int)) (!
  (= z@16@00 0)
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@33@12@33@45|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (z@16@00 Int)) (!
  (= (function1%limited s@$ z@16@00) (function1 s@$ z@16@00))
  :pattern ((function1 s@$ z@16@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (z@16@00 Int)) (!
  (function1%stateless z@16@00)
  :pattern ((function1%limited s@$ z@16@00))
  :qid |quant-u-13|)))
; ---------- FUNCTION function6----------
(declare-fun z@18@00 () Int)
(declare-fun w@19@00 () Int)
(declare-fun result@20@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall x: Int ::x == x && (forall y: Int ::y == y && z == w))
(declare-const x@35@00 Int)
(push) ; 2
; [eval] x == x && (forall y: Int ::y == y && z == w)
; [eval] x == x
(push) ; 3
; [then-branch: 5 | False | live]
; [else-branch: 5 | True | live]
(push) ; 4
; [then-branch: 5 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | True]
; [eval] (forall y: Int ::y == y && z == w)
(declare-const y@36@00 Int)
(push) ; 5
; [eval] y == y && z == w
; [eval] y == y
(push) ; 6
; [then-branch: 6 | False | live]
; [else-branch: 6 | True | live]
(push) ; 7
; [then-branch: 6 | False]
(assert false)
(pop) ; 7
(push) ; 7
; [else-branch: 6 | True]
; [eval] z == w
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@35@00 Int)) (!
  (forall ((y@36@00 Int)) (!
    (= z@18@00 w@19@00)
    
    :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@54@39@54@72|))
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@54@12@54@72|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (z@18@00 Int) (w@19@00 Int)) (!
  (= (function6%limited s@$ z@18@00 w@19@00) (function6 s@$ z@18@00 w@19@00))
  :pattern ((function6 s@$ z@18@00 w@19@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (z@18@00 Int) (w@19@00 Int)) (!
  (function6%stateless z@18@00 w@19@00)
  :pattern ((function6%limited s@$ z@18@00 w@19@00))
  :qid |quant-u-15|)))
; ---------- FUNCTION function0----------
(declare-fun result@21@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall x: Int ::x == x)
(declare-const x@37@00 Int)
(push) ; 2
; [eval] x == x
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (function0%limited s@$) (function0 s@$))
  :pattern ((function0 s@$))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap)) (!
  (as function0%stateless  Bool)
  :pattern ((function0%limited s@$))
  :qid |quant-u-17|)))
; ---------- FUNCTION function8----------
(declare-fun b@22@00 () Bool)
(declare-fun z@23@00 () Int)
(declare-fun result@24@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall x: Int ::b)
(declare-const x@38@00 Int)
(push) ; 2
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@38@00 Int)) (!
  b@22@00
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@62@12@62@30|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@22@00 Bool) (z@23@00 Int)) (!
  (= (function8%limited s@$ b@22@00 z@23@00) (function8 s@$ b@22@00 z@23@00))
  :pattern ((function8 s@$ b@22@00 z@23@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (b@22@00 Bool) (z@23@00 Int)) (!
  (function8%stateless b@22@00 z@23@00)
  :pattern ((function8%limited s@$ b@22@00 z@23@00))
  :qid |quant-u-19|)))
; ---------- FUNCTION function9----------
(declare-fun result@25@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (exists x: Int :: x == x)
(declare-const x@39@00 Int)
(push) ; 2
; [eval] x == x
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 1
(assert (forall ((s@$ $Snap)) (!
  (= (function9%limited s@$) (function9 s@$))
  :pattern ((function9 s@$))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap)) (!
  (as function9%stateless  Bool)
  :pattern ((function9%limited s@$))
  :qid |quant-u-21|)))
; ---------- FUNCTION function3----------
(declare-fun b@26@00 () Bool)
(declare-fun result@27@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ $Snap.unit))
; [eval] (forall z: Int ::b)
(declare-const z@40@00 Int)
(push) ; 2
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@40@00 Int)) (!
  b@26@00
  
  :qid |prog./silicon/silver/src/test/resources/capture_avoidance/capture_avoidance_rule_2.vpr@41@12@41@30|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (b@26@00 Bool)) (!
  (= (function3%limited s@$ b@26@00) (function3 s@$ b@26@00))
  :pattern ((function3 s@$ b@26@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (b@26@00 Bool)) (!
  (function3%stateless b@26@00)
  :pattern ((function3%limited s@$ b@26@00))
  :qid |quant-u-23|)))
