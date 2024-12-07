(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:47
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr
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
(declare-sort HeapMatrix 0)
(declare-sort Matrix 0)
(declare-sort $FVF<f> 0)
(declare-sort $FVF<cell_value> 0)
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
(declare-fun $SortWrappers.HeapMatrixTo$Snap (HeapMatrix) $Snap)
(declare-fun $SortWrappers.$SnapToHeapMatrix ($Snap) HeapMatrix)
(assert (forall ((x HeapMatrix)) (!
    (= x ($SortWrappers.$SnapToHeapMatrix($SortWrappers.HeapMatrixTo$Snap x)))
    :pattern (($SortWrappers.HeapMatrixTo$Snap x))
    :qid |$Snap.$SnapToHeapMatrixTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.HeapMatrixTo$Snap($SortWrappers.$SnapToHeapMatrix x)))
    :pattern (($SortWrappers.$SnapToHeapMatrix x))
    :qid |$Snap.HeapMatrixTo$SnapToHeapMatrix|
    )))
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
(declare-fun $SortWrappers.$FVF<cell_value>To$Snap ($FVF<cell_value>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<cell_value> ($Snap) $FVF<cell_value>)
(assert (forall ((x $FVF<cell_value>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<cell_value>($SortWrappers.$FVF<cell_value>To$Snap x)))
    :pattern (($SortWrappers.$FVF<cell_value>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<cell_value>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<cell_value>To$Snap($SortWrappers.$SnapTo$FVF<cell_value> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<cell_value> x))
    :qid |$Snap.$FVF<cell_value>To$SnapTo$FVF<cell_value>|
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
(declare-fun loc<Ref> (HeapMatrix Int Int) $Ref)
(declare-fun height<Int> (HeapMatrix) Int)
(declare-fun width<Int> (HeapMatrix) Int)
(declare-fun hm_in_range<Bool> (HeapMatrix Int Int) Bool)
(declare-fun rev_loc_hm<HeapMatrix> ($Ref) HeapMatrix)
(declare-fun rev_loc_i<Int> ($Ref) Int)
(declare-fun rev_loc_j<Int> ($Ref) Int)
(declare-fun hm2set<Set<Ref>> (HeapMatrix) Set<$Ref>)
(declare-fun get<Int> (Matrix Int Int) Int)
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /field_value_functions_declarations.smt2 [cell_value: Int]
(declare-fun $FVF.domain_cell_value ($FVF<cell_value>) Set<$Ref>)
(declare-fun $FVF.lookup_cell_value ($FVF<cell_value> $Ref) Int)
(declare-fun $FVF.after_cell_value ($FVF<cell_value> $FVF<cell_value>) Bool)
(declare-fun $FVF.loc_cell_value (Int $Ref) Bool)
(declare-fun $FVF.perm_cell_value ($FPM $Ref) $Perm)
(declare-const $fvfTOP_cell_value $FVF<cell_value>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun bar01 ($Snap Set<$Ref> Int) Bool)
(declare-fun bar01%limited ($Snap Set<$Ref> Int) Bool)
(declare-fun bar01%stateless (Set<$Ref> Int) Bool)
(declare-fun bar01%precondition ($Snap Set<$Ref> Int) Bool)
(declare-fun fun01 ($Snap Set<$Ref> Int) Bool)
(declare-fun fun01%limited ($Snap Set<$Ref> Int) Bool)
(declare-fun fun01%stateless (Set<$Ref> Int) Bool)
(declare-fun fun01%precondition ($Snap Set<$Ref> Int) Bool)
(declare-fun bar02 ($Snap Set<$Ref> Int) Int)
(declare-fun bar02%limited ($Snap Set<$Ref> Int) Int)
(declare-fun bar02%stateless (Set<$Ref> Int) Bool)
(declare-fun bar02%precondition ($Snap Set<$Ref> Int) Bool)
(declare-fun foo ($Snap Set<$Ref> Int) Bool)
(declare-fun foo%limited ($Snap Set<$Ref> Int) Bool)
(declare-fun foo%stateless (Set<$Ref> Int) Bool)
(declare-fun foo%precondition ($Snap Set<$Ref> Int) Bool)
(declare-fun fun02 ($Snap Set<$Ref> Int) Bool)
(declare-fun fun02%limited ($Snap Set<$Ref> Int) Bool)
(declare-fun fun02%stateless (Set<$Ref> Int) Bool)
(declare-fun fun02%precondition ($Snap Set<$Ref> Int) Bool)
(declare-fun hm2m ($Snap HeapMatrix) Matrix)
(declare-fun hm2m%limited ($Snap HeapMatrix) Matrix)
(declare-fun hm2m%stateless (HeapMatrix) Bool)
(declare-fun hm2m%precondition ($Snap HeapMatrix) Bool)
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
(assert (forall ((hm HeapMatrix)) (!
  (>= (height<Int> hm) 0)
  :pattern ((height<Int> hm))
  :qid |prog.heapmat_height|)))
(assert (forall ((hm HeapMatrix)) (!
  (>= (width<Int> hm) 0)
  :pattern ((width<Int> hm))
  :qid |prog.heapmat_width|)))
(assert (forall ((hm HeapMatrix) (i Int) (j Int)) (!
  (and
    (= (rev_loc_hm<HeapMatrix> (loc<Ref> hm i j)) hm)
    (and
      (= (rev_loc_i<Int> (loc<Ref> hm i j)) i)
      (= (rev_loc_j<Int> (loc<Ref> hm i j)) j)))
  :pattern ((loc<Ref> hm i j))
  :qid |prog.heapmat_injectivity|)))
(assert (forall ((hm HeapMatrix) (i Int) (j Int)) (!
  (=
    (hm_in_range<Bool> hm i j)
    (and
      (<= 0 i)
      (and (< i (height<Int> hm)) (and (<= 0 j) (< j (width<Int> hm))))))
  :pattern ((hm_in_range<Bool> hm i j))
  :qid |prog.heapmat_in_range|)))
(assert (forall ((hm HeapMatrix) (i Int) (j Int)) (!
  (= (hm_in_range<Bool> hm i j) (Set_in (loc<Ref> hm i j) (hm2set<Set<Ref>> hm)))
  :pattern ((loc<Ref> hm i j))
  :qid |prog.heapmat_to_set|)))
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
; /field_value_functions_axioms.smt2 [cell_value: Int]
(assert (forall ((vs $FVF<cell_value>) (ws $FVF<cell_value>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_cell_value vs) ($FVF.domain_cell_value ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_cell_value vs))
            (= ($FVF.lookup_cell_value vs x) ($FVF.lookup_cell_value ws x)))
          :pattern (($FVF.lookup_cell_value vs x) ($FVF.lookup_cell_value ws x))
          :qid |qp.$FVF<cell_value>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<cell_value>To$Snap vs)
              ($SortWrappers.$FVF<cell_value>To$Snap ws)
              )
    :qid |qp.$FVF<cell_value>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_cell_value pm r))
    :pattern (($FVF.perm_cell_value pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_cell_value f r) true)
    :pattern (($FVF.loc_cell_value f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@18@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@19@00 ($Snap Set<$Ref> Int $Ref) Bool)
(declare-fun inv@21@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@22@00 ($Snap Set<$Ref> Int $Ref) Bool)
(declare-fun inv@24@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@25@00 ($Snap Set<$Ref> Int $Ref) Bool)
(declare-fun inv@27@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@28@00 ($Snap Set<$Ref> Int $Ref) Bool)
(declare-fun inv@30@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@31@00 ($Snap Set<$Ref> Int $Ref) Bool)
(declare-fun inv@33@00 ($Snap HeapMatrix $Ref) $Ref)
(declare-fun img@34@00 ($Snap HeapMatrix $Ref) Bool)
(declare-fun sm@35@00 ($Snap HeapMatrix) $FVF<cell_value>)
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (i@1@00 Int)) (!
  (= (bar01%limited s@$ xs@0@00 i@1@00) (bar01 s@$ xs@0@00 i@1@00))
  :pattern ((bar01 s@$ xs@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (i@1@00 Int)) (!
  (bar01%stateless xs@0@00 i@1@00)
  :pattern ((bar01%limited s@$ xs@0@00 i@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (i@4@00 Int)) (!
  (= (fun01%limited s@$ xs@3@00 i@4@00) (fun01 s@$ xs@3@00 i@4@00))
  :pattern ((fun01 s@$ xs@3@00 i@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (i@4@00 Int)) (!
  (fun01%stateless xs@3@00 i@4@00)
  :pattern ((fun01%limited s@$ xs@3@00 i@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@6@00 Set<$Ref>) (i@7@00 Int)) (!
  (= (bar02%limited s@$ xs@6@00 i@7@00) (bar02 s@$ xs@6@00 i@7@00))
  :pattern ((bar02 s@$ xs@6@00 i@7@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@6@00 Set<$Ref>) (i@7@00 Int)) (!
  (bar02%stateless xs@6@00 i@7@00)
  :pattern ((bar02%limited s@$ xs@6@00 i@7@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (xs@9@00 Set<$Ref>) (i@10@00 Int)) (!
  (= (foo%limited s@$ xs@9@00 i@10@00) (foo s@$ xs@9@00 i@10@00))
  :pattern ((foo s@$ xs@9@00 i@10@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@9@00 Set<$Ref>) (i@10@00 Int)) (!
  (foo%stateless xs@9@00 i@10@00)
  :pattern ((foo%limited s@$ xs@9@00 i@10@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Set<$Ref>) (i@13@00 Int)) (!
  (= (fun02%limited s@$ xs@12@00 i@13@00) (fun02 s@$ xs@12@00 i@13@00))
  :pattern ((fun02 s@$ xs@12@00 i@13@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Set<$Ref>) (i@13@00 Int)) (!
  (fun02%stateless xs@12@00 i@13@00)
  :pattern ((fun02%limited s@$ xs@12@00 i@13@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (hm@15@00 HeapMatrix)) (!
  (= (hm2m%limited s@$ hm@15@00) (hm2m s@$ hm@15@00))
  :pattern ((hm2m s@$ hm@15@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (hm@15@00 HeapMatrix)) (!
  (hm2m%stateless hm@15@00)
  :pattern ((hm2m%limited s@$ hm@15@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (hm@15@00 HeapMatrix)) (!
  (let ((result@16@00 (hm2m%limited s@$ hm@15@00))) (and
    (forall ((cell@32@00 $Ref)) (!
      (=>
        (Set_in cell@32@00 (hm2set<Set<Ref>> hm@15@00))
        (and
          (= (inv@33@00 s@$ hm@15@00 cell@32@00) cell@32@00)
          (img@34@00 s@$ hm@15@00 cell@32@00)))
      :pattern ((Set_in cell@32@00 (hm2set<Set<Ref>> hm@15@00)))
      :pattern ((inv@33@00 s@$ hm@15@00 cell@32@00))
      :pattern ((img@34@00 s@$ hm@15@00 cell@32@00))
      :qid |quant-u-23|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@34@00 s@$ hm@15@00 r)
          (Set_in (inv@33@00 s@$ hm@15@00 r) (hm2set<Set<Ref>> hm@15@00)))
        (= (inv@33@00 s@$ hm@15@00 r) r))
      :pattern ((inv@33@00 s@$ hm@15@00 r))
      :qid |cell_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@34@00 s@$ hm@15@00 r)
          (Set_in (inv@33@00 s@$ hm@15@00 r) (hm2set<Set<Ref>> hm@15@00)))
        (=
          ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r)
          ($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r)))
      :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r))
      :pattern (($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      ($FVF.loc_cell_value ($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r) r)
      :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r))
      :qid |qp.fvfResTrgDef1|))
    (=>
      (hm2m%precondition s@$ hm@15@00)
      (forall ((i Int) (j Int)) (!
        (=>
          (hm_in_range<Bool> hm@15@00 i j)
          (=
            (get<Int> result@16@00 i j)
            ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i j))))
        :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i j)))
        :pattern ((get<Int> result@16@00 i j))
        )))))
  :pattern ((hm2m%limited s@$ hm@15@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (hm@15@00 HeapMatrix)) (!
  (let ((result@16@00 (hm2m%limited s@$ hm@15@00))) true)
  :pattern ((hm2m%limited s@$ hm@15@00))
  :qid |quant-u-26|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test ----------
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
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@2@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@2@01 xs@1@01))
(pop) ; 3
(declare-const $t@3@01 $FVF<f>)
(declare-fun inv@4@01 ($Ref) $Ref)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@2@01 $Ref) (x2@2@01 $Ref)) (!
  (=>
    (and (Set_in x1@2@01 xs@1@01) (Set_in x2@2@01 xs@1@01) (= x1@2@01 x2@2@01))
    (= x1@2@01 x2@2@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@2@01 $Ref)) (!
  (=>
    (Set_in x@2@01 xs@1@01)
    (and (= (inv@4@01 x@2@01) x@2@01) (img@5@01 x@2@01)))
  :pattern ((Set_in x@2@01 xs@1@01))
  :pattern ((inv@4@01 x@2@01))
  :pattern ((img@5@01 x@2@01))
  :qid |quant-u-28|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) (= (inv@4@01 r) r))
  :pattern ((inv@4@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@2@01 $Ref)) (!
  (=> (Set_in x@2@01 xs@1@01) (not (= x@2@01 $Ref.null)))
  :pattern ((Set_in x@2@01 xs@1@01))
  :pattern ((inv@4@01 x@2@01))
  :pattern ((img@5@01 x@2@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int :: { foo(xs, i) } foo(xs, i))
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 $Snap.unit))
; [eval] (forall i: Int :: { foo(xs, i) } foo(xs, i))
(declare-const i@7@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] foo(xs, i)
(push) ; 4
(declare-const x@8@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@8@01 xs@1@01))
(pop) ; 5
(declare-fun inv@9@01 ($Ref) $Ref)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@8@01 $Ref) (x2@8@01 $Ref)) (!
  (=>
    (and (Set_in x1@8@01 xs@1@01) (Set_in x2@8@01 xs@1@01) (= x1@8@01 x2@8@01))
    (= x1@8@01 x2@8@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (Set_in x@8@01 xs@1@01)
    (and (= (inv@9@01 x@8@01) x@8@01) (img@10@01 x@8@01)))
  :pattern ((Set_in x@8@01 xs@1@01))
  :pattern ((inv@9@01 x@8@01))
  :pattern ((img@10@01 x@8@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@10@01 r) (Set_in (inv@9@01 r) xs@1@01)) (= (inv@9@01 r) r))
  :pattern ((inv@9@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@11@01 ((r $Ref) (i@7@01 Int)) $Perm
  (ite
    (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r) (= r (inv@9@01 r)))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) $Perm.Write $Perm.No)
      (pTaken@11@01 r i@7@01))
    $Perm.No)
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r) (= r (inv@9@01 r)))
    (= (- $Perm.Write (pTaken@11@01 r i@7@01)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@12@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>)))
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r)))
    (=>
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r))
      (Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r))
      (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)))
    (= ($FVF.lookup_f (as sm@12@01  $FVF<f>) r) ($FVF.lookup_f $t@3@01 r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@3@01 r))
  :qid |qp.fvfValDef0|)))
