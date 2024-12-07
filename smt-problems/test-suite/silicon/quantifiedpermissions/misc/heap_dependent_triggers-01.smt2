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
; ---------- FUNCTION bar01----------
(declare-fun xs@0@00 () Set<$Ref>)
(declare-fun i@1@00 () Int)
(declare-fun result@2@00 () Bool)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(declare-const x@17@00 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@17@00 xs@0@00))
(pop) ; 2
(declare-fun inv@18@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@19@00 ($Snap Set<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@17@00 $Ref) (x2@17@00 $Ref)) (!
  (=>
    (and
      (Set_in x1@17@00 xs@0@00)
      (Set_in x2@17@00 xs@0@00)
      (= x1@17@00 x2@17@00))
    (= x1@17@00 x2@17@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@17@00 $Ref)) (!
  (=>
    (Set_in x@17@00 xs@0@00)
    (and
      (= (inv@18@00 s@$ xs@0@00 i@1@00 x@17@00) x@17@00)
      (img@19@00 s@$ xs@0@00 i@1@00 x@17@00)))
  :pattern ((Set_in x@17@00 xs@0@00))
  :pattern ((inv@18@00 s@$ xs@0@00 i@1@00 x@17@00))
  :pattern ((img@19@00 s@$ xs@0@00 i@1@00 x@17@00))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@00 s@$ xs@0@00 i@1@00 r)
      (Set_in (inv@18@00 s@$ xs@0@00 i@1@00 r) xs@0@00))
    (= (inv@18@00 s@$ xs@0@00 i@1@00 r) r))
  :pattern ((inv@18@00 s@$ xs@0@00 i@1@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@17@00 $Ref)) (!
  (=> (Set_in x@17@00 xs@0@00) (not (= x@17@00 $Ref.null)))
  :pattern ((Set_in x@17@00 xs@0@00))
  :pattern ((inv@18@00 s@$ xs@0@00 i@1@00 x@17@00))
  :pattern ((img@19@00 s@$ xs@0@00 i@1@00 x@17@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (i@1@00 Int)) (!
  (= (bar01%limited s@$ xs@0@00 i@1@00) (bar01 s@$ xs@0@00 i@1@00))
  :pattern ((bar01 s@$ xs@0@00 i@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (i@1@00 Int)) (!
  (bar01%stateless xs@0@00 i@1@00)
  :pattern ((bar01%limited s@$ xs@0@00 i@1@00))
  :qid |quant-u-1|)))
; ---------- FUNCTION fun01----------
(declare-fun xs@3@00 () Set<$Ref>)
(declare-fun i@4@00 () Int)
(declare-fun result@5@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const x@20@00 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@20@00 xs@3@00))
(pop) ; 2
(declare-fun inv@21@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@22@00 ($Snap Set<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@20@00 $Ref) (x2@20@00 $Ref)) (!
  (=>
    (and
      (Set_in x1@20@00 xs@3@00)
      (Set_in x2@20@00 xs@3@00)
      (= x1@20@00 x2@20@00))
    (= x1@20@00 x2@20@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@20@00 $Ref)) (!
  (=>
    (Set_in x@20@00 xs@3@00)
    (and
      (= (inv@21@00 s@$ xs@3@00 i@4@00 x@20@00) x@20@00)
      (img@22@00 s@$ xs@3@00 i@4@00 x@20@00)))
  :pattern ((Set_in x@20@00 xs@3@00))
  :pattern ((inv@21@00 s@$ xs@3@00 i@4@00 x@20@00))
  :pattern ((img@22@00 s@$ xs@3@00 i@4@00 x@20@00))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@00 s@$ xs@3@00 i@4@00 r)
      (Set_in (inv@21@00 s@$ xs@3@00 i@4@00 r) xs@3@00))
    (= (inv@21@00 s@$ xs@3@00 i@4@00 r) r))
  :pattern ((inv@21@00 s@$ xs@3@00 i@4@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@20@00 $Ref)) (!
  (=> (Set_in x@20@00 xs@3@00) (not (= x@20@00 $Ref.null)))
  :pattern ((Set_in x@20@00 xs@3@00))
  :pattern ((inv@21@00 s@$ xs@3@00 i@4@00 x@20@00))
  :pattern ((img@22@00 s@$ xs@3@00 i@4@00 x@20@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (i@4@00 Int)) (!
  (= (fun01%limited s@$ xs@3@00 i@4@00) (fun01 s@$ xs@3@00 i@4@00))
  :pattern ((fun01 s@$ xs@3@00 i@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Set<$Ref>) (i@4@00 Int)) (!
  (fun01%stateless xs@3@00 i@4@00)
  :pattern ((fun01%limited s@$ xs@3@00 i@4@00))
  :qid |quant-u-3|)))
; ---------- FUNCTION bar02----------
(declare-fun xs@6@00 () Set<$Ref>)
(declare-fun i@7@00 () Int)
(declare-fun result@8@00 () Int)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const x@23@00 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@23@00 xs@6@00))
(pop) ; 2
(declare-fun inv@24@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@25@00 ($Snap Set<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@23@00 $Ref) (x2@23@00 $Ref)) (!
  (=>
    (and
      (Set_in x1@23@00 xs@6@00)
      (Set_in x2@23@00 xs@6@00)
      (= x1@23@00 x2@23@00))
    (= x1@23@00 x2@23@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@23@00 $Ref)) (!
  (=>
    (Set_in x@23@00 xs@6@00)
    (and
      (= (inv@24@00 s@$ xs@6@00 i@7@00 x@23@00) x@23@00)
      (img@25@00 s@$ xs@6@00 i@7@00 x@23@00)))
  :pattern ((Set_in x@23@00 xs@6@00))
  :pattern ((inv@24@00 s@$ xs@6@00 i@7@00 x@23@00))
  :pattern ((img@25@00 s@$ xs@6@00 i@7@00 x@23@00))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@00 s@$ xs@6@00 i@7@00 r)
      (Set_in (inv@24@00 s@$ xs@6@00 i@7@00 r) xs@6@00))
    (= (inv@24@00 s@$ xs@6@00 i@7@00 r) r))
  :pattern ((inv@24@00 s@$ xs@6@00 i@7@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@23@00 $Ref)) (!
  (=> (Set_in x@23@00 xs@6@00) (not (= x@23@00 $Ref.null)))
  :pattern ((Set_in x@23@00 xs@6@00))
  :pattern ((inv@24@00 s@$ xs@6@00 i@7@00 x@23@00))
  :pattern ((img@25@00 s@$ xs@6@00 i@7@00 x@23@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@6@00 Set<$Ref>) (i@7@00 Int)) (!
  (= (bar02%limited s@$ xs@6@00 i@7@00) (bar02 s@$ xs@6@00 i@7@00))
  :pattern ((bar02 s@$ xs@6@00 i@7@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (xs@6@00 Set<$Ref>) (i@7@00 Int)) (!
  (bar02%stateless xs@6@00 i@7@00)
  :pattern ((bar02%limited s@$ xs@6@00 i@7@00))
  :qid |quant-u-5|)))
; ---------- FUNCTION foo----------
(declare-fun xs@9@00 () Set<$Ref>)
(declare-fun i@10@00 () Int)
(declare-fun result@11@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const x@26@00 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@26@00 xs@9@00))
(pop) ; 2
(declare-fun inv@27@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@28@00 ($Snap Set<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@26@00 $Ref) (x2@26@00 $Ref)) (!
  (=>
    (and
      (Set_in x1@26@00 xs@9@00)
      (Set_in x2@26@00 xs@9@00)
      (= x1@26@00 x2@26@00))
    (= x1@26@00 x2@26@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@26@00 $Ref)) (!
  (=>
    (Set_in x@26@00 xs@9@00)
    (and
      (= (inv@27@00 s@$ xs@9@00 i@10@00 x@26@00) x@26@00)
      (img@28@00 s@$ xs@9@00 i@10@00 x@26@00)))
  :pattern ((Set_in x@26@00 xs@9@00))
  :pattern ((inv@27@00 s@$ xs@9@00 i@10@00 x@26@00))
  :pattern ((img@28@00 s@$ xs@9@00 i@10@00 x@26@00))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@00 s@$ xs@9@00 i@10@00 r)
      (Set_in (inv@27@00 s@$ xs@9@00 i@10@00 r) xs@9@00))
    (= (inv@27@00 s@$ xs@9@00 i@10@00 r) r))
  :pattern ((inv@27@00 s@$ xs@9@00 i@10@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@26@00 $Ref)) (!
  (=> (Set_in x@26@00 xs@9@00) (not (= x@26@00 $Ref.null)))
  :pattern ((Set_in x@26@00 xs@9@00))
  :pattern ((inv@27@00 s@$ xs@9@00 i@10@00 x@26@00))
  :pattern ((img@28@00 s@$ xs@9@00 i@10@00 x@26@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@9@00 Set<$Ref>) (i@10@00 Int)) (!
  (= (foo%limited s@$ xs@9@00 i@10@00) (foo s@$ xs@9@00 i@10@00))
  :pattern ((foo s@$ xs@9@00 i@10@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@9@00 Set<$Ref>) (i@10@00 Int)) (!
  (foo%stateless xs@9@00 i@10@00)
  :pattern ((foo%limited s@$ xs@9@00 i@10@00))
  :qid |quant-u-7|)))
