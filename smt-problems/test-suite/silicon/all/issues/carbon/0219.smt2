(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:54
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0219.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Matrix 0)
(declare-sort $FVF<val> 0)
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
(declare-fun $SortWrappers.MatrixTo$Snap (Matrix) $Snap)
(declare-fun $SortWrappers.$SnapToMatrix ($Snap) Matrix)
(assert (forall ((x Matrix)) (!
    (= x ($SortWrappers.$SnapToMatrix($SortWrappers.MatrixTo$Snap x)))
    :pattern (($SortWrappers.MatrixTo$Snap x))
    :qid |$Snap.$SnapToMatrixTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.MatrixTo$Snap($SortWrappers.$SnapToMatrix x)))
    :pattern (($SortWrappers.$SnapToMatrix x))
    :qid |$Snap.MatrixTo$SnapToMatrix|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.$FVF<val>To$Snap ($FVF<val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val> ($Snap) $FVF<val>)
(assert (forall ((x $FVF<val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val>($SortWrappers.$FVF<val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val>To$Snap($SortWrappers.$SnapTo$FVF<val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val> x))
    :qid |$Snap.$FVF<val>To$SnapTo$FVF<val>|
    )))
; ////////// Symbols
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
(declare-fun loc<Ref> (Matrix Int Int) $Ref)
(declare-fun width<Int> (Matrix) Int)
(declare-fun height<Int> (Matrix) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((m Matrix) (i1 Int) (i2 Int) (j1 Int) (j2 Int)) (!
  (=>
    (and
      (>= i1 0)
      (and
        (>= i2 0)
        (and
          (>= j1 0)
          (and
            (>= j2 0)
            (and
              (< i1 (width<Int> m))
              (and
                (< i2 (width<Int> m))
                (and
                  (< j1 (height<Int> m))
                  (and
                    (< j2 (height<Int> m))
                    (or (not (= i1 i2)) (not (= j1 j2)))))))))))
    (not (= (loc<Ref> m i1 j1) (loc<Ref> m i2 j2))))
  :pattern ((loc<Ref> m i1 j1) (loc<Ref> m i2 j2))
  :qid |prog.loc_inject|)))
; /field_value_functions_axioms.smt2 [val: Int]
(assert (forall ((vs $FVF<val>) (ws $FVF<val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val vs) ($FVF.domain_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val vs))
            (= ($FVF.lookup_val vs x) ($FVF.lookup_val ws x)))
          :pattern (($FVF.lookup_val vs x) ($FVF.lookup_val ws x))
          :qid |qp.$FVF<val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val>To$Snap vs)
              ($SortWrappers.$FVF<val>To$Snap ws)
              )
    :qid |qp.$FVF<val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val pm r))
    :pattern (($FVF.perm_val pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
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
; ---------- identity ----------
(declare-const m@0@01 Matrix)
(declare-const m@1@01 Matrix)
(set-option :timeout 0)
(push) ; 1
(declare-const q1@2@01 Int)
(declare-const q2@3@01 Int)
(push) ; 2
; [eval] loc(m, q1, q2)
; [eval] (q2 >= 0 && (q2 < height(m) && (q1 >= 0 && (q2 - height(m) + 1 <= 0 && (q1 < width(m) && q2 == q1)))) ? write : none)
; [eval] q2 >= 0 && (q2 < height(m) && (q1 >= 0 && (q2 - height(m) + 1 <= 0 && (q1 < width(m) && q2 == q1))))
; [eval] q2 >= 0
(push) ; 3
; [then-branch: 0 | !(q2@3@01 >= 0) | live]
; [else-branch: 0 | q2@3@01 >= 0 | live]
(push) ; 4
; [then-branch: 0 | !(q2@3@01 >= 0)]
(assert (not (>= q2@3@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | q2@3@01 >= 0]
(assert (>= q2@3@01 0))
; [eval] q2 < height(m)
; [eval] height(m)
(push) ; 5
; [then-branch: 1 | !(q2@3@01 < height[Int](m@1@01)) | live]
; [else-branch: 1 | q2@3@01 < height[Int](m@1@01) | live]
(push) ; 6
; [then-branch: 1 | !(q2@3@01 < height[Int](m@1@01))]
(assert (not (< q2@3@01 (height<Int> m@1@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | q2@3@01 < height[Int](m@1@01)]
(assert (< q2@3@01 (height<Int> m@1@01)))
; [eval] q1 >= 0
(push) ; 7
; [then-branch: 2 | !(q1@2@01 >= 0) | live]
; [else-branch: 2 | q1@2@01 >= 0 | live]
(push) ; 8
; [then-branch: 2 | !(q1@2@01 >= 0)]
(assert (not (>= q1@2@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | q1@2@01 >= 0]
(assert (>= q1@2@01 0))
; [eval] q2 - height(m) + 1 <= 0
; [eval] q2 - height(m) + 1
; [eval] q2 - height(m)
; [eval] height(m)
(push) ; 9
; [then-branch: 3 | !(q2@3@01 - height[Int](m@1@01) + 1 <= 0) | live]
; [else-branch: 3 | q2@3@01 - height[Int](m@1@01) + 1 <= 0 | live]
(push) ; 10
; [then-branch: 3 | !(q2@3@01 - height[Int](m@1@01) + 1 <= 0)]
(assert (not (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | q2@3@01 - height[Int](m@1@01) + 1 <= 0]
(assert (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0))
; [eval] q1 < width(m)
; [eval] width(m)
(push) ; 11
; [then-branch: 4 | !(q1@2@01 < width[Int](m@1@01)) | live]
; [else-branch: 4 | q1@2@01 < width[Int](m@1@01) | live]
(push) ; 12
; [then-branch: 4 | !(q1@2@01 < width[Int](m@1@01))]
(assert (not (< q1@2@01 (width<Int> m@1@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 4 | q1@2@01 < width[Int](m@1@01)]
(assert (< q1@2@01 (width<Int> m@1@01)))
; [eval] q2 == q1
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< q1@2@01 (width<Int> m@1@01)) (not (< q1@2@01 (width<Int> m@1@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
  (and
    (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
    (or (< q1@2@01 (width<Int> m@1@01)) (not (< q1@2@01 (width<Int> m@1@01)))))))
(assert (or
  (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
  (not (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= q1@2@01 0)
  (and
    (>= q1@2@01 0)
    (=>
      (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
      (and
        (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
        (or
          (< q1@2@01 (width<Int> m@1@01))
          (not (< q1@2@01 (width<Int> m@1@01))))))
    (or
      (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
      (not (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0))))))
(assert (or (>= q1@2@01 0) (not (>= q1@2@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< q2@3@01 (height<Int> m@1@01))
  (and
    (< q2@3@01 (height<Int> m@1@01))
    (=>
      (>= q1@2@01 0)
      (and
        (>= q1@2@01 0)
        (=>
          (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
          (and
            (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
            (or
              (< q1@2@01 (width<Int> m@1@01))
              (not (< q1@2@01 (width<Int> m@1@01))))))
        (or
          (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
          (not (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)))))
    (or (>= q1@2@01 0) (not (>= q1@2@01 0))))))
(assert (or (< q2@3@01 (height<Int> m@1@01)) (not (< q2@3@01 (height<Int> m@1@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= q2@3@01 0)
  (and
    (>= q2@3@01 0)
    (=>
      (< q2@3@01 (height<Int> m@1@01))
      (and
        (< q2@3@01 (height<Int> m@1@01))
        (=>
          (>= q1@2@01 0)
          (and
            (>= q1@2@01 0)
            (=>
              (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
              (and
                (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
                (or
                  (< q1@2@01 (width<Int> m@1@01))
                  (not (< q1@2@01 (width<Int> m@1@01))))))
            (or
              (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
              (not (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)))))
        (or (>= q1@2@01 0) (not (>= q1@2@01 0)))))
    (or (< q2@3@01 (height<Int> m@1@01)) (not (< q2@3@01 (height<Int> m@1@01)))))))
(assert (or (>= q2@3@01 0) (not (>= q2@3@01 0))))
(push) ; 3
; [then-branch: 5 | q2@3@01 >= 0 && q2@3@01 < height[Int](m@1@01) && q1@2@01 >= 0 && q2@3@01 - height[Int](m@1@01) + 1 <= 0 && q1@2@01 < width[Int](m@1@01) && q2@3@01 == q1@2@01 | live]
; [else-branch: 5 | !(q2@3@01 >= 0 && q2@3@01 < height[Int](m@1@01) && q1@2@01 >= 0 && q2@3@01 - height[Int](m@1@01) + 1 <= 0 && q1@2@01 < width[Int](m@1@01) && q2@3@01 == q1@2@01) | live]
(push) ; 4
; [then-branch: 5 | q2@3@01 >= 0 && q2@3@01 < height[Int](m@1@01) && q1@2@01 >= 0 && q2@3@01 - height[Int](m@1@01) + 1 <= 0 && q1@2@01 < width[Int](m@1@01) && q2@3@01 == q1@2@01]
(assert (and
  (>= q2@3@01 0)
  (and
    (< q2@3@01 (height<Int> m@1@01))
    (and
      (>= q1@2@01 0)
      (and
        (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
        (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01)))))))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(q2@3@01 >= 0 && q2@3@01 < height[Int](m@1@01) && q1@2@01 >= 0 && q2@3@01 - height[Int](m@1@01) + 1 <= 0 && q1@2@01 < width[Int](m@1@01) && q2@3@01 == q1@2@01)]
(assert (not
  (and
    (>= q2@3@01 0)
    (and
      (< q2@3@01 (height<Int> m@1@01))
      (and
        (>= q1@2@01 0)
        (and
          (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
          (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= q2@3@01 0)
    (and
      (< q2@3@01 (height<Int> m@1@01))
      (and
        (>= q1@2@01 0)
        (and
          (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
          (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))
  (and
    (>= q2@3@01 0)
    (< q2@3@01 (height<Int> m@1@01))
    (>= q1@2@01 0)
    (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
    (< q1@2@01 (width<Int> m@1@01))
    (= q2@3@01 q1@2@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= q2@3@01 0)
      (and
        (< q2@3@01 (height<Int> m@1@01))
        (and
          (>= q1@2@01 0)
          (and
            (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
            (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01)))))))
  (and
    (>= q2@3@01 0)
    (and
      (< q2@3@01 (height<Int> m@1@01))
      (and
        (>= q1@2@01 0)
        (and
          (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
          (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))))
(pop) ; 2
(declare-const $t@4@01 $FVF<val>)
(declare-fun inv@5@01 ($Ref) Int)
(declare-fun img@6@01 ($Ref) Bool)
(declare-fun inv@7@01 ($Ref) Int)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((q1@2@01 Int) (q2@3@01 Int)) (!
  (and
    (=>
      (>= q2@3@01 0)
      (and
        (>= q2@3@01 0)
        (=>
          (< q2@3@01 (height<Int> m@1@01))
          (and
            (< q2@3@01 (height<Int> m@1@01))
            (=>
              (>= q1@2@01 0)
              (and
                (>= q1@2@01 0)
                (=>
                  (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
                  (and
                    (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
                    (or
                      (< q1@2@01 (width<Int> m@1@01))
                      (not (< q1@2@01 (width<Int> m@1@01))))))
                (or
                  (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
                  (not (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)))))
            (or (>= q1@2@01 0) (not (>= q1@2@01 0)))))
        (or
          (< q2@3@01 (height<Int> m@1@01))
          (not (< q2@3@01 (height<Int> m@1@01))))))
    (or (>= q2@3@01 0) (not (>= q2@3@01 0)))
    (=>
      (and
        (>= q2@3@01 0)
        (and
          (< q2@3@01 (height<Int> m@1@01))
          (and
            (>= q1@2@01 0)
            (and
              (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
              (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))
      (and
        (>= q2@3@01 0)
        (< q2@3@01 (height<Int> m@1@01))
        (>= q1@2@01 0)
        (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
        (< q1@2@01 (width<Int> m@1@01))
        (= q2@3@01 q1@2@01)))
    (or
      (not
        (and
          (>= q2@3@01 0)
          (and
            (< q2@3@01 (height<Int> m@1@01))
            (and
              (>= q1@2@01 0)
              (and
                (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
                (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01)))))))
      (and
        (>= q2@3@01 0)
        (and
          (< q2@3@01 (height<Int> m@1@01))
          (and
            (>= q1@2@01 0)
            (and
              (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
              (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))))
  :pattern ((loc<Ref> m@1@01 q1@2@01 q2@3@01))
  :qid |val-aux|)))
(push) ; 2
(assert (not (forall ((q1@2@01 Int) (q2@3@01 Int)) (!
  (or
    (=
      (ite
        (and
          (>= q2@3@01 0)
          (and
            (< q2@3@01 (height<Int> m@1@01))
            (and
              (>= q1@2@01 0)
              (and
                (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
                (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))
        $Perm.Write
        $Perm.No)
      $Perm.No)
    (and
      (>= q2@3@01 0)
      (and
        (< q2@3@01 (height<Int> m@1@01))
        (and
          (>= q1@2@01 0)
          (and
            (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
            (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01)))))))
  
  :qid |quant-u-0|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((q11@2@01 Int) (q21@3@01 Int) (q12@2@01 Int) (q22@3@01 Int)) (!
  (=>
    (and
      (and
        (>= q21@3@01 0)
        (and
          (< q21@3@01 (height<Int> m@1@01))
          (and
            (>= q11@2@01 0)
            (and
              (<= (+ (- q21@3@01 (height<Int> m@1@01)) 1) 0)
              (and (< q11@2@01 (width<Int> m@1@01)) (= q21@3@01 q11@2@01))))))
      (and
        (>= q22@3@01 0)
        (and
          (< q22@3@01 (height<Int> m@1@01))
          (and
            (>= q12@2@01 0)
            (and
              (<= (+ (- q22@3@01 (height<Int> m@1@01)) 1) 0)
              (and (< q12@2@01 (width<Int> m@1@01)) (= q22@3@01 q12@2@01))))))
      (= (loc<Ref> m@1@01 q11@2@01 q21@3@01) (loc<Ref> m@1@01 q12@2@01 q22@3@01)))
    (and (= q11@2@01 q12@2@01) (= q21@3@01 q22@3@01)))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((q1@2@01 Int) (q2@3@01 Int)) (!
  (=>
    (and
      (>= q2@3@01 0)
      (and
        (< q2@3@01 (height<Int> m@1@01))
        (and
          (>= q1@2@01 0)
          (and
            (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
            (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))
    (and
      (and
        (= (inv@5@01 (loc<Ref> m@1@01 q1@2@01 q2@3@01)) q1@2@01)
        (= (inv@7@01 (loc<Ref> m@1@01 q1@2@01 q2@3@01)) q2@3@01))
      (and
        (img@6@01 (loc<Ref> m@1@01 q1@2@01 q2@3@01))
        (img@8@01 (loc<Ref> m@1@01 q1@2@01 q2@3@01)))))
  :pattern ((loc<Ref> m@1@01 q1@2@01 q2@3@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (img@6@01 r) (img@8@01 r))
      (and
        (>= (inv@7@01 r) 0)
        (and
          (< (inv@7@01 r) (height<Int> m@1@01))
          (and
            (>= (inv@5@01 r) 0)
            (and
              (<= (+ (- (inv@7@01 r) (height<Int> m@1@01)) 1) 0)
              (and
                (< (inv@5@01 r) (width<Int> m@1@01))
                (= (inv@7@01 r) (inv@5@01 r))))))))
    (= (loc<Ref> m@1@01 (inv@5@01 r) (inv@7@01 r)) r))
  :pattern ((inv@5@01 r))
  :pattern ((inv@7@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((q1@2@01 Int) (q2@3@01 Int)) (!
  (<=
    $Perm.No
    (ite
      (and
        (>= q2@3@01 0)
        (and
          (< q2@3@01 (height<Int> m@1@01))
          (and
            (>= q1@2@01 0)
            (and
              (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
              (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))
      $Perm.Write
      $Perm.No))
  :pattern ((loc<Ref> m@1@01 q1@2@01 q2@3@01))
  :qid |val-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((q1@2@01 Int) (q2@3@01 Int)) (!
  (<=
    (ite
      (and
        (>= q2@3@01 0)
        (and
          (< q2@3@01 (height<Int> m@1@01))
          (and
            (>= q1@2@01 0)
            (and
              (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
              (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))
      $Perm.Write
      $Perm.No)
    $Perm.Write)
  :pattern ((loc<Ref> m@1@01 q1@2@01 q2@3@01))
  :qid |val-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((q1@2@01 Int) (q2@3@01 Int)) (!
  (=>
    (and
      (>= q2@3@01 0)
      (and
        (< q2@3@01 (height<Int> m@1@01))
        (and
          (>= q1@2@01 0)
          (and
            (<= (+ (- q2@3@01 (height<Int> m@1@01)) 1) 0)
            (and (< q1@2@01 (width<Int> m@1@01)) (= q2@3@01 q1@2@01))))))
    (not (= (loc<Ref> m@1@01 q1@2@01 q2@3@01) $Ref.null)))
  :pattern ((loc<Ref> m@1@01 q1@2@01 q2@3@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