(assert (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@12@01  $FVF<f>)) xs@1@01 i@7@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (Set_in x@8@01 xs@1@01)
    (and (= (inv@9@01 x@8@01) x@8@01) (img@10@01 x@8@01)))
  :pattern ((Set_in x@8@01 xs@1@01))
  :pattern ((inv@9@01 x@8@01))
  :pattern ((img@10@01 x@8@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@10@01 r) (Set_in (inv@9@01 r) xs@1@01)) (= (inv@9@01 r) r))
  :pattern ((inv@9@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>)))
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r)))
    (=>
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r))
      (Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r))
      (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)))
    (= ($FVF.lookup_f (as sm@12@01  $FVF<f>) r) ($FVF.lookup_f $t@3@01 r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@3@01 r))
  :qid |qp.fvfValDef0|)))
(assert (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@12@01  $FVF<f>)) xs@1@01 i@7@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x@8@01 $Ref)) (!
  (=>
    (Set_in x@8@01 xs@1@01)
    (and (= (inv@9@01 x@8@01) x@8@01) (img@10@01 x@8@01)))
  :pattern ((Set_in x@8@01 xs@1@01))
  :pattern ((inv@9@01 x@8@01))
  :pattern ((img@10@01 x@8@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@10@01 r) (Set_in (inv@9@01 r) xs@1@01)) (= (inv@9@01 r) r))
  :pattern ((inv@9@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>)))
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r)))
    (=>
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r))
      (Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@12@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@9@01 r) xs@1@01) (img@10@01 r))
      (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)))
    (= ($FVF.lookup_f (as sm@12@01  $FVF<f>) r) ($FVF.lookup_f $t@3@01 r)))
  :pattern (($FVF.lookup_f (as sm@12@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@3@01 r))
  :qid |qp.fvfValDef0|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int)) (!
  (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@12@01  $FVF<f>)) xs@1@01 i@7@01)
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@12@01  $FVF<f>)) xs@1@01 i@7@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@11@10@11@37-aux|)))
(assert (forall ((i@7@01 Int)) (!
  (foo ($SortWrappers.$FVF<f>To$Snap (as sm@12@01  $FVF<f>)) xs@1@01 i@7@01)
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@12@01  $FVF<f>)) xs@1@01 i@7@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@11@10@11@37|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall i: Int :: { foo(xs, i) } foo(xs, i))
; [eval] (forall i: Int :: { foo(xs, i) } foo(xs, i))
(declare-const i@13@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] foo(xs, i)
(push) ; 4
(declare-const x@14@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@14@01 xs@1@01))
(pop) ; 5
(declare-fun inv@15@01 ($Ref) $Ref)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@14@01 $Ref) (x2@14@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@14@01 xs@1@01)
      (Set_in x2@14@01 xs@1@01)
      (= x1@14@01 x2@14@01))
    (= x1@14@01 x2@14@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@14@01 $Ref)) (!
  (=>
    (Set_in x@14@01 xs@1@01)
    (and (= (inv@15@01 x@14@01) x@14@01) (img@16@01 x@14@01)))
  :pattern ((Set_in x@14@01 xs@1@01))
  :pattern ((inv@15@01 x@14@01))
  :pattern ((img@16@01 x@14@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref) (i@13@01 Int)) $Perm
  (ite
    (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r) (= r (inv@15@01 r)))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)) $Perm.Write $Perm.No)
      (pTaken@17@01 r i@13@01))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r) (= r (inv@15@01 r)))
    (= (- $Perm.Write (pTaken@17@01 r i@13@01)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@18@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>)))
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r)))
    (=>
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r))
      (Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r))
      (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)))
    (= ($FVF.lookup_f (as sm@18@01  $FVF<f>) r) ($FVF.lookup_f $t@3@01 r)))
  :pattern (($FVF.lookup_f (as sm@18@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@3@01 r))
  :qid |qp.fvfValDef2|)))
(assert (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@14@01 $Ref)) (!
  (=>
    (Set_in x@14@01 xs@1@01)
    (and (= (inv@15@01 x@14@01) x@14@01) (img@16@01 x@14@01)))
  :pattern ((Set_in x@14@01 xs@1@01))
  :pattern ((inv@15@01 x@14@01))
  :pattern ((img@16@01 x@14@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>)))
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r)))
    (=>
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r))
      (Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r))
      (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)))
    (= ($FVF.lookup_f (as sm@18@01  $FVF<f>) r) ($FVF.lookup_f $t@3@01 r)))
  :pattern (($FVF.lookup_f (as sm@18@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@3@01 r))
  :qid |qp.fvfValDef2|)))
(assert (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x@14@01 $Ref)) (!
  (=>
    (Set_in x@14@01 xs@1@01)
    (and (= (inv@15@01 x@14@01) x@14@01) (img@16@01 x@14@01)))
  :pattern ((Set_in x@14@01 xs@1@01))
  :pattern ((inv@15@01 x@14@01))
  :pattern ((img@16@01 x@14@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@16@01 r) (Set_in (inv@15@01 r) xs@1@01)) (= (inv@15@01 r) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>)))
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r)))
    (=>
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r))
      (Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@18@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@15@01 r) xs@1@01) (img@16@01 r))
      (and (img@5@01 r) (Set_in (inv@4@01 r) xs@1@01)))
    (= ($FVF.lookup_f (as sm@18@01  $FVF<f>) r) ($FVF.lookup_f $t@3@01 r)))
  :pattern (($FVF.lookup_f (as sm@18@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@3@01 r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@13@01 Int)) (!
  (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01)
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@12@10@12@37-aux|)))
(assert (forall ((i@13@01 Int)) (!
  (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01)
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@12@10@12@37_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((i@13@01 Int)) (!
  (=>
    (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01)
    (foo ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01))
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@12@10@12@37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@13@01 Int)) (!
  (foo ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01)
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@18@01  $FVF<f>)) xs@1@01 i@13@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@12@10@12@37|)))
(pop) ; 2
(pop) ; 1
; ---------- test10 ----------
(declare-const xs@19@01 Set<$Ref>)
(declare-const ys@20@01 Set<$Ref>)
(declare-const xs@21@01 Set<$Ref>)
(declare-const ys@22@01 Set<$Ref>)
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
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@23@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@23@01 xs@21@01))
(pop) ; 3
(declare-const $t@24@01 $FVF<f>)
(declare-fun inv@25@01 ($Ref) $Ref)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@23@01 $Ref) (x2@23@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@23@01 xs@21@01)
      (Set_in x2@23@01 xs@21@01)
      (= x1@23@01 x2@23@01))
    (= x1@23@01 x2@23@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@23@01 $Ref)) (!
  (=>
    (Set_in x@23@01 xs@21@01)
    (and (= (inv@25@01 x@23@01) x@23@01) (img@26@01 x@23@01)))
  :pattern ((Set_in x@23@01 xs@21@01))
  :pattern ((inv@25@01 x@23@01))
  :pattern ((img@26@01 x@23@01))
  :qid |quant-u-38|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)) (= (inv@25@01 r) r))
  :pattern ((inv@25@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@23@01 $Ref)) (!
  (=> (Set_in x@23@01 xs@21@01) (not (= x@23@01 $Ref.null)))
  :pattern ((Set_in x@23@01 xs@21@01))
  :pattern ((inv@25@01 x@23@01))
  :pattern ((img@26@01 x@23@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x$0: Ref ::(x$0 in ys) ==> acc(x$0.f, write))
(declare-const x$0@27@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x$0 in ys)
(assert (Set_in x$0@27@01 ys@22@01))
(pop) ; 3
(declare-const $t@28@01 $FVF<f>)
(declare-fun inv@29@01 ($Ref) $Ref)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x$01@27@01 $Ref) (x$02@27@01 $Ref)) (!
  (=>
    (and
      (Set_in x$01@27@01 ys@22@01)
      (Set_in x$02@27@01 ys@22@01)
      (= x$01@27@01 x$02@27@01))
    (= x$01@27@01 x$02@27@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x$0@27@01 $Ref)) (!
  (=>
    (Set_in x$0@27@01 ys@22@01)
    (and (= (inv@29@01 x$0@27@01) x$0@27@01) (img@30@01 x$0@27@01)))
  :pattern ((Set_in x$0@27@01 ys@22@01))
  :pattern ((inv@29@01 x$0@27@01))
  :pattern ((img@30@01 x$0@27@01))
  :qid |quant-u-40|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)) (= (inv@29@01 r) r))
  :pattern ((inv@29@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x$0@27@01 $Ref)) (!
  (=> (Set_in x$0@27@01 ys@22@01) (not (= x$0@27@01 $Ref.null)))
  :pattern ((Set_in x$0@27@01 ys@22@01))
  :pattern ((inv@29@01 x$0@27@01))
  :pattern ((img@30@01 x$0@27@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= x$0@27@01 x@23@01)
    (=
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::
;     { fun01(xs, j) }
;     { fun02(ys, j) }
;     fun01(xs, j) == fun02(ys, j))
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 $Snap.unit))
; [eval] (forall j: Int :: { fun01(xs, j) } { fun02(ys, j) } fun01(xs, j) == fun02(ys, j))
(declare-const j@32@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] fun01(xs, j) == fun02(ys, j)
; [eval] fun01(xs, j)
(push) ; 4
(declare-const x@33@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@33@01 xs@21@01))
(pop) ; 5
(declare-fun inv@34@01 ($Ref) $Ref)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@33@01 $Ref) (x2@33@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@33@01 xs@21@01)
      (Set_in x2@33@01 xs@21@01)
      (= x1@33@01 x2@33@01))
    (= x1@33@01 x2@33@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (Set_in x@33@01 xs@21@01)
    (and (= (inv@34@01 x@33@01) x@33@01) (img@35@01 x@33@01)))
  :pattern ((Set_in x@33@01 xs@21@01))
  :pattern ((inv@34@01 x@33@01))
  :pattern ((img@35@01 x@33@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@35@01 r) (Set_in (inv@34@01 r) xs@21@01)) (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref) (j@32@01 Int)) $Perm
  (ite
    (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r) (= r (inv@34@01 r)))
    ($Perm.min
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@37@01 ((r $Ref) (j@32@01 Int)) $Perm
  (ite
    (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r) (= r (inv@34@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@36@01 r j@32@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@36@01 r j@32@01))
    $Perm.No)
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r) (= r (inv@34@01 r)))
    (= (- $Perm.Write (pTaken@36@01 r j@32@01)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@38@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>)))
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r)))
    (=>
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>))))
  :qid |qp.fvfDomDef6|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@38@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@38@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef5|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@38@01  $FVF<f>)) xs@21@01 j@32@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (Set_in x@33@01 xs@21@01)
    (and (= (inv@34@01 x@33@01) x@33@01) (img@35@01 x@33@01)))
  :pattern ((Set_in x@33@01 xs@21@01))
  :pattern ((inv@34@01 x@33@01))
  :pattern ((img@35@01 x@33@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@35@01 r) (Set_in (inv@34@01 r) xs@21@01)) (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>)))
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r)))
    (=>
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>))))
  :qid |qp.fvfDomDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@38@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@38@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef5|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@38@01  $FVF<f>)) xs@21@01 j@32@01))