; ---------- FUNCTION fun02----------
(declare-fun xs@12@00 () Set<$Ref>)
(declare-fun i@13@00 () Int)
(declare-fun result@14@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const x@29@00 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@29@00 xs@12@00))
(pop) ; 2
(declare-fun inv@30@00 ($Snap Set<$Ref> Int $Ref) $Ref)
(declare-fun img@31@00 ($Snap Set<$Ref> Int $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@29@00 $Ref) (x2@29@00 $Ref)) (!
  (=>
    (and
      (Set_in x1@29@00 xs@12@00)
      (Set_in x2@29@00 xs@12@00)
      (= x1@29@00 x2@29@00))
    (= x1@29@00 x2@29@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@29@00 $Ref)) (!
  (=>
    (Set_in x@29@00 xs@12@00)
    (and
      (= (inv@30@00 s@$ xs@12@00 i@13@00 x@29@00) x@29@00)
      (img@31@00 s@$ xs@12@00 i@13@00 x@29@00)))
  :pattern ((Set_in x@29@00 xs@12@00))
  :pattern ((inv@30@00 s@$ xs@12@00 i@13@00 x@29@00))
  :pattern ((img@31@00 s@$ xs@12@00 i@13@00 x@29@00))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@00 s@$ xs@12@00 i@13@00 r)
      (Set_in (inv@30@00 s@$ xs@12@00 i@13@00 r) xs@12@00))
    (= (inv@30@00 s@$ xs@12@00 i@13@00 r) r))
  :pattern ((inv@30@00 s@$ xs@12@00 i@13@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@29@00 $Ref)) (!
  (=> (Set_in x@29@00 xs@12@00) (not (= x@29@00 $Ref.null)))
  :pattern ((Set_in x@29@00 xs@12@00))
  :pattern ((inv@30@00 s@$ xs@12@00 i@13@00 x@29@00))
  :pattern ((img@31@00 s@$ xs@12@00 i@13@00 x@29@00))
  :qid |f-permImpliesNonNull|)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@12@00 Set<$Ref>) (i@13@00 Int)) (!
  (= (fun02%limited s@$ xs@12@00 i@13@00) (fun02 s@$ xs@12@00 i@13@00))
  :pattern ((fun02 s@$ xs@12@00 i@13@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Set<$Ref>) (i@13@00 Int)) (!
  (fun02%stateless xs@12@00 i@13@00)
  :pattern ((fun02%limited s@$ xs@12@00 i@13@00))
  :qid |quant-u-9|)))
; ---------- FUNCTION hm2m----------
(declare-fun hm@15@00 () HeapMatrix)
(declare-fun result@16@00 () Matrix)
; ----- Well-definedness of specifications -----
(push) ; 1
(declare-const cell@32@00 $Ref)
(push) ; 2
; [eval] (cell in hm2set(hm))
; [eval] hm2set(hm)
(assert (Set_in cell@32@00 (hm2set<Set<Ref>> hm@15@00)))
(pop) ; 2
(declare-fun inv@33@00 ($Snap HeapMatrix $Ref) $Ref)
(declare-fun img@34@00 ($Snap HeapMatrix $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((cell1@32@00 $Ref) (cell2@32@00 $Ref)) (!
  (=>
    (and
      (Set_in cell1@32@00 (hm2set<Set<Ref>> hm@15@00))
      (Set_in cell2@32@00 (hm2set<Set<Ref>> hm@15@00))
      (= cell1@32@00 cell2@32@00))
    (= cell1@32@00 cell2@32@00))
  
  :qid |cell_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((cell@32@00 $Ref)) (!
  (=>
    (Set_in cell@32@00 (hm2set<Set<Ref>> hm@15@00))
    (and
      (= (inv@33@00 s@$ hm@15@00 cell@32@00) cell@32@00)
      (img@34@00 s@$ hm@15@00 cell@32@00)))
  :pattern ((Set_in cell@32@00 (hm2set<Set<Ref>> hm@15@00)))
  :pattern ((inv@33@00 s@$ hm@15@00 cell@32@00))
  :pattern ((img@34@00 s@$ hm@15@00 cell@32@00))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ hm@15@00 r)
      (Set_in (inv@33@00 s@$ hm@15@00 r) (hm2set<Set<Ref>> hm@15@00)))
    (= (inv@33@00 s@$ hm@15@00 r) r))
  :pattern ((inv@33@00 s@$ hm@15@00 r))
  :qid |cell_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((cell@32@00 $Ref)) (!
  (=>
    (Set_in cell@32@00 (hm2set<Set<Ref>> hm@15@00))
    (not (= cell@32@00 $Ref.null)))
  :pattern ((Set_in cell@32@00 (hm2set<Set<Ref>> hm@15@00)))
  :pattern ((inv@33@00 s@$ hm@15@00 cell@32@00))
  :pattern ((img@34@00 s@$ hm@15@00 cell@32@00))
  :qid |cell_value-permImpliesNonNull|)))