; [eval] fun02(ys, j)
(set-option :timeout 0)
(push) ; 4
(declare-const x@39@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@39@01 ys@22@01))
(pop) ; 5
(declare-fun inv@40@01 ($Ref) $Ref)
(declare-fun img@41@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@39@01 $Ref) (x2@39@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@39@01 ys@22@01)
      (Set_in x2@39@01 ys@22@01)
      (= x1@39@01 x2@39@01))
    (= x1@39@01 x2@39@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@39@01 $Ref)) (!
  (=>
    (Set_in x@39@01 ys@22@01)
    (and (= (inv@40@01 x@39@01) x@39@01) (img@41@01 x@39@01)))
  :pattern ((Set_in x@39@01 ys@22@01))
  :pattern ((inv@40@01 x@39@01))
  :pattern ((img@41@01 x@39@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@41@01 r) (Set_in (inv@40@01 r) ys@22@01)) (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@42@01 ((r $Ref) (j@32@01 Int)) $Perm
  (ite
    (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r) (= r (inv@40@01 r)))
    ($Perm.min
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@43@01 ((r $Ref) (j@32@01 Int)) $Perm
  (ite
    (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r) (= r (inv@40@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@42@01 r j@32@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@42@01 r j@32@01))
    $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@42@01 r j@32@01) $Perm.No)
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r) (= r (inv@40@01 r)))
    (= (- $Perm.Write (pTaken@42@01 r j@32@01)) $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
        $Perm.Write
        $Perm.No)
      (pTaken@43@01 r j@32@01))
    $Perm.No)
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@43@01 r j@32@01) $Perm.No)
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r) (= r (inv@40@01 r)))
    (=
      (- (- $Perm.Write (pTaken@42@01 r j@32@01)) (pTaken@43@01 r j@32@01))
      $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 5
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
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r)))
    (=>
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>))))
  :qid |qp.fvfDomDef9|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef8|)))
(assert (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) ys@22@01 j@32@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@39@01 $Ref)) (!
  (=>
    (Set_in x@39@01 ys@22@01)
    (and (= (inv@40@01 x@39@01) x@39@01) (img@41@01 x@39@01)))
  :pattern ((Set_in x@39@01 ys@22@01))
  :pattern ((inv@40@01 x@39@01))
  :pattern ((img@41@01 x@39@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@41@01 r) (Set_in (inv@40@01 r) ys@22@01)) (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r)))
    (=>
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>))))
  :qid |qp.fvfDomDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef8|)))
(assert (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) ys@22@01 j@32@01))
; [eval] fun01(xs, j)
(set-option :timeout 0)
(push) ; 4
(declare-const x@45@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@45@01 xs@21@01))
(pop) ; 5
(declare-fun inv@46@01 ($Ref) $Ref)
(declare-fun img@47@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@45@01 $Ref) (x2@45@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@45@01 xs@21@01)
      (Set_in x2@45@01 xs@21@01)
      (= x1@45@01 x2@45@01))
    (= x1@45@01 x2@45@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (Set_in x@45@01 xs@21@01)
    (and (= (inv@46@01 x@45@01) x@45@01) (img@47@01 x@45@01)))
  :pattern ((Set_in x@45@01 xs@21@01))
  :pattern ((inv@46@01 x@45@01))
  :pattern ((img@47@01 x@45@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@47@01 r) (Set_in (inv@46@01 r) xs@21@01)) (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@48@01 ((r $Ref) (j@32@01 Int)) $Perm
  (ite
    (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r) (= r (inv@46@01 r)))
    ($Perm.min
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@49@01 ((r $Ref) (j@32@01 Int)) $Perm
  (ite
    (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r) (= r (inv@46@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@48@01 r j@32@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@48@01 r j@32@01))
    $Perm.No)
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r) (= r (inv@46@01 r)))
    (= (- $Perm.Write (pTaken@48@01 r j@32@01)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@50@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>)))
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r)))
    (=>
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>))))
  :qid |qp.fvfDomDef12|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef11|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@50@01  $FVF<f>)) xs@21@01 j@32@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (Set_in x@45@01 xs@21@01)
    (and (= (inv@46@01 x@45@01) x@45@01) (img@47@01 x@45@01)))
  :pattern ((Set_in x@45@01 xs@21@01))
  :pattern ((inv@46@01 x@45@01))
  :pattern ((img@47@01 x@45@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@47@01 r) (Set_in (inv@46@01 r) xs@21@01)) (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>)))
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r)))
    (=>
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>))))
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef11|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@50@01  $FVF<f>)) xs@21@01 j@32@01))
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (Set_in x@45@01 xs@21@01)
    (and (= (inv@46@01 x@45@01) x@45@01) (img@47@01 x@45@01)))
  :pattern ((Set_in x@45@01 xs@21@01))
  :pattern ((inv@46@01 x@45@01))
  :pattern ((img@47@01 x@45@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@47@01 r) (Set_in (inv@46@01 r) xs@21@01)) (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>)))
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r)))
    (=>
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>))))
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef11|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@50@01  $FVF<f>)) xs@21@01 j@32@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x@33@01 $Ref)) (!
  (=>
    (Set_in x@33@01 xs@21@01)
    (and (= (inv@34@01 x@33@01) x@33@01) (img@35@01 x@33@01)))
  :pattern ((Set_in x@33@01 xs@21@01))
  :pattern ((inv@34@01 x@33@01))
  :pattern ((img@35@01 x@33@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@35@01 r) (Set_in (inv@34@01 r) xs@21@01)) (= (inv@34@01 r) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>)))
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r)))
    (=>
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@38@01  $FVF<f>))))
  :qid |qp.fvfDomDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@38@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@34@01 r) xs@21@01) (img@35@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@38@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((x@39@01 $Ref)) (!
  (=>
    (Set_in x@39@01 ys@22@01)
    (and (= (inv@40@01 x@39@01) x@39@01) (img@41@01 x@39@01)))
  :pattern ((Set_in x@39@01 ys@22@01))
  :pattern ((inv@40@01 x@39@01))
  :pattern ((img@41@01 x@39@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@41@01 r) (Set_in (inv@40@01 r) ys@22@01)) (= (inv@40@01 r) r))
  :pattern ((inv@40@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r)))
    (=>
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@44@01  $FVF<f>))))
  :qid |qp.fvfDomDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@40@01 r) ys@22@01) (img@41@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((x@45@01 $Ref)) (!
  (=>
    (Set_in x@45@01 xs@21@01)
    (and (= (inv@46@01 x@45@01) x@45@01) (img@47@01 x@45@01)))
  :pattern ((Set_in x@45@01 xs@21@01))
  :pattern ((inv@46@01 x@45@01))
  :pattern ((img@47@01 x@45@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@47@01 r) (Set_in (inv@46@01 r) xs@21@01)) (= (inv@46@01 r) r))
  :pattern ((inv@46@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>)))
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r)))
    (=>
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@50@01  $FVF<f>))))
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@46@01 r) xs@21@01) (img@47@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@50@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@50@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef11|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@32@01 Int)) (!
  (and
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@38@01  $FVF<f>)) xs@21@01 j@32@01)
    (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) ys@22@01 j@32@01)
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@50@01  $FVF<f>)) xs@21@01 j@32@01))
  :pattern ((fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@50@01  $FVF<f>)) xs@21@01 j@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@29@10@29@55-aux|)))
(assert (forall ((j@32@01 Int)) (!
  (and
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@38@01  $FVF<f>)) xs@21@01 j@32@01)
    (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) ys@22@01 j@32@01)
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@50@01  $FVF<f>)) xs@21@01 j@32@01))
  :pattern ((fun02%limited ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) ys@22@01 j@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@29@10@29@55-aux|)))