(declare-fun sm@35@00 ($Snap HeapMatrix) $FVF<cell_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ hm@15@00 r)
      (Set_in (inv@33@00 s@$ hm@15@00 r) (hm2set<Set<Ref>> hm@15@00)))
    (=
      ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r)
      ($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r)))
  :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r))
  :pattern (($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r) r)
  :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Set_in (inv@33@00 s@$ hm@15@00 r) (hm2set<Set<Ref>> hm@15@00))
    ($FVF.loc_cell_value ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r) r))
  :pattern ((inv@33@00 s@$ hm@15@00 r))
  :qid |quant-u-24|)))
(declare-const $t@36@00 $Snap)
(assert (= $t@36@00 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { loc(hm, i, j).cell_value } { get(result, i, j) } hm_in_range(hm, i, j) ==> get(result, i, j) == loc(hm, i, j).cell_value)
(declare-const i@37@00 Int)
(declare-const j@38@00 Int)
(push) ; 2
; [eval] hm_in_range(hm, i, j) ==> get(result, i, j) == loc(hm, i, j).cell_value
; [eval] hm_in_range(hm, i, j)
(push) ; 3
; [then-branch: 0 | hm_in_range[Bool](hm@15@00, i@37@00, j@38@00) | live]
; [else-branch: 0 | !(hm_in_range[Bool](hm@15@00, i@37@00, j@38@00)) | live]
(push) ; 4
; [then-branch: 0 | hm_in_range[Bool](hm@15@00, i@37@00, j@38@00)]
(assert (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00))
; [eval] get(result, i, j) == loc(hm, i, j).cell_value
; [eval] get(result, i, j)
; [eval] loc(hm, i, j)
(assert (and
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
    :qid |qp.fvfResTrgDef1|))))