(assert (forall ((j@32@01 Int)) (!
  (=
    (fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@38@01  $FVF<f>)) xs@21@01 j@32@01)
    (fun02 ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) ys@22@01 j@32@01))
  :pattern ((fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@50@01  $FVF<f>)) xs@21@01 j@32@01))
  :pattern ((fun02%limited ($SortWrappers.$FVF<f>To$Snap (as sm@44@01  $FVF<f>)) ys@22@01 j@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@29@10@29@55|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall j: Int ::
;     { fun01(xs, j) }
;     { fun02(ys, j) }
;     fun01(xs, j) == fun02(ys, j))
; [eval] (forall j: Int :: { fun01(xs, j) } { fun02(ys, j) } fun01(xs, j) == fun02(ys, j))
(declare-const j@51@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] fun01(xs, j) == fun02(ys, j)
; [eval] fun01(xs, j)
(push) ; 4
(declare-const x@52@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@52@01 xs@21@01))
(pop) ; 5
(declare-fun inv@53@01 ($Ref) $Ref)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@52@01 $Ref) (x2@52@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@52@01 xs@21@01)
      (Set_in x2@52@01 xs@21@01)
      (= x1@52@01 x2@52@01))
    (= x1@52@01 x2@52@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@52@01 $Ref)) (!
  (=>
    (Set_in x@52@01 xs@21@01)
    (and (= (inv@53@01 x@52@01) x@52@01) (img@54@01 x@52@01)))
  :pattern ((Set_in x@52@01 xs@21@01))
  :pattern ((inv@53@01 x@52@01))
  :pattern ((img@54@01 x@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@54@01 r) (Set_in (inv@53@01 r) xs@21@01)) (= (inv@53@01 r) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@55@01 ((r $Ref) (j@51@01 Int)) $Perm
  (ite
    (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r) (= r (inv@53@01 r)))
    ($Perm.min
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@56@01 ((r $Ref) (j@51@01 Int)) $Perm
  (ite
    (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r) (= r (inv@53@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@55@01 r j@51@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@55@01 r j@51@01))
    $Perm.No)
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r) (= r (inv@53@01 r)))
    (= (- $Perm.Write (pTaken@55@01 r j@51@01)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@57@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r)))
    (=>
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef14|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>)) xs@21@01 j@51@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@52@01 $Ref)) (!
  (=>
    (Set_in x@52@01 xs@21@01)
    (and (= (inv@53@01 x@52@01) x@52@01) (img@54@01 x@52@01)))
  :pattern ((Set_in x@52@01 xs@21@01))
  :pattern ((inv@53@01 x@52@01))
  :pattern ((img@54@01 x@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@54@01 r) (Set_in (inv@53@01 r) xs@21@01)) (= (inv@53@01 r) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r)))
    (=>
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef14|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>)) xs@21@01 j@51@01))
; [eval] fun02(ys, j)
(set-option :timeout 0)
(push) ; 4
(declare-const x@58@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@58@01 ys@22@01))
(pop) ; 5
(declare-fun inv@59@01 ($Ref) $Ref)
(declare-fun img@60@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@58@01 $Ref) (x2@58@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@58@01 ys@22@01)
      (Set_in x2@58@01 ys@22@01)
      (= x1@58@01 x2@58@01))
    (= x1@58@01 x2@58@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@58@01 $Ref)) (!
  (=>
    (Set_in x@58@01 ys@22@01)
    (and (= (inv@59@01 x@58@01) x@58@01) (img@60@01 x@58@01)))
  :pattern ((Set_in x@58@01 ys@22@01))
  :pattern ((inv@59@01 x@58@01))
  :pattern ((img@60@01 x@58@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@60@01 r) (Set_in (inv@59@01 r) ys@22@01)) (= (inv@59@01 r) r))
  :pattern ((inv@59@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@61@01 ((r $Ref) (j@51@01 Int)) $Perm
  (ite
    (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r) (= r (inv@59@01 r)))
    ($Perm.min
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@62@01 ((r $Ref) (j@51@01 Int)) $Perm
  (ite
    (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r) (= r (inv@59@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@61@01 r j@51@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@61@01 r j@51@01))
    $Perm.No)
  
  :qid |quant-u-64|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@61@01 r j@51@01) $Perm.No)
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r) (= r (inv@59@01 r)))
    (= (- $Perm.Write (pTaken@61@01 r j@51@01)) $Perm.No))
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
        $Perm.Write
        $Perm.No)
      (pTaken@62@01 r j@51@01))
    $Perm.No)
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@62@01 r j@51@01) $Perm.No)
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r) (= r (inv@59@01 r)))
    (=
      (- (- $Perm.Write (pTaken@61@01 r j@51@01)) (pTaken@62@01 r j@51@01))
      $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r)))
    (=>
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>))))
  :qid |qp.fvfDomDef18|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef17|)))
(assert (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@58@01 $Ref)) (!
  (=>
    (Set_in x@58@01 ys@22@01)
    (and (= (inv@59@01 x@58@01) x@58@01) (img@60@01 x@58@01)))
  :pattern ((Set_in x@58@01 ys@22@01))
  :pattern ((inv@59@01 x@58@01))
  :pattern ((img@60@01 x@58@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@60@01 r) (Set_in (inv@59@01 r) ys@22@01)) (= (inv@59@01 r) r))
  :pattern ((inv@59@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r)))
    (=>
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>))))
  :qid |qp.fvfDomDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef17|)))
(assert (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
; [eval] fun01(xs, j)
(set-option :timeout 0)
(push) ; 4
(declare-const x@64@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@64@01 xs@21@01))
(pop) ; 5
(declare-fun inv@65@01 ($Ref) $Ref)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@64@01 $Ref) (x2@64@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@64@01 xs@21@01)
      (Set_in x2@64@01 xs@21@01)
      (= x1@64@01 x2@64@01))
    (= x1@64@01 x2@64@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@64@01 $Ref)) (!
  (=>
    (Set_in x@64@01 xs@21@01)
    (and (= (inv@65@01 x@64@01) x@64@01) (img@66@01 x@64@01)))
  :pattern ((Set_in x@64@01 xs@21@01))
  :pattern ((inv@65@01 x@64@01))
  :pattern ((img@66@01 x@64@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) xs@21@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@67@01 ((r $Ref) (j@51@01 Int)) $Perm
  (ite
    (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r) (= r (inv@65@01 r)))
    ($Perm.min
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@68@01 ((r $Ref) (j@51@01 Int)) $Perm
  (ite
    (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r) (= r (inv@65@01 r)))
    ($Perm.min
      (ite
        (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@67@01 r j@51@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01))
        $Perm.Write
        $Perm.No)
      (pTaken@67@01 r j@51@01))
    $Perm.No)
  
  :qid |quant-u-72|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r) (= r (inv@65@01 r)))
    (= (- $Perm.Write (pTaken@67@01 r j@51@01)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@69@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>)))
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r)))
    (=>
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>))))
  :qid |qp.fvfDomDef21|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef20|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@64@01 $Ref)) (!
  (=>
    (Set_in x@64@01 xs@21@01)
    (and (= (inv@65@01 x@64@01) x@64@01) (img@66@01 x@64@01)))
  :pattern ((Set_in x@64@01 xs@21@01))
  :pattern ((inv@65@01 x@64@01))
  :pattern ((img@66@01 x@64@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) xs@21@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>)))
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r)))
    (=>
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef20|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
(assert (forall ((x@64@01 $Ref)) (!
  (=>
    (Set_in x@64@01 xs@21@01)
    (and (= (inv@65@01 x@64@01) x@64@01) (img@66@01 x@64@01)))
  :pattern ((Set_in x@64@01 xs@21@01))
  :pattern ((inv@65@01 x@64@01))
  :pattern ((img@66@01 x@64@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) xs@21@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>)))
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r)))
    (=>
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef20|)))
(assert (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x@52@01 $Ref)) (!
  (=>
    (Set_in x@52@01 xs@21@01)
    (and (= (inv@53@01 x@52@01) x@52@01) (img@54@01 x@52@01)))
  :pattern ((Set_in x@52@01 xs@21@01))
  :pattern ((inv@53@01 x@52@01))
  :pattern ((img@54@01 x@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@54@01 r) (Set_in (inv@53@01 r) xs@21@01)) (= (inv@53@01 r) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r)))
    (=>
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@53@01 r) xs@21@01) (img@54@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((x@58@01 $Ref)) (!
  (=>
    (Set_in x@58@01 ys@22@01)
    (and (= (inv@59@01 x@58@01) x@58@01) (img@60@01 x@58@01)))
  :pattern ((Set_in x@58@01 ys@22@01))
  :pattern ((inv@59@01 x@58@01))
  :pattern ((img@60@01 x@58@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@60@01 r) (Set_in (inv@59@01 r) ys@22@01)) (= (inv@59@01 r) r))
  :pattern ((inv@59@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r)))
    (=>
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@63@01  $FVF<f>))))
  :qid |qp.fvfDomDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@59@01 r) ys@22@01) (img@60@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@63@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((x@64@01 $Ref)) (!
  (=>
    (Set_in x@64@01 xs@21@01)
    (and (= (inv@65@01 x@64@01) x@64@01) (img@66@01 x@64@01)))
  :pattern ((Set_in x@64@01 xs@21@01))
  :pattern ((inv@65@01 x@64@01))
  :pattern ((img@66@01 x@64@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@66@01 r) (Set_in (inv@65@01 r) xs@21@01)) (= (inv@65@01 r) r))
  :pattern ((inv@65@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>)))
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r)))
    (=>
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@69@01  $FVF<f>))))
  :qid |qp.fvfDomDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (and (img@26@01 r) (Set_in (inv@25@01 r) xs@21@01)))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@24@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@24@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@65@01 r) xs@21@01) (img@66@01 r))
      (and (img@30@01 r) (Set_in (inv@29@01 r) ys@22@01)))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef20|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@51@01 Int)) (!
  (and
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>)) xs@21@01 j@51@01)
    (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01)
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
  :pattern ((fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@30@10@30@55-aux|)))
(assert (forall ((j@51@01 Int)) (!
  (and
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>)) xs@21@01 j@51@01)
    (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01)
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
  :pattern ((fun02%limited ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@30@10@30@55-aux|)))
(assert (forall ((j@51@01 Int)) (!
  (and
    (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>)) xs@21@01 j@51@01)
    (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
  :pattern ((fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
  :pattern ((fun02%limited ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@30@10@30@55_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@51@01 Int)) (!
  (=>
    (and
      (fun01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>)) xs@21@01 j@51@01)
      (fun02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
    (=
      (fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>)) xs@21@01 j@51@01)
      (fun02 ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01)))
  :pattern ((fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
  :pattern ((fun02%limited ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@30@10@30@55|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@51@01 Int)) (!
  (=
    (fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>)) xs@21@01 j@51@01)
    (fun02 ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
  :pattern ((fun01 ($SortWrappers.$FVF<f>To$Snap (as sm@69@01  $FVF<f>)) xs@21@01 j@51@01))
  :pattern ((fun02%limited ($SortWrappers.$FVF<f>To$Snap (as sm@63@01  $FVF<f>)) ys@22@01 j@51@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@30@10@30@55|)))
(pop) ; 2
(pop) ; 1
; ---------- test20 ----------
(declare-const xs@70@01 Set<$Ref>)
(declare-const ys@71@01 Set<$Ref>)
(declare-const xs@72@01 Set<$Ref>)
(declare-const ys@73@01 Set<$Ref>)
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
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@74@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@74@01 xs@72@01))
(pop) ; 3
(declare-const $t@75@01 $FVF<f>)
(declare-fun inv@76@01 ($Ref) $Ref)
(declare-fun img@77@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@74@01 $Ref) (x2@74@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@74@01 xs@72@01)
      (Set_in x2@74@01 xs@72@01)
      (= x1@74@01 x2@74@01))
    (= x1@74@01 x2@74@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@74@01 $Ref)) (!
  (=>
    (Set_in x@74@01 xs@72@01)
    (and (= (inv@76@01 x@74@01) x@74@01) (img@77@01 x@74@01)))
  :pattern ((Set_in x@74@01 xs@72@01))
  :pattern ((inv@76@01 x@74@01))
  :pattern ((img@77@01 x@74@01))
  :qid |quant-u-75|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)) (= (inv@76@01 r) r))
  :pattern ((inv@76@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@74@01 $Ref)) (!
  (=> (Set_in x@74@01 xs@72@01) (not (= x@74@01 $Ref.null)))
  :pattern ((Set_in x@74@01 xs@72@01))
  :pattern ((inv@76@01 x@74@01))
  :pattern ((img@77@01 x@74@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x$0: Ref ::(x$0 in ys) ==> acc(x$0.f, write))
(declare-const x$0@78@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x$0 in ys)
(assert (Set_in x$0@78@01 ys@73@01))
(pop) ; 3
(declare-const $t@79@01 $FVF<f>)
(declare-fun inv@80@01 ($Ref) $Ref)
(declare-fun img@81@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x$01@78@01 $Ref) (x$02@78@01 $Ref)) (!
  (=>
    (and
      (Set_in x$01@78@01 ys@73@01)
      (Set_in x$02@78@01 ys@73@01)
      (= x$01@78@01 x$02@78@01))
    (= x$01@78@01 x$02@78@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x$0@78@01 $Ref)) (!
  (=>
    (Set_in x$0@78@01 ys@73@01)
    (and (= (inv@80@01 x$0@78@01) x$0@78@01) (img@81@01 x$0@78@01)))
  :pattern ((Set_in x$0@78@01 ys@73@01))
  :pattern ((inv@80@01 x$0@78@01))
  :pattern ((img@81@01 x$0@78@01))
  :qid |quant-u-77|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)) (= (inv@80@01 r) r))
  :pattern ((inv@80@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x$0@78@01 $Ref)) (!
  (=> (Set_in x$0@78@01 ys@73@01) (not (= x$0@78@01 $Ref.null)))
  :pattern ((Set_in x$0@78@01 ys@73@01))
  :pattern ((inv@80@01 x$0@78@01))
  :pattern ((img@81@01 x$0@78@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= x$0@78@01 x@74@01)
    (=
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))))
  
  :qid |quant-u-78|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::