(assert ($FVF.loc_cell_value ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i@37@00 j@38@00)) (loc<Ref> hm@15@00 i@37@00 j@38@00)))
(push) ; 5
(assert (not (and
  (img@34@00 s@$ hm@15@00 (loc<Ref> hm@15@00 i@37@00 j@38@00))
  (Set_in (inv@33@00 s@$ hm@15@00 (loc<Ref> hm@15@00 i@37@00 j@38@00)) (hm2set<Set<Ref>> hm@15@00)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(hm_in_range[Bool](hm@15@00, i@37@00, j@38@00))]
(assert (not (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ hm@15@00 r)
      (Set_in (inv@33@00 s@$ hm@15@00 r) (hm2set<Set<Ref>> hm@15@00)))
    (=
      ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r)
      ($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r)))
  :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r))
  :pattern (($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r) r)
  :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (=>
  (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)
  (and
    (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)
    ($FVF.loc_cell_value ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i@37@00 j@38@00)) (loc<Ref> hm@15@00 i@37@00 j@38@00)))))
; Joined path conditions
(assert (or
  (not (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00))
  (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)))
; Definitional axioms for snapshot map values
(pop) ; 2
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@00 s@$ hm@15@00 r)
      (Set_in (inv@33@00 s@$ hm@15@00 r) (hm2set<Set<Ref>> hm@15@00)))
    (=
      ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r)
      ($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r)))
  :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r))
  :pattern (($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_cell_value ($FVF.lookup_cell_value ($SortWrappers.$SnapTo$FVF<cell_value> s@$) r) r)
  :pattern (($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) r))
  :qid |qp.fvfResTrgDef1|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@37@00 Int) (j@38@00 Int)) (!
  (and
    (=>
      (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)
      (and
        (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)
        ($FVF.loc_cell_value ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i@37@00 j@38@00)) (loc<Ref> hm@15@00 i@37@00 j@38@00))))
    (or
      (not (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00))
      (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)))
  :pattern (($FVF.loc_cell_value ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i@37@00 j@38@00)) (loc<Ref> hm@15@00 i@37@00 j@38@00)))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@112@13@115@84-aux|)))
(assert (forall ((i@37@00 Int) (j@38@00 Int)) (!
  (and
    (=>
      (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)
      (and
        (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)
        ($FVF.loc_cell_value ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i@37@00 j@38@00)) (loc<Ref> hm@15@00 i@37@00 j@38@00))))
    (or
      (not (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00))
      (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)))
  :pattern ((get<Int> result@16@00 i@37@00 j@38@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@112@13@115@84-aux|)))
(assert (forall ((i@37@00 Int) (j@38@00 Int)) (!
  (=>
    (hm_in_range<Bool> hm@15@00 i@37@00 j@38@00)
    (=
      (get<Int> result@16@00 i@37@00 j@38@00)
      ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i@37@00 j@38@00))))
  :pattern (($FVF.loc_cell_value ($FVF.lookup_cell_value (sm@35@00 s@$ hm@15@00) (loc<Ref> hm@15@00 i@37@00 j@38@00)) (loc<Ref> hm@15@00 i@37@00 j@38@00)))
  :pattern ((get<Int> result@16@00 i@37@00 j@38@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/heap_dependent_triggers.vpr@112@13@115@84|)))
(pop) ; 1
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