;     { bar01(xs, bar02(ys, j)) }
;     { foo(xs, j) }
;     bar01(xs, bar02(ys, j)) == foo(xs, j))
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 $Snap.unit))
; [eval] (forall j: Int :: { bar01(xs, bar02(ys, j)) } { foo(xs, j) } bar01(xs, bar02(ys, j)) == foo(xs, j))
(declare-const j@83@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] bar01(xs, bar02(ys, j)) == foo(xs, j)
; [eval] bar01(xs, bar02(ys, j))
; [eval] bar02(ys, j)
(push) ; 4
(declare-const x@84@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@84@01 ys@73@01))
(pop) ; 5
(declare-fun inv@85@01 ($Ref) $Ref)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@84@01 $Ref) (x2@84@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@84@01 ys@73@01)
      (Set_in x2@84@01 ys@73@01)
      (= x1@84@01 x2@84@01))
    (= x1@84@01 x2@84@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@84@01 $Ref)) (!
  (=>
    (Set_in x@84@01 ys@73@01)
    (and (= (inv@85@01 x@84@01) x@84@01) (img@86@01 x@84@01)))
  :pattern ((Set_in x@84@01 ys@73@01))
  :pattern ((inv@85@01 x@84@01))
  :pattern ((img@86@01 x@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@86@01 r) (Set_in (inv@85@01 r) ys@73@01)) (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@87@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r) (= r (inv@85@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@88@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r) (= r (inv@85@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@87@01 r j@83@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@87@01 r j@83@01))
    $Perm.No)
  
  :qid |quant-u-81|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@87@01 r j@83@01) $Perm.No)
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r) (= r (inv@85@01 r)))
    (= (- $Perm.Write (pTaken@87@01 r j@83@01)) $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (pTaken@88@01 r j@83@01))
    $Perm.No)
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@88@01 r j@83@01) $Perm.No)
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r) (= r (inv@85@01 r)))
    (=
      (- (- $Perm.Write (pTaken@87@01 r j@83@01)) (pTaken@88@01 r j@83@01))
      $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unsat
(pop) ; 5
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
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r)))
    (=>
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>))))
  :qid |qp.fvfDomDef24|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@89@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@89@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef23|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@84@01 $Ref)) (!
  (=>
    (Set_in x@84@01 ys@73@01)
    (and (= (inv@85@01 x@84@01) x@84@01) (img@86@01 x@84@01)))
  :pattern ((Set_in x@84@01 ys@73@01))
  :pattern ((inv@85@01 x@84@01))
  :pattern ((img@86@01 x@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@86@01 r) (Set_in (inv@85@01 r) ys@73@01)) (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r)))
    (=>
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>))))
  :qid |qp.fvfDomDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@89@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@89@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef23|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01))
(set-option :timeout 0)
(push) ; 4
(declare-const x@90@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@90@01 xs@72@01))
(pop) ; 5
(declare-fun inv@91@01 ($Ref) $Ref)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@90@01 $Ref) (x2@90@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@90@01 xs@72@01)
      (Set_in x2@90@01 xs@72@01)
      (= x1@90@01 x2@90@01))
    (= x1@90@01 x2@90@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@90@01 $Ref)) (!
  (=>
    (Set_in x@90@01 xs@72@01)
    (and (= (inv@91@01 x@90@01) x@90@01) (img@92@01 x@90@01)))
  :pattern ((Set_in x@90@01 xs@72@01))
  :pattern ((inv@91@01 x@90@01))
  :pattern ((img@92@01 x@90@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@92@01 r) (Set_in (inv@91@01 r) xs@72@01)) (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@93@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r) (= r (inv@91@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@94@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r) (= r (inv@91@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@93@01 r j@83@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@93@01 r j@83@01))
    $Perm.No)
  
  :qid |quant-u-89|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r) (= r (inv@91@01 r)))
    (= (- $Perm.Write (pTaken@93@01 r j@83@01)) $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 5
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
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r)))
    (=>
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>))))
  :qid |qp.fvfDomDef27|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@95@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@95@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef26|)))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01)))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@90@01 $Ref)) (!
  (=>
    (Set_in x@90@01 xs@72@01)
    (and (= (inv@91@01 x@90@01) x@90@01) (img@92@01 x@90@01)))
  :pattern ((Set_in x@90@01 xs@72@01))
  :pattern ((inv@91@01 x@90@01))
  :pattern ((img@92@01 x@90@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@92@01 r) (Set_in (inv@91@01 r) xs@72@01)) (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r)))
    (=>
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>))))
  :qid |qp.fvfDomDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@95@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@95@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef26|)))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01)))
; [eval] foo(xs, j)
(set-option :timeout 0)
(push) ; 4
(declare-const x@96@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@96@01 xs@72@01))
(pop) ; 5
(declare-fun inv@97@01 ($Ref) $Ref)
(declare-fun img@98@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@96@01 $Ref) (x2@96@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@96@01 xs@72@01)
      (Set_in x2@96@01 xs@72@01)
      (= x1@96@01 x2@96@01))
    (= x1@96@01 x2@96@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@96@01 $Ref)) (!
  (=>
    (Set_in x@96@01 xs@72@01)
    (and (= (inv@97@01 x@96@01) x@96@01) (img@98@01 x@96@01)))
  :pattern ((Set_in x@96@01 xs@72@01))
  :pattern ((inv@97@01 x@96@01))
  :pattern ((img@98@01 x@96@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@98@01 r) (Set_in (inv@97@01 r) xs@72@01)) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@99@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r) (= r (inv@97@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@100@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r) (= r (inv@97@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@99@01 r j@83@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@99@01 r j@83@01))
    $Perm.No)
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r) (= r (inv@97@01 r)))
    (= (- $Perm.Write (pTaken@99@01 r j@83@01)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@101@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r)))
    (=>
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>))))
  :qid |qp.fvfDomDef30|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef29|)))
(assert (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>)) xs@72@01 j@83@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@96@01 $Ref)) (!
  (=>
    (Set_in x@96@01 xs@72@01)
    (and (= (inv@97@01 x@96@01) x@96@01) (img@98@01 x@96@01)))
  :pattern ((Set_in x@96@01 xs@72@01))
  :pattern ((inv@97@01 x@96@01))
  :pattern ((img@98@01 x@96@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@98@01 r) (Set_in (inv@97@01 r) xs@72@01)) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r)))
    (=>
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>))))
  :qid |qp.fvfDomDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef29|)))
(assert (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>)) xs@72@01 j@83@01))
; [eval] bar01(xs, bar02(ys, j))
; [eval] bar02(ys, j)
(set-option :timeout 0)
(push) ; 4
(declare-const x@102@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@102@01 ys@73@01))
(pop) ; 5
(declare-fun inv@103@01 ($Ref) $Ref)
(declare-fun img@104@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@102@01 $Ref) (x2@102@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@102@01 ys@73@01)
      (Set_in x2@102@01 ys@73@01)
      (= x1@102@01 x2@102@01))
    (= x1@102@01 x2@102@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@102@01 $Ref)) (!
  (=>
    (Set_in x@102@01 ys@73@01)
    (and (= (inv@103@01 x@102@01) x@102@01) (img@104@01 x@102@01)))
  :pattern ((Set_in x@102@01 ys@73@01))
  :pattern ((inv@103@01 x@102@01))
  :pattern ((img@104@01 x@102@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@104@01 r) (Set_in (inv@103@01 r) ys@73@01)) (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@105@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r) (= r (inv@103@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@106@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r) (= r (inv@103@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@105@01 r j@83@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@105@01 r j@83@01))
    $Perm.No)
  
  :qid |quant-u-97|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@105@01 r j@83@01) $Perm.No)
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r) (= r (inv@103@01 r)))
    (= (- $Perm.Write (pTaken@105@01 r j@83@01)) $Perm.No))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (pTaken@106@01 r j@83@01))
    $Perm.No)
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@106@01 r j@83@01) $Perm.No)
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r) (= r (inv@103@01 r)))
    (=
      (- (- $Perm.Write (pTaken@105@01 r j@83@01)) (pTaken@106@01 r j@83@01))
      $Perm.No))
  
  :qid |quant-u-102|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@107@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r)))
    (=>
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>))))
  :qid |qp.fvfDomDef33|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef32|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@102@01 $Ref)) (!
  (=>
    (Set_in x@102@01 ys@73@01)
    (and (= (inv@103@01 x@102@01) x@102@01) (img@104@01 x@102@01)))
  :pattern ((Set_in x@102@01 ys@73@01))
  :pattern ((inv@103@01 x@102@01))
  :pattern ((img@104@01 x@102@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@104@01 r) (Set_in (inv@103@01 r) ys@73@01)) (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r)))
    (=>
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef32|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01))
(set-option :timeout 0)
(push) ; 4
(declare-const x@108@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@108@01 xs@72@01))
(pop) ; 5
(declare-fun inv@109@01 ($Ref) $Ref)
(declare-fun img@110@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@108@01 $Ref) (x2@108@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@108@01 xs@72@01)
      (Set_in x2@108@01 xs@72@01)
      (= x1@108@01 x2@108@01))
    (= x1@108@01 x2@108@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@108@01 $Ref)) (!
  (=>
    (Set_in x@108@01 xs@72@01)
    (and (= (inv@109@01 x@108@01) x@108@01) (img@110@01 x@108@01)))
  :pattern ((Set_in x@108@01 xs@72@01))
  :pattern ((inv@109@01 x@108@01))
  :pattern ((img@110@01 x@108@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@110@01 r) (Set_in (inv@109@01 r) xs@72@01)) (= (inv@109@01 r) r))
  :pattern ((inv@109@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@111@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r) (= r (inv@109@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@112@01 ((r $Ref) (j@83@01 Int)) $Perm
  (ite
    (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r) (= r (inv@109@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@111@01 r j@83@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@111@01 r j@83@01))
    $Perm.No)
  
  :qid |quant-u-105|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r) (= r (inv@109@01 r)))
    (= (- $Perm.Write (pTaken@111@01 r j@83@01)) $Perm.No))
  
  :qid |quant-u-106|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@113@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>)))
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r)))
    (=>
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>))))
  :qid |qp.fvfDomDef36|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef35|)))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@113@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@108@01 $Ref)) (!
  (=>
    (Set_in x@108@01 xs@72@01)
    (and (= (inv@109@01 x@108@01) x@108@01) (img@110@01 x@108@01)))
  :pattern ((Set_in x@108@01 xs@72@01))
  :pattern ((inv@109@01 x@108@01))
  :pattern ((img@110@01 x@108@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@110@01 r) (Set_in (inv@109@01 r) xs@72@01)) (= (inv@109@01 r) r))
  :pattern ((inv@109@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>)))
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r)))
    (=>
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>))))
  :qid |qp.fvfDomDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef35|)))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@113@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)))
(assert (forall ((x@102@01 $Ref)) (!
  (=>
    (Set_in x@102@01 ys@73@01)
    (and (= (inv@103@01 x@102@01) x@102@01) (img@104@01 x@102@01)))
  :pattern ((Set_in x@102@01 ys@73@01))
  :pattern ((inv@103@01 x@102@01))
  :pattern ((img@104@01 x@102@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@104@01 r) (Set_in (inv@103@01 r) ys@73@01)) (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r)))
    (=>
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((x@108@01 $Ref)) (!
  (=>
    (Set_in x@108@01 xs@72@01)
    (and (= (inv@109@01 x@108@01) x@108@01) (img@110@01 x@108@01)))
  :pattern ((Set_in x@108@01 xs@72@01))
  :pattern ((inv@109@01 x@108@01))
  :pattern ((img@110@01 x@108@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@110@01 r) (Set_in (inv@109@01 r) xs@72@01)) (= (inv@109@01 r) r))
  :pattern ((inv@109@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>)))
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r)))
    (=>
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>))))
  :qid |qp.fvfDomDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef35|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@113@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x@84@01 $Ref)) (!
  (=>
    (Set_in x@84@01 ys@73@01)
    (and (= (inv@85@01 x@84@01) x@84@01) (img@86@01 x@84@01)))
  :pattern ((Set_in x@84@01 ys@73@01))
  :pattern ((inv@85@01 x@84@01))
  :pattern ((img@86@01 x@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@86@01 r) (Set_in (inv@85@01 r) ys@73@01)) (= (inv@85@01 r) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r)))
    (=>
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@89@01  $FVF<f>))))
  :qid |qp.fvfDomDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@89@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@85@01 r) ys@73@01) (img@86@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@89@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((x@90@01 $Ref)) (!
  (=>
    (Set_in x@90@01 xs@72@01)
    (and (= (inv@91@01 x@90@01) x@90@01) (img@92@01 x@90@01)))
  :pattern ((Set_in x@90@01 xs@72@01))
  :pattern ((inv@91@01 x@90@01))
  :pattern ((img@92@01 x@90@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@92@01 r) (Set_in (inv@91@01 r) xs@72@01)) (= (inv@91@01 r) r))
  :pattern ((inv@91@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r)))
    (=>
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@95@01  $FVF<f>))))
  :qid |qp.fvfDomDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@95@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@91@01 r) xs@72@01) (img@92@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@95@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@95@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((x@96@01 $Ref)) (!
  (=>
    (Set_in x@96@01 xs@72@01)
    (and (= (inv@97@01 x@96@01) x@96@01) (img@98@01 x@96@01)))
  :pattern ((Set_in x@96@01 xs@72@01))
  :pattern ((inv@97@01 x@96@01))
  :pattern ((img@98@01 x@96@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@98@01 r) (Set_in (inv@97@01 r) xs@72@01)) (= (inv@97@01 r) r))
  :pattern ((inv@97@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r)))
    (=>
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>))))
  :qid |qp.fvfDomDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@97@01 r) xs@72@01) (img@98@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((x@102@01 $Ref)) (!
  (=>
    (Set_in x@102@01 ys@73@01)
    (and (= (inv@103@01 x@102@01) x@102@01) (img@104@01 x@102@01)))
  :pattern ((Set_in x@102@01 ys@73@01))
  :pattern ((inv@103@01 x@102@01))
  :pattern ((img@104@01 x@102@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@104@01 r) (Set_in (inv@103@01 r) ys@73@01)) (= (inv@103@01 r) r))
  :pattern ((inv@103@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r)))
    (=>
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>))))
  :qid |qp.fvfDomDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@103@01 r) ys@73@01) (img@104@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((x@108@01 $Ref)) (!
  (=>
    (Set_in x@108@01 xs@72@01)
    (and (= (inv@109@01 x@108@01) x@108@01) (img@110@01 x@108@01)))
  :pattern ((Set_in x@108@01 xs@72@01))
  :pattern ((inv@109@01 x@108@01))
  :pattern ((img@110@01 x@108@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@110@01 r) (Set_in (inv@109@01 r) xs@72@01)) (= (inv@109@01 r) r))
  :pattern ((inv@109@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>)))
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r)))
    (=>
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@113@01  $FVF<f>))))
  :qid |qp.fvfDomDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@109@01 r) xs@72@01) (img@110@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@113@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef35|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@83@01 Int)) (!
  (and
    (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01)
    (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01))
    (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>)) xs@72@01 j@83@01)
    (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)
    (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@113@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)))
  :pattern ((bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@113@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@47@5@49@44-aux|)))
(assert (forall ((j@83@01 Int)) (!
  (and
    (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01)
    (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01))
    (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>)) xs@72@01 j@83@01)
    (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)
    (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@113@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)))
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>)) xs@72@01 j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@47@5@49@44-aux|)))
(assert (forall ((j@83@01 Int)) (!
  (=
    (bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@95@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@89@01  $FVF<f>)) ys@73@01 j@83@01))
    (foo ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>)) xs@72@01 j@83@01))
  :pattern ((bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@113@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>)) ys@73@01 j@83@01)))
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>)) xs@72@01 j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@47@5@49@44|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall j: Int ::
;     { bar01(xs, bar02(ys, j)) }
;     { foo(xs, j) }
;     bar01(xs, bar02(ys, j)) == foo(xs, j))
; [eval] (forall j: Int :: { bar01(xs, bar02(ys, j)) } { foo(xs, j) } bar01(xs, bar02(ys, j)) == foo(xs, j))
(declare-const j@114@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] bar01(xs, bar02(ys, j)) == foo(xs, j)
; [eval] bar01(xs, bar02(ys, j))
; [eval] bar02(ys, j)
(push) ; 4
(declare-const x@115@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@115@01 ys@73@01))
(pop) ; 5
(declare-fun inv@116@01 ($Ref) $Ref)
(declare-fun img@117@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@115@01 $Ref) (x2@115@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@115@01 ys@73@01)
      (Set_in x2@115@01 ys@73@01)
      (= x1@115@01 x2@115@01))
    (= x1@115@01 x2@115@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@115@01 $Ref)) (!
  (=>
    (Set_in x@115@01 ys@73@01)
    (and (= (inv@116@01 x@115@01) x@115@01) (img@117@01 x@115@01)))
  :pattern ((Set_in x@115@01 ys@73@01))
  :pattern ((inv@116@01 x@115@01))
  :pattern ((img@117@01 x@115@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@117@01 r) (Set_in (inv@116@01 r) ys@73@01)) (= (inv@116@01 r) r))
  :pattern ((inv@116@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@118@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r) (= r (inv@116@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@119@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r) (= r (inv@116@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@118@01 r j@114@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@118@01 r j@114@01))
    $Perm.No)
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@118@01 r j@114@01) $Perm.No)
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r) (= r (inv@116@01 r)))
    (= (- $Perm.Write (pTaken@118@01 r j@114@01)) $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (pTaken@119@01 r j@114@01))
    $Perm.No)
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@119@01 r j@114@01) $Perm.No)
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r) (= r (inv@116@01 r)))
    (=
      (- (- $Perm.Write (pTaken@118@01 r j@114@01)) (pTaken@119@01 r j@114@01))
      $Perm.No))
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@120@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>)))
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r)))
    (=>
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>))))
  :qid |qp.fvfDomDef39|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@120@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@120@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@120@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@120@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef38|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@115@01 $Ref)) (!
  (=>
    (Set_in x@115@01 ys@73@01)
    (and (= (inv@116@01 x@115@01) x@115@01) (img@117@01 x@115@01)))
  :pattern ((Set_in x@115@01 ys@73@01))
  :pattern ((inv@116@01 x@115@01))
  :pattern ((img@117@01 x@115@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@117@01 r) (Set_in (inv@116@01 r) ys@73@01)) (= (inv@116@01 r) r))
  :pattern ((inv@116@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>)))
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r)))
    (=>
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>))))
  :qid |qp.fvfDomDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@120@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@120@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@120@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@120@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef38|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01))
(set-option :timeout 0)
(push) ; 4
(declare-const x@121@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@121@01 xs@72@01))
(pop) ; 5
(declare-fun inv@122@01 ($Ref) $Ref)
(declare-fun img@123@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@121@01 $Ref) (x2@121@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@121@01 xs@72@01)
      (Set_in x2@121@01 xs@72@01)
      (= x1@121@01 x2@121@01))
    (= x1@121@01 x2@121@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@121@01 $Ref)) (!
  (=>
    (Set_in x@121@01 xs@72@01)
    (and (= (inv@122@01 x@121@01) x@121@01) (img@123@01 x@121@01)))
  :pattern ((Set_in x@121@01 xs@72@01))
  :pattern ((inv@122@01 x@121@01))
  :pattern ((img@123@01 x@121@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@123@01 r) (Set_in (inv@122@01 r) xs@72@01)) (= (inv@122@01 r) r))
  :pattern ((inv@122@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@124@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r) (= r (inv@122@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@125@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r) (= r (inv@122@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@124@01 r j@114@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@124@01 r j@114@01))
    $Perm.No)
  
  :qid |quant-u-117|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r) (= r (inv@122@01 r)))
    (= (- $Perm.Write (pTaken@124@01 r j@114@01)) $Perm.No))
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@126@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>)))
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r)))
    (=>
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>))))
  :qid |qp.fvfDomDef42|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@126@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@126@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef41|)))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@126@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01)))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@121@01 $Ref)) (!
  (=>
    (Set_in x@121@01 xs@72@01)
    (and (= (inv@122@01 x@121@01) x@121@01) (img@123@01 x@121@01)))
  :pattern ((Set_in x@121@01 xs@72@01))
  :pattern ((inv@122@01 x@121@01))
  :pattern ((img@123@01 x@121@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@123@01 r) (Set_in (inv@122@01 r) xs@72@01)) (= (inv@122@01 r) r))
  :pattern ((inv@122@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>)))
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r)))
    (=>
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>))))
  :qid |qp.fvfDomDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@126@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@126@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef41|)))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@126@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01)))
; [eval] foo(xs, j)
(set-option :timeout 0)
(push) ; 4
(declare-const x@127@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@127@01 xs@72@01))
(pop) ; 5
(declare-fun inv@128@01 ($Ref) $Ref)
(declare-fun img@129@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@127@01 $Ref) (x2@127@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@127@01 xs@72@01)
      (Set_in x2@127@01 xs@72@01)
      (= x1@127@01 x2@127@01))
    (= x1@127@01 x2@127@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@127@01 $Ref)) (!
  (=>
    (Set_in x@127@01 xs@72@01)
    (and (= (inv@128@01 x@127@01) x@127@01) (img@129@01 x@127@01)))
  :pattern ((Set_in x@127@01 xs@72@01))
  :pattern ((inv@128@01 x@127@01))
  :pattern ((img@129@01 x@127@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@129@01 r) (Set_in (inv@128@01 r) xs@72@01)) (= (inv@128@01 r) r))
  :pattern ((inv@128@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r) (= r (inv@128@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@131@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r) (= r (inv@128@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@130@01 r j@114@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@130@01 r j@114@01))
    $Perm.No)
  
  :qid |quant-u-121|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r) (= r (inv@128@01 r)))
    (= (- $Perm.Write (pTaken@130@01 r j@114@01)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@132@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r)))
    (=>
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>))))
  :qid |qp.fvfDomDef45|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef44|)))
(assert (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@127@01 $Ref)) (!
  (=>
    (Set_in x@127@01 xs@72@01)
    (and (= (inv@128@01 x@127@01) x@127@01) (img@129@01 x@127@01)))
  :pattern ((Set_in x@127@01 xs@72@01))
  :pattern ((inv@128@01 x@127@01))
  :pattern ((img@129@01 x@127@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@129@01 r) (Set_in (inv@128@01 r) xs@72@01)) (= (inv@128@01 r) r))
  :pattern ((inv@128@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r)))
    (=>
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>))))
  :qid |qp.fvfDomDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef44|)))
(assert (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
; [eval] bar01(xs, bar02(ys, j))
; [eval] bar02(ys, j)
(set-option :timeout 0)
(push) ; 4
(declare-const x@133@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@133@01 ys@73@01))
(pop) ; 5
(declare-fun inv@134@01 ($Ref) $Ref)
(declare-fun img@135@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@133@01 $Ref) (x2@133@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@133@01 ys@73@01)
      (Set_in x2@133@01 ys@73@01)
      (= x1@133@01 x2@133@01))
    (= x1@133@01 x2@133@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@133@01 $Ref)) (!
  (=>
    (Set_in x@133@01 ys@73@01)
    (and (= (inv@134@01 x@133@01) x@133@01) (img@135@01 x@133@01)))
  :pattern ((Set_in x@133@01 ys@73@01))
  :pattern ((inv@134@01 x@133@01))
  :pattern ((img@135@01 x@133@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@135@01 r) (Set_in (inv@134@01 r) ys@73@01)) (= (inv@134@01 r) r))
  :pattern ((inv@134@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@136@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r) (= r (inv@134@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@137@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r) (= r (inv@134@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@136@01 r j@114@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@136@01 r j@114@01))
    $Perm.No)
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@136@01 r j@114@01) $Perm.No)
  
  :qid |quant-u-126|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r) (= r (inv@134@01 r)))
    (= (- $Perm.Write (pTaken@136@01 r j@114@01)) $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (pTaken@137@01 r j@114@01))
    $Perm.No)
  
  :qid |quant-u-128|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@137@01 r j@114@01) $Perm.No)
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r) (= r (inv@134@01 r)))
    (=
      (- (- $Perm.Write (pTaken@136@01 r j@114@01)) (pTaken@137@01 r j@114@01))
      $Perm.No))
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@138@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>)))
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r)))
    (=>
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>))))
  :qid |qp.fvfDomDef48|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@138@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@138@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@138@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@138@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef47|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@133@01 $Ref)) (!
  (=>
    (Set_in x@133@01 ys@73@01)
    (and (= (inv@134@01 x@133@01) x@133@01) (img@135@01 x@133@01)))
  :pattern ((Set_in x@133@01 ys@73@01))
  :pattern ((inv@134@01 x@133@01))
  :pattern ((img@135@01 x@133@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@135@01 r) (Set_in (inv@134@01 r) ys@73@01)) (= (inv@134@01 r) r))
  :pattern ((inv@134@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>)))
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r)))
    (=>
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@138@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@138@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@138@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@138@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef47|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01))
(set-option :timeout 0)
(push) ; 4
(declare-const x@139@01 $Ref)
(push) ; 5
; [eval] (x in xs)
(assert (Set_in x@139@01 xs@72@01))
(pop) ; 5
(declare-fun inv@140@01 ($Ref) $Ref)
(declare-fun img@141@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((x1@139@01 $Ref) (x2@139@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@139@01 xs@72@01)
      (Set_in x2@139@01 xs@72@01)
      (= x1@139@01 x2@139@01))
    (= x1@139@01 x2@139@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@139@01 $Ref)) (!
  (=>
    (Set_in x@139@01 xs@72@01)
    (and (= (inv@140@01 x@139@01) x@139@01) (img@141@01 x@139@01)))
  :pattern ((Set_in x@139@01 xs@72@01))
  :pattern ((inv@140@01 x@139@01))
  :pattern ((img@141@01 x@139@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@141@01 r) (Set_in (inv@140@01 r) xs@72@01)) (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@142@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r) (= r (inv@140@01 r)))
    ($Perm.min
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@143@01 ((r $Ref) (j@114@01 Int)) $Perm
  (ite
    (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r) (= r (inv@140@01 r)))
    ($Perm.min
      (ite
        (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@142@01 r j@114@01)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01))
        $Perm.Write
        $Perm.No)
      (pTaken@142@01 r j@114@01))
    $Perm.No)
  
  :qid |quant-u-133|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r) (= r (inv@140@01 r)))
    (= (- $Perm.Write (pTaken@142@01 r j@114@01)) $Perm.No))
  
  :qid |quant-u-134|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@144@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r)))
    (=>
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>))))
  :qid |qp.fvfDomDef51|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef50|)))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
(pop) ; 4
; Joined path conditions
(assert (forall ((x@139@01 $Ref)) (!
  (=>
    (Set_in x@139@01 xs@72@01)
    (and (= (inv@140@01 x@139@01) x@139@01) (img@141@01 x@139@01)))
  :pattern ((Set_in x@139@01 xs@72@01))
  :pattern ((inv@140@01 x@139@01))
  :pattern ((img@141@01 x@139@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@141@01 r) (Set_in (inv@140@01 r) xs@72@01)) (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r)))
    (=>
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>))))
  :qid |qp.fvfDomDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef50|)))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
(assert (forall ((x@133@01 $Ref)) (!
  (=>
    (Set_in x@133@01 ys@73@01)
    (and (= (inv@134@01 x@133@01) x@133@01) (img@135@01 x@133@01)))
  :pattern ((Set_in x@133@01 ys@73@01))
  :pattern ((inv@134@01 x@133@01))
  :pattern ((img@135@01 x@133@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@135@01 r) (Set_in (inv@134@01 r) ys@73@01)) (= (inv@134@01 r) r))
  :pattern ((inv@134@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>)))
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r)))
    (=>
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@138@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@138@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@138@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@138@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((x@139@01 $Ref)) (!
  (=>
    (Set_in x@139@01 xs@72@01)
    (and (= (inv@140@01 x@139@01) x@139@01) (img@141@01 x@139@01)))
  :pattern ((Set_in x@139@01 xs@72@01))
  :pattern ((inv@140@01 x@139@01))
  :pattern ((img@141@01 x@139@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@141@01 r) (Set_in (inv@140@01 r) xs@72@01)) (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r)))
    (=>
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>))))
  :qid |qp.fvfDomDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef50|)))
(assert (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01))
(assert (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((x@115@01 $Ref)) (!
  (=>
    (Set_in x@115@01 ys@73@01)
    (and (= (inv@116@01 x@115@01) x@115@01) (img@117@01 x@115@01)))
  :pattern ((Set_in x@115@01 ys@73@01))
  :pattern ((inv@116@01 x@115@01))
  :pattern ((img@117@01 x@115@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@117@01 r) (Set_in (inv@116@01 r) ys@73@01)) (= (inv@116@01 r) r))
  :pattern ((inv@116@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>)))
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r)))
    (=>
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@120@01  $FVF<f>))))
  :qid |qp.fvfDomDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@120@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@120@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@116@01 r) ys@73@01) (img@117@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@120@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@120@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((x@121@01 $Ref)) (!
  (=>
    (Set_in x@121@01 xs@72@01)
    (and (= (inv@122@01 x@121@01) x@121@01) (img@123@01 x@121@01)))
  :pattern ((Set_in x@121@01 xs@72@01))
  :pattern ((inv@122@01 x@121@01))
  :pattern ((img@123@01 x@121@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@123@01 r) (Set_in (inv@122@01 r) xs@72@01)) (= (inv@122@01 r) r))
  :pattern ((inv@122@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>)))
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r)))
    (=>
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@126@01  $FVF<f>))))
  :qid |qp.fvfDomDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@126@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@122@01 r) xs@72@01) (img@123@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@126@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((x@127@01 $Ref)) (!
  (=>
    (Set_in x@127@01 xs@72@01)
    (and (= (inv@128@01 x@127@01) x@127@01) (img@129@01 x@127@01)))
  :pattern ((Set_in x@127@01 xs@72@01))
  :pattern ((inv@128@01 x@127@01))
  :pattern ((img@129@01 x@127@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@129@01 r) (Set_in (inv@128@01 r) xs@72@01)) (= (inv@128@01 r) r))
  :pattern ((inv@128@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r)))
    (=>
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>))))
  :qid |qp.fvfDomDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@128@01 r) xs@72@01) (img@129@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((x@133@01 $Ref)) (!
  (=>
    (Set_in x@133@01 ys@73@01)
    (and (= (inv@134@01 x@133@01) x@133@01) (img@135@01 x@133@01)))
  :pattern ((Set_in x@133@01 ys@73@01))
  :pattern ((inv@134@01 x@133@01))
  :pattern ((img@135@01 x@133@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@135@01 r) (Set_in (inv@134@01 r) ys@73@01)) (= (inv@134@01 r) r))
  :pattern ((inv@134@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>)))
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r)))
    (=>
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@138@01  $FVF<f>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@138@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@138@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@134@01 r) ys@73@01) (img@135@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@138@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@138@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((x@139@01 $Ref)) (!
  (=>
    (Set_in x@139@01 xs@72@01)
    (and (= (inv@140@01 x@139@01) x@139@01) (img@141@01 x@139@01)))
  :pattern ((Set_in x@139@01 xs@72@01))
  :pattern ((inv@140@01 x@139@01))
  :pattern ((img@141@01 x@139@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@141@01 r) (Set_in (inv@140@01 r) xs@72@01)) (= (inv@140@01 r) r))
  :pattern ((inv@140@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r)))
    (=>
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@144@01  $FVF<f>))))
  :qid |qp.fvfDomDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (and (img@77@01 r) (Set_in (inv@76@01 r) xs@72@01)))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@75@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@75@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@140@01 r) xs@72@01) (img@141@01 r))
      (and (img@81@01 r) (Set_in (inv@80@01 r) ys@73@01)))
    (= ($FVF.lookup_f (as sm@144@01  $FVF<f>) r) ($FVF.lookup_f $t@79@01 r)))
  :pattern (($FVF.lookup_f (as sm@144@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@79@01 r))
  :qid |qp.fvfValDef50|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@114@01 Int)) (!
  (and
    (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01)
    (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@126@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01))
    (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01)
    (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)
    (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
  :pattern ((bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@52@5@53@44-aux|)))
(assert (forall ((j@114@01 Int)) (!
  (and
    (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01)
    (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@126@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01))
    (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01)
    (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)
    (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@52@5@53@44-aux|)))
(assert (forall ((j@114@01 Int)) (!
  (and
    (and
      (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01)
      (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@126@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01)))
    (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
  :pattern ((bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@52@5@53@44_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@114@01 Int)) (!
  (=>
    (and
      (and
        (bar02%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01)
        (bar01%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@126@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01)))
      (foo%precondition ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
    (=
      (bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@126@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01))
      (foo ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01)))
  :pattern ((bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@52@5@53@44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,02s
; (get-info :all-statistics)
(assert (forall ((j@114@01 Int)) (!
  (=
    (bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@126@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@120@01  $FVF<f>)) ys@73@01 j@114@01))
    (foo ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
  :pattern ((bar01 ($SortWrappers.$FVF<f>To$Snap (as sm@144@01  $FVF<f>)) xs@72@01 (bar02 ($SortWrappers.$FVF<f>To$Snap (as sm@138@01  $FVF<f>)) ys@73@01 j@114@01)))
  :pattern ((foo%limited ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>)) xs@72@01 j@114@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@52@5@53@44|)))
(pop) ; 2
(pop) ; 1
; ---------- MatrixMul ----------
(declare-const C@145@01 HeapMatrix)
(declare-const C@146@01 HeapMatrix)
(push) ; 1
(declare-const cell@147@01 $Ref)
(push) ; 2
; [eval] (cell in hm2set(C))
; [eval] hm2set(C)
(assert (Set_in cell@147@01 (hm2set<Set<Ref>> C@146@01)))
(pop) ; 2
(declare-const $t@148@01 $FVF<cell_value>)
(declare-fun inv@149@01 ($Ref) $Ref)
(declare-fun img@150@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((cell1@147@01 $Ref) (cell2@147@01 $Ref)) (!
  (=>
    (and
      (Set_in cell1@147@01 (hm2set<Set<Ref>> C@146@01))
      (Set_in cell2@147@01 (hm2set<Set<Ref>> C@146@01))
      (= cell1@147@01 cell2@147@01))
    (= cell1@147@01 cell2@147@01))
  
  :qid |cell_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((cell@147@01 $Ref)) (!
  (=>
    (Set_in cell@147@01 (hm2set<Set<Ref>> C@146@01))
    (and (= (inv@149@01 cell@147@01) cell@147@01) (img@150@01 cell@147@01)))
  :pattern ((Set_in cell@147@01 (hm2set<Set<Ref>> C@146@01)))
  :pattern ((inv@149@01 cell@147@01))
  :pattern ((img@150@01 cell@147@01))
  :qid |quant-u-136|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
    (= (inv@149@01 r) r))
  :pattern ((inv@149@01 r))
  :qid |cell_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((cell@147@01 $Ref)) (!
  (=>
    (Set_in cell@147@01 (hm2set<Set<Ref>> C@146@01))
    (not (= cell@147@01 $Ref.null)))
  :pattern ((Set_in cell@147@01 (hm2set<Set<Ref>> C@146@01)))
  :pattern ((inv@149@01 cell@147@01))
  :pattern ((img@150@01 cell@147@01))
  :qid |cell_value-permImpliesNonNull|)))
(declare-const sm@151@01 $FVF<cell_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
    (=
      ($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01))
    ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) r) r))
  :pattern ((inv@149@01 r))
  :qid |quant-u-137|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall z: Int :: { get(hm2m(C), z, z) } get(hm2m(C), z, z) == 0)
(declare-const $t@152@01 $Snap)
(assert (= $t@152@01 $Snap.unit))
; [eval] (forall z: Int :: { get(hm2m(C), z, z) } get(hm2m(C), z, z) == 0)
(declare-const z@153@01 Int)
(push) ; 3
; [eval] get(hm2m(C), z, z) == 0
; [eval] get(hm2m(C), z, z)
; [eval] hm2m(C)
(push) ; 4
(declare-const cell@154@01 $Ref)
(push) ; 5
; [eval] (cell in hm2set(hm))
; [eval] hm2set(hm)
(assert (Set_in cell@154@01 (hm2set<Set<Ref>> C@146@01)))
(pop) ; 5
(declare-fun inv@155@01 ($Ref) $Ref)
(declare-fun img@156@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((cell1@154@01 $Ref) (cell2@154@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in cell1@154@01 (hm2set<Set<Ref>> C@146@01))
        ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) cell1@154@01) cell1@154@01))
      (and
        (Set_in cell2@154@01 (hm2set<Set<Ref>> C@146@01))
        ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) cell2@154@01) cell2@154@01))
      (= cell1@154@01 cell2@154@01))
    (= cell1@154@01 cell2@154@01))
  
  :qid |cell_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((cell@154@01 $Ref)) (!
  (=>
    (Set_in cell@154@01 (hm2set<Set<Ref>> C@146@01))
    (and (= (inv@155@01 cell@154@01) cell@154@01) (img@156@01 cell@154@01)))
  :pattern ((Set_in cell@154@01 (hm2set<Set<Ref>> C@146@01)))
  :pattern ((inv@155@01 cell@154@01))
  :pattern ((img@156@01 cell@154@01))
  :qid |cell_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@156@01 r) (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)))
    (= (inv@155@01 r) r))
  :pattern ((inv@155@01 r))
  :qid |cell_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01))
    ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) r) r))
  :pattern ((inv@155@01 r))
  :qid |quant-u-139|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@157@01 ((r $Ref) (z@153@01 Int)) $Perm
  (ite
    (and
      (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01))
      (img@156@01 r)
      (= r (inv@155@01 r)))
    ($Perm.min
      (ite
        (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@157@01 r z@153@01))
    $Perm.No)
  
  :qid |quant-u-141|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01))
      (img@156@01 r)
      (= r (inv@155@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@157@01 r z@153@01)) $Perm.No))
  
  :qid |quant-u-142|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@158@01 $FVF<cell_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>)))
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r)))
    (=>
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r))
      (Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>)))))
  :pattern ((Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>))))
  :qid |qp.fvfDomDef56|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r))
      (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01))))
    (=
      ($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (hm2m%precondition ($SortWrappers.$FVF<cell_value>To$Snap (as sm@158@01  $FVF<cell_value>)) C@146@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((cell@154@01 $Ref)) (!
  (=>
    (Set_in cell@154@01 (hm2set<Set<Ref>> C@146@01))
    (and (= (inv@155@01 cell@154@01) cell@154@01) (img@156@01 cell@154@01)))
  :pattern ((Set_in cell@154@01 (hm2set<Set<Ref>> C@146@01)))
  :pattern ((inv@155@01 cell@154@01))
  :pattern ((img@156@01 cell@154@01))
  :qid |cell_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@156@01 r) (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)))
    (= (inv@155@01 r) r))
  :pattern ((inv@155@01 r))
  :qid |cell_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>)))
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r)))
    (=>
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r))
      (Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>)))))
  :pattern ((Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>))))
  :qid |qp.fvfDomDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r))
      (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01))))
    (=
      ($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01))
      ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) r) r))
    :pattern ((inv@155@01 r))
    :qid |quant-u-139|))
  (hm2m%precondition ($SortWrappers.$FVF<cell_value>To$Snap (as sm@158@01  $FVF<cell_value>)) C@146@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((cell@154@01 $Ref)) (!
  (=>
    (Set_in cell@154@01 (hm2set<Set<Ref>> C@146@01))
    (and (= (inv@155@01 cell@154@01) cell@154@01) (img@156@01 cell@154@01)))
  :pattern ((Set_in cell@154@01 (hm2set<Set<Ref>> C@146@01)))
  :pattern ((inv@155@01 cell@154@01))
  :pattern ((img@156@01 cell@154@01))
  :qid |cell_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@156@01 r) (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)))
    (= (inv@155@01 r) r))
  :pattern ((inv@155@01 r))
  :qid |cell_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>)))
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r)))
    (=>
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r))
      (Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>)))))
  :pattern ((Set_in r ($FVF.domain_cell_value (as sm@158@01  $FVF<cell_value>))))
  :qid |qp.fvfDomDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01)) (img@156@01 r))
      (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01))))
    (=
      ($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@158@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@155@01 r) (hm2set<Set<Ref>> C@146@01))
    ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@151@01  $FVF<cell_value>) r) r))
  :pattern ((inv@155@01 r))
  :qid |quant-u-139|)))
(assert (hm2m%precondition ($SortWrappers.$FVF<cell_value>To$Snap (as sm@158@01  $FVF<cell_value>)) C@146@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@153@01 Int)) (!
  (=
    (get<Int> (hm2m ($SortWrappers.$FVF<cell_value>To$Snap (as sm@158@01  $FVF<cell_value>)) C@146@01) z@153@01 z@153@01)
    0)
  :pattern ((get<Int> (hm2m ($SortWrappers.$FVF<cell_value>To$Snap (as sm@158@01  $FVF<cell_value>)) C@146@01) z@153@01 z@153@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@121@12@121@52|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert (forall z: Int :: { get(hm2m(C), z, z) } get(hm2m(C), z, z) == 0)
; [eval] (forall z: Int :: { get(hm2m(C), z, z) } get(hm2m(C), z, z) == 0)
(declare-const z@159@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] get(hm2m(C), z, z) == 0
; [eval] get(hm2m(C), z, z)
; [eval] hm2m(C)
(push) ; 4
(declare-const cell@160@01 $Ref)
(push) ; 5
; [eval] (cell in hm2set(hm))
; [eval] hm2set(hm)
(assert (Set_in cell@160@01 (hm2set<Set<Ref>> C@146@01)))
(pop) ; 5
(declare-fun inv@161@01 ($Ref) $Ref)
(declare-fun img@162@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@163@01 $FVF<cell_value>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
    (=
      ($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef58|)))
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((cell1@160@01 $Ref) (cell2@160@01 $Ref)) (!
  (=>
    (and
      (and
        (Set_in cell1@160@01 (hm2set<Set<Ref>> C@146@01))
        ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) cell1@160@01) cell1@160@01))
      (and
        (Set_in cell2@160@01 (hm2set<Set<Ref>> C@146@01))
        ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) cell2@160@01) cell2@160@01))
      (= cell1@160@01 cell2@160@01))
    (= cell1@160@01 cell2@160@01))
  
  :qid |cell_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((cell@160@01 $Ref)) (!
  (=>
    (Set_in cell@160@01 (hm2set<Set<Ref>> C@146@01))
    (and (= (inv@161@01 cell@160@01) cell@160@01) (img@162@01 cell@160@01)))
  :pattern ((Set_in cell@160@01 (hm2set<Set<Ref>> C@146@01)))
  :pattern ((inv@161@01 cell@160@01))
  :pattern ((img@162@01 cell@160@01))
  :qid |cell_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@162@01 r) (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)))
    (= (inv@161@01 r) r))
  :pattern ((inv@161@01 r))
  :qid |cell_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01))
    ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r) r))
  :pattern ((inv@161@01 r))
  :qid |quant-u-144|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@164@01 ((r $Ref) (z@159@01 Int)) $Perm
  (ite
    (and
      (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01))
      (img@162@01 r)
      (= r (inv@161@01 r)))
    ($Perm.min
      (ite
        (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@164@01 r z@159@01))
    $Perm.No)
  
  :qid |quant-u-146|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01))
      (img@162@01 r)
      (= r (inv@161@01 r)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r z@159@01)) $Perm.No))
  
  :qid |quant-u-147|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@165@01 $FVF<cell_value>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>)))
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r)))
    (=>
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r))
      (Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>)))))
  :pattern ((Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>))))
  :qid |qp.fvfDomDef61|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r))
      (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01))))
    (=
      ($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (hm2m%precondition ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
    (=
      ($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef58|)))
(assert (forall ((cell@160@01 $Ref)) (!
  (=>
    (Set_in cell@160@01 (hm2set<Set<Ref>> C@146@01))
    (and (= (inv@161@01 cell@160@01) cell@160@01) (img@162@01 cell@160@01)))
  :pattern ((Set_in cell@160@01 (hm2set<Set<Ref>> C@146@01)))
  :pattern ((inv@161@01 cell@160@01))
  :pattern ((img@162@01 cell@160@01))
  :qid |cell_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@162@01 r) (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)))
    (= (inv@161@01 r) r))
  :pattern ((inv@161@01 r))
  :qid |cell_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>)))
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r)))
    (=>
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r))
      (Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>)))))
  :pattern ((Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>))))
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r))
      (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01))))
    (=
      ($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01))
      ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r) r))
    :pattern ((inv@161@01 r))
    :qid |quant-u-144|))
  (hm2m%precondition ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01)))
    (=
      ($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef58|)))
(assert (forall ((cell@160@01 $Ref)) (!
  (=>
    (Set_in cell@160@01 (hm2set<Set<Ref>> C@146@01))
    (and (= (inv@161@01 cell@160@01) cell@160@01) (img@162@01 cell@160@01)))
  :pattern ((Set_in cell@160@01 (hm2set<Set<Ref>> C@146@01)))
  :pattern ((inv@161@01 cell@160@01))
  :pattern ((img@162@01 cell@160@01))
  :qid |cell_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@162@01 r) (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)))
    (= (inv@161@01 r) r))
  :pattern ((inv@161@01 r))
  :qid |cell_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>)))
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r)))
    (=>
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r))
      (Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>)))))
  :pattern ((Set_in r ($FVF.domain_cell_value (as sm@165@01  $FVF<cell_value>))))
  :qid |qp.fvfDomDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01)) (img@162@01 r))
      (and (img@150@01 r) (Set_in (inv@149@01 r) (hm2set<Set<Ref>> C@146@01))))
    (=
      ($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r)
      ($FVF.lookup_cell_value $t@148@01 r)))
  :pattern (($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r))
  :pattern (($FVF.lookup_cell_value $t@148@01 r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value $t@148@01 r) r)
  :pattern (($FVF.lookup_cell_value (as sm@165@01  $FVF<cell_value>) r))
  :qid |qp.fvfResTrgDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@161@01 r) (hm2set<Set<Ref>> C@146@01))
    ($FVF.loc_cell_value ($FVF.lookup_cell_value (as sm@163@01  $FVF<cell_value>) r) r))
  :pattern ((inv@161@01 r))
  :qid |quant-u-144|)))
(assert (hm2m%precondition ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((z@159@01 Int)) (!
  (hm2m%precondition ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01)
  :pattern ((get<Int> (hm2m ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01) z@159@01 z@159@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@122@12@122@52_precondition|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((z@159@01 Int)) (!
  (=>
    (hm2m%precondition ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01)
    (=
      (get<Int> (hm2m ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01) z@159@01 z@159@01)
      0))
  :pattern ((get<Int> (hm2m ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01) z@159@01 z@159@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@122@12@122@52|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((z@159@01 Int)) (!
  (=
    (get<Int> (hm2m ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01) z@159@01 z@159@01)
    0)
  :pattern ((get<Int> (hm2m ($SortWrappers.$FVF<cell_value>To$Snap (as sm@165@01  $FVF<cell_value>)) C@146@01) z@159@01 z@159@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@122@12@122@52|)))
(pop) ; 2
(pop) ; 1
